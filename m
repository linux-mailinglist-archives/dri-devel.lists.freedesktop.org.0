Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965847DA24D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 23:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFB610EA53;
	Fri, 27 Oct 2023 21:18:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216010EA4F;
 Fri, 27 Oct 2023 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698441488; x=1729977488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/GEwZLT1Vy3u3rAGVxCqFBBnqKstJu88hOtfFnitac8=;
 b=eYpY8BkRg2IGEwA7fxmtqLrlVUl/nqlpD6YGrcptzSr/i2zNtX/xQBfa
 OFgIrCqqEUcQtuCj3EQYqpMCFDxu70s/U+DSOcNQCDWJ+16ycPAeRAD7x
 8bADTgmlagBqtsONwMqE2Yp1L8P26UgHMlmb6HiCvKy92/C9XbwzeUJVp
 TjExMSZm+BblFZUpjMKJZEq3Y2ZibBpA5TPGCdVIMXFTgUJV+P88Qswvj
 qy6sOvm+cJTbLjE0ubZRwH1qA9LCFzeu9H4UmwO9ErgtYrMyqQUJdOzfZ
 yqn2kWTu0pblktwZa3AZz7aKwcHPifUnhsZPEkOuMDJmCIzJMXgpwvski Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378219023"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="378219023"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 14:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="7336240"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa001.jf.intel.com with ESMTP; 27 Oct 2023 14:16:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 4/4] drm/i915/mtl: Add module parameter override for
 Wa_16019325821/Wa_14019159160
Date: Fri, 27 Oct 2023 14:18:14 -0700
Message-ID: <20231027211814.2696398-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
References: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

These w/a's can have signficant performance implications for any
workload which uses both RCS and CCS. On the other hand, the hang
itself is only seen in one or two very specific workloads. So add a
module parameter to control whether the w/a's are enabled or not and
default to not.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c            | 3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c        | 3 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
 drivers/gpu/drm/i915/i915_params.c                | 3 +++
 drivers/gpu/drm/i915/i915_params.h                | 1 +
 5 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 6252f32d67011..4c89983b1e907 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -296,7 +296,8 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
+	if (gt->i915->params.enable_mtl_rcs_ccs_wa &&
+	    IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71)))
 		flags |= GUC_WA_RCS_CCS_SWITCHOUT;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 8f7298cbbc322..78757e78bce88 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -845,7 +845,8 @@ static void guc_waklv_init(struct intel_guc *guc)
 	remain = guc_ads_waklv_size(guc);
 
 	/* Wa_14019159160 */
-	if (IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
+	if (gt->i915->params.enable_mtl_rcs_ccs_wa &&
+	    IS_GFX_GT_IP_RANGE(gt, IP_VER(12, 70), IP_VER(12, 71))) {
 		size = guc_waklv_ra_mode(guc, offset, remain);
 		offset += size;
 		remain -= size;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 225812b299524..4de54a100c451 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4384,7 +4384,8 @@ static void guc_default_vfuncs(struct intel_engine_cs *engine)
 
 	/* Wa_16019325821 */
 	/* Wa_14019159160 */
-	if ((engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
+	if (engine->i915->params.enable_mtl_rcs_ccs_wa &&
+	    (engine->class == COMPUTE_CLASS || engine->class == RENDER_CLASS) &&
 	    IS_GFX_GT_IP_RANGE(engine->gt, IP_VER(12, 70), IP_VER(12, 71)))
 		engine->flags |= I915_ENGINE_USES_WA_HOLD_SWITCHOUT;
 
diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
index de43048543e8b..1004171d99943 100644
--- a/drivers/gpu/drm/i915/i915_params.c
+++ b/drivers/gpu/drm/i915/i915_params.c
@@ -134,6 +134,9 @@ i915_param_named_unsafe(lmem_size, uint, 0400,
 i915_param_named_unsafe(lmem_bar_size, uint, 0400,
 			"Set the lmem bar size(in MiB).");
 
+i915_param_named(enable_mtl_rcs_ccs_wa, bool, 0400,
+	"Enable the RCS/CCS switchout hold workaround for MTL (only some workloads are affected by issue and w/a has a performance penalty) (default:false)");
+
 static void _param_print_bool(struct drm_printer *p, const char *name,
 			      bool val)
 {
diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
index 1315d7fac850f..971a765d74f56 100644
--- a/drivers/gpu/drm/i915/i915_params.h
+++ b/drivers/gpu/drm/i915/i915_params.h
@@ -62,6 +62,7 @@ struct drm_printer;
 	param(unsigned int, lmem_size, 0, 0400) \
 	param(unsigned int, lmem_bar_size, 0, 0400) \
 	/* leave bools at the end to not create holes */ \
+	param(bool, enable_mtl_rcs_ccs_wa, false, 0x400) \
 	param(bool, enable_hangcheck, true, 0600) \
 	param(bool, error_capture, true, IS_ENABLED(CONFIG_DRM_I915_CAPTURE_ERROR) ? 0600 : 0) \
 	param(bool, enable_gvt, false, IS_ENABLED(CONFIG_DRM_I915_GVT) ? 0400 : 0)
-- 
2.41.0

