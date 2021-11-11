Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B9A44D256
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 08:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34956E942;
	Thu, 11 Nov 2021 07:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E400F6E8B6;
 Thu, 11 Nov 2021 07:15:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10164"; a="212896386"
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="212896386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:20 -0800
X-IronPort-AV: E=Sophos;i="5.87,225,1631602800"; d="scan'208";a="452627303"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.199])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 23:15:19 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/i915: Add functions to set/get moving fence
Date: Thu, 11 Nov 2021 08:14:57 +0100
Message-Id: <20211111071502.16826-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
References: <20211111071502.16826-1-thomas.hellstrom@linux.intel.com>
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
Cc: matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

We want to get rid of i915_vma tracking to simplify the code and
lifetimes. Add a way to set/put the moving fence, in preparation for
removing the tracking.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 37 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_object.h |  9 ++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 591ee3cb7275..ec4313836597 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -33,6 +33,7 @@
 #include "i915_gem_object.h"
 #include "i915_memcpy.h"
 #include "i915_trace.h"
+#include "i915_gem_ttm.h"
 
 static struct kmem_cache *slab_objects;
 
@@ -726,6 +727,42 @@ static const struct drm_gem_object_funcs i915_gem_object_funcs = {
 	.export = i915_gem_prime_export,
 };
 
+struct dma_fence *
+i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
+{
+	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
+}
+
+void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
+				      struct dma_fence *fence)
+{
+	dma_fence_put(i915_gem_to_ttm(obj)->moving);
+
+	i915_gem_to_ttm(obj)->moving = dma_fence_get(fence);
+}
+
+int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
+				      bool intr)
+{
+	struct dma_fence *fence = i915_gem_to_ttm(obj)->moving;
+	int ret;
+
+	assert_object_held(obj);
+	if (!fence)
+		return 0;
+
+	ret = dma_fence_wait(fence, intr);
+	if (ret)
+		return ret;
+
+	if (fence->error)
+		return fence->error;
+
+	i915_gem_to_ttm(obj)->moving = NULL;
+	dma_fence_put(fence);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 133963b46135..36bf3e2e602f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -517,6 +517,15 @@ i915_gem_object_finish_access(struct drm_i915_gem_object *obj)
 	i915_gem_object_unpin_pages(obj);
 }
 
+struct dma_fence *
+i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
+
+void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
+				      struct dma_fence *fence);
+
+int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
+				      bool intr);
+
 void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 					 unsigned int cache_level);
 bool i915_gem_object_can_bypass_llc(struct drm_i915_gem_object *obj);
-- 
2.31.1

