Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CE294BD19
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BCB10E6F8;
	Thu,  8 Aug 2024 12:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="PFHzse5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2034.outbound.protection.outlook.com [40.92.103.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3C110E6F8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:12:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0fbKWgUH4jIJJrp9hTB0CKbpQJ2Kll48TZrocYNppn45pzKGr1nR6erEW3RIC4Z9iIb9HCTW09TjbeFf4dvGIDGZ38G2p9idTzzVQ4DWMVxydwDGImgPHbhyubUoPjv4zdb1G1oW92GNRaACP2huA20L21shk+007GVPDaKBODcTuRBdVUmnlfuMPCiGquZfrglVLSP6BdAp6Z9dTkqz0bHoCMwe3nN1u1XGaLMnOh44cf+Gak0QvZfZEMpmUm/v786g6/34Ha00BeZPVMX2t8fuGbaTTqi7S3nFWhJ4er1l2iVOnoRPd0z4HzbRL9bM57FUiqMdIOgM+1pmcvujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRg9eJxDc4ARlekO+g7uV6lPG0TkCEJFMy6dAol1E7M=;
 b=AfY4XZMQwrpnR6dmgb9FptthYjO5NV3WJAltlG8Om9Sb50+ClXWxPbtwNIVAOyqlp3bqbsdNBDXu4Z/Nk6X/oTV2w61U2sTAqT/Jyuo73jdwWHVthnqNRo9h7pssv3WBHGqYXLLzdnuSyC75ATb8VRl1VwnQS2poMFh3YHFMqsSbwIC+igCgKrUej7RRqYdcvmvLATlvKK0GiHoVrYmPB9tZmAoqw9bX7bMpT2zRpZx39/pSrScAut5+gOGu3UIDCMPQYKy4sR1ka44r9Sb0V+kxyJQtJGzVXdHFHSDBnW7WqWRv7Q8KBUgtp0/4JIW567iSZUWftcmBUOHW9pewZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRg9eJxDc4ARlekO+g7uV6lPG0TkCEJFMy6dAol1E7M=;
 b=PFHzse5ncBQsmwX+kMSksVjtRFvlp6bFy4qBMsVimARr/TFO9iIzPdVlFiYkUanUb+ckjN37zrde64IHJeRctobNf/N+EBg0YPLzdWfNp4ZBjAT1e2RsUaetg3z6hcsT+Zr0XYArTAIVZCX3FXpVV4I86aZG7VPXHM6Qqwt6IY3EWbvNL7n0YXsoZO5qtGowWgdCq5qaKy/hfTvUBd3U5/RgKjR5GqqPBxZzwqsdFJ78JEXdQVE7KeazJaWML1MTfjJ8c747p9lBzxDNEC3uiruCucWTaMsKjFY7wNffGvtX3ZXiQo1pkuZZupcXii4KyiVV6SARUTKEw2CkoBG6hQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0723.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:fe::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:12:24 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:12:24 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH RESEND v2 7/9] HID: multitouch: add device ID for Apple Touch
 Bars
Thread-Topic: [PATCH RESEND v2 7/9] HID: multitouch: add device ID for Apple
 Touch Bars
Thread-Index: AQHa6Yw6oVqu/SRLokKwJGqKsMVRAA==
Date: Thu, 8 Aug 2024 12:12:24 +0000
Message-ID: <E2FBFBC0-889D-4976-8877-E1D76FB78376@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [H71tbL8xC4Io0L9iPIB0J22czkvHcZTE8nvvAsWsSZXab7EwWyGqlJpVLYDUHpZ5Y/ryA5R3N9o=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0723:EE_
x-ms-office365-filtering-correlation-id: 2220d481-594c-4472-6194-08dcb7a35cb2
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: fm1xc/j/Q4SDD0eIArBudSTwckqDfuNsLmLFWiZE80sZqgTlWOvt1aeE3XDpcYWbYFMAi4S/Q2uySvoSSOB/0Fl7efMZnKPjVK7UXnGeTFXOD4UuUea7d/vgcQSHZkYWZfxmknhpy+BEIrWc9+GMF+msbHcb5AHw5Gqx+EYhd0QDfsAQCpI4RQ+sOsQpZEwOezSBnfWe0CvR8SyEODIPeJk/pcICzcMPGSLjD6Pn/9gk5wBeeqewdSknGfO4IjMnAkp7XonAcP2Cmnnv+eXiYM3y8S014drEjegNON8hnZ+R7D5aRXHJ+os/7bZ2CGfBuMABz6BEjmhByIvF+s+NuhcLqctfKtyxD66VpJdcks9Y36tNCCOs51N3QtTM9OpfQ6rfKwqg3ROTZyQ7uBtsaeeO6OX7/z6Htc0gCXPk/n94ASuJTEe12kLMharORxiWah7gGGYScWHSKZ3JL5vgFpdhASdk/Gx88Cc2DQGNhd+zdyEoPKznU2YlgV8rD8sLv/KqTGJawCDyW1kE3xnDWvXVPltKUGaQAVFY3mbwunEMcahU8WlYyIT4aQXMjLEs02Dn3dAp28ske/syFnZns4Ks7nirQ2/6F0/JX6vPCZU7TzudrLQVgxsQSmSqN6zKiCaoiP7edMiqYPJST71C7O8eeGqsNY/S4CiTF8DR0pwNxS1rpdw2+dpmc7OF3RGB
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QYWvRKqXsxVkHZFdzdLj15kAiVDjLQ9FIfukuxJi8PMXSrHmWn0aBfNLLcHY?=
 =?us-ascii?Q?AN5T6nJwzdBEJxyiJE0/wuPz4gA0JIu7uqyJBQ3zd0hT/k3J/EsXUSY9dtXv?=
 =?us-ascii?Q?kkANp6vREoKDQ5yBG0Vh9dRGsnbhxUbr6wUt+CVOiyA6AbwQnIzL2kXmgKID?=
 =?us-ascii?Q?NtTQ50ztniI0l8icPqTII3H4BTj25pG95kM+oscpIumD5tEVDzuffAEzM15z?=
 =?us-ascii?Q?CI6FjdLEU6KdyNtTNuvaFuHp3Z+TcjySgL4o99BqiN92OMR6IFQ7cA32NXT9?=
 =?us-ascii?Q?tCuV3PDikSXORtL/8YbycvZxn9T7Lk/sFtRwztiCMi9cRJJXAZmHdgZ8FdoT?=
 =?us-ascii?Q?kpzFvzzTSxEi8Xn2n/kny1UZ+k6SyMspIJ9pu1PB9gyaKWmnDrnX1sDrsMAS?=
 =?us-ascii?Q?gMWOf0S3LQ8m6aZE7Ga/4fY4/se1tGxQtLLI8qTQGjTI9RQzQHpyKKQYEnkm?=
 =?us-ascii?Q?iTLEnNn77SQL2yRWKE2agVLQAmmLVy0Hy/vwqYF1y2kPnBOGTv9OfSVqqH5U?=
 =?us-ascii?Q?ywu7aYGpx5CNPkGdoueZTDof0ndevjH4TZfJFXS4YKb324OW6BRVUP0EdDcZ?=
 =?us-ascii?Q?PEz2rrs4oyL/XmrrTEu1i5uZJK3k8qSapvMm/wm4aU2OU56oGfmRvMDUQMx3?=
 =?us-ascii?Q?qsLTGz9HHFD/bFphquRdzzGg5ydo4q0e6azuj+CIIvd6i4qoBPVCiO4pz+UD?=
 =?us-ascii?Q?TNx1tj61nG8hGwJA2L+MuiVLY5biSyCaH31ybcoPoUofgjNopdFT+llzx32P?=
 =?us-ascii?Q?hylI5YSLgp/46hNPcKR9AduPQC6FVYRkS8Wmp9GvFOFp4JFkyCmmMDTEL4VA?=
 =?us-ascii?Q?d+34dE094S8RmvJuhLdS0B8UTzwvgNzbGprdZzSxzHVw/HQeHUqERYEkl2fJ?=
 =?us-ascii?Q?xcQy/4/2IehYaaGb6zXljEQwRgTQe/yNX8vN1iTKMOWUrHA4e1aqCHfwBrfa?=
 =?us-ascii?Q?ILfMZvRh48IvobxTvHHlqRvt7DZHdBzQdYNkWEpf8rjoLhBgOkJlDSBRZURZ?=
 =?us-ascii?Q?5pRi2AU7Al2CnW+gkfop0VDR6NnX4ImTfcuajrc6BRQW5sj13pLPcc0T6Gks?=
 =?us-ascii?Q?CwxQs94fjQoXsueb3maFQM+qnusAEiRkc4N+teVz1J7La5eDLjQmgD8r9+DW?=
 =?us-ascii?Q?PYywmaim3fHcEA3u4kQ8Atl2R5DLfL1/2x8PP2pTA9E4wUtNU8U58jOOgZJO?=
 =?us-ascii?Q?vOfwSRcrlCnesHqDHhbqBKPAZGc/BhMim5hbAq7DcgMRMhpbiMs4SsVF+EoU?=
 =?us-ascii?Q?XZx8EVm8hYvKjL+rDAkDG0Sxdqm0HDHF+vbJi7ZX6zZ2gQCCSEflpsGKxsSc?=
 =?us-ascii?Q?JcjUxg0iElH8k3KN5OSybCDE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <29891688A8B42047888F37B406E50214@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2220d481-594c-4472-6194-08dcb7a35cb2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:12:24.2096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0723
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

From: Kerem Karabay <kekrby@gmail.com>

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 26 ++++++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 72b665eda..35ef5d4ef 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -744,6 +744,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Touch Bars on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2948fbcbc..0fed95536 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -214,6 +214,7 @@ static void mt_post_parse(struct mt_device *td, struct =
mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
=20
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -398,6 +399,13 @@ static const struct mt_class mt_classes[] =3D {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name =3D MT_CLS_APPLE_TOUCHBAR,
+		.quirks =3D MT_QUIRK_HOVERING |
+			MT_QUIRK_TOUCH_IS_TIPSTATE |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE,
+		.is_direct =3D true,
+		.maxcontacts =3D 11,
+	},
 	{ }
 };
=20
@@ -1747,6 +1755,15 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
 		}
 	}
=20
+	ret =3D hid_parse(hdev);
+	if (ret !=3D 0)
+		return ret;
+
+	if (mtclass->name =3D=3D MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	td =3D devm_kzalloc(&hdev->dev, sizeof(struct mt_device), GFP_KERNEL);
 	if (!td) {
 		dev_err(&hdev->dev, "cannot allocate multitouch data\n");
@@ -1794,10 +1811,6 @@ static int mt_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
=20
 	timer_setup(&td->release_timer, mt_expired_timeout, 0);
=20
-	ret =3D hid_parse(hdev);
-	if (ret !=3D 0)
-		return ret;
-
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
=20
@@ -2249,6 +2262,11 @@ static const struct hid_device_id mt_devices[] =3D {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
=20
+	/* Apple Touch Bars */
+	{ .driver_data =3D MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			       USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data =3D MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
--=20
2.39.3 (Apple Git-146)

