Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04ED55A29D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081BE10F243;
	Fri, 24 Jun 2022 20:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA2F10F243
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102483;
 bh=6Te8ZbTcfQX1nsID2hSVBb/vZZrbuGEUVVlfrQfFfXI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fWuHNKJMwOHCuwayOuOO0bAxNIhZEdXfEA+aInsD3kIx5pj06XGoLKBsYk6ZtgqPJ
 Y4ShSk0RQC/lnDd0p+mpEcs/ylT+0/i7ua7uKijT77JOBzKdYWIK65QZarVdJouGhY
 mu+kC28P0FzA9ovmF7hzLI/sPXx/h8lgSa8yYWOE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MZCfD-1o9b820tRB-00VBVr; Fri, 24 Jun 2022 22:28:03 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/28] drm/via: Add via_display.c
Date: Fri, 24 Jun 2022 15:26:15 -0500
Message-Id: <20220624202633.3978-11-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624202633.3978-1-kevinbrace@gmx.com>
References: <20220624202633.3978-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gXctsMLB7y/8mxrEPtyqKzuPrrQPRIvHbpHSIlUJJXPnncbvG/q
 9gd5azKbd1xqwj8RaKDZH2LFbPr0s4w2AW9bBGF3Cgsm10bRV6l4OKfK3Iydmn25ReFqBg2
 dYixgltGy9bhLtjNt2FEMbrSI8PKyuV8bGdeGU7n/oWo3+zItCmso3FHeKnPQVWSirzzpuY
 SIjMRcjGOLkwf28sEMBTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5XaWe3wORnY=:Z6sEUztDSVguBwH6AMEmfN
 itJUETFP/ZaXSZYiIkoDYzSyMdw6n/bE39aTdRjdU6GGrRBqgXdsJrkcBiSSTLb5GxoxPQE6o
 OsyFcOGg7sx7QxVsdCdOaBPXyJoBJOTXixyren6ciZAoY2VRe61J81YWSkN48Kvr3E71Wd35N
 lKkck+h8xA40EXvYesb/ch3oKEvnU/qKlzqnGwJ/5WmKV7T0j8T/OBIaFw5e3JP5kvACfNTHK
 q/Jrk2a6xVI3oYyWttCagoqBS1MlQy/m+w5g5PlYU5o8jGwI73ytaodl6k/j5L9SKA95iAUh9
 8cxrtuIr4Ll6tl+XFu+EXjPVYyxerOVrRgXyaKm05GY/kebPTMPPIjuX1ZHC/8i9lJoIucp1C
 cphMr6jBVBmKTa64Z22Ir4erkJvSbVmcUgUAefRuaYBaUH7dbsdJ+aDR+30WFcjkHwFE1bRhv
 rOTijXEIjTvDreQvFKmnoIFM9Hu78EjnFMaiKo1xPvnBoLyZAMTgIlLkXgwt6i0RO4z0HCoWn
 rRnOCSkpv1TRBbBrIwdc0oV1Kz8l5r9WjsgF34uXsx0O6QH1nZ4QcxnmvRfzULxe0k2+K3LpV
 qap23M4BQ3v7rjClB+ynY1Rpm/87mij/yeNjXFQ4C2teGLPlfDWkvytYvNrBgcqpI654CzTrl
 txyn+YJRTyLNIStx1HjjOPlXQhoS4dD4i38DQTBunZVQ7sVa4XZ0l47kYR4fmHTm9ngPPYKDw
 TBVHXgRebMlAQqa82oQ568AOg8uO09MjLXSgkf2Qxik55ClFm7WgA6OctChdpvVtnB1gZbkww
 wvS1vlU8e4NypJ8nKZpw2O1gKaaJqoUVOiA4el4plRXiJn9PAOBHam+Io0NUBCRPIMwhuFY2B
 BdGOayVTLTxPXj3LJG68oDbGSwYxl0IEQm6qR/kkQBwYGgNUOve0U7fCUeffe/EyVFK1LQ5fn
 5USN4dLzoI5PiSEXPogbJ8nyl17j2elxm98A+RsR2soXfB7E81BBNQemtuqY3PKaIq98pLmRV
 /rivVYM37WjiQ1aaHM1G07vKJWTmnxVoADdjzvn22g6EPYMycS2CupMM9RvcHW76CUoespoS4
 vE0CNlo+wa0C1jPu68f7UCfBgnfvGNEySXij4gJ+HGpXZKmsmCDs/k3eQ==
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
 drivers/gpu/drm/via/via_display.c | 125 ++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_display.c

diff --git a/drivers/gpu/drm/via/via_display.c b/drivers/gpu/drm/via/via_d=
isplay.c
new file mode 100644
index 000000000000..2f82764038c0
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_display.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright =C2=A9 2017-2020 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
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
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+void via_encoder_cleanup(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder, struct via_encoder, ba=
se);
+
+	drm_encoder_cleanup(encoder);
+	kfree(enc);
+}
+
+void via_connector_destroy(struct drm_connector *connector)
+{
+	struct via_connector *con =3D container_of(connector, struct via_connect=
or, base);
+	struct drm_property *property, *tmp;
+
+	list_for_each_entry_safe(property, tmp, &con->props, head)
+		drm_property_destroy(connector->dev, property);
+	list_del(&con->props);
+
+	drm_connector_update_edid_property(connector, NULL);
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+int via_modeset_init(struct drm_device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	uint32_t i;
+	int ret =3D 0;
+
+	via_mode_config_init(dev_priv);
+
+	/* Initialize the number of display connectors. */
+	dev_priv->number_fp =3D 0;
+	dev_priv->number_dvi =3D 0;
+
+	via_i2c_reg_init(dev_priv);
+	ret =3D via_i2c_init(dev);
+	if (ret) {
+		DRM_ERROR("Failed to initialize I2C bus!\n");
+		goto exit;
+	}
+
+	for (i =3D 0; i < VIA_MAX_CRTC; i++) {
+		ret =3D via_crtc_init(dev_priv, i);
+		if (ret) {
+			goto exit;
+		}
+	}
+
+	via_ext_dvi_probe(dev);
+	via_tmds_probe(dev);
+
+	via_lvds_probe(dev);
+
+	via_dac_probe(dev);
+
+
+	via_ext_dvi_init(dev);
+	via_tmds_init(dev);
+
+	via_dac_init(dev);
+
+	via_lvds_init(dev);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		via_hdmi_init(dev, VIA_DI_PORT_NONE);
+		break;
+	default:
+		break;
+	}
+
+	drm_mode_config_reset(dev);
+
+	drm_kms_helper_poll_init(dev);
+exit:
+	return ret;
+}
+
+void via_modeset_fini(struct drm_device *dev)
+{
+	drm_kms_helper_poll_fini(dev);
+
+	drm_helper_force_disable_all(dev);
+
+	drm_mode_config_cleanup(dev);
+
+	via_i2c_exit();
+}
=2D-
2.35.1

