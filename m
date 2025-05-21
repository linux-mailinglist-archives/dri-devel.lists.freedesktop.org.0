Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85392AC059F
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEF89B1A0;
	Thu, 22 May 2025 07:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="oVlTZX8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010038.outbound.protection.outlook.com [52.101.229.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E8A10E721
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 18:37:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rsvz/CepC6ngAAhHWmQraj6GJt3TilNVackdedpM123bcGj5K8qb4k3r22ammqstCQEit1nk4HdbpXNcuPoFgBD+KAdBldSM1rpVK9e9QjghuyHlRQ0BP+VWykpQm6STrtHrrzsZkWlXMAQdTR9Q41pSXw3GV97phpwnjeGRJRif8oBuZXm1R6sjN/wKZllO5oP8aJw/nFrXmk1W5YQ43s6B8oNSks6438fKhOY307sthb7JbHwmjfUMwZgJwRWdsok3vD6qutWw8cbog6K8SQ0/SNianLX5IEDvK9MMai2Gx4GLSaaxvBEg9IGJOjNVhkckkkbzFnDmICbUHzFUgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhJ3hhlLBvRvrLGwdLVewy99GOBVAdwkObuSanKtFXE=;
 b=HGZYXI/psfn3rM+rfbgmKw0Gr9rzl0GS/UDu6Gb/Mu/ZeW3mpGpwc4tLNDnxn17UyauavN5iFZ958HJLjUaJbMsbfr+ydE+wEVrM5zzriA2CnLlU8MNijkGs4XYRFbwoT73nzxEON2IL0X1yuRvX6PqCvLCP+YiWG/dswjD0q0NT9XuWv7AgmxW6WKTPSDqAtW+0/41jZgvrjO8X5urbPieEFgy3UW4sWCBy7u4CDgECZWRAoQ84h07/7iEvNS3vlAtcqz5qAjj2RpCJoo24qOMXzgltjBmdmB69dIV2U9iF9A0wiTy60kveFJ7d3DS3dvWtK0W/e1WrP3t2r38KMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QhJ3hhlLBvRvrLGwdLVewy99GOBVAdwkObuSanKtFXE=;
 b=oVlTZX8UXA6kdP/mIAWh0GHuHRbwLaaGUCXG8dsg00xeOCImuiqUwq2WRPX6KPj8k3CY0CNulfp0jZXSa76L5Xgo3AyWeHPVdXpOkD7NLm3wYfk9jggYDgJTMB9uLgTtlals37CtoMm1ApYa5UGBu0RZbVJHaxHQWN90j7lo8q0=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS3PR01MB6918.jpnprd01.prod.outlook.com (2603:1096:604:12d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 18:37:44 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 18:37:44 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Topic: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Index: AQHbylwFhVVE5Hn9nUKcOcoNt/ZXy7PdaaLQ
Date: Wed, 21 May 2025 18:37:44 +0000
Message-ID: <OS3PR01MB8319DDCEB00EE36F137E055F8A9EA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250521142350.2134431-1-chris.brandt@renesas.com>
In-Reply-To: <20250521142350.2134431-1-chris.brandt@renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS3PR01MB6918:EE_
x-ms-office365-filtering-correlation-id: 3392ec09-06fc-47ca-08c8-08dd98969386
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?AgPFwlxybseIMPD7D6ZYJT0doBgdT6U7KWMQOGRciyGT7VL5t6ri0S/2CGzj?=
 =?us-ascii?Q?sb8vBjV2MbzbrLWNylP4s768jQHCqlnlaCb5l336O49wJ2ZLpBQuyhl3XY8u?=
 =?us-ascii?Q?mUnECQlLk1Af6xJbDjBzXTdJUihdDCFN5R5/uEd//xwIk2SBJb+2OaEZ2tHq?=
 =?us-ascii?Q?+ZIJvgIKDkWuqHbj312xvMISe72xt0pWU5a4YhFm02zZbqq51NN6UFG9YwWU?=
 =?us-ascii?Q?WIsOzOMKnJ5AnWNIrvvZCbaZP0ajgg3OcZV5XcunH0orUj6Ty7K1kzaOgoIP?=
 =?us-ascii?Q?cuPAo4kWwRquUqvkz5jG+bnvJWJ8sG+mn4ZBhnTTxOgACXnSmn2rhAddjHuc?=
 =?us-ascii?Q?ZznAHht8e0NxTyR+XCVv7aBtFp1H+spqfxbqDg53Id73MPYOFInA93oFc/86?=
 =?us-ascii?Q?IrTnUFQrH1I9cPd7ga9c8kpzHLV0tqrX1Y5NCCpZV6ZK3Aiwiv3z3LBRJzfI?=
 =?us-ascii?Q?yseZHdF6uibUCQWp2958aa8KmB/4OUErr4o6Jg9YBlmYJgxF0hlTT4b2kjKA?=
 =?us-ascii?Q?ddZV5Usy7sehaxjGNkuJp7fwvfu/Xj9+2p1PIIfdK/Ymb14sr2coviqEOTEd?=
 =?us-ascii?Q?NarMoloIZqhA3L6tCLDeVdZy95bTWi9TAPYPCdelCKlqUjjik61a3YocXx86?=
 =?us-ascii?Q?e/BzuBPW1w2i1yPmzLvMasx5Ig5MM4ny0hhqQsoipkBBMbGAZDvz3uGxJoNX?=
 =?us-ascii?Q?X7VQNJhNliWRXIxM4Uy3WeHZQGZJyl0iFexy45MY836N2V8SqAzz7F6tjj98?=
 =?us-ascii?Q?YXVZZVsDIdxgAfbrnHRAHaLpi84E/VAZyFzlNJ3wnXkvczpQXj9STnXMC21n?=
 =?us-ascii?Q?VnPiHJClg82SOQYkUb9sk6Efl5vjkAdumdspnz2KBLNRqv4oJZOXdV48nhBB?=
 =?us-ascii?Q?NgCGAKxIDvV3yekzGIPuXHKZLfxxQ+zbaU6TcbGqeFtWUqVmJ7VSTQbJj4dr?=
 =?us-ascii?Q?9kkudu/S/54YjsCvivgCUtJxgmYAxHEe6CzH/Fy17d2DkcltQk7hq2BF/h4q?=
 =?us-ascii?Q?22ic9vXfIyZGziiHPo1r03fD4vNNPoFQJVW6Ch1mv3JI73jI3/TicTHlhzgj?=
 =?us-ascii?Q?UIgQ4UcS5HF6b9aoIBU8J9S0h1nGRS+yVVdkLXVGr0TpMJ/rHKYlbkfWMtfL?=
 =?us-ascii?Q?PLqWT3WcZ3f0v7eRRvoyo6R4U8BauDTNGMru7ZdI8iJyotGZi5p6hUsLQl8L?=
 =?us-ascii?Q?NvDqgig+Kyb8H1VgS8BGks5dHc5lnQZagsJQ29nHA6hDfrcKPOXgjEc2TWRJ?=
 =?us-ascii?Q?9Q+UjPUP4fHCaolYq0wAjmBDJ9M+m6i0sRIyy9Clu7lXyeMhoFlfxwOP7Bge?=
 =?us-ascii?Q?puQpXLUVrGXa8xKJJFPcsUTmMefXlHW+7lNLI3C4gl90lKCigmjt4oN/ll6X?=
 =?us-ascii?Q?YVB/o84zQvyZG3XQjg6q3UfAv8pHVeU54mjRJ5Kij0AJRr30jLQIdxUFwwSZ?=
 =?us-ascii?Q?QlEczS5sZrHLmjHguUNYBNq5eA5VzAgsBxqMIoaemxY46QUpNyvYDzzeD26l?=
 =?us-ascii?Q?M0TTI8LqQcav0lY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z49gAxjRFJGup45FNNmCGKiS8UZi0s8huSuS8qgwEImXIYg18oBAYPbdAEbC?=
 =?us-ascii?Q?S8CbhftSGc6TSRMMww7xCtKHaKNSznFDSJakyUYLPDYdielD87Dsa6/R8vx8?=
 =?us-ascii?Q?5azSTGkeH7bF7g2gtj0+KqpIPTMGYy4KX8MszYTYnwjxSetFlNYeYiCw5N1Q?=
 =?us-ascii?Q?EHO7tKAdKv1CnpW/ksi4dwW5k+8Vn+J1KabiZ9ux3wKaNzfW1zC+fwmQIpau?=
 =?us-ascii?Q?DAWwGJvCxm5p8wq8B956H5MYwZMyTaxHdCd2qfFpEqOD7zwQea4ZALF3OtqW?=
 =?us-ascii?Q?2KA1JsWnDn8p3qNElXt4K48iOIP3Ii3C29zxU4Ao5rshAYT7PLKK1z4QVFGz?=
 =?us-ascii?Q?QJd+8iD41jIsLbTfWgFwLm3WJzLrTIYw7jKQz0COktUWhhiwuJIESJ5AKGtL?=
 =?us-ascii?Q?nATRTB7wMqdLv1dsAzXM/2TYOO/0ITHIAp9ciovJ8D3ncxsjytMEtFcJdvTw?=
 =?us-ascii?Q?xn2zseW1g5diJWwxBleSQuy2X1mDwC3CdjMWc/xlSz1Lkqazd3a/rHxAkFkU?=
 =?us-ascii?Q?9KmTFRXSRMeFhjgth5I6aVfLQCfSd0smg8kmsYycATpMsneX+x0Erx6Chbiv?=
 =?us-ascii?Q?NQOmWVqJ+Y+SZkWJwKvdW4vJ3uLEoljZYWZH7pvt14WDoKeN6fRSa4UiptiQ?=
 =?us-ascii?Q?XUaqS9dGiZu0xEnqi1gw8w2xw8qHNreipszdftxL0CwtH9YcjhiQQ69QbXKf?=
 =?us-ascii?Q?tn3IXKAYQN1fNJ1WVSS/xKH3rVReFgNLIjgH5YPWoB2SQjDQWUUz4KEEMFBE?=
 =?us-ascii?Q?hLJWoFoTWYTJZc8j8AZjGNeFVA8fh11LTWRl1cxPuT2BnLTABL/zinQiLaBk?=
 =?us-ascii?Q?eCalxkdaNeasGb2qHiIhZF6ztDksuy+1JjM0bhhxSKmMkZ7fGcvOSZNl3EJ3?=
 =?us-ascii?Q?Mgva5aYICZ84CSySWVbPXpYG1KDF1n1UbY5edrTzWE+B87T+7GLkRQLjSFXH?=
 =?us-ascii?Q?nPOu+ivV1FQLvXU7cgtMx67MqWkOPVARBTrn4qEi0uUZz+T6qamOLJXk7I1M?=
 =?us-ascii?Q?HkJ5p7BvU+HXvSK+xtGM2gzZvYb8QhRzb8bGl6A1k2yeqMSxaPt1beCRBQZ7?=
 =?us-ascii?Q?dQb9N87mfP7AlJuusONAXpHD5OPWB9r9Qoa515nSGff3vT5EbZmYkftiFwd2?=
 =?us-ascii?Q?c9yhatv5dQrzomFGzqEE+x5yEVC6/tKZBgsPGH2BVuuSVEAT2DRag88DwA2J?=
 =?us-ascii?Q?O7DV5fhhtfXghsMlFYWjbscODE9wDTZUkzPL+xc6bvbYPUwQ5uagtJ688yXH?=
 =?us-ascii?Q?9xOz9sx5zw+zQ7AMDM8Qa4vqM79X6i3SckhFR8N5GOUSiaNjbM0y49cWQKHi?=
 =?us-ascii?Q?y6LFn7VCev+Qtkahnf9i8Wc2L7f8DU7repLehasaqzvYu5AoIsNR73nIR1oQ?=
 =?us-ascii?Q?j07/gItjhwv1T/8iAv4RWYzgUZgYi8AFYRfQJz/s0dYJIj9Exp6pirwH6JjM?=
 =?us-ascii?Q?ixzvDUI6MElXcyDEjSHqSM2o5oKOTkv778HZKRbQO/n/r3Ooo/Hju00hzCIK?=
 =?us-ascii?Q?PPK5LAVjTBETgKQJJNFPUD9Wm6xZpgU8GYVJXMtHiVKj00+TMgV81upbLx55?=
 =?us-ascii?Q?ahXHKxhDicSNC6FrHQHBWLF00LJ3cJapWZedPNZL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3392ec09-06fc-47ca-08c8-08dd98969386
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 18:37:44.3602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TRTnF5egriawyXXRIsFVwSyNt8mifiO1hntm+l5CvZ4v9bx/wx8QFL7TR4rnuLiCnlEdZrgjZ1VbV2O5/g64IrIRm6RzgCBqBEhT/bOI/HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6918
X-Mailman-Approved-At: Thu, 22 May 2025 07:24:12 +0000
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

Sorry, ignore this version.

The local variables are wrong.

I'll submit a V2.....

Chris


-----Original Message-----
From: Chris Brandt <chris.brandt@renesas.com>=20
Sent: Wednesday, May 21, 2025 10:24 AM
To: Biju Das <biju.das.jz@bp.renesas.com>; Maarten Lankhorst <maarten.lankh=
orst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmerman=
n <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <s=
imona@ffwll.ch>; Hien Huynh <hien.huynh.px@renesas.com>; Hugo Villeneuve <h=
ugo@hugovil.com>
Cc: dri-devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; Chr=
is Brandt <Chris.Brandt@renesas.com>
Subject: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable

When drm_panel.prepare_prev_first is set to true in a panel driver, the
panel expects the MIPI DSI hardware to be already configured before the
panel's prepare function is called because it might need to send DCS
commands.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/d=
rm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..b31affddfc81 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -531,7 +531,7 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *bri=
dge,
 				 flags);
 }
=20
-static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
+static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)
 {
 	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
@@ -549,6 +549,13 @@ static void rzg2l_mipi_dsi_atomic_enable(struct drm_br=
idge *bridge,
 		return;
=20
 	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
+}
+
+static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_atomic_state *state)
+{
+	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
+	int ret;
=20
 	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
 	if (ret < 0)
@@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_bri=
dge_ops =3D {
 	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset =3D drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
 	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
 	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
 	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,
--=20
2.34.1

