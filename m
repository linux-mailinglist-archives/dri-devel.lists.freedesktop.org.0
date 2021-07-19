Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004393CD1B1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FC789F2E;
	Mon, 19 Jul 2021 10:17:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 495 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jul 2021 10:17:27 UTC
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6652489F4A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:17:27 +0000 (UTC)
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
 by ni.piap.pl (Postfix) with ESMTPSA id BDD7AC3F2A56;
 Mon, 19 Jul 2021 12:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl BDD7AC3F2A56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
 t=1626689347; bh=01mB1x8HJ++TEzJg3qaGHV0NBxqQ7OkjS66gWk3FY9A=;
 h=From:To:Cc:Subject:Date:From;
 b=Qy5bP186NuBdNbqAiq8FcobohGLbP2uh8fyuubJHJy9KGmx1cs2cE1vdulZFCJyQK
 7k5Ri4TT2SoTgDP+Vk3JshB8qAunpgS9bfwjcfShwMYcWDDRJ+Y0eMgDs8EEiieIkg
 DEMXDS19tpKH3jGhpeD2yRKQR4QvajnKMBqF9LKI=
From: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH REPOST] Fix i.MX IPU-v3 offset calculations for (semi)planar
 U/V formats
Date: Mon, 19 Jul 2021 12:09:06 +0200
Message-ID: <m3h7gqehtp.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165078 [Jul 19 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 448 448
 71fb1b37213ce9a885768d4012c46ac449c77b17, {Tracking_from_exist},
 {Tracking_from_domain_doesnt_match_to},
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; t19.piap.pl:7.1.1;
 127.0.0.199:7.1.2; piap.pl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/19 09:19:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30,
 bases: 2021/07/19 04:09:00 #16925305
X-KLMS-AntiVirus-Status: Clean, skipped
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
