Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55094BCBD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 13:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F2610E70C;
	Thu,  8 Aug 2024 11:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="qjqXmB+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2080.outbound.protection.outlook.com [40.92.103.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6369410E6EE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 11:59:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKnkKVIfrlN/QnuWgO/xQRvYPaDNsxN8ewzFadNd7BgT3eI0cItMVUTvZNziAn1BP+B7IyGZgCcHuQXwZgsVkH+PncB3UkEkKfhZ93TlSUjI+mN4TxgWFifIu9EuiBaRdhtHM4HU2zt65+JADDXiXJy8/biMg/LE7PDNLZHDYZVPUd4TlrSA/oZ8N4V2E5fQQ0Z+VhAljNrIHDcHfEyIjxFpfZRWtmLUw8zIx4SgQc+JBzbUsvZzE/xg/97PD7iSWUxi0Pddm/DE/C7dgOizNzBDib7BGslonP6FiNXx4VRkaOkDuGci2eWUkX7QWdfF8WI+TAJ+3RsDj8miMKDlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIBzWghiSd/94g2S+ca6KQlE54fye1PXtvDLmTaqqw4=;
 b=X1jVWux/yAfmzKMS1iBEoKqlS4Qcfr9BNeuHbo4cIWE6s/ud9cTnchL2IV5MO2pztzPogJ+kivDEgtx7LCOhaOdcmvauUXox5PrJKSJziIGUHTdREYejdiV/e2VTCnP87KmcyQU8iz6Ri+mrf5wesJ/RDZFOEqcL1h/SJ0tX40FfYxaurZpNaBKKttRNikFHbr3H9tqeqiexPWJoDukqLPQnLgMOGzYDdHO6oQGbMpAb7U1hVRq6XyKL2uz3NE3p4QTD6rFzg3pkpI/XSKCavw3aH5vWB7eUgAIi/b2iUfQLX4oYNZJruRl7z08rKfM2OxhEh38qHX73FfDMKa8Ljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIBzWghiSd/94g2S+ca6KQlE54fye1PXtvDLmTaqqw4=;
 b=qjqXmB+Gz1gH8un44FhAamAcUYUmRobZx1KlUR3SFpAZCzYpaC0xmD2VGmrcQ/iq1P6ul7C6it1VtXBfDiGwcPVpcjPANzXf5k9VTma9gaRYOQK0I1PF/RLYiSf+MeXEcmc0f6Lnc5MGJ/QUYTQvdicn4IJjmJLdzly0G204+XHuR4NsUupB1lUWNpi3xSL/waP9r2WaTF75uOsC0WJxl2cz/7DQrjFmNJl040FOurhP2ZeaAe3ZpWF6Kh+SaRL5K0rn8k5b908yX9THweWL/3AgBXob6NAY6+abt/PjDSOr0Pj6Q+fkBceTRKYpOFwb5jov4TktNXgiA0CQ4VVGSw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0339.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 11:59:28 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 11:59:28 +0000
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
Subject: [PATCH v2 5/9] HID: multitouch: take cls->maxcontacts into account
 for devices without a HID_DG_CONTACTMAX field too
Thread-Topic: [PATCH v2 5/9] HID: multitouch: take cls->maxcontacts into
 account for devices without a HID_DG_CONTACTMAX field too
Thread-Index: AQHa6YprE4GB4W58ekuSXmWzZRZGLA==
Date: Thu, 8 Aug 2024 11:59:28 +0000
Message-ID: <53EA503C-0D5F-4648-8508-8DA12C8282D2@live.com>
References: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
In-Reply-To: <9550ADFD-0534-471D-94B4-EF370943CF80@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [2hblk00hwwCLsEXuCWOc69nMz8sdAmxYYwwyNCq8YMFeDT3rSvGhoJglLAMseVkKhMehtxVcWaY=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0339:EE_
x-ms-office365-filtering-correlation-id: fb34778c-1cf7-47af-9d2a-08dcb7a18e49
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|8060799006|15080799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: q5N7SCLDH9W4K2X3afGlGyIBVl3QZv+aCIai5JpsCYv1CDyvk0xm4Qbz2IXmPvPjGNYnCs419AGEdLzGit2JdigKCxxXknTnRvvOch1KvhBX7gpRBMqk1XNY1HvUOIvdprAa6nrMfz6htbtSkmtqHQFMdsRumIZDuKvEd5Ss9ZFFmoS28EiI7/Dkpbzo/XmVR+s2uJFSli46NnsA96V9nconaB3L60wh7IYu5CU9GXg5qpyMZHrOldl40LkIkJBoVgVfs6Hiyav3roUEUnJANr9BxJwFNDanrW0bUReVWjIwroF/pLFvsRHp2Dy6TlodNzd72tHcCSh5rPEgk2tkZ02r5ZbVyoZAgbSpSIZUSfH9y4E1ZjrZrh/zfGIsPqiSXx/hPH28ianjAp6WaecvfnKyjns4OE53gnLlRuKstZvmyZVcwyvMdnj4EOBd+p9nzPbMXXiRiA5y04SkO1du5NG3eydHD3cHr6Ro6PYFaACskxdQ++MmYD4hmanp0ZYctBUF0bk0erdYkJ4IJNJqbn1y0g97hF50UmTS8Z3wMakixOz3FC4XCwjFISC3BAW1IW2boauJpsisHtyxfYG1UgYhPJIiwRINUJe0Oe5O/mYuo5dRn0d4aZNK1lXmiCp/tY1K2M2ul/JhWN7+bOq6iZ8ODe7kE+tLv6ggBPC/i++KABohnOaSHb5dxtqxCV9T
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X9jmghm/ddvgc1ftvOKUa5612bjMPCSJO+tb2p2j1wseuLCG63CzKWAYNsa0?=
 =?us-ascii?Q?EmV7dvQeNBS2p/FCqqZPlK8b1CLzMAFYANMjGdglq9fht06ML+pemdqD88VW?=
 =?us-ascii?Q?atmmWTeNWmIM9x31bsJRh5Q1l9HuiXcaRvJAC8PELSJNKIpANfwRsVEct/DL?=
 =?us-ascii?Q?mUzX6nH1CzTj4ghmJnGUsgLpJFajw6VQLQUEMHPPukaZMr5ff9NgH02NQl3Y?=
 =?us-ascii?Q?rTpuZfYYLvnWSUlfb95/V4Rk+KHtjpxmpQMDeb6uuE5PCB0fynNmVorjEbQ1?=
 =?us-ascii?Q?5fMJWb5Mtsq2Y1oTH29Cig0YAMZdLVzx8uToG9tMJYwxUfot7I7gJoTvV6sB?=
 =?us-ascii?Q?6iycirNYsaiJSUUEgT2rw5Aumny0y+F03TebWQr8UGa1i+EgLuA2unZw64zd?=
 =?us-ascii?Q?BxxJipNDT2P29soWvGCW5IFMA9MSfp28lkzRYnpJ+ZJUO9I7O60798LJwY/H?=
 =?us-ascii?Q?1UFzP9Yioz37kwrHJ3iNgVzy81VYlVOWe7JC/DNkP09I/7/ahWCqU/rypb82?=
 =?us-ascii?Q?u1gu445v5goMjPXPbn5UJWzKZug+lLFDu+SMlYvEyLrzwGxm+zGqjhyaEChP?=
 =?us-ascii?Q?8K8yQA7ZVcVRTp+U/j3WA6HqvNkwtwoHgcxGPxbuZ5dUykZbKQHG4jsCYz4G?=
 =?us-ascii?Q?vkEVmnjUjBFKy/ma1ifIO+8lKuj+x0t5xqomaUm96I4BhNffhdVrZvjfGWJD?=
 =?us-ascii?Q?AG++vXAvF8QVL/fgBauDmOHZGeIwKVzM9Tg9tDxNbjcMap4MwCWCjWZ0RyQi?=
 =?us-ascii?Q?I7b6VSlDEsOQFLKCIv2EfpZ4SegGINYxpDVaW5xIGDtXdLtLW3kqp5SJ2eYE?=
 =?us-ascii?Q?tK+HkoQAbTc3F8Az1dhWLAaWyXLRUgH93KIyul+fBOTtcUJXUbY+Dk58f+cH?=
 =?us-ascii?Q?DRgr0MocLTFrjMlUCgVpPrNNT8pb4lb/jO00+txPAsSnnvV28cuA0xdOctCS?=
 =?us-ascii?Q?SJfPNNu6KtlPLUUgPeeedEKRP82HQUNCvnnYvTBLF/1Q7nF9bgaaEFtys5pW?=
 =?us-ascii?Q?4h1pDuhplHMtst2rBKNSZmTb1nHdB27TL5VKZYNLnI6s5dDdApnTF1ADfImH?=
 =?us-ascii?Q?ImKKqW4Q7v5tr7RzNW11Ky7Pvku7pUOV/oO2fsI7EAs8eVw/3F6Xq8LjSPqC?=
 =?us-ascii?Q?gz0pczWD8hIVdravOBTRiwh4XweM6gzXUiwnUm04o/RaiP67YRJvTq+amupl?=
 =?us-ascii?Q?FO38oJSBAZTE7r587olUSChiEJBeKe5+qHyWDnFlnCxdzmksm6Bf9sIOzZva?=
 =?us-ascii?Q?jeHkGwmtGtu5LkXHW6O7YgRuozCRvmh2NOt1huiHVy99V2yQ6mvZQuC+ic5h?=
 =?us-ascii?Q?WLGuFl6Q+yTvUy6bKdKf4Y0D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <53C2C860601E514581EAC7FA4CDFD8CB@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fb34778c-1cf7-47af-9d2a-08dcb7a18e49
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 11:59:28.4131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0339
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

