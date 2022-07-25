Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBA58087C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B87910F6BF;
	Mon, 25 Jul 2022 23:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FB910F5AE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793185;
 bh=G9htkNkdYJUJUQsFFCM1RAZXiMehBnGZ06STBkCaNeI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Z0CjZ84l5R7O/p6Cu69TzxTmhcncOzqKjthKoIzSJa4cCv6hbOJX6SaUwqNzSqCXk
 7OdGh99Or6Pf6mHFxbo+Z9ydQ+kOJvs/ujLfJEdWY+HiWCPoWf3750522jDZscKvZy
 grXWx+B/guiQ9rHHqhf7W4k7Vds7eF13QX5ZJb9o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx005 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MryT9-1nk4OA3vOP-00o16j; Tue, 26 Jul 2022 01:53:04 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/32] drm/via: Add via_display.c
Date: Mon, 25 Jul 2022 16:51:06 -0700
Message-Id: <20220725235127.20433-12-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235127.20433-1-kevinbrace@gmx.com>
References: <20220725235127.20433-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N5hCeSVWb53FqyMA3KAs3k83lU5ebaTtd0c/np490l/B3/syIve
 WywcW/2cbH2IFPI9OBaUuUzpKmAw/LD4D1qHkJ+qErNRYFasjzR+uSRIZd/FcRdeKw+gWRp
 GgPbbDQQZH0Z14mas7+ooKX+gIYjId4HgYSamo44ofb2zER9FpyhtkKKobT/iMla3JrT75Q
 4kLGPM7CYZnkmJ1ww97Zw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ItR3T7PlA7g=:AH75+Qf42WLRq1sBq/V9VH
 HS9wlZ6ncMDjd3sIAMoP1ZW0otehzfd56LIXr9QrVWeaVjb+ivGJGDKoBqGYZ5VUGJGRFsgBC
 6Wc0XjZg8T8coLvfh5lRUVqFMhfwpnlquk1UaKXqf+sqjwE9IxlnwTu6Gq32tpKHmeQR+PfAP
 wkWxHiNuEoW3LLm3mWuwfbNtweJT/raULo3fNBlkxqVkAOHhZ9FLITfGTm3TEVLOLrqZCEalg
 AnYzLWSMrahnnwdWyyjn6vZaHglD/4HZC9sEedXBC+KviEximp9CuATuYq02WHscRRxvH0H0k
 aCnhYwOnt20KdHKRjMhVoNE9p0kHc4zfHesJF0qyDGFNfT8PEGn560sXzsSIwT0GeF2O8pQpB
 i9JeUNbQ8ymp8CdcKxru3PW6w4EdH89mMEl5r044CN8/OCObIJf6GFNuRM/D/hUcPTiV5+X+L
 2wor8I1UGyZI80uB9gwJx9BQP36qWGUzA0EUnDCRMKs/Dedz6VEyYY9GvJPKYAQggeFP1luCy
 bf22qxxMHo2hhekr5QQDvHKCN7ve0kXoBI2Doa/XsxPyZ6FuyKXGG9RUYIOPZTewW5R1/4vV2
 uYlFESV3H+xY8xyry5DJZ4LmSCcFmaUiDoCvO3AsbRtwIzYNiQ5b7uiFrf2IWOSWAolgmYNGC
 GwpI5ThxS7WUmiYQe9PiMF4G+2XblTpY93PJh08CihBR+qJE9TyNgfvrzemihRUhe/CPmW7En
 oCc8U2BDfTczGr50Cumokpq/m8xjP6f+cKfl0nAE84EqAn2d1+IYsIP1up3r1WvrN98aNJoRU
 dG2ABgzrL8HxkdtTYESQoT0Tum5OXBgmIKtTOYRa3Tar9p2YugLIJnopRMy5AQjfRBXJdQ3n6
 SEKKEW9z2SkYcdE/BOOg4yymJrx5I8CEh6BYMvtcDgO3tIF/QlnGAAMSVonUeLT81SVHtaQPW
 ZqNmVMoxD7zlbmb3M5N3ZSSWOSma/l/tXnlQQkdm/0aaVqjfOfSBriwDiKnNVCzjz+xgsywhi
 aK2DdpQdXCko1lHXtfkCprLysWETWfyk26UCqSQvnAfMW4EHOk27g46+HkAmzW9Bv6I3szsTZ
 Mm6vFaAyx9qsTO+Jphp/ro2MOrObKWJ0ahkVTf0rtyd3hmq6IAkODOadg==
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
index 000000000000..76bcfa470657
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
+	case PCI_DEVICE_ID_VIA_CHROME9_HD:
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

