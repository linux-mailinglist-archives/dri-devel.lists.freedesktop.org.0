Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D73B9768
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F09A6EC02;
	Thu,  1 Jul 2021 20:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C52436EBA7;
 Thu,  1 Jul 2021 20:25:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998661"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998661"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564489"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 30/53] drm/i915/dg2: Maintain backward-compatible nested batch
 behavior
Date: Thu,  1 Jul 2021 13:24:04 -0700
Message-Id: <20210701202427.1547543-31-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For tgl+, the per-context setting of MI_MODE[12] determines whether
the bits of a nested MI_BATCH_BUFFER_START instruction should be
interpreted in the traditional manner or whether they should
instead use a new tgl+ meaning that breaks backward compatibility, but
allows nesting into 3rd-level batchbuffers.  For previous platforms,
the hardware default for this register bit is to maintain
backward-compatible behavior unless a context intentionally opts into
the new behavior; however Xe_HPG flips the hardware default behavior.

From a SW perspective, we want to maintain the backward-compatible
behavior for userspace, so we'll apply a fake workaround to set it back
to the legacy behavior on platforms where the hardware default is to
break compatibility.  At the moment there is no Linux userspace that
utilizes third-level batchbuffers, so this will avoid userspace from
needing to make any changes.  using the legacy meaning is the correct
thing to do.  If/when we have userspace consumers that want to utilize
third-level batch nesting, we can provide a context parameter to allow
them to opt-in.

Bspec: 45974, 45718
Cc: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 39 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h             |  1 +
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index f97ff2848122..43db766b0672 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -686,6 +686,37 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
 		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
 }
 
+static void fakewa_disable_nestedbb_mode(struct intel_engine_cs *engine,
+					 struct i915_wa_list *wal)
+{
+	/*
+	 * This is a "fake" workaround defined by software to ensure we
+	 * maintain reliable, backward-compatible behavior for userspace with
+	 * regards to how nested MI_BATCH_BUFFER_START commands are handled.
+	 *
+	 * The per-context setting of MI_MODE[12] determines whether the bits
+	 * of a nested MI_BATCH_BUFFER_START instruction should be interpreted
+	 * in the traditional manner or whether they should instead use a new
+	 * tgl+ meaning that breaks backward compatibility, but allows nesting
+	 * into 3rd-level batchbuffers.  When this new capability was first
+	 * added in TGL, it remained off by default unless a context
+	 * intentionally opted in to the new behavior.  However Xe_HPG now
+	 * flips this on by default and requires that we explicitly opt out if
+	 * we don't want the new behavior.
+	 *
+	 * From a SW perspective, we want to maintain the backward-compatible
+	 * behavior for userspace, so we'll apply a fake workaround to set it
+	 * back to the legacy behavior on platforms where the hardware default
+	 * is to break compatibility.  At the moment there is no Linux
+	 * userspace that utilizes third-level batchbuffers, so this will avoid
+	 * userspace from needing to make any changes.  using the legacy
+	 * meaning is the correct thing to do.  If/when we have userspace
+	 * consumers that want to utilize third-level batch nesting, we can
+	 * provide a context parameter to allow them to opt-in.
+	 */
+	wa_masked_dis(wal, RING_MI_MODE(engine->mmio_base), TGL_NESTED_BB_EN);
+}
+
 static void
 __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
 			   struct i915_wa_list *wal,
@@ -693,11 +724,15 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
 {
 	struct drm_i915_private *i915 = engine->i915;
 
+	wa_init_start(wal, name, engine->name);
+
+	/* Applies to all engines */
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55))
+		fakewa_disable_nestedbb_mode(engine, wal);
+
 	if (engine->class != RENDER_CLASS)
 		return;
 
-	wa_init_start(wal, name, engine->name);
-
 	if (IS_DG1(i915))
 		dg1_ctx_workarounds_init(engine, wal);
 	else if (GRAPHICS_VER(i915) == 12)
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index b19d102e0a01..35a42df1f2aa 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2821,6 +2821,7 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define MI_MODE		_MMIO(0x209c)
 # define VS_TIMER_DISPATCH				(1 << 6)
 # define MI_FLUSH_ENABLE				(1 << 12)
+# define TGL_NESTED_BB_EN				(1 << 12)
 # define ASYNC_FLIP_PERF_DISABLE			(1 << 14)
 # define MODE_IDLE					(1 << 9)
 # define STOP_RING					(1 << 8)
-- 
2.25.4

