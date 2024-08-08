Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C594BEE4
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2531110E745;
	Thu,  8 Aug 2024 13:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="nTuftBjc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2041.outbound.protection.outlook.com [40.92.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46B10E743
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:55:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3rNarX/MWZ6vO1wiam6svUHzc8fVVF1J0V1qc0MXNqynhkzvoPg1/+dYQfGL1aINPcWQa7P0TbJOp+wMjFpTYogUd2ZuAhyZkHcwL2s6KiLEZN8ms3uVwqIYVvJptTXuaEsAuHi7ztyiYkz0TLf3looiJZMjSfi8FdGZwZMdgrdSkG6FJ3nlfyKao9V1sF/2mkO3Yoac9xSJn47n6c7M8KT1Y/u5Z5NaZveH1SbTTxRdnRnmvBV95DfzrAL+Bz/AhAnS/+u5ecbhuskZonrjQe3HxvW6/jXMnsnAoV0sUehzgDijkVLkO85227RcOu7EDSuujuHf3r3356514OhOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=qxPAHKtfBPTp/Gciy6/M7dPt6mjZ5IKninda91649yMpnzq2Neg/xfUV1Rg81M2qAgYIc0Jj+ckZ9a7IkZb/GMdAZ2i1biDs06n+/KXZu4PzH8sO/RMio4vk0PR8N75rLMsMJE60nerlk6NFa+cio0OcGkTZTfa5ZfH/AOtGfqGTvbBsK8iitzeWMvIbV7EZhNp/1jopBmfJQRST9ikBGAKK9foC4cCrQSfaMiA07Okpif/XIF4HGgYUh4dcl4RfjPXaWBALfWr2Sasz/3Lo3utLbUbwIAp309T292XN8AkUD/TlYBQ3W2rZ7XPnrY5yizabvQs8E0GXvEYjFAyNXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=nTuftBjcaZ9s3UaAVQVpsbBn5KVgyUmGGuoPvRdNin5EZ7FbbxPiUAswwiCxl1hyyKv4gocGsB6fMk26t443qDiTt01QBTIzfwsXG5G7bG9VjpYdceZK/A6QkMg2zgCHqn1475aOla5+qGMX+xTZ7gF2XHL8WZG/po2Jk5gdoE7xZGvmhwlxAoaQx73K2/DtyNwjWGlVcXOjF7HlB7QSYtD/js6vyaXUCtHmm+DYHqW3dZFhMmPjZyNLADI/AOAgbq1YsoDuM64g/djj4iYsy6jiig3JAxfs3GyIx1aMy0anfxFbAmgauXd/iMUHMEtY5khNnI/lcVjwyQbMHsqF3g==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2013.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 13:55:42 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:55:42 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 7/9] HID: multitouch: add device ID for Apple Touch Bars
Thread-Topic: [PATCH v3 7/9] HID: multitouch: add device ID for Apple Touch
 Bars
Thread-Index: AQHa6ZqoKS0lNEgwgkOWtDaddXUfEg==
Date: Thu, 8 Aug 2024 13:55:42 +0000
Message-ID: <34127221-073B-43A4-91BB-9637F96B99C5@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [GzdbJfBE/UHHQd0m1xcZ0ULQvuqXOYWHavNSEuvM0w3NpcZXw6Dh+EisFF3z7OOXi4QLNa8a+18=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2013:EE_
x-ms-office365-filtering-correlation-id: c1600182-18db-4efa-e865-08dcb7b1caef
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|461199028|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: c6lH75XOu+NKsCG2c7rPe6mKWJEdrKvEei3cdOXR6SlFH2/pXOffU2OLR2Ke9yJn6xeJwo/GM1nNCcA/V3PFwdiK0rNn8ALLEPtacE66QZEzr+WUBGfq+Ym9N7MkcktO1e2druydC5NAYpF/YXk3QTZMXAxzKDtYXAw/RDdQ8uY3SfPTaqdcUkvSDgy348fyCyaRRO6YiCzYZFRHV0l765R86oy0MRM6T9+ABsIFBSmKr40Nj0jhH2nztIUUHpSvfOXX5sO4nSDNxzuwCazuI/tDlejsjmKoLOT7NBUu0kh0ve2DF3tChKcgCqfIS4DjDtAeeZBNN6Q6LkS627E8TN73gTMbbyZdFCCI24IcU6MDSvWl/dPbNJ8QgrVzWyU0xPtmtiEDgxsMDq+wOFgBdmLjd43TpSeNVRV6Ck4C2lnHiBtUh8XTPZO2WFadTFDCxg/bpBUuFWmkbh0WUIW1Cuv0uk+/Tq5O6huEGgziYp0CptGRRiXYl+FADdZfGga8a3UDIT3eaurOmby55TCaLbJj5OXKSpVFSQB759qM5dw1I2vbh8ANtSZVTf4X81x/DbE18ppQBhw8gSJo73C7SnZEVdg2LxwgfJgfpHg2ZL6iyYh23RlSCarXMYHunPGIWEOi5hE4Szufrf2bOJQjNow1C1vv7aY7BpJBm0PxNGIqi2U1IdN4IoiON9CqKAUm
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wrmtEN3HuoBEUS2FaO97P96QJxo30NNN/xlRXN4n1hYw2UZtqZRkujIa4HKW?=
 =?us-ascii?Q?KnCFvh9oCEsg3GfuTX+obcQpH1it0k542WH8UxHFsWX4MHu8Ycoz6ETMXNDo?=
 =?us-ascii?Q?gS/EEOyMQ1MAm5QtikD7Vel8RAepIVMbP3P2bTBg1NMGue7mCOsXW+ERWOSl?=
 =?us-ascii?Q?3UEDgq6jwLzJmZy76ujvQkvlj/S2yQ+47Jq9QbAYXKBe9z5qVb1e2rtO0fHP?=
 =?us-ascii?Q?nNJtvG+xTjU/YNheHvyZWTonqf6shCoN9Dn+o8dFW4Bx5kA3tbJGya+MuVvI?=
 =?us-ascii?Q?CkjBazswTAgh7hnrji49YmmyxcDGPLLKwTWcK1iRSvrXUu7/H5GamNMeX/uL?=
 =?us-ascii?Q?hO9PdZWRtfnmpy3c+coQ9oVoYW4KEcsx5LI+w9wSWMKRVfJ4JhNwroHnYJSd?=
 =?us-ascii?Q?KvPUodqImnRiSuSMC1HdUhOGBDerr2iINLL6Ia/L/mIfB83ez3bzhLERmVeK?=
 =?us-ascii?Q?BaBy770IFtpfyxshUj9oUb+hsRB12kEKCt80KxJFZYQOzB6WQw5gHn1fKsJ8?=
 =?us-ascii?Q?nf+BVKJa+lEY3M6HJJC1FRlNheGtMwsbPJmY4S59dBGuzF4k0+ORdWNpk3Sq?=
 =?us-ascii?Q?ggFdXknCdWRAttlVA1XtjrpkXlCWiw5djETf2y93y1skmGkmALPbxfYg0sLc?=
 =?us-ascii?Q?A2dcrAyON2ftveVd/D/LPFoM+G+GES7AbBjGxb1MAZ5d+H/etfF1IzOR1+26?=
 =?us-ascii?Q?+xiaEHlYaY3UlFTr4OMq4EM+hHV7I0/mZHGESrukSjAnn0hAD3wi4xImZzHZ?=
 =?us-ascii?Q?f9WD/ma58SkDwKugUL4ovXZYGGRU0tCAgcc/lRZU9CpQmXwZXhXxGsZj9c8g?=
 =?us-ascii?Q?CiMeAYwhoAnjDSAA1P5gSlWxD2YVc0h93ZhxY6dP1pdWbVLMwkdqFueoGsO6?=
 =?us-ascii?Q?PXDMyPwe8xWe4aR8P3u1TWxVV/t8cIw2+ahylH9cuwwLvvscMIFoYbUG4/Dp?=
 =?us-ascii?Q?l/jh+jpB+LX73Lh9VJ0iCQf5TuIH+BuDRcTJi97bN2tooKSpRHGZTKaxLVtZ?=
 =?us-ascii?Q?xuNCIwd7kuTNQS+xYFmdup//r4sS/QqJRqvXBTNdcmxes80nQZx/0wf+7pq3?=
 =?us-ascii?Q?8Uw6v70ggYAluulc0Fr3SHtNvrHssLjKqAWvEWexknMtOmOfzCmg+D34pFd6?=
 =?us-ascii?Q?9qnLBn3LL/e19Uw05ngqSnMfNqiBmx1RuzTGBHvcni0KozpH3WptHrR0oR2K?=
 =?us-ascii?Q?/CD0KdwrTDCwY1VK6evewdqP8Kli2WhV8vTF36J566WpOlmguDvStRy6/CyR?=
 =?us-ascii?Q?qB1knbmYiHUTb4qrbgqlxzCPqxyod3bXvsM8g5HbDAunFbQH17NzuS4A01yh?=
 =?us-ascii?Q?1BA9a7xO3bbVkSWPkZSpzX2e?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <589FD4482AC496439F18665D09E19EA2@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c1600182-18db-4efa-e865-08dcb7b1caef
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:55:42.1250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2013
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

