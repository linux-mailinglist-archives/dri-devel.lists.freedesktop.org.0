Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E120970619
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 11:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7789D10E07E;
	Sun,  8 Sep 2024 09:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="l7A0K9AS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D45D10E21E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2024 09:44:23 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1725788662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8HrP3vJQ3Z2agF7CFE3rOrow17VaFyduWBq2e2tNKw=;
 b=l7A0K9ASjDVcHwX6VwiQ1GhtDYj5u9Ur2JOW8Yc4wrkKyM1JceKMf6O0MvVS3gsODgiIk1
 291mflfGx+XYhM13G788fqSs2BVozRTqxx6U57HMXixIHXStSEXiADVyjoGlIfbnP4b0yC
 L27r15XETBHm/StH+xP9RDfsHMQi3S0=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v15 03/19] drm/etnaviv: Implement
 drm_gem_object_funcs::vunmap()
Date: Sun,  8 Sep 2024 17:43:41 +0800
Message-ID: <20240908094357.291862-4-sui.jingfeng@linux.dev>
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

The vunmap() can be used to release virtual mapping obtained by vmap(),
While the vmap() is used to make a long duration mapping of multiple
physical pages into a contiguous virtual space.

Make the implementation-specific vunmap() operation untangled with the
etnaviv_gem_xxx_release() function. As then, the etnaviv_gem_xxx_release()
only need to responsible for the release page works.

The etnaviv_gem_vunmap() is added for driver internal usa case, where no
DRM GEM framework is involved.

Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 38 ++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gem.h       |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 13 ++++---
 4 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index b3eb1662e90c..2eb2ff13f6e8 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -61,6 +61,7 @@ struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj);
 void etnaviv_gem_prime_unpin(struct drm_gem_object *obj);
 void *etnaviv_gem_vmap(struct drm_gem_object *obj);
+void etnaviv_gem_vunmap(struct drm_gem_object *obj);
 int etnaviv_gem_cpu_prep(struct drm_gem_object *obj, u32 op,
 		struct drm_etnaviv_timespec *timeout);
 int etnaviv_gem_cpu_fini(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 6bdf72cd9e85..fad23494d08e 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -340,6 +340,25 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
 	return etnaviv_obj->vaddr;
 }
 
+void etnaviv_gem_vunmap(struct drm_gem_object *obj)
+{
+	struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
+
+	if (!etnaviv_obj->vaddr)
+		return;
+
+	mutex_lock(&etnaviv_obj->lock);
+	etnaviv_obj->ops->vunmap(etnaviv_obj);
+	etnaviv_obj->vaddr = NULL;
+	mutex_unlock(&etnaviv_obj->lock);
+}
+
+static void etnaviv_gem_object_vunmap(struct drm_gem_object *obj,
+				      struct iosys_map *map)
+{
+	etnaviv_gem_vunmap(obj);
+}
+
 static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
 {
 	struct page **pages;
@@ -471,14 +490,21 @@ void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 
 static void etnaviv_gem_shmem_release(struct etnaviv_gem_object *etnaviv_obj)
 {
-	vunmap(etnaviv_obj->vaddr);
 	put_pages(etnaviv_obj);
 }
 
+static void etnaviv_gem_shmem_vunmap(struct etnaviv_gem_object *etnaviv_obj)
+{
+	lockdep_assert_held(&etnaviv_obj->lock);
+
+	vunmap(etnaviv_obj->vaddr);
+}
+
 static const struct etnaviv_gem_ops etnaviv_gem_shmem_ops = {
 	.get_pages = etnaviv_gem_shmem_get_pages,
 	.release = etnaviv_gem_shmem_release,
 	.vmap = etnaviv_gem_vmap_impl,
+	.vunmap = etnaviv_gem_shmem_vunmap,
 	.mmap = etnaviv_gem_mmap_obj,
 };
 
@@ -508,6 +534,7 @@ void etnaviv_gem_free_object(struct drm_gem_object *obj)
 		kfree(mapping);
 	}
 
+	etnaviv_obj->ops->vunmap(etnaviv_obj);
 	etnaviv_obj->ops->release(etnaviv_obj);
 	drm_gem_object_release(obj);
 
@@ -569,6 +596,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 	.unpin = etnaviv_gem_prime_unpin,
 	.get_sg_table = etnaviv_gem_prime_get_sg_table,
 	.vmap = etnaviv_gem_prime_vmap,
+	.vunmap = etnaviv_gem_object_vunmap,
 	.mmap = etnaviv_gem_mmap,
 	.vm_ops = &vm_ops,
 };
@@ -723,6 +751,13 @@ static void etnaviv_gem_userptr_release(struct etnaviv_gem_object *etnaviv_obj)
 	}
 }
 
+static void etnaviv_gem_userptr_vunmap(struct etnaviv_gem_object *etnaviv_obj)
+{
+	lockdep_assert_held(&etnaviv_obj->lock);
+
+	vunmap(etnaviv_obj->vaddr);
+}
+
 static int etnaviv_gem_userptr_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 		struct vm_area_struct *vma)
 {
@@ -733,6 +768,7 @@ static const struct etnaviv_gem_ops etnaviv_gem_userptr_ops = {
 	.get_pages = etnaviv_gem_userptr_get_pages,
 	.release = etnaviv_gem_userptr_release,
 	.vmap = etnaviv_gem_vmap_impl,
+	.vunmap = etnaviv_gem_userptr_vunmap,
 	.mmap = etnaviv_gem_userptr_mmap_obj,
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.h b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
index 3f8fe19a77cc..d4965de3007c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.h
@@ -65,6 +65,7 @@ struct etnaviv_gem_ops {
 	int (*get_pages)(struct etnaviv_gem_object *);
 	void (*release)(struct etnaviv_gem_object *);
 	void *(*vmap)(struct etnaviv_gem_object *);
+	void (*vunmap)(struct etnaviv_gem_object *);
 	int (*mmap)(struct etnaviv_gem_object *, struct vm_area_struct *);
 };
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 6b98200068e4..bea50d720450 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -62,11 +62,6 @@ void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
 
 static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 {
-	struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
-
-	if (etnaviv_obj->vaddr)
-		dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
-
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
 	 */
@@ -88,6 +83,13 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
 	return map.vaddr;
 }
 
+static void etnaviv_gem_prime_vunmap(struct etnaviv_gem_object *etnaviv_obj)
+{
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
+
+	dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
+}
+
 static int etnaviv_gem_prime_mmap_obj(struct etnaviv_gem_object *etnaviv_obj,
 		struct vm_area_struct *vma)
 {
@@ -106,6 +108,7 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
 	/* .get_pages should never be called */
 	.release = etnaviv_gem_prime_release,
 	.vmap = etnaviv_gem_prime_vmap_impl,
+	.vunmap = etnaviv_gem_prime_vunmap,
 	.mmap = etnaviv_gem_prime_mmap_obj,
 };
 
-- 
2.43.0

