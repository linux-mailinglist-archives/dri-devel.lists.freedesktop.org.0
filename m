Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A16AB2D5
	for <lists+dri-devel@lfdr.de>; Sun,  5 Mar 2023 23:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C0010E077;
	Sun,  5 Mar 2023 22:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1D710E058;
 Sun,  5 Mar 2023 22:11:37 +0000 (UTC)
Received: from workpc.. (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 884846602124;
 Sun,  5 Mar 2023 22:11:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678054296;
 bh=nRvK+a4SrZSQE5m68XGecVS9BQJoEYCbvEQ/J739IdU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QZKKD6tjNIjoQBJPoz/Mywwb8SiVxH2RMq54Nbm6NXATC75BBYGgujvCfUu6z/MKT
 SXyVS+pRFpnnyeM2tDKERzFO3PMXo3FNe2rs2XJgjmGdWZteocXzz7OGYvDNS/YN8M
 pYIlYWvA2igTowYxFEK1CFErakuG+p7ymFXaOvACrEBins61OEX+7GTY0TsRdS5lfV
 WVpUs5buBrZVGgH7mt8hsuYl7SGm3Vp4BWArzOm6WhlOdkwfYLg9c6+prwnE6sDzI6
 eslwhKat4uJEZUaaTJ1bYnYAhqA6xr+eKbp8zDwbMC/XjTUf6qAInxzjzae0B+ssrF
 rZvYiYECZ1HTQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v12 05/11] drm/shmem-helper: Factor out unpinning part from
 drm_gem_shmem_purge()
Date: Mon,  6 Mar 2023 01:10:05 +0300
Message-Id: <20230305221011.1404672-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
References: <20230305221011.1404672-1-dmitry.osipenko@collabora.com>
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

Factor out pages unpinning code from drm_gem_shmem_purge() into new
drm_gem_shmem_unpin_pages(). This prepares code for addition of memory
shrinker support. The new common function will be used by shrinker for
eviction of shmem pages.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e2324e857847..474918383b3e 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -486,25 +486,29 @@ int drm_gem_shmem_madvise(struct drm_gem_shmem_object *shmem, int madv)
 }
 EXPORT_SYMBOL(drm_gem_shmem_madvise);
 
-void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+static void drm_gem_shmem_unpin_pages(struct drm_gem_shmem_object *shmem)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	struct drm_device *dev = obj->dev;
 
 	dma_resv_assert_held(shmem->base.resv);
 
-	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
-
 	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	drm_gem_shmem_release_pages(shmem);
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
+}
 
-	drm_gem_shmem_put_pages(shmem);
+void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
+{
+	struct drm_gem_object *obj = &shmem->base;
 
-	shmem->madv = -1;
+	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
-	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+	drm_gem_shmem_unpin_pages(shmem);
 	drm_gem_free_mmap_offset(obj);
 
 	/* Our goal here is to return as much of the memory as
@@ -515,6 +519,8 @@ void drm_gem_shmem_purge(struct drm_gem_shmem_object *shmem)
 	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
 
 	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
+
+	shmem->madv = -1;
 }
 EXPORT_SYMBOL(drm_gem_shmem_purge);
 
-- 
2.39.2

