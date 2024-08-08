Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE3B94BD04
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689E010E6F4;
	Thu,  8 Aug 2024 12:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Sj8DVxCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2045.outbound.protection.outlook.com [40.92.103.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A5710E6F4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:10:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJcyVsSkETCZpjSABTM4gaTL+vOlmJLQgrOkl3aWo36IKIOKQLczCybYDgoy6BWMQUp0Kg1u6AcKyAC2OZHTiUnt7JtcXFFcteBUCVdyb6j+6b5fbAvuC5PEzjBN/k41mshqiGRXh1EWBdEtqYlNTtGrIGviur/lpEVny7EC468SQ7rUzTuglSqhg+iVHhKKm+XFOfqblCN7LTNo2MUH9ZdDgb2OVraAIODZtzLpxKWB48Ss2GZ4bzcqKHJ7IAxuLs3kOXvXYfKVqQDjgrCokDR38gJS8RqdqfOepR4oG4B4QM+D14I3Aw3mxrg0YZcUj5vDYkqVC4FFdd03KzqhtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIBzWghiSd/94g2S+ca6KQlE54fye1PXtvDLmTaqqw4=;
 b=I7UXlyIhNcvLQouULG4h10m2bxg5yTVBuR1KqgxR8ryFiUxDxrp4wz2eiftY6WgDO4XChUcMvk4OBP1c54+EYPPSY5VDJ4zpjh7TAcpIlY7hwNwe79lE1qKgPJ/pn7/ukG/nhIHJ7/SwJDUub2hl4JcWJujZdmUO6zv5mVcLNdhSCkw0zZt25q2Se3uLzlUhxXSLx+my3XaQV1DuAeKfEC0x1YId7EGXGXCoqv58dcoe1g1DxVVrGCj2UpLND0qDkfgKqVaBXg5pRdA+D2GD+3A5nAQQjK0b/NHbft2C9Kd1lbPmpjMR/yu3vMEsCgAAyqqVmaraLfLa7GDJbowMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIBzWghiSd/94g2S+ca6KQlE54fye1PXtvDLmTaqqw4=;
 b=Sj8DVxCWIFsecmhmnClZQ5u0d/Viqk0DDAqYtTUZYC0/YR8xgSPLCjEaqkvFttdgAFoPw+veCoD7nFypAmHQxl7TuE7KBY6gf0sKs8Rqyy/z9hE3snu8w2/bZCyR7DvKpTX79YMRSYllLWZnjdjmPerTfcmsQRdbe5xczMuCTUKQvA+XoAp5CDe6rwj1NvgM7uXwnDggPEolHUIC47LWA8mx8mZfyblYwPZ4Auwue4fN9u63BtYN7RMtG8I1h+6Fy9o0AM7GQNEaLahhwkSW7BFvNwKvKIOpLtiixm9f1bWemp1sO5TRDx8BaJfUCJmHNGY5oSkWJCCp9A3UaEeRMw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0723.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:fe::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:10:43 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:10:43 +0000
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
Subject: [PATCH RESEND v2 5/9] HID: multitouch: take cls->maxcontacts into
 account for devices without a HID_DG_CONTACTMAX field too
Thread-Topic: [PATCH RESEND v2 5/9] HID: multitouch: take cls->maxcontacts
 into account for devices without a HID_DG_CONTACTMAX field too
Thread-Index: AQHa6Yv+ROpT31L5LkWmC+xCy7IhrQ==
Date: Thu, 8 Aug 2024 12:10:43 +0000
Message-ID: <C885A405-B6A3-48DD-8F30-1E16FFD262CC@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
 <8495C8A9-5B99-45A8-95CB-623682BF8982@live.com>
In-Reply-To: <8495C8A9-5B99-45A8-95CB-623682BF8982@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [rytfL9Ga7Q13BNyB3Du2F8eb7Iw+TOVRhwqKo7jll6LvyPNAzeFweUyof7YPOyB/V2x+JANQpGg=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0723:EE_
x-ms-office365-filtering-correlation-id: 2fa9b8de-1c87-421e-3603-08dcb7a320a0
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: YPG4ktB9iyCQebyo7cm9xBfbom19s4nZWgGDosAqzHNOOVGZhPo/FNdIu2gGoYXsulX0pqsa8WuHfrf4z7cdfOIRc7CtBKf7OjYiMnXrCfFsu6yH2Ww3rCvJ5yGHB0hnLRogXEXXMB8hO67j6MVw/3JC+aGPOQjIfcSzW3zy+hX4XqOj/u1HqkOGxQKAfXdr7CxMBF5rFoJh62gPyoDZI+vucL04bAwg/JOnwVBhQ/hdYthyJrVmGRo77l3tJioD4j6wkrv+Oh+Z2KFJogiFv4dmlqdEVbCx+Yb001dd22lUSgO+qag0PpwqHqJcxb87XAAryY73LijjG/PgGlIaoaEDgdU0BHB7m7i/4zeAZBh1bDkwAftbTQYgwEzAV9pw1x4XgF0cKqCluj9+zq/G9bSaJ7DxmhJfdpzQPoIVyoeYAbqV0xJXFZMJoZEEZ828agH4dLXsW6Q91Ri0t+38v5/KFARr15ByPpaegoPxSX3WnipzB7HiOHC6Y9O2m9Cra2B+WrHtez2lnXC31utEdowOBzyyO7sYhDOW1JenKaRqtMJB6uD385mnYJeFQzdGeimqWQaPxW3gyj1af3hjJ4XVH+pLpNo0uJSKVdSG3oN3VUzHCWLdpd37yS3kUtD9Hv2Qd5snfv61dFi46qVYw8YJFZjjvBjuVVLonGQ0xJhBFDvhZlhvCBFc9al+OnVD
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WwNcCVRJJ29rtgloTWZch/jylDdU5sI6M0DqjbaCO4IRrdmytC19bL/74UbH?=
 =?us-ascii?Q?PBvfiH4SgEq05OD1OkzYkmKEc477NDhPNMFDmAGE2BLS706imXWklxcKmkc1?=
 =?us-ascii?Q?a1fWvfn3ImG/BZYcFvnVN3DdGiDYm94TI9ywk+H4K0/uLg129/dEAxBJJ8kx?=
 =?us-ascii?Q?XBrW9vS851Y3IMuelpMprLAengDnCykkq2GwpJh72HFPh39QIgOqlt8bbM5i?=
 =?us-ascii?Q?mBl8Zt76/g39VLx1qf6VFcEgRqZEYJ9A2b8rQb1O/WXLOQMyYKkoELc0C2QM?=
 =?us-ascii?Q?RR5Aon6jsKGvit5JUpnZhDBTrZSiSJLym0lnHPfGjMCE+Afllmu3Z+BMxrXg?=
 =?us-ascii?Q?nRD2tvlZh0xHqvBQWYCdpFHdAB41BSt2MNArCVb7FmjZjyFxbFI0cvzHxllR?=
 =?us-ascii?Q?Q+Kly0Ri/SBMOqDLKiELgHckS1+k2LJcJacLAE13Bf/3yCOgmnptgXTOzzBw?=
 =?us-ascii?Q?xm0Qu4g//LhIiyuAeYN4wohZ6xRbaUXs3n58xH4hCbBCMnzvlN7VWREEKHnh?=
 =?us-ascii?Q?QG2+x/uEagtr7U0r8aT1M05kea03DxXX9CqjmFvuvPyK17pFIWg89evSvdOB?=
 =?us-ascii?Q?Cl0kNXGJobFtoa+CKCdvh+zKEbRszU3ErvMqFZCUkv6Gju5D/k039pikTriv?=
 =?us-ascii?Q?yRLNPmOxQ5i4ftHKs9QcTrRcogdKlZNHbdcalcXpQ4wCtTrqPPBUHLhCs84Y?=
 =?us-ascii?Q?K8fliZdcPwFs1Jo4jgBKsMg260GPJPdrZfOUIgyXXzpWVEAOUV8NpEIeXj8t?=
 =?us-ascii?Q?Yd9va+L9c3cTuIlUjQiEZIeohF3vUKhOeCgGUDQwNiTa2jlKwultsk88FB8B?=
 =?us-ascii?Q?Awkq6iSo5S+Bs/XDXT2HDjFCuY8JwUL4QcLvZ41zpV4MX+5+4eE23j3Gwe7A?=
 =?us-ascii?Q?Y87p6vwVtx29DadIaoP0sfP5yTRX6tiQqr1/bpwBtY0lyyZGfXR9I4Vp0coA?=
 =?us-ascii?Q?AhPR7aKmSOWJO0B7nLMqK9V9vQs4s/FWx2euz3L2srkRN1ZLiQZp/H8U3Sqn?=
 =?us-ascii?Q?gsLsy/759RAofnoQpaU9GTAfzI/6gfo9ijXxIT6BR1pXfy8EdgwgZqoPblNg?=
 =?us-ascii?Q?b6yXv7NFzSz8ri7jvwAJzYJ/BAMJgfZPRqXb7+gSYh7asD4+jVsjxaEUoXpk?=
 =?us-ascii?Q?8SrLivI2n3L3gFf/BpTXC04KL+MwFt3b+rk5B8vbM6HY4EKI18lDx1of38cj?=
 =?us-ascii?Q?TBKDD4yGzI/wceEwyFlL+Ddpkh+xGA1VLOy68xeE8k4OZfuXF0x+mKKMO/hk?=
 =?us-ascii?Q?TxwO7e/iffQzucoOuB5L1vK3xIzzTCLPJZ8r17xADxNBsd7oJmo/BS2fPPct?=
 =?us-ascii?Q?Tr/qjiiynLjfAetav50ZH+yz?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E7784C36D7B6C2489F236C87A791E3C0@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa9b8de-1c87-421e-3603-08dcb7a320a0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:10:43.4187 (UTC)
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

This is needed for Apple Touch Bars, where no HID_DG_CONTACTMAX field is
present and the maximum contact count is greater than the default.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 571435da5..60b675cd1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -490,9 +490,6 @@ static void mt_feature_mapping(struct hid_device *hdev,
 		if (!td->maxcontacts &&
 		    field->logical_maximum <=3D MT_MAX_MAXCONTACT)
 			td->maxcontacts =3D field->logical_maximum;
-		if (td->mtclass.maxcontacts)
-			/* check if the maxcontacts is given by the class */
-			td->maxcontacts =3D td->mtclass.maxcontacts;
=20
 		break;
 	case HID_DG_BUTTONTYPE:
@@ -1309,6 +1306,10 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	struct input_dev *input =3D hi->input;
 	int ret;
=20
+	/* check if the maxcontacts is given by the class */
+	if (cls->maxcontacts)
+		td->maxcontacts =3D cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts =3D MT_DEFAULT_MAXCONTACT;
=20
--=20
2.39.3 (Apple Git-146)

