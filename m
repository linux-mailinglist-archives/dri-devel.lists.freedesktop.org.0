Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD994DB9E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 10:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DF210E0EC;
	Sat, 10 Aug 2024 08:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="k8QmBtT5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2050.outbound.protection.outlook.com [40.92.103.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609DC10E0EC
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 08:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4/SQMelMMxRTF7K1qYPAvWMNSmE5U88TFm9b/HcHntaHGQRcluYqUyAF9ZGffsjplfgNYRCWdbYkF3rcuV7DoRmzNrb1sI/qeMQKvh8vK4p2x2r4SIz1KF1bewmgcX4MTjD/nTa5Uxd89YhNX0OcvRzrM2egkNTWqWWzQQYtQWzg7UxqiJ8Z/qnTxTDciToQJ4FwcqP4QVxr9FVWg3IWD3RVmduX9l7qpa4ZSCTEjqW6h0Weq0shN0rSPxj3cDC7wrc8Q9BzV5d+u2zVSQc+psy189Ax6ptsv4ttXIweiQXdOtDyvLONDyfJC1EEmM7Vl41OArJP5pC3nLaceTVaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=UWeL6sAiRpIMJVpsxoyFfo1Ww6ADxCO7v+r41bt6/fY7xLZSct9Cf060B6RrCM4kfIPYlOn19FuR0eRkn3ApMDDprUghY5e95OpJr+0SNb87pK3Cei7ab5W3Ki+oWk5IEWXztKjQALyE6ZvChPZPRDgwtxuMxNtLzC/wiZ1NM4OKge8udAtpqvqKZ1N1BTl7hRiBY/0ZEsZelYtNYgH1sbJ6tJTPsR+ul7dpTN9Ai/jPUzkiZ3Mb3CaU/XjV6Z/wlyUO0QXzzmEp8e5O6bff1bedr5IPNmLWVTzsIyIBtjrNLuVm8MtxgrtR5+9FZhtzZn4/m8nNsHD0OhPracHImw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=k8QmBtT5fUSKiv5PYMmEjapfeVIq4HQXHyt2b3zGeWGddyk3Ugt+022BJlVZeG+SRwfR+48o7+pPyz4mmdGF3BqLWRjbTAGGBuxQLi9IhEeJjCd0kKFzSUbC0xaTFuJUUG5Kf1+/2yviNIbMNN1eP4M8u1kbAXxsGjF8oa/fiXbGyuwE4SLT4f18TP6vfVZUrKkqxqTZ0MHH/BgRd9QO+6kQFl1ldean9e7GUrajuq2mbf0odKy/uEBbMSh9Zybx605wM5p5mT5lgv6Vck9qrmPmrG4PAUbhdjVrv2Cgg34achfHZIffU1mRXtci0dd2Aej6xHR7BWPYPq0BqSuHhQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MAYP287MB3581.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:149::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.17; Sat, 10 Aug 2024 08:50:14 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 08:50:14 +0000
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
Subject: [PATCH v4 5/10] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields
Thread-Topic: [PATCH v4 5/10] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields
Thread-Index: AQHa6wJRayAVAe5z2U+oKBVaMlQeXw==
Date: Sat, 10 Aug 2024 08:50:14 +0000
Message-ID: <20E1B5DC-478B-4624-8D6A-17B1CC99E7AA@live.com>
References: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
In-Reply-To: <20190CD7-46CE-400D-9C58-29798479660E@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [lYmH3TKN5ULUViQbjaNMvg0dNABR7yE5MPYAd1vE9DKYfw7KYWQqJfN5muYgSuY1IHdjLU/pWSA=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MAYP287MB3581:EE_
x-ms-office365-filtering-correlation-id: b5b1d930-fcb8-40fc-e22b-08dcb91973ce
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|15080799003|8060799006|461199028|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: gICFwjoDQoYguBKXCFcHZ9jEZnwagTXOZKb5LpgkD1uvMcT6OZdQByTxBW0v/U8o0GG8rLDA0xw3v6qke1EmNkMwSCS3aDYnBaWeqKTX4Z39195D8n68arAZbSp56+3gWTKEs3FC2/vlHpX/qYAIqqyN1/2y55bCr3AAiqDS3UNSUhuoJim2O/5MUBlOhx3oxpn8AwJx0gtx70L9Ay33ls2mUSraOpLuKpsztPFdvMyp4B2T++J6JquRTK6jL4EZ9C86n1HfYVrwp/x7zBxn7sPR7/Kv+sOc+GTNnh9Qk8Yl1s2qxEpf1CXdQEXpnxDe+v8gGAi9dZenBltyt243HlAUgcLMcQqbJT2/kU69I5MJVRvne5C6BHuiuOHGBg2Ne1adjK7vHDy4KRzONW1ut3o1FCkrCiIIsIIhjMFEcWELQV6kyVkLNtjDyt+6HUoA5mBx9D2eQZjdziUmQdIB68ktXdtyopE44EIoNq11DQHan/V2eh1A7lZmdzMuNYXZDw17jh0TQ012VzpW2vx+QlXdDO59mNM3aOOgXTc2gVxmgSr0oq8Syn/LR81M0M2ZPL1AeO5UXgsZydk0FIVDBGH6g0wppk9cInmorZtlERYBj2mKS9lyVIbmNA2Un3eaW2cOPFZWpZaa+oiC96Bi+haz1Ak4N4kwnmzidwYxS2EceT3YtCh2OR+gcqPS1qGX
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P7Av67NQPOg5uPBbqqQlPqE0NXQCfUdeclf64bJFKMGXO3wvFYpI4+QYxcrE?=
 =?us-ascii?Q?S/3T34Un8cUAewmvSA6BsgWlpnLS03RpW0H3+sQAAq86uwt4g6pP+UE1ANvs?=
 =?us-ascii?Q?62eqEchpUWi0EpRW/E3Xz3BJuFKOczHdGDJcwZTjOGAQ5AoCjVp6Cc5Xi/XE?=
 =?us-ascii?Q?bbViarJ0rT6jtgMVuPYQQN6y2cyosQq/lzRhpxLVlDTxziym5J/H86ApcNFb?=
 =?us-ascii?Q?yvhXXecULWpUPhIMifs+ChvJXZfZVikFrG9fKleh0U0IVizHJHGP3X+uktdy?=
 =?us-ascii?Q?9V2aGs/TuRmGljtAcfsmOnl6MUPiZhoeH+XP5yl2K5M7jbtTdPMFxDhLab9Q?=
 =?us-ascii?Q?zVf2NxYufD0W9vQP5pASqjoDYg4BTZVfa+u/18pMewPi2fJQSew9lmo3nP4r?=
 =?us-ascii?Q?QfX9maNkywuOIbiP9zoU+AYaDlyugRtzx4JGGx3kER61aEKPgxdZvfzbBOUD?=
 =?us-ascii?Q?lvDe33RRYyihxyHKeo5p2Km1LGlOLIetlgJn7JaHoIl2uEeh9hRqE4sh69Ju?=
 =?us-ascii?Q?6xcYoAoMiqByo2D1VDU79soWe/1QTntpRqkJaXrDTv1/l5KBCiIjLm5/uPk3?=
 =?us-ascii?Q?nkX4ksUxIKGMbQqB8vuHddJQUXuUr2mfrQY8/oQQCG/C5FHgfvH1CeObaZAN?=
 =?us-ascii?Q?YItOt67EpwyG9svQDS/itRqZWzQ7zaeuO8L7eGEyRSKr46uETjVFQaukjldt?=
 =?us-ascii?Q?6+qNEvxT2Zl2A2RsGPF17gBhDon7bDJB9lTqrh5hIw96+JtLDUVQ7YqRppgH?=
 =?us-ascii?Q?/ycGdpNtgDys2JNpgSULshOeDbWyK0EulIbnNx4RWDK4YKsuxVtt7UIktq6H?=
 =?us-ascii?Q?5XVQkYtNwP/1vXb9WlP/jJcL7aoO9x4nfR/N05aBF9EZ2rVrgf4wuXDl75fY?=
 =?us-ascii?Q?QeIbgN8beCjtpSC3fCirtLwPzYBNFupAkBmP0uRlKiOCQuYBdyAIH2xqpo3X?=
 =?us-ascii?Q?p6iS0maz26Hmb03Wxcql4UUfYO1E9nBzidGMSThfxR3imcSXlJEUs1dx7e1c?=
 =?us-ascii?Q?VXsuFRdlNjyaHnEfDCVGYaH4tXUtUDCe8fY/Q4NI6CxnBz9U3ymussSMxj+R?=
 =?us-ascii?Q?re6VGi5l8Jm6b0ufr+m7krZl+fxcSbMvzzM2ZD8bLOJhrQ5PfTS7hTrnaK2o?=
 =?us-ascii?Q?gtpe+xfl1UI/8hbwr/FQwovoTiiwO6O+7OEoA+dSF7L9ifbdNnig7dg0sKWx?=
 =?us-ascii?Q?7HXSRUl1Y1VD+/9OihV4sLTxDyebbxc7j7hCYADywabLnAQC/zsBS/nNe2wo?=
 =?us-ascii?Q?ukna6+pJ1KyVmQKh9JTUrmHzP/XBNn/kDEpHzwbFosiv1VCAsC3aSaP4vIei?=
 =?us-ascii?Q?LxWy27+vydebnSa+kjTYAiIM?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE375436D4DAF942AF9B735532729945@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b1d930-fcb8-40fc-e22b-08dcb91973ce
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 08:50:14.7836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3581
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

