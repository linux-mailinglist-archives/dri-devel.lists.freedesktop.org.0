Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387F55A2B6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FC010F39E;
	Fri, 24 Jun 2022 20:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B7F10F39E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102806;
 bh=ZDwIaqaDpR9J2Q/LTsrVROGNVMbcDGvIGS8YsYuOuQE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=bRnYB1mmlTpCwGeTuB73gUCm3tBaK8mvUHkR2w87TfT6ezuQdq4Gr1tWF7zyTDCi9
 EenxF/ANtfxGu7HLpS/QLuWrbBr9RYGWnz0Im9SnBee0tiCUlVD2tlFqgrfpMbOKaV
 /DAtPPGm6IskcvDWCnRTYjO2qJGZqLTmZijm7TQo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MSKuA-1oFvpr0cJs-00Sip4; Fri, 24 Jun 2022 22:33:26 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 22/28] drm/via: Add via_tmds.c
Date: Fri, 24 Jun 2022 15:32:53 -0500
Message-Id: <20220624203259.4051-3-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JUGzlJ/Y+t9BSE/uT4WBtzqXmFVKC/6KBl+k3qwgSsfvWmf4Y3k
 sJbpz1AEODjlsWX7lINBsBnMkXZ0gtBsT+NQ6tq8v7h1YqcKZ+g8YcBfxx2rGHVpJNBDOje
 RYMd6ejp87r2Y7lH/PKvqutW22UOdDu/8COgAoNdfMhvVt6IC0PdRlJwx40ZJm2yIQao4oD
 pV0+nhrH7qwyMlBQR9+qg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0yJ+jk1t9sw=:NuRnK0S+zQRxHxevrwp3OL
 CUkg00/Skjf0e4jGUqN8FeTWs0ni7XW5pY8wHPjRTsaoZMYToyN+/MHECh0DbK667LmX7Fmtb
 6k3FsmeLDaMMlxRY5tlbA7IPM0QVmAMgU0gLYZNYVYmxVXckGE+Qa8HOe3+LHEAbyd+Jcj7M4
 i39TQKssG/NE9pze6WFu9kuLNHN+og6uJCXlt6yeHvcwiiGba1cg6ZqRdeFEH9dA4O3fEr3zw
 ayqTfwPkMCcyxcpJxmHm5NLgid8nsOzOxESsBwyjYmFGOKmKkLHMuLy5q23rRNUqBopsodTuh
 pqw2U+UkI0sLkGe1fk23nwYscB6WVe6CQMMWdwvhHqlMfQMyB/xxu8bZKPlLQWU9TRUwidGNl
 5yr/Y+1LuxyF1L/ABB4h9G2TGa6x8Y8XdOM83LmVxDqZT9XSGYDTcZ37Aw+cAWE0ThoPAea7x
 OKWBTMgv3BY5wJCZd30jTWj0A2CrSH1fMukzfhVpwXPBF1tts8c7bKljCKQoGA6lYYgsw+/15
 yVbhZ/onEDs3z7iQGWdO7O40TGHklR0bC1WkPYZNxuUEUwhfTXJcPUMjJn0VqAaTvdfzzMvAF
 O3wOQdysWSfjol+s/Zvx3bscRrSl0tgof++olf+0Ry6G+1xYmJesKmxVCgcWFHb7fTItZeO2l
 G8dgEYSKJ8AjaRPWxJTb2Od4VU8ElIMVuu+ITEB1CF6BHdx2hds0/kzGEX71ph65NObYmVMA8
 GJ/UVIaiohQoILodLccWA6MltoPSzdh3ubdJ+GShmr6A+22PkW7GBxgolj9r16xvhhyzbxGQK
 YdFqSK4skNVa+EXHxA0malqTUR/ZoVzl6hC6EWTmAlERjSkZ+EHjDyXmTI6vPhXs4889OuHmV
 Ms7wJ/ptipHkZmHaYIDJLTuSuB0kaFAWUdY6F1YVRUICBzp7cRB6KuTEN251cGqYrpdY1Pg8U
 iRlDVGrJbpE+jH2/2wY9yJR2iiNEvUohsQLAoalmTZMOgrFo0jtnOr6TNQcYE379s7wT20gt/
 ifWZIee73ba37JRZtH9otxyGYnNRfpmvj9DY7X9KUpSkWXastSj9jhYF0c+p0H0AQFxu8kP8c
 gQIkctBcGEaacAufw1YtJTuNN+r1S9WR5ZJ1P+k5p1KkmmfCIhfUYVm5A==
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
 drivers/gpu/drm/via/via_tmds.c | 714 +++++++++++++++++++++++++++++++++
 1 file changed, 714 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_tmds.c

diff --git a/drivers/gpu/drm/via/via_tmds.c b/drivers/gpu/drm/via/via_tmds=
.c
new file mode 100644
index 000000000000..5404fc7f8b64
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_tmds.c
@@ -0,0 +1,714 @@
+/*
+ * Copyright =C2=A9 2016-2018 Kevin Brace.
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
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+
+static void via_tmds_power(struct via_drm_priv *dev_priv,
+				bool power_state)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (power_state) {
+		via_lvds1_set_soft_display_period(VGABASE, true);
+		via_lvds1_set_soft_data(VGABASE, true);
+		via_tmds_set_power(VGABASE, true);
+	} else {
+		via_tmds_set_power(VGABASE, false);
+		via_lvds1_set_soft_data(VGABASE, false);
+		via_lvds1_set_soft_display_period(VGABASE, false);
+	}
+
+	DRM_INFO("DVI Power: %s\n",
+			power_state ? "On" : "Off");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_tmds_io_pad_setting(struct via_drm_priv *dev_priv,
+					u32 di_port, bool io_pad_on)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch(di_port) {
+	case VIA_DI_PORT_TMDS:
+		via_lvds1_set_io_pad_setting(VGABASE,
+				io_pad_on ? 0x03 : 0x00);
+		break;
+	default:
+		break;
+	}
+
+	DRM_DEBUG_KMS("DVI I/O Pad: %s\n", io_pad_on ? "On": "Off");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Initializes most registers related to VIA Technologies IGP
+ * integrated TMDS transmitter. Synchronization polarity and
+ * display output source need to be set separately.
+ */
+static void via_tmds_init_reg(struct via_drm_priv *dev_priv)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Turn off hardware controlled FP power on / off circuit. */
+	via_lvds_set_primary_hard_power(VGABASE, false);
+
+	/* Use software FP power sequence control. */
+	via_lvds_set_primary_power_seq_type(VGABASE, false);
+
+	/* Turn off software controlled primary FP power rails. */
+	via_lvds_set_primary_soft_vdd(VGABASE, false);
+	via_lvds_set_primary_soft_vee(VGABASE, false);
+
+	/* Turn off software controlled primary FP back light
+	* control. */
+	via_lvds_set_primary_soft_back_light(VGABASE, false);
+
+	/* Turn off direct control of FP back light. */
+	via_lvds_set_primary_direct_back_light_ctrl(VGABASE, false);
+
+	/* Activate DVI + LVDS2 mode. */
+	/* 3X5.D2[5:4] - Display Channel Select
+	 *               00: LVDS1 + LVDS2
+	 *               01: DVI + LVDS2
+	 *               10: One Dual LVDS Channel (High Resolution Pannel)
+	 *               11: Single Channel DVI */
+	svga_wcrt_mask(VGABASE, 0xd2, 0x10, 0x30);
+
+	/* Various DVI PLL settings should be set to default settings. */
+	/* 3X5.D1[7]   - PLL2 Reference Clock Edge Select Bit
+	 *               0: PLLCK lock to rising edge of reference clock
+	 *               1: PLLCK lock to falling edge of reference clock
+	 * 3X5.D1[6:5] - PLL2 Charge Pump Current Set Bits
+	 *               00: ICH =3D 12.5 uA
+	 *               01: ICH =3D 25.0 uA
+	 *               10: ICH =3D 37.5 uA
+	 *               11: ICH =3D 50.0 uA
+	 * 3X5.D1[4:1] - Reserved
+	 * 3X5.D1[0]   - PLL2 Control Voltage Measurement Enable Bit */
+	svga_wcrt_mask(VGABASE, 0xd1, 0x00, 0xe1);
+
+	/* Disable DVI test mode. */
+	/* 3X5.D5[7] - PD1 Enable Selection
+	 *             1: Select by power flag
+	 *             0: By register
+	 * 3X5.D5[5] - DVI Testing Mode Enable
+	 * 3X5.D5[4] - DVI Testing Format Selection
+	 *             0: Half cycle
+	 *             1: LFSR mode */
+	svga_wcrt_mask(VGABASE, 0xd5, 0x00, 0xb0);
+
+	/* Disable DVI sense interrupt. */
+	/* 3C5.2B[7] - DVI Sense Interrupt Enable
+	 *             0: Disable
+	 *             1: Enable */
+	svga_wseq_mask(VGABASE, 0x2b, 0x00, 0x80);
+
+	/* Clear DVI sense interrupt status. */
+	/* 3C5.2B[6] - DVI Sense Interrupt Status
+	 *             (This bit has a RW1C attribute.) */
+	svga_wseq_mask(VGABASE, 0x2b, 0x40, 0x40);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Set TMDS (DVI) sync polarity.
+ */
+static void via_tmds_sync_polarity(struct via_drm_priv *dev_priv,
+					unsigned int flags)
+{
+	u8 syncPolarity =3D 0x00;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (flags & DRM_MODE_FLAG_NHSYNC) {
+		syncPolarity |=3D BIT(0);
+	}
+
+	if (flags & DRM_MODE_FLAG_NVSYNC) {
+		syncPolarity |=3D BIT(1);
+	}
+
+	via_tmds_set_sync_polarity(VGABASE, syncPolarity);
+	DRM_INFO("TMDS (DVI) Horizontal Sync Polarity: %s\n",
+		(syncPolarity & BIT(0)) ? "-" : "+");
+	DRM_INFO("TMDS (DVI) Vertical Sync Polarity: %s\n",
+		(syncPolarity & BIT(1)) ? "-" : "+");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Sets TMDS (DVI) display source.
+ */
+static void via_tmds_display_source(struct via_drm_priv *dev_priv,
+					int index)
+{
+	u8 displaySource =3D index;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_tmds_set_display_source(VGABASE, displaySource & 0x01);
+	DRM_INFO("TMDS (DVI) Display Source: IGA%d\n",
+			(displaySource & 0x01) + 1);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Routines for controlling stuff on the TMDS port
+ */
+static const struct drm_encoder_funcs via_tmds_enc_funcs =3D {
+	.destroy =3D via_encoder_cleanup,
+};
+
+static void via_tmds_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		via_tmds_power(dev_priv, true);
+		via_tmds_io_pad_setting(dev_priv, enc->di_port, true);
+		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_OFF:
+		via_tmds_power(dev_priv, false);
+		via_tmds_io_pad_setting(dev_priv, enc->di_port, false);
+		break;
+	default:
+		DRM_ERROR("Bad DPMS mode.");
+		break;
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/* Pass our mode to the connectors and the CRTC to give them a chance to
+ * adjust it according to limitations or connector properties, and also
+ * a chance to reject the mode entirely. Usefule for things like scaling.
+ */
+static bool via_tmds_mode_fixup(struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+	return true;
+}
+
+static void via_tmds_prepare(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_tmds_power(dev_priv, false);
+	via_tmds_io_pad_setting(dev_priv, enc->di_port, false);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_tmds_commit(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_tmds_power(dev_priv, true);
+	via_tmds_io_pad_setting(dev_priv, enc->di_port, true);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Handle CX700 / VX700 and VX800 integrated TMDS (DVI) mode setting.
+ */
+static void via_tmds_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_crtc *iga =3D container_of(encoder->crtc,
+						struct via_crtc, base);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_tmds_init_reg(dev_priv);
+	via_tmds_sync_polarity(dev_priv, adjusted_mode->flags);
+	via_tmds_display_source(dev_priv, iga->index);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_tmds_disable(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_tmds_power(dev_priv, false);
+	via_tmds_io_pad_setting(dev_priv, enc->di_port, false);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct drm_encoder_helper_funcs
+via_tmds_enc_helper_funcs =3D {
+	.dpms =3D via_tmds_dpms,
+	.mode_fixup =3D via_tmds_mode_fixup,
+	.prepare =3D via_tmds_prepare,
+	.commit =3D via_tmds_commit,
+	.mode_set =3D via_tmds_mode_set,
+	.disable =3D via_tmds_disable,
+};
+
+static enum drm_connector_status via_tmds_detect(
+					struct drm_connector *connector,
+					bool force)
+{
+	struct via_connector *con =3D container_of(connector, struct via_connect=
or, base);
+	enum drm_connector_status ret =3D connector_status_disconnected;
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else {
+		i2c_bus =3D NULL;
+	}
+
+	if (i2c_bus) {
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+				drm_connector_update_edid_property(connector, edid);
+				ret =3D connector_status_connected;
+			}
+
+			kfree(edid);
+		}
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const struct drm_connector_funcs via_dvi_connector_funcs =3D {
+	.dpms =3D drm_helper_connector_dpms,
+	.detect =3D via_tmds_detect,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.destroy =3D via_connector_destroy,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_connector_destroy_state,
+};
+
+static enum drm_mode_status via_tmds_mode_valid(
+					struct drm_connector *connector,
+					struct drm_display_mode *mode)
+{
+	struct drm_device *dev =3D connector->dev;
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	int min_clock, max_clock;
+	enum drm_mode_status status =3D MODE_OK;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	min_clock =3D 25000;
+	switch (pdev->device) {
+	/* CX700(M/M2) / VX700(M/M2) Chipset */
+	case PCI_DEVICE_ID_VIA_VT3157:
+	/* VX800 / VX820 Chipset */
+	case PCI_DEVICE_ID_VIA_VT1122:
+		max_clock =3D 165000;
+		break;
+	/* Illegal condition (should never get here) */
+	default:
+		max_clock =3D 0;
+		break;
+	}
+
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
+		status =3D MODE_NO_INTERLACE;
+		goto exit;
+	}
+
+	if (mode->flags & DRM_MODE_FLAG_DBLSCAN) {
+		status =3D MODE_NO_DBLESCAN;
+		goto exit;
+	}
+
+	if (mode->clock < min_clock) {
+		status =3D MODE_CLOCK_LOW;
+		goto exit;
+	}
+
+	if (mode->clock > max_clock) {
+		status =3D MODE_CLOCK_HIGH;
+		goto exit;
+	}
+
+exit:
+	DRM_DEBUG_KMS("status: %u\n", status);
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return status;
+}
+
+static int via_tmds_get_modes(struct drm_connector *connector)
+{
+	struct via_connector *con =3D container_of(connector, struct via_connect=
or, base);
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+	int count =3D 0;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else {
+		i2c_bus =3D NULL;
+	}
+
+	if (i2c_bus) {
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+			drm_connector_update_edid_property(connector,
+								edid);
+			count =3D drm_add_edid_modes(connector, edid);
+			DRM_DEBUG_KMS("DVI EDID information was obtained.\n");
+		}
+
+		kfree(edid);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs
+via_dvi_connector_helper_funcs =3D {
+	.mode_valid =3D via_tmds_mode_valid,
+	.get_modes =3D via_tmds_get_modes,
+};
+
+/*
+ * Probe (pre-initialization detection) of integrated TMDS transmitters.
+ */
+void via_tmds_probe(struct drm_device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	u16 chipset =3D pdev->device;
+	u8 sr13, sr5a;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	/* Detect the presence of integrated TMDS transmitter. */
+	switch (chipset) {
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT1122:
+		sr5a =3D vga_rseq(VGABASE, 0x5a);
+
+		/* Setting SR5A[0] to 1.
+		 * This allows the reading out the alternative
+		 * pin strapping information from SR12 and SR13. */
+		svga_wseq_mask(VGABASE, 0x5a, BIT(0), BIT(0));
+
+		sr13 =3D vga_rseq(VGABASE, 0x13);
+		DRM_DEBUG_KMS("sr13: 0x%02x\n", sr13);
+
+		vga_wseq(VGABASE, 0x5a, sr5a);
+
+		/* 3C5.13[7:6] - Integrated LVDS / DVI Mode Select
+		 *               (DVP1D15-14 pin strapping)
+		 *               00: LVDS1 + LVDS2
+		 *               01: DVI + LVDS2
+		 *               10: Dual LVDS Channel (High Resolution Panel)
+		 *               11: One DVI only (decrease the clock jitter) */
+		/* Check for DVI presence using pin strappings.
+		 * VIA Technologies NanoBook reference design based products
+		 * have their pin strappings set to a wrong setting to communicate
+		 * the presence of DVI, so it requires special handling here. */
+		if (dev_priv->is_via_nanobook) {
+			dev_priv->int_tmds_presence =3D true;
+			dev_priv->int_tmds_di_port =3D VIA_DI_PORT_TMDS;
+			dev_priv->int_tmds_i2c_bus =3D VIA_I2C_BUS2;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS2;
+			DRM_DEBUG_KMS("Integrated TMDS (DVI) "
+					"transmitter detected.\n");
+		} else if (((!(sr13 & BIT(7))) && (sr13 & BIT(6))) ||
+				((sr13 & BIT(7)) && (sr13 & BIT(6)))) {
+			dev_priv->int_tmds_presence =3D true;
+			dev_priv->int_tmds_di_port =3D VIA_DI_PORT_TMDS;
+			dev_priv->int_tmds_i2c_bus =3D VIA_I2C_BUS2;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS2;
+			DRM_DEBUG_KMS("Integrated TMDS (DVI) "
+					"transmitter detected via pin "
+					"strapping.\n");
+		} else {
+			dev_priv->int_tmds_presence =3D false;
+			dev_priv->int_tmds_di_port =3D VIA_DI_PORT_NONE;
+			dev_priv->int_tmds_i2c_bus =3D VIA_I2C_NONE;
+		}
+
+		break;
+	default:
+		dev_priv->int_tmds_presence =3D false;
+		dev_priv->int_tmds_di_port =3D VIA_DI_PORT_NONE;
+		dev_priv->int_tmds_i2c_bus =3D VIA_I2C_NONE;
+		break;
+	}
+
+	DRM_DEBUG_KMS("int_tmds_presence: %x\n",
+			dev_priv->int_tmds_presence);
+	DRM_DEBUG_KMS("int_tmds_di_port: 0x%08x\n",
+			dev_priv->int_tmds_di_port);
+	DRM_DEBUG_KMS("int_tmds_i2c_bus: 0x%08x\n",
+			dev_priv->int_tmds_i2c_bus);
+	DRM_DEBUG_KMS("mapped_i2c_bus: 0x%08x\n",
+			dev_priv->mapped_i2c_bus);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_tmds_init(struct drm_device *dev)
+{
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_connector *con;
+	struct via_encoder *enc;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!dev_priv->int_tmds_presence) {
+		goto exit;
+	}
+
+	enc =3D kzalloc(sizeof(*enc) + sizeof(*con), GFP_KERNEL);
+	if (!enc) {
+		DRM_ERROR("Failed to allocate connector "
+				"and encoder.\n");
+		goto exit;
+	}
+
+	/* Setup the encoders and attach them */
+	drm_encoder_init(dev, &enc->base, &via_tmds_enc_funcs,
+				DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_helper_add(&enc->base, &via_tmds_enc_helper_funcs);
+
+	enc->base.possible_crtcs =3D BIT(1) | BIT(0);
+	enc->base.possible_clones =3D 0;
+
+	enc->di_port =3D dev_priv->int_tmds_di_port;
+
+	/* Increment the number of DVI connectors. */
+	dev_priv->number_dvi++;
+
+
+	con =3D &enc->cons[0];
+	drm_connector_init(dev, &con->base, &via_dvi_connector_funcs,
+				DRM_MODE_CONNECTOR_DVID);
+	drm_connector_helper_add(&con->base, &via_dvi_connector_helper_funcs);
+	drm_connector_register(&con->base);
+
+	con->i2c_bus =3D dev_priv->int_tmds_i2c_bus;
+	con->base.doublescan_allowed =3D false;
+	con->base.interlace_allowed =3D true;
+	INIT_LIST_HEAD(&con->props);
+
+	drm_connector_attach_encoder(&con->base, &enc->base);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Probe (pre-initialization detection) of external DVI transmitters.
+ */
+void via_ext_dvi_probe(struct drm_device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+	u16 chipset =3D pdev->device;
+	u8 sr12, sr13;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	dev_priv->ext_tmds_presence =3D false;
+	dev_priv->ext_tmds_i2c_bus =3D VIA_I2C_NONE;
+	dev_priv->ext_tmds_transmitter =3D VIA_TMDS_NONE;
+
+	if ((!dev_priv->ext_tmds_presence) &&
+		(!(dev_priv->mapped_i2c_bus & VIA_I2C_BUS2))) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+		if (via_vt1632_probe(i2c_bus)) {
+			dev_priv->ext_tmds_presence =3D true;
+			dev_priv->ext_tmds_i2c_bus =3D VIA_I2C_BUS2;
+			dev_priv->ext_tmds_transmitter =3D VIA_TMDS_VT1632;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS2;
+		} else if (via_sii164_probe(i2c_bus)) {
+			dev_priv->ext_tmds_presence =3D true;
+			dev_priv->ext_tmds_i2c_bus =3D VIA_I2C_BUS2;
+			dev_priv->ext_tmds_transmitter =3D VIA_TMDS_SII164;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS2;
+		}
+	}
+
+	if ((!(dev_priv->ext_tmds_presence)) &&
+		(!(dev_priv->mapped_i2c_bus & VIA_I2C_BUS4))) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+		if (via_vt1632_probe(i2c_bus)) {
+			dev_priv->ext_tmds_presence =3D true;
+			dev_priv->ext_tmds_i2c_bus =3D VIA_I2C_BUS4;
+			dev_priv->ext_tmds_transmitter =3D VIA_TMDS_VT1632;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS4;
+		} else if (via_sii164_probe(i2c_bus)) {
+			dev_priv->ext_tmds_presence =3D true;
+			dev_priv->ext_tmds_i2c_bus =3D VIA_I2C_BUS4;
+			dev_priv->ext_tmds_transmitter =3D VIA_TMDS_SII164;
+			dev_priv->mapped_i2c_bus |=3D VIA_I2C_BUS4;
+		}
+	}
+
+	sr12 =3D vga_rseq(VGABASE, 0x12);
+	sr13 =3D vga_rseq(VGABASE, 0x13);
+	DRM_DEBUG_KMS("SR12: 0x%02x\n", sr12);
+	DRM_DEBUG_KMS("SR13: 0x%02x\n", sr13);
+
+	if (dev_priv->ext_tmds_presence) {
+		switch (chipset) {
+		case PCI_DEVICE_ID_VIA_CLE266:
+
+			/* 3C5.12[4] - FPD17 pin strapping
+			 *             0: TMDS transmitter (DVI) /
+			 *                capture device
+			 *             1: Flat panel */
+			if (!(sr12 & BIT(4))) {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_DIP0;
+
+			/* 3C5.12[5] - FPD18 pin strapping
+			 *             0: TMDS transmitter (DVI)
+			 *             1: TV encoder */
+			} else if (!(sr12 & BIT(5))) {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_DIP1;
+			} else {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_NONE;
+			}
+
+			break;
+		case PCI_DEVICE_ID_VIA_KM400:
+		case PCI_DEVICE_ID_VIA_K8M800:
+		case PCI_DEVICE_ID_VIA_CN700:
+		case PCI_DEVICE_ID_VIA_PM800:
+			/* 3C5.12[6] - DVP0D6 pin strapping
+			 *             0: Disable DVP0 (Digital Video Port 0) for
+			 *                DVI or TV out use
+			 *             1: Enable DVP0 (Digital Video Port 0) for
+			 *                DVI or TV out use
+			 * 3C5.12[5] - DVP0D5 pin strapping
+			 *             0: TMDS transmitter (DVI)
+			 *             1: TV encoder */
+			if ((sr12 & BIT(6)) && (!(sr12 & BIT(5)))) {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_DVP0;
+			} else {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_DVP1;
+			}
+
+			break;
+		case PCI_DEVICE_ID_VIA_VT3343:
+		case PCI_DEVICE_ID_VIA_K8M890:
+		case PCI_DEVICE_ID_VIA_P4M900:
+			/* Assume DVP2 as DVP0. Hence, VIA_DI_PORT_DVP0
+			 * is used. */
+			/* 3C5.12[6] - DVP2D6 pin strapping
+			 *             0: Disable DVP2 (Digital Video Port 2)
+			 *             1: Enable DVP2 (Digital Video Port 2)
+			 * 3C5.12[5] - DVP2D5 pin strapping
+			 *             0: TMDS transmitter (DVI)
+			 *             1: TV encoder */
+			if ((sr12 & BIT(6)) && (!(sr12 & BIT(5)))) {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_DVP0;
+			} else {
+				dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_NONE;
+			}
+
+			break;
+		case PCI_DEVICE_ID_VIA_VT3157:
+		case PCI_DEVICE_ID_VIA_VT1122:
+		case PCI_DEVICE_ID_VIA_VX875:
+		case PCI_DEVICE_ID_VIA_VX900_VGA:
+			dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_DVP1;
+			break;
+		default:
+			dev_priv->ext_tmds_di_port =3D VIA_DI_PORT_NONE;
+			break;
+		}
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_ext_dvi_init(struct drm_device *dev)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_vt1632_init(dev);
+	via_sii164_init(dev);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
=2D-
2.35.1

