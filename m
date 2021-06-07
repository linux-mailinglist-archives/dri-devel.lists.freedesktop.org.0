Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BA39DE9F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 16:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3A56E8E5;
	Mon,  7 Jun 2021 14:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 326 seconds by postgrey-1.36 at gabe;
 Mon, 07 Jun 2021 10:54:34 UTC
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id C52646E039
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 10:54:34 +0000 (UTC)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ni.piap.pl (Postfix) with ESMTPSA id 55EA0444245;
 Mon,  7 Jun 2021 12:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 55EA0444245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
 t=1623062947; bh=01mB1x8HJ++TEzJg3qaGHV0NBxqQ7OkjS66gWk3FY9A=;
 h=From:To:Cc:Subject:Date:From;
 b=eY10BgvXpYP2tldrzCX6ra5whHguExSz0LleqBud49zXYL5i2eXGP3DlKTUkbE+AW
 ayehSU4xNLvWBdduT4oc4X0ZPL1FJX7YivO3iDzIt2/2pgRDmcY2qgdla0xZt5VbEk
 tEQUECQGP3SrDzM2/iOBFNVbh7e/l2I5O6EGCGZM=
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] Fix i.MX IPU-v3 offset calculations for (semi)planar U/V
 formats
Date: Mon, 07 Jun 2021 12:49:07 +0200
Message-ID: <m3y2bmq7a4.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 not scanned, whitelist
X-Mailman-Approved-At: Mon, 07 Jun 2021 14:23:15 +0000
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
Cc: lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Video captured in 1400x1050 resolution (bytesperline aka stride =3D 1408
bytes) is invalid. Fix it.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

--- a/drivers/gpu/ipu-v3/ipu-cpmem.c
+++ b/drivers/gpu/ipu-v3/ipu-cpmem.c
@@ -585,21 +585,21 @@ static const struct ipu_rgb def_bgra_16 =3D {
 	.bits_per_pixel =3D 16,
 };
=20
-#define Y_OFFSET(pix, x, y)	((x) + pix->width * (y))
-#define U_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * ((y) / 2) / 2) + (x) / 2)
-#define V_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * pix->height / 4) +	\
-				 (pix->width * ((y) / 2) / 2) + (x) / 2)
-#define U2_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * (y) / 2) + (x) / 2)
-#define V2_OFFSET(pix, x, y)	((pix->width * pix->height) +		\
-				 (pix->width * pix->height / 2) +	\
-				 (pix->width * (y) / 2) + (x) / 2)
-#define UV_OFFSET(pix, x, y)	((pix->width * pix->height) +	\
-				 (pix->width * ((y) / 2)) + (x))
-#define UV2_OFFSET(pix, x, y)	((pix->width * pix->height) +	\
-				 (pix->width * y) + (x))
+#define Y_OFFSET(pix, x, y)	((x) + pix->bytesperline * (y))
+#define U_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * ((y) / 2) / 2) + (x) / 2)
+#define V_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * pix->height / 4) + \
+				 (pix->bytesperline * ((y) / 2) / 2) + (x) / 2)
+#define U2_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * (y) / 2) + (x) / 2)
+#define V2_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * pix->height / 2) + \
+				 (pix->bytesperline * (y) / 2) + (x) / 2)
+#define UV_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * ((y) / 2)) + (x))
+#define UV2_OFFSET(pix, x, y)	((pix->bytesperline * pix->height) +	 \
+				 (pix->bytesperline * y) + (x))
=20
 #define NUM_ALPHA_CHANNELS	7
=20

--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
