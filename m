Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A7513C6B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 22:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A9C10EA65;
	Thu, 28 Apr 2022 20:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9351110EA6D;
 Thu, 28 Apr 2022 20:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 8B7361F45C28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651176746;
 bh=88vk3HBnk+zJGQiRrc2VM0uGkuQfuKnKQwLqW2y7Svo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W8Ls/ZfpAIskhyH03AfdpvdQlHpLXrw7pwlsvFOaMQ1jwLPdX6QxNmO3iUk1HxqxZ
 cUsLsFz5sx0zC9BfKUT/nxyhknFJsS0jhB+ohqDS5zSbmIPKOhNGyhg6klkqbxoyBh
 AHwfo4cTBz5DikEbZn/KtN/QpqjkESkJy2tyPQ10qTEIViAbTBtPr4GGV3yhUjUASU
 VG58D3eV0zQKgusWjC4XngA9IE3DMyvLu2naJPJZEL/BGhQ0AaYzlJDlj9cjsE+v25
 zBqTqqW59Vwob/voAU9XGcrCLlqop6sa9+wO4JQILYKYGut2RBcpTyvWEdwath9qA6
 +nND7ZtWxFyJw==
From: Robert Beckett <bob.beckett@collabora.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 4/6] drm/i915: ttm backend dont provide mmap_offset for
 kernel buffers
Date: Thu, 28 Apr 2022 20:11:23 +0000
Message-Id: <20220428201125.412896-5-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428201125.412896-1-bob.beckett@collabora.com>
References: <20220428201125.412896-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

stolen/kernel buffers should not be mmapable by userland.
do not provide callbacks to facilitate this for these buffers.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 32 +++++++++++++++++++++----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4c25d9b2f138..d22a1af214ce 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1120,8 +1120,8 @@ static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
 	ttm_bo_unmap_virtual(i915_gem_to_ttm(obj));
 }
 
-static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
-	.name = "i915_gem_object_ttm",
+static const struct drm_i915_gem_object_ops i915_gem_ttm_user_obj_ops = {
+	.name = "i915_gem_object_ttm_user",
 	.flags = I915_GEM_OBJECT_IS_SHRINKABLE |
 		 I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
 
@@ -1139,6 +1139,21 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
 	.mmap_ops = &vm_ops_ttm,
 };
 
+static const struct drm_i915_gem_object_ops i915_gem_ttm_kern_obj_ops = {
+	.name = "i915_gem_object_ttm_kern",
+	.flags = I915_GEM_OBJECT_IS_SHRINKABLE |
+		 I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
+
+	.get_pages = i915_ttm_get_pages,
+	.put_pages = i915_ttm_put_pages,
+	.truncate = i915_ttm_truncate,
+	.shrink = i915_ttm_shrink,
+
+	.adjust_lru = i915_ttm_adjust_lru,
+	.delayed_free = i915_ttm_delayed_free,
+	.migrate = i915_ttm_migrate,
+};
+
 void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 {
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
@@ -1193,10 +1208,19 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 		.no_wait_gpu = false,
 	};
 	enum ttm_bo_type bo_type;
+	const struct drm_i915_gem_object_ops *ops;
 	int ret;
 
 	drm_gem_private_object_init(&i915->drm, &obj->base, size);
-	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
+
+	if (flags & I915_BO_ALLOC_USER && intel_region_to_ttm_type(mem) != I915_PL_STOLEN) {
+		bo_type = ttm_bo_type_device;
+		ops = &i915_gem_ttm_user_obj_ops;
+	} else {
+		bo_type = ttm_bo_type_kernel;
+		ops = &i915_gem_ttm_kern_obj_ops;
+	}
+	i915_gem_object_init(obj, ops, &lock_class, flags);
 
 	obj->bo_offset = offset;
 
@@ -1206,8 +1230,6 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 
 	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
 	mutex_init(&obj->ttm.get_io_page.lock);
-	bo_type = (obj->flags & I915_BO_ALLOC_USER) ? ttm_bo_type_device :
-		ttm_bo_type_kernel;
 
 	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 
-- 
2.25.1

