Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF685836C9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9B10F6EB;
	Thu, 28 Jul 2022 02:21:23 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D29ED10F6EB;
 Thu, 28 Jul 2022 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658974833; x=1690510833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L2O5TerfJNHOupOFnud8oQ6b6cGlX0VWlikKFRoxaz4=;
 b=jEe7O/MO3esIG2HarMFS+QZHyMsFpbW3ioHKiewP/Uw30W2HbwwZH5hx
 LWahrIcOT28D+xAnioFC0IK6uTh1ICYrsuXyTOTk3+EcHWJFYDTuScmvM
 razYOALdfTL21Vrqx4t45Vnuru0G9FFVDZ7f5HQwjajU2RTN7nEuX6g3H
 fT/MsjNYlbM2teDOVMs2I+N0ZRzB4zFbxLbGOSDAj7Bzicmnb1047Zyo8
 9lEB1P9nAoswqlgVfbfWXGDkaaBnKTPPBI5b61LRqJP+k4+q/3r9Ej7BK
 Uqv7xtOQHd0NX6FKQC/faRn9wONbuqis1C2s41HM5rI80Y6xqj+gi1222 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285947586"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285947586"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="600648474"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2022 19:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/7] drm/i915/guc: Use streaming loads to speed up dumping the
 guc log
Date: Wed, 27 Jul 2022 19:20:26 -0700
Message-Id: <20220728022028.2190627-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Use a temporary page and mempy_from_wc to reduce the time it takes to
dump the guc log to debugfs.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 24 ++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 07d31ae32f765..4722d4b18ed19 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -750,8 +750,9 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
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
@@ -764,23 +765,34 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
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
2.37.1

