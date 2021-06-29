Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7DC3B72E2
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 15:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6590F6E890;
	Tue, 29 Jun 2021 13:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3844 seconds by postgrey-1.36 at gabe;
 Tue, 29 Jun 2021 13:02:34 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C866E890
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 13:02:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TBmjl9008436; Tue, 29 Jun 2021 13:58:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=906FZGpYwh0Yc5aE+vSBBWEeesUdzLB4RDvgOuUwap4=;
 b=ExqnUGWDdYRkGex/9BjsbC9mY6ZrU3C9CsoY+JwwqczJ4kY+SRiOAtFC8sfWJMvzoirJ
 6Cf7JA/hwdWSvgpaD5tc9SFajv+yp76sTjjuxeb3dcGj/DtcuCL3BVM8VO9qdJ6W8z2P
 pmRQYQarIJcKH1v4p1hMRkPdj5KQkoS2zUJQ2XiXpc8BuWlNjGKvRv+4uzhSVs9RwtfB
 zhqjudGxA5xvg0/1ihRXvEQb9ppnDN4U0LHsRcGGqN0Bl3d2ASCKYj1V/rn4KeYNznbe
 Gc7JZ3epg50Hab5J97V+mazRQ4Z7ee/z3HbE7rXfmMKRiSeBloVYja0o8QKqg0tXWShx 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39fueajw5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Jun 2021 13:58:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F192D100034;
 Tue, 29 Jun 2021 13:58:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CAAB52291A3;
 Tue, 29 Jun 2021 13:58:19 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 29 Jun
 2021 13:58:19 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Tue, 29 Jun 2021 13:58:19 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
Thread-Topic: [PATCH] drm/stm: ltdc: improve pm_runtime to stop clocks
Thread-Index: AQHXbN4NPtwAtoP5gkmmR0xGN01wUg==
Date: Tue, 29 Jun 2021 11:58:19 +0000
Message-ID: <20210629115709.16145-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_06:2021-06-28,
 2021-06-29 signatures=0
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
Cc: Yannick FERTRE <yannick.fertre@st.com>, Marek Vasut <marex@denx.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, Raphael GALLAIS-POU -
 foss <raphael.gallais-pou@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bugzilla ticket: https://intbugzilla.st.com/show_bug.cgi?id=3D60620
Gerrit patch: https://gerrit.st.com/c/mpu/oe/st/linux-stm32/+/208093/

In the LTDC driver, pm_runtime_get_sync was wrongly used and caused the
LTDC pixel clock to be systematically enabled in the clock summary.

After one simple use of the LTDC by activating and deactivating,
the clock summary results as below:

~# cat /sys/kernel/debug/clk/clk_summary | grep ltdc
        ltdc_px               1        1        0    29700000          0   =
  0  50000         N
              ltdc            0        0        0   133250000          0   =
  0  50000         N

By doing so, pm_runtime_get_sync only increments the clock counter when
the driver was in not active, displaying the right information when the
LTDC is not in use, resulting of the below clock summary after deactivation
of the LTDC.

~# cat /sys/kernel/debug/clk/clk_summary | grep ltdc
        ltdc_px               0        0        0    29700000          0   =
  0  50000         N
              ltdc            0        0        0   133250000          0   =
  0  50000         N

The clocks are activated either by the crtc_set_nofb function or
by the crtc_atomic_enable function. A check of pm_runtime activity must
be done before set clocks on. This check must also be done for others
functions which access registers.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 08b71248044d..bf9d18023698 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -425,10 +425,17 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *=
crtc,
 {
 	struct ltdc_device *ldev =3D crtc_to_ltdc(crtc);
 	struct drm_device *ddev =3D crtc->dev;
+	int ret;
=20
 	DRM_DEBUG_DRIVER("\n");
=20
-	pm_runtime_get_sync(ddev->dev);
+	if (!pm_runtime_active(ddev->dev)) {
+		ret =3D pm_runtime_get_sync(ddev->dev);
+		if (ret) {
+			DRM_ERROR("Failed to set mode, cannot get sync\n");
+			return;
+		}
+	}
=20
 	/* Sets the background color value */
 	reg_write(ldev->regs, LTDC_BCCR, BCCR_BCBLACK);
@@ -783,6 +790,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *=
plane,
 	struct drm_plane_state *newstate =3D drm_atomic_get_new_plane_state(state=
,
 									  plane);
 	struct drm_framebuffer *fb =3D newstate->fb;
+	struct drm_device *ddev =3D plane->dev;
 	u32 lofs =3D plane->index * LAY_OFS;
 	u32 x0 =3D newstate->crtc_x;
 	u32 x1 =3D newstate->crtc_x + newstate->crtc_w - 1;
@@ -792,6 +800,11 @@ static void ltdc_plane_atomic_update(struct drm_plane =
*plane,
 	u32 val, pitch_in_bytes, line_length, paddr, ahbp, avbp, bpcr;
 	enum ltdc_pix_fmt pf;
=20
+	if (!pm_runtime_active(ddev->dev)) {
+		DRM_DEBUG_DRIVER("crtc not activated");
+		return;
+	}
+
 	if (!newstate->crtc || !fb) {
 		DRM_DEBUG_DRIVER("fb or crtc NULL");
 		return;
@@ -897,8 +910,14 @@ static void ltdc_plane_atomic_disable(struct drm_plane=
 *plane,
 	struct drm_plane_state *oldstate =3D drm_atomic_get_old_plane_state(state=
,
 									  plane);
 	struct ltdc_device *ldev =3D plane_to_ltdc(plane);
+	struct drm_device *ddev =3D plane->dev;
 	u32 lofs =3D plane->index * LAY_OFS;
=20
+	if (!pm_runtime_active(ddev->dev)) {
+		DRM_DEBUG_DRIVER("crtc already deactivated");
+		return;
+	}
+
 	/* disable layer */
 	reg_clear(ldev->regs, LTDC_L1CR + lofs, LXCR_LEN);
=20
--=20
2.24.3
