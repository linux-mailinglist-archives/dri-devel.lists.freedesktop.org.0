Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFE56ABF16
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 13:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F7810E2FE;
	Mon,  6 Mar 2023 12:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5973610E2E2;
 Mon,  6 Mar 2023 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678104461; x=1709640461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sW8IhlWIeROU2d4Zt4BL332Myyi+bypEEdT0KX9wnNw=;
 b=cbAEhs/cwleS6kh+5ZCjvS0b0vGR70rrg0y9JE6j7Lij8hCnFbJnu946
 vJ1s52hJg5W9V9WSrhupLNF0d/EJ9HzOZskMfu82HlJzYCNvEEgLYHh5C
 J5kUjoip4/rvVqs0OSypq5JoxlidbVKjHIky1gISpTvx7zVEIPMZdufYO
 0o9jGP0ODkQ86QprUQl8lMWPzYp05n4puoYPuR+THw/+zp2EAsOqrJoJJ
 bB9rjtP5jBjw6pz8k+3pQEXXnoeSqKNgDSPHar2RjXPCs73jdCJWHQXr4
 FJTQ9sKX5J8G13MdiBtEV7d7xwFbg0xHq/McKEOiROsixKU3L+TpL0C4R g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="315196915"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="315196915"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 04:07:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819278240"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="819278240"
Received: from nirmoyda-desk.igk.intel.com ([10.102.42.231])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 04:07:39 -0800
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Add a helper func for gem obj mmap
Date: Mon,  6 Mar 2023 13:07:31 +0100
Message-Id: <20230306120732.28656-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230306120732.28656-1-nirmoy.das@intel.com>
References: <20230306120732.28656-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: andrzej.hajda@intel.com, andi.shyti@intel.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move gem obj mmap code to i915_gem_object_mmap() so that
this can be used by others.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 20 ++---------------
 drivers/gpu/drm/i915/gem/i915_gem_mman.c   | 25 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_mman.h   |  1 +
 3 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index fd556a076d05..831dd8ebf819 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -12,6 +12,7 @@
 #include <asm/smp.h>
 
 #include "gem/i915_gem_dmabuf.h"
+#include "gem/i915_gem_mman.h"
 #include "i915_drv.h"
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
@@ -94,27 +95,10 @@ static void i915_gem_dmabuf_vunmap(struct dma_buf *dma_buf,
 static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 {
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
-	struct drm_i915_private *i915 = to_i915(obj->base.dev);
-	int ret;
 
 	dma_resv_assert_held(dma_buf->resv);
 
-	if (obj->base.size < vma->vm_end - vma->vm_start)
-		return -EINVAL;
-
-	if (HAS_LMEM(i915))
-		return drm_gem_prime_mmap(&obj->base, vma);
-
-	if (!obj->base.filp)
-		return -ENODEV;
-
-	ret = call_mmap(obj->base.filp, vma);
-	if (ret)
-		return ret;
-
-	vma_set_file(vma, obj->base.filp);
-
-	return 0;
+	return i915_gem_object_mmap(obj, vma);
 }
 
 static int i915_gem_begin_cpu_access(struct dma_buf *dma_buf, enum dma_data_direction direction)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 2aac6bf78740..d378720ca626 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -11,6 +11,8 @@
 
 #include <drm/drm_cache.h>
 
+#include "gem/i915_gem_lmem.h"
+
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_requests.h"
 
@@ -1043,6 +1045,29 @@ int i915_gem_mmap(struct file *filp, struct vm_area_struct *vma)
 	return 0;
 }
 
+int i915_gem_object_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct drm_i915_private *i915 = to_i915(obj->base.dev);
+	int ret;
+
+	if (obj->base.size < vma->vm_end - vma->vm_start)
+		return -EINVAL;
+
+	if (HAS_LMEM(i915))
+		return drm_gem_prime_mmap(&obj->base, vma);
+
+	if (obj->base.filp) {
+		ret = call_mmap(obj->base.filp, vma);
+		if (ret)
+			return ret;
+
+		vma_set_file(vma, obj->base.filp);
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/i915_gem_mman.c"
 #endif
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.h b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
index 1fa91b3033b3..303e81ddc5ba 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.h
@@ -30,4 +30,5 @@ void i915_gem_object_release_mmap_gtt(struct drm_i915_gem_object *obj);
 void i915_gem_object_runtime_pm_release_mmap_offset(struct drm_i915_gem_object *obj);
 void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj);
 
+int i915_gem_object_mmap(struct drm_i915_gem_object *obj, struct vm_area_struct *vma);
 #endif
-- 
2.39.0

