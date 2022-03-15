Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36614DA1F0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F3010E3D9;
	Tue, 15 Mar 2022 18:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C177C10E43E;
 Tue, 15 Mar 2022 18:05:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 2E8931F43067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367507;
 bh=F4G57USBr70RpsEaKXSQnIcfZKnwvbJG4URh3fSOgAY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=elzaoSYwoovr/4JIhuF+f6pR44zwhIZ6wMoZpCDCAgkOeOitdxDXBE9XhLxh6V+rD
 cmrIzxp/4mBQQtrzeI2vPAKfOExZDmI/g2nvDgszTAN5fvtdQuFBDFtlr5Tjd4/Oj9
 JIY4SQZSa4tpdr6JBUu9hSIqSAw91zWdhKzjIiL529HT9pTZMhpj3v8mQ4dHhd55Vf
 owi3sHhlptfkCN4Xt1fJmsYO7OEfkjrCou3Qa664Ofcu0O5APsn8lL+e/i4ptGZeaH
 28oTvsKvdIL/qLu3LFdAls6/yuv6Ufz8DeAPn8JP2DREdWmjzK/HTeIgYooU4pVn8h
 VbgFh7Mrkwy/A==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 2/7] drm/i915: add ability to create memory region object
 in place
Date: Tue, 15 Mar 2022 18:04:39 +0000
Message-Id: <20220315180444.3327283-3-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315180444.3327283-1-bob.beckett@collabora.com>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 55 ++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_region.h |  6 ++
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 84 ++++++++++++++++++----
 drivers/gpu/drm/i915/intel_memory_region.h |  6 ++
 4 files changed, 136 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index c9b2e8b91053..e25ad0b9b636 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -98,6 +98,61 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	return ERR_PTR(err);
 }
 
+struct drm_i915_gem_object *
+i915_gem_object_create_region_in_place(struct intel_memory_region *mem,
+				       resource_size_t size,
+				       resource_size_t page_size,
+				       unsigned int flags,
+				       u64 start, u64 end)
+{
+	struct drm_i915_gem_object *obj;
+	resource_size_t default_page_size;
+	int err;
+
+	/*
+	 * NB: Our use of resource_size_t for the size stems from using struct
+	 * resource for the mem->region. We might need to revisit this in the
+	 * future.
+	 */
+
+	GEM_BUG_ON(flags & ~I915_BO_ALLOC_FLAGS);
+
+	if (!mem)
+		return ERR_PTR(-ENODEV);
+	if (!mem->ops->init_object_in_place)
+		return ERR_PTR(-EINVAL);
+
+	default_page_size = mem->min_page_size;
+	if (page_size)
+		default_page_size = page_size;
+
+	GEM_BUG_ON(!is_power_of_2_u64(default_page_size));
+	GEM_BUG_ON(default_page_size < PAGE_SIZE);
+
+	size = round_up(size, default_page_size);
+
+	GEM_BUG_ON(!size);
+	GEM_BUG_ON(!IS_ALIGNED(size, I915_GTT_MIN_ALIGNMENT));
+
+	if (i915_gem_object_size_2big(size))
+		return ERR_PTR(-E2BIG);
+
+	obj = i915_gem_object_alloc();
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	err = mem->ops->init_object_in_place(mem, obj, size, page_size, flags, start, end);
+	if (err)
+		goto err_object_free;
+
+	trace_i915_gem_object_create(obj);
+	return obj;
+
+err_object_free:
+	i915_gem_object_free(obj);
+	return ERR_PTR(err);
+}
+
 /**
  * i915_gem_process_region - Iterate over all objects of a region using ops
  * to process and optionally skip objects
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index fcaa12d657d4..0cad90ac4a92 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -56,6 +56,12 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 			      resource_size_t size,
 			      resource_size_t page_size,
 			      unsigned int flags);
+struct drm_i915_gem_object *
+i915_gem_object_create_region_in_place(struct intel_memory_region *mem,
+				       resource_size_t size,
+				       resource_size_t page_size,
+				       unsigned int flags,
+				       u64 start, u64 end);
 
 int i915_gem_process_region(struct intel_memory_region *mr,
 			    struct i915_gem_apply_to_region *apply);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 45cc5837ce00..35d1bde19267 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1131,20 +1131,12 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
 	}
 }
 
-/**
- * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
- * @mem: The initial memory region for the object.
- * @obj: The gem object.
- * @size: Object size in bytes.
- * @flags: gem object flags.
- *
- * Return: 0 on success, negative error code on failure.
- */
-int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
-			       struct drm_i915_gem_object *obj,
-			       resource_size_t size,
-			       resource_size_t page_size,
-			       unsigned int flags)
+static int __i915_gem_ttm_object_init_with_placement(struct intel_memory_region *mem,
+						     struct drm_i915_gem_object *obj,
+						     resource_size_t size,
+						     resource_size_t page_size,
+						     unsigned int flags,
+						     struct ttm_placement *placement)
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_private *i915 = mem->i915;
@@ -1188,7 +1180,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * until successful initialization.
 	 */
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
-				   bo_type, &i915_sys_placement,
+				   bo_type, placement,
 				   page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
 	if (ret)
@@ -1204,8 +1196,70 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	return 0;
 }
 
+/**
+ * __i915_gem_ttm_object_init - Initialize a ttm-backed i915 gem object
+ * @mem: The initial memory region for the object.
+ * @obj: The gem object.
+ * @size: Object size in bytes.
+ * @flags: gem object flags.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
+			       struct drm_i915_gem_object *obj,
+			       resource_size_t size,
+			       resource_size_t page_size,
+			       unsigned int flags)
+{
+	return __i915_gem_ttm_object_init_with_placement(mem, obj, size,
+							 page_size, flags,
+							 &i915_sys_placement);
+}
+
+/**
+ * i915_gem_ttm_object_init_in_place - Initialize a ttm-backed i915 gem object in place
+ * @mem: The initial memory region for the object.
+ * @obj: The gem object.
+ * @size: Object size in bytes.
+ * @page_size: Required page size.
+ * @flags: gem object flags.
+ * @start: start of range to insert in to.
+ * @end: end of range to insert in to.
+ *
+ * Initializes a ttm-backed i915 gem object with a predefined
+ * placement and range.
+ * Can be used to create an object around a pre-reserved area.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int i915_gem_ttm_object_init_in_place(struct intel_memory_region *mem,
+					     struct drm_i915_gem_object *obj,
+					     resource_size_t size,
+					     resource_size_t page_size,
+					     unsigned int flags,
+					     u64 start,
+					     u64 end)
+{
+	struct ttm_place place;
+	struct ttm_placement placement = {
+		.num_placement = 1,
+		.placement = &place,
+		.num_busy_placement = 1,
+		.busy_placement = &place,
+	};
+
+	i915_ttm_place_from_region(mem, &place, flags);
+	place.fpfn = PFN_DOWN(start);
+	place.lpfn = PFN_UP(end);
+
+	return __i915_gem_ttm_object_init_with_placement(mem, obj, size,
+							 page_size, flags,
+							 &placement);
+}
+
 static const struct intel_memory_region_ops ttm_system_region_ops = {
 	.init_object = __i915_gem_ttm_object_init,
+	.init_object_in_place = i915_gem_ttm_object_init_in_place,
 	.release = intel_region_ttm_fini,
 };
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index 21dcbd620758..eb72997df8f7 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -57,6 +57,12 @@ struct intel_memory_region_ops {
 			   resource_size_t size,
 			   resource_size_t page_size,
 			   unsigned int flags);
+	int (*init_object_in_place)(struct intel_memory_region *mem,
+				    struct drm_i915_gem_object *obj,
+				    resource_size_t size,
+				    resource_size_t page_size,
+				    unsigned int flags,
+				    u64 start, u64 end);
 };
 
 struct intel_memory_region {
-- 
2.25.1

