Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21E655A2AC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C957210F2BA;
	Fri, 24 Jun 2022 20:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E65910F2DA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102775;
 bh=G3vWKYkYM/vTX38+A0o/osqsuZtpk2/ky+zUR6oF68w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Wa39HLIAY8CCBxFImK5XS52uLckRDuaqwOpRDi3VUvKVkbqCRiC6qv1CWUZk39pGE
 McIk4sVIQVzdOT4WyRiLPlHWLe1UzZnATzkDaNHjBQGPPBoe0u1AUoNInviXMI2wFD
 s4+vQ26xn8qFynovBW2MubDRJeNHjk3Vw7WM1Fgs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mel7v-1nUwr51GcP-00ajtv; Fri, 24 Jun 2022 22:27:53 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/28] drm/via: Add via_cursor.c
Date: Fri, 24 Jun 2022 15:26:13 -0500
Message-Id: <20220624202633.3978-9-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mQDEbx+jsVlfgpwQwuUM6x0V9JWu0UiQHiXfpIDaOxN9tjPo999
 MrgVyvd1/qO8HcqyBRI5jgarPWZMouSjg4eAf/WnWQZwYAVfJp87eNed8+YQKShfQ93RFtY
 HIq8YHllFsrenBlF+/9pIV+JCxSjAGyGrUoyqApJnnsfv7/nvlFz6z5JceRI8x8Gw0w8v8n
 ZOIUVw784lvnoz/bmeB4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qjvUv8epecY=:4xEi/CE/TZnZc3h3UGyusx
 0bNb9fYdZr2THmBwyNoynSVhqX/opc6GSkMJjkw090GoijaigQe8TG5tnuo9ObkPDEahD68So
 scyS4X4QL1cjk9Nz7WKa58DG3Tnj32xMEvg++AOR7dNSSp7OT0jJcJx2QU3rg5KWhDcezaO91
 rFTU1nV2JwsPR6r1LZZEG1NMDf8xjw/rupIs1rjw1769se4Nhm2UQEq0FpoHUMwj7lkILIm8g
 Liu86PppIRR21MNKUs1fpHhNC+Psg4OqtfJS+yX4Oun0WKXfnErqnsrjRbhylH841Y3eTYUiA
 90T/+cw9wyvMTe3KUVY5K0rQt+rRzaBVi/hrDTcC5thNSxj99H8jfY5QgCcDF95bYBFw9hKh9
 4HWlexxWHhxP4xFUq9E0xehJzyKV1ZSHnRLJ5gqVX4bcBK+XUW7ip5GcMRdKY2n1xo40ME1Nv
 LBLWIH4iFZUOUxcN+fCKwG9/K930ve+l/PwJoKErNRwMGRvtq9nGBalZOu0KrcHFE2u4U9TLZ
 MtBWuU5+r5Q4lCfvP6A7/yVXj10PZyMrHBylWYd7XkEhopXY6vTOWZknvh31DnEILcqOd52yR
 I8W5tj6USJndBP4BanJ/stufcVXRBd1L2V21SGYXkPTeSKxCTj4c3o5fZsEBhoje7uUov5U2D
 zCb3D4XzrvzOBXeBvcUxsX4ZMvWK+tBsRz1M6j/ZVamiqK8fsgS+5PuDN3zuB6xAdD4nwXmGP
 FWoU2ubR7k3ScJJC01SPmgtE288iseqJvLJ1Zsd9HaK4NtMPo/WmjXEK+3iC/QINVXmsR+8mn
 rT0XIO5u19CqO3kJwS33PWJuPj4xCsYlAd1z9mIUVZBpE8iqRlPX9Q+jl8umBcr8VCjYcPWCs
 NDM62gDs5kj1N0znwr8Gk33En8M2jeuXsuSz1U0/v4y34cLgWKl15IosmCauYiygUUKPtd1cF
 k2OAC5YweG4Qs7pJZLrxPeFBiuaCXA0EWHQ6bW82zno9BRAUwBDSFBVjmvyr3KDlZTgFgbvcN
 82Plwf2LQzd0c4AnNEHNXEkOvtDAdm2CvRt+Hu5moHGGbOYv6scsMV75YEYLmA5yncetnoNOI
 FF9qufKFHFlB1DTjBl9xq0J3+QUjOgxpGV7plucK05wmJ3dBhxPEnE2rw==
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
index 000000000000..9a6bce1cf922
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
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_P4M900:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_P4M900:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_P4M900:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_P4M900:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT3343:
+	case PCI_DEVICE_ID_VIA_P4M900:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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

