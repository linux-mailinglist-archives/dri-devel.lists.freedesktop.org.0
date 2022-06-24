Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C155A2B9
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D253510F42E;
	Fri, 24 Jun 2022 20:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48B110F3AF
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102810;
 bh=O8DrUxlHJZfVwOoWZZ8kiXA2S3OU18Enf1iV67R+JEs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=euAi5PgB+GjJIWnjyicWncRRyeHIIyujJYbMCqPj+qJ5MfMoVJYSmLB/tXYBI554h
 XrhXtW8EZOeTLRR9w7LNIVptzsnNxGQkCLFmOA/ArQAZeClu5QHuZHgpsPKV1wVh0T
 TQViXpB2HutHHW6mHUkgdmW0Lvo7HdhfYkwSQIHc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MirjS-1nQFuN346e-00eqLi; Fri, 24 Jun 2022 22:33:29 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 23/28] drm/via: Add via_ttm.c
Date: Fri, 24 Jun 2022 15:32:54 -0500
Message-Id: <20220624203259.4051-4-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8p/yCD51uK2r751kPrgoYIMsOxOV3mO7j9IUIxsV9wN8h2Jc061
 ZBSw0A1lrw9KYP5cZjo3OX1/JjjL2+F6TavvzT7bylUi2K3LDcNH+NQHFd4gtPQYKwuoiKk
 Pzo2wSAU6PWPT7eKC216r4cCckZQFby3MLwkb4nf24ZFKv18Q00hE3xIUiYxSJYKyfOm4SC
 NkmdvkALnc7sXM6bf0DyQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:69LHoc6iciM=:38iPHu3czYRRSXI2X9ITtw
 7rAmO4AkeDlsPsiwqo3Tc8/TMsB4JpGENKHHwTWbi1Oy4zDTGxkHECbo0RwyodLgJ0ob383JW
 iRBv4N5kmjuJHe3HlNV5DGfeOY+gbwaWIi7e/n1x4npecRG+uuyFWxQXHbnStirCw+P7bcFMd
 2BaMtYIsZ5GwOtM4vBIuXTSAYZPwSjuBvi4hpUcHc9kzgk+nYCfkkSW5ZsevwgSvZT1eqScZA
 hVCnbQWxtoiLeWOrO3xOzvQzWMO1JJOJ4D+8cdhMMoR2+YqWXem2AiAjT3K0K1TqVuvD530AU
 0kNqcwuaHxe6G3lqVgH+3lFFFtZVmTWgh+UfnXt6PElIIYpephOXhU0B9Vt5QJsQGjZhBC4P3
 AOwqME5iw5XpYgvTR2voU/eAZvvG+hQu5P354L+J2WL+tEbLN0UkgOze857yk5McSsGz6sBPW
 crnIRvZiI4fOq8pmuxawvrYXW/Wfe+C5fa4J2X5FKDZAd8t9LjogFJiAbN+7LCYOdBIq3CwVk
 8+rNUsq0i8iK/gfAM1TX7fmk1F9QLlLYCHtnJlOYUCAMeWf+JlSp79Icdcu219BVl+yxpLbRC
 0LcsUGSDtwKvSzqmfsgcHcNmj1nmk77Z8mZccKwA3d2vBIyugmXLWb/YCe81wstEhcM/u64Y5
 XoReh48TjgZXwx25IVjyDrB5ojmKuLVYT8QfHkScVQZalsja2JJolu4Pw8g0TIf6rzuLK1qkD
 dWzhD+FiiMooe9SQGF5jzp9z0K2Dx64wycENo4K7+pLZXuVHC3rcMlw4CYSV1pbt9moJ1cd0I
 veQjNoagtVoSctkcPGdZoOdUT70Zen2cGS8PJoc55AqZAk846H6fH1p4spA+quj64zJgidJgG
 UbTVclIJZgM1oegsQ84KCV5x/hgUiz0yrVrcF1G/w5nnH1yyBfO4jSyzMRUAvVHshuPKxLiyb
 ubsGCyxxPER/f2dBbSNFAl+A7W6/1DkiJgnl+Q2Fs0lAsJXmA+s/kiK3TZQs/C7dy3kVPLW7S
 Ua6G0Vm95ShQfdwDX++6/mICvHuKLwHUYV8m+uqZaISf7Sq04Kv/sZF02AKFvqB5C+Li4VIJQ
 6lvcS9hNguIKxhsWJdg5UbFjHc+ddosioq18rhPrT07nHCyTkzxjH+98Q==
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

