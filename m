Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFB87A11C5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87D110E5AF;
	Thu, 14 Sep 2023 23:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF58C10E5A9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:29:14 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 88FB26607355;
 Fri, 15 Sep 2023 00:29:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694734153;
 bh=NYBZUXkwlnba9uS/DTRAc0OWLbbAgnC6TGMpLFWWzHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FESwGYWauB9XDkampwVrtcAARQwz/q5ArfDM/gjc0/eFIbRZwrm4BYzrX3SgAI+HI
 atAeblijs3Ca98BkeNuNUOffwt/bEamEQe1/wIexmpdLLnAT0caUrQTLsvqqaY5ToO
 1wqoAuTIaJNGvI6aaizAgZlQ/ySdvIyAVAeXQHIQyBDZuuneLDG5Cfliy5HfuNHoyp
 ii2C3suH9aYRQzcaovq2tM30/et7ypoUW/mlATxK+K246U1ORytwv7fXr4dX9c0kKW
 JXHKK1tl5pceKSI7Gq5D4Uq57b5qkak0+uTuTYqBDHm1qUpf9poFbvjOj3CxvzoPej
 XYjNeuM7cIWNg==
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
Subject: [PATCH v17 11/18] drm/shmem-helper: Improve
 drm_gem_shmem_vmap_locked() error handling
Date: Fri, 15 Sep 2023 02:27:14 +0300
Message-ID: <20230914232721.408581-12-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
References: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
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

Remove error unwinding from drm_gem_shmem_vmap_locked() making error
paths consistent for both dmabuf and non-dmabuf cases and improving
readability of the code. Often it's preferred to do the explicit error
unwinding, but this multi-path function is an exception.

Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e1fcb5154209..8a8eab4d0332 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -334,7 +334,7 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 			      struct iosys_map *map)
 {
 	struct drm_gem_object *obj = &shmem->base;
-	int ret = 0;
+	int ret;
 
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
@@ -357,6 +357,7 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 		shmem->vaddr = vmap(shmem->pages, obj->size >> PAGE_SHIFT,
 				    VM_MAP, prot);
 		if (!shmem->vaddr) {
+			drm_gem_shmem_unpin_locked(shmem);
 			ret = -ENOMEM;
 		} else {
 			iosys_map_set_vaddr(map, shmem->vaddr);
@@ -364,16 +365,8 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 		}
 	}
 
-	if (ret) {
+	if (ret)
 		drm_dbg_kms(obj->dev, "Failed to vmap pages, error %d\n", ret);
-		goto err_put_pages;
-	}
-
-	return 0;
-
-err_put_pages:
-	if (!obj->import_attach)
-		drm_gem_shmem_unpin_locked(shmem);
 
 	return ret;
 }
-- 
2.41.0

