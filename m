Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8016970637
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1623410E25B;
	Sun,  8 Sep 2024 09:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="JbyS3Zit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C0C10E25A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:45:13 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HC6Iju8dIkyfpy9CDYJG0kJXm9WJsC4dOo5lTDlPg4g=;
 b=JbyS3ZitulW+NewFD4u6nKGUJ6mpepK0hTLF3j0ysTLG2gMvwSVg9d/saoeplK/mb2Gw6n
 CgUdW8k44qwGjb8mEhS5O4pfqARHQgo0pZu3zZyBxJ8PNZH5ll7mFDG4d9TbPVUNIYeUro
 cyxTi/pN1u/oQ7vj4mJMTwatn4SAgnQ=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 16/19] drm/etnaviv: Call etnaviv_gem_obj_add() in
 ernaviv_gem_new_private()
Date: Sun,  8 Sep 2024 17:43:54 +0800
Message-ID: <20240908094357.291862-17-sui.jingfeng@linux.dev>
In-Reply-To: <20240908094357.291862-1-sui.jingfeng@linux.dev>
References: <20240908094357.291862-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

The etnaviv_gem_obj_add() a common operation, the 'etnaviv_drm_private::
gem_list' is being used to record(track) all of the etnaviv GEM buffer
object created in this driver.

Once a etnaviv GEM buffer object has been allocated successfully, we
should add it into the global etnaviv_drm_private::gem_list'. Because
we need to free it and remove it free the list if the invoke of the
subsequent functions fail.

The only way that destroy etnaviv GEM buffer object is the implementation
of etnaviv_gem_free_object() function. The etnaviv_gem_free_object() first
remove the etnaviv GEM object from the list, then destroy its mapping and
finally free its memory footprint. Therefore, in order to corresponding
this, we add the freshly created etnaviv GEM buffer object immediately
after it was successfully created.

A benifit is that we only need to call etnaviv_gem_obj_add() once now,
since the ernaviv_gem_new_private() has been unified. Make the
etnaviv_gem_obj_add() static is a next nature thing.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 8 +++-----
 drivers/gpu/drm/etnaviv/etnaviv_gem.h       | 1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 2 --
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 27e4a93c981c..ee799c02d0aa 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -584,7 +584,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 	kfree(etnaviv_obj);
 }
 
-void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
+static void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj)
 {
 	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
 	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
@@ -719,8 +719,6 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	 */
 	mapping_set_gfp_mask(obj->filp->f_mapping, priv->shm_gfp_mask);
 
-	etnaviv_gem_obj_add(dev, obj);
-
 	ret = drm_gem_handle_create(file, obj, handle);
 
 	/* drop reference from allocate - handle holds it now */
@@ -751,6 +749,8 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
 		drm_gem_private_object_init(dev, obj, size);
 	}
 
+	etnaviv_gem_obj_add(dev, obj);
+
 	*res = to_etnaviv_bo(obj);
 
 	return 0;
@@ -849,8 +849,6 @@ int etnaviv_gem_new_userptr(struct drm_device *dev, struct drm_file *file,
 	etnaviv_obj->userptr.mm = current->mm;
 	etnaviv_obj->userptr.ro = !(flags & ETNA_USERPTR_WRITE);
 
-	etnaviv_gem_obj_add(dev, &etnaviv_obj->base);
-
 	ret = drm_gem_handle_create(file, &etnaviv_obj->base, handle);
 
 	/* drop reference from allocate - handle holds it now */
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index b174a9e4cc48..8d8fc5b3a541 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -121,7 +121,6 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
 			    bool shmem, const struct etnaviv_gem_ops *ops,
 			    struct etnaviv_gem_object **res);
 
-void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj);
 struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *obj);
 void etnaviv_gem_put_pages(struct etnaviv_gem_object *obj);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 64a858a0b0cf..04ee31461b8c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -127,8 +127,6 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	if (ret)
 		goto fail;
 
-	etnaviv_gem_obj_add(dev, &etnaviv_obj->base);
-
 	return &etnaviv_obj->base;
 
 fail:
-- 
2.43.0

