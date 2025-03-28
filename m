Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1CEA7518A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 21:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5008F10EACA;
	Fri, 28 Mar 2025 20:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBh/5cNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E170510E160;
 Fri, 28 Mar 2025 20:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743194447; x=1774730447;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YEesjC2DjJ+uRgIl7+sho86AEMyaLZiSG9h7SS+XtPk=;
 b=jBh/5cNdGCaT1ksvKB653GfSoYzDWrj5be6FnNsCl58jvQxVfaXqcBQC
 uMJT03q0d2rI9I11wALrWQAs5QlmBXAtmfdI+tUm/K7dEjINCx2wDy8x6
 3FTY7AChW9v09jibokoFBboytfjqS9NyPs7azBFry++MZvs3kfjAf7pkm
 0zmb5mIfErrlIuSKKe9v+mmcyyKQwk8s0C8eNeSE/GtgDXcAcNGG1xvpP
 hQFZfcBro1lhJCd0jzBcfF4FoISoOn17rzYe+FDATePBFAddeGcc2cJYk
 saOwJRjHz40ZNoTfSTgQm+fqDY0/gg8Zp1bQsXROS9b6/M7BxEP8HOaKe g==;
X-CSE-ConnectionGUID: HAFW3iwHRO2w72J3foA+YA==
X-CSE-MsgGUID: lQI68uB4ToSs/7K0GG4Ckw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55230026"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55230026"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:40:46 -0700
X-CSE-ConnectionGUID: Mvq2kVnbSWGz8v/1DE5SIg==
X-CSE-MsgGUID: vtmFJAIERn2qr+y+AScZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="129673610"
Received: from dut4086lnl.fm.intel.com ([10.105.10.92])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 13:40:47 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com
Subject: [PATCH v15 1/6] drm/xe/xe_hw_engine: Map xe and user engine class in
 header
Date: Fri, 28 Mar 2025 20:40:38 +0000
Message-ID: <20250328204045.157914-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328204045.157914-1-jonathan.cavitt@intel.com>
References: <20250328204045.157914-1-jonathan.cavitt@intel.com>
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

Move the helper arrays xe_to_user_engine_class and
user_to_xe_engine_class to xe_hw_engine_types.h, making them available
to more of the xe kernel.  This is done for user_to_xe_engine_class to
reduce duplication, and xe_to_user_engine_class can and will be used in
more than one place in the future.

v2:
- Remove unnecessary includes (jcavitt)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/xe/xe_hw_engine.c       | 24 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 +++
 drivers/gpu/drm/xe/xe_query.c           | 18 +-----------------
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 8c05fd30b7df..c742f5953e8b 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -272,6 +272,22 @@ static const struct engine_info engine_infos[] = {
 	},
 };
 
+const u16 xe_to_user_engine_class[] = {
+	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
+	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
+	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
+};
+
+const enum xe_engine_class user_to_xe_engine_class[] = {
+	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
+	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
+	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
+	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
+	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
+};
+
 static void hw_engine_fini(void *arg)
 {
 	struct xe_hw_engine *hwe = arg;
@@ -1022,14 +1038,6 @@ enum xe_force_wake_domains xe_hw_engine_to_fw_domain(struct xe_hw_engine *hwe)
 	return engine_infos[hwe->engine_id].domain;
 }
 
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
 /**
  * xe_hw_engine_lookup() - Lookup hardware engine for class:instance
  * @xe: xe device
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index e4191a7a2c31..584ce915e5f0 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -21,6 +21,9 @@ enum xe_engine_class {
 	XE_ENGINE_CLASS_MAX = 6,
 };
 
+extern const u16 xe_to_user_engine_class[];
+extern const enum xe_engine_class user_to_xe_engine_class[];
+
 enum xe_hw_engine_id {
 	XE_HW_ENGINE_RCS0,
 #define XE_HW_ENGINE_RCS_MASK	GENMASK_ULL(XE_HW_ENGINE_RCS0, XE_HW_ENGINE_RCS0)
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 2dbf4066d86f..7f7f1071f6eb 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -29,22 +29,6 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
 
-static const u16 xe_to_user_engine_class[] = {
-	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
-	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
-	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
-};
-
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
 static size_t calc_hw_engine_info_size(struct xe_device *xe)
 {
 	struct xe_hw_engine *hwe;
@@ -148,7 +132,7 @@ query_engine_cycles(struct xe_device *xe,
 	if (!gt)
 		return -EINVAL;
 
-	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
+	if (eci->engine_class >= XE_ENGINE_CLASS_MAX)
 		return -EINVAL;
 
 	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
-- 
2.43.0

