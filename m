Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23064949618
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94B610E3CA;
	Tue,  6 Aug 2024 17:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="MIaZ8EJB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2044.outbound.protection.outlook.com [40.92.102.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDBF10E375
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:52:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nww0OtRcTbev+JQoG9qsmSyKaklPeQ72le/+FJ5nqlq3PjWe56QhbW+LBgLFaHfTUbYWsbFEvX8V+901JSr+mcXR05BZt4wsbQEaHosMyH6SxtWoqRZ9LkJ8N8WLicpqM0ZSAp8+okilFzbC/7deEemb5tQ1wGPJEfMOiTJRCYsA9Np8MJzm6LhmymGmVXtl7ZZk1qCooLE/7ua7gVeuoHXmRzQVUvDAp8VpKPwNSYC6dJp08yNSiCr6TTFZ0evzzvHuKh3gpcGvmbuXUTQ6ZAOzDtN7oj+RQ2PqRyIepZ1Gzc6oEhED5Uc0A0MvtVP84KE3u1Nq30w7YXzHdmRMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=X4RWWXNgsK5hQ61rrNCEW+nC3YUPauLl/W5tzO5gUb7Aw2YM3sM0s6pUpsqHlrKoWOJ9/wFUIiZLmQ2rK68PmlQyxLDw8gL3RvsOYiEmXFkh0wx0xZpyDP/6U2IplVrEItVRVbwaGJINl35NMbVaW4h3u3MxZlDyu16p9e9rxZcIVRKxdHbdbmQIyTnmtzjvDAleUehZOXMiBU9MVT7+Qw+czZx+xU0cdVJkQMWjgm2ATJVPuNXJiNU/5FYd7EuUowM1x02hkhRoDM1mC1F5OTAo9KjJUTBsCC1e1x7DEqFgOQcHEJwvJzmsM3Hh2ue7gBta8ZPYE43+MeX20ZR++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=MIaZ8EJB1sUKqhEjG+rvtN5FTkeWaIzbs6RjkOI/ccSnhlfW4IU5fpUTxX9sCfx10DNuM/n19JMiWMERPojMMA77L69KfYfddYRoMM1SrO6Auq+sh6nPjFmWQuyYN1IVkShX7tGsWiMmwhQwnGIjvjCoj2q14QNNQZVZcPecrZ8AyjQX1asS1NCbGuZC8nsUTBbyuYw2JdQOUV7Wy89PoNq61D9mdlFaSb/cLP/bpZCgMWaKOE5le8IXhrQ63ScSJmkgEoFcaF7EFzJNEFcFM+km+F73JAikKvrnWb1/jSqA+hoEURtZ3UdAr7o/CiL+/AE71gpgm5k8kZgbxqaUmg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB1046.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:52:07 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:52:07 +0000
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
Subject: [PATCH 6/9] HID: multitouch: allow specifying if a device is direct
 in a class
Thread-Topic: [PATCH 6/9] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Index: AQHa6AfTXzzJ/JF6skiWN3sUlqa+rA==
Date: Tue, 6 Aug 2024 13:52:07 +0000
Message-ID: <708F206D-3571-42E2-BA6B-5AD9EEF66073@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
 <C0F2E161-BBAD-4AF7-B39F-015A5A609CD4@live.com>
 <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
 <9223E804-286F-4692-9726-2306361F1909@live.com>
 <C2CAAA64-500A-4D76-905B-DC3E2A884941@live.com>
 <BDCA0457-7A04-4705-892F-CC8DF493DBC7@live.com>
In-Reply-To: <BDCA0457-7A04-4705-892F-CC8DF493DBC7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1rXyefyAd4du6axD4T4TI6TaWAibKUOqrTVFNx349dzHl1wc/h/ohhBxEwOZTVwfZ7MYF4DUgM4=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB1046:EE_
x-ms-office365-filtering-correlation-id: 0e9829c1-55ad-455b-bb9b-08dcb61ef61b
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|461199028|8060799006|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info: afzkGsFwFavMgQjrTREFy/7q0uj/qpJvL2Q5dFvlE9DtLgnIl5c3BLm/oF7i/8KRwHe+Zlr0b4z46hDmxDwPMYkca8y6x2Er0KH/KPzyYQdOLTCiGV5iyMIkuvuV3x55ELqyHV+7uMvv/4eMqOTK9MLk6CoexKVKhA5p0OraQWObv9vnimK6j3gkoeHPz4twjdEnSOaro0rpkd00GuMLKnOgKmOe/271WE0MAukjF4vJ9V8OfpV3qQ0hlOAP5r2qa7eaccFOGc0kQZa6euamGmYyNFgYBa7uBjMHeAHFjoqkrgZNSbapZiDDh9of+umnWJFEFFSoUqZWg3T9hW6LAFKJ0NAfpnmQqm2l2pTuZMYxuRanqdXNNRyLj/UzpiA4ANsJC9CyaNgXaVah4zLXmS96xCbkyx2mZTW/eBkwH0wOrmlzU9pona+m245e5p6w//RrpP49aLTPyeleO5o2VI4F+CNn0Rcb4eUvaYGJ52qSUwB+R/ZhwmmlbDiFIbnR5V4LUOqbagScqmcHwvGypfkPbuPcwtnKZIuljKG16aRW5E/y94Zl85FD0zFt0R2rPtyYbyzBbXu/mfcyEvcOuTby8Ib8YPM8rVWEW+7B85W3rKLXaBDYlHtcwW9yRlQXTqfvrSGG8jNob0B9BK65viohYH5RCW5wl9PcqugphmG/DlSS27kmHHg52ISlYjkJ
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?96Q83/xG935NrOS/indTqt9QYGd2BFOJotyl584av3ZRz5NycgzLJ/3vFPtu?=
 =?us-ascii?Q?vI+xMSWyxmkuHmMCNG0xgk+Njnpm6D/CRw+sz3+I+5TIH9yDtlfq6PZ8Ic0T?=
 =?us-ascii?Q?fozte3uQUUiYR+dObhrJ6J0JdjAqw0MyNxaBt+f83U7YMpaWD3xAAYjyYHid?=
 =?us-ascii?Q?ZgBDJauFcPy+4qG/sXD/poF4Bmr1RbmN1qJegwCZeB09JKLavdg/emrCh0vf?=
 =?us-ascii?Q?qXX8nWZHN3joJSsSIOwyntQxi1z8P5Y8cyLehaW6ua+JCrBfXQSRDoXEsb65?=
 =?us-ascii?Q?PPQe5522lRBj9H6ThcrdwBqBacyIuC6/ILFCyR/5nRIs/HrZJPHEbTmsSSP+?=
 =?us-ascii?Q?WHS0Ic0IZTHlcqr4P3mfGC1FUsEy0f1Ym8QjquwCWGj9+RL8I2fkNfE7Mm3P?=
 =?us-ascii?Q?+irjFZr0BE1PBIhkuBc5dMBYt2VywbsiGY23v4obS92pvtXtE1Ug/RqcUrup?=
 =?us-ascii?Q?WIsiCQWy0E0gTY/cRErsqJtA9ggDZE2LzOvHMfM1cv8TX7zqxRNsrUNfi8qa?=
 =?us-ascii?Q?ItDqMSymGM7DfxSS2gtaHcX+kjYCSfNQi9eZhklbrJ2doYNSVWdnzY/XCz2Y?=
 =?us-ascii?Q?9rCuXxuBbVvksq7+m5kToMv7S9D3upU0GY08HwH5Hr7zOzyTc0Q0vU4UN6Kc?=
 =?us-ascii?Q?MiCW42qmD8f68QPSUWXLEsx/QkslZFVCPnMExqx0SPmOdwpRb9KxxDjp+bwd?=
 =?us-ascii?Q?jedgfZL9tGyRYLBtGV6no2mN9noKrr6CdwjBAkSwICNMnXtbmY82qVKtGOTC?=
 =?us-ascii?Q?UlP4+Evc4Zwcz1Pyl+T+2lbVDDkbmZ356Fw+N4qT0ceB72uQxtDaBjjD5Nf6?=
 =?us-ascii?Q?aSRet7YdHO+2OkiJVByD2+b05zcFlsLH6glk+YgKjvQbLBxZ9JVrZQmnJoQG?=
 =?us-ascii?Q?9krqwSCq+YT/N3WqypNSQkRmNDLKywjj1ZkXVmKBmoqie+gfWiJ0V9XMND6i?=
 =?us-ascii?Q?8lJIV3vc11MJhTci0CLOcYJx3XYyInWqrHprmpes7MA2ZGqXBqjQlqG01fkf?=
 =?us-ascii?Q?ZyvmvPiEgEoprqV3Pg4LATOyTe2v9pQ2xRuTE2kAGlYQmUQcZ7XF3a9meplC?=
 =?us-ascii?Q?+y2qrt3nyiCnCRGAJcCZ62bVqlydE7Xd6w/wkrgGzxUx5jcjoWoJOPHM9A39?=
 =?us-ascii?Q?s7eUcRCxc+ohdwPd3WG4bzjoRNLNMBY5xp2DOR4HvJeCLN0QAFUBNZJQ1rdW?=
 =?us-ascii?Q?T7tXiJzUYVerixf8vhCfMtXQZsGUDgmnTSST7P524osd8vxuZJ0BEPGIIVah?=
 =?us-ascii?Q?wdswcvBkAOWl44LJPYDBu/yFF1igSMM2BMDhmTwMsdUaSDkwDAlEf95lVRp6?=
 =?us-ascii?Q?O1JCaD5ZY3ZriOUxoZJiz/1C?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DFCC3DA2F08DD44B5BE816CAB7EDC9D@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9829c1-55ad-455b-bb9b-08dcb61ef61b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:52:07.3500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1046
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

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bars, where
the application is HID_DG_TOUCHPAD even though the devices are direct,
so allow setting it in classes.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 60b675cd1..2948fbcbc 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -146,6 +146,7 @@ struct mt_class {
 	__s32 sn_height;	/* Signal/noise ratio for height events */
 	__s32 sn_pressure;	/* Signal/noise ratio for pressure events */
 	__u8 maxcontacts;
+	bool is_direct;	/* true for touchscreens */
 	bool is_indirect;	/* true for touchpads */
 	bool export_all_inputs;	/* do not ignore mouse, keyboards, etc... */
 };
@@ -563,13 +564,13 @@ static struct mt_application *mt_allocate_application=
(struct mt_device *td,
 	mt_application->application =3D application;
 	INIT_LIST_HEAD(&mt_application->mt_usages);
=20
-	if (application =3D=3D HID_DG_TOUCHSCREEN)
+	if (application =3D=3D HID_DG_TOUCHSCREEN && !td->mtclass.is_indirect)
 		mt_application->mt_flags |=3D INPUT_MT_DIRECT;
=20
 	/*
 	 * Model touchscreens providing buttons as touchpads.
 	 */
-	if (application =3D=3D HID_DG_TOUCHPAD) {
+	if (application =3D=3D HID_DG_TOUCHPAD && !td->mtclass.is_direct) {
 		mt_application->mt_flags |=3D INPUT_MT_POINTER;
 		td->inputmode_value =3D MT_INPUTMODE_TOUCHPAD;
 	}
@@ -1317,6 +1318,9 @@ static int mt_touch_input_configured(struct hid_devic=
e *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
=20
+	if (cls->is_direct)
+		app->mt_flags |=3D INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |=3D INPUT_MT_POINTER;
=20
--=20
2.43.0

