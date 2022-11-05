Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63161DFAD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 00:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC8D10E186;
	Sat,  5 Nov 2022 23:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825410E17D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 23:29:07 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EEDB166023A1;
 Sat,  5 Nov 2022 23:29:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667690945;
 bh=1aIGzcCvjyLUUVPxDDM1tAwba0BQ54V9K/SYg0wiQNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=leFFo47HkJIgbtrWrmcnTgMUs+UwjwiYQCkRLE1ntyfolcM9JjRMhmt2y47Rao6m5
 0GJN0ktUNpI+T47qdp+rok+f9Iv0crKZz3hAj9F0YyzwAcEeZFo3CgNt6MUddlg7Zo
 a8T8HOQ/Uf3/dpuSnpT1Fa1Vk1EI+n14ksrIMh2xw+VCu0qG/VPRlVyPWyf4g1hDMn
 mJchSjZpeNDUu4ilHzgPxA0mhuiPOprbFiEMSD4yFAmkwLNu0NGB7Uav6uhucuFLXz
 zsoxW/G8bJ+uQyaVauhN8nSforYrqrf/egcmC9cEaqnJTEbHslGxwXoE092rOQJHKx
 fN9Co0bgtjvIQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v8 2/7] drm/shmem-helper: Don't use vmap_use_count for dma-bufs
Date: Sun,  6 Nov 2022 02:27:14 +0300
Message-Id: <20221105232719.302619-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
References: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DMA-buf core has its own refcounting of vmaps, use it instead of drm-shmem
counting. This change prepares drm-shmem for addition of memory shrinker
support where drm-shmem will use a single dma-buf reservation lock for
all operations performed over dma-bufs.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 35 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..801033b48893 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -293,24 +293,22 @@ static int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
 
-	if (shmem->vmap_use_count++ > 0) {
-		iosys_map_set_vaddr(map, shmem->vaddr);
-		return 0;
-	}
-
 	if (obj->import_attach) {
 		ret = dma_buf_vmap(obj->import_attach->dmabuf, map);
 		if (!ret) {
 			if (WARN_ON(map->is_iomem)) {
 				dma_buf_vunmap(obj->import_attach->dmabuf, map);
-				ret = -EIO;
-				goto err_put_pages;
+				return -EIO;
 			}
-			shmem->vaddr = map->vaddr;
 		}
 	} else {
 		pgprot_t prot = PAGE_KERNEL;
 
+		if (shmem->vmap_use_count++ > 0) {
+			iosys_map_set_vaddr(map, shmem->vaddr);
+			return 0;
+		}
+
 		ret = drm_gem_shmem_get_pages(shmem);
 		if (ret)
 			goto err_zero_use;
@@ -376,15 +374,15 @@ static void drm_gem_shmem_vunmap_locked(struct drm_gem_shmem_object *shmem,
 {
 	struct drm_gem_object *obj = &shmem->base;
 
-	if (WARN_ON_ONCE(!shmem->vmap_use_count))
-		return;
-
-	if (--shmem->vmap_use_count > 0)
-		return;
-
 	if (obj->import_attach) {
 		dma_buf_vunmap(obj->import_attach->dmabuf, map);
 	} else {
+		if (WARN_ON_ONCE(!shmem->vmap_use_count))
+			return;
+
+		if (--shmem->vmap_use_count > 0)
+			return;
+
 		vunmap(shmem->vaddr);
 		drm_gem_shmem_put_pages(shmem);
 	}
@@ -646,7 +644,14 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent)
 {
 	drm_printf_indent(p, indent, "pages_use_count=%u\n", shmem->pages_use_count);
-	drm_printf_indent(p, indent, "vmap_use_count=%u\n", shmem->vmap_use_count);
+
+	if (shmem->base.import_attach)
+		drm_printf_indent(p, indent, "vmap_use_count=%u\n",
+				  shmem->base.dma_buf->vmapping_counter);
+	else
+		drm_printf_indent(p, indent, "vmap_use_count=%u\n",
+				  shmem->vmap_use_count);
+
 	drm_printf_indent(p, indent, "vaddr=%p\n", shmem->vaddr);
 }
 EXPORT_SYMBOL(drm_gem_shmem_print_info);
-- 
2.37.3

