Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470E58087D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E07010F679;
	Mon, 25 Jul 2022 23:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A580D10F5F9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793204;
 bh=cTXTzsCe2FkTyUhfEq4PFZukFI41R7l0mhJjwNXqjZQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=K/cvrkEj/5tRy8HDYtpe2LiYZvg4hxaX/LJSd+pbSrhMccKrbmmVER74OkDamb7+a
 AQMeScOP4Z8hXZGhxLE+4rRWWT0GAUSDPXI0y0IDZCRQuG2bHWPzqdab1bG//iFCCW
 5ORHCR2RUKJFxT1MX3TIo81Oex/EO09ckAobi6jk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MK3W0-1nujef3U7y-00LTsE; Tue, 26 Jul 2022 01:53:24 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 19/32] drm/via: Add via_object.c
Date: Mon, 25 Jul 2022 16:51:14 -0700
Message-Id: <20220725235127.20433-20-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5XddmFVMZJUI46vySha3cR4mcv0gNn6DeqoESrU5gpAYQQCN41U
 3UD9gFYts7uK1+mYYrpPuiP1/CvMTJwXaLEq53VYPtiD2oss4SZFC6h+nURrpkgxNlERkXi
 pL1zL+T6E0GZyMkqNh0WYNoO6CgNPGPgffNM/9RkmWYEq3INzYY4jvf4v3g4fdWAF1fxRmS
 robR4YbcUpnuHwo/XW5nw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vWCiNQTwmcs=:A5+Ltarci2i/izEUGEE5Nu
 xFMustbAwZEcmpQJkPqFcvwxdPXFWgeTfUfK9w+qo0WHa7uYYM4FeMv3RV1yLalabJkaw39Pz
 YNOyQH25Boj+fwH7pNPsCvyG4lvhpxeDvpsQRhNP8EX+8xdI7Z/XSm6nbpkQ9UL4l9jgPpjSn
 RmZmwME1nFL6MYsnnYluzDD+Re2rBFPgkdFUFtuHTubjC2VhCB6wodXl7cZ255ThzBwHhYqXG
 wqWdPWHqmIo9wLcIZpVDH4Jhlp/sWpI0BzUQ6gyIP7ODQZNkC52a/mZgw4n6ixGFfUkO3LJOG
 IhQKcDw8Wct0df+MxbGmsdh9nckoAk1Nt6vNp6CujxEnLfZU4Wdjj7BHZNVErfwsWAfEGjG1q
 skSf7k5zxyO76ZCzP7pPOnsuP597uQpWMrluj9LVh+7u7mILGc6cqPou7yfrCGRJ5dqg1Mi9G
 25QKgAT6766bm9mJsyJcGefIgU7BvspHrZZbKB5scfDZXXqTJafyy7gKwYoito8U9r5s3xo5l
 ItjmpfzCeb4CSIH6D4hfrbT1kZisIRDhGVI6fuafMn02P/xV/wH8plqEmhGT/mzOBqj/e21F9
 RsWr/UYVdxMd1Yr8SC4ccXnzW4/wSAWN7HGiti27En5j4vxTFy1Y7/UEmDXQ5/bB41rMbkO1+
 7u5uvD84clU7Gy3EPLy2NsN5ez8YG1ToGVOdb4ef2ZtJM/qmQLYIfKEEbJAqqQVOg2pQXY9MM
 d8CqD4jJ+tztdeW9tPU4BE0wwIdaeJEZy+gWtqmDJLMVGS1QB8woWq66K+RrUt8vTfKtf0UIk
 g7OFEpOzpwOyvfccncKu8hDH61iIuTdjkDr8065gFgSLNf/syywTg3yliPfa/Sbtdjb0bSGSq
 fTaTjWUgS8PkOZ1Kj46moQSmb1s8NLSogxN3IeRG9gfThRvdZrSaavRt6V/ogrI4L4+UoLeci
 gVbfCZFv3Oh+3Cj0vy9bHsLqKM9JTBzTbcxSfgCPQrRCdlBpcDaInVa7Tbt3fBMivYE6CKrfh
 V4WTIbXmIciGWZzZV6Xalk65wqEd2HLZZRYBlbiwg9c1v4kMNtCb0FuoKshD7Wck24ueSeZyj
 scFl9ObzMifmBGQo7U/VdCUh9/ZohYm6l9IbT1X4FCAdVs98uR8wP/Nyg==
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

