Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1F9557A1
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712CD10E093;
	Sat, 17 Aug 2024 11:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="EExkK1Fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2066.outbound.protection.outlook.com [40.92.102.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF2610E093
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kO2nycgBDJCBuhoQdkWLedNQTR+rXiG3AC+yDZ0P+Kke6EtvpOOfHa58aZch2+0/ASFa9Bho08XEy+0zJUz8XkfkCEYqP1Ykvi96o55F88c/Jyy0spYLO7SaRcDeCrZh8E9iGe35raGQbp4yycBo9TgYd2TGFcS+/98OtX559mTdThh+d+tw3DoHgbaScoErOKedvSTSzGzmT5N5X9/KijyGpV5JamUif6/ISMrmYv2GiVHty74brBIbgBkpGQfj/PFVi5LBJ+6btEFeb/Dc4evXbIR9T4Ro9oHRE0YtMCr9Nf7kuLdFOMVEJdL/9v5V3AXWtlSVi8Ikrafa89GWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=NH7yyEtafIRiPSaZYTY7sarJKQywDFxABxzbiPr5h1+plcGrDaOwQPagMZ3QiDrvanwjA4W8ZGrb38s80jqcDo+V68ED02H9J5yZZ9kex2r/BMAFL39r4XWkyVIKMO4rNsmGaP+XZnA0N4lZJajgEfqw69uQZS+lQPjWp7bh8Vx8HAsT135XxvQ7Kr0Hn6zXPQVSqZnI5RR38DzEJUpgLlwzg/Nf/dA2xlSRIrePZYCZovTKKaJsVCTMQT4ZOh8YJ3COsu1FCWtydPtzT5iJ4itn+YfoHbGC4BzVoHSVQKVMbOko6HAx40SytdIM0NjrdKQF5P0w1LZts1/aQpNGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=EExkK1FyfhVb2xJB9MvSwNlaDH1+oji/o0lZoQsN8LDsOQicLJTw0dIOAh679yR4c4wh/OVRnKZPFz6hUsv6jfmD2LqUT8u3Mw20S4RhIE10yRSIA+f0EvHlU+JZ6xIuUv1OUwYBe0VL0UpYY4euMi5g3nVB137DzHIySvLnEDk8EAhRhnTgto1HgAXJVWYyJkwY4X/mk8rHORCcNP2WqYKgpqNnbShU1LN97qDrDP9RWRnXN3VqsCe88AvKP8PK1iOT0echsm0Kj79EwGLNrXUfFeKtjy9NJM0hpSOvwc7OjNFHJYoUlYJaGomsxxnkvwBT3QMcZ8Ww9ny0HUVZHw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB0241.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d2::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:48:52 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:48:52 +0000
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
Subject: [PATCH v5 5/10] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields
Thread-Topic: [PATCH v5 5/10] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields
Thread-Index: AQHa8JtuGQaG8LLg5kyxpfXXHJcxPA==
Date: Sat, 17 Aug 2024 11:48:52 +0000
Message-ID: <D5DD1AC5-2B2B-4301-9AE1-B939466FA001@live.com>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
In-Reply-To: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [98PHWyToOBdokOQ7FGATaYV6lIRHWoQNx8hF+dQQd/Bw8hTsHLB+MCOrVuEogJ7pk+WY61OqaAc=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB0241:EE_
x-ms-office365-filtering-correlation-id: 81ade7e1-b17e-41a8-7b0e-08dcbeb290c9
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 4fFrrFmT/xtrEpP+REqiJy2owTrzD9EK9a5123giw7XbG0aSTD3YxGvZHyRQ54K/Usm4A0YdD8jLL/7i1hdKUVSyVc08pD2xHVViufflm3DY+wNrJGWMo3y80lneLiC5ufYV0DVNr866JN5/zm3Cgprm59v0AGD1p0gDiuGukAyJJGA4GeK2VG4CCOHuwQq0f0HkJPeO3v8ZXtywiCym+tXO5Q6alqcwNB8tytEuqsAmZ2iIGFS1WTS0XFUS+8JPZGG3xBOtY8pjpPxq2G+Yj1N6qh2dNbbsQOEOSc5tNOuMMPdJbndJYpbivh0Vz3FRbcV2P9EU+QXyHM1dqLXMHE4MtWse6hkTE9eL4vN0YU70sitep0dTdEADRNCR4+NAVaRjR3gd+Im64TTzSyJSqvLDQym9dgZZHqwiAVNJ6Xrc8YXLzAZuJyc5kBmg/ZtNVGDX3176+zIOxsbrwzZxp7A7Y4FcDlYQQMkURRmd5OedjMJhqizpE9e6mdz/XwuriP2ZUZdy/X71wMai7Uw52vMD8xDeNecrtDe3qKNHByK+4ppvWAIjNPw2sOXyd6lFsVWM1oQMIQWPapBNhY8J60gLa6dL6S5jg8TfyjnJbYAR27UQCKi6J/TqH2ChJ+96MHIvpfKrTwVLy/LvnKCOv+ppSsi8dmDVpGXgoqNbEfcHgXoL0hQZlVydJN6pKKJw
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oSeMMmt9Vn/RF9fJP6iDCCY+nljCrw2mU8driiFetfd7zFkt7MJvHoAhy9?=
 =?iso-8859-1?Q?TwY9dc/okZ4xyNgmfzN7C2VWS2wVRAnn0lwPpVVPlAzciZpi6qlZk5mKds?=
 =?iso-8859-1?Q?5sXM4DuPrlsKpJPaLWe+SSPbMRr76szGCeIpLYlIDdpNk5TXQZtiOlhIUI?=
 =?iso-8859-1?Q?qsIKUY9RzfwZ9kIQxtiROV5dtLf00W/ZHbJehMaAerF0Xp3m0mFvXCvNEB?=
 =?iso-8859-1?Q?te2uyf74cmRAk/3rOHgNvZqvHOqAe1YnbOhZ5BiJjNRm2xxYoZIi7Ywww3?=
 =?iso-8859-1?Q?W5UGNdNerAlUX5uWc64mzlE6ZrNl+iNC5Hu0563dGXu1/9SaP1PFlduo5N?=
 =?iso-8859-1?Q?f0ntxyFmp4GbOrpUht9WyS/daN1AtiE51iT1/vxeAHR/m7E3UQVqC32y9v?=
 =?iso-8859-1?Q?oPklRJYT4cFFzLdroP9oVre6lBBtdnfJfU9zWgmdheD6xhkkX8VTYgm4Dk?=
 =?iso-8859-1?Q?reNpNZ2R8nZ94RxZ90orNGEh9DP/qxCMfI6K7WVju6dSdMk5u2cwLYmd9x?=
 =?iso-8859-1?Q?cZQVJem3yYkqTniTQyFMUSyoQQtaQa4fLwV8/8kv6USh1sGxEdsmfqsVwe?=
 =?iso-8859-1?Q?Xf/EKKEca/pwn2YRkEw71c9C9UPq+YYuTR1JU4Cg67MbQpQab9v8KSfjFn?=
 =?iso-8859-1?Q?qDLwxh/85l9QpfgpC0eVEISo0URVTTgbgbfmN6Mo7DjyeC1lq0I4bhQZ8p?=
 =?iso-8859-1?Q?rLW7PJwmYeRs9Xc/tqkGWjxwYh8x7BAfwESi1kpUfKInUAxizVYRPkOeHa?=
 =?iso-8859-1?Q?6tq3JCqa3DXeScTqKJi1VRst/LvNWpRnVJr79V5GIuroFxcqFQ8oR4nMP0?=
 =?iso-8859-1?Q?Awm3FRSVW8mZpNPIlaKx1jPbVBs5v9T+VkbMUOZIWDitETRAUqX8vKaf80?=
 =?iso-8859-1?Q?D1bitLdotWSbUAmmFLFGiegBSbVb0lP9HrTTOaXDbkGhTNYIBJ0FQUgSSp?=
 =?iso-8859-1?Q?eDUyLP86hx2j1n87/CZnyCdy2bugzqXCWO8VXaTfXEEQZo7ETlEuP/yeOc?=
 =?iso-8859-1?Q?7YoWxI0M9zAnz8JjpUmuIkMulLHYKESnvoEmwb7WUFeXa4c/L6Cb/Sq7IR?=
 =?iso-8859-1?Q?2op7aBR5i5UNCF/nruWfvprsE5dFrYLoS4AjiBTTvz696sJP31xc10PBlX?=
 =?iso-8859-1?Q?4p2jgRHfvLo4IQrX/Za4eMIPQ+1wQeTu0b8hjWeY+YGuqauqySOQHpTEwJ?=
 =?iso-8859-1?Q?8u3G0wu9zGEMZSpLGc1RwXRtPDB+8JnKxMjH4EPUCSXQhaqd9EdsymDKoV?=
 =?iso-8859-1?Q?xMpKhSHfvrOFJwMsHXkvxDoPK76oJN5kX/jYlScfWMaKFsKtCfml6uciVG?=
 =?iso-8859-1?Q?K2sF/W8GkaP+8e0DxpMnq0L/CvgHPDZ00yGSvyhCcWUovpXiJcOYGgSA70?=
 =?iso-8859-1?Q?+dz1KEUn/2?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <260721B35BDE004A9EA9EB76646947B6@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ade7e1-b17e-41a8-7b0e-08dcbeb290c9
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:48:52.2154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0241
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

This is necessary on Apple Touch Bars, where the tip state is contained
in fields with the HID_DG_TOUCH usage. This feature is gated by a quirk
in order to prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3e92789ed..571435da5 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -72,6 +72,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_TOUCH_IS_TIPSTATE	BIT(23)
=20
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -809,6 +810,15 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
=20
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * Let's just ignore this field unless the quirk is set.
+			 */
+			if (!(cls->quirks & MT_QUIRK_TOUCH_IS_TIPSTATE))
+				return -1;
+
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application !=3D HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -872,10 +882,6 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
--=20
2.43.0

