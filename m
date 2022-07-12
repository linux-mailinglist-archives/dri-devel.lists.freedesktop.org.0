Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C7D5729FA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE43976CE;
	Tue, 12 Jul 2022 23:31:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B03A976B7;
 Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668698; x=1689204698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ehL0zZkwvXNrmnYBiiPSCHEAsOmycj3lFAbLlsu+t0=;
 b=AiugKUqi56EXYa6CUMMOergOOf5QzrmulH8wctax2m110xJ1odambXhc
 q115gsQNZVDaIj3SPI/fKO8sZLth2CXUfix6cBxdb2FaUbJ0IAGN+eX2U
 qFok5kAKar+YZzfzeELmSy8HPx/Bb/fUTqFDgdwoe+XL0iE4I9j3T/V1d
 j3X/IBVqxVdeJKB/9//JW5OuNoeSe9IlBKcc0w+dZenLZrwh2yE5O7G1W
 3mUxkSqQVH8lw5rutA9A/SGsIBQ7TZL6JWeKzooTf/Mbvv0zzorDWzKFi
 Wk47GAs6DXBBxWbnvXSfcs+AcnZ+YLAXA6HP1bf/4F9DdOc2BUBUxoO4s w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812566"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137773"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 06/12] drm/i915/guc: Use streaming loads to speed up dumping
 the guc log
Date: Tue, 12 Jul 2022 16:31:30 -0700
Message-Id: <20220712233136.1044951-7-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Use a temporary page and mempy_from_wc to reduce the time it takes to
dump the guc log to debugfs.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 24 ++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 45f62cdabe356..ff091adb56096 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -749,8 +749,9 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 	struct intel_guc *guc = log_to_guc(log);
 	struct intel_uc *uc = container_of(guc, struct intel_uc, guc);
 	struct drm_i915_gem_object *obj = NULL;
-	u32 *map;
-	int i = 0;
+	void *map;
+	u32 *page;
+	int i, j;
 
 	if (!intel_guc_is_supported(guc))
 		return -ENODEV;
@@ -763,23 +764,34 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 	if (!obj)
 		return 0;
 
+	page = (u32 *)__get_free_page(GFP_KERNEL);
+	if (!page)
+		return -ENOMEM;
+
 	intel_guc_dump_time_info(guc, p);
 
 	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(map)) {
 		DRM_DEBUG("Failed to pin object\n");
 		drm_puts(p, "(log data unaccessible)\n");
+		free_page((unsigned long)page);
 		return PTR_ERR(map);
 	}
 
-	for (i = 0; i < obj->base.size / sizeof(u32); i += 4)
-		drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
-			   *(map + i), *(map + i + 1),
-			   *(map + i + 2), *(map + i + 3));
+	for (i = 0; i < obj->base.size; i += PAGE_SIZE) {
+		if (!i915_memcpy_from_wc(page, map + i, PAGE_SIZE))
+			memcpy(page, map + i, PAGE_SIZE);
+
+		for (j = 0; j < PAGE_SIZE / sizeof(u32); j += 4)
+			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
+				   *(page + j + 0), *(page + j + 1),
+				   *(page + j + 2), *(page + j + 3));
+	}
 
 	drm_puts(p, "\n");
 
 	i915_gem_object_unpin_map(obj);
+	free_page((unsigned long)page);
 
 	return 0;
 }
-- 
2.36.0

