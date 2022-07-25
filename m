Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 785D2580876
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FB810F597;
	Mon, 25 Jul 2022 23:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC6510F56C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793176;
 bh=1sFR7PfTwKGiXuw6FzALXGZ/xxGbuX9AfXwuFgOmRkE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=IhLu+VNpHz0RiNi1wmY8PMWWOAzGHGlD4VtaRIRNwwHcDT2N/HrDjNnt8kqFCDhSZ
 r4RE7cLAQnVFo7xtX7+d544DngRcv9Pf5NQFbrBfQ1qBB3zlrZwbCWX1+Rlh91Gs6c
 CueuLNE3GFKnoBkLJK5foYBR7Aa/6csWJcuNeSZw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MFKGZ-1oI1hF154r-00Fmor; Tue, 26 Jul 2022 01:52:56 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 07/32] drm/via: Add via_crtc.c
Date: Mon, 25 Jul 2022 16:51:02 -0700
Message-Id: <20220725235127.20433-8-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RLV/4cgq89Qd/PMsJEdRGs8WM6iHkgZ3kyKAOgWhCckyDCb9naD
 mQBn4ep23KwL6pokMfosFgt6xTEDWVEVgYkmMpFHk2rY3NhHLdTyr0Qv9qNy3nDiw6QdYqV
 oTpDXRxHQ9NuRp545XJpbJuGGGY5XSZ67XheMOwBJUpF8r4C3xHtNc3Awz57G5O4SGg1M2Z
 YxQ/kYbbU7rpehB0/B3Pw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rE7vtJYTUWM=:DSb52fsKeRJCibTfEGFMtp
 YE9U4eb6r/caofkW4ps5RQtQJOvmVHBIO8/sMs2AQ/bJmNEVCtu/TiAh4eU24NuGJyDLFTxQf
 wF1d5H8G48eWDwNJ9LlkFnpCcQjmFSgHOh1mt+x8+kjiAlLpfFgbNRIIzcdmyFfk9fpsutzpz
 bwRY0bLret9eJh0frYCNeVQWdD/tuub7R4XDfdlE9TE4a+5Qro00hYdiDXqXImNYvikgFidzV
 vxy1FxoiNd8AIf44SF01RFbtpBEL6pL/9Xqx6ubhN+S/xeMkeIJt3WBLyA3gi9BFF+VmewhO9
 DfRyKmOMQkwKperu0e2KnFynPOU6vQjXakEuQT3xW+cOzk5/KJvtEDApA4J26NWH/d2ZEVQmF
 Mu6A/BrvkOCZAc3PZtUCWv6FXMyN4H+gTjwXWu+ouy86/A75irLQsd39iF33jjKkaT3qI0TAI
 qemfFYPVDa39ll8AraF0nKPurVqiUNF3vIZ/GSt4Aj6L8/rJfav0W2IuwRjQOCn3geqnf4tpD
 1w8EnBpuHRtLKifB84++FanrJVGIPuYZKBUqcLFdd5rg0xsmRXvyoSzLP8AhQXPldPATBgahy
 1FVoSTKRVYrFCucyVAP9ruwecMXtzXY1kRFQNFk7wP+ZmSUrhX5MgDFFGSF9DJa6ldJE9Ej/Y
 Za0vr6BN/eizrcse66wJrZx9R1TrCbA32FsDZK6GH0nQPiD+stZ5uDZFr+VXLzOdUtIo0WEUS
 x7fg9nWNDw1xj393LeWdJQOXNP1HO4v8Q4H6DXUiNHN5kEUSGAkh6pJICrobX7reiiLA3YgXv
 cqRXqCspnC6zhHHPQmXE8jutnQz2HfA0LaXXNwvP4s6JWu3v6LVxzwphfkrACuAWjUGeRgL8x
 TYeZBeX6LVyS45VIOKUIToQLp1ag02yHa/Fmd5O/sivW6JyAePQ7Zk8J61sC5Apqn1XwSaHKw
 qjyyUR4Da7bcCUWpCwVgWdThQScS9/5lL/Fa7YfCB0E6pqM/e7uAOKyvtbqTSO0hS7ZA4r1nB
 ceVTrYiv+Wr0e+Y9/R3fDWp7OevusToScsgAniqfqgHepLNROUF4AJZIFATxC2GO5zAdr0Aeu
 8gHWi///pV98KJouaJpbtKHgoyfn6nJbfvnlHDGXmRK7nbXOLMiNSGN1Q==
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
 drivers/gpu/drm/via/via_crtc.c | 2333 ++++++++++++++++++++++++++++++++
 1 file changed, 2333 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_crtc.c

diff --git a/drivers/gpu/drm/via/via_crtc.c b/drivers/gpu/drm/via/via_crtc=
.c
new file mode 100644
index 000000000000..d00f56d8c974
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_crtc.c
@@ -0,0 +1,2333 @@
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
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
+
+#include <drm/ttm/ttm_bo_api.h>
+
+#include "via_drv.h"
+#include "via_disp_reg.h"
+
+
+static struct vga_regset vpit_table[] =3D {
+	{VGA_SEQ_I, 0x01, 0xFF, 0x01 },
+	{VGA_SEQ_I, 0x02, 0xFF, 0x0F },
+	{VGA_SEQ_I, 0x03, 0xFF, 0x00 },
+	{VGA_SEQ_I, 0x04, 0xFF, 0x0E },
+	{VGA_GFX_I, 0x00, 0xFF, 0x00 },
+	{VGA_GFX_I, 0x01, 0xFF, 0x00 },
+	{VGA_GFX_I, 0x02, 0xFF, 0x00 },
+	{VGA_GFX_I, 0x03, 0xFF, 0x00 },
+	{VGA_GFX_I, 0x04, 0xFF, 0x00 },
+	{VGA_GFX_I, 0x05, 0xFF, 0x00 },
+	{VGA_GFX_I, 0x06, 0xFF, 0x05 },
+	{VGA_GFX_I, 0x07, 0xFF, 0x0F },
+	{VGA_GFX_I, 0x08, 0xFF, 0xFF }
+};
+
+static void via_iga_common_init(struct pci_dev *pdev, void __iomem *regs)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Be careful with 3C5.15[5] - Wrap Around Disable.
+	 * It must be set to 1 for proper operation. */
+	/* 3C5.15[5]   - Wrap Around Disable
+	 *               0: Disable (For Mode 0-13)
+	 *               1: Enable
+	 * 3C5.15[1]   - Extended Display Mode Enable
+	 *               0: Disable
+	 *               1: Enable */
+	svga_wseq_mask(regs, 0x15, BIT(5) | BIT(1), BIT(5) | BIT(1));
+
+	/*
+	 * It was observed on NeoWare CA10 thin client with DVI that not
+	 * resetting CR55[7] to 0 causes the screen driven by IGA2 to get
+	 * distorted.
+	 */
+	if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) {
+		svga_wcrt_mask(regs, 0x55, 0x00, BIT(7));
+	}
+
+	/*
+	 * Disable simultaneous display.
+	 * Turning this on causes IGA1 to have a display issue.
+	 */
+	/*
+	 * 3X5.6B[3]   - Simultaneous Display Enable
+	 *               0: Disable
+	 *               1: Enable
+	 */
+	svga_wcrt_mask(regs, 0x6B, 0x00, BIT(3));
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_iga1_set_color_depth(struct via_drm_priv *dev_priv,
+					u8 depth)
+{
+	u8 value;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	value =3D 0x00;
+
+	/* Set the color depth for IGA1. */
+	switch (depth) {
+	case 8:
+		break;
+	case 16:
+		/* Bit 4 is for 555 (15-bit) / 565 (16-bit) color selection. */
+		value |=3D BIT(4) | BIT(2);
+		break;
+	case 24:
+		value |=3D BIT(3) | BIT(2);
+		break;
+	default:
+		break;
+	}
+
+	if ((depth =3D=3D 8) || (depth =3D=3D 16) || (depth =3D=3D 24)) {
+		/* 3C5.15[4]   - Hi Color Mode Select
+		 *               0: 555
+		 *               1: 565
+		 * 3C5.15[3:2] - Display Color Depth Select
+		 *               00: 8bpp
+		 *               01: 16bpp
+		 *               10: 30bpp
+		 *               11: 32bpp */
+		svga_wseq_mask(VGABASE, 0x15, value,
+				BIT(4) | BIT(3) | BIT(2));
+		DRM_INFO("IGA1 Color Depth: %d bit\n", depth);
+	} else {
+		DRM_ERROR("Unsupported IGA1 Color Depth: %d bit\n",
+				depth);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_iga2_set_color_depth(struct via_drm_priv *dev_priv,
+					u8 depth)
+{
+	u8 value;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	value =3D 0x00;
+
+	/* Set the color depth for IGA2. */
+	switch (depth) {
+	case 8:
+		break;
+	case 16:
+		value =3D BIT(6);
+		break;
+	case 24:
+		value =3D BIT(7) | BIT(6);
+		break;
+	default:
+		break;
+	}
+
+	if ((depth =3D=3D 8) || (depth =3D=3D 16) || (depth =3D=3D 24)) {
+		/* 3X5.67[7:6] - Display Color Depth Select
+		 *               00: 8bpp
+		 *               01: 16bpp
+		 *               10: 30bpp
+		 *               11: 32bpp */
+		svga_wcrt_mask(VGABASE, 0x67, value, 0xC0);
+		DRM_INFO("IGA2 Color Depth: %d bit\n", depth);
+	} else {
+		DRM_ERROR("Unsupported IGA2 Color Depth: %d bit\n",
+				depth);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static int via_gamma_set(struct drm_crtc *crtc,
+				u16 *r, u16 *g, u16 *b,
+				uint32_t size,
+				struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_crtc *iga =3D container_of(crtc,
+						struct via_crtc, base);
+	int end =3D (size > 256) ? 256 : size, i;
+	u8 val =3D 0;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if ((!crtc->enabled) || (!crtc->primary->fb)) {
+		ret =3D -EINVAL;
+		goto exit;
+	}
+
+	if (!iga->index) {
+		/*
+		 * Access IGA1's pallette LUT.
+		 */
+		svga_wseq_mask(VGABASE, 0x1A, 0x00, BIT(0));
+
+		/*
+		 * Is it an 8-bit color mode?
+		 */
+		if (crtc->primary->fb->format->cpp[0] =3D=3D 1) {
+			/* Change to Primary Display's LUT */
+			val =3D vga_rseq(VGABASE, 0x1B);
+			vga_wseq(VGABASE, 0x1B, val);
+			val =3D vga_rcrt(VGABASE, 0x67);
+			vga_wcrt(VGABASE, 0x67, val);
+
+			/* Fill in IGA1's LUT */
+			for (i =3D 0; i < end; i++) {
+				/* Bit mask of palette */
+				vga_w(VGABASE, VGA_PEL_MSK, 0xFF);
+				vga_w(VGABASE, VGA_PEL_IW, i);
+				vga_w(VGABASE, VGA_PEL_D, r[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, g[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, b[i] >> 8);
+			}
+			/* enable LUT */
+			svga_wseq_mask(VGABASE, 0x1B, 0x00, BIT(0));
+			/*
+			 * Disable gamma in case it was enabled
+			 * previously
+			 */
+			svga_wcrt_mask(VGABASE, 0x33, 0x00, BIT(7));
+		} else {
+			/* Enable Gamma */
+			svga_wcrt_mask(VGABASE, 0x33, BIT(7), BIT(7));
+
+			/* Fill in IGA1's gamma */
+			for (i =3D 0; i < end; i++) {
+				/* bit mask of palette */
+				vga_w(VGABASE, VGA_PEL_MSK, 0xFF);
+				vga_w(VGABASE, VGA_PEL_IW, i);
+				vga_w(VGABASE, VGA_PEL_D, r[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, g[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, b[i] >> 8);
+			}
+		}
+	} else {
+		/*
+		 * Access IGA2's pallette LUT.
+		 */
+		svga_wseq_mask(VGABASE, 0x1A, BIT(0), BIT(0));
+
+		/*
+		 * Is it an 8-bit color mode?
+		 */
+		if (crtc->primary->fb->format->cpp[0] =3D=3D 1) {
+			/* Enable Secondary Display Engine */
+			svga_wseq_mask(VGABASE, 0x1B, BIT(7), BIT(7));
+			/* Second Display Color Depth, 8bpp */
+			svga_wcrt_mask(VGABASE, 0x67, 0x3F, 0x3F);
+
+			/*
+			 * Enable second display channel just in case.
+			 */
+			if (!(vga_rcrt(VGABASE, 0x6A) & BIT(7)))
+				svga_wcrt_mask(VGABASE, 0x6A,
+						BIT(7), BIT(7));
+
+			/* Fill in IGA2's LUT */
+			for (i =3D 0; i < end; i++) {
+				/* Bit mask of palette */
+				vga_w(VGABASE, VGA_PEL_MSK, 0xFF);
+				vga_w(VGABASE, VGA_PEL_IW, i);
+				vga_w(VGABASE, VGA_PEL_D, r[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, g[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, b[i] >> 8);
+			}
+			/*
+			 * Disable gamma in case it was enabled
+			 * previously
+			 */
+			svga_wcrt_mask(VGABASE, 0x6A, 0x00, BIT(1));
+		} else {
+			u8 reg_bits =3D BIT(1);
+
+			/* Bit 1 enables gamma */
+			svga_wcrt_mask(VGABASE, 0x6A, BIT(1), BIT(1));
+
+			/* Old platforms LUT are 6 bits in size.
+			 * Newer it is 8 bits. */
+			switch (pdev->device) {
+			case PCI_DEVICE_ID_VIA_CLE266_GFX:
+			case PCI_DEVICE_ID_VIA_KM400_GFX:
+			case PCI_DEVICE_ID_VIA_K8M800_GFX:
+			case PCI_DEVICE_ID_VIA_PM800_GFX:
+				break;
+
+			default:
+				reg_bits |=3D BIT(5);
+				break;
+			}
+			svga_wcrt_mask(VGABASE, 0x6A, reg_bits,
+					reg_bits);
+
+			/*
+			 * Before we fill the second LUT, we have to
+			 * enable second display channel. If it's
+			 * enabled before, we don't need to do that,
+			 * or else the secondary display will be dark
+			 * for about 1 sec and then be turned on
+			 * again.
+			 */
+			if (!(vga_rcrt(VGABASE, 0x6A) & BIT(7)))
+				svga_wcrt_mask(VGABASE, 0x6A,
+						BIT(7), BIT(7));
+
+			/* Fill in IGA2's gamma */
+			for (i =3D 0; i < end; i++) {
+				/* bit mask of palette */
+				vga_w(VGABASE, VGA_PEL_MSK, 0xFF);
+				vga_w(VGABASE, VGA_PEL_IW, i);
+				vga_w(VGABASE, VGA_PEL_D, r[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, g[i] >> 8);
+				vga_w(VGABASE, VGA_PEL_D, b[i] >> 8);
+			}
+		}
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_crtc_destroy(struct drm_crtc *crtc)
+{
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+
+	drm_crtc_cleanup(&iga->base);
+	kfree(iga);
+}
+
+static const struct drm_crtc_funcs via_drm_crtc_funcs =3D {
+	.reset =3D drm_atomic_helper_crtc_reset,
+	.gamma_set =3D via_gamma_set,
+	.set_config =3D drm_atomic_helper_set_config,
+	.destroy =3D via_crtc_destroy,
+	.page_flip =3D drm_atomic_helper_page_flip,
+	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
+};
+
+static void via_load_vpit_regs(struct via_drm_priv *dev_priv)
+{
+	u8 ar[] =3D {0x00, 0x01, 0x02, 0x03,
+			0x04, 0x05, 0x06, 0x07,
+			0x08, 0x09, 0x0A, 0x0B,
+			0x0C, 0x0D, 0x0E, 0x0F,
+			0x01, 0x00, 0x0F, 0x00};
+	struct vga_registers vpit_regs;
+	unsigned int i =3D 0;
+	u8 reg_value =3D 0;
+
+	/* Enable changing the palette registers */
+	reg_value =3D vga_r(VGABASE, VGA_IS1_RC);
+	vga_w(VGABASE, VGA_ATT_W, 0x00);
+
+	/* Write Misc register */
+	vga_w(VGABASE, VGA_MIS_W, 0xCF);
+
+	/* Fill VPIT registers */
+	vpit_regs.count =3D ARRAY_SIZE(vpit_table);
+	vpit_regs.regs =3D vpit_table;
+	load_register_tables(VGABASE, &vpit_regs);
+
+	/* Write Attribute Controller */
+	for (i =3D 0; i < 0x14; i++) {
+		reg_value =3D vga_r(VGABASE, VGA_IS1_RC);
+		vga_w(VGABASE, VGA_ATT_W, i);
+		vga_w(VGABASE, VGA_ATT_W, ar[i]);
+	}
+
+	/* Disable changing the palette registers */
+	reg_value =3D vga_r(VGABASE, VGA_IS1_RC);
+	vga_w(VGABASE, VGA_ATT_W, BIT(5));
+}
+
+static int via_iga1_display_fifo_regs(struct drm_device *dev,
+					struct via_drm_priv *dev_priv,
+					struct via_crtc *iga,
+					struct drm_display_mode *mode,
+					struct drm_framebuffer *fb)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u32 reg_value;
+	unsigned int fifo_max_depth =3D 0;
+	unsigned int fifo_threshold =3D 0;
+	unsigned int fifo_high_threshold =3D 0;
+	unsigned int display_queue_expire_num =3D 0;
+	bool enable_extended_display_fifo =3D false;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_CLE266_GFX:
+		if (dev_priv->revision =3D=3D CLE266_REVISION_AX) {
+			if (mode->hdisplay > 1024) {
+				/* SR17[6:0] */
+				fifo_max_depth =3D 96;
+
+				/* SR16[5:0] */
+				fifo_threshold =3D 92;
+
+				/* SR18[5:0] */
+				fifo_high_threshold =3D 92;
+
+				enable_extended_display_fifo =3D true;
+			} else {
+				/* SR17[6:0] */
+				fifo_max_depth =3D 64;
+
+				/* SR16[5:0] */
+				fifo_threshold =3D 32;
+
+				/* SR18[5:0] */
+				fifo_high_threshold =3D 56;
+
+				enable_extended_display_fifo =3D false;
+			}
+
+			if (dev_priv->vram_type <=3D VIA_MEM_DDR_200) {
+				if (fb->format->depth =3D=3D 24) {
+					if (mode->hdisplay > 1024) {
+						if (mode->vdisplay > 768) {
+							/* SR22[4:0] */
+							display_queue_expire_num =3D 16;
+						} else {
+							/* SR22[4:0] */
+							display_queue_expire_num =3D 12;
+						}
+					} else if (mode->hdisplay > 640) {
+						/* SR22[4:0] */
+						display_queue_expire_num =3D 40;
+					} else {
+						/* SR22[4:0] */
+						display_queue_expire_num =3D 124;
+					}
+				} else if (fb->format->depth =3D=3D 16){
+					if (mode->hdisplay > 1400) {
+						/* SR22[4:0] */
+						display_queue_expire_num =3D 16;
+					} else {
+						/* SR22[4:0] */
+						display_queue_expire_num =3D 12;
+					}
+				} else {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 124;
+				}
+			} else {
+				if (mode->hdisplay > 1280) {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 16;
+				} else if (mode->hdisplay > 1024) {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 12;
+				} else {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 124;
+				}
+			}
+		/* dev_priv->revision =3D=3D CLE266_REVISION_CX */
+		} else {
+			if (mode->hdisplay >=3D 1024) {
+				/* SR17[6:0] */
+				fifo_max_depth =3D 128;
+
+				/* SR16[5:0] */
+				fifo_threshold =3D 112;
+
+				/* SR18[5:0] */
+				fifo_high_threshold =3D 92;
+
+				enable_extended_display_fifo =3D false;
+			} else {
+				/* SR17[6:0] */
+				fifo_max_depth =3D 64;
+
+				/* SR16[5:0] */
+				fifo_threshold =3D 32;
+
+				/* SR18[5:0] */
+				fifo_high_threshold =3D 56;
+
+				enable_extended_display_fifo =3D false;
+			}
+
+			if (dev_priv->vram_type <=3D VIA_MEM_DDR_200) {
+				if (mode->hdisplay > 1024) {
+					if (mode->vdisplay > 768) {
+						/* SR22[4:0] */
+						display_queue_expire_num =3D 16;
+					} else {
+						/* SR22[4:0] */
+						display_queue_expire_num =3D 12;
+					}
+				} else if (mode->hdisplay > 640) {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 40;
+				} else {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 124;
+				}
+			} else {
+				if (mode->hdisplay >=3D 1280) {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 16;
+				} else {
+					/* SR22[4:0] */
+					display_queue_expire_num =3D 124;
+				}
+			}
+		}
+		break;
+
+	case PCI_DEVICE_ID_VIA_KM400_GFX:
+		if ((mode->hdisplay >=3D 1600) &&
+			(dev_priv->vram_type <=3D VIA_MEM_DDR_200)) {
+			/* SR17[6:0] */
+			fifo_max_depth =3D 58;
+
+			/* SR16[5:0] */
+			fifo_threshold =3D 24;
+
+			/* SR18[5:0] */
+			fifo_high_threshold =3D 92;
+		} else {
+			/* SR17[6:0] */
+			fifo_max_depth =3D 128;
+
+			/* SR16[5:0] */
+			fifo_threshold =3D 112;
+
+			/* SR18[5:0] */
+			fifo_high_threshold =3D 92;
+		}
+
+		enable_extended_display_fifo =3D false;
+
+		if (dev_priv->vram_type <=3D VIA_MEM_DDR_200) {
+			if (mode->hdisplay >=3D 1600) {
+				/* SR22[4:0] */
+				display_queue_expire_num =3D 16;
+			} else {
+				/* SR22[4:0] */
+				display_queue_expire_num =3D 8;
+			}
+		} else {
+			if (mode->hdisplay >=3D 1600) {
+				/* SR22[4:0] */
+				display_queue_expire_num =3D 40;
+			} else {
+				/* SR22[4:0] */
+				display_queue_expire_num =3D 36;
+			}
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_K8M800_GFX:
+		/* SR17[7:0] */
+		fifo_max_depth =3D 384;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D 328;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D 296;
+
+		if ((fb->format->depth =3D=3D 24) &&
+			(mode->hdisplay >=3D 1400)) {
+			/* SR22[4:0] */
+			display_queue_expire_num =3D 64;
+		} else {
+			/* SR22[4:0] */
+			display_queue_expire_num =3D 128;
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_PM800_GFX:
+		/* SR17[7:0] */
+		fifo_max_depth =3D 192;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D 128;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D 64;
+
+		if ((fb->format->depth =3D=3D 24) &&
+			(mode->hdisplay >=3D 1400)) {
+			/* SR22[4:0] */
+			display_queue_expire_num =3D 64;
+		} else {
+			/* SR22[4:0] */
+			display_queue_expire_num =3D 124;
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_P4M800_PRO_GFX:
+		/* SR17[7:0] */
+		fifo_max_depth =3D CN700_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D CN700_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D CN700_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D CN700_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* CX700 */
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+		/* SR17[7:0] */
+		fifo_max_depth =3D CX700_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D CX700_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D CX700_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D CX700_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+
+		/* K8M890 */
+	case PCI_DEVICE_ID_VIA_CHROME9:
+		/* SR17[7:0] */
+		fifo_max_depth =3D K8M890_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D K8M890_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D K8M890_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D K8M890_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* P4M890 */
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+		/* SR17[7:0] */
+		fifo_max_depth =3D P4M890_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D P4M890_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D P4M890_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D P4M890_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* P4M900 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+		/* SR17[7:0] */
+		fifo_max_depth =3D P4M900_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D P4M900_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D P4M900_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D P4M900_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* VX800 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+		/* SR17[7:0] */
+		fifo_max_depth =3D VX800_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D VX800_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D VX800_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D VX800_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* VX855 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+		/* SR17[7:0] */
+		fifo_max_depth =3D VX855_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D VX855_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D VX855_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D VX855_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* VX900 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		/* SR17[7:0] */
+		fifo_max_depth =3D VX900_IGA1_FIFO_MAX_DEPTH;
+
+		/* SR16[7], SR16[5:0] */
+		fifo_threshold =3D VX900_IGA1_FIFO_THRESHOLD;
+
+		/* SR18[7], SR18[5:0] */
+		fifo_high_threshold =3D VX900_IGA1_FIFO_HIGH_THRESHOLD;
+
+		/* SR22[4:0] */
+		display_queue_expire_num =3D VX900_IGA1_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		goto exit;
+	}
+
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_K8M800_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_PM800_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_P4M800_PRO_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_UNICHROME_PRO_II)) {
+		/* Force PREQ to be always higher than TREQ. */
+		svga_wseq_mask(VGABASE, 0x18, BIT(6), BIT(6));
+	} else {
+		svga_wseq_mask(VGABASE, 0x18, 0x00, BIT(6));
+	}
+
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+		if (enable_extended_display_fifo) {
+			reg_value =3D VIA_READ(0x0298);
+			VIA_WRITE(0x0298, reg_value | 0x20000000);
+
+			/* Turn on IGA1 extended display FIFO. */
+			reg_value =3D VIA_READ(0x0230);
+			VIA_WRITE(0x0230, reg_value | 0x00200000);
+
+			reg_value =3D VIA_READ(0x0298);
+			VIA_WRITE(0x0298, reg_value & (~0x20000000));
+		} else {
+			reg_value =3D VIA_READ(0x0298);
+			VIA_WRITE(0x0298, reg_value | 0x20000000);
+
+			/* Turn off IGA1 extended display FIFO. */
+			reg_value =3D VIA_READ(0x0230);
+			VIA_WRITE(0x0230, reg_value & (~0x00200000));
+
+			reg_value =3D VIA_READ(0x0298);
+			VIA_WRITE(0x0298, reg_value & (~0x20000000));
+
+		}
+	}
+
+	/* Set IGA1 Display FIFO Depth Select */
+	reg_value =3D IGA1_FIFO_DEPTH_SELECT_FORMULA(fifo_max_depth);
+	load_value_to_registers(VGABASE, &iga->fifo_depth, reg_value);
+
+	/* Set Display FIFO Threshold Select */
+	reg_value =3D fifo_threshold / 4;
+	load_value_to_registers(VGABASE, &iga->threshold, reg_value);
+
+	/* Set FIFO High Threshold Select */
+	reg_value =3D fifo_high_threshold / 4;
+	load_value_to_registers(VGABASE, &iga->high_threshold, reg_value);
+
+	/* Set Display Queue Expire Num */
+	reg_value =3D display_queue_expire_num / 4;
+	load_value_to_registers(VGABASE, &iga->display_queue, reg_value);
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_iga2_display_fifo_regs(struct drm_device *dev,
+					struct via_drm_priv *dev_priv,
+					struct via_crtc *iga,
+					struct drm_display_mode *mode,
+					struct drm_framebuffer *fb)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u32 reg_value;
+	unsigned int fifo_max_depth =3D 0;
+	unsigned int fifo_threshold =3D 0;
+	unsigned int fifo_high_threshold =3D 0;
+	unsigned int display_queue_expire_num =3D 0;
+	bool enable_extended_display_fifo =3D false;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_CLE266_GFX:
+		if (dev_priv->revision =3D=3D CLE266_REVISION_AX) {
+			if (((dev_priv->vram_type <=3D VIA_MEM_DDR_200) &&
+				(fb->format->depth > 16) &&
+				(mode->vdisplay > 768)) ||
+				((dev_priv->vram_type <=3D VIA_MEM_DDR_266) &&
+				(fb->format->depth > 16) &&
+				(mode->hdisplay > 1280))) {
+				/* CR68[7:4] */
+				fifo_max_depth =3D 88;
+
+				/* CR68[3:0] */
+				fifo_threshold =3D 44;
+
+				enable_extended_display_fifo =3D true;
+			} else {
+				/* CR68[7:4] */
+				fifo_max_depth =3D 56;
+
+				/* CR68[3:0] */
+				fifo_threshold =3D 28;
+
+				enable_extended_display_fifo =3D false;
+			}
+		/* dev_priv->revision =3D=3D CLE266_REVISION_CX */
+		} else {
+			if (mode->hdisplay >=3D 1024) {
+				/* CR68[7:4] */
+				fifo_max_depth =3D 88;
+
+				/* CR68[3:0] */
+				fifo_threshold =3D 44;
+
+				enable_extended_display_fifo =3D false;
+			} else {
+				/* CR68[7:4] */
+				fifo_max_depth =3D 56;
+
+				/* CR68[3:0] */
+				fifo_threshold =3D 28;
+
+				enable_extended_display_fifo =3D false;
+			}
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_KM400_GFX:
+		if (mode->hdisplay >=3D 1600) {
+			/* CR68[7:4] */
+			fifo_max_depth =3D 120;
+
+			/* CR68[3:0] */
+			fifo_threshold =3D 44;
+
+			enable_extended_display_fifo =3D true;
+		} else if (((mode->hdisplay > 1024) &&
+			(fb->format->depth =3D=3D 24) &&
+			(dev_priv->vram_type <=3D VIA_MEM_DDR_333)) ||
+			((mode->hdisplay =3D=3D 1024) &&
+			(fb->format->depth =3D=3D 24) &&
+			(dev_priv->vram_type <=3D VIA_MEM_DDR_200))) {
+			/* CR68[7:4] */
+			fifo_max_depth =3D 104;
+
+			/* CR68[3:0] */
+			fifo_threshold =3D 28;
+
+			enable_extended_display_fifo =3D true;
+		} else if (((mode->hdisplay > 1280) &&
+			(fb->format->depth =3D=3D 16) &&
+			(dev_priv->vram_type <=3D VIA_MEM_DDR_333)) ||
+			((mode->hdisplay =3D=3D 1280) &&
+			(fb->format->depth =3D=3D 16) &&
+			(dev_priv->vram_type <=3D VIA_MEM_DDR_200))) {
+			/* CR68[7:4] */
+			fifo_max_depth =3D 88;
+
+			/* CR68[3:0] */
+			fifo_threshold =3D 44;
+
+			enable_extended_display_fifo =3D true;
+		} else {
+			/* CR68[7:4] */
+			fifo_max_depth =3D 56;
+
+			/* CR68[3:0] */
+			fifo_threshold =3D 28;
+
+			enable_extended_display_fifo =3D false;
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_K8M800_GFX:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D 376;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D 328;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D 296;
+
+		if ((fb->format->depth =3D=3D 24) &&
+			(mode->hdisplay >=3D 1400)) {
+			/* CR94[6:0] */
+			display_queue_expire_num =3D 64;
+		} else {
+			/* CR94[6:0] */
+			display_queue_expire_num =3D 128;
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_PM800_GFX:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D 96;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D 64;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D 32;
+
+		if ((fb->format->depth =3D=3D 24) &&
+				(mode->hdisplay >=3D 1400)) {
+			/* CR94[6:0] */
+			display_queue_expire_num =3D 64;
+		} else {
+			/* CR94[6:0] */
+			display_queue_expire_num =3D 128;
+		}
+
+		break;
+	case PCI_DEVICE_ID_VIA_P4M800_PRO_GFX:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D CN700_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D CN700_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D CN700_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D CN700_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* CX700 */
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D CX700_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D CX700_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D CX700_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D CX700_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+
+		/* K8M890 */
+	case PCI_DEVICE_ID_VIA_CHROME9:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D K8M890_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D K8M890_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D K8M890_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D K8M890_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* P4M890 */
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D P4M890_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D P4M890_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D P4M890_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D P4M890_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* P4M900 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D P4M900_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_threshold =3D P4M900_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D P4M900_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D P4M900_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* VX800 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D VX800_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D VX800_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D VX800_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D VX800_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* VX855 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D VX855_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D VX855_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D VX855_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D VX855_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+		/* VX900 */
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		/* CR95[7], CR94[7], CR68[7:4] */
+		fifo_max_depth =3D VX900_IGA2_FIFO_MAX_DEPTH;
+
+		/* CR95[6:4], CR68[3:0] */
+		fifo_threshold =3D VX900_IGA2_FIFO_THRESHOLD;
+
+		/* CR95[2:0], CR92[3:0] */
+		fifo_high_threshold =3D VX900_IGA2_FIFO_HIGH_THRESHOLD;
+
+		/* CR94[6:0] */
+		display_queue_expire_num =3D VX900_IGA2_DISPLAY_QUEUE_EXPIRE_NUM;
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	if (ret) {
+		goto exit;
+	}
+
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+		if (enable_extended_display_fifo) {
+			/* Enable IGA2 extended display FIFO. */
+			svga_wcrt_mask(VGABASE, 0x6a, BIT(5), BIT(5));
+		} else {
+			/* Disable IGA2 extended display FIFO. */
+			svga_wcrt_mask(VGABASE, 0x6a, 0x00, BIT(5));
+		}
+	}
+
+	if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+		(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+		/* Set IGA2 Display FIFO Depth Select */
+		reg_value =3D IGA2_FIFO_DEPTH_SELECT_FORMULA(fifo_max_depth);
+		load_value_to_registers(VGABASE, &iga->fifo_depth, reg_value);
+
+		/* Set Display FIFO Threshold Select */
+		reg_value =3D fifo_threshold / 4;
+		load_value_to_registers(VGABASE, &iga->threshold, reg_value);
+	} else {
+		/* Set IGA2 Display FIFO Depth Select */
+		reg_value =3D IGA2_FIFO_DEPTH_SELECT_FORMULA(fifo_max_depth);
+		load_value_to_registers(VGABASE, &iga->fifo_depth, reg_value);
+
+		/* Set Display FIFO Threshold Select */
+		reg_value =3D fifo_threshold / 4;
+		load_value_to_registers(VGABASE, &iga->threshold, reg_value);
+
+		/* Set FIFO High Threshold Select */
+		reg_value =3D fifo_high_threshold / 4;
+		load_value_to_registers(VGABASE, &iga->high_threshold, reg_value);
+
+		/* Set Display Queue Expire Num */
+		reg_value =3D display_queue_expire_num / 4;
+		load_value_to_registers(VGABASE, &iga->display_queue, reg_value);
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+/* Load CRTC Pixel Timing registers */
+void via_load_crtc_pixel_timing(struct drm_crtc *crtc,
+				struct drm_display_mode *mode)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u32 reg_value =3D 0;
+
+	reg_value =3D IGA1_PIXELTIMING_HOR_TOTAL_FORMULA(mode->crtc_htotal);
+	load_value_to_registers(VGABASE, &iga->pixel_timings.htotal,
+				reg_value);
+
+	reg_value =3D IGA1_PIXELTIMING_HOR_ADDR_FORMULA(mode->crtc_hdisplay) << =
16;
+	load_value_to_registers(VGABASE, &iga->pixel_timings.hdisplay,
+				reg_value);
+
+	reg_value =3D IGA1_PIXELTIMING_HOR_BLANK_START_FORMULA(
+					mode->crtc_hblank_start);
+	load_value_to_registers(VGABASE, &iga->pixel_timings.hblank_start,
+				reg_value);
+
+	reg_value =3D IGA1_PIXELTIMING_HOR_BLANK_END_FORMULA(mode->crtc_hblank_e=
nd) << 16;
+	load_value_to_registers(VGABASE, &iga->pixel_timings.hblank_end, reg_val=
ue);
+
+	reg_value =3D IGA1_PIXELTIMING_HOR_SYNC_START_FORMULA(mode->crtc_hsync_s=
tart);
+	load_value_to_registers(VGABASE, &iga->pixel_timings.hsync_start,
+				reg_value);
+
+	reg_value =3D IGA1_PIXELTIMING_HOR_SYNC_END_FORMULA(mode->crtc_hsync_end=
) << 16;
+	load_value_to_registers(VGABASE, &iga->pixel_timings.hsync_end, reg_valu=
e);
+
+	reg_value =3D IGA1_PIXELTIMING_VER_TOTAL_FORMULA(mode->crtc_vtotal);
+	load_value_to_registers(VGABASE, &iga->pixel_timings.vtotal, reg_value);
+
+	reg_value =3D IGA1_PIXELTIMING_VER_ADDR_FORMULA(mode->crtc_vdisplay) << =
16;
+	load_value_to_registers(VGABASE, &iga->pixel_timings.vdisplay, reg_value=
);
+
+	reg_value =3D IGA1_PIXELTIMING_VER_BLANK_START_FORMULA(
+					mode->crtc_vblank_start);
+	load_value_to_registers(VGABASE, &iga->pixel_timings.vblank_start, reg_v=
alue);
+
+	reg_value =3D IGA1_PIXELTIMING_VER_BLANK_END_FORMULA(mode->crtc_vblank_e=
nd) << 16;
+	load_value_to_registers(VGABASE, &iga->pixel_timings.vblank_end, reg_val=
ue);
+
+	reg_value =3D IGA1_PIXELTIMING_VER_SYNC_START_FORMULA(mode->crtc_vsync_s=
tart);
+	load_value_to_registers(VGABASE, &iga->pixel_timings.vsync_start, reg_va=
lue);
+
+	reg_value =3D IGA1_PIXELTIMING_VER_SYNC_END_FORMULA(mode->crtc_vsync_end=
) << 12;
+	load_value_to_registers(VGABASE, &iga->pixel_timings.vsync_end, reg_valu=
e);
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
+		reg_value =3D IGA1_PIXELTIMING_HVSYNC_OFFSET_END_FORMULA(
+				mode->crtc_htotal, mode->crtc_hsync_start);
+		VIA_WRITE_MASK(IGA1_PIX_HALF_LINE_REG, reg_value,
+					IGA1_PIX_HALF_LINE_MASK);
+
+		svga_wcrt_mask(VGABASE, 0x32, BIT(2), BIT(2));
+		/**
+		 * According to information from HW team,
+		 * we need to set 0xC280[1] =3D 1 (HDMI function enable)
+		 * or 0xC640[0] =3D 1 (DP1 enable)
+		 * to let the half line function work.
+		 * Otherwise, the clock for interlace mode
+		 * will not correct.
+		 * This is a special setting for 410.
+		 */
+		VIA_WRITE_MASK(0xC280, BIT(1), BIT(1));
+	} else {
+		VIA_WRITE_MASK(IGA1_PIX_HALF_LINE_REG, 0x0, IGA1_PIX_HALF_LINE_MASK);
+		svga_wcrt_mask(VGABASE, 0x32, 0x00, BIT(2));
+
+	}
+	svga_wcrt_mask(VGABASE, 0xFD, BIT(5), BIT(5));
+}
+
+/* Load CRTC timing registers */
+void via_load_crtc_timing(struct via_crtc *iga, struct drm_display_mode *=
mode)
+{
+	struct drm_device *dev =3D iga->base.dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u32 reg_value =3D 0;
+
+	if (!iga->index) {
+		if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HD) {
+			/* Disable IGA1 shadow timing */
+			svga_wcrt_mask(VGABASE, 0x45, 0x00, BIT(0));
+
+			/* Disable IGA1 pixel timing */
+			svga_wcrt_mask(VGABASE, 0xFD, 0x00, BIT(5));
+		}
+
+		reg_value =3D IGA1_HOR_TOTAL_FORMULA(mode->crtc_htotal);
+		load_value_to_registers(VGABASE, &iga->timings.htotal, reg_value);
+
+		reg_value =3D IGA1_HOR_ADDR_FORMULA(mode->crtc_hdisplay);
+		load_value_to_registers(VGABASE, &iga->timings.hdisplay, reg_value);
+
+		reg_value =3D IGA1_HOR_BLANK_START_FORMULA(mode->crtc_hblank_start);
+		load_value_to_registers(VGABASE, &iga->timings.hblank_start, reg_value)=
;
+
+		reg_value =3D IGA1_HOR_BLANK_END_FORMULA(mode->crtc_hblank_end);
+		load_value_to_registers(VGABASE, &iga->timings.hblank_end, reg_value);
+
+		reg_value =3D IGA1_HOR_SYNC_START_FORMULA(mode->crtc_hsync_start);
+		load_value_to_registers(VGABASE, &iga->timings.hsync_start, reg_value);
+
+		reg_value =3D IGA1_HOR_SYNC_END_FORMULA(mode->crtc_hsync_end);
+		load_value_to_registers(VGABASE, &iga->timings.hsync_end, reg_value);
+
+		reg_value =3D IGA1_VER_TOTAL_FORMULA(mode->crtc_vtotal);
+		load_value_to_registers(VGABASE, &iga->timings.vtotal, reg_value);
+
+		reg_value =3D IGA1_VER_ADDR_FORMULA(mode->crtc_vdisplay);
+		load_value_to_registers(VGABASE, &iga->timings.vdisplay, reg_value);
+
+		reg_value =3D IGA1_VER_BLANK_START_FORMULA(mode->crtc_vblank_start);
+		load_value_to_registers(VGABASE, &iga->timings.vblank_start, reg_value)=
;
+
+		reg_value =3D IGA1_VER_BLANK_END_FORMULA(mode->crtc_vblank_end);
+		load_value_to_registers(VGABASE, &iga->timings.vblank_end, reg_value);
+
+		reg_value =3D IGA1_VER_SYNC_START_FORMULA(mode->crtc_vsync_start);
+		load_value_to_registers(VGABASE, &iga->timings.vsync_start, reg_value);
+
+		reg_value =3D IGA1_VER_SYNC_END_FORMULA(mode->crtc_vsync_end);
+		load_value_to_registers(VGABASE, &iga->timings.vsync_end, reg_value);
+	} else {
+		reg_value =3D IGA2_HOR_TOTAL_FORMULA(mode->crtc_htotal);
+		load_value_to_registers(VGABASE, &iga->timings.htotal, reg_value);
+
+		reg_value =3D IGA2_HOR_ADDR_FORMULA(mode->crtc_hdisplay);
+		load_value_to_registers(VGABASE, &iga->timings.hdisplay, reg_value);
+
+		reg_value =3D IGA2_HOR_BLANK_START_FORMULA(mode->crtc_hblank_start);
+		load_value_to_registers(VGABASE, &iga->timings.hblank_start, reg_value)=
;
+
+		reg_value =3D IGA2_HOR_BLANK_END_FORMULA(mode->crtc_hblank_end);
+		load_value_to_registers(VGABASE, &iga->timings.hblank_end, reg_value);
+
+		reg_value =3D IGA2_HOR_SYNC_START_FORMULA(mode->crtc_hsync_start);
+		load_value_to_registers(VGABASE, &iga->timings.hsync_start, reg_value);
+
+		reg_value =3D IGA2_HOR_SYNC_END_FORMULA(mode->crtc_hsync_end);
+		load_value_to_registers(VGABASE, &iga->timings.hsync_end, reg_value);
+
+		reg_value =3D IGA2_VER_TOTAL_FORMULA(mode->crtc_vtotal);
+		load_value_to_registers(VGABASE, &iga->timings.vtotal, reg_value);
+
+		reg_value =3D IGA2_VER_ADDR_FORMULA(mode->crtc_vdisplay);
+		load_value_to_registers(VGABASE, &iga->timings.vdisplay, reg_value);
+
+		reg_value =3D IGA2_VER_BLANK_START_FORMULA(mode->crtc_vblank_start);
+		load_value_to_registers(VGABASE, &iga->timings.vblank_start, reg_value)=
;
+
+		reg_value =3D IGA2_VER_BLANK_END_FORMULA(mode->crtc_vblank_end);
+		load_value_to_registers(VGABASE, &iga->timings.vblank_end, reg_value);
+
+		reg_value =3D IGA2_VER_SYNC_START_FORMULA(mode->crtc_vsync_start);
+		load_value_to_registers(VGABASE, &iga->timings.vsync_start, reg_value);
+
+		reg_value =3D IGA2_VER_SYNC_END_FORMULA(mode->crtc_vsync_end);
+		load_value_to_registers(VGABASE, &iga->timings.vsync_end, reg_value);
+	}
+}
+
+/*
+ * This function changes the destination of scaling up/down
+ * and CRTC timing registers
+ * crtc : which IGA
+ * scale_type : upscaling(VIA_EXPAND) or downscaling(VIA_SHRINK)
+ */
+void via_set_scale_path(struct drm_crtc *crtc, u32 scale_type)
+{
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u8 reg_cr_fd =3D vga_rcrt(VGABASE, 0xFD);
+
+	if (!iga->index)
+		/* register reuse: select IGA1 path */
+		reg_cr_fd |=3D BIT(7);
+	else
+		/* register reuse: select IGA2 path */
+		reg_cr_fd &=3D ~BIT(7);
+
+	/* only IGA1 up scaling need to clear this bit CRFD.5. */
+	if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_CHROME9_HD) {
+		if (!iga->index
+			&& ((VIA_HOR_EXPAND & scale_type)
+			|| (VIA_VER_EXPAND & scale_type)))
+			reg_cr_fd &=3D ~BIT(5);
+	}
+
+	/* CRFD.0 =3D 0 : common IGA2, =3D 1 : downscaling IGA */
+	switch (scale_type) {
+	case VIA_NO_SCALING:
+	case VIA_EXPAND:
+	case VIA_HOR_EXPAND:
+	case VIA_VER_EXPAND:
+		/* register reuse: as common IGA2 */
+		reg_cr_fd &=3D ~BIT(0);
+		break;
+
+	case VIA_SHRINK:
+		/* register reuse: as downscaling IGA */
+		reg_cr_fd |=3D BIT(0);
+		break;
+
+	default:
+		break;
+	}
+	vga_wcrt(VGABASE, 0xFD, reg_cr_fd);
+}
+
+/* disable IGA scaling */
+static void via_disable_iga_scaling(struct drm_crtc *crtc)
+{
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_device *dev =3D crtc->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	if (iga->index) {
+		/* IGA2 scalings disable */
+		via_set_scale_path(crtc, VIA_SHRINK);
+		/* disable IGA down scaling and buffer sharing. */
+		svga_wcrt_mask(VGABASE, 0x89, 0x00, BIT(7) | BIT(0));
+		/* Horizontal and Vertical scaling disable */
+		svga_wcrt_mask(VGABASE, 0xA2, 0x00, BIT(7) | BIT(3));
+
+		/* Disable scale up as well */
+		via_set_scale_path(crtc, VIA_EXPAND);
+		/* disable IGA up scaling */
+		svga_wcrt_mask(VGABASE, 0x79, 0, BIT(0));
+		/* Horizontal and Vertical scaling disable */
+		svga_wcrt_mask(VGABASE, 0xA2, 0x00, BIT(7) | BIT(3));
+	} else {
+		/* IGA1 scalings disable */
+		via_set_scale_path(crtc, VIA_SHRINK);
+		/* disable IGA down scaling and buffer sharing. */
+		svga_wcrt_mask(VGABASE, 0x89, 0x00, BIT(7) | BIT(0));
+		/* Horizontal and Vertical scaling disable */
+		svga_wcrt_mask(VGABASE, 0xA2, 0x00, BIT(7) | BIT(3));
+
+		/* Disable scale up as well */
+		via_set_scale_path(crtc, VIA_EXPAND);
+		/* disable IGA up scaling */
+		svga_wcrt_mask(VGABASE, 0x79, 0, BIT(0));
+		/* Horizontal and Vertical scaling disable */
+		svga_wcrt_mask(VGABASE, 0xA2, 0x00, BIT(7) | BIT(3));
+	}
+}
+
+/*
+ * Enable IGA scale functions.
+ *
+ * input : iga_path =3D	IGA1 or IGA2 or
+ *			IGA1+IGA2
+ *
+ * scale_type	=3D	VIA_HOR_EXPAND or VIA_VER_EXPAND or VIA_EXPAND or
+ *			VIA_SHRINK or VIA_SHRINK + VIA_EXPAND
+ */
+bool via_set_iga_scale_function(struct drm_crtc *crtc, u32 scale_type)
+{
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_device *dev =3D crtc->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	if (!(scale_type & (VIA_SHRINK + VIA_EXPAND)))
+		return false;
+
+	if (iga->index) {
+		/* IGA2 scalings enable */
+		if (VIA_SHRINK & scale_type) {
+			via_set_scale_path(crtc, VIA_SHRINK);
+			/* Horizontal and Vertical scaling enable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7) | BIT(3), BIT(7) | BIT(3));
+			/* enable IGA down scaling */
+			svga_wcrt_mask(VGABASE, 0x89, BIT(0), BIT(0));
+			/* hor and ver scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(2) | BIT(1), BIT(2) | BIT(1));
+		}
+
+		if (VIA_EXPAND & scale_type) {
+			via_set_scale_path(crtc, VIA_EXPAND);
+			/* enable IGA up scaling */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(0), BIT(0));
+		}
+
+		if ((VIA_EXPAND & scale_type) =3D=3D VIA_EXPAND) {
+			/* Horizontal and Vertical scaling enable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7) | BIT(3), BIT(7) | BIT(3));
+			/* hor and ver scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(2) | BIT(1), BIT(2) | BIT(1));
+		} else if (VIA_HOR_EXPAND & scale_type) {
+			/* Horizontal scaling disable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7), BIT(7));
+			/* hor scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(1), BIT(1));
+		} else if (VIA_VER_EXPAND & scale_type) {
+			/* Vertical scaling disable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(3), BIT(3));
+			/* ver scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(2), BIT(2));
+		}
+	} else {
+		/* IGA1 scalings enable */
+		if (VIA_SHRINK & scale_type) {
+			via_set_scale_path(crtc, VIA_SHRINK);
+
+			/* Horizontal and Vertical scaling enable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7) | BIT(3), BIT(7) | BIT(3));
+			/* enable IGA down scaling */
+			svga_wcrt_mask(VGABASE, 0x89, BIT(0), BIT(0));
+			/* hor and ver scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(2) | BIT(1), BIT(2) | BIT(1));
+		}
+
+		if (VIA_EXPAND & scale_type) {
+			via_set_scale_path(crtc, VIA_EXPAND);
+			/* enable IGA up scaling */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(0), BIT(0));
+		}
+
+		if ((VIA_EXPAND & scale_type) =3D=3D VIA_EXPAND) {
+			/* Horizontal and Vertical scaling enable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7) | BIT(3), BIT(7) | BIT(3));
+			/* hor and ver scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(2) | BIT(1), BIT(2) | BIT(1));
+		} else if (VIA_HOR_EXPAND & scale_type) {
+			/* Horizontal scaling disable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7), BIT(7));
+			/* hor scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(1), BIT(1));
+		} else if (VIA_VER_EXPAND & scale_type) {
+			/* Vertical scaling disable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(3), BIT(3));
+			/* ver scaling : Interpolation */
+			svga_wcrt_mask(VGABASE, 0x79, BIT(2), BIT(2));
+		}
+	}
+	return true;
+}
+
+/*
+ * 1. get scale factors from source and dest H & V size
+ * 2. load scale factors into registers
+ * 3. enable H or V scale ( set CRA2 bit7 or bit3 )
+ */
+bool via_load_iga_scale_factor_regs(struct via_drm_priv *dev_priv,
+					struct drm_display_mode *mode,
+					struct drm_display_mode *adjusted_mode,
+					u32 scale_type, u32 is_hor_or_ver)
+{
+	u32 dst_hor_regs =3D adjusted_mode->crtc_hdisplay;
+	u32 dst_ver_regs =3D adjusted_mode->crtc_vdisplay;
+	u32 src_hor_regs =3D mode->crtc_hdisplay;
+	u32 src_ver_regs =3D mode->crtc_vdisplay;
+	u32 hor_factor =3D 0, ver_factor =3D 0;
+	struct vga_registers reg;
+
+	if ((0 =3D=3D src_hor_regs) || (0 =3D=3D src_ver_regs) || (0 =3D=3D dst_=
hor_regs)
+			|| (0 =3D=3D dst_ver_regs))
+		return false;
+
+	if (VIA_EXPAND =3D=3D scale_type) {
+		if (HOR_SCALE & is_hor_or_ver) {
+			hor_factor =3D ((src_hor_regs - 1) * 4096) / (dst_hor_regs - 1);
+			reg.count =3D ARRAY_SIZE(lcd_hor_scaling);
+			reg.regs =3D lcd_hor_scaling;
+			load_value_to_registers(VGABASE, &reg, hor_factor);
+			/* Horizontal scaling enable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7), BIT(7));
+		}
+
+		if (VER_SCALE & is_hor_or_ver) {
+			ver_factor =3D ((src_ver_regs - 1) * 2048) / (dst_ver_regs - 1);
+			reg.count =3D ARRAY_SIZE(lcd_ver_scaling);
+			reg.regs =3D lcd_ver_scaling;
+			load_value_to_registers(VGABASE, &reg, ver_factor);
+			/* Vertical scaling enable */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(3), BIT(3));
+		}
+
+	} else if (VIA_SHRINK =3D=3D scale_type) {
+
+		if (src_hor_regs > dst_hor_regs)
+			hor_factor =3D ((src_hor_regs - dst_hor_regs) * 4096) / dst_hor_regs;
+
+		if (src_ver_regs > dst_ver_regs)
+			ver_factor =3D ((src_ver_regs - dst_ver_regs) * 2048) / dst_ver_regs;
+
+		reg.count =3D ARRAY_SIZE(lcd_hor_scaling);
+		reg.regs =3D lcd_hor_scaling;
+		load_value_to_registers(VGABASE, &reg, hor_factor);
+
+		reg.count =3D ARRAY_SIZE(lcd_ver_scaling);
+		reg.regs =3D lcd_ver_scaling;
+		load_value_to_registers(VGABASE, &reg, ver_factor);
+
+		/* set buffer sharing enable bit . */
+		if (hor_factor || ver_factor) {
+			if (dst_hor_regs > 1024)
+				svga_wcrt_mask(VGABASE, 0x89, BIT(7), BIT(7));
+			else
+				svga_wcrt_mask(VGABASE, 0x89, 0x00, BIT(7));
+		}
+
+		if (hor_factor)
+			/* CRA2[7]:1 Enable Hor scaling
+			   CRA2[6]:1 Linear Mode */
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(7) | BIT(6), BIT(7) | BIT(6));
+		else
+			svga_wcrt_mask(VGABASE, 0xA2, 0, BIT(7));
+
+		if (ver_factor)
+			svga_wcrt_mask(VGABASE, 0xA2, BIT(3), BIT(3));
+		else
+			svga_wcrt_mask(VGABASE, 0xA2, 0, BIT(3));
+	}
+	return true;
+}
+
+void via_set_iga2_downscale_source_timing(struct drm_crtc *crtc,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	unsigned int viewx =3D adjusted_mode->hdisplay,
+			viewy =3D adjusted_mode->vdisplay;
+	unsigned int srcx =3D mode->crtc_hdisplay, srcy =3D mode->crtc_vdisplay;
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_display_mode *src_timing;
+
+	src_timing =3D drm_mode_duplicate(crtc->dev, adjusted_mode);
+	/* derived source timing */
+	if (srcx <=3D viewx) {
+		src_timing->crtc_htotal =3D adjusted_mode->crtc_htotal;
+		src_timing->crtc_hdisplay =3D adjusted_mode->crtc_hdisplay;
+	} else {
+		unsigned int htotal =3D adjusted_mode->crtc_htotal -
+					adjusted_mode->crtc_hdisplay;
+
+		src_timing->crtc_htotal =3D htotal + srcx;
+		src_timing->crtc_hdisplay =3D srcx;
+	}
+	src_timing->crtc_hblank_start =3D src_timing->crtc_hdisplay;
+	src_timing->crtc_hblank_end =3D src_timing->crtc_htotal;
+	src_timing->crtc_hsync_start =3D src_timing->crtc_hdisplay + 2;
+	src_timing->crtc_hsync_end =3D src_timing->crtc_hsync_start + 1;
+
+	if (srcy <=3D viewy) {
+		src_timing->crtc_vtotal =3D adjusted_mode->crtc_vtotal;
+		src_timing->crtc_vdisplay =3D adjusted_mode->crtc_vdisplay;
+	} else {
+		unsigned int vtotal =3D adjusted_mode->crtc_vtotal -
+					adjusted_mode->crtc_vdisplay;
+
+		src_timing->crtc_vtotal =3D vtotal + srcy;
+		src_timing->crtc_vdisplay =3D srcy;
+	}
+	src_timing->crtc_vblank_start =3D src_timing->crtc_vdisplay;
+	src_timing->crtc_vblank_end =3D src_timing->crtc_vtotal;
+	src_timing->crtc_vsync_start =3D src_timing->crtc_vdisplay + 2;
+	src_timing->crtc_vsync_end =3D src_timing->crtc_vsync_start + 1;
+
+	via_set_scale_path(crtc, VIA_NO_SCALING);
+	/* load src timing */
+	via_load_crtc_timing(iga, src_timing);
+
+	/* Cleanup up source timings */
+	drm_mode_destroy(crtc->dev, src_timing);
+}
+
+void via_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct drm_display_mode *mode =3D &crtc->state->mode;
+	struct drm_display_mode *adjusted_mode =3D
+					&crtc->state->adjusted_mode;
+	struct via_crtc *iga =3D container_of(crtc,
+						struct via_crtc, base);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u8 reg_value =3D 0;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!iga->index) {
+		/* Load standard registers */
+		via_load_vpit_regs(dev_priv);
+
+		/* Unlock */
+		via_unlock_crtc(VGABASE, pdev->device);
+
+		/* IGA1 reset */
+		vga_wcrt(VGABASE, 0x09, 0x00); /* initial CR09=3D0 */
+		svga_wcrt_mask(VGABASE, 0x11, 0x00, BIT(6));
+
+		/* disable IGA scales first */
+		via_disable_iga_scaling(crtc);
+
+		/*
+		 * when not down scaling, we only need load one
+		 * timing.
+		 */
+		via_load_crtc_timing(iga, adjusted_mode);
+
+		switch (adjusted_mode->crtc_htotal % 8) {
+		case 0:
+		default:
+			break;
+		case 2:
+			reg_value =3D BIT(7);
+			break;
+		case 4:
+			reg_value =3D BIT(6);
+			break;
+		case 6:
+			reg_value =3D BIT(3);
+			break;
+		}
+
+		svga_wcrt_mask(VGABASE, 0x47,
+				reg_value, BIT(7) | BIT(6) | BIT(3));
+
+		/* Relock */
+		via_lock_crtc(VGABASE);
+
+		/* Set non-interlace / interlace mode. */
+		via_iga1_set_interlace_mode(VGABASE,
+					adjusted_mode->flags &
+					DRM_MODE_FLAG_INTERLACE);
+
+		/* No HSYNC shift. */
+		via_iga1_set_hsync_shift(VGABASE, 0x05);
+
+		/* Load display FIFO. */
+		ret =3D via_iga1_display_fifo_regs(dev, dev_priv,
+						iga, adjusted_mode,
+						crtc->primary->fb);
+		if (ret) {
+			goto exit;
+		}
+
+		/* Set PLL */
+		if (adjusted_mode->clock) {
+			u32 clock =3D adjusted_mode->clock * 1000;
+			u32 pll_regs;
+
+			if (iga->scaling_mode & VIA_SHRINK)
+				clock *=3D 2;
+			pll_regs =3D via_get_clk_value(crtc->dev, clock);
+			via_set_vclock(crtc, pll_regs);
+		}
+
+		via_iga_common_init(pdev, VGABASE);
+
+		/* Set palette LUT to 8-bit mode. */
+		via_iga1_set_palette_lut_resolution(VGABASE, true);
+	} else {
+		/* Load standard registers */
+		via_load_vpit_regs(dev_priv);
+
+		/* Unlock */
+		via_unlock_crtc(VGABASE, pdev->device);
+
+		/* disable IGA scales first */
+		via_disable_iga_scaling(crtc);
+
+		/* Load crtc timing and IGA scaling */
+		if (iga->scaling_mode & VIA_SHRINK) {
+			/*
+			 * enable IGA2 down scaling and set
+			 * Interpolation
+			 */
+			via_set_iga_scale_function(crtc, VIA_SHRINK);
+
+			/* load hor and ver downscaling factor */
+			/*
+			 * interlace modes scaling support(example
+			 * 1080I): we should use mode->crtc_vdisplay
+			 * here, because crtc_vdisplay=3D540,
+			 * vdisplay=3D1080, we need 540 here, not 1080.
+			 */
+			via_load_iga_scale_factor_regs(dev_priv,
+							mode,
+							adjusted_mode,
+							VIA_SHRINK,
+							HOR_VER_SCALE);
+			/* load src timing to timing registers */
+			/*
+			 * interlace modes scaling support(example
+			 * 1080I): we should use mode->crtc_vdisplay
+			 * here, because crtc_vdisplay=3D540,
+			 * vdisplay=3D1080, we need 540 here, not 1080.
+			 */
+			via_set_iga2_downscale_source_timing(crtc,
+							mode,
+							adjusted_mode);
+
+			/* Download dst timing */
+			via_set_scale_path(crtc, VIA_SHRINK);
+			via_load_crtc_timing(iga, adjusted_mode);
+			/*
+			 * very necessary to set IGA to none scaling
+			 * status need to fix why so need.
+			 */
+			via_set_scale_path(crtc, VIA_NO_SCALING);
+		} else {
+			/*
+			 * when not down scaling, we only need load
+			 * one timing.
+			 */
+			via_load_crtc_timing(iga, adjusted_mode);
+
+			/* II. up scaling */
+			if (iga->scaling_mode & VIA_EXPAND) {
+				/* Horizontal scaling */
+				if (iga->scaling_mode &
+					VIA_HOR_EXPAND) {
+					via_set_iga_scale_function(
+						crtc,
+						VIA_HOR_EXPAND);
+					via_load_iga_scale_factor_regs(
+							dev_priv,
+							mode,
+							adjusted_mode,
+							VIA_EXPAND,
+							HOR_SCALE);
+				}
+
+				/* Vertical scaling */
+				if (iga->scaling_mode &
+					VIA_VER_EXPAND) {
+					via_set_iga_scale_function(
+							crtc,
+							VIA_VER_EXPAND);
+					via_load_iga_scale_factor_regs(
+							dev_priv,
+							mode,
+							adjusted_mode,
+							VIA_EXPAND,
+							VER_SCALE);
+				}
+			}
+		}
+
+		/* Relock */
+		via_lock_crtc(VGABASE);
+
+		/* Set non-interlace / interlace mode. */
+		via_iga2_set_interlace_mode(VGABASE,
+					adjusted_mode->flags &
+					DRM_MODE_FLAG_INTERLACE);
+
+		/* Load display FIFO. */
+		ret =3D via_iga2_display_fifo_regs(dev, dev_priv,
+						iga, adjusted_mode,
+						crtc->primary->fb);
+		if (ret) {
+			goto exit;
+		}
+
+		/* Set PLL */
+		if (adjusted_mode->clock) {
+			u32 clock =3D adjusted_mode->clock * 1000;
+			u32 pll_regs;
+
+			if (iga->scaling_mode & VIA_SHRINK)
+				clock *=3D 2;
+			pll_regs =3D via_get_clk_value(crtc->dev, clock);
+			via_set_vclock(crtc, pll_regs);
+		}
+
+		via_iga_common_init(pdev, VGABASE);
+
+		/* Set palette LUT to 8-bit mode. */
+		via_iga2_set_palette_lut_resolution(VGABASE, true);
+
+		svga_wcrt_mask(VGABASE, 0x6A, BIT(7), BIT(7));
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					struct drm_atomic_state *state)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_crtc *iga =3D container_of(crtc,
+						struct via_crtc, base);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!iga->index) {
+		svga_wseq_mask(VGABASE, 0x01, 0x00, BIT(5));
+	} else {
+		svga_wcrt_mask(VGABASE, 0x6B, 0x00, BIT(2));
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					struct drm_atomic_state *state)
+{
+	struct drm_device *dev =3D crtc->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_crtc *iga =3D container_of(crtc,
+						struct via_crtc, base);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!iga->index) {
+		svga_wseq_mask(VGABASE, 0x01, BIT(5), BIT(5));
+	} else {
+		svga_wcrt_mask(VGABASE, 0x6B, BIT(2), BIT(2));
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct drm_crtc_helper_funcs via_drm_crtc_helper_funcs =3D {
+	.mode_set_nofb =3D via_mode_set_nofb,
+	.atomic_enable =3D via_crtc_helper_atomic_enable,
+	.atomic_disable =3D via_crtc_helper_atomic_disable,
+};
+
+static int via_primary_atomic_check(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state =3D
+			drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_device *dev =3D plane->dev;
+	struct drm_framebuffer *fb =3D new_plane_state->fb;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	uint32_t frame_buffer_size;
+	int ret =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if ((!new_plane_state->crtc) || (!new_plane_state->visible)) {
+		goto exit;
+	}
+
+	frame_buffer_size =3D (fb->width * fb->format->cpp[0]) *
+				fb->height;
+	if (frame_buffer_size > dev_priv->vram_size) {
+		ret =3D -ENOMEM;
+		goto exit;
+	}
+
+	if ((fb->width > dev->mode_config.max_width) ||
+		(fb->width < dev->mode_config.min_width)) {
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
+					false, true);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_primary_atomic_disable(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return;
+}
+
+void via_primary_atomic_update(struct drm_plane *plane,
+					struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_state =3D
+			drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *crtc =3D new_state->crtc;
+	struct drm_framebuffer *fb =3D new_state->fb;
+	uint32_t pitch =3D (new_state->crtc_y * fb->pitches[0]) +
+			(new_state->crtc_x * fb->format->cpp[0]);
+	uint32_t addr;
+	struct via_crtc *iga =3D container_of(crtc, struct via_crtc, base);
+	struct drm_device *dev =3D crtc->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct drm_gem_object *gem;
+	struct ttm_buffer_object *ttm_bo;
+	struct via_bo *bo;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	gem =3D fb->obj[0];
+	ttm_bo =3D container_of(gem, struct ttm_buffer_object, base);
+	bo =3D to_ttm_bo(ttm_bo);
+
+	if (!iga->index) {
+		via_iga1_set_color_depth(dev_priv, fb->format->depth);
+
+		/* Set the framebuffer offset */
+		addr =3D round_up((ttm_bo->resource->start << PAGE_SHIFT) +
+				pitch, 16) >> 1;
+
+		vga_wcrt(VGABASE, 0x0D, addr & 0xFF);
+		vga_wcrt(VGABASE, 0x0C, (addr >> 8) & 0xFF);
+		/* Yes order of setting these registers matters on some hardware */
+		svga_wcrt_mask(VGABASE, 0x48, ((addr >> 24) & 0x1F), 0x1F);
+		vga_wcrt(VGABASE, 0x34, (addr >> 16) & 0xFF);
+
+		/* Load fetch count registers */
+		pitch =3D ALIGN(crtc->mode.hdisplay * fb->format->cpp[0],
+				16);
+		load_value_to_registers(VGABASE, &iga->fetch, pitch >> 4);
+
+		/* Set the primary pitch */
+		pitch =3D ALIGN(fb->pitches[0], 16);
+		/* Spec does not say that first adapter skips 3 bits but old
+		 * code did it and seems to be reasonable in analogy to
+		 * second adapter */
+		load_value_to_registers(VGABASE, &iga->offset, pitch >> 3);
+	} else {
+		via_iga2_set_color_depth(dev_priv, fb->format->depth);
+
+		/* Set the framebuffer offset */
+		addr =3D round_up((ttm_bo->resource->start << PAGE_SHIFT) +
+				pitch, 16);
+		/* Bits 9 to 3 of the frame buffer go into bits 7 to 1
+		 * of the register. Bit 0 is for setting tile mode or
+		 * linear mode. A value of zero sets it to linear mode */
+		vga_wcrt(VGABASE, 0x62, ((addr >> 3) & 0x7F) << 1);
+		vga_wcrt(VGABASE, 0x63, (addr >> 10) & 0xFF);
+		vga_wcrt(VGABASE, 0x64, (addr >> 18) & 0xFF);
+		svga_wcrt_mask(VGABASE, 0xA3, ((addr >> 26) & 0x07), 0x07);
+
+		/* Load fetch count registers */
+		pitch =3D ALIGN(crtc->mode.hdisplay * (fb->format->cpp[0] * 8) >> 3, 16=
);
+		load_value_to_registers(VGABASE, &iga->fetch, pitch >> 4);
+
+		/* Set secondary pitch */
+		pitch =3D ALIGN(fb->pitches[0], 16);
+		load_value_to_registers(VGABASE, &iga->offset, pitch >> 3);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static int via_primary_prepare_fb(struct drm_plane *plane,
+				struct drm_plane_state *new_state)
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
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static void via_primary_cleanup_fb(struct drm_plane *plane,
+				struct drm_plane_state *old_state)
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
+	ret =3D ttm_bo_reserve(ttm_bo, true, false, NULL);
+	if (ret) {
+		goto exit;
+	}
+
+	via_bo_unpin(bo);
+	ttm_bo_unreserve(ttm_bo);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct drm_plane_helper_funcs
+via_primary_drm_plane_helper_funcs =3D {
+	.prepare_fb =3D via_primary_prepare_fb,
+	.cleanup_fb =3D via_primary_cleanup_fb,
+	.atomic_check =3D via_primary_atomic_check,
+	.atomic_update =3D via_primary_atomic_update,
+	.atomic_disable =3D via_primary_atomic_disable,
+};
+
+static const struct drm_plane_funcs via_primary_drm_plane_funcs =3D {
+	.update_plane	=3D drm_atomic_helper_update_plane,
+	.disable_plane =3D drm_atomic_helper_disable_plane,
+	.destroy =3D drm_plane_cleanup,
+	.reset =3D drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_plane_destroy_state,
+};
+
+static void via_crtc_param_init(struct via_drm_priv *dev_priv,
+					struct drm_crtc *crtc,
+					uint32_t index)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_crtc *iga =3D container_of(crtc,
+						struct via_crtc, base);
+
+	if (iga->index) {
+		iga->timings.htotal.count =3D ARRAY_SIZE(iga2_hor_total);
+		iga->timings.htotal.regs =3D iga2_hor_total;
+
+		iga->timings.hdisplay.count =3D ARRAY_SIZE(iga2_hor_addr);
+		iga->timings.hdisplay.regs =3D iga2_hor_addr;
+		if (pdev->device !=3D PCI_DEVICE_ID_VIA_CHROME9_HD)
+			iga->timings.hdisplay.count--;
+
+		iga->timings.hblank_start.count =3D ARRAY_SIZE(iga2_hor_blank_start);
+		iga->timings.hblank_start.regs =3D iga2_hor_blank_start;
+		if (pdev->device !=3D PCI_DEVICE_ID_VIA_CHROME9_HD)
+			iga->timings.hblank_start.count--;
+
+		iga->timings.hblank_end.count =3D ARRAY_SIZE(iga2_hor_blank_end);
+		iga->timings.hblank_end.regs =3D iga2_hor_blank_end;
+
+		iga->timings.hsync_start.count =3D ARRAY_SIZE(iga2_hor_sync_start);
+		iga->timings.hsync_start.regs =3D iga2_hor_sync_start;
+		if (pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX
+			|| pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)
+			iga->timings.hsync_start.count--;
+
+		iga->timings.hsync_end.count =3D ARRAY_SIZE(iga2_hor_sync_end);
+		iga->timings.hsync_end.regs =3D iga2_hor_sync_end;
+
+		iga->timings.vtotal.count =3D ARRAY_SIZE(iga2_ver_total);
+		iga->timings.vtotal.regs =3D iga2_ver_total;
+
+		iga->timings.vdisplay.count =3D ARRAY_SIZE(iga2_ver_addr);
+		iga->timings.vdisplay.regs =3D iga2_ver_addr;
+
+		iga->timings.vblank_start.count =3D ARRAY_SIZE(iga2_ver_blank_start);
+		iga->timings.vblank_start.regs =3D iga2_ver_blank_start;
+
+		iga->timings.vblank_end.count =3D ARRAY_SIZE(iga2_ver_blank_end);
+		iga->timings.vblank_end.regs =3D iga2_ver_blank_end;
+
+		iga->timings.vsync_start.count =3D ARRAY_SIZE(iga2_ver_sync_start);
+		iga->timings.vsync_start.regs =3D iga2_ver_sync_start;
+
+		iga->timings.vsync_end.count =3D ARRAY_SIZE(iga2_ver_sync_end);
+		iga->timings.vsync_end.regs =3D iga2_ver_sync_end;
+
+		/* Secondary FIFO setup */
+		if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+			(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+			iga->fifo_depth.count =3D
+				ARRAY_SIZE(iga2_cle266_fifo_depth_select);
+			iga->fifo_depth.regs =3D iga2_cle266_fifo_depth_select;
+
+			iga->threshold.count =3D
+				ARRAY_SIZE(iga2_cle266_fifo_threshold_select);
+			iga->threshold.regs =3D iga2_cle266_fifo_threshold_select;
+		} else {
+			iga->fifo_depth.count =3D ARRAY_SIZE(iga2_k8m800_fifo_depth_select);
+			iga->fifo_depth.regs =3D iga2_k8m800_fifo_depth_select;
+
+			iga->threshold.count =3D ARRAY_SIZE(iga2_k8m800_fifo_threshold_select)=
;
+			iga->threshold.regs =3D iga2_k8m800_fifo_threshold_select;
+
+			iga->high_threshold.count =3D ARRAY_SIZE(iga2_fifo_high_threshold_sele=
ct);
+			iga->high_threshold.regs =3D iga2_fifo_high_threshold_select;
+
+			iga->display_queue.count =3D ARRAY_SIZE(iga2_display_queue_expire_num)=
;
+			iga->display_queue.regs =3D iga2_display_queue_expire_num;
+		}
+
+		iga->fetch.count =3D ARRAY_SIZE(iga2_fetch_count);
+		iga->fetch.regs =3D iga2_fetch_count;
+
+		/* Older hardware only uses 12 bits */
+		iga->offset.count =3D ARRAY_SIZE(iga2_offset) - 1;
+		iga->offset.regs =3D iga2_offset;
+	} else {
+		iga->timings.htotal.count =3D ARRAY_SIZE(iga1_hor_total);
+		iga->timings.htotal.regs =3D iga1_hor_total;
+
+		iga->timings.hdisplay.count =3D ARRAY_SIZE(iga1_hor_addr);
+		iga->timings.hdisplay.regs =3D iga1_hor_addr;
+		if (pdev->device !=3D PCI_DEVICE_ID_VIA_CHROME9_HD)
+			iga->timings.hdisplay.count--;
+
+		iga->timings.hblank_start.count =3D ARRAY_SIZE(iga1_hor_blank_start);
+		iga->timings.hblank_start.regs =3D iga1_hor_blank_start;
+		if (pdev->device !=3D PCI_DEVICE_ID_VIA_CHROME9_HD)
+			iga->timings.hblank_start.count--;
+
+		iga->timings.hblank_end.count =3D ARRAY_SIZE(iga1_hor_blank_end);
+		iga->timings.hblank_end.regs =3D iga1_hor_blank_end;
+
+		iga->timings.hsync_start.count =3D ARRAY_SIZE(iga1_hor_sync_start);
+		iga->timings.hsync_start.regs =3D iga1_hor_sync_start;
+
+		iga->timings.hsync_end.count =3D ARRAY_SIZE(iga1_hor_sync_end);
+		iga->timings.hsync_end.regs =3D iga1_hor_sync_end;
+
+		iga->timings.vtotal.count =3D ARRAY_SIZE(iga1_ver_total);
+		iga->timings.vtotal.regs =3D iga1_ver_total;
+
+		iga->timings.vdisplay.count =3D ARRAY_SIZE(iga1_ver_addr);
+		iga->timings.vdisplay.regs =3D iga1_ver_addr;
+
+		iga->timings.vblank_start.count =3D ARRAY_SIZE(iga1_ver_blank_start);
+		iga->timings.vblank_start.regs =3D iga1_ver_blank_start;
+
+		iga->timings.vblank_end.count =3D ARRAY_SIZE(iga1_ver_blank_end);
+		iga->timings.vblank_end.regs =3D iga1_ver_blank_end;
+
+		iga->timings.vsync_start.count =3D ARRAY_SIZE(iga1_ver_sync_start);
+		iga->timings.vsync_start.regs =3D iga1_ver_sync_start;
+
+		iga->timings.vsync_end.count =3D ARRAY_SIZE(iga1_ver_sync_end);
+		iga->timings.vsync_end.regs =3D iga1_ver_sync_end;
+
+		/* Primary FIFO setup */
+		if ((pdev->device =3D=3D PCI_DEVICE_ID_VIA_CLE266_GFX) ||
+			(pdev->device =3D=3D PCI_DEVICE_ID_VIA_KM400_GFX)) {
+			iga->fifo_depth.count =3D ARRAY_SIZE(iga1_cle266_fifo_depth_select);
+			iga->fifo_depth.regs =3D iga1_cle266_fifo_depth_select;
+
+			iga->threshold.count =3D ARRAY_SIZE(iga1_cle266_fifo_threshold_select)=
;
+			iga->threshold.regs =3D iga1_cle266_fifo_threshold_select;
+
+			iga->high_threshold.count =3D ARRAY_SIZE(iga1_cle266_fifo_high_thresho=
ld_select);
+			iga->high_threshold.regs =3D iga1_cle266_fifo_high_threshold_select;
+
+			iga->display_queue.count =3D ARRAY_SIZE(iga1_cle266_display_queue_expi=
re_num);
+			iga->display_queue.regs =3D iga1_cle266_display_queue_expire_num;
+		} else {
+			iga->fifo_depth.count =3D ARRAY_SIZE(iga1_k8m800_fifo_depth_select);
+			iga->fifo_depth.regs =3D iga1_k8m800_fifo_depth_select;
+
+			iga->threshold.count =3D ARRAY_SIZE(iga1_k8m800_fifo_threshold_select)=
;
+			iga->threshold.regs =3D iga1_k8m800_fifo_threshold_select;
+
+			iga->high_threshold.count =3D ARRAY_SIZE(iga1_k8m800_fifo_high_thresho=
ld_select);
+			iga->high_threshold.regs =3D iga1_k8m800_fifo_high_threshold_select;
+
+			iga->display_queue.count =3D ARRAY_SIZE(iga1_k8m800_display_queue_expi=
re_num);
+			iga->display_queue.regs =3D iga1_k8m800_display_queue_expire_num;
+		}
+
+		iga->fetch.count =3D ARRAY_SIZE(iga1_fetch_count);
+		iga->fetch.regs =3D iga1_fetch_count;
+
+		iga->offset.count =3D ARRAY_SIZE(iga1_offset);
+		iga->offset.regs =3D iga1_offset;
+	}
+}
+
+static int via_gamma_init(struct drm_crtc *crtc)
+{
+	u16 *gamma;
+	uint32_t i;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	ret =3D drm_mode_crtc_set_gamma_size(crtc, 256);
+	if (ret) {
+		DRM_ERROR("Failed to set gamma size!\n");
+		goto exit;
+	}
+
+	gamma =3D crtc->gamma_store;
+	for (i =3D 0; i < 256; i++) {
+		gamma[i] =3D i << 8 | i;
+		gamma[i + 256] =3D i << 8 | i;
+		gamma[i + 512] =3D i << 8 | i;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const uint32_t via_primary_formats[] =3D {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB332,
+};
+
+int via_crtc_init(struct via_drm_priv *dev_priv, uint32_t index)
+{
+	struct drm_device *dev =3D &dev_priv->dev;
+	struct via_crtc *iga;
+	struct drm_plane *primary;
+	struct drm_plane *cursor;
+	uint32_t possible_crtcs;
+	int ret;
+
+	possible_crtcs =3D 1 << index;
+
+	primary =3D kzalloc(sizeof(struct drm_plane), GFP_KERNEL);
+	if (!primary) {
+		ret =3D -ENOMEM;
+		DRM_ERROR("Failed to allocate a primary plane.\n");
+		goto exit;
+	}
+
+	drm_plane_helper_add(primary,
+			&via_primary_drm_plane_helper_funcs);
+	ret =3D drm_universal_plane_init(dev, primary, possible_crtcs,
+			&via_primary_drm_plane_funcs,
+			via_primary_formats,
+			ARRAY_SIZE(via_primary_formats),
+			NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to initialize a primary "
+				"plane.\n");
+		goto free_primary;
+	}
+
+	cursor =3D kzalloc(sizeof(struct drm_plane), GFP_KERNEL);
+	if (!cursor) {
+		ret =3D -ENOMEM;
+		DRM_ERROR("Failed to allocate a cursor plane.\n");
+		goto cleanup_primary;
+	}
+
+	drm_plane_helper_add(cursor,
+			&via_cursor_drm_plane_helper_funcs);
+	ret =3D drm_universal_plane_init(dev, cursor, possible_crtcs,
+			&via_cursor_drm_plane_funcs,
+			via_cursor_formats,
+			via_cursor_formats_size,
+			NULL, DRM_PLANE_TYPE_CURSOR, NULL);
+	if (ret) {
+		DRM_ERROR("Failed to initialize a cursor "
+				"plane.\n");
+		goto free_cursor;
+	}
+
+	iga =3D kzalloc(sizeof(struct via_crtc), GFP_KERNEL);
+	if (!iga) {
+		ret =3D -ENOMEM;
+		DRM_ERROR("Failed to allocate CRTC storage.\n");
+		goto cleanup_cursor;
+	}
+
+	drm_crtc_helper_add(&iga->base,
+			&via_drm_crtc_helper_funcs);
+	ret =3D drm_crtc_init_with_planes(dev, &iga->base,
+					primary, cursor,
+					&via_drm_crtc_funcs,
+					NULL);
+	if (ret) {
+		DRM_ERROR("Failed to initialize CRTC!\n");
+		goto free_crtc;
+	}
+
+	iga->index =3D index;
+
+	via_crtc_param_init(dev_priv, &iga->base, index);
+	ret =3D via_gamma_init(&iga->base);
+	if (ret) {
+		goto free_crtc;
+	}
+
+	goto exit;
+free_crtc:
+	kfree(iga);
+cleanup_cursor:
+	drm_plane_cleanup(cursor);
+free_cursor:
+	kfree(cursor);
+cleanup_primary:
+	drm_plane_cleanup(primary);
+free_primary:
+	kfree(primary);
+exit:
+	return ret;
+}
=2D-
2.35.1

