Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B437655A2C1
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8E410F4A3;
	Fri, 24 Jun 2022 20:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E778C10F4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102827;
 bh=cTXTzsCe2FkTyUhfEq4PFZukFI41R7l0mhJjwNXqjZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eH8KbZAGUGC3CDw+BUwItRTXyqt8S0Eqj4KAb6ndmxl3R/iIyOYD6xpbUIOBZv7GP
 qlcreKuYJ12ReUwGgbszTgk+Iar6BlW3RT0citwDNFGzwDMYmu0433QBgINsOkOj2a
 ij8dnBZl6cG6TDJdJUQ1oKyvFioxDOYU2FCq8Ook=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1M7Jza-1o1VSg03fY-007hji; Fri, 24 Jun 2022 22:28:45 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/28] drm/via: Add via_object.c
Date: Fri, 24 Jun 2022 15:26:23 -0500
Message-Id: <20220624202633.3978-19-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:97fK220S/oyREizdpqbHcIn+7gDNS/i7sZd4B6h+/44nuko+4AF
 MrRktqR3MHLxIcHfW6b8KBZaoUXyOuNF1K56/KfL4+3AHSTrECsMUuLObHbTZQYXLgTCl3a
 CQIxPNxrCsNSyfB1ET5sJdQjUR9t9Y24oGLYxTK6ZdQWsO1ILfs/PEMyb7On+XULIvJKXYo
 U4YmK6VzMKVRAyEI1LOpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l/i7Vhg1XYM=:PFJyhcDhAFELyao1XzOhY6
 k3Wa6P54pY9DrkFT6pGtDc0yBF39eVT6i016Hp9LY5KhEXNmqUT3RmWEfaxOU3fnHNHUdYhEM
 mHegR9n76/ntPnSYWKhfdOc2Jx2yIiCbj/QBzItvuMOWuwfaIHXU4oxg3d1PswVQRLHbowdQA
 tNiBbeJMXUuEUqYzpbHDOr9xJHXYLmiZN1m+JwnEVzAjGNTA2g8/tMux+G+rgl0s5lPYvJrlF
 R94bX8MXzd8uU6bU+Y+rT8y//A2GT7qObX8qdtV1MXuyjmq+tI3o0LaX32+DgWQ8Unq0VpXP2
 BO8QKy6FYW9gz3Zev9J0SjAEFzlJ30CJn7cwFJVeDODK+SYaLM4MYqcFkOmRamgwI4062fugO
 gcEDswpEXJJ5qYesKiOtZih/lP3pwKzV70gLk23liaVpSa+dGzmeVugFA7KWVolUnTUVm13i7
 9BYaU2j1tCaRQl6MIe91A7vYyXO/j96AOWIfo/nQULbk3rBDXVANfViI+SarchVY0C0NilKPE
 /iOcCkaNiClC8c3wWcRvvnREr1MYKhnBzUoL3EKB6CW68WhsFhbGY/USjGp4rubrJ6lSFIXkj
 YucGJjwMdkHPpaWNxMqdrxCIcYKVG8uD4Ty93WtZyRCJc8xrNXsMsyr/noo06G1mQtofrEz+2
 s25Lr9az4c7kuQgtcbiFymXB7oxYsc3oTnulJHDnTlStYXgjgqrB1pwmAd5QZLQUmbi0PnsdS
 umoSOMgWPGZoY3XnmIzOGcJrRK6J7HowEQeTPqNupVTEObeQKSPL+Fu8Xojthl2pOmC3gdJbn
 z7Au9IQkBujuafEczfAhAB5Mhs9fZu7r373DrzcSfnvGl63ViL+ppz7nS3Cj1gog6UClHa332
 vVQ3uvRG1YMxP7qUES8H6i/FRPhfJseoJ/F87EbTgZGAV/HnAK73aUYLQ/hAYVsJoP3TIT8//
 JVrQwjETxd6nBkA1y2ir3PTD+aS+O2NTKtxUFgLh7lOVa+ATi4SRYtsHEV0A9R15SDibl6o2Y
 Wp9CsIhHxbgrc+rPV9lIJZKaEeqs3Dql6xR2OeOQlXmk2of4iAb43NlKbA1EiEFr8vILWompY
 L2KCGswbD7Pmpr/xQs4fHyh+KZqRoBwp9YEJy3zIqevfKD8ddiAAQ9WXg==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_object.c | 324 +++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_object.c

diff --git a/drivers/gpu/drm/via/via_object.c b/drivers/gpu/drm/via/via_ob=
ject.c
new file mode 100644
index 000000000000..96fb2934d0de
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_object.c
@@ -0,0 +1,324 @@
+/*
+ * Copyright =C2=A9 2018-2019 Kevin Brace.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ */
+/*
+ * via_object.c
+ *
+ * Manages Buffer Objects (BO) via TTM.
+ * Part of the TTM memory allocator.
+ *
+ */
+
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gem_ttm_helper.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
+#include <drm/ttm/ttm_range_manager.h>
+
+#include "via_drv.h"
+
+
+static void via_gem_free(struct drm_gem_object *obj)
+{
+	struct ttm_buffer_object *ttm_bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D container_of(obj, struct ttm_buffer_object, base);
+
+	ttm_bo_put(ttm_bo);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct vm_operations_struct via_ttm_bo_vm_ops =3D {
+	.fault =3D ttm_bo_vm_fault,
+	.open =3D ttm_bo_vm_open,
+	.close =3D ttm_bo_vm_close,
+	.access =3D ttm_bo_vm_access
+};
+
+static const struct drm_gem_object_funcs via_gem_object_funcs =3D {
+	.free =3D via_gem_free,
+	.vmap =3D drm_gem_ttm_vmap,
+	.vunmap =3D drm_gem_ttm_vunmap,
+	.mmap =3D drm_gem_ttm_mmap,
+	.vm_ops =3D &via_ttm_bo_vm_ops,
+};
+
+void via_ttm_domain_to_placement(struct via_bo *bo,
+					uint32_t ttm_domain)
+{
+	unsigned i =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bo->placement.placement =3D bo->placements;
+	bo->placement.busy_placement =3D bo->placements;
+
+	if (ttm_domain =3D=3D TTM_PL_SYSTEM) {
+		bo->placements[i].fpfn =3D 0;
+		bo->placements[i].lpfn =3D 0;
+		bo->placements[i].mem_type =3D TTM_PL_SYSTEM;
+		bo->placements[i].flags =3D 0;
+		i++;
+	}
+
+	if (ttm_domain =3D=3D TTM_PL_TT) {
+		bo->placements[i].fpfn =3D 0;
+		bo->placements[i].lpfn =3D 0;
+		bo->placements[i].mem_type =3D TTM_PL_TT;
+		bo->placements[i].flags =3D 0;
+		i++;
+	}
+
+	if (ttm_domain =3D=3D TTM_PL_VRAM) {
+		bo->placements[i].fpfn =3D 0;
+		bo->placements[i].lpfn =3D 0;
+		bo->placements[i].mem_type =3D TTM_PL_VRAM;
+		bo->placements[i].flags =3D 0;
+		i++;
+	}
+
+	bo->placement.num_placement =3D i;
+	bo->placement.num_busy_placement =3D i;
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_ttm_bo_destroy(struct ttm_buffer_object *tbo)
+{
+	struct via_bo *bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bo =3D to_ttm_bo(tbo);
+
+	drm_gem_object_release(&tbo->base);
+	kfree(bo);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_bo_pin(struct via_bo *bo, uint32_t ttm_domain)
+{
+	struct ttm_buffer_object *ttm_bo;
+	struct ttm_operation_ctx ctx =3D {false, false};
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	if (ttm_bo->pin_count) {
+		goto pin;
+	}
+
+	via_ttm_domain_to_placement(bo, ttm_domain);
+	ret =3D ttm_bo_validate(ttm_bo, &bo->placement, &ctx);
+	if (ret) {
+		goto exit;
+	}
+
+pin:
+	ttm_bo_pin(ttm_bo);
+exit:
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_bo_unpin(struct via_bo *bo)
+{
+	struct ttm_buffer_object *ttm_bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	ttm_bo_unpin(ttm_bo);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_bo_create(struct drm_device *dev,
+			struct ttm_device *bdev,
+			uint64_t size,
+			enum ttm_bo_type type,
+			uint32_t ttm_domain,
+			bool kmap,
+			struct via_bo **bo_ptr)
+{
+	struct ttm_buffer_object *ttm_bo;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_bo *bo;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
+	if (!bo) {
+		DRM_ERROR("Cannot allocate a TTM buffer object.\n");
+		ret =3D -ENOMEM;
+		goto exit;
+	}
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	/*
+	 * It is an imperative to page align the requested buffer size
+	 * prior to a memory allocation request, or various memory
+	 * allocation related system instabilities may occur.
+	 */
+	size =3D ALIGN(size, PAGE_SIZE);
+
+	ret =3D drm_gem_object_init(dev, &ttm_bo->base, size);
+	if (ret) {
+		DRM_ERROR("Cannot initialize a GEM object.\n");
+		goto error;
+	}
+
+	ttm_bo->base.funcs =3D &via_gem_object_funcs;
+
+	via_ttm_domain_to_placement(bo, ttm_domain);
+	ret =3D ttm_bo_init(&dev_priv->bdev, ttm_bo,
+				size, type, &bo->placement,
+				PAGE_SIZE >> PAGE_SHIFT, false,
+				NULL, NULL, via_ttm_bo_destroy);
+	if (ret) {
+		DRM_ERROR("Cannot initialize a TTM object.\n");
+		goto exit;
+	}
+
+	if (kmap) {
+		ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+		if (ret) {
+			ttm_bo_put(ttm_bo);
+			goto exit;
+		}
+
+		ret =3D via_bo_pin(bo, ttm_domain);
+		ttm_bo_unreserve(ttm_bo);
+		if (ret) {
+			ttm_bo_put(ttm_bo);
+			goto exit;
+		}
+
+		ret =3D ttm_bo_kmap(ttm_bo, 0, ttm_bo->resource->num_pages,
+					&bo->kmap);
+		if (ret) {
+			ttm_bo_put(ttm_bo);
+			goto exit;
+		}
+	}
+
+	*bo_ptr =3D bo;
+	goto exit;
+error:
+	kfree(bo);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_bo_destroy(struct via_bo *bo, bool kmap)
+{
+	struct ttm_buffer_object *ttm_bo;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	if (kmap) {
+		ttm_bo_kunmap(&bo->kmap);
+
+		ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+		if (ret) {
+			goto exit;
+		}
+
+		via_bo_unpin(bo);
+		ttm_bo_unreserve(ttm_bo);
+		if (ret) {
+			goto exit;
+		}
+	}
+
+	ttm_bo_put(ttm_bo);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+int via_mm_init(struct via_drm_priv *dev_priv)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/*
+	 * Initialize bdev ttm_bo_device struct.
+	 */
+	ret =3D ttm_device_init(&dev_priv->bdev,
+				&via_bo_driver,
+				dev->dev,
+				dev->anon_inode->i_mapping,
+				dev->vma_offset_manager,
+				false,
+				dev_priv->need_dma32);
+	if (ret) {
+		DRM_ERROR("Failed initializing buffer object driver.\n");
+		goto exit;
+	}
+
+	/*
+	 * Initialize TTM range manager for VRAM management.
+	 */
+	ret =3D ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM,
+				false,
+				dev_priv->vram_size >> PAGE_SHIFT);
+	if (ret) {
+		DRM_ERROR("Failed initializing TTM VRAM memory manager.\n");
+		goto exit;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+void via_mm_fini(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
+
+	ttm_device_fini(&dev_priv->bdev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
=2D-
2.35.1

