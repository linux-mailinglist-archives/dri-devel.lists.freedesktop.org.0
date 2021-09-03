Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E43FFC7B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 10:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926096E860;
	Fri,  3 Sep 2021 08:59:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE336E860
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 08:59:03 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1833290T018635;
 Fri, 3 Sep 2021 10:59:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=qM6nfM/EQ+UgFxZBd6dlp2Ha4xEUW6TRbVAtokg2X2s=;
 b=ePQj1vC88JM3ZPaQCo5XCFZhPkzgjogostt1fubgdPRjB54rqvt4jnAV6ejilLbTNhH3
 sd8rxWuMFqM93Js48u/g0okGewme5rgmW4Zfos21RPDpBLqnaDv6zm2mzfwb8o23rQu0
 P+OF/4IRAJNFT6MGpgWR9lNm7M2ZANOEAM9lKrs/9SwT19kdzsZKM8qoUhvwA4JCAduF
 c3mBfJk1pwtIlXHMvNhkvwjl+8OJSq49fr4ZyiivJDBkjAl0MDuifxFJiAoPp1RUeBOI
 5fo5EeY0s343/NiljZ+Z5Vo6U+4AfizwVOVCw/AzlQsaAszdoQEle1rROgFAFHVLUM9u kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3aubessvup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:59:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A92B410002A;
 Fri,  3 Sep 2021 10:58:57 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A9752171FD;
 Fri,  3 Sep 2021 10:58:57 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 10:58:56 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Fri, 3 Sep 2021 10:58:56 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE - foss
 <alexandre.torgue@foss.st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Raphael GALLAIS-POU - foss
 <raphael.gallais-pou@foss.st.com>, Raphael GALLAIS-POU
 <raphael.gallais-pou@st.com>
Subject: [PATCH] drm/stm: ltdc: add layer alpha support
Thread-Topic: [PATCH] drm/stm: ltdc: add layer alpha support
Thread-Index: AQHXoKHtnlZSU/d2YES0y3Gmjn+IKg==
Date: Fri, 3 Sep 2021 08:58:56 +0000
Message-ID: <20210903085740.23108-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_02,2021-09-03_01,2020-04-07_01
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

Android Hardware Composer supports alpha values applied to layers.
Enabling non-opaque layers for the STM CRTC could help offload GPU
resources for screen composition.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 195de30eb90c..e0fef8bacfa8 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -845,7 +845,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *=
plane,
 			LXCFBLR_CFBLL | LXCFBLR_CFBP, val);
=20
 	/* Specifies the constant alpha value */
-	val =3D CONSTA_MAX;
+	val =3D newstate->alpha >> 8;
 	reg_update_bits(ldev->regs, LTDC_L1CACR + lofs, LXCACR_CONSTA, val);
=20
 	/* Specifies the blending factors */
@@ -997,6 +997,8 @@ static struct drm_plane *ltdc_plane_create(struct drm_d=
evice *ddev,
=20
 	drm_plane_helper_add(plane, &ltdc_plane_helper_funcs);
=20
+	drm_plane_create_alpha_property(plane);
+
 	DRM_DEBUG_DRIVER("plane:%d created\n", plane->base.id);
=20
 	return plane;
--=20
2.17.1
