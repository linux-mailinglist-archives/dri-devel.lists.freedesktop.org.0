Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84084876BB3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 21:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515E113303;
	Fri,  8 Mar 2024 20:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mda5tiH4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4084113303;
 Fri,  8 Mar 2024 20:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709929374; x=1741465374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpO9m7r2BMvtlKA15EVurq2IqdWlrsb7iLxvRUGVJx8=;
 b=mda5tiH47mNTXFZ+lwzowDwlHqH5m/n/ETPWC7WAVR1BnKcJzqOZIwCA
 K2Ou2u+oco8Ka6sK2e+spq4eMxnWlxoYPSPpq+fOuuqxZSUDIZIdQ3WG6
 0yfnfvu5fV7DrLY9HSQul7Ixw9noSJ6pRWmsuq0+gRnBFyTTHQdNfe0fm
 YlUlBH9Inhbl65Pm4AKeAMN6wj0TXB6g+CXlPClXDPS3o29nFUs4I7BJQ
 GraI8/p+ym5yu9yoCTMF83vY1WvYMNVdQyDBIRjCXFp4oxjhIlVgOz36v
 +k9yMnPHB8/5XKDUqvnTbXssac75L/rCMwl1cKHQYkg1dVeryLkE9GSMg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="22120721"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="22120721"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 12:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="41503877"
Received: from unknown (HELO intel.com) ([10.247.118.109])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 12:22:45 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH v5 1/4] drm/i915/gt: Disable HW load balancing for CCS
Date: Fri,  8 Mar 2024 21:22:16 +0100
Message-ID: <20240308202223.406384-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240308202223.406384-1-andi.shyti@linux.intel.com>
References: <20240308202223.406384-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The hardware should not dynamically balance the load between CCS
engines. Wa_14019159160 recommends disabling it across all
platforms.

Fixes: d2eae8e98d59 ("drm/i915/dg2: Drop force_probe requirement")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 23 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 50962cfd1353..cf709f6c05ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1478,6 +1478,7 @@
 
 #define GEN12_RCU_MODE				_MMIO(0x14800)
 #define   GEN12_RCU_MODE_CCS_ENABLE		REG_BIT(0)
+#define   XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE	REG_BIT(1)
 
 #define CHV_FUSE_GT				_MMIO(VLV_GUNIT_BASE + 0x2168)
 #define   CHV_FGT_DISABLE_SS0			(1 << 10)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 25413809b9dc..4865eb5ca9c9 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -51,7 +51,8 @@
  *   registers belonging to BCS, VCS or VECS should be implemented in
  *   xcs_engine_wa_init(). Workarounds for registers not belonging to a specific
  *   engine's MMIO range but that are part of of the common RCS/CCS reset domain
- *   should be implemented in general_render_compute_wa_init().
+ *   should be implemented in general_render_compute_wa_init(). The settings
+ *   about the CCS load balancing should be added in ccs_engine_wa_mode().
  *
  * - GT workarounds: the list of these WAs is applied whenever these registers
  *   revert to their default values: on GPU reset, suspend/resume [1]_, etc.
@@ -2854,6 +2855,22 @@ add_render_compute_tuning_settings(struct intel_gt *gt,
 		wa_write_clr(wal, GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC);
 }
 
+static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_list *wal)
+{
+	struct intel_gt *gt = engine->gt;
+
+	if (!IS_DG2(gt->i915))
+		return;
+
+	/*
+	 * Wa_14019159160: This workaround, along with others, leads to
+	 * significant challenges in utilizing load balancing among the
+	 * CCS slices. Consequently, an architectural decision has been
+	 * made to completely disable automatic CCS load balancing.
+	 */
+	wa_masked_en(wal, GEN12_RCU_MODE, XEHP_RCU_MODE_FIXED_SLICE_CCS_MODE);
+}
+
 /*
  * The workarounds in this function apply to shared registers in
  * the general render reset domain that aren't tied to a
@@ -3004,8 +3021,10 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
 	 * to a single RCS/CCS engine's workaround list since
 	 * they're reset as part of the general render domain reset.
 	 */
-	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
+	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
 		general_render_compute_wa_init(engine, wal);
+		ccs_engine_wa_mode(engine, wal);
+	}
 
 	if (engine->class == COMPUTE_CLASS)
 		ccs_engine_wa_init(engine, wal);
-- 
2.43.0

