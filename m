Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DED5356A3
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:55:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC7910F5F3;
	Thu, 26 May 2022 23:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52510FCAC;
 Thu, 26 May 2022 23:55:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 2267F1F459F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609301;
 bh=lVCPHIzviQq20mwfYzjAOHeqfWQImXXPIbBe9D1xXlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgJiezMp0flB1v25Q2Qf+DKO9Z1KSTZhHbhRu4emPSpVxY8ydKzqqljeN8OvT3Zfm
 GrP0nApOiROsSpJFfBcj1DyH73EH0cx4M+sXeMFmY2X1O+tgBqJmIgvNg2zNZPTrq5
 7aaOMTMy06r67/fYRlAAGg8Uj8LgyTB2oLLIK5m5SqQsQ0F3bzhxaFYXKeuxUx/9O3
 aGf+6kjjtfDGFXJe6P3P5Dj7ARG9p3Esis4XUMKvQ14ji6tydjFaZnTly7l9zc5aMF
 G3ZJsS7pa52FSEEgAAWuj0+B5tDvwLfEiUhZbVoRVzd0E14r52LRd+xs0iz4bi5BwN
 beCPhQzt0HN2Q==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 15/22] drm/shmem-helper: Don't use vmap_use_count for
 dma-bufs
Date: Fri, 27 May 2022 02:50:33 +0300
Message-Id: <20220526235040.678984-16-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to refcount vmappings of dma-bufs because dma-buf core
has its own refcounting. Drop the refcounting of dma-bufs. This will ease
replacing of all drm-shmem locks with a single dma-buf reservation lock,
preparing drm-shmem code for addition of the generic drm-shmem shrinker.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 35 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 7232e321fdb4..fd2647690bf7 100644
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
@@ -637,7 +635,14 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
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
2.35.3

