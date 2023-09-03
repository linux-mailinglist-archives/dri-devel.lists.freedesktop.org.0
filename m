Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0E790D04
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7648010E092;
	Sun,  3 Sep 2023 17:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BC810E0D8
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:08:38 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F115A66071E6;
 Sun,  3 Sep 2023 18:08:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693760917;
 bh=2QMQsm3VuaBAzd2hf1hxEcuNZ98u5n7d6ZnuVfXHKfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RhhkhEvoJCogGkvyvWoHKhm+xTpekckfX0h1BUlFSzo2oC+wM13wVgjzpP0K4SZ43
 36WLbDwz7rId3hVhXCJ/44Y09/VIgougM+g15V6Ogjh6fVZSfQtcxFco/S3iqTguJK
 17bE4GUJGx4jvyKfDqk32xVt+DbRAeMA9jX9JFpGvcZTaMmRuqJlDbH1s+UGt+zgzF
 z7pdyckT6jAm00almLgjV+Vp460nuoE1bdJvqcEJzIYauX8ZOLa9FOlgPYKLEDUq7f
 +O+MICMUrNd2+KfEsaHKXV/O96oOPGbm2aP4SC3ZI8M7Kpf+MZOYLRCC0HMfDb4Cp9
 rGJP9xyZtrpAA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v16 01/20] drm/shmem-helper: Fix UAF in error path when
 freeing SGT of imported GEM
Date: Sun,  3 Sep 2023 20:07:17 +0300
Message-ID: <20230903170736.513347-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
References: <20230903170736.513347-1-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Freeing drm-shmem GEM right after creating it using
drm_gem_shmem_prime_import_sg_table() frees SGT of the imported dma-buf
and then dma-buf frees this SGT second time.

The v3d_prime_import_sg_table() is example of a error code path where
dma-buf's SGT is freed by drm-shmem and then it's freed second time by
dma_buf_unmap_attachment() in drm_gem_prime_import_dev().

Add drm-shmem GEM flag telling that this is imported SGT shall not be
treated as own SGT, fixing the use-after-free bug.

Cc: stable@vger.kernel.org
Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 13 ++++++++++++-
 include/drm/drm_gem_shmem_helper.h     |  7 +++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e435f986cd13..6693d4061ca1 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -141,7 +141,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
-	} else {
+	} else if (!shmem->imported_sgt) {
 		dma_resv_lock(shmem->base.resv, NULL);
 
 		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
@@ -765,6 +765,17 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 
 	shmem->sgt = sgt;
 
+	/*
+	 * drm_gem_shmem_prime_import_sg_table() can be called from a
+	 * driver specific ->import_sg_table() implementations that
+	 * may fail, in that case drm_gem_shmem_free() will be invoked
+	 * without assigned drm_gem_object::import_attach.
+	 *
+	 * This flag lets drm_gem_shmem_free() differentiate whether
+	 * SGT belongs to dmabuf and shall not be freed by drm-shmem.
+	 */
+	shmem->imported_sgt = true;
+
 	drm_dbg_prime(dev, "size = %zu\n", size);
 
 	return &shmem->base;
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index bf0c31aa8fbe..ec70a98a8fe1 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -73,6 +73,13 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int vmap_use_count;
 
+	/**
+	 * @imported_sgt:
+	 *
+	 * True if SG table belongs to imported dma-buf.
+	 */
+	bool imported_sgt : 1;
+
 	/**
 	 * @pages_mark_dirty_on_put:
 	 *
-- 
2.41.0

