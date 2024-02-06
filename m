Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774CF84BE4F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 20:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D99E10E600;
	Tue,  6 Feb 2024 19:48:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="vCr5IEp2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D5E10E600
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1707248908; x=1707853708; i=markus.elfring@web.de;
 bh=TfpesP/AZW41HCfZbpHnSRcb/C7+p2CjtMFaZ4ZZO2w=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
 In-Reply-To;
 b=vCr5IEp2aw5KLecxKr0fALUu/xGboJnWBOjMxZlTf4eK5sS7XnprB+6cTbKsUFNV
 OFXDJkZPBjDUEjDjYutRdYwzOQHje2Q+2X3abbSdflS1zEc5BZTidYGOz7s5PXnxc
 9UQ2/GSZA88uoQ5vh090YLrPgfdnylHnTC1sq857T2atTcceFZa359wHXXwyD1SCI
 W9TFLwoTd5VJLZXrfQcu/oL1KXNhK4OqkSDBqHxbEl82sVwE0b25C6ci7Notilrp5
 99DJh8j4D8+XEML11gSwQOHrxb2hVPi8a/zhxBK8P8OARD/CJIFata4aMSj0dCqO2
 ig9GEjAp01YoIqYHMA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7QQD-1qxO9R2FO1-017nHR; Tue, 06
 Feb 2024 20:48:28 +0100
Message-ID: <c9ce8ffc-47c0-4b3f-8b78-8af8dc37daa6@web.de>
Date: Tue, 6 Feb 2024 20:48:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] drm/arcpgu: Use devm_platform_ioremap_resource() in
 arcpgu_load()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Alexey Brodkin <abrodkin@synopsys.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <e1458683-1270-4b9f-afdb-2f0112d66245@web.de>
In-Reply-To: <e1458683-1270-4b9f-afdb-2f0112d66245@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lH1fgfEmzWoGCBo8oKvAUzLdOlk3bd42rgskWH1LYjnIhFT+ctA
 2NmZ8TzLrxFv/RFpjq2cKH41YnyLjI9bdoZoep2M3zLSqBRZtAi4ExTTTuP7clK2INqdfYC
 fCBeLdN81NYOJkTtovZmgxutx4NExjvKkn+my8gm5oonCGK2M4WgKx1dPv4Q+T5hsoKxECd
 U99SKeqSSpPf+aPV4HwXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lzbU50BXG5E=;+Xk9vVmiF9Vubxr9SXxI8LyZtpk
 JZSryKi9J+kgi+jDon9Zw4u0O30cgt4PNqtredAyp//G2ufuuB2aAl53aJvVLMjLLfnqCf4iS
 lFjCeoLfZX0efdR8KkC2oAfTOQGK/3F02YdC8mI3aBu5Q4qEh1V9h6v6QDrOfw716Y7I04kwG
 Ue+DzSvIXAwlLVDB/W/jTizbQhqcTn4mMS9gDcF6gqHMEgeW6nfq7vRn9UjV3wPmG/Ft7cedX
 nyis9/wpFozvVtNNNN27Vz8/aT1DQrirSBt6yFdqDCmcXu1nkQlDuphC4h5ONZ4cBMG9YybhO
 lKt7DJ+Lv4xElu9ylvIWYcFzbZsSuMwehIvoeC3QjZaEl2fQT17mm5frHJ4WOLWelSAtAmuSq
 aRhliIw6+2fl9vZlX4wZRJsaknjnyBendTDT4JOJuSTJSEUWZH03yN0qZ54uoXs45sB9gHGFh
 C3zURu9bfKR+ygxSlpur1Scnnpatk/27ne0HuPKSKigNZr96zoPORaTTf/pMNZbYkFA65+sWz
 +pa5H9rHvTzdGJ5vct0RZtO3O7lEkG9DA51th8sHdh2FE3LSiMx79bL2kkapY+ACrKHO9F70d
 sOX+kfX4naLBbQR/LfR5e9Az5pX1ZFxynCyUIeL2kNwmvsA4lNo8FuVRuBD/X386T3MFy6ZsJ
 sohXX+ZRCdfEf7r3gTHtU/icBG+g0UmO64Z30eV7LK2PGiABmCDl7Ik8ZsNvwFekpAOkcYp2u
 Z+bKuV0113tW9ECeSV2jO3zA8sh4cBifgNV1jGQElGJy/SpkDhR6mnC2qwxUPm9Ysb8goYX55
 dV0Jk61Ef8tLg7UrVhK59rDvAlbzkl7pwEeXfJ0FPhNRs=
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2024 20:43:10 +0100

A wrapper function is available since the commit 7945f929f1a77a1c8887a97ca=
07f87626858ff42
("drivers: provide devm_platform_ioremap_resource()").

* Thus reuse existing functionality instead of keeping duplicate source co=
de.

* Delete a local variable which became unnecessary with this refactoring.


This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

v2:
The transformation pattern was adjusted based on advices by known contribu=
tors.

Examples:
* Douglas Anderson
* Geert Uytterhoeven
* Robin Murphy


 drivers/gpu/drm/tiny/arcpgu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 4f8f3172379e..231173138f5e 100644
=2D-- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -251,7 +251,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcp=
gu)
 	struct device_node *encoder_node =3D NULL, *endpoint_node =3D NULL;
 	struct drm_connector *connector =3D NULL;
 	struct drm_device *drm =3D &arcpgu->drm;
-	struct resource *res;
 	int ret;

 	arcpgu->clk =3D devm_clk_get(drm->dev, "pxlclk");
@@ -268,8 +267,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcp=
gu)
 	drm->mode_config.max_height =3D 1080;
 	drm->mode_config.funcs =3D &arcpgu_drm_modecfg_funcs;

-	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	arcpgu->regs =3D devm_ioremap_resource(&pdev->dev, res);
+	arcpgu->regs =3D devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(arcpgu->regs))
 		return PTR_ERR(arcpgu->regs);

=2D-
2.43.0

