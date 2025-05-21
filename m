Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D7BABFD7D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 21:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83FB10E726;
	Wed, 21 May 2025 19:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VAuksn7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010026.outbound.protection.outlook.com [52.101.229.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A78510E726
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 19:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPMvkklDfkSyIqipVkrhUVqUjzx7MpZ2H7fJLEx+jir3JNLOLu2U+gT7DAUH14trZYrD6tXYfVwnmH2/hKGY4uiji4KjP4zBIZ1dCFxwTbTLTVghNhc3EHEU4S1Va0ta9TvfhV4dS8H31C9MXFXKQ0OqRY6sxVsu37D9wG7fk7qiE68RrkLJKX6BB5s5rrzAmSZaHnJfvY6X6xDfafevDigtXY4KxYDPp5SgSyK1GwhA59YrUMPC2vb5+K0nTQboa6XCDb0WsxHn/EmXvZGJyiNLQrLobya2Z5lFCvyMI4ez2+wjcG+KIUpcrBFn3Dz0+e8qkLl+NmWQY6qr4IBZAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wtt4D4zqpnx8V6VNxok1w63zupDZ77GIV0e0GGuOGqA=;
 b=Toj0sSltZ6/QzZiMrKVzT+s5r2P5crJafpzcKOJ1V3+rCrL5QlEHtEOB4dfWCOWJtauRwc8jCNMXpjMY1BgUp/WfpE48g1NiRh+oBSPnYQwO3RzHPPfSf8Q7IMFo1ycstre1a2qr1AktyW2bDSUaNU317hgVki/kJal45ztAAS63XZjKtNk8XFyRjRKtMQZtJ6bqkXU/V8bFa22teg1ZXuVcrho4Y2ZKKjnuZ7csDfYqEPIPWpva+ihOWRbhnzyjK69lvwqfElKiz2ix9N5m0Gdyf0o1w31gNev6UfE5f0kQkRg0tz0TymTGxNaS2n2PdOOBMRyJ90vFm1YWlxGUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wtt4D4zqpnx8V6VNxok1w63zupDZ77GIV0e0GGuOGqA=;
 b=VAuksn7axs02kdTZPtQXyHTrjl5uEKih+SAQ+cNtudCA8MtDSp3uDNR+x5WtEAuYG8fr3Ts9UaXsFSK26ux3lzYk6sR6FcNvyvZQWxzRy6Dkghd7TiKmPw8Q0DtyMQzT2ezm8SaLD5uh6bz8xj40XVOJgXWt/jAT86iCHiBMQhs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11265.jpnprd01.prod.outlook.com (2603:1096:400:3f7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 21 May
 2025 19:41:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 19:41:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Chris Brandt <Chris.Brandt@renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Topic: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
Thread-Index: AQHbylwFqp3EU8QEK0KnIkbYVxUjPbPdejXQ
Date: Wed, 21 May 2025 19:41:29 +0000
Message-ID: <TY3PR01MB1134626C4D2C38B5BBED1485D869EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250521142350.2134431-1-chris.brandt@renesas.com>
In-Reply-To: <20250521142350.2134431-1-chris.brandt@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11265:EE_
x-ms-office365-filtering-correlation-id: b78d01d4-3ee6-4041-8a9b-08dd989f7b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?lyynDG9eyNVVk7+FaG6rJ2m9zsUOOhR25vqW2f0QKGWkIunYx0LqQiSu1dt4?=
 =?us-ascii?Q?VU9mG3b4RlIr0Uguh8bI3ci3mmz8sx4LfPNxpSzr79uEAJIFRuMgu4qj4DM/?=
 =?us-ascii?Q?Wa37m/1hzm8sX5vQYqNj0giiIGSb62DC57U0toQrO7l/wGHPJvHXr6niczRV?=
 =?us-ascii?Q?cCazli3Mzydnqa6L5ld30GwechSG19PEeYWsIVCAAw4L46FKWfl25sxzZWjg?=
 =?us-ascii?Q?E93RUVmAIGYM9KBElfk/RLJqtKqmhGGN11Pbx0YIzCZpr5piz0gczlmpAQ9o?=
 =?us-ascii?Q?DuwCt2+Be0XHCiGzr3IyeFozqhJKWKVkp00GEgpFYbd65hpBiu9uW2+j7Lqn?=
 =?us-ascii?Q?t6g3UCZDp1fXSKqtcu9rf0JAF7RkmRA+wUEjmpBEE9XzrKCP9LDn4ahuMXzu?=
 =?us-ascii?Q?vEsoCZK3zcXF+2oNzlWdjnVznuXOslqTWbi9BLU+UcAKkQyCW9OQBHcptW/q?=
 =?us-ascii?Q?oiswAdWewYU/K54q2HkXuYBFcaKf4pf6CaOO8dC7xZ1slbcGv0K6tNzb6QYD?=
 =?us-ascii?Q?ag97bTiPD89O8XVb6H7dSsPs3EKqqHJ9dm6kJr/V0h2NkVPOGzejZozcpsB7?=
 =?us-ascii?Q?rc5zgS0e9msmdgiZRvabKWZUYkC+S+s0PrlZ5cB8Y2bEXrlos/Tm8xTOI9jk?=
 =?us-ascii?Q?P2KOxjzZh1HO//fmatWKd/USMEaTCswa6tCAk3Wb6hL9F3GDlUH2p7ozODTc?=
 =?us-ascii?Q?eEpYnSQfdJTBcuS6YVGtTKb0xwK8eIS6/NqqCSyuDzDleYW65Z4FRu13FqsB?=
 =?us-ascii?Q?Z8HqqovMPRQIvs205zJHqRw+/4ii9+6hmFIBw252M3grdqDy+0jQ22Hr9GPI?=
 =?us-ascii?Q?5osfRPjo4C9suaS8rXit3qOPrMIyI2JrBTIiAARtN3lVfZOHXUyzJKL/zKpL?=
 =?us-ascii?Q?X7WRetzlqpX3zUUYw8Q2Vw0qxeKXRwPXPf0jvUy27OP8OA7MkzOVW1p+/S6q?=
 =?us-ascii?Q?I+++uOMn5Lj8wAqRZiS3L0iHfDtJVeHrsdMhG1wwAqWsfGKzy7U7TsceeOja?=
 =?us-ascii?Q?iCA9A0cxnVkzhubGtsepO6sWnNr/rYT/phdBXkDh83aH3hWIM4BIAuF82IIB?=
 =?us-ascii?Q?eDA6rX/oAQ/JUr9Wz/JI53Lz1YeHuFRSt1H08OOcytFxYlDWblYlIWZOjYQb?=
 =?us-ascii?Q?iG4zrT3fPdnOn5uO7QumWl+aB+Srs6M6GpA9ei3p4cjhpfrudgpntfUBdxq8?=
 =?us-ascii?Q?pa1WuC6VkJRWYTUAgJ825AnukyCogc7mutiofwyEocxRCL+5mV34uX0BgDnh?=
 =?us-ascii?Q?I2iufPqEhElyU1OOiIdb8+pyoNeNSMrtFKBDXocCzB0oZNSfs4BBmhPIGAN3?=
 =?us-ascii?Q?N0zu5a+lyy2aZqZ/+50itZcrb7p3Xr71ORhrfy21D6UrJX+oc51bhpbGpw7i?=
 =?us-ascii?Q?2yT+kyqTBtm1Extk9LfuhY1rmz9s1X3UU047W6Zn6QQ+DWc/PchRfCNDgiAW?=
 =?us-ascii?Q?anBg/6xhdLS2ZBHc3rz+8Uid5ct/Z4dyjPSuCIWqEnHvljs4RzoIbrvuAe6g?=
 =?us-ascii?Q?LndUZiVn2po084I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M3O/3o3/qrdM/7bgFHQM8LvQ+txTm58q0Jq8ePn2Xj87jCU3OPdjJngNIHQj?=
 =?us-ascii?Q?tDXblL+/55T4oxvgLVAYqsIRkoxal2JZFZ0YbeUrcUmGRT6WGOQnLSZadOuC?=
 =?us-ascii?Q?aYLjy9NdGFTiDkmGsaxhn67QD8awcTxlkJSwftnSmOi9h9VLg9aYfk8cNGKF?=
 =?us-ascii?Q?bhKoeHdAea3kKE1WOEoCxA5+wQf/N6Bx4HPqmjlBS3nXcXFUAv1xHKd5ggTo?=
 =?us-ascii?Q?ENWgGbruVIx/dg+ED1vbIZKAxJ7RcTJOWwXbDn/TrsFukvsXXWDfF2z7OAXK?=
 =?us-ascii?Q?+AmhuxVif7fYn67GjoNcF+DIxSFtiO0n1I6TvEjSjRE4VxD+rhhUL0uvsDCw?=
 =?us-ascii?Q?wX1tPapFdFu0lttJ+YqWqMqgFcdm5JsEFTHCUTqWvj1y5ggV1HROhwkh4HJb?=
 =?us-ascii?Q?o88u1rtgork+DoUVJAkGM3i25KyYodeI944BmhBW3NHrfr0bzRgFi3CeAywf?=
 =?us-ascii?Q?maIeEHAEjnt87r+Uy3HnvU5ZI262fl6Cm3XKBH2MZuG0LL5hggmh+i3uDcBL?=
 =?us-ascii?Q?sj9+oFHYO4BV+yjVjZsD2KW9HBvIsKAbhViVKkdoJA+mPkkSpkI3Lf6XiB5m?=
 =?us-ascii?Q?zGTL9q8TR9H3wW+dMSuI8Gq5v3P+H7e9UCf1UjQOJLvnvuZtdcMxFOzRapwI?=
 =?us-ascii?Q?0JlPlkJD4xk1RBL6s4rBnl7PyzDi/YmeFGLxmCrMB1loHY7RHO6naoJd9+NJ?=
 =?us-ascii?Q?TJ33mqL/KLr05weq9kDR0CQv5nFI09YlM00i3mG4TyRtNw6Paa0TeAkW5djk?=
 =?us-ascii?Q?+zoTnX3lQ1T/ubCiD6M9uaDgDv6vlnVxcDa3P9hU9ugpvReDbaQK1ANa+2kq?=
 =?us-ascii?Q?JubuHpDqN/MZsCCos+vJYrCIOUCb6kc0HGgFggf5m0u+2SMzzSGnY0nEE3Lu?=
 =?us-ascii?Q?xRcizEFsBTBnuHrlL6NYqqToRn7MrHqxogB8rdLZnkVcISn71cHAoErRyC4B?=
 =?us-ascii?Q?clQtIMmW7RzVcpGoT15NcmCPfM1ZaXqoAo30bnx6hMBemp6HEA3w15MRd1/4?=
 =?us-ascii?Q?foAUuAyC3ZcAaTAM7TQvo3cD5uq7OPUci4CPohah55+v7B8PfFy5WqiLHIC9?=
 =?us-ascii?Q?RFySH5BIiQ8ybuglHIg8c7ObexaJC5Yu0PGYPj/F3y358bK3NNnbL0ot1wi+?=
 =?us-ascii?Q?iKP77W1fNkmrEQSd5Gnk+Dbr7665dD1d7Rt51NIvcbOu0WIJvPBWDAdgqCj3?=
 =?us-ascii?Q?/HbMavqHUT0RkHWNgX8pRldmy/54dxDu4cuIj6f0U2aJHWb/Xuz0HNM1f1Qh?=
 =?us-ascii?Q?q1/XhGm1Us0nLoxao4Q2MPRQxT3nFxohaoOLCh7aff3613WkFND2WHU0YQCL?=
 =?us-ascii?Q?gRxSVtnjeF347Ttz/UJggcMQGXxynwWYvRNtDv8LUIfEG+2SIAdvtqsMS/hr?=
 =?us-ascii?Q?1CYmZrz+NGd4p0xReYVpKABoYBUSFV/fwUfh/2ys2OD7Rcj0R8Dq91owdxMk?=
 =?us-ascii?Q?az0ut6RJ9TQhtbRY5NR7W9M420+nkJZA7z/SDlibCN8prTwxx36jePSUA1+H?=
 =?us-ascii?Q?UUralPumf6oKRyWB5BULCyrJYGEHBmw/KGZEjVLfz/u834lq8UluySB/GlX0?=
 =?us-ascii?Q?axQqMwrcni1WI0OvZ6WruKaM9XUaRr3sJaC6Y4SYF5FFU+J3WUVUmib+vEOJ?=
 =?us-ascii?Q?SQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b78d01d4-3ee6-4041-8a9b-08dd989f7b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 19:41:29.2010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aLtSJq58Bn8U9DwcXKz3E5Ojk/HGCnzB0yygKAxbwsZIRISOhj4hzEx4cArAX8JbZ9iC+9Q9jqwRra09II1OcIHw7Q6u0ZPxqBq+KgXuC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11265
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

Hi Chris Brandt,

Thanks for the patch.

> -----Original Message-----
> From: Chris Brandt <chris.brandt@renesas.com>
> Sent: 21 May 2025 15:24
> Subject: [PATCH] drm: renesas: rz-du: Add atomic_pre_enable
>=20
> When drm_panel.prepare_prev_first is set to true in a panel driver, the p=
anel expects the MIPI DSI
> hardware to be already configured before the panel's prepare function is =
called because it might need
> to send DCS commands.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 4550c6d84796..b31affddfc81 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -531,7 +531,7 @@ static int rzg2l_mipi_dsi_attach(struct drm_bridge *b=
ridge,
>  				 flags);
>  }
>=20
> -static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
>  					 struct drm_atomic_state *state)

Check patch is complaining about Alignment. Please check and fix it.

scripts/checkpatch.pl --strict *.patch
CHECK: Alignment should match open parenthesis
#26: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:536:
+static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 					 struct drm_atomic_state *state)

Cheers,
Biju

>  {
>  	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge); @@ -54=
9,6 +549,13 @@ static void
> rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
>  		return;
>=20
>  	rzg2l_mipi_dsi_set_display_timing(dsi, mode);
> +}
> +
> +static void rzg2l_mipi_dsi_atomic_enable(struct drm_bridge *bridge,
> +					 struct drm_atomic_state *state)
> +{
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +	int ret;
>=20
>  	ret =3D rzg2l_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
> @@ -592,6 +599,7 @@ static const struct drm_bridge_funcs rzg2l_mipi_dsi_b=
ridge_ops =3D {
>  	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable =3D rzg2l_mipi_dsi_atomic_pre_enable,
>  	.atomic_enable =3D rzg2l_mipi_dsi_atomic_enable,
>  	.atomic_disable =3D rzg2l_mipi_dsi_atomic_disable,
>  	.mode_valid =3D rzg2l_mipi_dsi_bridge_mode_valid,
> --
> 2.34.1

