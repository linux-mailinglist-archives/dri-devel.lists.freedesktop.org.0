Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E689855A29C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F73610E870;
	Fri, 24 Jun 2022 20:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8C410E870
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102478;
 bh=t0Y94i+sp5jjrrl5kzK/bZIBiE1Wzp6z96Nv2fMAMdk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=HxJbeEeAO4Rrfy0U7cIIB95MYuuuX1eUikp8FY+7VEMiNgQuYnnX7rCRdhh2el89v
 PFjBn2ae5xDclSmLjCZ+jo3nULpbqD1dF/DLG/O6+l+ajQfOBo9tG1TjiXERQJineU
 Z/5AdqcG8iIjibA7MrHJaB22lKm/sQhHT8Acd5Z0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MpDNl-1nJPDJ3t43-00qhPB; Fri, 24 Jun 2022 22:27:57 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/28] drm/via: Add via_dac.c
Date: Fri, 24 Jun 2022 15:26:14 -0500
Message-Id: <20220624202633.3978-10-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QpgaHihg2VY0HU2ZaxkPMQWKkcVH6nwltluVjtACfaQ5lXrLHn/
 QbXi0DbKxm97r0OHJJ1wT47kKsqH0Exk+RqNdQQTXXzcuvKiTFIXr7dMwteol36dDZbtN7V
 wD0UcCp0JH+TeWWpaYat1my3LKNkgTTkz8dLzM4e0CCh3njCKHexWz/9tG8F352Y8D9c2xM
 33XJdl6F4JtwuLoaZgcbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:33+J/pMMuuQ=:u7lnT1m9tG76IkOaw1VRkR
 79dn1CnRQISOkCLXQozyL1oB2aG/tMbHwD/1/iguY8ulQxTBbTu2eiLFMNipR0rqVBkoWx6tY
 pfbQFdkGKhdoFIxO79rPjI9dxXIWT/HcVcWVKsADLvCM3Y4OkdZS189vQA/KaX4gGLyWiLPEN
 h354XcMHDu+rljOWpiCZ3qHPVeVckhwa1rKrRkK8Jb/Yfnxl5nwm/XhoWnB1VapQDWnxBcjpI
 2z2RCiJEFoA0ao2uYwF++ZY1/W7mtxCeNFk3Gs9qJtmioDCiBFj4VEk6NGmJzYnegflPWhKAw
 xSI2kFhGKaD5idQUZu9iVoozbIECGiUnGolOQkLLmsbuS5UrGdbIfQxvhGbqm5SzKHM+/0C6U
 JZQY2DVapjFs2fkxtVfbnpZzzeAiGDgfKyxta/wALRoPjNBHk61aVx2PbPXNzFZcUSi1gfVs3
 rLP+ESveIQAjMkz/gl9RmehyYA+xnh7zwq4A0aSRGZrLMs06ybL3NYrZKmwEbonGSh/TefTT7
 UFnlNZ5h7Q3mwsXMap0YvJ5Iq0iHe1Nv1n5K/uSsQXPoAQ+g7Yb27s6Qv1plKE6k8Yg8CCmHx
 D+kgdhzfwt6S40oCZ9FxKRzeBmKEp1EuNbnyqAFuv0OPveu+XvOV1A4VQU8kKV8WvIDsG+96A
 W8RcxfQGRV/0R6g88d5zTalhp2T8URjFKuoNrFIr4rjAcsIEYNotg2gTjn1/93XJCey0Mtczg
 MQoUNwsVBWyE/c2kG0/VBM5BIOT0dhlKn01O557kgElp5BcjK/M541eBczTGhm0SHFM0KltMS
 2sidgzpo0uZD6YV8BUihwLBLhF9iLbfqeYws2fBZaZU5wYZPAn6fykaqwjREvQ3sVzQFAE1mo
 nXfxK1sxJTAM1qtFMllU9sMUGublW9ZCKPns4WWy09MYLTJtoE+ovz9JoRjhN6FhuYGww9ISx
 qRTqYioN1lz7gV/W7ukb9i7+JTg07XClLpm/VJ/9sKRgR0qY8qGjAcS99QIhkDJVOtigUG9TA
 5eg2Q4naeGQzFtJ3+pumjGrESAAAO+YZqfLXL8GdXQ3gb7cxDW3QaSNUB4j0hqwudXD078YSn
 POgTynTy5SIO9U6CryUOauUbTmizafp/p49jK96LhfuGdYORMx1BT8RPw==
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
index 000000000000..4921c93d1089
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
+	case PCI_DEVICE_ID_VIA_CLE266:
+	/* KM400(A) / KN400(A) / P4M800 Chipset */
+	case PCI_DEVICE_ID_VIA_KM400:
+		max_clock =3D 250000;
+		break;
+	/* K8M800(A) / K8N800(A) Chipset */
+	case PCI_DEVICE_ID_VIA_K8M800:
+	/* P4M800 Pro / P4M800CE / VN800 / CN700 / CN333 / CN400 Chipset */
+	case PCI_DEVICE_ID_VIA_CN700:
+		max_clock =3D 300000;
+		break;
+	/* PM800 / PN800 / PM880 / PN880 Chipset */
+	case PCI_DEVICE_ID_VIA_PM800:
+	/* P4M890 / P4N890 Chipset */
+	case PCI_DEVICE_ID_VIA_VT3343:
+	/* K8M890 / K8N890 Chipset */
+	case PCI_DEVICE_ID_VIA_K8M890:
+	/* P4M900 / VN896 / CN896 Chipset */
+	case PCI_DEVICE_ID_VIA_P4M900:
+	/* CX700(M/M2) / VX700(M/M2) Chipset */
+	case PCI_DEVICE_ID_VIA_VT3157:
+	/* VX800 / VX820 Chipset */
+	case PCI_DEVICE_ID_VIA_VT1122:
+	/* VX855 / VX875 Chipset */
+	case PCI_DEVICE_ID_VIA_VX875:
+	/* VX900(H) Chipset */
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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
+	case PCI_DEVICE_ID_VIA_VT3157:
+	case PCI_DEVICE_ID_VIA_VT1122:
+	case PCI_DEVICE_ID_VIA_VX875:
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
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

