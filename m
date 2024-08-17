Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59559557AA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E1C10E099;
	Sat, 17 Aug 2024 11:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="XDrJiYFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2047.outbound.protection.outlook.com [40.92.102.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79E910E099
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:51:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3EG4y+e+FGhckBiUbEfozDQLNRDGonZJdCEsHn8hYs3Q7vkCymnH3vu75t7l8I3On5IwbSA6uOM+b3/yyv76hWdcgfFvAn98wXv1C6wzAtF7gwxDPOd/uBeuiuWofENGACKuEC8AX/xFntXz46f383tEwsxSyK8T4dQBey/1DP387WM2V4+K4TvpfI+e2j/Mlktnq+tetHjKlX28Z2KvBO2TJ0I/OK90v4TPEY6fJhRBl8LkQalndNm36ZkVyoVCT7M8XmxbwJL4KutlLEI46kirkPD95nVUZLOyOLfKQUvKoxHqZR29h+Fc1u4ZyJTFMP2c6dsF/RCfx3uvKGPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=KpnxmkDFZReHk/EYKcUyhClrfpY6nwYmOTM+KiZdYARyUDvMqsdKBe7e9DGir2CccvXKsoJa6CEIKctgriRrbtwFHqkpXn+U+qSiC0UaiWAUJQQrPFbg6r4PZd1/mj9jUGn92sd6iphE7ieLpFw1WXyfqP2no8GiS6h+48aLqDu8n6hVkqg5HZ151mp7wwhgJdQvIvR98j/iO3X/lIBWXUT6Um9rMWxcHiWrtpFzieNmnT1l/GTv+ZLSKDxtYtj4PrhLYCTorHARKHPX90MQrF6O9KxFMMIWgHeXWNAfI+UxpsbvQ+M9e9KI/5iw9F/vZ0ZeVJqRV0Jqf1hCmvGqcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=XDrJiYFPMcVWMpmo/xfhDEBVCcRZKakKGkzkk647RVoTVH5UbVYun7qNV5mKRnEkIhARJXGCXAudWT/9lffFPm24u+jYiJ7uFz+wRV1YhS0GW42Eeah7jH44VoI87YaCJGbAzEqQsCe4TBgfgyiVDOwKhK3Xrz7mxKLMuE0NrIM4ILMkPDsalZ6om383uKw4/sbHDF6DU+zuMD5NcZm0cBxdVOBZpFtflxht6RypYI3U1aD/wp25PdnGpY/fMoNoXbdzfXtkKwNlFDJT50n7kLpwYc+NR5Y5XJQQhyCH24wp4q0hum+LKLhzfe3ZEI+qGorSuJFFgC1mJS4YrrHlzg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0120.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.18; Sat, 17 Aug 2024 11:50:56 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:50:55 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 8/10] HID: multitouch: add device ID for Apple Touch Bars
Thread-Topic: [PATCH v5 8/10] HID: multitouch: add device ID for Apple Touch
 Bars
Thread-Index: AQHa8Ju4vlKyi/mj+Eq7W+97O1SRyA==
Date: Sat, 17 Aug 2024 11:50:55 +0000
Message-ID: <924E0120-8BCF-4BB9-AB51-77729F02D11B@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Dk0/R9Q5zbH+VETMD4hIwIIKB8Jb4xmsAzLvI0N+QQQzqLhGYBjk7MrDH5VBm1BD3kZeHi88l94=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0120:EE_
x-ms-office365-filtering-correlation-id: 06b81f95-9dfc-4042-7d07-08dcbeb2da85
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8060799006|15080799003|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: nUVSd72i0frY02FMUjffA7Bmp6lNxQaajPEGSqCjVdVPZlqrJ7kFzCU7se758boiDVojvinylnAyi7NEcmCBaF4w1aaYwxPP9vpZNgW2FKRxXD7JXEZvr5HNd9Nntay+e1Ul5wQq2+/oPOaqIt5RDSrQbMC6QGdNVNayctWECgl4LsTMYed+7qAK4SKwCq3fxaUKDliGDZWlIRN9FwfzIfYTfAyzjus7mG8GDynmIlk9mQ3xeCBP6p8kJc+sZ1Y1jhvatjqlvZI9yZzlv0HdGsDbH3D7qZyWARUZAR1ZNy+9UUR/1Rse3v3PwyxTOl9du2jN6vCINj2mKY434VF89Q5EiUKB18gxPuOSfg2PVOkVH8jMBsuRPZoJ/afm1b0qtySCxSeDRMfixUv1Wx9GBiDrSlEyGsVp4/kSIGNTfAekQa6MqB5E2LC1fUEUzJbvy+4CisowAbB4V6HN1vvE0K+LRz5FJnwkTO570i0mo2ad4az6AJprWPu6InpgtNi2qPameakzOFGWanRXsEXFhIbmFE6yfIqiCkYRFVZM+4TpNvaP27n9d09aL5gvWYteNXyEWlwSEwkhg2OyagcF67D/W1BKH5X7SVDI8xO+NtRwh35h/YWQh8QK/PlnuwCvpyK9nVgt7+1MRQ0YRsPuZfmr6vx/nQ6wQsPBWxuqMr7CrHjhPFegUa5JMBXDTsq1
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Rv84q0dNfoj0fQiR00dclqEVung8qjXjx4Ao8asPhMUxjLQeUrnswcjybb?=
 =?iso-8859-1?Q?9i/tDuNrtx8vDqFSkqY9u8gxtgGpXdeMdOeyGz7swiH+uLJg8ft+oVuYaI?=
 =?iso-8859-1?Q?Jy949mRjEJ9j3pPftVxxveg35FuBMDFUkIPNOocS9XINx5nnsoe7ZLM9mc?=
 =?iso-8859-1?Q?AzGAiDKqYs7GtLxs2wpsWfodqGeCYW20sLz8Oh23MYAveKGhUDN7gMf7JC?=
 =?iso-8859-1?Q?lsrunbhUFrPTKDQev+o3zmzv93kMEdG/DGhif60t4VOJGLXPcxmYrEvlKu?=
 =?iso-8859-1?Q?U69jy8qJtzEU2gcJaieh3OPX7R+0F0hn+0wF9gjK6au/Y7BBf0uNW9i+vJ?=
 =?iso-8859-1?Q?3NjRVhVzBU4crrRzO6YdgA6reLiMMKLWTuriKA/dcnNEzZGfnObzHZv0TN?=
 =?iso-8859-1?Q?ZU/Ppsc+HZx07thtERG88JYLMOJ94CL+DFdVTYbnyCeSs+owlBwpiJyITY?=
 =?iso-8859-1?Q?1fpSmEEiuNTc8SekplnCxDyLptPbLXTn7Z2pB+JIHtZJnu8nhEixmJex9O?=
 =?iso-8859-1?Q?2CR8P8XDjO0PCMqUgJsruPQPyJaFwglqA1+/BHdcl59tCVUK/qPTluj7Tv?=
 =?iso-8859-1?Q?fVRbBTsM/FeEeNVUOnFd0M3Mo2qbNT3pos/Rk+J3CwxLPY/rXLRn87U1IJ?=
 =?iso-8859-1?Q?u7QtK0eysM/AH2Z/rV4tjOXHDPb22tx4JZJNSeva2rYTFGQ5p2JVUR6E6w?=
 =?iso-8859-1?Q?SJR6w9LqF6wgNfhOuqDAO0NX3sWaMv5fqmCHekjsr0Z3JA8fyTG4QV5xFO?=
 =?iso-8859-1?Q?7RyYGNpDf2fUqTU1T3tIk0ra5Uw90O8NIKBkOvc7fx/PhnsRon24d0PxM4?=
 =?iso-8859-1?Q?r1cQugzF6xkUj2OcHaWYe+dB7uZb/kFsKFRTx7JrB3roH4AikWwMmzPDyo?=
 =?iso-8859-1?Q?LdfhUpuG9jhQ/zxB4utd3o5tRoDlGWadfOKLk0TSmLPNP2yJs5TuwwBm6Z?=
 =?iso-8859-1?Q?FH0wzn0nhPbKhozUCUcyrIbsIh03r6+rVxt2eLa4Bv+XIYmABtS65N6OuF?=
 =?iso-8859-1?Q?EvwIXYVhOkb1Ox1HkADxdN4FZPAKvhIsuU7qLmE3KLomJOnesxnh6qtnwm?=
 =?iso-8859-1?Q?Nf9E5hoPcyypFjB8/QVpH54WxH8dGHgCgOq/V/7sX0hpjlDYS7g5cK+PyR?=
 =?iso-8859-1?Q?dZTnvDDWWSl00G2IWO9Pvtf8uRaIiDN2yJEMiOxoa/g7ti+3xlW69juFPc?=
 =?iso-8859-1?Q?GSWNEsO84mFKYd2R23Z+Zc+9Zz1OC9s/xdjOyhe6D/smC7lZbCv0+m0TZL?=
 =?iso-8859-1?Q?+5NHQj9j6UuHCflYEQQ2z104kWTsUxh7ZwD0HdcPClAKDPLyxkzoLtESUg?=
 =?iso-8859-1?Q?QlK91ODDAhwddUWkHwfhaTs9ZM8WyVw4q6RnGmS/8aLMdyhuuCkHBDVa+x?=
 =?iso-8859-1?Q?VmMVWOUQj5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ED73DC82AF441449B6E1948A22D4BB6A@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b81f95-9dfc-4042-7d07-08dcbeb2da85
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:50:55.8850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0120
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
2.43.0

