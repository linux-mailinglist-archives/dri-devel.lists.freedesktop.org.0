Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59155A2BB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404C10F495;
	Fri, 24 Jun 2022 20:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1574A10F495
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102816;
 bh=9pGj8mBf5olrIdtsRlLs4F4OF32vuk2tUJKtWssM8gM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=j+d1mVut48xxMzanHUW9Dj/99k81zSTfp+kLFpXcjqamq5WwfA/QNB5qRYYcT5RGe
 cXJhmNOQevSlureKKwefm8sMiOJzjBYylzOXaIaGzxo4VKIcNHndOfOWsYIRt7LCI6
 VDdYMm138bR1qveQuIJ86TE6CE2/dmV8oHWmOzBA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MrQIv-1nHDLd2pCJ-00oVY5; Fri, 24 Jun 2022 22:28:34 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/28] drm/via: Add via_ioctl.c
Date: Fri, 24 Jun 2022 15:26:21 -0500
Message-Id: <20220624202633.3978-17-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:txrp3aRf60nsX3J/K1qh5Ew3xE6KeNlQOq6ImEf1xYNeUN2hhV0
 /Fo3ioJvHWCt6ffcoF8QkpBS195nIyixJ++MEzsDR3QZCOc7qwiIecUvJVkZ5JjxwLKOjqz
 ifdycfjBhUEBp+1ZGPvOgwEAphukIJFc1mZNx5ZOIShN/dmAbzVRvokICxSWab0ymchEbRF
 /oQTHo0eB71yGNf8Xn8QQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yNUCskWMkTs=:4wus6qxqiaZIQw/YUPe3xo
 k3SKx9Pssi+mEp9c3lIYdVm5OIGzOM8MRTxu1px1YoGqdYan9PbPHc+vjyTQYHKiPqpd5FpkU
 H9woQ3ACAfVkS1idauPXB2RCunVdc+EJ6CZNwTltlrvp7C9VxVQEJk9mV8bRX36pusQPzjbvs
 Cus8iHwNcKAAaon5K96wMQBkXt/M1PJdevJ3jrVbSgkyezaJO2+Oqng1HunPpkE8RAuHx4c0b
 vx04GY0eUAhVaKSSoQmCggiZj1MrLxUaJc984ZARyYQ1X/IoAeH4Pi/RSSqHZWBrs0Dt/9wkd
 z+RCXgR3x2UYQNNWzbafGTCT6nNm4ncfiee0mIKW4+XGrlTiMGR7mTvYdB1ID5QL99RaQJjLg
 kmSLDQJ+bmC5sQv1Q+UX20QeKpcNag+RJ9B1o8cMLYJA9H7UODT71WQbjXe2AtjlD4vctRQ5Q
 wdD5d/8s4sFOp7568ESunwAsYqAy5KcjZTTVdcVftK3d/RM1enRbVUZS+IxzArCxFGOy02Eni
 hthOlIgesHew3GiaHtfygJ+fL5x+E1ojspvQtWZ+sgzpGZOAKlXiPg/B9D3S4GjnjsOq6RBHm
 nwtiIU8pOMp9GuJsmJWB2XxXmbNRxVKag/DWlQ0wEc4uP09LuOQVAzbZl/PTOqNVsTfBw3tDl
 IjWK2DJ948g0fb6LgXGQXyvA1uIY9qMt+fWIJnXrIgWzknK1MvjdBNrOuN87mkyacB59Ffo2X
 BFc3/lDPSFycRKWHvDcnsc2KqfrLsfaxlz9zCFCMYpkR+xl4fkTxfUhk7mff5Nu4FrpVREBAe
 14E9J2ybpWUvn6Kj+6979Vt539Eoz3/McI2dF1TImz9me4B1B8foJORzhfkp4hv7if5Nfjibh
 ER2ZDW2DKL1m6z2W4rYHh9S9o/I95LXLK+dboF3WkfYK9pzcAoIFBgLi4hWv/HSsLhinUBCla
 wTDso56bcGBMvztCXELyykSZ/6n8xdlLFWTzY/IScTMVAx63+i+iNuBGtn7Dr6Goumimlzl4q
 OJaU43Dfzt0qlzD4jXfxS97PxgqrZGLQKKdiRwDzVXDeQPoTfY/tq8jckNt6/iJd9Jjj0kgCa
 Ga4hD9Zzed3c4IhCw9rOScPDGU0OtwNza6PkU1BKM1EKAgDDNuPwAL5zQ==
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

