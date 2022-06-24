Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D175955A2B4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DAE710F384;
	Fri, 24 Jun 2022 20:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE3810F2DA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102801;
 bh=/PKuxOLUivd9UedEUozeSYrm0MMbJOx5fr4u80ZBvWs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=TeAQjLbH9U/ahOSCXHmf94vPz7njJCl6nr8qdgF61QX4ZYBGWHrO2o+1g6vzeVjkc
 Lfgb2xE3pROujGbqDWBNtfvuZ+KqLdcVsxIfPrLGfwGSIxysQi3zfRDgXQD/Y+O4WH
 bVkir6Ca+Ctg+ysl6PsVaeLKnWcUo1bsgb5AfvnI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N2V4P-1nfUR71IqN-013z6L; Fri, 24 Jun 2022 22:28:18 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/28] drm/via: Add via_hdmi.c
Date: Fri, 24 Jun 2022 15:26:18 -0500
Message-Id: <20220624202633.3978-14-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Mb6QcZ0oC/uXxRS9nfSQhBnfbR1AFLuyKhVjN4CijkotpdJ/Cci
 V5ORQPvxlnq5LPNVoc8snsq8AggcagJzYVFY7zvqnTs+IgaQsaUnbdtSxUQYhDl5dYyY2kI
 may/y3MxRizJO9l3svfNx6VLjfNgS7Rb8pZsCoVgyI1nUZtut66HQaKQ6sbc12y/wOTkQJ2
 /8yhVTTH+eVSNu8jQjMCg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3yg4n8iGCEo=:FxP23qFLac3stKDGoxT8W4
 h55G0OoYoUoZ29tbjjxA3sim4UtVHJJAIibyWzoCS9gmH2GRWaOPFY3T+SAp1W0bTahwf5L05
 nKdALb5uKazWP6P7U+UNiNpqYBFnVGe0U63wXYgiDboRDWhpX8a72QOSgS2zXJdN0zZUDIHXZ
 itkcz8BSP6Yw/VAAN/ScihRKNyG20VHQnLXl3AtB+L6WaPGMosWMg2pWQ0A7qhwCBXJlj3Fgf
 EeSOlCPIvQc9DST4bRZSgQTSJGtc3JP8Ue/CxSb19o+9GtVesIIFL+kayp8pNr2WRJorgEOgM
 vvTsytJMyPmXEAdjglrgn/aTr8s3IMxY9fFr7yI7bVIZ6gBEvqsw0IOp5KiJ71/MA0HF9U/O3
 3eSTKd/002J4dYavhnwfVQAtcDtQEaclS3VmJ1W6sA6OuUM4CzWMgtYDR95/Rwthpc47Nxj1C
 YFzFNadRMbdZwvWphKhjmmBN2kQzL8KGzmQdgW5JVxHRXsQ5MMUFbdprENBaUpMaB9a/dHsCt
 Q8kUv+yLRBLuZG/QuzW2y/EdcPDYkFzAxc2kWuJTmay3KivMq4tkM+9E2LcOiILat0BR9t/2A
 hfwnFYFxxLxNwcV/PX0KeNV3jU8SRox7+QqzljpAX8HkVT+ATVIcuWA2sfIUsLGxBNgJDhUhk
 hNor96jVx2pTHnGeSYnp9/4+OFzHo4kKSUR+/SBVwvnVQlSqbjkRVll9PWIKdgoJ5lWIRjm4P
 m2GLasViQNdC+RvOoxS8wCtoxmcJd13uHP3Dqd1C4ebNcZ6xKgi+b1QvZLuHeEobNAOOS6uVb
 EIi0ry64bYjWJTev1ND5LCU82F/imsq2TAui8O98k7JFYjuPakjiPkpwPtOJ2FC3n/1apbg2c
 idaRIJgQuQe+4xo59m7IP/EgFXLWLDJwhKnY4OgyZEzAQxZuWfgCHkPo7VQx4mBla0syov8Rk
 Frq/Rw62AsRq+FtWoMv3tIldcnQx4eDIxs72yxbsbEdKvU/ACrFbbcAyJOZmtWN2Fjp974Rmr
 WfzDyM2T1SLKbT9fVOVquH8dAanW/73NjhnRQ4Ma/5eCr1CEzGYCJD6d8AJjn8w6tJKbgjevY
 Vk++cC8UHCN2Uwgu7PJgzL1urMpfU2NFBliSZT5hcDpQrNsIrEB2Z2XBQ==
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
 drivers/gpu/drm/via/via_hdmi.c | 719 +++++++++++++++++++++++++++++++++
 1 file changed, 719 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_hdmi.c

diff --git a/drivers/gpu/drm/via/via_hdmi.c b/drivers/gpu/drm/via/via_hdmi=
.c
new file mode 100644
index 000000000000..9412054a24df
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_hdmi.c
@@ -0,0 +1,719 @@
+/*
+ * Copyright 2013 James Simmons. All Rights Reserved.
+ * Copyright 1998-2012 VIA Technologies, Inc. All Rights Reserved.
+ * Copyright 2001-2012 S3 Graphics, Inc. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the n=
ext
+ * paragraph) shall be included in all copies or substantial portions of =
the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/delay.h>
+#include <linux/pci.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+
+#define HDMI_AUDIO_ENABLED	BIT(0)
+
+int via_hdmi_audio =3D 0;
+
+MODULE_PARM_DESC(audio, "HDMI Audio enable (1 =3D enable)");
+module_param_named(audio, via_hdmi_audio, int, 0444);
+
+/*
+ * Routines for controlling stuff on the HDMI port
+ */
+static const struct drm_encoder_funcs via_hdmi_enc_funcs =3D {
+	.destroy =3D via_encoder_cleanup,
+};
+
+static void via_hdmi_enc_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	switch (mode) {
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_OFF:
+		/* disable HDMI */
+		VIA_WRITE_MASK(0xC280, 0x0, 0x2);
+		break;
+
+	case DRM_MODE_DPMS_ON:
+	default:
+		/* enable band gap */
+		VIA_WRITE_MASK(0xC740, BIT(0), BIT(0));
+		/* enable video */
+		VIA_WRITE_MASK(0xC640, BIT(3), BIT(3));
+		/* enable HDMI */
+		VIA_WRITE_MASK(0xC280, BIT(1), BIT(1));
+		break;
+	}
+}
+
+static bool via_hdmi_enc_mode_fixup(struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	uint32_t panelHSyncTime =3D 0, panelHBlankStart =3D 0, newHBlankStart =
=3D 0;
+	uint32_t panelVSyncTime =3D 0, panelVBlankStart =3D 0, newVBlankStart =
=3D 0;
+	uint32_t left_border =3D 0, right_border =3D 0;
+	uint32_t top_border =3D 0, bottom_border =3D 0;
+
+	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
+		/* when interlace mode, we should consider halve vertical
+		 * timings. */
+		panelHSyncTime =3D adjusted_mode->hsync_end -
+					adjusted_mode->hsync_start;
+		panelVSyncTime =3D adjusted_mode->vsync_end / 2 -
+					adjusted_mode->vsync_start / 2;
+		panelHBlankStart =3D adjusted_mode->hdisplay;
+		panelVBlankStart =3D adjusted_mode->vdisplay / 2;
+		newHBlankStart =3D adjusted_mode->hdisplay - left_border;
+		newVBlankStart =3D adjusted_mode->vdisplay / 2 - top_border;
+
+		adjusted_mode->hdisplay =3D
+			adjusted_mode->hdisplay - left_border - right_border;
+		adjusted_mode->hsync_start =3D
+			(adjusted_mode->hsync_start - panelHBlankStart) +
+				newHBlankStart;
+		adjusted_mode->hsync_end =3D
+			adjusted_mode->hsync_start + panelHSyncTime;
+
+		adjusted_mode->vdisplay =3D adjusted_mode->vdisplay / 2 -
+						top_border - bottom_border;
+		adjusted_mode->vsync_start =3D
+				(adjusted_mode->vsync_start / 2 - panelVBlankStart) +
+				newVBlankStart;
+		adjusted_mode->vsync_end =3D
+				adjusted_mode->vsync_start + panelVSyncTime;
+	} else {
+		panelHSyncTime =3D
+			adjusted_mode->hsync_end - adjusted_mode->hsync_start;
+		panelVSyncTime =3D
+			adjusted_mode->vsync_end - adjusted_mode->vsync_start;
+		panelHBlankStart =3D adjusted_mode->hdisplay;
+		panelVBlankStart =3D adjusted_mode->vdisplay;
+		newHBlankStart =3D adjusted_mode->hdisplay - left_border;
+		newVBlankStart =3D adjusted_mode->vdisplay - top_border;
+
+		adjusted_mode->hdisplay =3D
+			adjusted_mode->hdisplay - left_border - right_border;
+		adjusted_mode->hsync_start =3D
+			(adjusted_mode->hsync_start - panelHBlankStart) +
+			newHBlankStart;
+		adjusted_mode->hsync_end =3D
+			adjusted_mode->hsync_start + panelHSyncTime;
+
+		adjusted_mode->vdisplay =3D
+			adjusted_mode->vdisplay - top_border - bottom_border;
+		adjusted_mode->vsync_start =3D
+			(adjusted_mode->vsync_start - panelVBlankStart) +
+			newVBlankStart;
+		adjusted_mode->vsync_end =3D
+			adjusted_mode->vsync_start + panelVSyncTime;
+	}
+
+	/* Adjust crtc H and V */
+	adjusted_mode->crtc_hdisplay =3D adjusted_mode->hdisplay;
+	adjusted_mode->crtc_hblank_start =3D newHBlankStart;
+	adjusted_mode->crtc_hblank_end =3D
+	adjusted_mode->crtc_htotal - left_border;
+	adjusted_mode->crtc_hsync_start =3D adjusted_mode->hsync_start;
+	adjusted_mode->crtc_hsync_end =3D adjusted_mode->hsync_end;
+
+	adjusted_mode->crtc_vdisplay =3D adjusted_mode->vdisplay;
+	adjusted_mode->crtc_vblank_start =3D newVBlankStart;
+	adjusted_mode->crtc_vblank_end =3D
+	adjusted_mode->crtc_vtotal - top_border;
+	adjusted_mode->crtc_vsync_start =3D adjusted_mode->vsync_start;
+	adjusted_mode->crtc_vsync_end =3D adjusted_mode->vsync_end;
+
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+	return true;
+}
+
+static void via_hdmi_native_mode_set(struct via_crtc *iga,
+					struct drm_display_mode *mode,
+					bool audio_off)
+{
+	struct drm_device *dev =3D iga->base.dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u32 reg_c280, reg_c284;
+	int max_packet, delay;
+	u8 value =3D BIT(0);
+
+	/* 135MHz ~ 270MHz */
+	if (mode->clock >=3D 135000)
+		VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x00000000, 0xC0000000);
+	/* 67.5MHz ~ <135MHz */
+	else if (mode->clock >=3D 67500)
+		VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x40000000, 0xC0000000);
+	/* 33.75MHz ~ <67.5MHz */
+	else if (mode->clock >=3D 33750)
+		VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x80000000, 0xC0000000);
+	/* 25MHz ~ <33.75MHz */
+	else
+		VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0xC0000000, 0xC0000000);
+
+	/* touch C282 when init HDMI by mode 720x576, 720x480,
+	 * or other modes */
+	if ((mode->hdisplay =3D=3D 720) && (mode->vdisplay =3D=3D 576))
+		VIA_WRITE(0xC280, 0x18232402);
+	else if ((mode->hdisplay =3D=3D 720) && (mode->vdisplay =3D=3D 480))
+		VIA_WRITE(0xC280, 0x181f2402);
+	else
+		VIA_WRITE(0xC280, 0x18330002);
+
+	/* init C280 */
+	reg_c280 =3D 0x18000002 | (VIA_READ(0xC280) & 0x40);
+	/* sync polarity */
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		reg_c280 |=3D BIT(10);
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		reg_c280 |=3D BIT(13);
+
+	/* calculate correct delay of regC280[22:16] */
+	if ((mode->crtc_hsync_start - mode->crtc_hdisplay) > (58 - 11))
+		delay =3D 0;
+	else
+		delay =3D 58 - (mode->crtc_hsync_start - mode->crtc_hdisplay) - 11;
+
+	/* calculate max_packet */
+	max_packet =3D (mode->crtc_hblank_end - mode->crtc_hsync_start - 16 - 11=
 - delay) / 32;
+	if (0 =3D=3D delay)
+		delay =3D mode->crtc_hblank_end - mode->crtc_hsync_start - (32 * max_pa=
cket + 16 + 11);
+
+	reg_c280 |=3D (delay << 16);
+	VIA_WRITE(0xC280, reg_c280);
+	reg_c284 =3D 0x00000102 | (max_packet << 28);
+
+	/* power down to reset */
+	VIA_WRITE_MASK(0xC740, 0x00000000, 0x06000000);
+	/* enable DP data pass */
+	VIA_WRITE_MASK(DP_DATA_PASS_ENABLE_REG, 0x00000001, 0x00000001);
+	/* select HDMI mode */
+	VIA_WRITE_MASK(0xC748, 0, BIT(0));
+	/* enable HDMI with HDMI mode */
+	VIA_WRITE_MASK(0xC280, 0x00, 0x40);
+	/* select AC mode */
+	VIA_WRITE_MASK(0xC74C, 0x40, 0x40);
+	/* enable InfoFrame */
+	VIA_WRITE(0xC284, reg_c284);
+	/* set status of Lane0~3 */
+	VIA_WRITE_MASK(0xC744, 0x00FFFF82, 0x00FFFF82);
+	VIA_WRITE(0xC0B4, 0x92000000);
+	/* enable audio packet */
+	if (!audio_off)
+		VIA_WRITE_MASK(0xC294, 0x10000000, 0x10000000);
+	/* enable InfoFrame */
+	VIA_WRITE(0xC284, reg_c284);
+	VIA_WRITE_MASK(0xC740, 0x1E4CBE7F, 0x3FFFFFFF);
+	VIA_WRITE_MASK(0xC748, 0x84509180, 0x001FFFFF);
+	/* Select PHY Function as HDMI */
+	/* Select HDTV0 source */
+	if (iga->index)
+		value |=3D BIT(1);
+	svga_wcrt_mask(VGABASE, 0xFF, value, BIT(1) | BIT(0));
+}
+
+static void via_hdmi_enc_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct via_encoder *enc =3D container_of(encoder, struct via_encoder, ba=
se);
+	struct via_crtc *iga =3D container_of(encoder->crtc, struct via_crtc, ba=
se);
+	struct drm_connector *connector =3D NULL, *con;
+	struct drm_device *dev =3D encoder->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	list_for_each_entry(con, &dev->mode_config.connector_list, head) {
+		if (encoder =3D=3D con->encoder) {
+			connector =3D con;
+			break;
+		}
+	}
+
+	if (!connector) {
+		DRM_INFO("HDMI encoder is not used by any connector\n");
+		return;
+	}
+
+	if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_HDMIA) {
+		struct via_connector *con =3D container_of(connector, struct via_connec=
tor, base);
+		bool audio_off =3D (con->flags & HDMI_AUDIO_ENABLED);
+
+		if (enc->di_port =3D=3D VIA_DI_PORT_NONE)
+			via_hdmi_native_mode_set(iga, adjusted_mode, audio_off);
+
+		if (!iga->index)
+			via_load_crtc_pixel_timing(encoder->crtc, adjusted_mode);
+
+		/* Set Hsync Offset, delay one clock (To meet 861-D spec.) */
+		svga_wcrt_mask(VGABASE, 0x8A, 0x01, 0x7);
+
+		/* If CR8A +1, HSyc must -1 */
+		vga_wcrt(VGABASE, 0x56, vga_rcrt(VGABASE, 0x56) - 1);
+		vga_wcrt(VGABASE, 0x57, vga_rcrt(VGABASE, 0x57) - 1);
+
+		if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
+			if (iga->index) {
+				/* FIXME VIA where do you get this value from ??? */
+				u32 v_sync_adjust =3D 0;
+
+				switch (pdev->device) {
+				case PCI_DEVICE_ID_VIA_VX875:
+					svga_wcrt_mask(VGABASE, 0xFB,
+							v_sync_adjust & 0xFF, 0xFF);
+					svga_wcrt_mask(VGABASE, 0xFC,
+							(v_sync_adjust & 0x700) >> 8, 0x07);
+					break;
+
+				case PCI_DEVICE_ID_VIA_VX900_VGA:
+					svga_wcrt_mask(VGABASE, 0xAB, v_sync_adjust & 0xFF, 0xFF);
+					svga_wcrt_mask(VGABASE, 0xAC, (v_sync_adjust & 0x700) >> 8, 0x07);
+					break;
+
+				default:
+					svga_wcrt_mask(VGABASE, 0xFB, v_sync_adjust & 0xFF, 0xFF);
+					svga_wcrt_mask(VGABASE, 0xFC, (v_sync_adjust & 0x700) >> 8, 0x07);
+					break;
+				}
+			}
+		} else { /* non-interlace, clear interlace setting. */
+			if (iga->index) {
+				vga_wcrt(VGABASE, 0xFB, 0);
+				svga_wcrt_mask(VGABASE, 0xFC, 0, 0x07);
+			}
+		}
+	} else if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_DVID) {
+		/* 135MHz ~ 270MHz */
+		if (mode->clock >=3D 135000)
+			VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x00000000, 0xC0000000);
+		/* 67.5MHz ~ < 135MHz */
+		else if (mode->clock >=3D 67500)
+			VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x40000000, 0xC0000000);
+		/* 33.75MHz ~ < 67.5MHz */
+		else if (mode->clock >=3D 33750)
+			VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x80000000, 0xC0000000);
+		/* 25MHz ~ < 33.75MHz */
+		else
+			VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0xC0000000, 0xC0000000);
+
+		/* Power down TPLL to reset */
+		VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x00000000, 0x06000000);
+		/* Enable DP data pass */
+		VIA_WRITE_MASK(DP_DATA_PASS_ENABLE_REG, 0x00000001, 0x00000001);
+		/* Select EPHY as HDMI mode */
+		VIA_WRITE_MASK(DP_EPHY_MISC_PWR_REG, 0, BIT(0));
+		/* Enable HDMI with DVI mode */
+		VIA_WRITE_MASK(0xC280, 0x40, 0x40);
+		/* select AC mode */
+		VIA_WRITE_MASK(0xC74C, 0x40, 0x40);
+		/* Set status of Lane0~3 */
+		VIA_WRITE_MASK(0xC744, 0x00FFFF00, 0x00FFFF00);
+		/* Disable InfoFrame */
+		VIA_WRITE_MASK(0xC284, 0x00000000, 0x00000002);
+		/* EPHY Control Register */
+		VIA_WRITE_MASK(DP_EPHY_PLL_REG, 0x1EC46E6F, 0x3FFFFFFF);
+		/* Select PHY Function as HDMI */
+		svga_wcrt_mask(VGABASE, 0xFF, BIT(0), BIT(0));
+		/* Select HDTV0 source */
+		if (!iga->index)
+			svga_wcrt_mask(VGABASE, 0xFF, 0, BIT(1));
+		else
+			svga_wcrt_mask(VGABASE, 0xFF, BIT(1), BIT(1));
+
+		/* in 640x480 case, MPLL is different */
+		/* For VT3410 internal transmitter 640x480 issue */
+		if (mode->hdisplay =3D=3D 640 && mode->vdisplay =3D=3D 480) {
+			VIA_WRITE(DP_EPHY_PLL_REG, 0xD8C29E6F);
+			VIA_WRITE(DP_EPHY_PLL_REG, 0xDEC29E6F);
+		}
+	}
+
+	/* Patch for clock skew */
+	if (enc->di_port =3D=3D VIA_DI_PORT_DVP1) {
+		switch (pdev->device) {
+		case PCI_DEVICE_ID_VIA_VT3157:	/* CX700 */
+			svga_wcrt_mask(VGABASE, 0x65, 0x0B, 0x0F);
+			svga_wcrt_mask(VGABASE, 0x9B, 0x00, 0x0F);
+			break;
+
+		case PCI_DEVICE_ID_VIA_VT1122:	/* VX800 */
+		case PCI_DEVICE_ID_VIA_VX875:	/* VX855 */
+			svga_wcrt_mask(VGABASE, 0x65, 0x0B, 0x0F);
+			svga_wcrt_mask(VGABASE, 0x9B, 0x0F, 0x0F);
+			break;
+
+		case PCI_DEVICE_ID_VIA_VX900_VGA:	/* VX900 */
+			svga_wcrt_mask(VGABASE, 0x65, 0x09, 0x0F);
+			svga_wcrt_mask(VGABASE, 0x9B, 0x09, 0x0F);
+			break;
+
+		default:
+			break;
+		}
+	}
+}
+
+static const struct drm_encoder_helper_funcs via_hdmi_enc_helper_funcs =
=3D {
+	.dpms =3D via_hdmi_enc_dpms,
+	.mode_fixup =3D via_hdmi_enc_mode_fixup,
+	.mode_set =3D via_hdmi_enc_mode_set,
+};
+
+static unsigned int via_check_hdmi_i2c_status(struct via_drm_priv *dev_pr=
iv,
+						unsigned int check_bits,
+						unsigned int condition)
+{
+	unsigned int status =3D true, max =3D 50, loop =3D 0;
+
+	if (condition) {
+		while ((VIA_READ(0xC0B8) & check_bits) && loop < max) {
+			/* delay 20 us */
+			udelay(20);
+
+			if (++loop =3D=3D max)
+				status =3D false;
+		}
+	} else {
+		while (!(VIA_READ(0xC0B8) & check_bits) && loop < max) {
+			/* delay 20 us */
+			udelay(20);
+
+			if (++loop =3D=3D max)
+				status =3D false;
+		}
+	}
+	return status;
+}
+
+unsigned int via_ddc_read_bytes_by_hdmi(struct via_drm_priv *dev_priv,
+					unsigned int offset,
+					unsigned char *block)
+{
+	unsigned int status =3D true, temp =3D 0, i;
+
+	/* Enable DDC */
+	VIA_WRITE_MASK(0xC000, 0x00000001, 0x00000001);
+	VIA_WRITE(0xC0C4, (VIA_READ(0xC0C4) & 0xFC7FFFFF) | 0x00800000);
+	VIA_WRITE(0xC0B8, 0x00000001);
+
+	/* START */
+	VIA_WRITE(0xC0B8, 0x0011);
+	VIA_WRITE(0xC0B8, 0x0019);
+	if (status)
+		status =3D via_check_hdmi_i2c_status(dev_priv, 0x0018, true);
+
+	/* Slave Address */
+	temp =3D 0xA0;
+	temp <<=3D 16;
+	temp |=3D VIA_READ(0xC0B4) & 0xFF00FFFF;
+	VIA_WRITE(0xC0B4, temp);
+	VIA_WRITE(0xC0B8, 0x0009);
+	if (status)
+		status =3D via_check_hdmi_i2c_status(dev_priv, 0x0008, true);
+
+	/* Offset */
+	temp =3D offset;
+	temp <<=3D 16;
+	temp |=3D VIA_READ(0xC0B4) & 0xFF00FFFF;
+	VIA_WRITE(0xC0B4, temp);
+	VIA_WRITE(0xC0B8, 0x0009);
+	if (status)
+		status =3D via_check_hdmi_i2c_status(dev_priv, 0x0008, true);
+
+	/* START */
+	VIA_WRITE(0xC0B8, 0x0011);
+	VIA_WRITE(0xC0B8, 0x0019);
+	if (status)
+		status =3D via_check_hdmi_i2c_status(dev_priv, 0x0018, true);
+
+	/* Slave Address + 1 */
+	temp =3D 0xA1;
+	temp <<=3D 16;
+	temp |=3D VIA_READ(0xC0B4) & 0xFF00FFFF;
+	VIA_WRITE(0xC0B4, temp);
+	VIA_WRITE(0xC0B8, 0x0009);
+	if (status)
+		status =3D via_check_hdmi_i2c_status(dev_priv, 0x0008, true);
+
+	for (i =3D 0; i < EDID_LENGTH; i++) {
+		/* Read Data */
+		VIA_WRITE(0xC0B8, 0x0009);
+		via_check_hdmi_i2c_status(dev_priv, 0x0008, true);
+		via_check_hdmi_i2c_status(dev_priv, 0x0080, false);
+		*block++ =3D (unsigned char) ((VIA_READ(0xC0B4) & 0x0000FF00) >> 8);
+		VIA_WRITE(0xC0B8, (VIA_READ(0xC0B8) & ~0x80));
+	}
+
+	/* STOP */
+	VIA_WRITE(0xC0B8, 0x0021);
+	VIA_WRITE(0xC0B8, 0x0029);
+
+	status =3D via_check_hdmi_i2c_status(dev_priv, 0x0828, true);
+	if (!status) {
+		/* Reset */
+		VIA_WRITE_MASK(0xC0C4, 0x00000080, 0x00000080);
+		VIA_WRITE_MASK(0xC0C4, 0x00000000, 0x00000080);
+	}
+	return status;
+}
+
+struct edid* via_hdmi_get_edid(struct drm_connector *connector)
+{
+	bool print_bad_edid =3D !connector->bad_edid_counter || (drm_debug_enabl=
ed(DRM_UT_KMS));
+	struct drm_device *dev =3D connector->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct edid *edid =3D NULL;
+	int i, j =3D 0;
+	u8 *block;
+
+	/* Clear out old EDID block */
+	drm_connector_update_edid_property(connector, edid);
+
+	block =3D kmalloc(EDID_LENGTH, GFP_KERNEL);
+	if (!block)
+		return edid;
+
+	/* base block fetch */
+	for (i =3D 0; i < 4; i++) {
+		if (!via_ddc_read_bytes_by_hdmi(dev_priv, 0, block))
+			goto out;
+
+		if (drm_edid_block_valid(block, 0, print_bad_edid, NULL))
+			break;
+
+		if (i =3D=3D 0 && !memchr_inv(block, 0, EDID_LENGTH)) {
+			connector->null_edid_counter++;
+			goto carp;
+		}
+	}
+	if (i =3D=3D 4)
+		goto carp;
+
+	/* parse the extensions if present */
+	if (block[0x7e]) {
+		u8 *new =3D krealloc(block, (block[0x7e] + 1) * EDID_LENGTH, GFP_KERNEL=
);
+		int valid_extensions =3D 0, offset =3D 0;
+
+		if (!new)
+			goto out;
+		block =3D new;
+
+		for (j =3D 1; j <=3D block[0x7e]; j++) {
+			for (i =3D 0; i < 4; i++) {
+				offset =3D (valid_extensions + 1) * EDID_LENGTH;
+				new =3D block + offset;
+
+				if (!via_ddc_read_bytes_by_hdmi(dev_priv,
+								 offset, new))
+					goto out;
+
+				if (drm_edid_block_valid(new, j, print_bad_edid, NULL)) {
+					valid_extensions++;
+					break;
+				}
+			}
+
+			if (i =3D=3D 4 && print_bad_edid) {
+				dev_warn(connector->dev->dev,
+					"%s: Ignoring invalid EDID block %d.\n",
+					connector->name, j);
+
+				connector->bad_edid_counter++;
+			}
+		}
+
+		if (valid_extensions !=3D block[0x7e]) {
+			block[EDID_LENGTH - 1] +=3D block[0x7e] - valid_extensions;
+			block[0x7e] =3D valid_extensions;
+
+			new =3D krealloc(block, (valid_extensions + 1) * EDID_LENGTH, GFP_KERN=
EL);
+			if (!new)
+				goto out;
+			block =3D new;
+		}
+	}
+	edid =3D (struct edid *) block;
+	drm_connector_update_edid_property(connector, edid);
+	return edid;
+
+carp:
+	if (print_bad_edid) {
+		dev_warn(connector->dev->dev, "%s: EDID block %d invalid.\n",
+			 connector->name, j);
+	}
+	connector->bad_edid_counter++;
+out:
+	kfree(block);
+	return edid;
+}
+
+static enum drm_connector_status
+via_hdmi_detect(struct drm_connector *connector, bool force)
+{
+	struct drm_device *dev =3D connector->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	enum drm_connector_status ret =3D connector_status_disconnected;
+	u32 mm_c730 =3D VIA_READ(0xc730) & 0xC0000000;
+	struct edid *edid =3D NULL;
+
+	if (VIA_IRQ_DP_HOT_UNPLUG =3D=3D mm_c730) {
+		drm_connector_update_edid_property(connector, NULL);
+		return ret;
+	}
+
+	edid =3D via_hdmi_get_edid(connector);
+	if (edid) {
+		if ((connector->connector_type !=3D DRM_MODE_CONNECTOR_HDMIA) ^
+			(drm_detect_hdmi_monitor(edid)))
+			ret =3D connector_status_connected;
+	}
+	return ret;
+}
+
+static int via_hdmi_set_property(struct drm_connector *connector,
+					struct drm_property *property,
+					uint64_t value)
+{
+	struct drm_device *dev =3D connector->dev;
+
+	if (property =3D=3D dev->mode_config.dpms_property && connector->encoder=
)
+		via_hdmi_enc_dpms(connector->encoder, (uint32_t)(value & 0xf));
+	return 0;
+}
+
+static const struct drm_connector_funcs via_hdmi_connector_funcs =3D {
+	.dpms =3D drm_helper_connector_dpms,
+	.detect =3D via_hdmi_detect,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.set_property =3D via_hdmi_set_property,
+	.destroy =3D via_connector_destroy,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_connector_destroy_state,
+};
+
+static int via_hdmi_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	return MODE_OK;
+}
+
+int via_hdmi_get_modes(struct drm_connector *connector)
+{
+	struct edid *edid =3D via_hdmi_get_edid(connector);
+
+	if (edid) {
+		struct via_connector *con;
+
+		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+			con =3D container_of(connector, struct via_connector, base);
+
+			if (via_hdmi_audio)
+				con->flags |=3D drm_detect_monitor_audio(edid);
+		}
+	}
+	return drm_add_edid_modes(connector, edid);
+}
+
+static const struct drm_connector_helper_funcs via_hdmi_connector_helper_=
funcs =3D {
+	.mode_valid =3D via_hdmi_mode_valid,
+	.get_modes =3D via_hdmi_get_modes,
+};
+
+void via_hdmi_init(struct drm_device *dev, u32 di_port)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_connector *dvi, *hdmi;
+	struct via_encoder *enc;
+
+	enc =3D kzalloc(sizeof(*enc) + 2 * sizeof(*hdmi), GFP_KERNEL);
+	if (!enc) {
+		DRM_ERROR("Failed to allocate connector and encoder\n");
+		return;
+	}
+	hdmi =3D &enc->cons[0];
+	dvi =3D &enc->cons[1];
+
+	/* Setup the encoders and attach them */
+	drm_encoder_init(dev, &enc->base, &via_hdmi_enc_funcs,
+						DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_helper_add(&enc->base, &via_hdmi_enc_helper_funcs);
+
+	enc->base.possible_crtcs =3D BIT(1) | BIT(0);
+	enc->base.possible_clones =3D 0;
+	enc->di_port =3D di_port;
+
+	/* Setup the HDMI connector */
+	drm_connector_init(dev, &hdmi->base, &via_hdmi_connector_funcs,
+				DRM_MODE_CONNECTOR_HDMIA);
+	drm_connector_helper_add(&hdmi->base, &via_hdmi_connector_helper_funcs);
+	drm_connector_register(&hdmi->base);
+
+	hdmi->base.polled =3D DRM_CONNECTOR_POLL_HPD;
+	hdmi->base.doublescan_allowed =3D false;
+	INIT_LIST_HEAD(&hdmi->props);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT1122:
+		hdmi->base.interlace_allowed =3D false;
+		break;
+	default:
+		hdmi->base.interlace_allowed =3D true;
+		break;
+	}
+	drm_connector_attach_encoder(&hdmi->base, &enc->base);
+
+	/* Setup the DVI connector */
+	drm_connector_init(dev, &dvi->base, &via_hdmi_connector_funcs,
+				DRM_MODE_CONNECTOR_DVID);
+	drm_connector_helper_add(&dvi->base, &via_hdmi_connector_helper_funcs);
+	drm_connector_register(&dvi->base);
+
+	dvi->base.polled =3D DRM_CONNECTOR_POLL_HPD;
+	dvi->base.doublescan_allowed =3D false;
+	INIT_LIST_HEAD(&dvi->props);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT3353:
+		dvi->base.interlace_allowed =3D false;
+		break;
+	default:
+		dvi->base.interlace_allowed =3D true;
+		break;
+	}
+	drm_connector_attach_encoder(&dvi->base, &enc->base);
+}
=2D-
2.35.1

