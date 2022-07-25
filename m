Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDE58087E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8218D10F5F9;
	Mon, 25 Jul 2022 23:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E457310F679
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793200;
 bh=+qkZhT8dLHeku2mkb4Z0lZ6TtnVTsFCkNVZbdRDjtc4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kHed9Bv7qCEfOFnvAW/bg2p0sQHn3aSG+PsC17Jy3yPARJ6RSMSIs26Wz3Nvo4OnI
 Vmzjbi0zlXx7s5SYltDPZzczdJN3rRqsAMi56kG4PsVhW7l9szLhpLtwTLPg3b4P2D
 ogMzfV2juDIOPBL9JSQBoUiiSPosy8jksqOz1qbA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MnakR-1noS660Mon-00jdO1; Tue, 26 Jul 2022 01:53:20 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 17/32] drm/via: Add via_ioctl.c
Date: Mon, 25 Jul 2022 16:51:12 -0700
Message-Id: <20220725235127.20433-18-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BXqlsk50L4NOB528K61lOYX/zSrKCzz+CWjG3H2J5afp9+78D9Z
 /ER5jMS/bf1MW4Qgpai/1H84RGHZ2hlS7DQB8MBAM2GPNLNdO/7zHrV8UsghJQBXJZbfhni
 G6ZtMlKJySJHqwTmjG/kqdMuPjVTjTJn2invTN0fYbgCfplv/rywIHBmOCSltXKYYvtkGnQ
 PGJ5YY7ddn2WbIb52ingA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:stCzAtnSRLE=:4T6H4uVqol+kFsJcJmETVN
 AvBFpfS0oK3mV8dYzsRaNeB8I/wiCor/WFP2QvkpHUWwrnAK5zrwthqJCgiDp4orVgSGPceHH
 Vbl2S72wOomNnbhDSOi1h3dS52UYADh0CcQ2HErCBJ5PRL73FIoIlyuXhdgfKj8Lw7y3GpZqg
 EfgRHvdyLd6oZ2+e6q0FEwEgWMNdQBM63+gDCY3s7HtGKwz3S/KF0XUPZsf6FyKGoymcL9zze
 iEbrHAwC1DU203kNpYXVEDNu+l2+pUWbJvftrmYU3eVA0+ZWZo3nKfEUp1r1Ml1BvrpZ8qaMF
 3zfTv499Gs9hGCK6ZZDoLy1RW5I6NpcV29viyGAi0em0PimFUUJUqWK3OSIIkbp+SFxNAMjEf
 A6ITVFL9gbqxiR9uSagP+XP31JJlOET14fXTJeQJYO/ZnjQZUOxUYKoPu7CzCi2pct5IZ/AVU
 Lax3vLWZvMAjmkpF7s9M8e8UBTEDZMPefHDX+ZpL5IJcwdFJrq24rIJYkFe0ULB9SHSv10Th7
 0kNCwSfvSzqVAK/krlnsn+F+h2qVQ+oZtknGQU9o7gmgb0/ORXfk7qbV0jri96ZPea3/DCYDm
 sudBAuBXMqvJmUngfqx3bxfcWEpPpMIWPkOnlU7r0kWULyTT/Mdi/n4AeqgX20Ya8TA9ZHoWg
 2d8ko+NLwGlGih3hFl0FFYcVRaFKNCnmTlavSJxecFcf3szKidgm7WDFattL0KKyWvScJbDkc
 MLfmiJhBupV/dcArPTXx7p6e8SlgOjgDq/f0P3zQBjqOh3+kuEfHgWRfsbFOC4+udOOf3R+QQ
 +/HHW5ahzNd/Kvz+eVOrih0L+m4JJc97C0/M996oESqF7AahmHBwMvbphdpvA+F2jH+tRUmQY
 QmJFw4GiT5+U6cK/dZBHoZMFbwREp4PHNbbdKnRvvnNuR1CDrcRGC9wW6oN7vkQkH0EQokWrV
 R1hro1ioc7C+L0QRFZoEckaq0/WKBJ4KmT+wIF5nN9NWh4UoGc199WNnMiMJFBNJZcIrcmA7S
 Z+V5qh0oBWmg7Z28p6ZC24PkBGVXayaM+OeFKSxVcvwhJI0TF8uKiDZuCiceJRp9vMcRNSMw6
 Q24LbpOXUuuaQut4sXnCvo6a/0zeWBPKhpY1zWdrzOM4EyDL+v9VZudMA==
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
 drivers/gpu/drm/via/via_ioctl.c | 109 ++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_ioctl.c

diff --git a/drivers/gpu/drm/via/via_ioctl.c b/drivers/gpu/drm/via/via_ioc=
tl.c
new file mode 100644
index 000000000000..3c772f73fbc0
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_ioctl.c
@@ -0,0 +1,109 @@
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
+
+#include <drm/ttm/ttm_bo_api.h>
+
+#include <uapi/drm/via_drm.h>
+
+#include "via_drv.h"
+
+
+int via_gem_create_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv)
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
+int via_gem_map_ioctl(struct drm_device *dev, void *data,
+			struct drm_file *file_priv)
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
+int via_gem_unmap_ioctl(struct drm_device *dev,
+			void *data,
+			struct drm_file *file_priv)
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
=2D-
2.35.1

