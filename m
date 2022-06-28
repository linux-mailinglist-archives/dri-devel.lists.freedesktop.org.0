Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609355F0A1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6A610FED6;
	Tue, 28 Jun 2022 21:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179110FED6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453274;
 bh=9pGj8mBf5olrIdtsRlLs4F4OF32vuk2tUJKtWssM8gM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FletTjN87mTsNvO+iVvwK8DZNAhnE5X81P4aGbImCV/gHL3Y7HVETcwpcgupwv3r7
 M4171ZTVVq16w0ZBX3EqSaFcaFqQ/o8YLnBECMKIFOpf2VDdA7Ee6ruOG7ASnRILrF
 He72VDxoKE639zaRI96E6e8zrJYxtey0r49dUG3I=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MYNNo-1oA2Xr0hz0-00VN6g; Tue, 28
 Jun 2022 23:54:34 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 17/32] drm/via: Add via_ioctl.c
Date: Tue, 28 Jun 2022 16:52:31 -0500
Message-Id: <20220628215246.19706-18-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vHMjs66y1YPaWoW3srgR4Cf5TILg2YkhwZ6cN+EwfNkD7oIUAUk
 fnFUOryhxPLaigje+XR8sgms/rh557xlvM0e0QcnbD4bX9ZuHj7ZEs21Ftdz0HuzSKKek2g
 9JDt9kAh3vS16dbI6rs55yxemclg7Ooffv+N8gwBYXVD2s0I/qaQlJJX+R7De3I8ZdpTqZj
 K7wZJ2fne3C5FpAPiX+Aw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z2kbQmFcR08=:xTntyDGPaIICQheup9gIzM
 b4li3L9pE2uVIUx08qyYCnoRuZeMcIYCubwXWm1+HGArLoaNnCy4OPmY9KG3NkhQA7G5wwdHt
 ScKBHhBdbu2pQ3lTJp9WwX9zzshGlcZ3u9MhnBtI+CT9ajs8Z2PII3IA7FfP9/ufLk7I3ZJaA
 VLWTZE6J20g4cMfItBRClDv97ULbQQUu+r/Tzvj5Q8Y2kfYY9LvjbUYfBegWTuB4XYPxV6JYB
 wIxUM9k1iQaIxqb7CJcF+XhOenGOHs1kb5ZhupEr0dq7tb0UaZ/N7Br8JzzwRuCBDRpEi6lgK
 BmCbUgeSxyWYGa2Ik+rmPoXusQPatO9PQqdOHYZNSqESxHOeqgfT6WCy/fAtPS4vKKPfG5teA
 8jefjPMb2KVH7qZUCV+CYv4GRnwjiuk+UuTHsq/XS0s6ZmiyNB8MXfd+LBOns6DhLzdKh0tYt
 eqY7FB5nEBpUQikB7vVkxrZIlLQuQ+y8vPLQd7M/yemmUyhjn5pbyGC6mTi18HH6Jy9e4AZAY
 hI+z7695OM1YPYxQWBSBKkdSksbQpOfKBD42PSX8je0qU1oQUgp+FcxKUtHnwK0/OwT7sDeyw
 aviBxVwm3y28aPnwMhQe15H+Ao/IU2iU8Y3jeZZ75Lhr9G5WfdF/uRREac/5MkXqRwCySJYoa
 DrvzAKi12hrP0awCYcoN4Nxu5NrVIlKe4mmMNifM9UKRcOBQFZ+QvuLDrdQilbAoa609lw64Z
 0CXvxkPL1xenG61flLyKB9I16xZNWWIvih+2/LNOeaLV4Qo9G/4toPEK3jnNSM/s/KvOfdtqb
 YIMTPGEUB+G2Z9vrBZ56PEr+l4XTb0bm4WjopLdcSpD4hcpGL4O1qQbtfKtGhbPdwMjGqBBG9
 GB012Uk3Nt2itiFTORGnfWCbk8QP6rONTLsN0k6CFkiRkXu/pTFpq8bqI4mfjPY2Jp8f0bX2Z
 kFw1trF3rh7XgBJeIiTIsqW79riS8355KZMZtEgaWDPmGX2QD/oybN/KhrO1OKrQkoxTONmaw
 4bqdKbDGVw25PGXza2LBQk6sF1jgTKbL4wG76EuJZ7o2xn1PUX/8KNP5o3MJs/mgj0642B3KF
 IeNNw1aqXEtQRon3/XPN+IQnTetGFl19Th9jhMkp/9mE9iWDpokPaS+cA==
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
 drivers/gpu/drm/via/via_ioctl.c | 122 ++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_ioctl.c

diff --git a/drivers/gpu/drm/via/via_ioctl.c b/drivers/gpu/drm/via/via_ioc=
tl.c
new file mode 100644
index 000000000000..24d72bf4d53a
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_ioctl.c
@@ -0,0 +1,122 @@
+/*
+ * Copyright =C2=A9 2020 Kevin Brace.
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
+
+#include <drm/drm_gem.h>
+#include <drm/drm_ioctl.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+
+#include <uapi/drm/via_drm.h>
+
+#include "via_drv.h"
+
+
+static int via_gem_create_ioctl(struct drm_device *dev,
+					void *data,
+					struct drm_file *file_priv)
+{
+	struct drm_via_gem_create *args =3D data;
+	struct ttm_buffer_object *ttm_bo;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_bo *bo;
+	uint32_t handle;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ret =3D via_bo_create(dev, &dev_priv->bdev, args->size,
+				ttm_bo_type_device, args->domain, false, &bo);
+	if (ret) {
+		goto exit;
+	}
+
+	ttm_bo =3D &bo->ttm_bo;
+
+	ret =3D drm_gem_handle_create(file_priv, &ttm_bo->base, &handle);
+	drm_gem_object_put(&ttm_bo->base);
+	if (ret) {
+		via_bo_destroy(bo, false);
+		goto exit;
+	}
+
+	args->size	=3D ttm_bo->base.size;
+	args->domain	=3D ttm_bo->resource->placement;
+	args->handle	=3D handle;
+	args->offset	=3D ttm_bo->resource->start << PAGE_SHIFT;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_gem_map_ioctl(struct drm_device *dev,
+					void *data,
+					struct drm_file *file_priv)
+{
+	struct drm_via_gem_map *args =3D data;
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	gem =3D drm_gem_object_lookup(file_priv, args->handle);
+	if (!gem) {
+		ret =3D -EINVAL;
+		goto exit;
+	}
+
+	ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+
+	args->map_offset =3D drm_vma_node_offset_addr(&ttm_bo->base.vma_node);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_gem_unmap_ioctl(struct drm_device *dev,
+				void *data,
+				struct drm_file *file_priv)
+{
+	struct drm_via_gem_unmap *args =3D data;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ret =3D drm_gem_handle_delete(file_priv, args->handle);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+
+const struct drm_ioctl_desc via_driver_ioctls[] =3D {
+	DRM_IOCTL_DEF_DRV(VIA_GEM_CREATE, via_gem_create_ioctl, DRM_AUTH | DRM_U=
NLOCKED),
+	DRM_IOCTL_DEF_DRV(VIA_GEM_MAP, via_gem_map_ioctl, DRM_AUTH | DRM_UNLOCKE=
D),
+	DRM_IOCTL_DEF_DRV(VIA_GEM_UNMAP, via_gem_unmap_ioctl, DRM_AUTH | DRM_UNL=
OCKED),
+};
+
+
+int via_driver_num_ioctls =3D ARRAY_SIZE(via_driver_ioctls);
=2D-
2.35.1

