Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D477786A0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 06:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A794C10E648;
	Fri, 11 Aug 2023 04:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C396A10E63F;
 Fri, 11 Aug 2023 04:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691728992; x=1723264992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pgHj6dnivvbPfZkEjEXKTLHpXx6pnIn4NazSOuGBqFs=;
 b=AdtsaaXAnmOqz0VgODkwmd+9ZDCSB0CbWxffGzm5RdcaA2u69/wxDaBJ
 NQfWuvueRSMwDgvr11jeQRZiQt2yXcqMNEHPJCEGyBfsgGrMrpH9+u244
 msDtnD6jbY1queGmFM3KOMID+Ezs/KKcDE7RzEomEWYe2Z7ygp0qK32CP
 IXCQMbmEiW8C5QiLwB0vHG2OwPWRKQdOgW+GNLxmUZn/ivqNZUsAyzdGF
 c03HcCxWrMWDSUe4BnQBh54Y3XOKUDsZrXlKIPaZfkNAztLrvaosDXKyC
 13wV3zFWhYAB2V+V1WNJmVZiEs0uQnfEy0MDoYfJtyZ5V0XMRaU//Aupz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351197203"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="351197203"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 21:43:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="802533480"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="802533480"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 10 Aug 2023 21:43:12 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/i915/gt/pxp: User PXP contexts requires runalone
 bit in lrc
Date: Thu, 10 Aug 2023 21:43:10 -0700
Message-Id: <20230811044310.944883-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230811044310.944883-1-alan.previn.teres.alexis@intel.com>
References: <20230811044310.944883-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_lrc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 957d0aeb0c02..2dfa49a04172 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -845,6 +845,16 @@ lrc_setup_indirect_ctx(u32 *regs,
 		lrc_ring_indirect_offset_default(engine) << 6;
 }
 
+static bool ctx_needs_runalone(const struct intel_context *ce)
+{
+	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
+	    ce->gem_context && ce->gem_context->uses_protected_content &&
+	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS))
+		return true;
+
+	return false;
+}
+
 static void init_common_regs(u32 * const regs,
 			     const struct intel_context *ce,
 			     const struct intel_engine_cs *engine,
@@ -860,6 +870,8 @@ static void init_common_regs(u32 * const regs,
 	if (GRAPHICS_VER(engine->i915) < 11)
 		ctl |= _MASKED_BIT_DISABLE(CTX_CTRL_ENGINE_CTX_SAVE_INHIBIT |
 					   CTX_CTRL_RS_CTX_ENABLE);
+	if (ctx_needs_runalone(ce))
+		ctl |= _MASKED_BIT_ENABLE(BIT(7));
 	regs[CTX_CONTEXT_CONTROL] = ctl;
 
 	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;
-- 
2.39.0

