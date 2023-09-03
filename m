Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9579790D07
	for <lists+dri-devel@lfdr.de>; Sun,  3 Sep 2023 19:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275BE10E0DB;
	Sun,  3 Sep 2023 17:08:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8CB10E0DB
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Sep 2023 17:08:40 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BAF8B66071F8;
 Sun,  3 Sep 2023 18:08:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693760919;
 bh=P7R5QSmRFRQLCbs8803cAJaEncR1mYKqji6ZAGoWj5Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lkK0I9ocYRZBQDuh09NtCXaRVJrAvForIAafkU4qlgHjYVmitRxj92NQLBrDPFytT
 Zb/vANNPODwCgMo6qfPDx88sKabt8oZnElTB/IPaf/eI237BJGD//JQ0KbMcBwv8Hj
 EqDPvDNOZuZXj55e/dL+DFin7el6lBbcaBA4ffDBs9cmw2zHIOVeZp4E/gHzn9SuwA
 b2C/XT/jXL3w/D3I+MtCuoJ8h1kiP6ZFcBXSn1Oh44aEl+jXgw9vJk3wm2sSBJdiYR
 XIXgePBE4xCZj4ot6HH2SOQGIIokfRHpC7OhqZV/7FW+eCm8Mb8XTQx2ukr1EU6xbp
 oKIXaC/bwoDXQ==
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
Subject: [PATCH v16 02/20] drm/shmem-helper: Use flag for tracking page count
 bumped by get_pages_sgt()
Date: Sun,  3 Sep 2023 20:07:18 +0300
Message-ID: <20230903170736.513347-3-dmitry.osipenko@collabora.com>
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

Use separate flag for tracking page count bumped by shmem->sgt to avoid
imbalanced page counter during of drm_gem_shmem_free() time. It's fragile
to assume that populated shmem->pages at a freeing time means that the
count was bumped by drm_gem_shmem_get_pages_sgt(), using a flag removes
the ambiguity.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 11 ++++++++++-
 drivers/gpu/drm/lima/lima_gem.c        |  1 +
 include/drm/drm_gem_shmem_helper.h     |  7 +++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 6693d4061ca1..848435e08eb2 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -152,8 +152,10 @@ void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem)
 			sg_free_table(shmem->sgt);
 			kfree(shmem->sgt);
 		}
-		if (shmem->pages)
+		if (shmem->pages) {
 			drm_gem_shmem_put_pages(shmem);
+			drm_WARN_ON(obj->dev, !shmem->got_pages_sgt);
+		}
 
 		drm_WARN_ON(obj->dev, shmem->pages_use_count);
 
@@ -693,6 +695,13 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 	if (ret)
 		goto err_free_sgt;
 
+	/*
+	 * This flag prevents imbalanced pages_use_count during
+	 * drm_gem_shmem_free(), where pages_use_count=1 only if
+	 * drm_gem_shmem_get_pages_sgt() was used by a driver.
+	 */
+	shmem->got_pages_sgt = true;
+
 	shmem->sgt = sgt;
 
 	return sgt;
diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 4f9736e5f929..67c39b95e30e 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -48,6 +48,7 @@ int lima_heap_alloc(struct lima_bo *bo, struct lima_vm *vm)
 
 		bo->base.pages = pages;
 		bo->base.pages_use_count = 1;
+		bo->base.got_pages_sgt = true;
 
 		mapping_set_unevictable(mapping);
 	}
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index ec70a98a8fe1..a53c0874b3c4 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -73,6 +73,13 @@ struct drm_gem_shmem_object {
 	 */
 	unsigned int vmap_use_count;
 
+	/**
+	 * @got_pages_sgt:
+	 *
+	 * True if SG table was retrieved using drm_gem_shmem_get_pages_sgt()
+	 */
+	bool got_pages_sgt : 1;
+
 	/**
 	 * @imported_sgt:
 	 *
-- 
2.41.0

