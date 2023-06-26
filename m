Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 426BF73DE62
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1064110E1ED;
	Mon, 26 Jun 2023 12:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98BB110E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:02:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A8406607153;
 Mon, 26 Jun 2023 13:02:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1687780975;
 bh=sWh39NW5LoQNauNv9C28QV+IdVUwgwQoOS9c8mIjZqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YKtYrbMPqpcc1xhtYRWOqpGNnIpRCuDi1/cxQ4SbhxBoiSY+j0e6FePmdREVJp84o
 lZ8u/Fzd73MBPMOODyoe4U9swl6R5LsoQmBwFpga/Np+McYVPMS/Tgic6WRS321TSc
 T6Seaw4rp1sWhGQXSeQ/LnbS/5ezLa8bXchlLY5p5GGa0ZyyrwMCrZyxLgAjcgJqnm
 bul1/MuIf00YGEI7ET5IxAeyowV3GYTKi4+07UCPZjouuFFbqbFRfToMpfof1B34mw
 CiawzYFV1Xu2aNm3cIVqwucB71RudF2SNmBUe0RYtaACzkm6+mAPvjHY7Yvoxa1+fo
 V7djSiSeLLzNg==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/shmem-helper: Make dma_resv_assert_held()
 unconditional in drm_gem_shmem_v[un]map()
Date: Mon, 26 Jun 2023 14:02:46 +0200
Message-ID: <20230626120247.1337962-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230626120247.1337962-1-boris.brezillon@collabora.com>
References: <20230626120247.1337962-1-boris.brezillon@collabora.com>
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_resv lock should be held in both the dma_buf and native GEM case,
so let's just move the dma_resv_assert_held() check out of the !dma-buf
block.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index f406556e42e0..2b8a32f6b656 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -288,6 +288,8 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
@@ -299,8 +301,6 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *shmem,
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
-		dma_resv_assert_held(shmem->base.resv);
-
 		if (shmem->vmap_use_count++ > 0) {
 			iosys_map_set_vaddr(map, shmem->vaddr);
 			return 0;
@@ -354,11 +354,11 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *shmem,
 {
 	struct drm_gem_object *obj = &shmem->base;
 
+	dma_resv_assert_held(shmem->base.resv);
+
 	if (obj->import_attach) {
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {
-		dma_resv_assert_held(shmem->base.resv);
-
 		if (drm_WARN_ON_ONCE(obj->dev, !shmem->vmap_use_count))
 			return;
 
-- 
2.41.0

