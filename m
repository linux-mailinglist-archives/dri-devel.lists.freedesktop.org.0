Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DA605602
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F2D10E300;
	Thu, 20 Oct 2022 03:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D7110E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 03:41:46 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 6F5F733EF8B;
 Thu, 20 Oct 2022 04:41:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666237305; bh=7IpdcOCS1CRP3vgr5/W1k3ows5BLR0ZFDpwpgZQSAZc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPGT1LF/YbsZsQFGDUmbQKaTOzStsxgEiON1MsgQmXJ5HIImXsV+iQaGzDhPBTSHB
 tEFEC2JrVhtzW2B9vAq/CHkgLU24Gwm/xMyO4KqrgeQ+l4l2YsDAisfKmxK+l2xv15
 5a06v+20411e8YEq8RF/2jGFVMCPuWEeZXuonX+/7m6eYpmlCXwA9OIJJtpYdX4cwa
 EExFQ2jM5rA2NYyIvCYgiNJ+GvQaPy3i2plrkUHoKJGR7UiSqbt0DipF1fhqOaVoAs
 IYbGgedUJHKrfn3V/EsAT+1pOtAQIxrx02/es+5r3LvRNzThb0xFRWTVEuRfKX8rqA
 o+f7mDNDtwjMg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/16] drm/vmwgfx: Refactor ttm reference object hashtable
 to use linux/hashtable.
Date: Wed, 19 Oct 2022 23:41:25 -0400
Message-Id: <20221020034131.491973-11-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020034131.491973-1-zack@kde.org>
References: <20221020034131.491973-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maaz Mombasawala <mombasawalam@vmware.com>

This is part of an effort to move from the vmwgfx_open_hash hashtable to
linux/hashtable implementation.
Refactor the ref_hash hashtable, used for fast lookup of reference objects
associated with a ttm file.
This also exposed a problem related to inconsistently using 32-bit and
64-bit keys with this hashtable. The hash function used changes depending
on the size of the type, and results are not consistent across numbers,
for example, hash_32(329) = 329, but hash_long(329) = 328. This would
cause the lookup to fail for objects already in the hashtable, since keys
of different sizes were being passed during adding and lookup. This was
not an issue before because vmwgfx_open_hash always used hash_long.
Fix this by always using 64-bit keys for this hashtable, which means that
hash_long is always used.

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c | 91 ++++++++++++++++-------------
 drivers/gpu/drm/vmwgfx/ttm_object.h | 12 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  2 +-
 3 files changed, 56 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 9546b121bc22..c07b81fbc495 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -52,9 +52,12 @@
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/module.h>
+#include <linux/hashtable.h>
 
 MODULE_IMPORT_NS(DMA_BUF);
 
+#define VMW_TTM_OBJECT_REF_HT_ORDER 10
+
 /**
  * struct ttm_object_file
  *
@@ -75,7 +78,7 @@ struct ttm_object_file {
 	struct ttm_object_device *tdev;
 	spinlock_t lock;
 	struct list_head ref_list;
-	struct vmwgfx_open_hash ref_hash;
+	DECLARE_HASHTABLE(ref_hash, VMW_TTM_OBJECT_REF_HT_ORDER);
 	struct kref refcount;
 };
 
@@ -136,6 +139,36 @@ ttm_object_file_ref(struct ttm_object_file *tfile)
 	return tfile;
 }
 
+static int ttm_tfile_find_ref_rcu(struct ttm_object_file *tfile,
+				  uint64_t key,
+				  struct vmwgfx_hash_item **p_hash)
+{
+	struct vmwgfx_hash_item *hash;
+
+	hash_for_each_possible_rcu(tfile->ref_hash, hash, head, key) {
+		if (hash->key == key) {
+			*p_hash = hash;
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
+static int ttm_tfile_find_ref(struct ttm_object_file *tfile,
+			      uint64_t key,
+			      struct vmwgfx_hash_item **p_hash)
+{
+	struct vmwgfx_hash_item *hash;
+
+	hash_for_each_possible(tfile->ref_hash, hash, head, key) {
+		if (hash->key == key) {
+			*p_hash = hash;
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
 static void ttm_object_file_destroy(struct kref *kref)
 {
 	struct ttm_object_file *tfile =
@@ -238,14 +271,13 @@ void ttm_base_object_unref(struct ttm_base_object **p_base)
  * Return: A pointer to the object if successful or NULL otherwise.
  */
 struct ttm_base_object *
-ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint32_t key)
+ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint64_t key)
 {
 	struct vmwgfx_hash_item *hash;
-	struct vmwgfx_open_hash *ht = &tfile->ref_hash;
 	int ret;
 
 	rcu_read_lock();
-	ret = vmwgfx_ht_find_item_rcu(ht, key, &hash);
+	ret = ttm_tfile_find_ref_rcu(tfile, key, &hash);
 	if (ret) {
 		rcu_read_unlock();
 		return NULL;
@@ -257,15 +289,14 @@ ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint32_t key)
 EXPORT_SYMBOL(ttm_base_object_noref_lookup);
 
 struct ttm_base_object *ttm_base_object_lookup(struct ttm_object_file *tfile,
-					       uint32_t key)
+					       uint64_t key)
 {
 	struct ttm_base_object *base = NULL;
 	struct vmwgfx_hash_item *hash;
-	struct vmwgfx_open_hash *ht = &tfile->ref_hash;
 	int ret;
 
 	rcu_read_lock();
-	ret = vmwgfx_ht_find_item_rcu(ht, key, &hash);
+	ret = ttm_tfile_find_ref_rcu(tfile, key, &hash);
 
 	if (likely(ret == 0)) {
 		base = drm_hash_entry(hash, struct ttm_ref_object, hash)->obj;
@@ -278,7 +309,7 @@ struct ttm_base_object *ttm_base_object_lookup(struct ttm_object_file *tfile,
 }
 
 struct ttm_base_object *
-ttm_base_object_lookup_for_ref(struct ttm_object_device *tdev, uint32_t key)
+ttm_base_object_lookup_for_ref(struct ttm_object_device *tdev, uint64_t key)
 {
 	struct ttm_base_object *base;
 
@@ -297,7 +328,6 @@ int ttm_ref_object_add(struct ttm_object_file *tfile,
 		       bool *existed,
 		       bool require_existed)
 {
-	struct vmwgfx_open_hash *ht = &tfile->ref_hash;
 	struct ttm_ref_object *ref;
 	struct vmwgfx_hash_item *hash;
 	int ret = -EINVAL;
@@ -310,7 +340,7 @@ int ttm_ref_object_add(struct ttm_object_file *tfile,
 
 	while (ret == -EINVAL) {
 		rcu_read_lock();
-		ret = vmwgfx_ht_find_item_rcu(ht, base->handle, &hash);
+		ret = ttm_tfile_find_ref_rcu(tfile, base->handle, &hash);
 
 		if (ret == 0) {
 			ref = drm_hash_entry(hash, struct ttm_ref_object, hash);
@@ -335,21 +365,14 @@ int ttm_ref_object_add(struct ttm_object_file *tfile,
 		kref_init(&ref->kref);
 
 		spin_lock(&tfile->lock);
-		ret = vmwgfx_ht_insert_item_rcu(ht, &ref->hash);
-
-		if (likely(ret == 0)) {
-			list_add_tail(&ref->head, &tfile->ref_list);
-			kref_get(&base->refcount);
-			spin_unlock(&tfile->lock);
-			if (existed != NULL)
-				*existed = false;
-			break;
-		}
+		hash_add_rcu(tfile->ref_hash, &ref->hash.head, ref->hash.key);
+		ret = 0;
 
+		list_add_tail(&ref->head, &tfile->ref_list);
+		kref_get(&base->refcount);
 		spin_unlock(&tfile->lock);
-		BUG_ON(ret != -EINVAL);
-
-		kfree(ref);
+		if (existed != NULL)
+			*existed = false;
 	}
 
 	return ret;
@@ -361,10 +384,8 @@ ttm_ref_object_release(struct kref *kref)
 	struct ttm_ref_object *ref =
 	    container_of(kref, struct ttm_ref_object, kref);
 	struct ttm_object_file *tfile = ref->tfile;
-	struct vmwgfx_open_hash *ht;
 
-	ht = &tfile->ref_hash;
-	(void)vmwgfx_ht_remove_item_rcu(ht, &ref->hash);
+	hash_del_rcu(&ref->hash.head);
 	list_del(&ref->head);
 	spin_unlock(&tfile->lock);
 
@@ -376,13 +397,12 @@ ttm_ref_object_release(struct kref *kref)
 int ttm_ref_object_base_unref(struct ttm_object_file *tfile,
 			      unsigned long key)
 {
-	struct vmwgfx_open_hash *ht = &tfile->ref_hash;
 	struct ttm_ref_object *ref;
 	struct vmwgfx_hash_item *hash;
 	int ret;
 
 	spin_lock(&tfile->lock);
-	ret = vmwgfx_ht_find_item(ht, key, &hash);
+	ret = ttm_tfile_find_ref(tfile, key, &hash);
 	if (unlikely(ret != 0)) {
 		spin_unlock(&tfile->lock);
 		return -EINVAL;
@@ -414,16 +434,13 @@ void ttm_object_file_release(struct ttm_object_file **p_tfile)
 	}
 
 	spin_unlock(&tfile->lock);
-	vmwgfx_ht_remove(&tfile->ref_hash);
 
 	ttm_object_file_unref(&tfile);
 }
 
-struct ttm_object_file *ttm_object_file_init(struct ttm_object_device *tdev,
-					     unsigned int hash_order)
+struct ttm_object_file *ttm_object_file_init(struct ttm_object_device *tdev)
 {
 	struct ttm_object_file *tfile = kmalloc(sizeof(*tfile), GFP_KERNEL);
-	int ret;
 
 	if (unlikely(tfile == NULL))
 		return NULL;
@@ -433,17 +450,9 @@ struct ttm_object_file *ttm_object_file_init(struct ttm_object_device *tdev,
 	kref_init(&tfile->refcount);
 	INIT_LIST_HEAD(&tfile->ref_list);
 
-	ret = vmwgfx_ht_create(&tfile->ref_hash, hash_order);
-	if (ret)
-		goto out_err;
+	hash_init(tfile->ref_hash);
 
 	return tfile;
-out_err:
-	vmwgfx_ht_remove(&tfile->ref_hash);
-
-	kfree(tfile);
-
-	return NULL;
 }
 
 struct ttm_object_device *
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx/ttm_object.h
index 6870f951b677..67f30d589e27 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@ -104,7 +104,7 @@ struct ttm_base_object {
 	struct ttm_object_file *tfile;
 	struct kref refcount;
 	void (*refcount_release) (struct ttm_base_object **base);
-	u32 handle;
+	u64 handle;
 	enum ttm_object_type object_type;
 	u32 shareable;
 };
@@ -164,7 +164,7 @@ extern int ttm_base_object_init(struct ttm_object_file *tfile,
  */
 
 extern struct ttm_base_object *ttm_base_object_lookup(struct ttm_object_file
-						      *tfile, uint32_t key);
+						      *tfile, uint64_t key);
 
 /**
  * ttm_base_object_lookup_for_ref
@@ -178,7 +178,7 @@ extern struct ttm_base_object *ttm_base_object_lookup(struct ttm_object_file
  */
 
 extern struct ttm_base_object *
-ttm_base_object_lookup_for_ref(struct ttm_object_device *tdev, uint32_t key);
+ttm_base_object_lookup_for_ref(struct ttm_object_device *tdev, uint64_t key);
 
 /**
  * ttm_base_object_unref
@@ -237,14 +237,12 @@ extern int ttm_ref_object_base_unref(struct ttm_object_file *tfile,
  * ttm_object_file_init - initialize a struct ttm_object file
  *
  * @tdev: A struct ttm_object device this file is initialized on.
- * @hash_order: Order of the hash table used to hold the reference objects.
  *
  * This is typically called by the file_ops::open function.
  */
 
 extern struct ttm_object_file *ttm_object_file_init(struct ttm_object_device
-						    *tdev,
-						    unsigned int hash_order);
+						    *tdev);
 
 /**
  * ttm_object_file_release - release data held by a ttm_object_file
@@ -312,7 +310,7 @@ extern int ttm_prime_handle_to_fd(struct ttm_object_file *tfile,
 	kfree_rcu(__obj, __prime.base.rhead)
 
 struct ttm_base_object *
-ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint32_t key);
+ttm_base_object_noref_lookup(struct ttm_object_file *tfile, uint64_t key);
 
 /**
  * ttm_base_object_noref_release - release a base object pointer looked up
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8d77e79bd904..b909a3ce9af3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1242,7 +1242,7 @@ static int vmw_driver_open(struct drm_device *dev, struct drm_file *file_priv)
 	if (unlikely(!vmw_fp))
 		return ret;
 
-	vmw_fp->tfile = ttm_object_file_init(dev_priv->tdev, 10);
+	vmw_fp->tfile = ttm_object_file_init(dev_priv->tdev);
 	if (unlikely(vmw_fp->tfile == NULL))
 		goto out_no_tfile;
 
-- 
2.34.1

