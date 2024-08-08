Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF1494BEE1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3EF10E741;
	Thu,  8 Aug 2024 13:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="URiY47KC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2040.outbound.protection.outlook.com [40.92.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA23F10E741
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kb/+04GPFMvMFB/VNyTCVHuLjSe3uOFiXt7SJkyKKEWAeStjmFLrbPQG5/B71gnGYlwOTLo2AEXrTxekS48/0gbTdFGPLcLosxaCnzPp1x2K0/3a6nTJcCao7lCEK07mFcFIiVuFDv/QNSZofhH7bYqnNsZSg4iS7EPtSw2IGK+XwsJ41DE2JuGLlMy4lP4T/Q/TZNJXjQVZRJftVvEVILB5on1SRB6JZ0iZ6TG5+Fks2ekjfJieTzCIIB2eW1/oHKGndetKk4KwHwyLjWZv7VBn51LE9aXnEGfsw0cG+q3ZN7ca7wEW+0/5BCJt364lTcOz4rHKDErJf1ZPjWsMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=YzvPyf3acn3ToxTvwlo7uv4aQFx2i6qytYiDZzYO9S1d8OoxiEZABY1SmjXVwNEPu6K+iua/bqNCoYzCVNSH0cJpXvyiMdRXOTHLk1Rhau5a+OhKVCZwzqUgciFMedqqCuE/kOFF9f8nDl3Z2se1AZMkiLBJXD/gJV++4qo6alWNF/wJzRdXCalqg+IzE6FOvFgYxrbcEyFwfpSK6Eqx7lPunWt8PJ2eZHxR8NoYXsvwcdrcMAbOZJVvP/v91t9xpNiWe7+cm2p+9ULYcYkLMbcTtSGsk9x0dNqMgnhWVW875ANxeTDTjeM/idIL0BjN/8KUswsM7LEJ2KX/vZ8s7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bYZgdqTMzmRFsyXfpaWbc4sii2G3oKwpGMkDDNkMys=;
 b=URiY47KCB0u6jM9Ol74gNqQxFFISSwnulZ4/djCgbWksXhZX8E7tzDxawT3vRnIuBhjy93GTEA5pnhmyDYh8aPI3OEK1E+JXRC9SJCIkwtLthWj/iJkY1LnRCxyTTSBn97+DPVMsqTTFrsvXRyg15VzPvS3oiFNs+CTZ0Ji3XIhAh63UaeF+ywfxpeBy8AzfE1mJduGRvrYPTSzUiZXSGV6BjqdwQG24YGlm3G6/ojHSjTq9xZiqUqI/lwhxT1UukUWUx8BekElxG8LvEf8ifdzrdluh/pHf5Y4phIcvxNhb424HTTjvfbIJe5GBDa7X3RnUuTwYqNGB5ewyE3BIxg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2013.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 13:54:55 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:54:55 +0000
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
Subject: [PATCH v3 6/9] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Topic: [PATCH v3 6/9] HID: multitouch: allow specifying if a device is
 direct in a class
Thread-Index: AQHa6ZqMeCTzUt83jEWlknyG6D0ACg==
Date: Thu, 8 Aug 2024 13:54:55 +0000
Message-ID: <C395DF22-6A9B-472D-8575-F0323E8C92AB@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [8hwJzuxZ51yB2GXKxFDo/UrgEegkZVJ9BEs6Ml1Uev0evDfvbdqh8FCJiJ/9tOrpVSE62X8aBig=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2013:EE_
x-ms-office365-filtering-correlation-id: 1eb8c401-8dfc-4fc4-e546-08dcb7b1aef7
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|461199028|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: BudKZYsaJTagZyLvbaTZ8ofW/g7pmhS+P1JG2fRT0LZFGEC4s2Ef75IR2bzDNf1MREor4/wFK1a6q4kC5w3SCDX7twrzIyY+xezE6tRZQMd1YRUgm9hLDDdK9M5KKjOyPUi9IygcXVx4LdFDgRwSF9+CpB7H6AjWtXmwSOAmtsgw7X1W9ApOWj9YY9tDV81V0p2qe3TRQfXUeFptvvKGpiwpO7KW7OhS0ddVdz0gZz1g+YAGdALujIi1vX1ds3k6xflfqX74Nzo0dnuOJSUCnhUD5gjfQMSIaehz8FwKqpYP2F03H4cHWc8gZwYGfrCxKkxp42At/20JIsGPDsPaPAB0POhGWXnoe+gbNROQ7TXiSR3BtPh0E3S/OanWN17i96P3DG0odWP8lSz+SBpmil4wYt4SvSiK4zaL0tsZEdpSn9z9ZpnqzlpSr3NxfEMMxp1CCoGOe53eNlJzkH6gfj+s2rTEymKz3ePownqBAS6ODvyLHyreEwx7eV/mzlgWNbF56cyqFQH//uV3kjic+Er4DKKE12RN6ExampAD1ASDfds8N9CqNLbYeA7epYHWQNHxubVaZMLZGG4eB+udFqvQSCHPO4HjjuJ6Km7TrmBl1sEGb2QxbJhdLa08DZLEnFd/UZ8Z7C2i6WW3aJoKfWXwZ4SJ3dugih/6ufRGfOQiexm/3x/WC9nVofp2VO1q
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7Jn9CnhhhhulgceGFIftbjEIUqVPlkaqloKYj2Yvc6RqflLJzTVBh6hccY98?=
 =?us-ascii?Q?S8EOvn0vNY8awOEgEO4W6GcwdkvzJCtZIZJw1ERrAYJ6CavmymF4zciqT6dv?=
 =?us-ascii?Q?wuDd0fLbXRAZp/Idg+a3B8ddDK57K+u203bk1WrmfMez0+KC1U64E3SMyOAT?=
 =?us-ascii?Q?jhXOQ/iqokEL69BuqadHpe1yKCSKae8gZxwSNhPGMgVryVaMVTHo9m0oEIC8?=
 =?us-ascii?Q?NThfMMRy8+6vO9Grrd44lQRD6QVQL0oAktdu/Bkskbka6IIOPF/Oh3V8zmku?=
 =?us-ascii?Q?csOPzC7f4+DBuONqv2o2TDtIB9Gsqfb5hO0bd+DMPLQN8bqBhySSkFqQFk74?=
 =?us-ascii?Q?Iuoq4HOcJ51fyFQMv9rG8KTd4ilTVdAomCprmNGvKQdgItdp6JzKnPMKD2cb?=
 =?us-ascii?Q?vATa5a5lera5UXjlM9o/Qyd2C/zD4VlJwd+v+5H8GQ3Qk1IANPAH+KJsCHxP?=
 =?us-ascii?Q?PR9WeTbDA7+C6jsvD4mzPOqPgMgfS9O2f8/MoHqOBNJamqUyElN+vT/9lyNc?=
 =?us-ascii?Q?E92xge+cfNdGiy9omSNkfIm1NWsh6jNkBURkfjARj3ZeGVdDxHd/Eqrj4Oo0?=
 =?us-ascii?Q?DiVeyqWw3c0IsKEJSDLKrD0FM2sdJh22B/MojBep59aMZjdw9Ze7RERUJaRy?=
 =?us-ascii?Q?mV1IO030zey46sCgcij5ZtxWDUUL9jqQcUiH7jSXQHSY0E5qiWc4vNSQeSIS?=
 =?us-ascii?Q?aYRk4SeDeSEhCGJ57sXuA5UQzUT6QgpTfjUq8EEUY0Iq9CgCpqOw7g1iiQaA?=
 =?us-ascii?Q?68agloJO5c/puiKazbszjBqmHQPlO8hgYSYkxDVNvHOnSBa0SKNPMJjrKKjA?=
 =?us-ascii?Q?0BIPT+zOY8iKiD57ynfHF4HwnkQCxuWwpZwkE+vk8tSB5tbzxuZ6EBJSNQu7?=
 =?us-ascii?Q?kzZvDk6mabTuU3EkbUCQIdGiotwVO78wWSD0loXAuSfxon1DE0cvrnNvjo3J?=
 =?us-ascii?Q?CCEuAvvnfEm62LJDmqjKs7vm0LQlDz/5E1BzadiJZirVL5Z8MjoHDiA+yeSA?=
 =?us-ascii?Q?35N9FabWCeeiVUqvcKMosfzWPm26CprhPJ3nNWKiLLQ8nco1U9+nL/lhuVAk?=
 =?us-ascii?Q?nbrZkPwi5PjYSdbqeX0xMx9SFb+vUFKqwUPed2dmCePGRyO/Q/aGm5NNJIV3?=
 =?us-ascii?Q?RipUAADLkZHeWSgmvumUs3rvyLlczr18WkTvMOTpCkEjqW8KPdLWGvPaM9a8?=
 =?us-ascii?Q?tmxc+R7YctAvwPwH88GtTACRsUTOoJAXpOTeM5uyAZ7+yIqPVVkYk6FbV6aS?=
 =?us-ascii?Q?+y7Y2f0xWrUv4zAuJ6UqOQjfVT1pD++/9flU2oT20iRBbCCjSg1JwrBqcPNz?=
 =?us-ascii?Q?6QA5e/SzaB1nJAOcFbQeLLv2?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1917D30B77C1804EB98DA9A500D26A51@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb8c401-8dfc-4fc4-e546-08dcb7b1aef7
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:54:55.1794 (UTC)
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

