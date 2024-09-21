Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1909097DBFE
	for <lists+dri-devel@lfdr.de>; Sat, 21 Sep 2024 09:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484BD10E00E;
	Sat, 21 Sep 2024 07:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1172 seconds by postgrey-1.36 at gabe;
 Sat, 21 Sep 2024 06:57:46 UTC
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85D810E050
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 06:57:46 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.163])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4X9fhf6fmKz1ymB3;
 Sat, 21 Sep 2024 14:38:10 +0800 (CST)
Received: from kwepemj200012.china.huawei.com (unknown [7.202.194.24])
 by mail.maildlp.com (Postfix) with ESMTPS id 20F36180043;
 Sat, 21 Sep 2024 14:38:10 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemj200012.china.huawei.com
 (7.202.194.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 21 Sep
 2024 14:38:09 +0800
From: Huang Xiaojia <huangxiaojia2@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <linux-graphics-maintainer@vmware.com>, <sroland@vmware.com>,
 <thellstrom@vmware.com>, <syeh@vmware.com>, <yuehaibing@huawei.com>,
 <weiyongjun1@huawei.com>
CC: <dri-devel@lists.freedesktop.org>, <stable@vger.kernel.org>,
 <huangxiaojia2@huawei.com>
Subject: [PATCH 5.10] drm/vmwgfx: Remove rcu locks from user resources
Date: Sat, 21 Sep 2024 14:48:04 +0800
Message-ID: <20240921064804.2868105-1-huangxiaojia2@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemj200012.china.huawei.com (7.202.194.24)
X-Mailman-Approved-At: Sat, 21 Sep 2024 07:38:43 +0000
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

[ Upstream commit a309c7194e8a2f8bd4539b9449917913f6c2cd50 ]

User resource lookups used rcu to avoid two extra atomics. Unfortunately
the rcu paths were buggy and it was easy to make the driver crash by
submitting command buffers from two different threads. Because the
lookups never show up in performance profiles replace them with a
regular spin lock which fixes the races in accesses to those shared
resources.

Fixes kernel oops'es in IGT's vmwgfx execution_buffer stress test and
seen crashes with apps using shared resources.

Fixes: e14c02e6b699 ("drm/vmwgfx: Look up objects without taking a reference")
Signed-off-by: Huang Xiaojia <huangxiaojia2@huawei.com>
---
 drivers/gpu/drm/drm_hashtab.c            |   5 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c      |  55 +++----
 drivers/gpu/drm/vmwgfx/ttm_object.h      |  14 --
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  42 ------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |  27 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c  | 176 +++++++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  35 -----
 include/drm/drm_hashtab.h                |   2 +
 8 files changed, 105 insertions(+), 251 deletions(-)

diff --git a/drivers/gpu/drm/drm_hashtab.c b/drivers/gpu/drm/drm_hashtab.c
index c50fa6f0709f..a61642835542 100644
--- a/drivers/gpu/drm/drm_hashtab.c
+++ b/drivers/gpu/drm/drm_hashtab.c
@@ -74,8 +74,8 @@ void drm_ht_verbose_list(struct drm_open_hash *ht, unsigned long key)
 		DRM_DEBUG("count %d, key: 0x%08lx\n", count++, entry->key);
 }
 
-static struct hlist_node *drm_ht_find_key(struct drm_open_hash *ht,
-					  unsigned long key)
+struct hlist_node *drm_ht_find_key(struct drm_open_hash *ht,
+				   unsigned long key)
 {
 	struct drm_hash_item *entry;
 	struct hlist_head *h_list;
@@ -91,6 +91,7 @@ static struct hlist_node *drm_ht_find_key(struct drm_open_hash *ht,
 	}
 	return NULL;
 }
+EXPORT_SYMBOL(drm_ht_find_key);
 
 static struct hlist_node *drm_ht_find_key_rcu(struct drm_open_hash *ht,
 					      unsigned long key)
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 16077785ad47..72a4aaeba0c7 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -137,6 +137,20 @@ ttm_object_file_ref(struct ttm_object_file *tfile)
 	return tfile;
 }
 
+static int ttm_tfile_find_ref(struct drm_open_hash *ht,
+			      uint32_t key,
+			      struct drm_hash_item **item)
+{
+	struct hlist_node *h_node;
+
+	h_node = drm_ht_find_key(ht, key);
+	if (!h_node)
+		return -EINVAL;
+
+	*item = hlist_entry(h_node, struct drm_hash_item, head);
+	return 0;
+}
+
 static void ttm_object_file_destroy(struct kref *kref)
 {
 	struct ttm_object_file *tfile =
@@ -225,41 +239,6 @@ void ttm_base_object_unref(struct ttm_base_object **p_base)
 	kref_put(&base->refcount, ttm_release_base);
 }
 
-/**
- * ttm_base_object_noref_lookup - look up a base object without reference
- * @tfile: The struct ttm_object_file the object is registered with.
- * @key: The object handle.
- *
- * This function looks up a ttm base object and returns a pointer to it
- * without refcounting the pointer. The returned pointer is only valid
- * until ttm_base_object_noref_release() is called, and the object
- * pointed to by the returned pointer may be doomed. Any persistent usage
- * of the object requires a refcount to be taken using kref_get_unless_zero().
- * Iff this function returns successfully it needs to be paired with
- * ttm_base_object_noref_release() and no sleeping- or scheduling functions
- * may be called inbetween these function callse.
- *
- * Return: A pointer to the object if successful or NULL otherwise.
- */
-struct ttm_base_object *
-ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint32_t key)
-{
-	struct drm_hash_item *hash;
-	struct drm_open_hash *ht = &tfile->ref_hash[TTM_REF_USAGE];
-	int ret;
-
-	rcu_read_lock();
-	ret = drm_ht_find_item_rcu(ht, key, &hash);
-	if (ret) {
-		rcu_read_unlock();
-		return NULL;
-	}
-
-	__release(RCU);
-	return drm_hash_entry(hash, struct ttm_ref_object, hash)->obj;
-}
-EXPORT_SYMBOL(ttm_base_object_noref_lookup);
-
 struct ttm_base_object *ttm_base_object_lookup(struct ttm_object_file *tfile,
 					       uint32_t key)
 {
@@ -268,15 +247,15 @@ struct ttm_base_object *ttm_base_object_lookup(struct ttm_object_file *tfile,
 	struct drm_open_hash *ht = &tfile->ref_hash[TTM_REF_USAGE];
 	int ret;
 
-	rcu_read_lock();
-	ret = drm_ht_find_item_rcu(ht, key, &hash);
+	spin_lock(&tfile->lock);
+	ret = ttm_tfile_find_ref(ht, key, &hash);
 
 	if (likely(ret == 0)) {
 		base = drm_hash_entry(hash, struct ttm_ref_object, hash)->obj;
 		if (!kref_get_unless_zero(&base->refcount))
 			base = NULL;
 	}
-	rcu_read_unlock();
+	spin_unlock(&tfile->lock);
 
 	return base;
 }
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx/ttm_object.h
index ede26df87c93..d16334e5d509 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@ -359,18 +359,4 @@ extern int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
  */
 #define TTM_OBJ_EXTRA_SIZE 128
 
-struct ttm_base_object *
-ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint32_t key);
-
-/**
- * ttm_base_object_noref_release - release a base object pointer looked up
- * without reference
- *
- * Releases a base object pointer looked up with ttm_base_object_noref_lookup().
- */
-static inline void ttm_base_object_noref_release(void)
-{
-	__acquire(RCU);
-	rcu_read_unlock();
-}
 #endif
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9a66ba254326..eb76cca4b29c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -976,48 +976,6 @@ int vmw_user_bo_lookup(struct ttm_object_file *tfile,
 	return 0;
 }
 
-/**
- * vmw_user_bo_noref_lookup - Look up a vmw user buffer object without reference
- * @tfile: The TTM object file the handle is registered with.
- * @handle: The user buffer object handle.
- *
- * This function looks up a struct vmw_user_bo and returns a pointer to the
- * struct vmw_buffer_object it derives from without refcounting the pointer.
- * The returned pointer is only valid until vmw_user_bo_noref_release() is
- * called, and the object pointed to by the returned pointer may be doomed.
- * Any persistent usage of the object requires a refcount to be taken using
- * ttm_bo_reference_unless_doomed(). Iff this function returns successfully it
- * needs to be paired with vmw_user_bo_noref_release() and no sleeping-
- * or scheduling functions may be called inbetween these function calls.
- *
- * Return: A struct vmw_buffer_object pointer if successful or negative
- * error pointer on failure.
- */
-struct vmw_buffer_object *
-vmw_user_bo_noref_lookup(struct ttm_object_file *tfile, u32 handle)
-{
-	struct vmw_user_buffer_object *vmw_user_bo;
-	struct ttm_base_object *base;
-
-	base = ttm_base_object_noref_lookup(tfile, handle);
-	if (!base) {
-		DRM_ERROR("Invalid buffer object handle 0x%08lx.\n",
-			  (unsigned long)handle);
-		return ERR_PTR(-ESRCH);
-	}
-
-	if (unlikely(ttm_base_object_type(base) != ttm_buffer_type)) {
-		ttm_base_object_noref_release();
-		DRM_ERROR("Invalid buffer object handle 0x%08lx.\n",
-			  (unsigned long)handle);
-		return ERR_PTR(-EINVAL);
-	}
-
-	vmw_user_bo = container_of(base, struct vmw_user_buffer_object,
-				   prime.base);
-	return &vmw_user_bo->vbo;
-}
-
 /**
  * vmw_user_bo_reference - Open a handle to a vmw user buffer object.
  *
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index fa285c20d6da..0f7a0f9169f8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -768,12 +768,7 @@ extern int vmw_user_resource_lookup_handle(
 	uint32_t handle,
 	const struct vmw_user_resource_conv *converter,
 	struct vmw_resource **p_res);
-extern struct vmw_resource *
-vmw_user_resource_noref_lookup_handle(struct vmw_private *dev_priv,
-				      struct ttm_object_file *tfile,
-				      uint32_t handle,
-				      const struct vmw_user_resource_conv *
-				      converter);
+
 extern int vmw_stream_claim_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv);
 extern int vmw_stream_unref_ioctl(struct drm_device *dev, void *data,
@@ -811,15 +806,6 @@ static inline bool vmw_resource_mob_attached(const struct vmw_resource *res)
 	return !RB_EMPTY_NODE(&res->mob_node);
 }
 
-/**
- * vmw_user_resource_noref_release - release a user resource pointer looked up
- * without reference
- */
-static inline void vmw_user_resource_noref_release(void)
-{
-	ttm_base_object_noref_release();
-}
-
 /**
  * Buffer object helper functions - vmwgfx_bo.c
  */
@@ -880,17 +866,6 @@ extern void vmw_bo_unmap(struct vmw_buffer_object *vbo);
 extern void vmw_bo_move_notify(struct ttm_buffer_object *bo,
 			       struct ttm_resource *mem);
 extern void vmw_bo_swap_notify(struct ttm_buffer_object *bo);
-extern struct vmw_buffer_object *
-vmw_user_bo_noref_lookup(struct ttm_object_file *tfile, u32 handle);
-
-/**
- * vmw_user_bo_noref_release - release a buffer object pointer looked up
- * without reference
- */
-static inline void vmw_user_bo_noref_release(void)
-{
-	ttm_base_object_noref_release();
-}
 
 /**
  * vmw_bo_adjust_prio - Adjust the buffer object eviction priority
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index 616f6cb62278..c1aab5ee2a35 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -285,20 +285,26 @@ static void vmw_execbuf_rcache_update(struct vmw_res_cache_entry *rcache,
 	rcache->valid_handle = 0;
 }
 
+enum vmw_val_add_flags {
+	vmw_val_add_flag_none  =      0,
+	vmw_val_add_flag_noctx = 1 << 0,
+};
+
 /**
- * vmw_execbuf_res_noref_val_add - Add a resource described by an unreferenced
- * rcu-protected pointer to the validation list.
+ * vmw_execbuf_res_val_add - Add a resource to the validation list.
  *
  * @sw_context: Pointer to the software context.
  * @res: Unreferenced rcu-protected pointer to the resource.
  * @dirty: Whether to change dirty status.
+ * @flags: specifies whether to use the context or not
  *
  * Returns: 0 on success. Negative error code on failure. Typical error codes
  * are %-EINVAL on inconsistency and %-ESRCH if the resource was doomed.
  */
-static int vmw_execbuf_res_noref_val_add(struct vmw_sw_context *sw_context,
-					 struct vmw_resource *res,
-					 u32 dirty)
+static int vmw_execbuf_res_val_add(struct vmw_sw_context *sw_context,
+				   struct vmw_resource *res,
+				   u32 dirty,
+				   u32 flags)
 {
 	struct vmw_private *dev_priv = res->dev_priv;
 	int ret;
@@ -313,24 +319,30 @@ static int vmw_execbuf_res_noref_val_add(struct vmw_sw_context *sw_context,
 		if (dirty)
 			vmw_validation_res_set_dirty(sw_context->ctx,
 						     rcache->private, dirty);
-		vmw_user_resource_noref_release();
 		return 0;
 	}
 
-	priv_size = vmw_execbuf_res_size(dev_priv, res_type);
-	ret = vmw_validation_add_resource(sw_context->ctx, res, priv_size,
-					  dirty, (void **)&ctx_info,
-					  &first_usage);
-	vmw_user_resource_noref_release();
-	if (ret)
-		return ret;
+	if ((flags & vmw_val_add_flag_noctx) != 0) {
+		ret = vmw_validation_add_resource(sw_context->ctx, res, 0, dirty,
+						  (void **)&ctx_info, NULL);
+		if (ret)
+			return ret;
 
-	if (priv_size && first_usage) {
-		ret = vmw_cmd_ctx_first_setup(dev_priv, sw_context, res,
-					      ctx_info);
-		if (ret) {
-			VMW_DEBUG_USER("Failed first usage context setup.\n");
+	} else {
+		priv_size = vmw_execbuf_res_size(dev_priv, res_type);
+		ret = vmw_validation_add_resource(sw_context->ctx, res, priv_size,
+						  dirty, (void **)&ctx_info,
+						  &first_usage);
+		if (ret)
 			return ret;
+
+		if (priv_size && first_usage) {
+			ret = vmw_cmd_ctx_first_setup(dev_priv, sw_context, res,
+						      ctx_info);
+			if (ret) {
+				VMW_DEBUG_USER("Failed first usage context setup.\n");
+				return ret;
+			}
 		}
 	}
 
@@ -338,43 +350,6 @@ static int vmw_execbuf_res_noref_val_add(struct vmw_sw_context *sw_context,
 	return 0;
 }
 
-/**
- * vmw_execbuf_res_noctx_val_add - Add a non-context resource to the resource
- * validation list if it's not already on it
- *
- * @sw_context: Pointer to the software context.
- * @res: Pointer to the resource.
- * @dirty: Whether to change dirty status.
- *
- * Returns: Zero on success. Negative error code on failure.
- */
-static int vmw_execbuf_res_noctx_val_add(struct vmw_sw_context *sw_context,
-					 struct vmw_resource *res,
-					 u32 dirty)
-{
-	struct vmw_res_cache_entry *rcache;
-	enum vmw_res_type res_type = vmw_res_type(res);
-	void *ptr;
-	int ret;
-
-	rcache = &sw_context->res_cache[res_type];
-	if (likely(rcache->valid && rcache->res == res)) {
-		if (dirty)
-			vmw_validation_res_set_dirty(sw_context->ctx,
-						     rcache->private, dirty);
-		return 0;
-	}
-
-	ret = vmw_validation_add_resource(sw_context->ctx, res, 0, dirty,
-					  &ptr, NULL);
-	if (ret)
-		return ret;
-
-	vmw_execbuf_rcache_update(rcache, res, ptr);
-
-	return 0;
-}
-
 /**
  * vmw_view_res_val_add - Add a view and the surface it's pointing to to the
  * validation list
@@ -393,13 +368,13 @@ static int vmw_view_res_val_add(struct vmw_sw_context *sw_context,
 	 * First add the resource the view is pointing to, otherwise it may be
 	 * swapped out when the view is validated.
 	 */
-	ret = vmw_execbuf_res_noctx_val_add(sw_context, vmw_view_srf(view),
-					    vmw_view_dirtying(view));
+	ret = vmw_execbuf_res_val_add(sw_context, vmw_view_srf(view),
+				      vmw_view_dirtying(view), vmw_val_add_flag_noctx);
 	if (ret)
 		return ret;
 
-	return vmw_execbuf_res_noctx_val_add(sw_context, view,
-					     VMW_RES_DIRTY_NONE);
+	return vmw_execbuf_res_val_add(sw_context, view, VMW_RES_DIRTY_NONE,
+				       vmw_val_add_flag_noctx);
 }
 
 /**
@@ -470,8 +445,9 @@ static int vmw_resource_context_res_add(struct vmw_private *dev_priv,
 			if (IS_ERR_OR_NULL(res))
 				continue;
 
-			ret = vmw_execbuf_res_noctx_val_add(sw_context, res,
-							    VMW_RES_DIRTY_SET);
+			ret = vmw_execbuf_res_val_add(sw_context, res,
+						      VMW_RES_DIRTY_SET,
+						      vmw_val_add_flag_noctx);
 			if (unlikely(ret != 0))
 				return ret;
 		}
@@ -485,9 +461,9 @@ static int vmw_resource_context_res_add(struct vmw_private *dev_priv,
 		if (vmw_res_type(entry->res) == vmw_res_view)
 			ret = vmw_view_res_val_add(sw_context, entry->res);
 		else
-			ret = vmw_execbuf_res_noctx_val_add
-				(sw_context, entry->res,
-				 vmw_binding_dirtying(entry->bt));
+			ret = vmw_execbuf_res_val_add(sw_context, entry->res,
+						      vmw_binding_dirtying(entry->bt),
+						      vmw_val_add_flag_noctx);
 		if (unlikely(ret != 0))
 			break;
 	}
@@ -653,7 +629,8 @@ vmw_cmd_res_check(struct vmw_private *dev_priv,
 {
 	struct vmw_res_cache_entry *rcache = &sw_context->res_cache[res_type];
 	struct vmw_resource *res;
-	int ret;
+	int ret = 0;
+	bool needs_unref = false;
 
 	if (p_res)
 		*p_res = NULL;
@@ -678,17 +655,18 @@ vmw_cmd_res_check(struct vmw_private *dev_priv,
 		if (ret)
 			return ret;
 
-		res = vmw_user_resource_noref_lookup_handle
-			(dev_priv, sw_context->fp->tfile, *id_loc, converter);
-		if (IS_ERR(res)) {
+		ret = vmw_user_resource_lookup_handle
+			(dev_priv, sw_context->fp->tfile, *id_loc, converter, &res);
+		if (ret != 0) {
 			VMW_DEBUG_USER("Could not find/use resource 0x%08x.\n",
 				       (unsigned int) *id_loc);
-			return PTR_ERR(res);
+			return ret;
 		}
+		needs_unref = true;
 
-		ret = vmw_execbuf_res_noref_val_add(sw_context, res, dirty);
+		ret = vmw_execbuf_res_val_add(sw_context, res, dirty, vmw_val_add_flag_none);
 		if (unlikely(ret != 0))
-			return ret;
+			goto res_check_done;
 
 		if (rcache->valid && rcache->res == res) {
 			rcache->valid_handle = true;
@@ -703,7 +681,11 @@ vmw_cmd_res_check(struct vmw_private *dev_priv,
 	if (p_res)
 		*p_res = res;
 
-	return 0;
+res_check_done:
+	if (needs_unref)
+		vmw_resource_unreference(&res);
+
+	return ret;
 }
 
 /**
@@ -1166,14 +1148,14 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
 	int ret;
 
 	vmw_validation_preload_bo(sw_context->ctx);
-	vmw_bo = vmw_user_bo_noref_lookup(sw_context->fp->tfile, handle);
-	if (IS_ERR(vmw_bo)) {
+	ret = vmw_user_bo_lookup(sw_context->fp->tfile, handle, &vmw_bo, NULL);
+	if (ret != 0) {
 		VMW_DEBUG_USER("Could not find or use MOB buffer.\n");
 		return PTR_ERR(vmw_bo);
 	}
 
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, true, false);
-	vmw_user_bo_noref_release();
+	ttm_bo_put(&vmw_bo->base);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -1221,14 +1203,14 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
 	int ret;
 
 	vmw_validation_preload_bo(sw_context->ctx);
-	vmw_bo = vmw_user_bo_noref_lookup(sw_context->fp->tfile, handle);
-	if (IS_ERR(vmw_bo)) {
+	ret = vmw_user_bo_lookup(sw_context->fp->tfile, handle, &vmw_bo, NULL);
+	if (ret != 0) {
 		VMW_DEBUG_USER("Could not find or use GMR region.\n");
 		return PTR_ERR(vmw_bo);
 	}
 
 	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo, false, false);
-	vmw_user_bo_noref_release();
+	ttm_bo_put(&vmw_bo->base);
 	if (unlikely(ret != 0))
 		return ret;
 
@@ -2024,8 +2006,9 @@ static int vmw_cmd_set_shader(struct vmw_private *dev_priv,
 		res = vmw_shader_lookup(vmw_context_res_man(ctx),
 					cmd->body.shid, cmd->body.type);
 		if (!IS_ERR(res)) {
-			ret = vmw_execbuf_res_noctx_val_add(sw_context, res,
-							    VMW_RES_DIRTY_NONE);
+			ret = vmw_execbuf_res_val_add(sw_context, res,
+						      VMW_RES_DIRTY_NONE,
+						      vmw_val_add_flag_noctx);
 			if (unlikely(ret != 0))
 				return ret;
 
@@ -2227,8 +2210,9 @@ static int vmw_cmd_dx_set_shader(struct vmw_private *dev_priv,
 			return PTR_ERR(res);
 		}
 
-		ret = vmw_execbuf_res_noctx_val_add(sw_context, res,
-						    VMW_RES_DIRTY_NONE);
+		ret = vmw_execbuf_res_val_add(sw_context, res,
+					      VMW_RES_DIRTY_NONE,
+					      vmw_val_add_flag_noctx);
 		if (ret)
 			return ret;
 	}
@@ -2735,8 +2719,8 @@ static int vmw_cmd_dx_bind_shader(struct vmw_private *dev_priv,
 		return PTR_ERR(res);
 	}
 
-	ret = vmw_execbuf_res_noctx_val_add(sw_context, res,
-					    VMW_RES_DIRTY_NONE);
+	ret = vmw_execbuf_res_val_add(sw_context, res, VMW_RES_DIRTY_NONE,
+				      vmw_val_add_flag_noctx);
 	if (ret) {
 		VMW_DEBUG_USER("Error creating resource validation node.\n");
 		return ret;
@@ -3058,8 +3042,8 @@ static int vmw_cmd_dx_bind_streamoutput(struct vmw_private *dev_priv,
 
 	vmw_dx_streamoutput_set_size(res, cmd->body.sizeInBytes);
 
-	ret = vmw_execbuf_res_noctx_val_add(sw_context, res,
-					    VMW_RES_DIRTY_NONE);
+	ret = vmw_execbuf_res_val_add(sw_context, res, VMW_RES_DIRTY_NONE,
+				      vmw_val_add_flag_noctx);
 	if (ret) {
 		DRM_ERROR("Error creating resource validation node.\n");
 		return ret;
@@ -3108,8 +3092,8 @@ static int vmw_cmd_dx_set_streamoutput(struct vmw_private *dev_priv,
 		return 0;
 	}
 
-	ret = vmw_execbuf_res_noctx_val_add(sw_context, res,
-					    VMW_RES_DIRTY_NONE);
+	ret = vmw_execbuf_res_val_add(sw_context, res, VMW_RES_DIRTY_NONE,
+				      vmw_val_add_flag_noctx);
 	if (ret) {
 		DRM_ERROR("Error creating resource validation node.\n");
 		return ret;
@@ -4008,22 +3992,26 @@ static int vmw_execbuf_tie_context(struct vmw_private *dev_priv,
 	if (ret)
 		return ret;
 
-	res = vmw_user_resource_noref_lookup_handle
+	ret = vmw_user_resource_lookup_handle
 		(dev_priv, sw_context->fp->tfile, handle,
-		 user_context_converter);
-	if (IS_ERR(res)) {
+		 user_context_converter, &res);
+	if (ret != 0) {
 		VMW_DEBUG_USER("Could not find or user DX context 0x%08x.\n",
 			       (unsigned int) handle);
-		return PTR_ERR(res);
+		return ret;
 	}
 
-	ret = vmw_execbuf_res_noref_val_add(sw_context, res, VMW_RES_DIRTY_SET);
-	if (unlikely(ret != 0))
+	ret = vmw_execbuf_res_val_add(sw_context, res, VMW_RES_DIRTY_SET,
+				      vmw_val_add_flag_none);
+	if (unlikely(ret != 0)) {
+		vmw_resource_unreference(&res);
 		return ret;
+	}
 
 	sw_context->dx_ctx_node = vmw_execbuf_info_from_res(sw_context, res);
 	sw_context->man = vmw_context_res_man(res);
 
+	vmw_resource_unreference(&res);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 26f88d64879f..64f9f407752b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -282,41 +282,6 @@ int vmw_user_resource_lookup_handle(struct vmw_private *dev_priv,
 	return ret;
 }
 
-/**
- * vmw_user_resource_lookup_handle - lookup a struct resource from a
- * TTM user-space handle and perform basic type checks
- *
- * @dev_priv:     Pointer to a device private struct
- * @tfile:        Pointer to a struct ttm_object_file identifying the caller
- * @handle:       The TTM user-space handle
- * @converter:    Pointer to an object describing the resource type
- * @p_res:        On successful return the location pointed to will contain
- *                a pointer to a refcounted struct vmw_resource.
- *
- * If the handle can't be found or is associated with an incorrect resource
- * type, -EINVAL will be returned.
- */
-struct vmw_resource *
-vmw_user_resource_noref_lookup_handle(struct vmw_private *dev_priv,
-				      struct ttm_object_file *tfile,
-				      uint32_t handle,
-				      const struct vmw_user_resource_conv
-				      *converter)
-{
-	struct ttm_base_object *base;
-
-	base = ttm_base_object_noref_lookup(tfile, handle);
-	if (!base)
-		return ERR_PTR(-ESRCH);
-
-	if (unlikely(ttm_base_object_type(base) != converter->object_type)) {
-		ttm_base_object_noref_release();
-		return ERR_PTR(-EINVAL);
-	}
-
-	return converter->base_obj_to_res(base);
-}
-
 /**
  * Helper function that looks either a surface or bo.
  *
diff --git a/include/drm/drm_hashtab.h b/include/drm/drm_hashtab.h
index bb95ff011baf..fe5ad4793a15 100644
--- a/include/drm/drm_hashtab.h
+++ b/include/drm/drm_hashtab.h
@@ -49,6 +49,8 @@ struct drm_open_hash {
 	u8 order;
 };
 
+struct hlist_node *drm_ht_find_key(struct drm_open_hash *ht, unsigned long key);
+
 int drm_ht_create(struct drm_open_hash *ht, unsigned int order);
 int drm_ht_insert_item(struct drm_open_hash *ht, struct drm_hash_item *item);
 int drm_ht_just_insert_please(struct drm_open_hash *ht, struct drm_hash_item *item,
-- 
2.34.1

