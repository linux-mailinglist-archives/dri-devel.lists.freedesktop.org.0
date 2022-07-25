Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B0580878
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C38D10F5E9;
	Mon, 25 Jul 2022 23:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1979F10F5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793183;
 bh=pJhEvhqjacoxwMnQsqJp27kMuLOwzcEphZEAeT3DdaY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=dwstUem0k+6Y4NpctN46fa21RH7ka3YOl9S130FKYeFZqt9QZA0jTUbhN4FJb0TMB
 ku8mlpqowMF0jl+BIb3FYUPMk4zzH/JtOgda4W4wxtBwiBJb6SiQ1hsTPw9k3AMv8j
 3HhBt9TpH4mS8X2cUWN9RpWIx5xzE+/pfo6eLxn8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MvbFs-1nNsng0NQU-00sbhO; Tue, 26 Jul 2022 01:53:03 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/32] drm/via: Add via_dac.c
Date: Mon, 25 Jul 2022 16:51:05 -0700
Message-Id: <20220725235127.20433-11-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MEC18BFrWA0thoAjrJLocbOHqvMSCOG0nxlI2DvFGLUGuKKXs6P
 N1U+LloK2EEkZiUZABWkigMA2ou5o6MLPib5B2iFLS1Fiy9Fwb6YF6Km9/sulZZWNwJSzj/
 louJqJQCmNZDGKMJIh5IoAUVS7NZRnowBpoJpVAQPLE0+hY3GSLbtT7x5L2tEwtYMDVFkjD
 D2bY+v9/m8ACZfr2OuQWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yi4yaLsvzFE=:QdW+hMsSYG3yQ6mkcNRE2/
 UhnUNSUgdvKfXJiwtC1/rGgZFXLFI3iXuRsVJ4xVe1Eq7n8dTuZyltUFsZ1Fw+Wo+OqdR3cQ3
 Skyzyt2dAUSRoM+PXF3BmHWRS9UPmpmF0EPIcLPjJY5puhPgBI+6NQdUVvLgQVZ93X6BmaSu2
 8nGEXebiV5Ih/fSySxC1xfxaYkOVHHyCFRiwNImLOnSwJNEw45MOc3yNRoAEc/gK2O8l9Mxtz
 hduvnIUuRyN6c+Mbm2u3JuPhGMNv3N78ABs1wOf30RtX18Rmy7bH3ji7vD8pEipmHnSxRHvdl
 j2KzxnpGtVKqtifBccxs4eKZ837z7kTL/wyq2/ZAVflrUJNgjqCR082M6tW6sSg/wSvPwwxEj
 mzydmCXkx35rfBOgXqfjQutnT1O7UOFprRzgF81IIxnswMdbmdBjfF8uR1qhtX/aX+ri4yMvP
 cIrQaU94hF96Ty/RJZOTreNqHoqEL7GB5bAKxPOuVBOyycISJqHPsKAtUbQwAsuBpt9lj9MYk
 LAVxODzfRosVX5O61mSpYWOLCtXQym0fY7aVoYtCD+5QXxsOXOgpOEqXLzbgGZs5GKZGoOglz
 kIs/lWBojxrRvqOFowyVKQAtZD/03qHnFRzS0g5fsOKV2xOQcY/f+gPYamQLXHa8io8VpVTu8
 tDkPncK+sRCpvBQnG2H/BWKRrp3RNP6W+Z7fNdWnNfiYirxH5s85WQadTbgbtsQFFhM5wW/Qc
 sThsMGftY5N6LYVvuC18pDLwpTYWokiKMXc47A4I4W4h2OEkEPo3h/gfgYoUCiy9j0gVYch97
 Ful0S+PgmqkBpt3UKr0S6EUX9LznPacmL/AN1kE+kFQqiYn+qG8O8YAdL5CJw+HYv9QYLYZOF
 aIph5HWK8X+2TCQQBdBck1Qy6GCdckFKUO+lk8loPkrO/OrvG5DuHRqYFPE4hUGQUhvBHeat7
 RfjOr6bGv1D8cWlFrt2Hz/mpEnBninfAMFC99obVaMFvvsG+3tD0wpQr7S6PwtbxjJsdy1trY
 PCoCf+/zi7jLMT+4NL3/N7cbzpGwPi6zkffHqVusAR5xm0+YIlxLPrLoasjX7vgjDU4sgJn9D
 E0TBs68N8I9/OgWEueHYhcnSe0MfOcDxXYwRnt4ew3AjnczRS0O//HlfQ==
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
 drivers/gpu/drm/via/via_dac.c | 504 ++++++++++++++++++++++++++++++++++
 1 file changed, 504 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_dac.c

diff --git a/drivers/gpu/drm/via/via_dac.c b/drivers/gpu/drm/via/via_dac.c
new file mode 100644
index 000000000000..0e133c6f6551
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_dac.c
@@ -0,0 +1,504 @@
+/*
+ * Copyright =C2=A9 2016-2018 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
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
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_crtc_hw.h"
+#include "via_drv.h"
+
+
+/*
+ * Enables or disables DAC (VGA) output.
+ */
+static void via_dac_power(struct via_drm_priv *dev_priv, bool outputState=
)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+
+	via_dac_set_power(VGABASE, outputState);
+	DRM_INFO("DAC (VGA) Power: %s\n",
+			outputState ? "On" : "Off");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Set DAC (VGA) sync polarity.
+ */
+static void via_dac_sync_polarity(struct via_drm_priv *dev_priv,
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
+	via_dac_set_sync_polarity(VGABASE, syncPolarity);
+	DRM_INFO("DAC (VGA) Horizontal Sync Polarity: %s\n",
+		(syncPolarity & BIT(0)) ? "-" : "+");
+	DRM_INFO("DAC (VGA) Vertical Sync Polarity: %s\n",
+		(syncPolarity & BIT(1)) ? "-" : "+");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Sets DAC (VGA) display source.
+ */
+static void via_dac_display_source(struct via_drm_priv *dev_priv,
+					int index)
+{
+	u8 displaySource =3D index;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_dac_set_display_source(VGABASE, displaySource & 0x01);
+	DRM_INFO("DAC (VGA) Display Source: IGA%d\n",
+			(displaySource & 0x01) + 1);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+/*
+ * Routines for controlling stuff on the DAC port
+ */
+static const struct drm_encoder_funcs via_dac_enc_funcs =3D {
+	.destroy =3D via_encoder_cleanup,
+};
+
+/*
+ * Manage the power state of DAC (VGA).
+ */
+static void via_dac_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_ON);
+		via_dac_power(dev_priv, true);
+		break;
+	case DRM_MODE_DPMS_STANDBY:
+		via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_STANDBY);
+		via_dac_power(dev_priv, true);
+		break;
+	case DRM_MODE_DPMS_SUSPEND:
+		via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_SUSPEND);
+		via_dac_power(dev_priv, true);
+		break;
+	case DRM_MODE_DPMS_OFF:
+		via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_OFF);
+		via_dac_power(dev_priv, false);
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
+ * a chance to reject the mode entirely. Useful for things like scaling.
+ */
+static bool via_dac_mode_fixup(struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+	return true;
+}
+
+/*
+ * Handle DAC (VGA) mode setting.
+ */
+static void via_dac_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct via_crtc *iga =3D container_of(encoder->crtc, struct via_crtc, ba=
se);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_dac_sync_polarity(dev_priv, adjusted_mode->flags);
+	via_dac_display_source(dev_priv, iga->index);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_dac_prepare(struct drm_encoder *encoder)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (encoder->crtc) {
+		via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_OFF);
+		via_dac_power(dev_priv, false);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_dac_commit(struct drm_encoder *encoder)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (encoder->crtc) {
+		via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_ON);
+		via_dac_power(dev_priv, true);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_dac_disable(struct drm_encoder *encoder)
+{
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_dac_set_dpms_control(VGABASE, VIA_DAC_DPMS_OFF);
+	via_dac_power(dev_priv, false);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static const struct drm_encoder_helper_funcs via_dac_enc_helper_funcs =3D=
 {
+	.dpms =3D via_dac_dpms,
+	.mode_fixup =3D via_dac_mode_fixup,
+	.mode_set =3D via_dac_mode_set,
+	.prepare =3D via_dac_prepare,
+	.commit =3D via_dac_commit,
+	.disable =3D via_dac_disable,
+};
+
+static enum drm_connector_status
+via_dac_detect(struct drm_connector *connector, bool force)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	enum drm_connector_status ret =3D connector_status_disconnected;
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else {
+		i2c_bus =3D NULL;
+	}
+
+	if (i2c_bus) {
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (!(edid->input & DRM_EDID_INPUT_DIGITAL)) {
+				ret =3D connector_status_connected;
+			}
+
+			kfree(edid);
+			goto exit;
+		}
+	}
+
+	if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else {
+		i2c_bus =3D NULL;
+	}
+
+	if (i2c_bus) {
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (!(edid->input & DRM_EDID_INPUT_DIGITAL)) {
+				ret =3D connector_status_connected;
+			}
+
+			kfree(edid);
+			goto exit;
+		}
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const struct drm_connector_funcs via_dac_connector_funcs =3D {
+	.dpms =3D drm_helper_connector_dpms,
+	.detect =3D via_dac_detect,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.destroy =3D via_connector_destroy,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_connector_destroy_state,
+};
+
+static enum drm_mode_status via_dac_mode_valid(
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
+	/* CLE266 Chipset */
+	case PCI_DEVICE_ID_VIA_CLE266_GFX:
+	/* KM400(A) / KN400(A) / P4M800 Chipset */
+	case PCI_DEVICE_ID_VIA_KM400_GFX:
+		max_clock =3D 250000;
+		break;
+	/* K8M800(A) / K8N800(A) Chipset */
+	case PCI_DEVICE_ID_VIA_K8M800_GFX:
+	/* P4M800 Pro / P4M800CE / VN800 / CN700 / CN333 / CN400 Chipset */
+	case PCI_DEVICE_ID_VIA_P4M800_PRO_GFX:
+		max_clock =3D 300000;
+		break;
+	/* PM800 / PN800 / PM880 / PN880 Chipset */
+	case PCI_DEVICE_ID_VIA_PM800_GFX:
+	/* P4M890 / P4N890 Chipset */
+	case PCI_DEVICE_ID_VIA_P4M890_GFX:
+	/* K8M890 / K8N890 Chipset */
+	case PCI_DEVICE_ID_VIA_CHROME9:
+	/* P4M900 / VN896 / CN896 Chipset */
+	case PCI_DEVICE_ID_VIA_CHROME9_HC:
+	/* CX700(M/M2) / VX700(M/M2) Chipset */
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	/* VX800 / VX820 Chipset */
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	/* VX855 / VX875 Chipset */
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	/* VX900(H) Chipset */
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		max_clock =3D 350000;
+		break;
+	/* Illegal condition (should never get here) */
+	default:
+		max_clock =3D 0;
+		break;
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
+static int via_dac_get_modes(struct drm_connector *connector)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	int count =3D 0;
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else {
+		i2c_bus =3D NULL;
+	}
+
+	if (i2c_bus) {
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (!(edid->input & DRM_EDID_INPUT_DIGITAL)) {
+				drm_connector_update_edid_property(connector,
+									edid);
+				count =3D drm_add_edid_modes(connector, edid);
+			}
+
+			kfree(edid);
+			goto exit;
+		}
+	}
+
+	if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else {
+		i2c_bus =3D NULL;
+	}
+
+	if (i2c_bus) {
+		edid =3D drm_get_edid(&con->base, i2c_bus);
+		if (edid) {
+			if (!(edid->input & DRM_EDID_INPUT_DIGITAL)) {
+				drm_connector_update_edid_property(connector,
+									edid);
+				count =3D drm_add_edid_modes(connector, edid);
+			}
+
+			kfree(edid);
+			goto exit;
+		}
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs
+via_dac_connector_helper_funcs =3D {
+	.mode_valid =3D via_dac_mode_valid,
+	.get_modes =3D via_dac_get_modes,
+};
+
+void via_dac_probe(struct drm_device *dev)
+{
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	u16 chipset =3D pdev->device;
+	u8 sr13, sr5a;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	switch (chipset) {
+	case PCI_DEVICE_ID_VIA_UNICHROME_PRO_II:
+	case PCI_DEVICE_ID_VIA_CHROME9_HC3:
+	case PCI_DEVICE_ID_VIA_CHROME9_HCM:
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
+		sr5a =3D vga_rseq(VGABASE, 0x5a);
+		DRM_DEBUG_KMS("SR5A: 0x%02x\n", sr5a);
+
+		/* Setting SR5A[0] to 1.
+		 * This allows the reading out the alternative
+		 * pin strapping information from SR12 and SR13. */
+		svga_wseq_mask(VGABASE, 0x5a, BIT(0), BIT(0));
+		DRM_DEBUG_KMS("SR5A: 0x%02x\n", sr5a);
+
+		sr13 =3D vga_rseq(VGABASE, 0x13);
+		DRM_DEBUG_KMS("SR13: 0x%02x\n", sr13);
+
+		if (!(sr13 & BIT(2))) {
+			dev_priv->dac_presence =3D true;
+			DRM_DEBUG_KMS("Detected the presence of VGA.\n");
+		} else {
+			dev_priv->dac_presence =3D false;
+		}
+
+		/* Restore SR5A. */
+		vga_wseq(VGABASE, 0x5a, sr5a);
+		break;
+	default:
+		dev_priv->dac_presence =3D true;
+		DRM_DEBUG_KMS("Detected the presence of VGA.\n");
+		break;
+	}
+
+	dev_priv->dac_i2c_bus =3D VIA_I2C_NONE;
+
+	if (dev_priv->dac_presence) {
+		dev_priv->dac_i2c_bus =3D VIA_I2C_BUS2 | VIA_I2C_BUS1;
+	}
+
+	dev_priv->mapped_i2c_bus |=3D dev_priv->dac_i2c_bus;
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+void via_dac_init(struct drm_device *dev)
+{
+	struct via_connector *con;
+	struct via_encoder *enc;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	enc =3D kzalloc(sizeof(*enc) + sizeof(*con), GFP_KERNEL);
+	if (!enc) {
+		DRM_ERROR("Failed to allocate connector and encoder\n");
+		return;
+	}
+	con =3D &enc->cons[0];
+	INIT_LIST_HEAD(&con->props);
+
+	/* Piece together our connector */
+	drm_connector_init(dev, &con->base, &via_dac_connector_funcs,
+				DRM_MODE_CONNECTOR_VGA);
+	drm_connector_helper_add(&con->base, &via_dac_connector_helper_funcs);
+	drm_connector_register(&con->base);
+
+	con->i2c_bus =3D dev_priv->dac_i2c_bus;
+	con->base.doublescan_allowed =3D false;
+	con->base.interlace_allowed =3D true;
+
+	/* Setup the encoders and attach them */
+	drm_encoder_init(dev, &enc->base, &via_dac_enc_funcs,
+						DRM_MODE_ENCODER_DAC, NULL);
+	drm_encoder_helper_add(&enc->base, &via_dac_enc_helper_funcs);
+
+	enc->base.possible_crtcs =3D BIT(1) | BIT(0);
+	enc->base.possible_clones =3D 0;
+	enc->di_port =3D VIA_DI_PORT_NONE;
+
+	drm_connector_attach_encoder(&con->base, &enc->base);
+}
=2D-
2.35.1

