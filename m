Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE03BE4AE
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763AF6E84A;
	Wed,  7 Jul 2021 08:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5916E84A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:49:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1678anIb000467; Wed, 7 Jul 2021 10:48:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=selector1;
 bh=+UHKiuimh8eGcdGlwiV/tjsefnaHThxouA+MIurBhCk=;
 b=xXLhM1iuO/fkOho6EetbmJpYk9bWVj+574460Ba99eAcXuZI2zDjrKzD6hrMeP9OAcII
 mys7N2c3np3okzuFPasf1LZUBXsJwc6jTqPTCH0b+ox+WNT0Vaf7wycAlbIDCRPCJjQ4
 ytAXwIm5VXf3bFrEquoE9SRauDCx/ZpQH5sOLarVZ48BxXBINaBwwOkmLLJtixedjvd6
 DMypjp0wUBu50BeOu5QVDSBtaUUNSEwRCejtOp6rkJQQCMtcbNjKjf4Y3Hks+SUdaBe2
 aBgOTUQjxkKFCFbZVA+JtH8m4syotz95wWSr9WGk3iTV6EwJj7V9BIa8J9cUokGCi31s Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39mxgxjw08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 10:48:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAAC510002A;
 Wed,  7 Jul 2021 10:48:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1B462171D3;
 Wed,  7 Jul 2021 10:48:55 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 10:48:55 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Wed, 7 Jul 2021 10:48:55 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Yannick FERTRE - foss
 <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Matt Roper
 <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/2] drm/stm: ltdc: add crtc background color property support
Thread-Topic: [PATCH 2/2] drm/stm: ltdc: add crtc background color property
 support
Thread-Index: AQHXcwzrULWoh8jFv0qA90zmnYXzxA==
Date: Wed, 7 Jul 2021 08:48:55 +0000
Message-ID: <20210707084557.22443-3-raphael.gallais-pou@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_05:2021-07-06,
 2021-07-07 signatures=0
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
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch comes from the need to display small resolution pictures with
very few DDR usage. In practice, using a background color, produced by the
drm CRTC, around this picture allows to fetch less data in memory than
setting a full frame picture. And therefore the picture in DDR is smaller
than the size of the screen.

It uses the DRM framework background color property and modifies the
color to any value between 0x000000 and 0xFFFFFF from userland with a
RGB24 value (0x00RRGGBB).

Using this feature is observable only if layers are not full screen
or if layers use color formats with alpha and are "transparent" at
least on some pixels.

Depending on the hardware version, the background color can not be
properly displayed with non-alpha color formats derived from native
alpha color formats (such as XR24 or XR15) since the use of this
pixel format generates a non transparent layer. As a workaround,
the stage background color of the layer and the general background
color need to be synced.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 1f9392fb58e1..0aca245288cc 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -196,6 +196,11 @@
=20
 #define NB_PF		8		/* Max nb of HW pixel format */
=20
+#define DRM_ARGB_TO_LTDC_RGB24(bgcolor) \
+	((u32)(DRM_ARGB_RED(bgcolor, 8) << 16	\
+	| DRM_ARGB_GREEN(bgcolor, 8) << 8	\
+	| DRM_ARGB_BLUE(bgcolor, 8)))
+
 enum ltdc_pix_fmt {
 	PF_NONE,
 	/* RGB formats */
@@ -364,6 +369,15 @@ static inline u32 get_pixelformat_without_alpha(u32 dr=
m)
 	}
 }
=20
+/*
+ * All non-alpha color formats derived from native alpha color formats are
+ * either characterized by a FourCC format code (such as XR24, RX24, BX24.=
..)
+ */
+static inline u32 is_xrgb(u32 drm)
+{
+	return ((drm & 'X') =3D=3D 'X' || (drm & ('X' << 8)) =3D=3D ('X' << 8));
+}
+
 static irqreturn_t ltdc_irq_thread(int irq, void *arg)
 {
 	struct drm_device *ddev =3D arg;
@@ -431,7 +445,8 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *cr=
tc,
 	pm_runtime_get_sync(ddev->dev);
=20
 	/* Sets the background color value */
-	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
+	reg_write(ldev->regs, LTDC_BCCR,
+		  DRM_ARGB_TO_LTDC_RGB24(crtc->state->bgcolor));
=20
 	/* Enable IRQ */
 	reg_set(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
@@ -452,6 +467,9 @@ static void ltdc_crtc_atomic_disable(struct drm_crtc *c=
rtc,
=20
 	drm_crtc_vblank_off(crtc);
=20
+	/* Reset background color */
+	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
+
 	/* disable IRQ */
 	reg_clear(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
=20
@@ -790,6 +808,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *=
plane,
 	u32 y1 =3D newstate->crtc_y + newstate->crtc_h - 1;
 	u32 src_x, src_y, src_w, src_h;
 	u32 val, pitch_in_bytes, line_length, paddr, ahbp, avbp, bpcr;
+	u32 bgcolor =3D DRM_ARGB_TO_LTDC_RGB24(newstate->crtc->state->bgcolor);
 	enum ltdc_pix_fmt pf;
=20
 	if (!newstate->crtc || !fb) {
@@ -853,10 +872,28 @@ static void ltdc_plane_atomic_update(struct drm_plane=
 *plane,
 	if (!fb->format->has_alpha)
 		val =3D BF1_CA | BF2_1CA;
=20
-	/* Manage hw-specific capabilities */
-	if (ldev->caps.non_alpha_only_l1 &&
-	    plane->type !=3D DRM_PLANE_TYPE_PRIMARY)
-		val =3D BF1_PAXCA | BF2_1PAXCA;
+	/*
+	 * Manage hw-specific capabilities
+	 *
+	 * Depending on the hardware version, the background color can not be
+	 * properly displayed with non-alpha color formats derived from native
+	 * alpha color formats (such as XR24 or XR15) since the use of this
+	 * pixel format generates a non transparent layer. As a workaround,
+	 * the stage background color of the layer and the general background
+	 * color need to be synced.
+	 *
+	 * This is done by activating for all XRGB color format the default
+	 * color as the background color and then setting blending factor
+	 * accordingly.
+	 */
+	if (ldev->caps.non_alpha_only_l1) {
+		if (is_xrgb(fb->format->format)) {
+			val =3D BF1_CA | BF2_1CA;
+			reg_write(ldev->regs, LTDC_L1DCCR + lofs, bgcolor);
+		} else {
+			val =3D BF1_PAXCA | BF2_1PAXCA;
+		}
+	}
=20
 	reg_update_bits(ldev->regs, LTDC_L1BFCR + lofs,
 			LXBFCR_BF2 | LXBFCR_BF1, val);
@@ -1033,6 +1070,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, st=
ruct drm_crtc *crtc)
=20
 	drm_crtc_helper_add(crtc, &ltdc_crtc_helper_funcs);
=20
+	drm_crtc_add_bgcolor_property(crtc);
 	drm_mode_crtc_set_gamma_size(crtc, CLUT_SIZE);
 	drm_crtc_enable_color_mgmt(crtc, 0, false, CLUT_SIZE);
=20
--=20
2.17.1
