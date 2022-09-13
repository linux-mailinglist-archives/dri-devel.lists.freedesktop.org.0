Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED1D5B7AE8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 21:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C529310E24D;
	Tue, 13 Sep 2022 19:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BCC10E1E0;
 Tue, 13 Sep 2022 19:29:02 +0000 (UTC)
Received: from dimapc.. (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 32B526601FFB;
 Tue, 13 Sep 2022 20:28:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663097340;
 bh=3secHBjyjMQpoZrQKxguIhOKP495IyqhEAH64Kaz1ng=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=krmMFaa7YjY0Ae8xBVWJygNhMSdpSQRuXqGbf4Gkx6xGfhCI3hNaaxKg+cQhZ2vrD
 rRmgDM2TRuIF+/3n/9SHHrpzmTpuMy9qWymkmiFC4/baX1TpZbYneMqRLxG7U0+dbR
 TqaJ7SeB+x26NSRuPBpHltbmHuF1vzciBMtOAw28M2QsSxUiActPhI27047kPE76DJ
 0gseQ2cuoRRUFL9MDLZuzJHknJuSkeAkpR5vYMacmyrqPNjajmfzTc2T65WFiMBgF6
 os2OejKnmvR5HRF/BVaKRmyZNF8o/J1o8aMJyVWIEDLkOWPOLWs2d1POgJyNBpgMn0
 aXLQ5oq7i6BOw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
Subject: [PATCH v5 08/21] drm/tegra: Prepare to dynamic dma-buf locking
 specification
Date: Tue, 13 Sep 2022 22:27:44 +0300
Message-Id: <20220913192757.37727-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
References: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare Tegra DRM driver to the common dynamic dma-buf locking convention
by starting to use the unlocked versions of dma-buf API functions.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/tegra/gem.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 81991090adcc..b09b8ab40ae4 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -84,7 +84,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 			goto free;
 		}
 
-		map->sgt = dma_buf_map_attachment(map->attach, direction);
+		map->sgt = dma_buf_map_attachment_unlocked(map->attach, direction);
 		if (IS_ERR(map->sgt)) {
 			dma_buf_detach(buf, map->attach);
 			err = PTR_ERR(map->sgt);
@@ -160,7 +160,8 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 static void tegra_bo_unpin(struct host1x_bo_mapping *map)
 {
 	if (map->attach) {
-		dma_buf_unmap_attachment(map->attach, map->sgt, map->direction);
+		dma_buf_unmap_attachment_unlocked(map->attach, map->sgt,
+						  map->direction);
 		dma_buf_detach(map->attach->dmabuf, map->attach);
 	} else {
 		dma_unmap_sgtable(map->dev, map->sgt, map->direction, 0);
@@ -181,7 +182,7 @@ static void *tegra_bo_mmap(struct host1x_bo *bo)
 	if (obj->vaddr) {
 		return obj->vaddr;
 	} else if (obj->gem.import_attach) {
-		ret = dma_buf_vmap(obj->gem.import_attach->dmabuf, &map);
+		ret = dma_buf_vmap_unlocked(obj->gem.import_attach->dmabuf, &map);
 		return ret ? NULL : map.vaddr;
 	} else {
 		return vmap(obj->pages, obj->num_pages, VM_MAP,
@@ -197,7 +198,7 @@ static void tegra_bo_munmap(struct host1x_bo *bo, void *addr)
 	if (obj->vaddr)
 		return;
 	else if (obj->gem.import_attach)
-		dma_buf_vunmap(obj->gem.import_attach->dmabuf, &map);
+		dma_buf_vunmap_unlocked(obj->gem.import_attach->dmabuf, &map);
 	else
 		vunmap(addr);
 }
@@ -461,7 +462,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 
 	get_dma_buf(buf);
 
-	bo->sgt = dma_buf_map_attachment(attach, DMA_TO_DEVICE);
+	bo->sgt = dma_buf_map_attachment_unlocked(attach, DMA_TO_DEVICE);
 	if (IS_ERR(bo->sgt)) {
 		err = PTR_ERR(bo->sgt);
 		goto detach;
@@ -479,7 +480,7 @@ static struct tegra_bo *tegra_bo_import(struct drm_device *drm,
 
 detach:
 	if (!IS_ERR_OR_NULL(bo->sgt))
-		dma_buf_unmap_attachment(attach, bo->sgt, DMA_TO_DEVICE);
+		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
 	dma_buf_put(buf);
@@ -508,8 +509,8 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		tegra_bo_iommu_unmap(tegra, bo);
 
 	if (gem->import_attach) {
-		dma_buf_unmap_attachment(gem->import_attach, bo->sgt,
-					 DMA_TO_DEVICE);
+		dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
+						  DMA_TO_DEVICE);
 		drm_prime_gem_destroy(gem, NULL);
 	} else {
 		tegra_bo_free(gem->dev, bo);
-- 
2.37.3

