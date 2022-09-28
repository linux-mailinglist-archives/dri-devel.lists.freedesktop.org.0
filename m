Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5635ED4A7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 08:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F1710E278;
	Wed, 28 Sep 2022 06:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470D710E26F;
 Wed, 28 Sep 2022 06:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664345988; x=1695881988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QqEaa7ASIJQYcjRLArfeknCIzE1yGhP2gL1vOUTp3iQ=;
 b=VlCCrhnPu4lwyLJpgQfU/Wtxee/7fm9jimV8/VkkWoJ/lYuFVcCKy7Fk
 iDrrHMHx4zmI0Uw1nclWNfS7IZWy3eJDpTSa0ZGKx7ijRJHvuc/F+XSct
 rdurztxxVi6cgcuYIkj4IhjH1Hxi/5BuJhaznEIhlBDbnWi8q5CMNh5uS
 ekrtM2Hf8yptVSIyYjCOTOHYPnP6NIiVTAjR+kHRew6VVQqf1/5upBQ1r
 6muPcIUitb1gDeqO7iDsIgZI3x6g3fFvQvy2e4VCFqOlHrL44GNvHuQAg
 Dn6MXeBkywBsTkNHMSenGCahWyK5b1mJZVk/PKjUG7SrIUS6gI9LSDv// A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="301494322"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="301494322"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2022 23:19:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10483"; a="866849183"
X-IronPort-AV: E=Sophos;i="5.93,351,1654585200"; d="scan'208";a="866849183"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 27 Sep 2022 23:19:46 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/16] drm/i915/vm_bind: Expose i915_gem_object_max_page_size()
Date: Tue, 27 Sep 2022 23:19:05 -0700
Message-Id: <20220928061918.6340-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, matthew.auld@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose i915_gem_object_max_page_size() function non-static
which will be used by the vm_bind feature.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 19 ++++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 33673fe7ee0a..4aa7b5582b8e 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -15,10 +15,19 @@
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
-static u32 object_max_page_size(struct intel_memory_region **placements,
-				unsigned int n_placements)
+/**
+ * i915_gem_object_max_page_size() - max of min_page_size of the regions
+ * @placements:  list of regions
+ * @n_placements: number of the placements
+ *
+ * Calculates the max of the min_page_size of a list of placements passed in.
+ *
+ * Return: max of the min_page_size
+ */
+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
+				  unsigned int n_placements)
 {
-	u32 max_page_size = 0;
+	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
 	int i;
 
 	for (i = 0; i < n_placements; i++) {
@@ -28,7 +37,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
 		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
 	}
 
-	GEM_BUG_ON(!max_page_size);
 	return max_page_size;
 }
 
@@ -99,7 +107,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
 
 	i915_gem_flush_free_objects(i915);
 
-	size = round_up(size, object_max_page_size(placements, n_placements));
+	size = round_up(size, i915_gem_object_max_page_size(placements,
+							    n_placements));
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index a3b7551a57fc..d53d01b1860a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
 }
 
 void i915_gem_init__objects(struct drm_i915_private *i915);
+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
+				  unsigned int n_placements);
 
 void i915_objects_module_exit(void);
 int i915_objects_module_init(void);
-- 
2.21.0.rc0.32.g243a4c7e27

