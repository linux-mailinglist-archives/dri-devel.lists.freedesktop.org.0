Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED659F79B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D730F10E0BF;
	Wed, 24 Aug 2022 10:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE6310E668;
 Wed, 24 Aug 2022 10:24:13 +0000 (UTC)
Received: from dimapc.. (109-252-119-13.nat.spd-mgts.ru [109.252.119.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A2B0E6601E8F;
 Wed, 24 Aug 2022 11:23:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661336639;
 bh=Vzf7z+h30Su34uQUtrr1r2bCXml+/Rvk8BJL7Roib7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nAXirMA6kjcky3QcUTCGs/MFMl27zgGe60TbMsZ/bhl6lrWZ4pdRYd6jdEtAk1Q9G
 JuGCTjhrX8clKppg8XC02jrK1gQ00VNPhSXZanM6cR5H8vvM94MLPA+0gTnqcqy7mV
 8aK01zsk4HnLeL9Ve+KZ2JgnZRCqN8yiiHU3pMnqv1lNnH3y3gfg5f3sJi1f6BVNEN
 2GEYfNzFCWAA4A6t2iW3uCNz5ekBdc6e/ifF19t0ccNV/SQhayiRp2ZNGNC805UPsa
 cwiZGH2QzWXzhBh560ppDCx1y8CuumvwKVOfGQ5Kz56i8eVjl2DI4seBcS8r6T3UUW
 cSLEmcJGiGY0g==
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
 Qiang Yu <yuq825@gmail.com>
Subject: [PATCH v3 8/9] media: videobuf2: Stop using internal dma-buf lock
Date: Wed, 24 Aug 2022 13:22:47 +0300
Message-Id: <20220824102248.91964-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All drivers that use dma-bufs have been moved to the updated locking
specification and now dma-buf reservation is guaranteed to be locked
by importers during the mapping operations. There is no need to take
the internal dma-buf lock anymore. Remove locking from the videobuf2
memory allocators.

Acked-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/media/common/videobuf2/videobuf2-dma-contig.c | 11 +----------
 drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 11 +----------
 drivers/media/common/videobuf2/videobuf2-vmalloc.c    | 11 +----------
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index de762dbdaf78..2c69bf0470e7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -382,18 +382,12 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
 {
 	struct vb2_dc_attachment *attach = db_attach->priv;
-	/* stealing dmabuf mutex to serialize map/unmap operations */
-	struct mutex *lock = &db_attach->dmabuf->lock;
 	struct sg_table *sgt;
 
-	mutex_lock(lock);
-
 	sgt = &attach->sgt;
 	/* return previously mapped sg table */
-	if (attach->dma_dir == dma_dir) {
-		mutex_unlock(lock);
+	if (attach->dma_dir == dma_dir)
 		return sgt;
-	}
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
@@ -409,14 +403,11 @@ static struct sg_table *vb2_dc_dmabuf_ops_map(
 	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir,
 			    DMA_ATTR_SKIP_CPU_SYNC)) {
 		pr_err("failed to map scatterlist\n");
-		mutex_unlock(lock);
 		return ERR_PTR(-EIO);
 	}
 
 	attach->dma_dir = dma_dir;
 
-	mutex_unlock(lock);
-
 	return sgt;
 }
 
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 39e11600304a..e63e718c0bf7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -424,18 +424,12 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
 	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
 {
 	struct vb2_dma_sg_attachment *attach = db_attach->priv;
-	/* stealing dmabuf mutex to serialize map/unmap operations */
-	struct mutex *lock = &db_attach->dmabuf->lock;
 	struct sg_table *sgt;
 
-	mutex_lock(lock);
-
 	sgt = &attach->sgt;
 	/* return previously mapped sg table */
-	if (attach->dma_dir == dma_dir) {
-		mutex_unlock(lock);
+	if (attach->dma_dir == dma_dir)
 		return sgt;
-	}
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
@@ -446,14 +440,11 @@ static struct sg_table *vb2_dma_sg_dmabuf_ops_map(
 	/* mapping to the client with new direction */
 	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
 		pr_err("failed to map scatterlist\n");
-		mutex_unlock(lock);
 		return ERR_PTR(-EIO);
 	}
 
 	attach->dma_dir = dma_dir;
 
-	mutex_unlock(lock);
-
 	return sgt;
 }
 
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 7831bf545874..41db707e43a4 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -267,18 +267,12 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
 	struct dma_buf_attachment *db_attach, enum dma_data_direction dma_dir)
 {
 	struct vb2_vmalloc_attachment *attach = db_attach->priv;
-	/* stealing dmabuf mutex to serialize map/unmap operations */
-	struct mutex *lock = &db_attach->dmabuf->lock;
 	struct sg_table *sgt;
 
-	mutex_lock(lock);
-
 	sgt = &attach->sgt;
 	/* return previously mapped sg table */
-	if (attach->dma_dir == dma_dir) {
-		mutex_unlock(lock);
+	if (attach->dma_dir == dma_dir)
 		return sgt;
-	}
 
 	/* release any previous cache */
 	if (attach->dma_dir != DMA_NONE) {
@@ -289,14 +283,11 @@ static struct sg_table *vb2_vmalloc_dmabuf_ops_map(
 	/* mapping to the client with new direction */
 	if (dma_map_sgtable(db_attach->dev, sgt, dma_dir, 0)) {
 		pr_err("failed to map scatterlist\n");
-		mutex_unlock(lock);
 		return ERR_PTR(-EIO);
 	}
 
 	attach->dma_dir = dma_dir;
 
-	mutex_unlock(lock);
-
 	return sgt;
 }
 
-- 
2.37.2

