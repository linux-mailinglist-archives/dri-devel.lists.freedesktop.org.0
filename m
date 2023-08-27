Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FB78A08C
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 19:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD18310E1C1;
	Sun, 27 Aug 2023 17:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C7A10E076;
 Sun, 27 Aug 2023 17:55:53 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CC4E6601F5E;
 Sun, 27 Aug 2023 18:55:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693158952;
 bh=gy3uY3hU4b+eh09ptffZWw3oZWkfKZfl7NLeYKVx5Jk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NlxF6k3TIR0ANfnT1O22Rl0rf3oPZv1weESs2Xw2/PCHO1BIIEGilAghh23PVab9g
 yUzsPIJ4UgqraCOf2hFv5n5GU9HDhH9pu4ar/JY8JOuX+azdt2qVHZiHrU5avMAfia
 6tIEZlJie1qXJdIUMK4dCzImzgdkAfWqGUyAoDYEn+VIcbStfa15X/TFQD3zPsLE49
 2zE3Vx8gv/4lsz0/GVdpeBq4ySaXqZzUT9z/BUmeIIfC/aW1Lke+FWYAuuC6D/EpTu
 WmdB0wttRAjfK/huSn7IT+dKaDX4K0q4xs5cQJvwy7HWnCSqPbi/83REQfHNFOP0/Q
 l+sd/EkJo4Gwg==
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
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v15 01/23] drm/shmem-helper: Fix UAF in error path when
 freeing SGT of imported GEM
Date: Sun, 27 Aug 2023 20:54:27 +0300
Message-ID: <20230827175449.1766701-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
References: <20230827175449.1766701-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
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
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
 include/drm/drm_gem_shmem_helper.h     | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index a783d2245599..78d9cf2355a5 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -141,7 +141,7 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 
 	if (obj->import_attach) {
 		drm_prime_gem_destroy(obj, shmem->sgt);
-	} else {
+	} else if (!shmem->imported_sgt) {
 		dma_resv_lock(shmem->base.resv, NULL);
 
 		drm_WARN_ON(obj->dev, shmem->vmap_use_count);
@@ -758,6 +758,7 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 		return ERR_CAST(shmem);
 
 	shmem->sgt = sgt;
+	shmem->imported_sgt = true;
 
 	drm_dbg_prime(dev, "size = %zu\n", size);
 
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

