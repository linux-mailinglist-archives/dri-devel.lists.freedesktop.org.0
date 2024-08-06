Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BF0949614
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63B310E3C3;
	Tue,  6 Aug 2024 17:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="rqDaIoXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2108.outbound.protection.outlook.com [40.92.102.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E5410E375
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KC7BJPnHxJk3inQkFZuTHr33Uyt17QWwb5Afhn9eZrbm2TBbl2Ijd2QJ9VV7M9Zmlr5xh9N2b9sP9/opQ3HmmNYDd8IqF2GoxtDr3+y64nGORMDFUDwMjhzuRT5ggWl1E3rm5Pbissif0Bw1AWfue85sZasOVNP2Pm96xM2GxoI26o7FKYRk3qnIZ+My8e4JhNIU5Cc5LtMlUW5r7mdr6MHoF6nP8KpGj4THgpP5xpUZD3s5W07LyatWZEJDziwe2iymjFtsDDIXmTl4VjoFDoo+Z5zRQ8nBQALLSSC0RB0h6s4pDb3+oBdrwNC60Tk76/DK1tIbxCTh7/DtTH+Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=Hm+fTj7azRnRda/yjkYA5/RbC8yramoGYgwObEoKh1WulhOnyv5G+GrFfxqlkJohmdyP+IRgUZZsKYpfbjWfK+rSCApJvO65eaDLhP7w4SAyyRx5zhsj/9DwBzkI9X0qcASG9Vbw7Zw2EgHQSmRwPBnVwjMpxpBzOXsRIcIDByQPVAB9mbDHpCBCal5VjQZl5InHl7cAfyuoyZM++dqd4aU2TMfaaQuWMJ7GY+A8PbfnCCQSspvDRXMrqZ+gIB7aH1RUwyIt9iNaCU629SHKrBtSYH9Ax+ZFjx7RjJ1s3bOnKfmq91vuzoCosZSrZL7GmFW88jCEYHq1TY7SbJR+kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=rqDaIoXlUSPM0Ip3SFDNBOOVW9uK9cljHNfuKAyGjUYywKwe1H4gaDGMZT7vs00eazkPoIwhuQL7XIxslVXMt7p/rj6X1/cgvVaD0QdTOG78gLZ8zJkC5o94pW7Cyc5t7py7/wJ/Y77N4mpl+mc6df9oh9sZUjR06pfKTd+TAJh6wutwDLkV2KlyjFPd29DzbgDRXPjOoYHsiE6HYxXd50PUPyBmXSn8rZENVrsKGIe05txXTt5s6FujK4Yea9Cyc1hjwGUFJ2HHlbQxQRTWbDRmF4j+qkpflqdvjpEQF7W+LMJs+nJhzI2fib24Ms6ujEbRNQlHObHnixdKODAung==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1708.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fe::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:52:46 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:52:46 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Aditya Garg <gargaditya08@live.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH 7/9] HID: multitouch: add device ID for Apple Touch Bars
Thread-Topic: [PATCH 7/9] HID: multitouch: add device ID for Apple Touch Bars
Thread-Index: AQHa6AfrYQfNORX0kUmVQmeA7FLxkA==
Date: Tue, 6 Aug 2024 13:52:46 +0000
Message-ID: <4BB7CA6D-1554-4784-9F7E-BFDBCD9D8B5A@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
 <C0F2E161-BBAD-4AF7-B39F-015A5A609CD4@live.com>
 <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
 <9223E804-286F-4692-9726-2306361F1909@live.com>
 <C2CAAA64-500A-4D76-905B-DC3E2A884941@live.com>
 <BDCA0457-7A04-4705-892F-CC8DF493DBC7@live.com>
 <708F206D-3571-42E2-BA6B-5AD9EEF66073@live.com>
In-Reply-To: <708F206D-3571-42E2-BA6B-5AD9EEF66073@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [YCaoMJIq9VaYdbccaFPuAV4fufHF45NGgAyQLik22ZYRlcAAXGT1ArLGcdN7mjWp8MniL5IZ6yw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1708:EE_
x-ms-office365-filtering-correlation-id: f4c3c476-067f-411f-4476-08dcb61f0da2
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028|102099032|1710799026;
x-microsoft-antispam-message-info: 5MX1fzMAZ6gRNqtwKjoIbwcKRzddUqXBbW0lrlzdb2q0a1SuUxWyj4CVVVpB/x6ym3Z2jpvMGPb3/jvOJQHeX1IrnlCxKVCnjmbNm66+uy8dyskBV+0jeZW0U4zaYfaii3/sK6g36smW6zLr455z5WYE2U12UmVwzamlJ8kv9HEWjk7P11SoWho9R/DIbgl5ZdiNWCU4nUJAM1R4clPnZ5BX0rDqtQHvaVGZOWtGMT3Tx4MkUsHF90DJiSzahyQ0LncKsKgZe5PzgBMwWt/qfENErSqMEDmLOfMiDIpeWXOIWOa2Ul5LbQSv2uesyrve0A4s7EpqllUxUqhLaHqvY13ia4eMhjDax+OHHAZcOiG/H+NqA+xehAkcn71vnOONXOebfIxClLOaq+rTj6yRRxoEI8ibeO07uK3LRNAgR6f4OQZYmcXfziefWe7teVF7mAcGKd1V52IfDUnjA1ICUTPhW/KZ864Wxr5EW9Lvlz5W2UDSuzzeTfdq1H67DKZl0ntsoF5doPbSaeLZHdXLo1OtyIkHmqG3DMaHppzoo8Bp9jZPSLuaJNZS8fzX7Kg3YL8WVM3vxVh02jCW/OQdSGFMJ5WqDT1qYq5OLrQPa+zGPSkrC5i+czRbANBtvfMY1SYF10rwbPSsxBSyjJYazFFuoToLlJvBRsqzcbFxqn1doooYTzdSIKCBeOWZVmUs
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yzzQm2EqQ1A5m5va5l5FhF8MpeajYsixtuBU42sPASbIqmLk97VjyjiE/WLJ?=
 =?us-ascii?Q?zpPt70JhoDJwKx/1tbf6FM6LAZLJJbgnjpxI1E+H6xikq7VEyIeUQ1w6tPKJ?=
 =?us-ascii?Q?hnN48SpWtgDKp4e5p45BKFozuSQZrEr0Vxq0pOhOJ6w9gZSG5lmjGIQAAIBc?=
 =?us-ascii?Q?GqA134q0+AZeBwVAhpKBk4fs0XBXypQ5vwWEUDOcat4PFDIaw93CkTbn/Fqy?=
 =?us-ascii?Q?WNWbpztQxdy2SV3y3fm0ehAxnjSXYTk0fCO2ubsQQ5x4/UlQ3S9txi/wrFqk?=
 =?us-ascii?Q?efNSLrrvi37J+zofIry3EWjSVg5EZbJRqgvX/vRoSegMB2lg9vv7P3b7smE1?=
 =?us-ascii?Q?sUHCGxP8Fa6QzHoYokH1lGswx8tKb0Vni/Ek4U5waq0IUGnUzsrw47HdKbvo?=
 =?us-ascii?Q?9DV2ujglAU503YsFspvi/lyg3OwIK16OkJeUl1DGdAPxxqO3UbEWJ1Y4ptLL?=
 =?us-ascii?Q?VbyiJDbgPYCDFITlIboCeE45V1e3D0Fu6nDHsnzyJ6ObULbJ/sCzdOEem5LH?=
 =?us-ascii?Q?ZUwGH/4oKs5fZ23T6TNzu6BJXzvURCc0bX24vcRoUs80EjxUbqhe8yHwZVJh?=
 =?us-ascii?Q?JJzSiKqiMwAfTU5k51AglogDGf0gjvLdtv4h+Gj0uDJzfc1/g1VHGNp1kjdg?=
 =?us-ascii?Q?ciBas5O8KbjvgC1peZGauXDfGlWYpMAJssFYIRgNKvuvYM2BcFYqgjwlYI5z?=
 =?us-ascii?Q?juACGTuUIlLtdC9iiCf32+SjxLOga42+I17tLLyBF1IAKj6I8O3z4J3AGQTW?=
 =?us-ascii?Q?bvuhAeZjdFssRmoHTCRg0UWC2wlrQzG1g6dA+cBKElPF0LWTSy1dHJCB3oph?=
 =?us-ascii?Q?h7xJezbdfhKTNxvKX+zlGtuY7psIp4hPkEPTL0kguY752GKMl1h3cdKuZuuJ?=
 =?us-ascii?Q?h3+C7J/mWTHfby2wbgI4umiXAWwZ1Xkz+mgyO/4Y5V4Npx7OPKY8R79b6YwL?=
 =?us-ascii?Q?D/IQgs68nlgW7Xeq87W6s68z7RapHE1eC+Rg/gpIg2zj7C1sc3gcigG40xhc?=
 =?us-ascii?Q?RNwYKvZ/6cQyblDtUMH2EjV7G618p/vwN4pnRHOnbxGew8O8MDntCjvh+3sG?=
 =?us-ascii?Q?ZTe+0LWCTaFzkt0MLazw8P8foS8m50H1uPr3wHUNNJu2WDkJJ/FI6a6/n1xH?=
 =?us-ascii?Q?wb8w0b3ty7gHExOyK+2qaGSofwJZ0/YUZe7I2dJj0ghdn5hjKUM0T4obOLup?=
 =?us-ascii?Q?40sUfknA3RXC/XLYx7iP/4333q3Urq5V82DpD3/vP/HzCfDJ/ZxKMq3NFlLg?=
 =?us-ascii?Q?gX89CnpLid6IjJljV+wRNkm8F+jcalrBHz6bz2HDL/4EfQ4T9CsOAMMAeFcx?=
 =?us-ascii?Q?icmkxZbnzpx1Wecax+ulakqt?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <95EE09D02FDC9742B58E4500BDEC44A5@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c3c476-067f-411f-4476-08dcb61f0da2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:52:46.8230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1708
X-Mailman-Approved-At: Tue, 06 Aug 2024 17:01:42 +0000
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

