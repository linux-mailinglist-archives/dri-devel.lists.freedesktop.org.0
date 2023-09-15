Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017D7A25BE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0F510E66C;
	Fri, 15 Sep 2023 18:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6601410E66B;
 Fri, 15 Sep 2023 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694802654; x=1726338654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=muW+YPLpDWw2JGWgI/7fLzSR/aoqenIXx4FJB/YPGhg=;
 b=RlIjtASDrXVhU5oxJzAMJe4kR9daa/w9xD8hFcx1oXlX/T0dLmmWPANL
 +WgNfUPh4QSwsR96Nlf9V5pmCpa3Ps1dszA7IG5L/2XzJchJ6K8X5zDIz
 2nS1SzrdnrUmdgApzFPpFPsMgRXjR7Ywc4VVosguurKFgTZgqCiLHMpsN
 pyOpUXBLIgHQbWhp1vBZ5SCHakdmqYD93d44wx2DGa2wJpsNhh6v0oG6k
 eyauf/aPlfgqdyPqm1t4MrjO9kRlaUj8XARsZMawBTyVr8Iqn9DSnjC02
 QTZnYbc0CR9lQWVOvMNDWzXV26s8hv5Wy7mr4pgaUciqvusuqI1eSjZMB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445789295"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445789295"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="991949766"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="991949766"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2023 11:30:53 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 3/3] drm/i915/lrc: User PXP contexts requires runalone bit
 in lrc
Date: Fri, 15 Sep 2023 11:30:51 -0700
Message-Id: <20230915183051.1232026-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230915183051.1232026-1-alan.previn.teres.alexis@intel.com>
References: <20230915183051.1232026-1-alan.previn.teres.alexis@intel.com>
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
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Meteorlake onwards, HW specs require that all user contexts that
run on render or compute engines and require PXP must enforce
run-alone bit in lrc. Add this enforcement for protected contexts.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_regs.h |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c         | 23 +++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_regs.h b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
index 6b9d9f837669..fdd4ddd3a978 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_regs.h
@@ -177,6 +177,7 @@
 #define   CTX_CTRL_RS_CTX_ENABLE		REG_BIT(1)
 #define	  CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT	REG_BIT(2)
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
+#define	  GEN12_CTX_CTRL_RUNALONE_MODE		REG_BIT(7)
 #define	  GEN12_CTX_CTRL_OAR_CONTEXT_ENABLE	REG_BIT(8)
 #define RING_CTX_SR_CTL(base)			_MMIO((base) + 0x244)
 #define RING_SEMA_WAIT_POLL(base)		_MMIO((base) + 0x24c)
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 147b6f44ad56..eaf66d903166 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -845,6 +845,27 @@ lrc_setup_indirect_ctx(u32 *regs,
 		lrc_ring_indirect_offset_default(engine) << 6;
 }
 
+static bool ctx_needs_runalone(const struct intel_context *ce)
+{
+	struct i915_gem_context *gem_ctx;
+	bool ctx_is_protected = false;
+
+	/*
+	 * On MTL and newer platforms, protected contexts require setting
+	 * the LRC run-alone bit or else the encryption will not happen.
+	 */
+	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
+	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
+		rcu_read_lock();
+		gem_ctx = rcu_dereference(ce->gem_context);
+		if (gem_ctx)
+			ctx_is_protected = gem_ctx->uses_protected_content;
+		rcu_read_unlock();
+	}
+
+	return ctx_is_protected;
+}
+
 static void init_common_regs(u32 * const regs,
 			     const struct intel_context *ce,
 			     const struct intel_engine_cs *engine,
@@ -860,6 +881,8 @@ static void init_common_regs(u32 * const regs,
 	if (GRAPHICS_VER(engine->i915) < 11)
 		ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT |
 					   CTX_CTRL_RS_CTX_ENABLE);
+	if (ctx_needs_runalone(ce))
+		ctl |= _MASKED_BIT_ENABLE(GEN12_CTX_CTRL_RUNALONE_MODE);
 	regs[CTX_CONTEXT_CONTROL] = ctl;
 
 	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;
-- 
2.39.0

