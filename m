Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 029637DB016
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 00:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5035910E1D7;
	Sun, 29 Oct 2023 23:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAE010E1D5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 23:02:51 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7B5E266073A6;
 Sun, 29 Oct 2023 23:02:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698620570;
 bh=SLnQz6auxyR/8a6Jw3cAOBNHaot5EBQ+F2hZkkWgFME=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YXhiSes4ej4iBjp3tJ08F0kFblMQpIxVWEDb27XR0MszMbc1rPVoczrip+8IBQLfg
 1WZFmkRlA7ewY1CkHx4BmwZ3BEu5mdUPVamTUpW90A/p8+LRYV72yqyIQoq+mez+fN
 ftth/3zKXV028Fzvfz6L8dAi7NcvtfnqJdeBLN4Q8mT8opYpbxktyypLXQ0hR/o71X
 eFLiay7FDNtK1H6h8Xl8+nsJ+UkeMs2YZWzc8CChVWJ4QqLbdf7rE5vgm2D4Kswtgo
 CvqekgMbmzZPDyFKQ5zzriUnP9y9xgKauxoPpCZYh4hPN8PnJs/lBRc3wrnksDRUVu
 J+pZaiI0oCTzQ==
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
Subject: [PATCH v18 16/26] drm/virtio: Explicitly get and put drm-shmem pages
Date: Mon, 30 Oct 2023 02:01:55 +0300
Message-ID: <20231029230205.93277-17-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
References: <20231029230205.93277-1-dmitry.osipenko@collabora.com>
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

We're moving away from implicit get_pages() that is done by
get_pages_sgt() to simplify the refcnt handling. Drivers will have
to pin pages while they use sgt. VirtIO-GPU doesn't support shrinker,
hence pages are pinned and sgt is valid as long as pages' use-count > 0.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index ee5d2a70656b..998f8b05ceb1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -67,6 +67,7 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
+		drm_gem_shmem_put_pages(&bo->base);
 		drm_gem_shmem_free(&bo->base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
@@ -196,9 +197,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 		return PTR_ERR(shmem_obj);
 	bo = gem_to_virtio_gpu_obj(&shmem_obj->base);
 
+	ret = drm_gem_shmem_get_pages(shmem_obj);
+	if (ret)
+		goto err_free_gem;
+
 	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
 	if (ret < 0)
-		goto err_free_gem;
+		goto err_put_pages;
 
 	bo->dumb = params->dumb;
 
@@ -243,6 +248,8 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
 	kvfree(ents);
 err_put_id:
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
+err_put_pages:
+	drm_gem_shmem_put_pages(shmem_obj);
 err_free_gem:
 	drm_gem_shmem_free(shmem_obj);
 	return ret;
-- 
2.41.0

