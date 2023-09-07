Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F43B796DED
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 02:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B9B10E73F;
	Thu,  7 Sep 2023 00:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916C210E20C;
 Thu,  7 Sep 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694045751; x=1725581751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qWxagddqUY+F+NLz7H/grMc56jMGIzfPhbrF4VWCDTU=;
 b=I9R5iSddYUNzW5+7vMw52o9OxPvVH54LJCjlz/8kpcTR66kXsTgyie2O
 IT0ehT5gOVUiLUdhx8IeRDu0XwqmMLTeDH6lQl2LttdBskcCLB5K2/oUS
 K0QEj1SfVwsStZ9f8Qn4hTLSHl5YyQtKq+WxyO8z+Z3xOJv49CwAcv2rT
 j4wMOFv+Y4zrnx2wruM5iFzPOCPs7Zc5pKpJG4UC71B1trDe8b3w8s3uX
 hYHxJZ2HRkjf3mOqVhRIuAMlfiwL91YinObmqZ50u+35Amuc/3eLnaYB5
 C3k8lewiufEhADKwgqXkaLLSEQ1GZ/D5SBMA5ezRAseByZxz/vXvhnj1m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408226730"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="408226730"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 17:15:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="811895784"
X-IronPort-AV: E=Sophos;i="6.02,233,1688454000"; d="scan'208";a="811895784"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga004.fm.intel.com with ESMTP; 06 Sep 2023 17:15:50 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 3/3] drm/i915/lrc: User PXP contexts requires runalone bit
 in lrc
Date: Wed,  6 Sep 2023 17:15:49 -0700
Message-Id: <20230907001549.81262-4-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
References: <20230907001549.81262-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/gt/intel_lrc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 967fe4d77a87..3df32177e49e 100644
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
+		ctl |= _MASKED_BIT_ENABLE(BIT(7));
 	regs[CTX_CONTEXT_CONTROL] = ctl;
 
 	regs[CTX_TIMESTAMP] = ce->stats.runtime.last;
-- 
2.39.0

