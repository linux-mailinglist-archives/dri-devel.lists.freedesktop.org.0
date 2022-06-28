Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040555F0AE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5163E112D08;
	Tue, 28 Jun 2022 21:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D75112D08
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453344;
 bh=N21UouMX0PjBpgzwi5zMu0vky0OumvdCacubu3Nynn0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Ifbo5Grv9rJQrY4YBQSi84esBquPzXxxaFwD/8BRPoPdYulfSLETJ/CB9bM5eCEAy
 iyyA4lyyn0LYFj4RMqpkQtbA4skgt6cgOZQyCIwpEaqxtI6zbx4vl5PZcmbQrnF12t
 l01anil+aFU2b+3Y4WdnjFulUdwBZX67GmL+mJ28=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.2]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mjj8D-1nLNqw482l-00lF5D; Tue, 28
 Jun 2022 23:55:44 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/32] drm/via: Add via_sii164.c
Date: Tue, 28 Jun 2022 16:55:10 -0500
Message-Id: <20220628215520.20674-3-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215520.20674-1-kevinbrace@gmx.com>
References: <20220628215520.20674-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7q7HhtVGvNbJrv8JKK2KRBhoNlrvOP/BHz+pTfOoiJ7dHRrZ/hq
 Y9Jxr4bLONfdtsMilwO5jvkwHXNjihnuqzuozWi67yPkuYZfWZtnXfjIHgr/E6vnwGEjucf
 +VMTBaUS2sPUwCGS4dhZUFR+5UEcAySOp4tUvCYkkxyHJ8+atiSjyq+aWnA8isnjCzKcloM
 yf6lf2Qf8+VeEZMfafwwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SNRZrs+ASRU=:7zVFiGw6CnrgDnibLluxXV
 GEIrSWN5RFCNIUpXlPxS6FsRTN/GCqVCRQ5EfmJueTih+ZhZcmuhU0fVqucYryNdIoqZyvJyx
 rPY0wO+HYrNO0cHMIFXLJl4LT2OzTj78ngQHU9XErdGeY/USvK2uZSiVAfzmRXfymfUitsBjB
 ugnSF2KzYjw86rejPIKwoXJc1N6Aj+3W/NaxL70qDeECXw7WOQJMhQ7aWKemuOX9vwu+Lsa+T
 0lp9hF+cu/FcCQxRNXabyXTonlPWaLtg82roR2P1vEW+XnhjRg3/iumDCtLtFg5hf5zZJffoR
 c2k6uVbBJ0coJ2Iux+zjkovgnQFmt8nugttsYxvXezhfjPDjVJ/WKoobuKLh3If7Sgfffv8wF
 L/W5rPLcWAYy17Apx00wJJWEqOoGYtsf8haXCap4FaNSWBCvuEqZ43lm0RPgCpgCpuFr2IPto
 UZ9p48h0hke8c6iH2H1DuTmHKI2zN8fxzJQCz1thb2dq9n6NZCZX5fQSz7pjnHcaAXyByO6R5
 VqXHMFvPQ3682sz2UVfWM4dqjW2jQPVzEKc0KLftTxnyJeaqYHjlO0vQY2rkxsmIqNIKViMi0
 y9k/VvKtVrJaaSYPVAT3tD4dPCyMuZJue0+8P3ufERpAAOlMyeuoJ694W/P1KxdviTVH9io7O
 UcolaQXDni9yHJ+WJGESMXUA28SDmDC35KipRHpvr1U0+MbL2A8BlYzwu/iXex1jUG8Xp+ito
 +yKw9RssEdrxvjPxO3dUUmypl8WNtp1ZSiSyTgNmiyuLn5QeMwGg8MpBqkcWQJbYXgJBHx0qE
 aJemiLp9rE2/O4HM+BNaDSOoJ9v1hBwV6/NQm/2aJwo16rHS3l3Fvyzemvgj+cBeIx+vwuZ2a
 TZMtUzmX6hX5fVBz64/P7Jkjgwg8EcwFxk/m88F8bNKFjfHGoipRM4W+vdTuVn2HDIalPztdA
 OYmO48UFf9pTOeX/aToh638zLk1p1mBBH6zSJznv2efrwcnBS+5ahC/9hcjlqX641vcCsExEI
 MVVLa6wHt4WQzEvnsMSSJfxnLyOwHf0tkFkp8nI3Qg7qF9dYhtqXsfW92Q9GSzIeMSuAFKF9w
 9NwMjW5Vd5My6QTNn4Hzg8Huz4WObKYBzCQd+2mtson/GxsEN+qWUYxUw==
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
 drivers/gpu/drm/via/via_sii164.c | 563 +++++++++++++++++++++++++++++++
 1 file changed, 563 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_sii164.c

diff --git a/drivers/gpu/drm/via/via_sii164.c b/drivers/gpu/drm/via/via_si=
i164.c
new file mode 100644
index 000000000000..76f8dd783eca
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_sii164.c
@@ -0,0 +1,563 @@
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
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+
+#define SII164_VEN		BIT(5)
+#define SII164_HEN		BIT(4)
+#define SII164_DSEL		BIT(3)
+#define SII164_BSEL		BIT(2)
+#define SII164_EDGE		BIT(1)
+#define SII164_PDB		BIT(0)
+
+
+static void via_sii164_power(struct i2c_adapter *i2c_bus, bool power_stat=
e)
+{
+	u8 buf;
+	u8 power_bit;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x08, &buf, 1);
+	power_bit =3D power_state ? SII164_PDB : 0x00;
+	buf &=3D ~power_bit;
+	buf |=3D power_bit;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x08, &buf, 1);
+	DRM_DEBUG_KMS("SiI 164 (DVI) Power: %s\n",
+			power_state ? "On" : "Off");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+
+static bool via_sii164_sense(struct i2c_adapter *i2c_bus)
+{
+	u8 buf;
+	bool rx_detected =3D false;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x09, &buf, 1);
+	if (buf & BIT(2)) {
+		rx_detected =3D true;
+	}
+
+	DRM_DEBUG_KMS("SiI 164 (DVI) Connector Sense: %s\n",
+			rx_detected ? "Connected" : "Not Connected");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return rx_detected;
+}
+
+static void via_sii164_display_registers(struct i2c_adapter *i2c_bus)
+{
+	uint8_t i;
+	u8 buf;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("SiI 164 Registers:\n");
+	for (i =3D 0; i < 0x10; i++) {
+		via_i2c_readbytes(i2c_bus, 0x38, i, &buf, 1);
+		DRM_DEBUG_KMS("0x%02x: 0x%02x\n", i, buf);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_init_registers(struct i2c_adapter *i2c_bus)
+{
+	u8 buf;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	buf =3D SII164_VEN | SII164_HEN |
+		SII164_DSEL |
+		SII164_EDGE | SII164_PDB;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x08, &buf, 1);
+
+	/*
+	 * Route receiver detect bit (Offset 0x09[2]) as the output
+	 * of MSEN pin.
+	 */
+	buf =3D BIT(5);
+	via_i2c_writebytes(i2c_bus, 0x38, 0x09, &buf, 1);
+
+	buf =3D 0x90;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x0a, &buf, 1);
+
+	buf =3D 0x89;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x0c, &buf, 1);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+
+static const struct drm_encoder_funcs via_sii164_drm_encoder_funcs =3D {
+	.destroy =3D via_encoder_cleanup,
+};
+
+static void via_sii164_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_display_registers(i2c_bus);
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		via_sii164_power(i2c_bus, true);
+		via_transmitter_io_pad_state(dev_priv, enc->di_port, true);
+		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_OFF:
+		via_sii164_power(i2c_bus, false);
+		via_transmitter_io_pad_state(dev_priv, enc->di_port, false);
+		break;
+	default:
+		DRM_ERROR("Bad DPMS mode.");
+		break;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static bool via_sii164_mode_fixup(struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return true;
+}
+
+static void via_sii164_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct via_crtc *iga =3D container_of(encoder->crtc, struct via_crtc, ba=
se);
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_transmitter_clock_drive_strength(dev_priv, enc->di_port, 0x03);
+	via_transmitter_data_drive_strength(dev_priv, enc->di_port, 0x03);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, true);
+
+	via_sii164_display_registers(i2c_bus);
+	via_sii164_init_registers(i2c_bus);
+	via_sii164_display_registers(i2c_bus);
+
+	via_transmitter_display_source(dev_priv, enc->di_port, iga->index);
+exit:
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_prepare(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_power(i2c_bus, false);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, false);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_commit(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_power(i2c_bus, true);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, true);
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_disable(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_power(i2c_bus, false);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, false);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+
+static const struct drm_encoder_helper_funcs
+via_sii164_drm_encoder_helper_funcs =3D {
+	.dpms =3D via_sii164_dpms,
+	.mode_fixup =3D via_sii164_mode_fixup,
+	.mode_set =3D via_sii164_mode_set,
+	.prepare =3D via_sii164_prepare,
+	.commit =3D via_sii164_commit,
+	.disable =3D via_sii164_disable,
+};
+
+
+static enum drm_connector_status via_sii164_detect(
+					struct drm_connector *connector,
+					bool force)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	struct i2c_adapter *i2c_bus;
+	enum drm_connector_status ret =3D connector_status_disconnected;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (con->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (con->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	if (via_sii164_sense(i2c_bus)) {
+		ret =3D connector_status_connected;
+		DRM_DEBUG_KMS("DVI detected.\n");
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const struct drm_connector_funcs via_sii164_drm_connector_funcs =
=3D {
+	.dpms =3D drm_helper_connector_dpms,
+	.detect =3D via_sii164_detect,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.destroy =3D via_connector_destroy,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_connector_destroy_state,
+};
+
+
+int via_sii164_mode_valid(struct drm_connector *connector,
+					struct drm_display_mode *mode)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	struct i2c_adapter *i2c_bus;
+	u8 buf;
+	uint32_t low_freq_limit, high_freq_limit;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (con->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (con->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		ret =3D MODE_ERROR;
+		goto exit;
+	}
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x06, &buf, 1);
+	low_freq_limit =3D buf * 1000;
+	via_i2c_readbytes(i2c_bus, 0x38, 0x07, &buf, 1);
+	high_freq_limit =3D (buf + 65) * 1000;
+	DRM_DEBUG_KMS("Low Frequency Limit: %u KHz\n", low_freq_limit);
+	DRM_DEBUG_KMS("High Frequency Limit: %u KHz\n", high_freq_limit);
+
+	if (mode->clock < low_freq_limit) {
+		ret =3D MODE_CLOCK_LOW;
+		goto exit;
+	}
+
+	if (mode->clock > high_freq_limit) {
+		ret =3D MODE_CLOCK_HIGH;
+		goto exit;
+	}
+
+	ret =3D MODE_OK;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_sii164_get_modes(struct drm_connector *connector)
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
+	} else if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (con->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (con->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	edid =3D drm_get_edid(&con->base, i2c_bus);
+	if (edid) {
+		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+			drm_connector_update_edid_property(connector, edid);
+			count =3D drm_add_edid_modes(connector, edid);
+			DRM_DEBUG_KMS("DVI EDID information was obtained.\n");
+		}
+
+		kfree(edid);
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs
+via_sii164_drm_connector_helper_funcs =3D {
+	.mode_valid =3D via_sii164_mode_valid,
+	.get_modes =3D via_sii164_get_modes,
+};
+
+bool via_sii164_probe(struct i2c_adapter *i2c_bus)
+{
+	u8 buf;
+	u16 vendor_id, device_id, revision;
+	bool device_detected =3D false;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x00, &buf, 1);
+	vendor_id =3D buf;
+	via_i2c_readbytes(i2c_bus, 0x38, 0x01, &buf, 1);
+	vendor_id |=3D (buf << 8);
+	DRM_DEBUG_KMS("Vendor ID: %x\n", vendor_id);
+	via_i2c_readbytes(i2c_bus, 0x38, 0x02, &buf, 1);
+	device_id =3D buf;
+	via_i2c_readbytes(i2c_bus, 0x38, 0x03, &buf, 1);
+	device_id |=3D (buf << 8);
+	DRM_DEBUG_KMS("Device ID: %x\n", device_id);
+	via_i2c_readbytes(i2c_bus, 0x38, 0x04, &buf, 1);
+	revision =3D buf;
+	DRM_DEBUG_KMS("Revision: %x\n", revision);
+
+	if ((vendor_id !=3D 0x0001) || (device_id !=3D 0x0006)) {
+		goto exit;
+	}
+
+	device_detected =3D true;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return device_detected;
+}
+
+void via_sii164_init(struct drm_device *dev)
+{
+	struct via_connector *con;
+	struct via_encoder *enc;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!dev_priv->ext_tmds_presence) {
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
+	drm_encoder_init(dev, &enc->base, &via_sii164_drm_encoder_funcs,
+						DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_helper_add(&enc->base,
+					&via_sii164_drm_encoder_helper_funcs);
+
+	enc->base.possible_crtcs =3D BIT(1) | BIT(0);
+	enc->base.possible_clones =3D 0;
+
+	enc->i2c_bus =3D dev_priv->ext_tmds_i2c_bus;
+	enc->di_port =3D dev_priv->ext_tmds_di_port;
+
+	/* Increment the number of DVI connectors. */
+	dev_priv->number_dvi++;
+
+
+	con =3D &enc->cons[0];
+
+	drm_connector_init(dev, &con->base, &via_sii164_drm_connector_funcs,
+				DRM_MODE_CONNECTOR_DVID);
+	drm_connector_helper_add(&con->base,
+				&via_sii164_drm_connector_helper_funcs);
+	drm_connector_register(&con->base);
+
+	con->base.doublescan_allowed =3D false;
+	con->base.interlace_allowed =3D false;
+
+	con->i2c_bus =3D dev_priv->ext_tmds_i2c_bus;
+
+	INIT_LIST_HEAD(&con->props);
+	drm_connector_attach_encoder(&con->base, &enc->base);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
=2D-
2.35.1

