Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC594BCF7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B9C10E6F0;
	Thu,  8 Aug 2024 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="kcCFuYxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2076.outbound.protection.outlook.com [40.92.102.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92210E6F0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7P51e6IbkkFMY8DREFPN5VEu/2zWN/QNK3BHwQ9qfgGmqpqMWPW9L0dsIHJJSOF5d4NHVYbDgF2+RhgHB2batl+CIZSzAqsLXoTeP3OX/t9d47utUHFaAF21lqKpbA9rgU7nYDEK2gYBsSVl4PBfIdwPyFejk/397DJh5R+zOKi1uNzZ6jtEQ8XjpXxW/EU+NxzYel+kD10nRovZsRpyCbnv6jKow8S/XXoyf/dX+UN1/dEmOV3P1kBBz3L+/b4FRfP9FO8qpMGwXzCQ/WEDkbmz11agNoZ8xQJ91Q8VNioYDlMf4eJANhagi/xvc6jaawpMHu7e2TTlT5e4RMQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4PHen4032PcthKi8HoFeGPNif8f7CRd94d/mUAn2RY=;
 b=I5N9+OOzPd6cQ2Na46LKt2f5IwteyZxoswNlQgpCxtTzXuIbMkJMfGXAK+TIqgaZfIq88g4jlkRBudaV2xoqlVUZJrS1Q2Ej0Lkp8ndyz9HNtz+J4dMRNTO/fSfX8giFy2LpO3eyOFgbJT2LckBnUGmVpID8lRcgTsKomCnoaAWEDG72kMxVJE4O/+aMQN1ycph30zMQ9lkfPGmS6eccB+AZJrNNf4aHzDPJaFle0m6/pQAx5TooMJDvXGj3o6wda+xrQojJw5DZ69qdG8QPH7xhWoLcFqspgPn5KwCEONzP9mdfZUZacTuhAljK5xtBvd7CziImJpnWnHTVevP7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4PHen4032PcthKi8HoFeGPNif8f7CRd94d/mUAn2RY=;
 b=kcCFuYxUIzitqB7F/oT9D/53h2ZP+qvwoA/g0OY2reH6xHbeAnriO6MFxHvE+G8tZlrasC7VwMqs2MithnZd2eyFTGLJAQjk8skHLoR3JlU7ET+ScqN3vzxkNeeQcTBaT6Lr+GBGjuSSf65Xr6T2Wsit+HXFjavwyF08fjeH806kSzof3jVKuQpTV9Lhd5CnbzSEQR2i0v2g+UF8n5e77bTqsHkIObroSky9cgA90MeAGNL4I5g+PwnLPxmPw9umLigpIwHNdFDw40xroGB2aK10BEVvqxZmjCvrBYqjRIdDzVj/tjwARiJDQAKyGkdmWusdASsNl7SSYE1NtRsV2w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2144.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c5::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 12:09:10 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:09:09 +0000
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
Subject: [PATCH RESEND v2 3/9] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Thread-Topic: [PATCH RESEND v2 3/9] HID: multitouch: support getting the
 contact ID from HID_DG_TRANSDUCER_INDEX fields
Thread-Index: AQHa6YvGyLS82XPhJESTQJ7WrLbR/w==
Date: Thu, 8 Aug 2024 12:09:09 +0000
Message-ID: <CE1720DD-CC1E-4149-B499-442C1E03333E@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [/oYVw1fWkOjP0WAYdqps6qtWWrJlP07nxycMT/lSsd/QTUU3Dl7F1pdshWxUJf0K4oJtcJC7l7I=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2144:EE_
x-ms-office365-filtering-correlation-id: 0deab4ed-79f1-4080-b325-08dcb7a2e8a4
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|19110799003|8060799006|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: mlBy5ckzbJF/XwMwm+Hm9y0FL03AG4EGcQ39vypmvC0l51QnHvsP3TgV0UMMrKTJs9dh/y9kAx6r+DVpnzj6GGqmIZ5VZdSV0FF0d0Pwu28pXTzJ9Dbi3+SLo8TcNO6HUwkJV5xaxrdIxY/6igQcJnqdsJF9XGrrdpG5+wIzT5NMKK8sie9bIMg50advlsFqaKQRqMvEzOA/XUC43GD6idnS/iZPKGBTslqHxEDmnbyKFtcYIkVqg1GVpCdvCxtFbOS6WkxV4X1g50fE+u3d0bDIkyDAdvCRgsqQHPUJGGjw14FOFUZLZJDqehu7IxEOHO7qjJeJdEeKfxEiwJe62j/AW8ogINfoqmHE9BhlevE4Q/uhNdV6PeCSj9gs1602fIMPGgQGgwpR9wH3kd/bgbU4U4s6jLV0sWWHOY51QI/8IwPZTvCT5otHNMOW/Z5qGONjwUFIjlAHT/1BgwirBMNJTwct+2d0MeSwFAL8Xiry7MMWMgSw1OQdoQoZh8wTVbfX+Ml30CIkSzUp5TdZTbIsrtrz2iC/w/6skX3mgFVtvcjoCok7y+iAgctUNx1ah6vZKyhxtloD+HbYHLrxwWin8p5/XPc0nJ7oIz9hcw99ij9mrtqOtDwfqWJgng3w+iFKGAZb/n0vueAwyIU09XcWGO76FnqfnPX0iiyH6pbsZeX9H89LgrPGYbR+rhTr
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EOHrXwbpoFwmr0RXn8Mbe2QLqP23HfeQXbBf3w7d1kKMitrGGFvPMXFmn+/z?=
 =?us-ascii?Q?2DtLtLKKimbB3Jo7SI84alTdfmd9UnHsuQ1paZFflMHrA8MRbFlG3iF7nSVB?=
 =?us-ascii?Q?+/6IDg/B+2D36QgSd6+CoJcyjeJnf8k56FT5xPVh8npEvPWx7BabpPvXuUpr?=
 =?us-ascii?Q?01g2Ft81fFNXNPqsutugnzm016wHitYecUYrbmljkSGqujWqczZkKwlH+mt0?=
 =?us-ascii?Q?I9XpX2PqQ5Zi83FXq99eI9C9RLYKJyKp6A9Z36MboBrOg/U9C3xcyUiXmgHN?=
 =?us-ascii?Q?B76C3hEG9PnPMuyzvexeQsDemdhbuiFqbJGjCgUhiaz4qzNaUFlSwlFprzkN?=
 =?us-ascii?Q?CO6XUcu6wn/1aMCTdRY/Xz7u6QIid4Qbk7rBJZu7mEhlrjVqnj6zAb8Hwa0w?=
 =?us-ascii?Q?KnbT8eHWpD5UimMhnbzK/n2KVOq2iLxcymW1gbwbPrcbEtR75FDyiODoTEaT?=
 =?us-ascii?Q?v2Y0dxgea+nNRnopl2uWjWE8brrITuNc6i3m1YSCsBaulWH0R+4T+M3BxC1b?=
 =?us-ascii?Q?rEw57dDXgmzPZOLraa72IgM2mqnLugUciqvXaf7/17pxB7tbPlTt/c/thMr6?=
 =?us-ascii?Q?o0g5Sy/W189eGAKm9687+u0edomZ6/hD1ce+3NZAKgKp03TGih9Q2NknzTvq?=
 =?us-ascii?Q?iuQs3cGoFUtIJvrDqIT3OLl+373AhrfmM9hlUwidd+uFC4Y1B6ern1Y5Mk24?=
 =?us-ascii?Q?d5qu9YftFQ2lL6gbYlusY2kzbGGxc0fJw3WAZRZs02CypWbiY36IjsJhVCYn?=
 =?us-ascii?Q?Nd/BV3u7BPBSPK/4MJmwnH4dG/JlJAkEjwKB7ACPh0WeLsaC30IH3nA16fWq?=
 =?us-ascii?Q?HMQTyYMSzcNOjys9INmYqBW/hkPM9bTyDOiVOgDtG6Swux9W3WRuzGxWyvAD?=
 =?us-ascii?Q?C8E+9/zntFVzy+eYa99U0UCpq7pt2BSEucwqq4dzdkjKKMV9gsVEnWGZ4pkW?=
 =?us-ascii?Q?6y4AF+k1Fc0G0zMMCd1l3eiuJhyufCS6Sx7bJjDya2tw4Q8wny18yZ0ulpdC?=
 =?us-ascii?Q?4QqtA46SUvML9yBClz6N4EF5HGFRlFF0Ij51QlCBaKmHuYp5O5g81sq3gflq?=
 =?us-ascii?Q?YuJS8ph/7Hwn3Vpa+oJjrLwrkhG6KEsVI9SLf4BUN5+Bz3o95Ec+yuh/5AsD?=
 =?us-ascii?Q?xACHhG4xfu/GvfW1F4X/KnZsM2Z6AH3nqTgwTjWKwWO1bD4h99busHjMzBjr?=
 =?us-ascii?Q?n3d94kwCMK0u1VffFaIayDGr2yp2EsBgvsrtTF7mepO5yWQLJ9wdowphNk9E?=
 =?us-ascii?Q?8A7J1CtWCTv94yrvi4IJcR254XeJAQoPE08A5FKZ7N0Qc84FDvO93qavcwFE?=
 =?us-ascii?Q?1M0C67XBZtKHfgA7jRRKNkuB?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <ED777ED702537048B0485A11A6E07898@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0deab4ed-79f1-4080-b325-08dcb7a2e8a4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:09:09.5165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2144
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

This is needed to support Apple Touch Bars, where the contact ID is
contained in fields with the HID_DG_TRANSDUCER_INDEX usage.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841..3e92789ed 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -635,7 +635,9 @@ static struct mt_report_data *mt_allocate_report_data(s=
truct mt_device *td,
=20
 		if (field->logical =3D=3D HID_DG_FINGER || td->hdev->group !=3D HID_GROU=
P_MULTITOUCH_WIN_8) {
 			for (n =3D 0; n < field->report_count; n++) {
-				if (field->usage[n].hid =3D=3D HID_DG_CONTACTID) {
+				unsigned int hid =3D field->usage[n].hid;
+
+				if (hid =3D=3D HID_DG_CONTACTID || hid =3D=3D HID_DG_TRANSDUCER_INDEX)=
 {
 					rdata->is_mt_collection =3D true;
 					break;
 				}
@@ -814,6 +816,7 @@ static int mt_touch_input_mapping(struct hid_device *hd=
ev, struct hid_input *hi,
 			MT_STORE_FIELD(tip_state);
 			return 1;
 		case HID_DG_CONTACTID:
+		case HID_DG_TRANSDUCER_INDEX:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
 			return 1;
--=20
2.39.3 (Apple Git-146)

