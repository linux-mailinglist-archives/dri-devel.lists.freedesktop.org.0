Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E2B580887
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D6510F7C8;
	Mon, 25 Jul 2022 23:54:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC8A10F764
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793288;
 bh=O8DrUxlHJZfVwOoWZZ8kiXA2S3OU18Enf1iV67R+JEs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KpEmHsaI46N4ARf7wJ6tLsstKKKbJO3jhEP+icLzCiUiiSFgm+EOhNqy58yvLrgXa
 PcJsZlfCzlpGb91Xs+ZwpYOPmgwsDIzTntSAERDSq7k2fxZr/32vGXclcIqZ7tzGjD
 f9eMhCclZG2+S1e1Z1blqEFFc35U8ADbb9ZnNAiA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MryTF-1nk4ME2mjV-00o0eC; Tue, 26 Jul 2022 01:54:48 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 24/32] drm/via: Add via_ttm.c
Date: Mon, 25 Jul 2022 16:53:51 -0700
Message-Id: <20220725235359.20516-5-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t6o0JsbhszvKXfKpO05n2EdP1DtzokXoyD25Cy92f/guTFUtdjL
 2XS/zrt1XJjJ87VusKiJpbfJm2tD3TD9T0pfQQAmM3pntVaMVZLMuGqgc7b69G0+WwGKinq
 Yd9p6CkGtssMUTnvKhEMrZg8JtF5pqlZuRfXuLeCO1r+eTEyp7wuuc05AFbkJJNO5AJLiQb
 3MMbd6diMH0BIFONSKgcw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zRm4jSMdJhk=:LkyoQ5sWzksC54XI7aAfEr
 /jwwoOz2fQXWAoqmZo3TH/wyGd4YLDHR6yDzbhhcuCKEip88OqIVzeCtE3jHpT407Z+b9A/bB
 g30O1g5hL+QxEXWtJhRyvbimDvKkf3Ov8xq8b6ewOdQCN2SIU+jNI8NdLKRB68/a/GMRQQVvf
 VINtpCWPdgOR7kIySGKg/SgytQcy6B/AtzJkJM2wHuAd3DN5UqCsoB/QAkuZQ8HFeVBcJzkA3
 7vd9i5a2Irqjf17kxVAvh841uW6Rln14XOrIfUONObdBD8P4wJGXH/CMuYPi+q3hwQS5wicVc
 1mcB9YZExobZMZdNxQf3yEHtI2DBlt18CiEaoYrMeexdYx1qqUgP6VMGYEaRxNIEWhtMT1j7h
 O7hayauqz1qBBQ437Oiy6M5WNlU+agT4kdd1Lb8XKwqD4s/QJ6M5tcyHvbTWQ0nDhQ4Pien/N
 QyPlkVFROqWHSPiG7ycDboFk6Bn9l4UW0yQMC+6T38UFTFKtxT56tng0TOxWlpkMXE/V6oJYs
 h5ltwPuu58y0CjixKh0275PDHhc8d4fV26nMu+841SwRWy1xKQsT2+nawmgzJDn+7x/ca3ldB
 1mC0CURWnxQtJua4GAn9jOI028R1BwkzJJM7PwJldF8kp2UnBJawmx/HYaT7awDH07aOf7fsk
 8HhlS/06Uk5r9zj8B9QNz2IKg6WDpX0nLFJ/OJObM/t3mrBFUyOO2z0ORf03DGapQskoxeEmH
 4yVUP+LbIAD9JVUemmSur6pByWFD/4vby7cEIXiJbIj/zqXHygVXKd3Q3TEHvJTc+n7Sp/EAw
 iDdq7m5YHQ2ntNx0UMIoMRVg6cbPZb6XDFoGctNAsHWWcNLi11Dn0Ht3hBVrXV2NP+reskNYq
 57NRi86PSSrzy7cc2L4U0OHRGVLGxIMfS2LUaryFAp8zA7S/6umlV19UqkqPgAT9VhiWDr8m8
 eGxQOGmAlZW6xT2RCkf8puiKAHDXE+nuGA8VIhz5I4B5bmV3tOn7Enlja3OyZjzvSlU35A5Nr
 i/pwPBGcl8F0fIIh0RblisbieQBmIU5ijs4UfsvwYWUsD9KNrxfxPJCokqdRqnIkcRDQ3OGCR
 r7xFP3CQXIKyqijq2JN8+5D/XplYU/pGWOPL6UVhnzk/ue5E3Rd8e8PEg==
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

