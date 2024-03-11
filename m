Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2AA877DB0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 11:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C510010F36E;
	Mon, 11 Mar 2024 10:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nPkjO2pi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE6310F36E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U5ZADMVZ1BwKmcRqP/h6PhdAbJ8gcjCuZ+DmOUnQxlA=; b=nPkjO2pi+QBjIIjvyuy0mzyz5C
 LzkDSXMnXZMUa9g+Hb5GHBTgu6TcxC1I6CXE7b8BZvZ1s787rrePN9wooa07tMDQgNgv2bQ7mK7Od
 OVF+56gFPLimBCGm9YFRoblyzWE0iJMORgClvvS95FnORlZiBQ2DkLiBXq43A7zwrB+ha4pHc7xwk
 M9EEiM2E4wF+AHYemiFaZ8KQI2yTBIi81mFpqj7C/wIDb07DsEi0Dd29mXv3tt5RkXIYg3/c0mvkv
 eC5DWrChRJnynnl6KoWoAP0FCjG80w1eWQFD8CrHKfOCv8SlaFW+RUfeJwakR0vs638MJP7CCFaX9
 UbsXazzw==;
Received: from [186.230.26.74] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rjcc7-008ou6-L2; Mon, 11 Mar 2024 11:10:36 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Russell King <linux@armlinux.org.uk>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH 2/5] drm/gem: Add a mountpoint parameter to
 drm_gem_object_init()
Date: Mon, 11 Mar 2024 07:05:59 -0300
Message-ID: <20240311100959.205545-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311100959.205545-1-mcanal@igalia.com>
References: <20240311100959.205545-1-mcanal@igalia.com>
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

For some applications, such as using huge pages, we might want to have a
different mountpoint, for which we pass in mount flags that better match
our usecase.

Therefore, add a new parameter to drm_gem_object_init() that allow us to
define the tmpfs mountpoint where the GEM object will be created. If
this parameter is NULL, then we fallback to shmem_file_setup().

Cc: Russell King <linux@armlinux.org.uk>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/armada/armada_gem.c           |  2 +-
 drivers/gpu/drm/drm_gem.c                     | 12 ++++++++++--
 drivers/gpu/drm/drm_gem_dma_helper.c          |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  2 +-
 drivers/gpu/drm/gma500/gem.c                  |  2 +-
 drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |  2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  2 +-
 drivers/gpu/drm/tegra/gem.c                   |  2 +-
 drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |  2 +-
 include/drm/drm_gem.h                         |  3 ++-
 20 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 26d10065d534..36a25e667341 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -226,7 +226,7 @@ static struct armada_gem_object *armada_gem_alloc_object(struct drm_device *dev,

 	obj->obj.funcs = &armada_gem_object_funcs;

-	if (drm_gem_object_init(dev, &obj->obj, size)) {
+	if (drm_gem_object_init(dev, &obj->obj, size, NULL)) {
 		kfree(obj);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 44a948b80ee1..ddd8777fcda5 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -118,18 +118,26 @@ drm_gem_init(struct drm_device *dev)
  * @dev: drm_device the object should be initialized for
  * @obj: drm_gem_object to initialize
  * @size: object size
+ * @gemfs: tmpfs mount where the GEM object will be created. If NULL, use
+ * the usual tmpfs mountpoint (`shm_mnt`).
  *
  * Initialize an already allocated GEM object of the specified size with
  * shmfs backing store.
  */
 int drm_gem_object_init(struct drm_device *dev,
-			struct drm_gem_object *obj, size_t size)
+			struct drm_gem_object *obj, size_t size,
+			struct vfsmount *gemfs)
 {
 	struct file *filp;

 	drm_gem_private_object_init(dev, obj, size);

-	filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
+	if (gemfs)
+		filp = shmem_file_setup_with_mnt(gemfs, "drm mm object", size,
+						 VM_NORESERVE);
+	else
+		filp = shmem_file_setup("drm mm object", size, VM_NORESERVE);
+
 	if (IS_ERR(filp))
 		return PTR_ERR(filp);

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4..9ada5ac85dd6 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -95,7 +95,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 		/* Always use writecombine for dma-buf mappings */
 		dma_obj->map_noncoherent = false;
 	} else {
-		ret = drm_gem_object_init(drm, gem_obj, size);
+		ret = drm_gem_object_init(drm, gem_obj, size, NULL);
 	}
 	if (ret)
 		goto error;
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e435f986cd13..15635b330ca8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -77,7 +77,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 		drm_gem_private_object_init(dev, obj, size);
 		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
 	} else {
-		ret = drm_gem_object_init(dev, obj, size);
+		ret = drm_gem_object_init(dev, obj, size, NULL);
 	}
 	if (ret) {
 		drm_gem_private_object_fini(obj);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 75f2eaf0d5b6..90649899dbef 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -210,7 +210,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	if (!gem->funcs)
 		gem->funcs = &drm_gem_vram_object_funcs;

-	ret = drm_gem_object_init(dev, gem, size);
+	ret = drm_gem_object_init(dev, gem, size, NULL);
 	if (ret) {
 		kfree(gbo);
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 71a6d2b1c80f..aa4b61c48b7f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -596,7 +596,7 @@ int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file *file,

 	lockdep_set_class(&to_etnaviv_bo(obj)->lock, &etnaviv_shm_lock_class);

-	ret = drm_gem_object_init(dev, obj, size);
+	ret = drm_gem_object_init(dev, obj, size, NULL);
 	if (ret)
 		goto fail;

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 638ca96830e9..c50c0d12246e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -160,7 +160,7 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,

 	obj->funcs = &exynos_drm_gem_object_funcs;

-	ret = drm_gem_object_init(dev, obj, size);
+	ret = drm_gem_object_init(dev, obj, size, NULL);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
 		kfree(exynos_gem);
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4b7627a72637..315e085dc9ee 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -169,7 +169,7 @@ psb_gem_create(struct drm_device *dev, u64 size, const char *name, bool stolen,
 	if (stolen) {
 		drm_gem_private_object_init(dev, obj, size);
 	} else {
-		ret = drm_gem_object_init(dev, obj, size);
+		ret = drm_gem_object_init(dev, obj, size, NULL);
 		if (ret)
 			goto err_release_resource;

diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 465f622ac05d..d392ea66d72e 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -458,7 +458,7 @@ struct lsdc_bo *lsdc_bo_create(struct drm_device *ddev,

 	size = ALIGN(size, PAGE_SIZE);

-	ret = drm_gem_object_init(ddev, &tbo->base, size);
+	ret = drm_gem_object_init(ddev, &tbo->base, size, NULL);
 	if (ret) {
 		kfree(lbo);
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 4f2e3feabc0f..261d386921dc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -44,7 +44,7 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,

 	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;

-	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
+	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size, NULL);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialize gem object\n");
 		kfree(mtk_gem_obj);
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 175ee4ab8a6f..6fe17cf28ef6 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1222,7 +1222,7 @@ struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t size, uint32

 		vma->iova = physaddr(obj);
 	} else {
-		ret = drm_gem_object_init(dev, obj, size);
+		ret = drm_gem_object_init(dev, obj, size, NULL);
 		if (ret)
 			goto fail;
 		/*
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 49c2bcbef129..434325fa8752 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -262,7 +262,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,

 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
+	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size, NULL);
 	if (ret) {
 		drm_gem_object_release(&nvbo->bo.base);
 		kfree(nvbo);
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1b2ff0c40fc1..c9b3572df555 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -62,7 +62,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,

 	/* Initialize the embedded gem-object. We return a single gem-reference
 	 * to the caller, instead of a normal nouveau_bo ttm reference. */
-	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
+	ret = drm_gem_object_init(dev, &nvbo->bo.base, size, NULL);
 	if (ret) {
 		nouveau_bo_ref(NULL, &nvbo);
 		obj = ERR_PTR(-ENOMEM);
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 3421e8389222..53b4ec64c7b0 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1352,7 +1352,7 @@ struct drm_gem_object *omap_gem_new(struct drm_device *dev,
 	if (!(flags & OMAP_BO_MEM_SHMEM)) {
 		drm_gem_private_object_init(dev, obj, size);
 	} else {
-		ret = drm_gem_object_init(dev, obj, size);
+		ret = drm_gem_object_init(dev, obj, size, NULL);
 		if (ret)
 			goto err_free;

diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 1e46b0a6e478..45d7abe26ebd 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -123,7 +123,7 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
 	if (bo == NULL)
 		return -ENOMEM;
 	size = roundup(size, PAGE_SIZE);
-	r = drm_gem_object_init(&qdev->ddev, &bo->tbo.base, size);
+	r = drm_gem_object_init(&qdev->ddev, &bo->tbo.base, size, NULL);
 	if (unlikely(r)) {
 		kfree(bo);
 		return r;
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 93ed841f5dce..daba285bd78f 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -295,7 +295,7 @@ static struct rockchip_gem_object *

 	obj->funcs = &rockchip_gem_object_funcs;

-	drm_gem_object_init(drm, obj, size);
+	drm_gem_object_init(drm, obj, size, NULL);

 	return rk_obj;
 }
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index b4eb030ea961..63f10d5a57ba 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -311,7 +311,7 @@ static struct tegra_bo *tegra_bo_alloc_object(struct drm_device *drm,
 	host1x_bo_init(&bo->base, &tegra_bo_ops);
 	size = round_up(size, PAGE_SIZE);

-	err = drm_gem_object_init(drm, &bo->gem, size);
+	err = drm_gem_object_init(drm, &bo->gem, size, NULL);
 	if (err < 0)
 		goto free;

diff --git a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
index 7b7c1fa805fc..a9bf7d5a887c 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c
@@ -61,7 +61,7 @@ struct ttm_buffer_object *ttm_bo_kunit_init(struct kunit *test,
 	KUNIT_ASSERT_NOT_NULL(test, bo);

 	bo->base = gem_obj;
-	err = drm_gem_object_init(devs->drm, &bo->base, size);
+	err = drm_gem_object_init(devs->drm, &bo->base, size, NULL);
 	KUNIT_ASSERT_EQ(test, err, 0);

 	bo->bdev = devs->ttm_dev;
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 3ad2b4cfd1f0..1b36c958340b 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -122,7 +122,7 @@ static struct xen_gem_object *gem_create_obj(struct drm_device *dev,

 	xen_obj->base.funcs = &xen_drm_front_gem_object_funcs;

-	ret = drm_gem_object_init(dev, &xen_obj->base, size);
+	ret = drm_gem_object_init(dev, &xen_obj->base, size, NULL);
 	if (ret < 0) {
 		kfree(xen_obj);
 		return ERR_PTR(ret);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 2ebec3984cd4..c75611ae8f93 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -471,7 +471,8 @@ struct drm_gem_object {
 void drm_gem_object_release(struct drm_gem_object *obj);
 void drm_gem_object_free(struct kref *kref);
 int drm_gem_object_init(struct drm_device *dev,
-			struct drm_gem_object *obj, size_t size);
+			struct drm_gem_object *obj, size_t size,
+			struct vfsmount *gemfs);
 void drm_gem_private_object_init(struct drm_device *dev,
 				 struct drm_gem_object *obj, size_t size);
 void drm_gem_private_object_fini(struct drm_gem_object *obj);
--
2.43.0

