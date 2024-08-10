Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF8C94DBAC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DA010E106;
	Sat, 10 Aug 2024 08:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Ir1ghTlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2029.outbound.protection.outlook.com [40.92.103.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAC710E106
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:55:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j48isvNTiSu7xKitj9Uubk2hUPjDEEn+RGhyFYDduOOHC4OLbldaUqa29RGtgteajdfanF/9Dog1QgJ2IAc4PtBDg4q0G+Msmg+a8Y7iWdOJidnZzvCDB15XaF8MNC/+/I1J5uPbdptVfpIT7hIP1SLuMesKHSr8HA394yDGWylKCGxblj3TV08sHUjbO2G4MUzFB+tE15DnnVCoAU94WO7Bi43ff+ws54F6PKvfp9mJPpeZZPP96XNnaEn7Jr9UQxToDM54LslsIjDI2TwS73lQEANvowZ4yNBPMCtxsJ0xgAOwxIWFAwk8vRbBr0siKJRKYQ6obgKJqT66Ut5L9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=DPrXZrrv3qxJiARX+nlQyY11g+uhtuKfCk3R594RJqVK4xVHtRUirABn2yVEJAVv1d9n9uebdY2x/wTjmdw8PRkMSpJX5TiWFgD00PRhlREsjcX2DbOcO1uJZixwi44VwCvwZIqlrn/PunltkETifhalgdDd1zj8XcEIFBU6TxfHFcuemhOIaVQYTfLRnNqWd+gvZF7QERMZg7NpA2uyM9XHY3hCJP6A/bgOupUqbkGmP+EbCF3rOUPj4zSS+4NnB+K9SBbLPCmGxVyCZhv1LGFYIXUmbOv/uHNDZezIkNGkF5JsbzuCRyOJGfdvt0BPm3rIqZYgIIKk4Fz4FtUIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFlmNon3cxCsrA/dn65ztpfF+V3XRcHR23mKlXxL7g4=;
 b=Ir1ghTlZq/Vv1XcV+0O8eOS+6OkW0Pm2Q/e6QxMdqe+4WSozqcLaHObb2yVz5FuxOn4RHdnQOTSP6iojdVd76+ivaYYnb0Mn2B5SrRi+4ZcECEY4W9oJlVm1v9BiOPH3daWERZSWo0DdHvB4XgNWJBlJNca1xrxEQcpripRksvpOmZNb//2PqIhKN3UGy5BzDLSGAVfdMkqb8tsXExcumSV9svCqW7tHShdx5DLLDW3caPz6kDW/Nsvh/n+ezAnF6y7Av2Wiik/hT7FE6kFqWo8lZaIuZvq/4pYYxw1K7KHQimv94s7y3LUzAn65aE5QDQ5OzkneeLopL4ZN5f0czQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB1551.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b6::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.15; Sat, 10 Aug 2024 08:54:59 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:54:58 +0000
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
Subject: [PATCH v4 8/10] HID: multitouch: add device ID for Apple Touch Bars
Thread-Topic: [PATCH v4 8/10] HID: multitouch: add device ID for Apple Touch
 Bars
Thread-Index: AQHa6wL6purUB/x39E+brePYK0cOGw==
Date: Sat, 10 Aug 2024 08:54:58 +0000
Message-ID: <AE6287DC-7B06-491D-9D15-77DF05951436@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [KrIc45PMuXOKA5rNHK/ZPIqMgcP28UeXDIlBGoeKCxh0d85h+cVmMj53K/fhNOvwLSeHtum/PfE=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB1551:EE_
x-ms-office365-filtering-correlation-id: 7998e165-3d31-447a-92f6-08dcb91a1cf0
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|19110799003|8060799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: NGz/9/LVGdU+PrKfHlXErtiAgSdxSEVzlqEmTi6i1GEs27phzEKEUpcfO0aOF7CONwHPUHXx0oHz9GTk09xvgt0OoIgfaNQuLH469W7r2xsVTqdUqG/i6aHY5WjPBspkAJQwAfHi05ls1EvIcR20+ZLSxYDriCP0XnB4HQDQKdQP4x4ldo9EcNyiQLqwUONhdg8ey1c66uFkkZlI+nUMfFQkZt7C8oGMx6cIxxn9UJjm4LKAMKDh/dVIdH/UEkSSkixaUntUZoX6wHVTA7TAQK9y60dQXD+ZR/FlCjm4yPtWTHYGq9GS0R69oQYZHLcqyU0A2ue/6PFuGOxsEJ4aj6amECRWDJbDpOGCBYttgOnYboGKX9WCg4OR6UaXOr8IqO6SAOBz7KXQg10gSUipYiTtv2ysRnyKpfffhmoeV4U1Sfsxan3LwHARofRbQEKeqqGudnJCw7W2Q06RJgEMtp4spWQfFKYrYbjmvj0BW/L1Kc08AEXNkYfeiLSwNaO0IOSO1R153kdyRfB7nukFclwK/H8ojcgUmS+j8xSH5cy8+IYgaqnMbSoXBLC9tQ96jctypCMNUXPpfdVotuf4E9Kj+9RfXeUUhVVq58A4ZDFHbS7DfjMcxj4pTi0L9Q4JB6ApcJBBYdxYG1fx+2h6nLilw9DVkXX5BUcfL2CoanOfYNFj5EGJQ9OdCV69Ll2V
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YxAIYys2OuYxsXnt5o3QhIwAnIu5owiZ+YZy4jRSh7mdrVmiiBftlsWiQfgU?=
 =?us-ascii?Q?yFjBbGVl5w02zdlhVFKtcRF8DGw8mmXXuQr571JZtJXFLus6AbI/DoDYtUNv?=
 =?us-ascii?Q?1S1MmbZaufSn/OlF9LvyVkDxdDvU3mG+e1wHHaUSl/PfcBkdxlkkws/Qm2EL?=
 =?us-ascii?Q?KvC4hl6/Ne3MTWOrz9IlcShDRnQf+m1IPkmYTpJlrILTLz+NIOGX+LtWUdWF?=
 =?us-ascii?Q?QdVeA5xC/ZgvVUyr/JABYLe/JHTS+IaFwzmNj0MAok3hegoKmpWxvYXvXPUO?=
 =?us-ascii?Q?z3kASqdBP9gzzgtcbdhxBpUrd7B7OQFmuah9lGMcKXIblQIO/DCjQ5+48FRV?=
 =?us-ascii?Q?PJULUEtEesIXwWobsI33rD0cXl8zme2GEpfhg32Yv/vWcdhXcXyb4v0XOA0k?=
 =?us-ascii?Q?WjJq2jF5dpJYKOknVoeSTvhDRd83gdtA/L3Z753sHSDs2RjBpmmTGBn4o2Eb?=
 =?us-ascii?Q?gJ8vhtPmNM4GmwZvjgn8sAMdrldGch1MOwSXY8dzbp+I3h6Qwh7r5WOAOTvz?=
 =?us-ascii?Q?OF92qmUPtNQr4+WfeOymMEBb9CBHQ+zJ900fQuSroae+0mpgtCiSCz6pJXWD?=
 =?us-ascii?Q?l9CBB5yRgim6wqHa5BesNz4IhsXVSHPqPJUe5jjIzh8Gb/Ra/SlwPdKS8MlS?=
 =?us-ascii?Q?Lu45h4juS/9xollpi/oc9MclcwqcjCVUKqecqK8Hk0wKmtKe5ZiAATpIkq8j?=
 =?us-ascii?Q?eXmeI5kw45suN3ii7EkRhs5jKg0A/uluMmBVQIsf5/XpY/MAB4JWocNN7OCj?=
 =?us-ascii?Q?Sz9f7rTGNtQ4DifWqQzmpAGxwgYA7G5aRIQ2+YxekrgkO12VQF1FD2SuBCke?=
 =?us-ascii?Q?Q8lTATcqszfJMMj0B5T0m4LTL3vcOAIRTqFxRFBPDvRSsSKHvGO832Rys62K?=
 =?us-ascii?Q?AHTCsVB5OsPG4VmhUopO3yeCJCqZ2jcnhNIB7esTN96SaYA3MdQo0sRZBXOV?=
 =?us-ascii?Q?5jVAf1tBzqBaRhi1RBTcGo8UaIcTLS75xX+N+mkgG2IlSkq1nNpyYxqQQxjX?=
 =?us-ascii?Q?Vv5kePVMzGLyTYMsl4QQqWupGkdLV5+RV66LtYZT9Df0gcwrri1zNiF2vyt7?=
 =?us-ascii?Q?j86kK+GJ+WR+0iRotq8ahjWIfTmJeoyKr8jlPpO/9BflV7QiS99qZLz+hrLi?=
 =?us-ascii?Q?I0rg51eEXKYsETsTO89jqU94UxtmGb3Sg5I0iLIZxhyJw4FguSP5hx3pXXV7?=
 =?us-ascii?Q?CS3p//kE8cjEqxgmhbQIJj/mVxJc0EAuQDchJFBOQXX9/tp42diyEZiWtJaj?=
 =?us-ascii?Q?75K7CcaI5hdSDH5QF6c9aMGj20+eGOccLyuyOe+U6khRnabHUZWvuMowxLCL?=
 =?us-ascii?Q?7wicX03S+77iE4Tuz/24OAxT?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1A9F5EF64D5B5F4E939B2DE2CD208F07@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7998e165-3d31-447a-92f6-08dcb91a1cf0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:54:58.5469 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1551
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

