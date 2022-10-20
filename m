Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48005605600
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505BF10E2DE;
	Thu, 20 Oct 2022 03:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD78110E26D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 03:41:40 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1487B33EF84;
 Thu, 20 Oct 2022 04:41:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666237299; bh=JvNQFdxhh6ZME9oA9Ow+NmC92SCTJVGtJjc25oOvfU8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NhoqnQ9TPEpFELc3ckLJWW01yWVjz6WflyTfnQtZg3HbyJqfdsqKq3YKblXBwM0Bc
 BZjZ2zUReT1qy3nQVkRqRVCny/2e7sbiDqEzEmha6ZWhB4+TRkAM+hY9wTYIED+7d+
 5pQDR0gBVjkUg0v0xlF7deoxfk4x1iZXcY+WoaKy3DNUxYxYiuuFWCy6MBiQrBs7Sq
 46yvyfyfkJqqHnIKy+RD1s3ue1vHyJJ0xlqL5J8Vyreby1AH0mCT7MDeMPruwhYMWO
 C/DMiEO9V90XnWUze3+ZAEVLiNQy0ArJ3WOQyRFqig18rKbggZ6Z1HN0eb8S51AzC6
 s/RNHe/xkUgBQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/16] drm/vmwgfx: Refactor resource manager's hashtable to
 use linux/hashtable implementation.
Date: Wed, 19 Oct 2022 23:41:18 -0400
Message-Id: <20221020034131.491973-4-zack@kde.org>
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

Vmwgfx's hashtab implementation needs to be replaced with linux/hashtable
to reduce maintenance burden.
Refactor cmdbuf resource manager to use linux/hashtable.h implementation
as part of this effort.

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c | 62 +++++++++-------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
index 82ef58ccdd42..142aef686fcd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**************************************************************************
  *
- * Copyright 2014-2015 VMware, Inc., Palo Alto, CA., USA
+ * Copyright 2014-2022 VMware, Inc., Palo Alto, CA., USA
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the
@@ -28,6 +28,8 @@
 #include "vmwgfx_drv.h"
 #include "vmwgfx_resource_priv.h"
 
+#include <linux/hashtable.h>
+
 #define VMW_CMDBUF_RES_MAN_HT_ORDER 12
 
 /**
@@ -59,7 +61,7 @@ struct vmw_cmdbuf_res {
  * @resources and @list are protected by the cmdbuf mutex for now.
  */
 struct vmw_cmdbuf_res_manager {
-	struct vmwgfx_open_hash resources;
+	DECLARE_HASHTABLE(resources, VMW_CMDBUF_RES_MAN_HT_ORDER);
 	struct list_head list;
 	struct vmw_private *dev_priv;
 };
@@ -82,14 +84,13 @@ vmw_cmdbuf_res_lookup(struct vmw_cmdbuf_res_manager *man,
 		      u32 user_key)
 {
 	struct vmwgfx_hash_item *hash;
-	int ret;
 	unsigned long key = user_key | (res_type << 24);
 
-	ret = vmwgfx_ht_find_item(&man->resources, key, &hash);
-	if (unlikely(ret != 0))
-		return ERR_PTR(ret);
-
-	return drm_hash_entry(hash, struct vmw_cmdbuf_res, hash)->res;
+	hash_for_each_possible_rcu(man->resources, hash, head, key) {
+		if (hash->key == key)
+			return drm_hash_entry(hash, struct vmw_cmdbuf_res, hash)->res;
+	}
+	return ERR_PTR(-EINVAL);
 }
 
 /**
@@ -105,7 +106,7 @@ static void vmw_cmdbuf_res_free(struct vmw_cmdbuf_res_manager *man,
 				struct vmw_cmdbuf_res *entry)
 {
 	list_del(&entry->head);
-	WARN_ON(vmwgfx_ht_remove_item(&man->resources, &entry->hash));
+	hash_del_rcu(&entry->hash.head);
 	vmw_resource_unreference(&entry->res);
 	kfree(entry);
 }
@@ -159,7 +160,6 @@ void vmw_cmdbuf_res_commit(struct list_head *list)
 void vmw_cmdbuf_res_revert(struct list_head *list)
 {
 	struct vmw_cmdbuf_res *entry, *next;
-	int ret;
 
 	list_for_each_entry_safe(entry, next, list, head) {
 		switch (entry->state) {
@@ -167,8 +167,8 @@ void vmw_cmdbuf_res_revert(struct list_head *list)
 			vmw_cmdbuf_res_free(entry->man, entry);
 			break;
 		case VMW_CMDBUF_RES_DEL:
-			ret = vmwgfx_ht_insert_item(&entry->man->resources, &entry->hash);
-			BUG_ON(ret);
+			hash_add_rcu(entry->man->resources, &entry->hash.head,
+						entry->hash.key);
 			list_move_tail(&entry->head, &entry->man->list);
 			entry->state = VMW_CMDBUF_RES_COMMITTED;
 			break;
@@ -199,26 +199,20 @@ int vmw_cmdbuf_res_add(struct vmw_cmdbuf_res_manager *man,
 		       struct list_head *list)
 {
 	struct vmw_cmdbuf_res *cres;
-	int ret;
 
 	cres = kzalloc(sizeof(*cres), GFP_KERNEL);
 	if (unlikely(!cres))
 		return -ENOMEM;
 
 	cres->hash.key = user_key | (res_type << 24);
-	ret = vmwgfx_ht_insert_item(&man->resources, &cres->hash);
-	if (unlikely(ret != 0)) {
-		kfree(cres);
-		goto out_invalid_key;
-	}
+	hash_add_rcu(man->resources, &cres->hash.head, cres->hash.key);
 
 	cres->state = VMW_CMDBUF_RES_ADD;
 	cres->res = vmw_resource_reference(res);
 	cres->man = man;
 	list_add_tail(&cres->head, list);
 
-out_invalid_key:
-	return ret;
+	return 0;
 }
 
 /**
@@ -243,24 +237,26 @@ int vmw_cmdbuf_res_remove(struct vmw_cmdbuf_res_manager *man,
 			  struct list_head *list,
 			  struct vmw_resource **res_p)
 {
-	struct vmw_cmdbuf_res *entry;
+	struct vmw_cmdbuf_res *entry = NULL;
 	struct vmwgfx_hash_item *hash;
-	int ret;
+	unsigned long key = user_key | (res_type << 24);
 
-	ret = vmwgfx_ht_find_item(&man->resources, user_key | (res_type << 24),
-			       &hash);
-	if (likely(ret != 0))
+	hash_for_each_possible_rcu(man->resources, hash, head, key) {
+		if (hash->key == key) {
+			entry = drm_hash_entry(hash, struct vmw_cmdbuf_res, hash);
+			break;
+		}
+	}
+	if (unlikely(!entry))
 		return -EINVAL;
 
-	entry = drm_hash_entry(hash, struct vmw_cmdbuf_res, hash);
-
 	switch (entry->state) {
 	case VMW_CMDBUF_RES_ADD:
 		vmw_cmdbuf_res_free(man, entry);
 		*res_p = NULL;
 		break;
 	case VMW_CMDBUF_RES_COMMITTED:
-		(void) vmwgfx_ht_remove_item(&man->resources, &entry->hash);
+		hash_del_rcu(&entry->hash.head);
 		list_del(&entry->head);
 		entry->state = VMW_CMDBUF_RES_DEL;
 		list_add_tail(&entry->head, list);
@@ -287,7 +283,6 @@ struct vmw_cmdbuf_res_manager *
 vmw_cmdbuf_res_man_create(struct vmw_private *dev_priv)
 {
 	struct vmw_cmdbuf_res_manager *man;
-	int ret;
 
 	man = kzalloc(sizeof(*man), GFP_KERNEL);
 	if (!man)
@@ -295,12 +290,8 @@ vmw_cmdbuf_res_man_create(struct vmw_private *dev_priv)
 
 	man->dev_priv = dev_priv;
 	INIT_LIST_HEAD(&man->list);
-	ret = vmwgfx_ht_create(&man->resources, VMW_CMDBUF_RES_MAN_HT_ORDER);
-	if (ret == 0)
-		return man;
-
-	kfree(man);
-	return ERR_PTR(ret);
+	hash_init(man->resources);
+	return man;
 }
 
 /**
@@ -320,7 +311,6 @@ void vmw_cmdbuf_res_man_destroy(struct vmw_cmdbuf_res_manager *man)
 	list_for_each_entry_safe(entry, next, &man->list, head)
 		vmw_cmdbuf_res_free(man, entry);
 
-	vmwgfx_ht_remove(&man->resources);
 	kfree(man);
 }
 
-- 
2.34.1

