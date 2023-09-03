Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1602F790D0B
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4431D10E0FB;
	Sun,  3 Sep 2023 17:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2127910E0DB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:08:45 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 90A5966071EB;
 Sun,  3 Sep 2023 18:08:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693760923;
 bh=fRLodgl07tao4BtPSyoT/6xlg7PcCsmg2piBCDZKcAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QtGYq8O0g9C4ZYlxVdjzMixfcWByVNYNQUa22ApGRn5b8LkXa7O/c5kspKXsCBwSw
 s9dk4e3ZDApNNLRCWfGPAwMivujnr0zAyDEpWJDMj/F5HQOE7RaBphONIASDTtcLq+
 NpCM+TBVdp/ZSgJ0nxFEb4aRIEd7jikaRApz7yto3wqJsBjpjog7dmNg6EN395RUVS
 Um1k9oAaosLcAaPbDrV2ZTv8tlDXBhTpOrCX+Xjpcw4TkJTOeeoogJ2x0IOj4DDRUP
 OBDsuykbiQ+xItdm4k3THhDDQbiHkEp0qKPUU/y9u6aqgJaXqMtdln5WAd/QoG4vLZ
 n1qj2VjrFXq/Q==
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
Subject: [PATCH v16 05/20] drm/v3d: Replace open-coded drm_gem_shmem_free()
 with drm_gem_object_put()
Date: Sun,  3 Sep 2023 20:07:21 +0300
Message-ID: <20230903170736.513347-6-dmitry.osipenko@collabora.com>
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

The drm_gem_shmem_free() doesn't put GEM's kref to zero, which becomes
important with addition of the shrinker support to drm-shmem that will
use kref=0 in order to prevent taking lock during special GEM-freeing
time in order to avoid spurious lockdep warning about locking ordering
vs fs_reclaim code paths.

Replace open-coded drm_gem_shmem_free() with drm_gem_object_put() that
drops kref to zero before freeing GEM.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/v3d/v3d_bo.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index 8b3229a37c6d..70c1095d6eec 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -33,16 +33,18 @@ void v3d_free_object(struct drm_gem_object *obj)
 	struct v3d_dev *v3d = to_v3d_dev(obj->dev);
 	struct v3d_bo *bo = to_v3d_bo(obj);
 
-	v3d_mmu_remove_ptes(bo);
+	if (drm_mm_node_allocated(&bo->node)) {
+		v3d_mmu_remove_ptes(bo);
 
-	mutex_lock(&v3d->bo_lock);
-	v3d->bo_stats.num_allocated--;
-	v3d->bo_stats.pages_allocated -= obj->size >> PAGE_SHIFT;
-	mutex_unlock(&v3d->bo_lock);
+		mutex_lock(&v3d->bo_lock);
+		v3d->bo_stats.num_allocated--;
+		v3d->bo_stats.pages_allocated -= obj->size >> PAGE_SHIFT;
+		mutex_unlock(&v3d->bo_lock);
 
-	spin_lock(&v3d->mm_lock);
-	drm_mm_remove_node(&bo->node);
-	spin_unlock(&v3d->mm_lock);
+		spin_lock(&v3d->mm_lock);
+		drm_mm_remove_node(&bo->node);
+		spin_unlock(&v3d->mm_lock);
+	}
 
 	/* GPU execution may have dirtied any pages in the BO. */
 	bo->base.pages_mark_dirty_on_put = true;
@@ -142,7 +144,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
 	return bo;
 
 free_obj:
-	drm_gem_shmem_free(shmem_obj);
+	drm_gem_object_put(&shmem_obj->base);
 	return ERR_PTR(ret);
 }
 
@@ -160,7 +162,7 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 
 	ret = v3d_bo_create_finish(obj);
 	if (ret) {
-		drm_gem_shmem_free(&to_v3d_bo(obj)->base);
+		drm_gem_object_put(obj);
 		return ERR_PTR(ret);
 	}
 
-- 
2.41.0

