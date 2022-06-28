Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEC55F0B0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10E5112D43;
	Tue, 28 Jun 2022 21:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEFD112D48
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453351;
 bh=O8DrUxlHJZfVwOoWZZ8kiXA2S3OU18Enf1iV67R+JEs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MtdZfMESuYPlBIE6YPcu1rvsheLqzZdGtKuXB7GPdZ/VGekBqib2XK+XuZkssK2Vz
 wdjtPBMRvr6TXkqWc2WcQbq6FIewph3DIFLTzTKOH/5RD+HT0BPZQPoeFgaTSQnPnF
 MdyIpBosl6tl8hfMsFautcJIXdXmd2FuX7NISil8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MOzT4-1oIJjO06Y8-00PMMC; Tue, 28
 Jun 2022 23:55:51 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 24/32] drm/via: Add via_ttm.c
Date: Tue, 28 Jun 2022 16:55:12 -0500
Message-Id: <20220628215520.20674-5-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/2V2e5+FI5gvjmT/pFiD1kTrE3cL+R8xco3vlSTrBGUwOmE9gnu
 HWzLsNP7gBwvapFVfdP+S1mkT1rmDjKU7ERHFhJg2HE0Iup2159pUceg57a6GRerBFELzqZ
 h2QMMAiYDsRSBfAJjmjR1av9crvBW47Ztzo5PGN6bj6hy13K44AL0D+aEa1AjfZm6zMqLP7
 EAJ5Qen56boLkpi6ZivCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1wTmCsunUa8=:526cPUKva7/bZsKmfYBBoN
 aQ9jHSHsLg6tVO00Cqnj4yaVsuhwrvVgPImldsasNxzHldGTZJ8g+2PP1ES3qoOQE9eiXUYGf
 wFOWjwGG92veZOLsLgnugXy7l8eRxCwILo+JJeWiCk27yaW8D6fQPA9OQvoBjvh18LHPN0BXa
 DHSJn24tn7OgQ2ybsyoCg+u3ywOnjSHSmq8qULUcssrXFkH/Dre+6Cms803W31sZsdEJrUqwN
 grFN2ahWl48vcqCr/J1B5OQBLVdoUnX34ZSlJnxT/13KqxlWNNlUvRsjaGWePBcdztKhw7jzk
 r24hN/vHDNYg/YaWAi90t/KLgzD6x3KIjUY7AIGtkTNCycCSEmgLiKn7xFwRR8UvBzrbIvwRs
 7nX+Ce1ukDdlJmMj8h7S8gi3TPuks4KxV9Ykny8mccZfYoP1GLhPsR83LjnP4fadbt/yDi387
 laB9LiloOxYkWE2t/b5UMXdIKjzfVvqTvBWP0Pka9s2PM1cmu70tfIzbiGJeyj27RJ5/reUb1
 C2p/6YgIqRmqy4XEs8GanTcgM/Ozbtwe5qs29Ixz6mA5RBEXWpb2pbAah4iazQcUESjmCVK8E
 A6TYIi8jyBp6FzmOUHP5djAcgUU7WFQzxkG0Ga3RH0ZfZ23L2D1j/zSvVOl/iFzi7chVsPKOb
 TKH+8gSV73bPC8rs0SmXAAbwkKRpJYnkqai7zhz5iyq2CsmDkPat4SusBRHq/X1m2Trugq+2N
 r6J5iyzd4EzzqnDo8aUFraMDY9dAipRW3wcpgcJ0g9uJhJa0IPu+kCpVPQAMaWU1iR70KY9Nk
 o77yZYRg/upBPh0jUohxgf9N87JzSE6TATOcvDdCcBKCtMrqVjBygI9mVqKjTWUV1lpM7svrn
 yT6DKHENMULDM9TUGeNUVlrwjukvM7rRr+MfPh51U6Y6yLdbsiLmW96fh6ITvfHvCHwjL1RXX
 Pvm3h+MJyD6fnMZZjt5ZdyCk0Y5tjkhotns62q3CvA8PAbIkaXyi96lYydawfoHAQkoHNmfCu
 eBSmddJmW0sd05Fw05wO9ziMlSfeG1rkC5Defg54jpt6Q7XpdhD40zX9LPr7gtFsAO1qgklGx
 s7LpmGWK/qO3yYBB8OafYRORNyL0NcH5d+2S3uuFPIm/lLsN0oFr+DHAA==
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
 drivers/gpu/drm/via/via_ttm.c | 168 ++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_ttm.c

diff --git a/drivers/gpu/drm/via/via_ttm.c b/drivers/gpu/drm/via/via_ttm.c
new file mode 100644
index 000000000000..8676623ee074
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_ttm.c
@@ -0,0 +1,168 @@
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
+ * via_ttm.c
+ *
+ * TTM code as part of the TTM memory allocator.
+ * Currently a basic implementation with no DMA support.
+ *
+ */
+
+#include <linux/pci.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
+
+#include "via_drv.h"
+
+
+static void via_bo_move_notify(struct ttm_buffer_object *bo, bool evict,
+				struct ttm_resource *new_mem)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return;
+}
+
+static struct ttm_tt *via_ttm_tt_create(struct ttm_buffer_object *bo,
+					uint32_t page_flags)
+{
+	struct ttm_tt *tt;
+	int ret;
+
+	tt =3D kzalloc(sizeof(*tt), GFP_KERNEL);
+	if (!tt)
+		return NULL;
+
+	ret =3D ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
+	if (ret < 0)
+		goto err_ttm_tt_init;
+
+	return tt;
+
+err_ttm_tt_init:
+	kfree(tt);
+	return NULL;
+}
+
+static void via_ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *tt=
)
+{
+	ttm_tt_fini(tt);
+	kfree(tt);
+}
+
+static void via_bo_evict_flags(struct ttm_buffer_object *bo,
+				struct ttm_placement *placement)
+{
+	struct via_bo *driver_bo =3D to_ttm_bo(bo);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (bo->destroy =3D=3D &via_ttm_bo_destroy) {
+		goto exit;
+	}
+
+	switch (bo->resource->mem_type) {
+	case TTM_PL_VRAM:
+		via_ttm_domain_to_placement(driver_bo, TTM_PL_VRAM);
+		break;
+	default:
+		via_ttm_domain_to_placement(driver_bo, TTM_PL_SYSTEM);
+		break;
+	}
+
+	*placement =3D driver_bo->placement;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static int via_bo_move(struct ttm_buffer_object *bo, bool evict,
+			struct ttm_operation_ctx *ctx,
+			struct ttm_resource *new_mem,
+			struct ttm_place *hop)
+{
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_bo_move_notify(bo, evict, new_mem);
+	ret =3D ttm_bo_move_memcpy(bo, ctx, new_mem);
+	if (ret) {
+		swap(*new_mem, *bo->resource);
+		via_bo_move_notify(bo, false, new_mem);
+		swap(*new_mem, *bo->resource);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_bo_delete_mem_notify(struct ttm_buffer_object *bo)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_bo_move_notify(bo, false, NULL);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return;
+}
+
+static int via_bo_io_mem_reserve(struct ttm_device *bdev,
+					struct ttm_resource *mem)
+{
+	struct via_drm_priv *dev_priv =3D container_of(bdev,
+						struct via_drm_priv, bdev);
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (mem->mem_type) {
+	case TTM_PL_SYSTEM:
+		break;
+	case TTM_PL_VRAM:
+		mem->bus.offset =3D dev_priv->vram_start +
+					(mem->start << PAGE_SHIFT);
+		mem->bus.is_iomem =3D true;
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+struct ttm_device_funcs via_bo_driver =3D {
+	.ttm_tt_create =3D via_ttm_tt_create,
+	.ttm_tt_destroy =3D via_ttm_tt_destroy,
+	.eviction_valuable =3D ttm_bo_eviction_valuable,
+	.evict_flags =3D via_bo_evict_flags,
+	.move =3D via_bo_move,
+	.delete_mem_notify =3D via_bo_delete_mem_notify,
+	.io_mem_reserve =3D via_bo_io_mem_reserve,
+};
=2D-
2.35.1

