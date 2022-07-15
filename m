Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C551F5758C0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93CD310E15B;
	Fri, 15 Jul 2022 00:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C542C10F45B;
 Fri, 15 Jul 2022 00:53:32 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 06F906601A45;
 Fri, 15 Jul 2022 01:53:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657846411;
 bh=PteWYx7Wt5reZT7taoySnmyR4+zPHHT7pS736ipbNiM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=avN5sLDmsCMSZuDVcZ8lQbfDsoKw+pciIyMfgqRM7c6IrRo3Ty9cJVZ/pMdy+WDGr
 jon9Zguuo7QBGZD8t6zDWjKXJKkvq4ETPvYqBpGkOX1fYWDGdr0iAiSaAFLdPm4EvE
 ZSNXNqXzQNwUv/O53RU0S8lRJVobDWrWKl1tuIxeaEIaitq17gsxqSaPxF4PEDAwff
 +JQ3TYmJUfCUfbhznSPQ70FkRRUTt8q4+NDPkMEzpu+juiaMcm6d+uPpSHxJtiZ33p
 6c7JswUZv2KGYU7BzJnwrB81p6cGlOplDqKScJdI3hUKQ276XEjQxSTvlLwHH5D0ki
 71NFBoJ/4bGFA==
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v1 5/6] media: videobuf2: Stop using internal dma-buf lock
Date: Fri, 15 Jul 2022 03:52:43 +0300
Message-Id: <20220715005244.42198-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All drivers that use dma-bufs have been moved to the updated locking
specification and now dma-buf reservation is guaranteed to be locked
by importers during the mapping operations. There is no need to take
the internal dma-buf lock anymore. Remove locking from the videobuf2
memory allocators.

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
2.36.1

