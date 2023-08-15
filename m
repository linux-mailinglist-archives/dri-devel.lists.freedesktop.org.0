Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FD877D417
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 22:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC92410E29D;
	Tue, 15 Aug 2023 20:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1E510E290;
 Tue, 15 Aug 2023 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692131360; x=1723667360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLdyOjhxpusANwEm6fb+p8Gj+tASUfKq41PxBywYiwE=;
 b=Tix5x2mIsCiS6Jb7wOEnj27h6UotisjerAz/QbrDNK8io+vNA1C4eeCr
 MnZaWcJ4Ol6jdd64hjoEUUBXdr0PSpHKiTTL39NYTJiebFXY7csugVwMb
 x4q7c2eXmjT8maBF4SSPFHO8zzyWK52W+XxBWh+XRLPumvxIXpL6X2Nk7
 aMvd2Kx2ghg51Yr1oMT70xLXKMu7bIoRbqxQSsCZMFyoWchUJBYhxnegm
 ZPXz6xiK5VbiWA/ZEj+IGLD29GRX9ySQN32s9/8lvz6Da2TKPHCZxK6d+
 G3eQrcD5GciqpOW1YlxepXAjij7/+CA9SUhsr+z7yfPS8N8TAK6Xlti9J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372366877"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="372366877"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 13:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907746500"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="907746500"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 15 Aug 2023 13:29:18 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm/i915/gt/pxp: User PXP contexts requires runalone
 bit in lrc
Date: Tue, 15 Aug 2023 13:29:16 -0700
Message-Id: <20230815202916.1211768-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
References: <20230815202916.1211768-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Meteorlake onwards, HW specs require that all user contexts that
run on render or compute engines and require PXP must enforce
run-alone bit in lrc. Add this enforcement for protected contexts.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 957d0aeb0c02..c7cab1c727ac 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -845,6 +845,29 @@ lrc_setup_indirect_ctx(u32 *regs,
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
+		if (ctx_is_protected)
+			return true;
+	}
+
+	return false;
+}
+
 static void init_common_regs(u32 * const regs,
 			     const struct intel_context *ce,
 			     const struct intel_engine_cs *engine,
@@ -860,6 +883,8 @@ static void init_common_regs(u32 * const regs,
 	if (GRAPHICS_VER(engine->i915) < 11)
 		ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT |
 					   CTX_CTRL_RS_CTX_ENABLE);
+	if (ctx_needs_runalone(ce))
+		ctl |= _MASKED_BIT_ENABLE(BIT(7));
 	regs[CTX_CONTEXT_CONTROL] = ctl;
 
 	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;
-- 
2.39.0

