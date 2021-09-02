Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B33FECF1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 13:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9999C6E4F8;
	Thu,  2 Sep 2021 11:28:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356F6E4FF;
 Thu,  2 Sep 2021 11:28:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="219088332"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="219088332"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 04:28:49 -0700
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="542604213"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.24])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 04:28:47 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 2/6] drm/i915/gem: Implement a function to process all gem
 objects of a region
Date: Thu,  2 Sep 2021 13:28:20 +0200
Message-Id: <20210902112824.118524-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902112824.118524-1-thomas.hellstrom@linux.intel.com>
References: <20210902112824.118524-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

An upcoming common pattern is to traverse the region object list and
perform certain actions on all objects in a region. It's a little tricky
to get the list locking right, in particular since a gem object may
change region unless it's pinned or the object lock is held.

Define a function that does this for us and that takes an argument that
defines the action to be performed on each object.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_region.c | 70 ++++++++++++++++++++++
 drivers/gpu/drm/i915/gem/i915_gem_region.h | 33 ++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.c b/drivers/gpu/drm/i915/gem/i915_gem_region.c
index 1f557b2178ed..a016ccec36f3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.c
@@ -80,3 +80,73 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 	i915_gem_object_free(obj);
 	return ERR_PTR(err);
 }
+
+/**
+ * i915_gem_process_region - Iterate over all objects of a region using ops
+ * to process and optionally skip objects
+ * @mr: The memory region
+ * @apply: ops and private data
+ *
+ * This function can be used to iterate over the regions object list,
+ * checking whether to skip objects, and, if not, lock the objects and
+ * process them using the supplied ops. Note that this function temporarily
+ * removes objects from the region list while iterating, so that if run
+ * concurrently with itself may not iterate over all objects.
+ *
+ * Return: 0 if successful, negative error code on failure.
+ */
+int i915_gem_process_region(struct intel_memory_region *mr,
+			    struct i915_gem_apply_to_region *apply)
+{
+	const struct i915_gem_apply_to_region_ops *ops = apply->ops;
+	struct drm_i915_gem_object *obj;
+	struct list_head still_in_list;
+	int ret = 0;
+
+	/*
+	 * In the future, a non-NULL apply->ww could mean the caller is
+	 * already in a locking transaction and provides its own context.
+	 */
+	GEM_WARN_ON(apply->ww);
+
+	INIT_LIST_HEAD(&still_in_list);
+	mutex_lock(&mr->objects.lock);
+	for (;;) {
+		struct i915_gem_ww_ctx ww;
+
+		obj = list_first_entry_or_null(&mr->objects.list, typeof(*obj),
+					       mm.region_link);
+		if (!obj)
+			break;
+
+		list_move_tail(&obj->mm.region_link, &still_in_list);
+		if (!kref_get_unless_zero(&obj->base.refcount))
+			continue;
+
+		/*
+		 * Note: Someone else might be migrating the object at this
+		 * point. The object's region is not stable until we lock
+		 * the object.
+		 */
+		mutex_unlock(&mr->objects.lock);
+		apply->ww = &ww;
+		for_i915_gem_ww(&ww, ret, apply->interruptible) {
+			ret = i915_gem_object_lock(obj, apply->ww);
+			if (ret)
+				continue;
+
+			if (obj->mm.region == mr)
+				ret = ops->process_obj(apply, obj);
+			/* Implicit object unlock */
+		}
+
+		i915_gem_object_put(obj);
+		mutex_lock(&mr->objects.lock);
+		if (ret)
+			break;
+	}
+	list_splice_tail(&still_in_list, &mr->objects.list);
+	mutex_unlock(&mr->objects.lock);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_region.h b/drivers/gpu/drm/i915/gem/i915_gem_region.h
index 1008e580a89a..f62195847056 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_region.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_region.h
@@ -12,6 +12,37 @@ struct intel_memory_region;
 struct drm_i915_gem_object;
 struct sg_table;
 
+struct i915_gem_apply_to_region;
+
+/**
+ * struct i915_gem_apply_to_region_ops - ops to use when iterating over all
+ * region objects.
+ */
+struct i915_gem_apply_to_region_ops {
+	/**
+	 * process_obj - Process the current object
+	 * @apply: Embed this for provate data
+	 * @obj: The current object.
+	 */
+	int (*process_obj)(struct i915_gem_apply_to_region *apply,
+			   struct drm_i915_gem_object *obj);
+};
+
+/**
+ * struct i915_gem_apply_to_region - Argument to the struct
+ * i915_gem_apply_to_region_ops functions.
+ * @ops: The ops for the operation.
+ * @ww: Locking context used for the transaction.
+ * @interruptible: Whether to perform object locking interruptible.
+ *
+ * This structure is intended to be embedded in a private struct if needed
+ */
+struct i915_gem_apply_to_region {
+	const struct i915_gem_apply_to_region_ops *ops;
+	struct i915_gem_ww_ctx *ww;
+	u32 interruptible:1;
+};
+
 void i915_gem_object_init_memory_region(struct drm_i915_gem_object *obj,
 					struct intel_memory_region *mem);
 void i915_gem_object_release_memory_region(struct drm_i915_gem_object *obj);
@@ -22,4 +53,6 @@ i915_gem_object_create_region(struct intel_memory_region *mem,
 			      resource_size_t page_size,
 			      unsigned int flags);
 
+int i915_gem_process_region(struct intel_memory_region *mr,
+			    struct i915_gem_apply_to_region *apply);
 #endif
-- 
2.31.1

