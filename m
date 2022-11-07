Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B278261ED88
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 09:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF76A10E259;
	Mon,  7 Nov 2022 08:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3505D10E248;
 Mon,  7 Nov 2022 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811146; x=1699347146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2wRy8M6IR49u3b/Q322bVaD0wFxFsFiPobbKt9sA9Lk=;
 b=SBV3/ikZS1mwRzZXb34gLcO1jf2acriem5CopFJnt+/KpmC/07OORR+8
 LR9I6LjJkN1zFNd0Me4laSSsd4EZEIL8G2RqNgWNqHI31U0De75kquSO2
 IK6QPi+m7+nXUVq4O2v3q6DLSpcx0UZPJ0gcDBEWL9VBNT6PRm1bYtDIY
 kOoka3ypmX/ZnTu9nITxH/5ttz6ZIC4ke3dTC/EPwWiyq7LBunsghKR07
 twIhk/gVB0JJZMkuG9NuURcf4UPkZzxC6vsILalSTkryN7BlUNeHq/gVM
 c7hOjEYBAjVYy95WdxFX4XL6xkITSUmb+GP+XiZsbanOo4OR+WBI+lib4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="312126167"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="312126167"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="880984615"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="880984615"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:52:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 03/20] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Date: Mon,  7 Nov 2022 00:51:53 -0800
Message-Id: <20221107085210.17221-4-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
In-Reply-To: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
References: <20221107085210.17221-1-niranjana.vishwanathapura@intel.com>
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_create.c | 18 +++++++++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index 33673fe7ee0a..5c6e396ab74d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -15,10 +15,18 @@
 #include "i915_trace.h"
 #include "i915_user_extensions.h"
 
-static u32 object_max_page_size(struct intel_memory_region **placements,
-				unsigned int n_placements)
+/**
+ * i915_gem_object_max_page_size() - max of min_page_size of the regions
+ * @placements:  list of regions
+ * @n_placements: number of the placements
+ *
+ * Returns the largest of min_page_size of the @placements,
+ * or I915_GTT_PAGE_SIZE_4K if @n_placements is 0.
+ */
+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
+				  unsigned int n_placements)
 {
-	u32 max_page_size = 0;
+	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
 	int i;
 
 	for (i = 0; i < n_placements; i++) {
@@ -28,7 +36,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
 		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
 	}
 
-	GEM_BUG_ON(!max_page_size);
 	return max_page_size;
 }
 
@@ -99,7 +106,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
 
 	i915_gem_flush_free_objects(i915);
 
-	size = round_up(size, object_max_page_size(placements, n_placements));
+	size = round_up(size, i915_gem_object_max_page_size(placements,
+							    n_placements));
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 6b9ecff42bb5..db3dd0e285c5 100644
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

