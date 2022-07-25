Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ECC580879
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E929B10F5FE;
	Mon, 25 Jul 2022 23:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B3410F5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793181;
 bh=idp/Lx71sptwp9QgQX/0NJQRuSqhYN54WJeW+Bul2Vk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DHwAlID+NNCvhPjQ5gxff0cv4hc3iZuXxVVtgRE9NvHzbawa5nT77v7PuirYPwz+7
 MZWsykWnSWXN0T8UpxJe4o5jSa92qDciaWnrq5CbrxHgEaDoeQndlgrqmtgVIlPOaW
 6YgBJ/UundTit3A6j8xp5MP5/oK6zU9cGjKyWl9M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MGhyS-1oJxdZ2DbO-00Dr0c; Tue, 26 Jul 2022 01:53:01 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/32] drm/via: Add via_cursor.c
Date: Mon, 25 Jul 2022 16:51:04 -0700
Message-Id: <20220725235127.20433-10-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:h+y89Eu1nk/ohF7Riz9na5CLZ3tPm+gHx72Lcb8W/EBLg3dKlVI
 SGUBVK/RhUjcdTpd+XUOuQCz8w/y3rssaV+nyE0B39OLHUj+ch9Cp4ypBoqrNpTN513LgvK
 JtUjne/GbHvWVXzAwjWR3FVVyCF7p5OQAhCbsiMGKvdjMdsjOey+4YqYPbf2QxIEo+z28wD
 eBepXpGerstDQBu8+9/SQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jj8DnKU1EnA=:Gy6TZkCe3aB1ASFKOe74X1
 JPAarGv5a6HGcRlVUOWSlvB4hfX5PNXisoYhogTjy8uXsll3l4fgJiJqplckFXApbQyIhKX3m
 piBsVqLyw2ntHDQF1fUuuR/XHACfQXVwpw7aX5+FwEIGjFfmpEsHPLc0qXbNnzjNwYmhAI3lk
 iYY0X76e4CESN0UgLxttuE1RXFFaBdYNS4p9ldHc+dBqFLNi+uPPhX3DRm6eXbP3AayO4xOb7
 60Ok+E8rx2EkH6dd0B9/5obDl00izHNBf886u7VpnnES653nQplzCUL5qxQmRiUrSJ/Hu+VHK
 f53C16jgcP+xVZBpDdvhAhErUPWtZHvcmbEYgeEAYK83lS4MZiHpyD/xZLmlvEAAuH+C+Ie7A
 rE0TDjaDMWHY2+Q4GSAFoNERnFEQIagl8LLzKgcN3i8Yj8Q42Rsm7sH8WfvzleuHsHZOLsptg
 62vFXGSiJopBSl6TGB9fNXuSC3Y4xdvtcOR/g3k8xfE12Hk8oiNQ6X5o3jEUinw3nPyMxAkFF
 MkN9Mc2wLWMO41ACToWuOzQXOXry9qHzqfTYlxvYEAwUtZGSvMpfX11Md2UWSKQJn8ibacnc1
 hydMYX3KWF6bbNbQdaRhRGC7PXpLU5fyW7KzTWIsppbP1D41Ibl1Qu2xZiyWIZmh0j94heqqp
 tqgJEqHZpgpdOz8AuFh83xXmGpnXzc9L4zrZUgJtXwicUlSA0XUQ6ixgJ67mu4SVoMb1+u9xA
 c+hWqoh7zbFh0tfOIRtkS/74sNF5W84TmGqtI+o8xzlYeuRmCUfzOzzTN7Jro+GC+TpZ2E9uv
 aWaaU2kbC5jHfRNMMJb+rjy5ht0NSV+YPyouX1lDiT/ag3uS1VMvJPSog551J9eNjeM1/Dc7v
 0lkp344NwhOz3X1QKWv0kwz5FOHKONp1bhjPa4yzuGyicYL9dgBCTsZlECvfdpUg+2z0VZLOm
 iqDIyZc6jlgpWyk08/LYpncX2aZ6QBAhtffbe/XN2ag9pLMNzCy9Ay9nbTi3woIQUyencMjZA
 fw/dwgUWXbL+I5NzLiVwiHKG/S3NSZRdLpX7wzZbubS0jw74CdhrD/LMYLjFC9etbCqXk0bkg
 TU/d4yiTKyU+TN6V6QarhXvx7wMOtFO29PV4UIRi5w/MEhC7QdjEWy//Q==
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
 drivers/gpu/drm/via/via_cursor.c | 419 +++++++++++++++++++++++++++++++
 1 file changed, 419 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_cursor.c

diff --git a/drivers/gpu/drm/via/via_cursor.c b/drivers/gpu/drm/via/via_cu=
rsor.c
new file mode 100644
index 000000000000..391ea5810708
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_cursor.c
@@ -0,0 +1,419 @@
+/*
+ * Copyright =C2=A9 2019-2020 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ * Copyright 1998-2009 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2009 S3 Graphics, Inc. All Rights Reserved.
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
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+#include <drm/ttm/ttm_bo_driver.h>
+
+#include "via_drv.h"
+
+
+static void via_hide_cursor(struct drm_crtc *crtc)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_crtc *iga =3D container_of(crtc,
+					struct via_crtc, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	uint32_t temp;
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		if (iga->index) {
+			temp =3D VIA_READ(HI_CONTROL);
+			VIA_WRITE(HI_CONTROL, temp & 0xFFFFFFFA);
+		} else {
+			temp =3D VIA_READ(PRIM_HI_CTRL);
+			VIA_WRITE(PRIM_HI_CTRL, temp & 0xFFFFFFFA);
+		}
+
+		break;
+	default:
+		temp =3D VIA_READ(HI_CONTROL);
+		VIA_WRITE(HI_CONTROL, temp & 0xFFFFFFFA);
+		break;
+	}
+}
+
+static void via_show_cursor(struct drm_crtc *crtc)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_crtc *iga =3D container_of(crtc,
+					struct via_crtc, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		/*
+		 * Program Hardware Icon (HI) FIFO, foreground color,
+		 * and background color.
+		 */
+		if (iga->index) {
+			VIA_WRITE(HI_TRANSPARENT_COLOR, 0x00000000);
+			VIA_WRITE(HI_INVTCOLOR, 0x00FFFFFF);
+			VIA_WRITE(ALPHA_V3_PREFIFO_CONTROL,
+							0x000E0000);
+			VIA_WRITE(ALPHA_V3_FIFO_CONTROL, 0x0E0F0000);
+		} else {
+			VIA_WRITE(PRIM_HI_TRANSCOLOR, 0x00000000);
+			VIA_WRITE(PRIM_HI_INVTCOLOR, 0x00FFFFFF);
+			VIA_WRITE(V327_HI_INVTCOLOR, 0x00FFFFFF);
+			VIA_WRITE(PRIM_HI_FIFO, 0x0D000D0F);
+		}
+
+		break;
+	default:
+		/*
+		 * Program Hardware Icon (HI) FIFO, foreground color,
+		 * and background color.
+		 */
+		VIA_WRITE(HI_TRANSPARENT_COLOR, 0x00000000);
+		VIA_WRITE(HI_INVTCOLOR, 0x00FFFFFF);
+		VIA_WRITE(ALPHA_V3_PREFIFO_CONTROL, 0x000E0000);
+		VIA_WRITE(ALPHA_V3_FIFO_CONTROL, 0xE0F0000);
+		break;
+	}
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		/*
+		 * Turn on Hardware Icon (HI).
+		 */
+		if (iga->index) {
+			VIA_WRITE(HI_CONTROL, 0xB6000005);
+		} else {
+			VIA_WRITE(PRIM_HI_CTRL, 0x36000005);
+		}
+
+		break;
+	default:
+		/*
+		 * Turn on Hardware Icon (HI).
+		 */
+		if (iga->index) {
+			VIA_WRITE(HI_CONTROL, 0xB6000005);
+		} else {
+			VIA_WRITE(HI_CONTROL, 0x36000005);
+		}
+
+		break;
+	}
+}
+
+static void via_cursor_address(struct drm_crtc *crtc,
+				struct ttm_buffer_object *ttm_bo)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_crtc *iga =3D container_of(crtc,
+					struct via_crtc, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		/*
+		 * Program Hardware Icon (HI) offset.
+		 */
+		if (iga->index) {
+			VIA_WRITE(HI_FBOFFSET,
+				ttm_bo->resource->start << PAGE_SHIFT);
+		} else {
+			VIA_WRITE(PRIM_HI_FBOFFSET,
+				ttm_bo->resource->start << PAGE_SHIFT);
+		}
+		break;
+	default:
+		/*
+		 * Program Hardware Icon (HI) offset.
+		 */
+		VIA_WRITE(HI_FBOFFSET, ttm_bo->resource->start << PAGE_SHIFT);
+		break;
+	}
+
+	return;
+}
+
+static void via_set_hi_location(struct drm_crtc *crtc, int crtc_x, int cr=
tc_y)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_crtc *iga =3D container_of(crtc,
+					struct via_crtc, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	uint32_t location_x =3D 0, location_y =3D 0;
+	uint32_t offset_x =3D 0, offset_y =3D 0;
+
+	if (crtc_x < 0) {
+		offset_x =3D -crtc_x;
+	} else {
+		location_x =3D crtc_x;
+	}
+
+	if (crtc_y < 0) {
+		offset_y =3D -crtc_y;
+	} else {
+		location_y =3D crtc_y;
+	}
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		if (iga->index) {
+			VIA_WRITE(HI_POSSTART,
+				(((location_x & 0x07ff) << 16) |
+				(location_y & 0x07ff)));
+			VIA_WRITE(HI_CENTEROFFSET,
+				(((offset_x & 0x07ff) << 16) |
+				(offset_y & 0x07ff)));
+		} else {
+			VIA_WRITE(PRIM_HI_POSSTART,
+				(((location_x & 0x07ff) << 16) |
+				(location_y & 0x07ff)));
+			VIA_WRITE(PRIM_HI_CENTEROFFSET,
+				(((offset_x & 0x07ff) << 16) |
+				(offset_y & 0x07ff)));
+		}
+
+		break;
+	default:
+		VIA_WRITE(HI_POSSTART,
+				(((location_x & 0x07ff) << 16) |
+				(location_y & 0x07ff)));
+		VIA_WRITE(HI_CENTEROFFSET,
+				(((offset_x & 0x07ff) << 16) |
+				(offset_y & 0x07ff)));
+		break;
+	}
+}
+
+static int via_cursor_prepare_fb(struct drm_plane *plane,
+					struct drm_plane_state *new_state)
+{
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+	struct via_bo *bo;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!new_state->fb) {
+		goto exit;
+	}
+
+	gem =3D new_state->fb->obj[0];
+	ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+	bo =3D to_ttm_bo(ttm_bo);
+
+	ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+	if (ret) {
+		goto exit;
+	}
+
+	ret =3D via_bo_pin(bo, TTM_PL_VRAM);
+	ttm_bo_unreserve(ttm_bo);
+	ret =3D ttm_bo_kmap(ttm_bo, 0, ttm_bo->resource->num_pages, &bo->kmap);
+	if (ret) {
+		goto exit;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_cursor_cleanup_fb(struct drm_plane *plane,
+					struct drm_plane_state *old_state)
+{
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+	struct via_bo *bo;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!old_state->fb) {
+		goto exit;
+	}
+
+	gem =3D old_state->fb->obj[0];
+	ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+	bo =3D to_ttm_bo(ttm_bo);
+
+	ttm_bo_kunmap(&bo->kmap);
+	ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+	if (ret) {
+		goto exit;
+	}
+
+	via_bo_unpin(bo);
+	ttm_bo_unreserve(ttm_bo);
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static int via_cursor_atomic_check(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state =3D
+			drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_framebuffer *fb =3D new_plane_state->fb;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if ((!new_plane_state->crtc) || (!new_plane_state->visible)) {
+		goto exit;
+	}
+
+	if (fb->width !=3D fb->height) {
+		DRM_ERROR("Hardware cursor is expected to have "
+				"square dimensions.\n");
+		ret =3D -EINVAL;
+		goto exit;
+	}
+
+	new_crtc_state =3D drm_atomic_get_new_crtc_state(state,
+						new_plane_state->crtc);
+	ret =3D drm_atomic_helper_check_plane_state(
+					new_plane_state,
+					new_crtc_state,
+					DRM_PLANE_HELPER_NO_SCALING,
+					DRM_PLANE_HELPER_NO_SCALING,
+					true, true);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_cursor_atomic_update(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state =3D
+			drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_state =3D
+			drm_atomic_get_old_plane_state(state, plane);
+	struct drm_crtc *crtc =3D new_state->crtc;
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (new_state->fb !=3D old_state->fb) {
+		gem =3D new_state->fb->obj[0];
+		ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+		via_cursor_address(crtc, ttm_bo);
+	}
+
+	via_set_hi_location(crtc, new_state->crtc_x, new_state->crtc_y);
+	via_show_cursor(crtc);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_cursor_atomic_disable(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state =3D
+			drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc =3D new_state->crtc;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (crtc) {
+		via_hide_cursor(crtc);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+const struct drm_plane_helper_funcs via_cursor_drm_plane_helper_funcs =3D=
 {
+	.prepare_fb	=3D via_cursor_prepare_fb,
+	.cleanup_fb	=3D via_cursor_cleanup_fb,
+	.atomic_check	=3D via_cursor_atomic_check,
+	.atomic_update	=3D via_cursor_atomic_update,
+	.atomic_disable	=3D via_cursor_atomic_disable,
+};
+
+const struct drm_plane_funcs via_cursor_drm_plane_funcs =3D {
+	.update_plane =3D drm_atomic_helper_update_plane,
+	.disable_plane =3D drm_atomic_helper_disable_plane,
+	.destroy =3D drm_plane_cleanup,
+	.reset =3D drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
+};
+
+const uint32_t via_cursor_formats[] =3D {
+	DRM_FORMAT_ARGB8888,
+};
+
+const unsigned int via_cursor_formats_size =3D
+				ARRAY_SIZE(via_cursor_formats);
=2D-
2.35.1

