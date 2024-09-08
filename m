Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B1D970635
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0514E10E259;
	Sun,  8 Sep 2024 09:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="c7frMs6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F48710E258
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:45:09 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9vnlv8ASleXaOIgr3QjoTFJAHyOgr/prPxvxoVqxKQ=;
 b=c7frMs6oo+hCa4BjXHxxZlXGxi3F/d+F/q+KPpzDrIoiDsGdqheZ3VlG4GJ3o8gO+ZBpKz
 2zD9sqSKhVA/bfgqO6U9TRc4wZhbLteM7P06TtFSIYeDqc1N2arRqOU0GH4rJgWeEAjx2N
 gh7ohmSQZYZhukQyKHWQVmFX/XR0Mqk=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 15/19] drm/etnaviv: Make more use of the
 etnaviv_gem_new_private() function
Date: Sun,  8 Sep 2024 17:43:53 +0800
Message-ID: <20240908094357.291862-16-sui.jingfeng@linux.dev>
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

Add the 'bool shmem' as the 4th argument of etnaviv_gem_new_private(),
then call etnaviv_gem_new_handle() to allocate the etnaviv_gem_object
instance for us.

A small benefit is to reduce code duplication across different etnaviv
GEM buffer objects. This allow us to reuse etnaviv_gem_new_private()
everywhere, increasing code reusage.

We also should call drm_gem_private_object_fini() to uninitialize an
already allocated GEM object when it initialized failed. Now
etnaviv_gem_new_private() handle this trouble for us, the upper caller
can just use it, no need to worry about error handling anymore.

if true, the drm_gem_object_init() will allocate backing storage for us,
then this is a shmem buffer object. if false, we have to implement driver
specific backing storage.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 28 +++++++++++++--------
 drivers/gpu/drm/etnaviv/etnaviv_gem.h       |  4 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  2 +-
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 3732288ff530..27e4a93c981c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -697,21 +697,20 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 	u32 size, u32 flags, u32 *handle)
 {
 	struct etnaviv_drm_private *priv = to_etnaviv_priv(dev);
-	struct drm_gem_object *obj = NULL;
+	struct etnaviv_gem_object *etnaviv_obj;
+	struct drm_gem_object *obj;
 	int ret;
 
 	size = PAGE_ALIGN(size);
 
-	ret = etnaviv_gem_new_impl(dev, flags, &etnaviv_gem_shmem_ops, &obj);
+	ret = etnaviv_gem_new_private(dev, size, flags, true,
+				      &etnaviv_gem_shmem_ops, &etnaviv_obj);
 	if (ret)
 		goto fail;
 
-	lockdep_set_class(&to_etnaviv_bo(obj)->lock, &etnaviv_shm_lock_class);
-
-	ret = drm_gem_object_init(dev, obj, size);
-	if (ret)
-		goto fail;
+	lockdep_set_class(&etnaviv_obj->lock, &etnaviv_shm_lock_class);
 
+	obj = &etnaviv_obj->base;
 	/*
 	 * Our buffers are kept pinned, so allocating them from the MOVABLE
 	 * zone is a really bad idea, and conflicts with CMA. See comments
@@ -732,7 +731,8 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 }
 
 int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
-	const struct etnaviv_gem_ops *ops, struct etnaviv_gem_object **res)
+			    bool shmem, const struct etnaviv_gem_ops *ops,
+			    struct etnaviv_gem_object **res)
 {
 	struct drm_gem_object *obj;
 	int ret;
@@ -741,7 +741,15 @@ int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
 	if (ret)
 		return ret;
 
-	drm_gem_private_object_init(dev, obj, size);
+	if (shmem) {
+		ret = drm_gem_object_init(dev, obj, size);
+		if (ret) {
+			drm_gem_private_object_fini(obj);
+			return ret;
+		}
+	} else {
+		drm_gem_private_object_init(dev, obj, size);
+	}
 
 	*res = to_etnaviv_bo(obj);
 
@@ -830,7 +838,7 @@ int etnaviv_gem_new_userptr(struct drm_device *dev, struct drm_file *file,
 	struct etnaviv_gem_object *etnaviv_obj;
 	int ret;
 
-	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_CACHED,
+	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_CACHED, false,
 				      &etnaviv_gem_userptr_ops, &etnaviv_obj);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index f2ac64d8e90b..b174a9e4cc48 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -118,7 +118,9 @@ void etnaviv_submit_put(struct etnaviv_gem_submit * submit);
 int etnaviv_gem_wait_bo(struct etnaviv_gpu *gpu, struct drm_gem_object *obj,
 	struct drm_etnaviv_timespec *timeout);
 int etnaviv_gem_new_private(struct drm_device *dev, size_t size, u32 flags,
-	const struct etnaviv_gem_ops *ops, struct etnaviv_gem_object **res);
+			    bool shmem, const struct etnaviv_gem_ops *ops,
+			    struct etnaviv_gem_object **res);
+
 void etnaviv_gem_obj_add(struct drm_device *dev, struct drm_gem_object *obj);
 struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *obj);
 void etnaviv_gem_put_pages(struct etnaviv_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 0062d808d6a9..64a858a0b0cf 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -107,7 +107,7 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
 	int ret, npages;
 
-	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
+	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC, false,
 				      &etnaviv_gem_prime_ops, &etnaviv_obj);
 	if (ret < 0)
 		return ERR_PTR(ret);
-- 
2.43.0

