Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 248BD608414
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 06:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E9CA10E2CC;
	Sat, 22 Oct 2022 04:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC5F10E143
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 04:02:44 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B9B3533EEF3;
 Sat, 22 Oct 2022 05:02:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666411363; bh=tkHHTMd3CYpKx1IzqCAGWe3ri4vRKu6RgiaBhb/0Z1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EPfMGuWte19SkLCAHIpdx+x8urj+BhF7VLjE04r4B2m66egIK7Td1JZN6tjJDXLUr
 RSZEvjIKTvD9leGSGXQS4dzLY/eMVXLZs1IakPoKmrK+3cd+FbVicfeKg0wZbKEqRu
 9gpP1e+PMB6AIBF7qI05bWNkelYoS4cJhf21mPW/wghrvkq5qjW7BkgVL8Xx3wyaUP
 8Yxa3NIV+UwoPB866K3pK7eQC97w9H3cwT6OFPw0mGqdtoDpo+RpRvbrdOT32awyqI
 tzLXBTz+ZLH/uGilNs6qenhBKWEol+cwDB84TPybmAik3vvNwoq3EpRkIy+cXxfBBz
 m3Yt6R8kcz45A==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/17] drm/vmwgfx: Remove ttm object hashtable
Date: Sat, 22 Oct 2022 00:02:23 -0400
Message-Id: <20221022040236.616490-5-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221022040236.616490-1-zack@kde.org>
References: <20221022040236.616490-1-zack@kde.org>
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

The object_hash hashtable for ttm objects is not being used.
Remove it and perform refactoring in ttm_object init function.

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/ttm_object.c | 24 ++++++------------------
 drivers/gpu/drm/vmwgfx/ttm_object.h |  6 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  2 +-
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 26a55fef1ab5..9546b121bc22 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 OR MIT */
 /**************************************************************************
  *
- * Copyright (c) 2009-2013 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2009-2022 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -44,13 +44,14 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include "ttm_object.h"
+#include "vmwgfx_drv.h"
+
 #include <linux/list.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/module.h>
-#include "ttm_object.h"
-#include "vmwgfx_drv.h"
 
 MODULE_IMPORT_NS(DMA_BUF);
 
@@ -81,9 +82,7 @@ struct ttm_object_file {
 /*
  * struct ttm_object_device
  *
- * @object_lock: lock that protects the object_hash hash table.
- *
- * @object_hash: hash table for fast lookup of object global names.
+ * @object_lock: lock that protects idr.
  *
  * @object_count: Per device object count.
  *
@@ -92,7 +91,6 @@ struct ttm_object_file {
 
 struct ttm_object_device {
 	spinlock_t object_lock;
-	struct vmwgfx_open_hash object_hash;
 	atomic_t object_count;
 	struct dma_buf_ops ops;
 	void (*dmabuf_release)(struct dma_buf *dma_buf);
@@ -449,20 +447,15 @@ struct ttm_object_file *ttm_object_file_init(struct ttm_object_device *tdev,
 }
 
 struct ttm_object_device *
-ttm_object_device_init(unsigned int hash_order,
-		       const struct dma_buf_ops *ops)
+ttm_object_device_init(const struct dma_buf_ops *ops)
 {
 	struct ttm_object_device *tdev = kmalloc(sizeof(*tdev), GFP_KERNEL);
-	int ret;
 
 	if (unlikely(tdev == NULL))
 		return NULL;
 
 	spin_lock_init(&tdev->object_lock);
 	atomic_set(&tdev->object_count, 0);
-	ret = vmwgfx_ht_create(&tdev->object_hash, hash_order);
-	if (ret != 0)
-		goto out_no_object_hash;
 
 	/*
 	 * Our base is at VMWGFX_NUM_MOB + 1 because we want to create
@@ -477,10 +470,6 @@ ttm_object_device_init(unsigned int hash_order,
 	tdev->dmabuf_release = tdev->ops.release;
 	tdev->ops.release = ttm_prime_dmabuf_release;
 	return tdev;
-
-out_no_object_hash:
-	kfree(tdev);
-	return NULL;
 }
 
 void ttm_object_device_release(struct ttm_object_device **p_tdev)
@@ -491,7 +480,6 @@ void ttm_object_device_release(struct ttm_object_device **p_tdev)
 
 	WARN_ON_ONCE(!idr_is_empty(&tdev->idr));
 	idr_destroy(&tdev->idr);
-	vmwgfx_ht_remove(&tdev->object_hash);
 
 	kfree(tdev);
 }
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.h b/drivers/gpu/drm/vmwgfx/ttm_object.h
index 1a2fa0f83f5f..6870f951b677 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.h
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.h
@@ -1,6 +1,6 @@
 /**************************************************************************
  *
- * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
+ * Copyright (c) 2006-2022 VMware, Inc., Palo Alto, CA., USA
  * All Rights Reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
@@ -262,7 +262,6 @@ extern void ttm_object_file_release(struct ttm_object_file **p_tfile);
 /**
  * ttm_object device init - initialize a struct ttm_object_device
  *
- * @hash_order: Order of hash table used to hash the base objects.
  * @ops: DMA buf ops for prime objects of this device.
  *
  * This function is typically called on device initialization to prepare
@@ -270,8 +269,7 @@ extern void ttm_object_file_release(struct ttm_object_file **p_tfile);
  */
 
 extern struct ttm_object_device *
-ttm_object_device_init(unsigned int hash_order,
-		       const struct dma_buf_ops *ops);
+ttm_object_device_init(const struct dma_buf_ops *ops);
 
 /**
  * ttm_object_device_release - release data held by a ttm_object_device
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 45028e25d490..13b90273eb77 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -994,7 +994,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 		goto out_err0;
 	}
 
-	dev_priv->tdev = ttm_object_device_init(12, &vmw_prime_dmabuf_ops);
+	dev_priv->tdev = ttm_object_device_init(&vmw_prime_dmabuf_ops);
 
 	if (unlikely(dev_priv->tdev == NULL)) {
 		drm_err(&dev_priv->drm,
-- 
2.34.1

