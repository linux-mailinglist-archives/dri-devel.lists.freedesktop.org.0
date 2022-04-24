Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B666850D476
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C03112129;
	Sun, 24 Apr 2022 19:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4336010FEB9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:05:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 4F6101F4065F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650827109;
 bh=AlpWMMFY2kuHyruY9FDCsN1f6mNBZxXcpmSdzVCs994=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ry+ZPMXQVP4xnByVPenI0tsSh+KMi7RYEpqpfiLul1cWE2liWNSVpPF7mdvTKsDf8
 xMV/7sATfjAaFp1aKNpKKZVZHGvay96HMbwMhUZatIDB0+Y34qyQbm+S3NaMyK5Vo6
 wrUY9C8NjiDr9BUaY0c2Wf2TEv5hgSRBEB9XXA62XAwPCuoRrs7l47RGOkjA8ma+f6
 dUzSbg2NzG06GPMAywlfYjJu46eJBwFBF3HmrYwUj7wwY/SKwFtl619lyjd8ZUlLqG
 WAGXyzpQs1vlNCDn5coseHNkg4bI4C/IneTx2kfFrSDJYWgSBtw7izIZVoyE3bfZlw
 BeS+lMaC6L9zA==
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 17/17] drm/shmem-helper: Remove drm_gem_shmem_purge_locked()
Date: Sun, 24 Apr 2022 22:04:24 +0300
Message-Id: <20220424190424.540501-18-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
References: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panfrost driver was the only user of the drm_gem_shmem_purge_locked()
helper. Panfrost driver was converted to use new generic memory shrinker
and the helper doesn't have users anymore, remove it.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 30 --------------------------
 include/drm/drm_gem_shmem_helper.h     |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 045921ad4795..ef7691c84fa8 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -899,36 +899,6 @@ static void drm_gem_shmem_unpin_pages_locked(struct drm_gem_shmem_object *shmem)
 	shmem->sgt = NULL;
 }
 
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
-{
-	struct drm_gem_object *obj = &shmem->base;
-	struct drm_device *dev = obj->dev;
-
-	WARN_ON(!drm_gem_shmem_is_purgeable(shmem));
-
-	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
-	sg_free_table(shmem->sgt);
-	kfree(shmem->sgt);
-	shmem->sgt = NULL;
-
-	drm_gem_shmem_put_pages_locked(shmem);
-
-	shmem->madv = -1;
-
-	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
-	drm_gem_free_mmap_offset(obj);
-
-	/* Our goal here is to return as much of the memory as
-	 * is possible back to the system as we are called from OOM.
-	 * To do this we must instruct the shmfs to drop all of its
-	 * backing pages, *now*.
-	 */
-	shmem_truncate_range(file_inode(obj->filp), 0, (loff_t)-1);
-
-	invalidate_mapping_pages(file_inode(obj->filp)->i_mapping, 0, (loff_t)-1);
-}
-EXPORT_SYMBOL(drm_gem_shmem_purge_locked);
-
 /**
  * drm_gem_shmem_dumb_create - Create a dumb shmem buffer object
  * @file: DRM file structure to create the dumb buffer for
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 972687bf9717..8d7053c36fa6 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -195,7 +195,6 @@ int drm_gem_shmem_set_purgeable(struct drm_gem_shmem_object *shmem);
 int drm_gem_shmem_set_purgeable_and_evictable(struct drm_gem_shmem_object *shmem);
 
 int drm_gem_shmem_swap_in_locked(struct drm_gem_shmem_object *shmem);
-void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem);
 
 struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem);
 struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem);
-- 
2.35.1

