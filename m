Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874C714EEA
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 19:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BDF10E2D2;
	Mon, 29 May 2023 17:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D4CAC10E2D1;
 Mon, 29 May 2023 17:24:54 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Axrevl33RkQUoCAA--.5160S3;
 Tue, 30 May 2023 01:24:53 +0800 (CST)
Received: from openarena.loongson.cn (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxMuXk33RkhkV_AA--.9919S8; 
 Tue, 30 May 2023 01:24:53 +0800 (CST)
From: Sui Jingfeng <suijingfeng@loongson.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 6/6] drm/etnaviv: allow usperspace create cached coherent bo
Date: Tue, 30 May 2023 01:24:52 +0800
Message-Id: <20230529172452.2148819-7-suijingfeng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529172452.2148819-1-suijingfeng@loongson.cn>
References: <20230529172452.2148819-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxMuXk33RkhkV_AA--.9919S8
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXF4fGryfAF4UZFyUZFykAFb_yoWrKFWUpF
 Z3AFyYkrW0v3yDK34xAFn8Za43Gw12gFZ2k3sxtwn09w45tF42qr95KFZ8Crn8Jr1fGry3
 tw1Dtry5K3WUArJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bcAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
 8EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4
 xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26Fy26r45twAv7VC2z280aVAFwI0_Cr0_
 Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20E
 Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxV
 AFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU44rWUUUUU
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cached system RAM is coherent on loongson CPUs, and the GPU and DC allways
snoop the CPU's cache. write-combine caching property is not suitiable for
us.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 22 +++++++++++++++++++--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  9 ++++++++-
 include/uapi/drm/etnaviv_drm.h              | 11 ++++++-----
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7ff795c5cc79..3a86d1211ca5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -275,7 +275,7 @@ static int etnaviv_ioctl_gem_new(struct drm_device *dev, void *data,
 	struct drm_etnaviv_gem_new *args = data;
 
 	if (args->flags & ~(ETNA_BO_CACHED | ETNA_BO_WC | ETNA_BO_UNCACHED |
-			    ETNA_BO_FORCE_MMU))
+			    ETNA_BO_CACHED_COHERENT | ETNA_BO_FORCE_MMU))
 		return -EINVAL;
 
 	return etnaviv_gem_new_handle(dev, file, args->size,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index b5f73502e3dd..d8b559bd33d3 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -343,6 +343,7 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
 static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
 {
 	struct page **pages;
+	pgprot_t prot;
 
 	lockdep_assert_held(&obj->lock);
 
@@ -350,8 +351,20 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
 	if (IS_ERR(pages))
 		return NULL;
 
-	return vmap(pages, obj->base.size >> PAGE_SHIFT,
-			VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+	switch (obj->flags) {
+	case ETNA_BO_CACHED_COHERENT:
+	case ETNA_BO_CACHED:
+		prot = PAGE_KERNEL;
+		break;
+	case ETNA_BO_UNCACHED:
+		prot = pgprot_noncached(PAGE_KERNEL);
+		break;
+	case ETNA_BO_WC:
+	default:
+		prot = pgprot_writecombine(PAGE_KERNEL);
+	}
+
+	return vmap(pages, obj->base.size >> PAGE_SHIFT, VM_MAP, prot);
 }
 
 static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
@@ -545,6 +558,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
 static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
 	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
 {
+	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_gem_object *etnaviv_obj;
 	unsigned sz = sizeof(*etnaviv_obj);
 	bool valid = true;
@@ -555,6 +569,10 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
 	case ETNA_BO_CACHED:
 	case ETNA_BO_WC:
 		break;
+	case ETNA_BO_CACHED_COHERENT:
+		if (priv->has_cached_coherent)
+			break;
+		fallthrough;
 	default:
 		valid = false;
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..671d91d8f1c6 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -112,11 +112,18 @@ static const struct etnaviv_gem_ops etnaviv_gem_prime_ops = {
 struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
 	struct dma_buf_attachment *attach, struct sg_table *sgt)
 {
+	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_gem_object *etnaviv_obj;
 	size_t size = PAGE_ALIGN(attach->dmabuf->size);
+	u32 cache_flags;
 	int ret, npages;
 
-	ret = etnaviv_gem_new_private(dev, size, ETNA_BO_WC,
+	if (priv->has_cached_coherent)
+		cache_flags = ETNA_BO_CACHED_COHERENT;
+	else
+		cache_flags = ETNA_BO_WC;
+
+	ret = etnaviv_gem_new_private(dev, size, cache_flags,
 				      &etnaviv_gem_prime_ops, &etnaviv_obj);
 	if (ret < 0)
 		return ERR_PTR(ret);
diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
index af024d90453d..474b0db286de 100644
--- a/include/uapi/drm/etnaviv_drm.h
+++ b/include/uapi/drm/etnaviv_drm.h
@@ -90,13 +90,14 @@ struct drm_etnaviv_param {
  * GEM buffers:
  */
 
-#define ETNA_BO_CACHE_MASK   0x000f0000
+#define ETNA_BO_CACHE_MASK              0x000f0000
 /* cache modes */
-#define ETNA_BO_CACHED       0x00010000
-#define ETNA_BO_WC           0x00020000
-#define ETNA_BO_UNCACHED     0x00040000
+#define ETNA_BO_CACHED                  0x00010000
+#define ETNA_BO_WC                      0x00020000
+#define ETNA_BO_UNCACHED                0x00040000
+#define ETNA_BO_CACHED_COHERENT         0x00080000
 /* map flags */
-#define ETNA_BO_FORCE_MMU    0x00100000
+#define ETNA_BO_FORCE_MMU               0x00100000
 
 struct drm_etnaviv_gem_new {
 	__u64 size;           /* in */
-- 
2.25.1

