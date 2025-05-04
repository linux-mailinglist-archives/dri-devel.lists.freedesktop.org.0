Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2EAA867C
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 15:00:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0635010E278;
	Sun,  4 May 2025 13:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jCJofHY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384810E278
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 13:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRAgSLMn0IDM6paLAL1C6kfNERxv7qcGYS4pH8aepQ61M177CAl0VOvC79ks3vnX3i29HmH2mxsmYwXJoFLx2bwu2AeJWFpyOJ/fZli1GS7/yFfOPCOT+TWGCJ6oNBYH9UYscYt0xIQNiZErDk+5bBQ66li4lWLEhvs6Pe74TnKLU0l7bq/Z6tCIU5qYJdaRviNvh3eftPgrCDQDOUvnVHUcqdFglQDAQlf+LWA88SpX7JvxXo0GK6OPdG2gqThXeH898P+ZaGBu7Yw92BKOqKrfdrGy2oQcs3KjvQRAZmXPs5TBZJh9+u2Pcnqk1vyQsrpjvcr97I+5jWVVnhBzZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKwgHvDulSgWYZpn0KCY3zarz/32wk7mZ59bsNJzbOM=;
 b=fmkrs/dYPKmUtR7NsvT5nlwhUBvrEBadYeOCpFU8tLCMoGn39R6nKWJmVrNovG3fCMdr0m8GxktT7wBa9JqlzlysxJkdncBAVGaRnukvQ6/K7FEfSLqUmgp6mSXC1XtCCybITqlU0bJu+Jz+Kt/4DEYTzA3/EZmp6Dnz3ZKcrmTB9iOj/ITl36mxSSOVkkt50kNAj3mszPo2tADTpMRkjYBZEfd3U8deUHM9KYj2otdc9ZVGDe3VgP4qXsc6MXVp6IjAkjSBR3KvsFTZCUXCMn9xM2taBbRqM07aDBWlmfWdg+1hXY3mkSRi5CvEcYfcXHbYK176k89YYesBZZXyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKwgHvDulSgWYZpn0KCY3zarz/32wk7mZ59bsNJzbOM=;
 b=jCJofHY2nIMiM1tXLiSFwnlxEhihQRleuSA0kNgYnseVjyIhYr5GBoh4P8n3PuQFEwyqYa6+8LOMKaAgX/sU1r035Mx77N84tB3aNlILbolXeiGRx7+mLqgo1ZK6gw7/Cwpd0i/nHdq0jeBpYB+6D8DdDzCjTul895MfJrES4Pc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB7311.jpnprd01.prod.outlook.com (2603:1096:604:148::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Sun, 4 May
 2025 13:00:10 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 13:00:10 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
Thread-Topic: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
Thread-Index: AQHbuhBG3bpnJPtw1U2kh361rOcVB7PCc9BA
Date: Sun, 4 May 2025 13:00:10 +0000
Message-ID: <TY3PR01MB113467D1EFC9C66CD94D216F3868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB7311:EE_
x-ms-office365-filtering-correlation-id: 8171eded-720c-472a-cdeb-08dd8b0b9a0c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7FR2aO+1QJSpaYqkh7h75cs6nJ9jlE9yyDIfsvX9O373HmKA8cOhOddiZeky?=
 =?us-ascii?Q?yzri/Do8uXCIAHTyiOGheEgCoA1YuE03NRAgaoTj8GqFxs2HvGwjNwAC296V?=
 =?us-ascii?Q?YxW5K6G2kRWklIPGn30pMr7UkJtdp1l4A8nhCD4eaFQaWuRLI45NNK66OqdM?=
 =?us-ascii?Q?bSpuG5YtTAJYqT9rYd+aZ+4mD6xhabiVpx+wIu8K762UOHTR9b7G1eROQN1v?=
 =?us-ascii?Q?/IejWgbUJelPwWmJsMHEDHOsslgaBpIEkCT7NqpCoTqpriEyWAjNCMI1OMIv?=
 =?us-ascii?Q?+f9VdxYa1EQOAIs8keZ7JR6/0USAGPD4YtioxEHql6UVJa1pZvj6tvT7RSgt?=
 =?us-ascii?Q?EF1+9Q+U15CPoq378mjtjfVjUMmt+QhBnDLgP614O7CBJFkcGq+GC2eE0Iqu?=
 =?us-ascii?Q?+OuFyq4TadipDyeWApt46JMEM3Sz0FnrquqC3Bl/jF8MpbNK/3TdvORxRqZb?=
 =?us-ascii?Q?08TD83gbNEHOzMwNcROxeQI4MGnv2hLbY0LS9OT9mD4ZUugzo+tbsxjyYFQp?=
 =?us-ascii?Q?G0HBsq7TIAM1ZGm9cbxSGO5++SK0/qA+Th70n9FfCVO4RDK2c6k2SzjnA0aH?=
 =?us-ascii?Q?0TmUVPJROmxKQmcXYlcYpweLsDYOaw9PR+fBFyra1Agsr0jChmWeOmUzAEh6?=
 =?us-ascii?Q?PoJzDfwuNyot1FvqhXWut+HHRA8PSlxkS47sej07FP79Csr3OrFIEfEuwRaA?=
 =?us-ascii?Q?0YFl5kCXZ22qh/GN9vIsrvG053s8S1Tzax9CKhNXXe2wjAnYhgaH7ZEu0jNk?=
 =?us-ascii?Q?vfCNfpMgHTSswFFgotalfGNaSHJikwvjrG8nfZMK7ZwJUFPfUqAEX+rXp6Jx?=
 =?us-ascii?Q?Lp2GyPLicHGPNDvQLY0bCcva/k10lIer3M6/waJ9FDfgBjkN25cbvUYccGkY?=
 =?us-ascii?Q?sNDF3/mrqzOySZRTMJtWoar1N44KDC1J8lPg0uQY/tNAPM1iEiZsJ6Aiq3yv?=
 =?us-ascii?Q?4fklqlAIGF6mUgLChMY1uTSq9Ot/lHPbEUwenh40MBhluyk3eX3HGjIOXJMg?=
 =?us-ascii?Q?cx3yILNr3ZAy/ZNHXr1eBIyMr+j3j5+hsXkaH1waVjuH3q5KPs1ygEDpwUHX?=
 =?us-ascii?Q?GcjcclDjzC04k9ZAxDfkoRzcRMWnPTsYn8nSVW0TkJv877LfQVghNTWFkoOr?=
 =?us-ascii?Q?ZN1GAE3cdRG1pPFUpsb9o3NGgcBh8POgNfa90YBarxBkgG5XCTM7+r320Fx0?=
 =?us-ascii?Q?vnCc59t/g1Y7wItlxV91Z8/K8WPWvWDKXDwKNPPncWFKuraTAyXeBlrzGQf+?=
 =?us-ascii?Q?xkfit6LEAx843jr+sYQA0Q9UrfYGahbJf0XP9SaNlYBpMkX4ndezHXR5PyCT?=
 =?us-ascii?Q?eD7naLR14L8+ug0a/TPHhJxCNYGwoNKoeRY77hhMX0e05x4NmGu2+1yKW0sV?=
 =?us-ascii?Q?h1tS4Ve+CuarsZdPtv6XELleyHv0ipHtIbatfhANUd2xphJVrIAqBpax9Ede?=
 =?us-ascii?Q?Mi7UnrDAlo01cLjZAKEh1JS8kyXO998jjzgMTOlU71HLUqbsouXvhGE99bjL?=
 =?us-ascii?Q?wr+BGJpqCgTnXp0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AX6E5toyDsOJlvyWd81kmtvd1dWaTGCq3KZB9MXiyNAtR25UQe1moBETHBB+?=
 =?us-ascii?Q?Lm5ackjONDQ71J2l6yyjCnf1QVr1LGljzjPre0E8AAY/A9/4PuuIy9k4pYUj?=
 =?us-ascii?Q?Zlucf8hdxH8LabVWqEpeV9dx7/7SJuwNz6ukxkF+hQY7n2uobyvy1CBv5BeQ?=
 =?us-ascii?Q?5PPazhxFNXQQO+LENz1zlHAdpbElSvF+EefqMOSQZ9jLFsbixk7GRv5jhijl?=
 =?us-ascii?Q?XwaP6AI1B07l5DMGRIQDVmxTqCA5pmmbr1zBInRUY07uVgRuKKPoQSmAxyvC?=
 =?us-ascii?Q?KofVV4EDCXmaR9Q+0ovCZoMguoJkLK3tp1tFlSpZ76yh84nr3y/BpSpsS9Ea?=
 =?us-ascii?Q?rTUB4l4HPrKBf7KZpeyO5Xoe2RBwUmD0EE+8LaxbBMmoG33HOlAEs3VM8ZgJ?=
 =?us-ascii?Q?RGcODLO7492hSDBFarrRagMVx6uq8mFMgGFXIYRGIQl97s5o6iOeNONb6Vp7?=
 =?us-ascii?Q?tF9NbKjFC5kTX1G+Be3Do1N9eK7ir6prKVYgTxgKfVe8kS9OGyb415p2RWE9?=
 =?us-ascii?Q?wmQ6bY2zCBvI6kbqnBu0HobMv/7fMypEhAgT1Rovn1UP34x+t+bnmpmeAnuM?=
 =?us-ascii?Q?f7UtPmV8OSd96jZPgLCh9z9sJTqlkFS8qYK+BjocanN5FjaJ5eVOqTfBDKcB?=
 =?us-ascii?Q?rx3Rog7wisbDFY5e4Ew7Zb/RM81qoz9NmCL2e5R5vZH5++ujadS+66ppEubE?=
 =?us-ascii?Q?JsDJV9w5YB/FDzih0jpsz3f4hFgDMqarp9+W2dqZDsOfCUNyELCXp693dqxp?=
 =?us-ascii?Q?A4B4NgFkTad2LqoRV4okyQ5GMQ8VhXL6n6Lc99byAQPr3NplbWivlJwIzhl0?=
 =?us-ascii?Q?QAgdl5jgrtKgkgL2mn7SwgfV2mxHjEKcKoa6Ez9xPQIYkF083qXuZBvcEUA7?=
 =?us-ascii?Q?eWkIV6qZoSa/JSHi0Bo02Ckatog5tubbjAButjQYqUUw0yBmSot0nOxCwACz?=
 =?us-ascii?Q?P6IAUvHXLFuZebiGVjqSybYtOYJYM6Ng3SPgSKX3X6w2X/BlcFxVWHq5juoU?=
 =?us-ascii?Q?xucND8lnU59gyjxrMdr5BDYv8K/V6oBbQHhg1/zzYYSfDXHpLyf0Nk5yOJiE?=
 =?us-ascii?Q?H1qqoJMy7G+t4ux39wbKAWX2dEOF7xurzgZgPdIBSlBRDrYwozLD8YVmXG75?=
 =?us-ascii?Q?2t6asY3XJeemoyRQzWrOVtfp+lVdMDlXfLCErhqo52z55tkfFDjjvEHReh1y?=
 =?us-ascii?Q?/zl68qQjxedvRXPtEcY87luajkEzajQBXJW8azGDa6lWpiy/vXAoaMd3JrrC?=
 =?us-ascii?Q?lUEknZODlb3SfGE9h+d3RZfLh8xFxtEjXnQDxGPrA3Wxy3bJ2IUJc7ihuqJC?=
 =?us-ascii?Q?u54LChTNXp7KBct2xkTNyTHfgbDkzCaqixyG9TuciCDJs1MrOW7rMxocwMXc?=
 =?us-ascii?Q?nMNWyw7LvOjZFw86T3orSMA6/k/qtj/XG1r1lpawWbPle1WCvgvNbwVSt2F+?=
 =?us-ascii?Q?yaNBiummOD76KHQJqlbW5lc5z4b1eNClo1GFyN7wBEYvZ1dxV66U2pmZYtqn?=
 =?us-ascii?Q?0vofbkB171+rWUIxMRpWikVhpp4l/xjNuto0UilHqJzWCFTvMBFzfujlxAc6?=
 =?us-ascii?Q?nUcc+mjOKxQ+p9PgvfjtO7EXx0EvVzQ8OUOnyvCZgUsekJxyEgnm3+4wwrhT?=
 =?us-ascii?Q?zg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8171eded-720c-472a-cdeb-08dd8b0b9a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 13:00:10.1470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HDbhwRq6GmwCy1koGQoFhF3Tcc6IdrhMfuUU3GWwCoWO+IDCQYJPDYX6WctHDW3oknCeSTjLWIBT+AbhdX2PMe5Sqxvb/XLt85Iw3QkRpRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7311
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

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 April 2025 21:41
> Subject: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for =
LPCLK handling
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in `rzg2l_mipi_dsi=
_hw_info` to indicate the
> need for LPCLK configuration.
>=20
> On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required DPHY r=
egister configuration,
> whereas on the RZ/G2L SoC, this clock is not present. To accommodate this=
 difference, add an `lpclk`
> clock handle in `rzg2l_mipi_dsi` and update the probe function to conditi=
onally acquire LPCLK if the
> SoC supports it.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - No changes
>=20
> v2->v3:
> - No changes
>=20
> v1->v2:
> - Added LPCLK as feature flag
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index df43ff59e08e..22a386ca8ae3 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -30,6 +30,7 @@
>=20
>  #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
>  #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
> +#define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
>=20
>  struct rzg2l_mipi_dsi;
>=20
> @@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
>  	struct drm_bridge *next_bridge;
>=20
>  	struct clk *vclk;
> +	struct clk *lpclk;
>=20
>  	enum mipi_dsi_pixel_format format;
>  	unsigned int num_data_lanes;
> @@ -788,6 +790,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>=20
> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
> +		dsi->lpclk =3D devm_clk_get(dsi->dev, "lpclk");
> +		if (IS_ERR(dsi->lpclk))
> +			return PTR_ERR(dsi->lpclk);
> +	}
> +

Can we use devm_clk_get_optional() and get rid of this Feature bit check
as DT binding check validates for a particular SoC this clk is required or =
not?
Otherwise, there is no usage for optional API's?

Otherwise LGTM,

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

>  	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
>  		dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
>  		if (IS_ERR(dsi->rstc))
> --
> 2.49.0

