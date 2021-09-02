Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF83FEFCF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 17:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F9B6E5A3;
	Thu,  2 Sep 2021 15:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1866E5A3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 15:04:43 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 182DKGFJ025318;
 Thu, 2 Sep 2021 17:04:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=xFU7L59UQKbHgNzk21dP0eFG6dpb8/xpYj0dfSaG5Vc=;
 b=vGWNBZfXa7KRkBZBCzfjkPZpsB1MT0HW3nz1Brp4Vkf65DO4YIUv7Dy8togNGp8CQFKo
 fz4rCOqiaRcZ0UhwRG1/zkzmtWLgniYiSvqlQoHe74ohV4NSMne7sA8vPpg/d319CgpO
 1CUIkVIch9C9AwfnUoy/swFhoHQlZ2tuwi/j0mv7VKOjBTxjFK3l40KpFz+NiBtaukw8
 AvM7w4ZVNqOkluvxn9ijBlyMWZi7jHpN4svbCX+hcLmXHgZgMhNFZjMAmqNRGqUdsffB
 n+G8e/Ij/4qXDX/Qs3XHKhbGt5W0AGP92Ao+NawHsxwzdR+i7nduNFCc4rAo4RuoXEph 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3attgdahjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 17:04:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1286F10002A;
 Thu,  2 Sep 2021 17:04:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E8B9E214D33;
 Thu,  2 Sep 2021 17:04:34 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 17:04:34 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Thu, 2 Sep 2021 17:04:34 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Yannick FERTRE - foss
 <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Raphael GALLAIS-POU - foss
 <raphael.gallais-pou@foss.st.com>, Raphael GALLAIS-POU
 <raphael.gallais-pou@st.com>
Subject: [PATCH] drm/panel: otm8009a: add a 60 fps mode
Thread-Topic: [PATCH] drm/panel: otm8009a: add a 60 fps mode
Thread-Index: AQHXoAvWQIlcPy1QlUOj2tqsnPmKrg==
Date: Thu, 2 Sep 2021 15:04:34 +0000
Message-ID: <20210902150351.3779-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_03,2020-04-07_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a 60 fps mode to the Orisetech OTM8009A panel.
The 50 fps mode is left as preferred.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 .../gpu/drm/panel/panel-orisetech-otm8009a.c  | 85 ++++++++++++-------
 1 file changed, 56 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu=
/drm/panel/panel-orisetech-otm8009a.c
index f80b44a8a700..dfb43b1374e7 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -60,6 +60,9 @@
 #define MCS_CMD2_ENA1	0xFF00	/* Enable Access Command2 "CMD2" */
 #define MCS_CMD2_ENA2	0xFF80	/* Enable Access Orise Command2 */
=20
+#define OTM8009A_HDISPLAY	480
+#define OTM8009A_VDISPLAY	800
+
 struct otm8009a {
 	struct device *dev;
 	struct drm_panel panel;
@@ -70,19 +73,35 @@ struct otm8009a {
 	bool enabled;
 };
=20
-static const struct drm_display_mode default_mode =3D {
-	.clock =3D 29700,
-	.hdisplay =3D 480,
-	.hsync_start =3D 480 + 98,
-	.hsync_end =3D 480 + 98 + 32,
-	.htotal =3D 480 + 98 + 32 + 98,
-	.vdisplay =3D 800,
-	.vsync_start =3D 800 + 15,
-	.vsync_end =3D 800 + 15 + 10,
-	.vtotal =3D 800 + 15 + 10 + 14,
-	.flags =3D 0,
-	.width_mm =3D 52,
-	.height_mm =3D 86,
+static const struct drm_display_mode modes[] =3D {
+	{ /* 50 Hz, preferred */
+		.clock =3D 29700,
+		.hdisplay =3D 480,
+		.hsync_start =3D 480 + 98,
+		.hsync_end =3D 480 + 98 + 32,
+		.htotal =3D 480 + 98 + 32 + 98,
+		.vdisplay =3D 800,
+		.vsync_start =3D 800 + 15,
+		.vsync_end =3D 800 + 15 + 10,
+		.vtotal =3D 800 + 15 + 10 + 14,
+		.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.width_mm =3D 52,
+		.height_mm =3D 86,
+	},
+	{ /* 60 Hz */
+		.clock =3D 33000,
+		.hdisplay =3D 480,
+		.hsync_start =3D 480 + 70,
+		.hsync_end =3D 480 + 70 + 32,
+		.htotal =3D 480 + 70 + 32 + 72,
+		.vdisplay =3D 800,
+		.vsync_start =3D 800 + 15,
+		.vsync_end =3D 800 + 15 + 10,
+		.vtotal =3D 800 + 15 + 10 + 16,
+		.flags =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.width_mm =3D 52,
+		.height_mm =3D 86,
+	},
 };
=20
 static inline struct otm8009a *panel_to_otm8009a(struct drm_panel *panel)
@@ -208,12 +227,11 @@ static int otm8009a_init_sequence(struct otm8009a *ct=
x)
 	/* Default portrait 480x800 rgb24 */
 	dcs_write_seq(ctx, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
=20
-	ret =3D mipi_dsi_dcs_set_column_address(dsi, 0,
-					      default_mode.hdisplay - 1);
+	ret =3D mipi_dsi_dcs_set_column_address(dsi, 0, OTM8009A_HDISPLAY - 1);
 	if (ret)
 		return ret;
=20
-	ret =3D mipi_dsi_dcs_set_page_address(dsi, 0, default_mode.vdisplay - 1);
+	ret =3D mipi_dsi_dcs_set_page_address(dsi, 0, OTM8009A_VDISPLAY - 1);
 	if (ret)
 		return ret;
=20
@@ -337,24 +355,33 @@ static int otm8009a_get_modes(struct drm_panel *panel=
,
 			      struct drm_connector *connector)
 {
 	struct drm_display_mode *mode;
-
-	mode =3D drm_mode_duplicate(connector->dev, &default_mode);
-	if (!mode) {
-		dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
-			default_mode.hdisplay, default_mode.vdisplay,
-			drm_mode_vrefresh(&default_mode));
-		return -ENOMEM;
+	unsigned int num_modes =3D ARRAY_SIZE(modes);
+	unsigned int i;
+
+	for (i =3D 0; i < num_modes; i++) {
+		mode =3D drm_mode_duplicate(connector->dev, &modes[i]);
+		if (!mode) {
+			dev_err(panel->dev, "failed to add mode %ux%u@%u\n",
+				modes[i].hdisplay,
+				modes[i].vdisplay,
+				drm_mode_vrefresh(&modes[i]));
+			return -ENOMEM;
+		}
+
+		mode->type =3D DRM_MODE_TYPE_DRIVER;
+
+		/* Setting first mode as preferred */
+		if (!i)
+			mode->type |=3D  DRM_MODE_TYPE_PREFERRED;
+
+		drm_mode_set_name(mode);
+		drm_mode_probed_add(connector, mode);
 	}
=20
-	drm_mode_set_name(mode);
-
-	mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_probed_add(connector, mode);
-
 	connector->display_info.width_mm =3D mode->width_mm;
 	connector->display_info.height_mm =3D mode->height_mm;
=20
-	return 1;
+	return num_modes;
 }
=20
 static const struct drm_panel_funcs otm8009a_drm_funcs =3D {
--=20
2.17.1
