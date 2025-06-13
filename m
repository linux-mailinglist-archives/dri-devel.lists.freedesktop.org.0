Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC38AD82E8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE4A10E0F6;
	Fri, 13 Jun 2025 05:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QQUIZc2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945FE10E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 05:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tikSVKyW08F/rZDoiZXlpie4DMCAMjsxKhlE+nazPaKBaoI2UtzO1Bfir9ZMH9OXVB6o/g4E54vDIwd+hiK09fwXAgKWe0yjyk/w3joqdSBkOylMtiyRnfNMJV2kwnLMiN6jYgq82RZqJ1ObULb9r4G6YBNnjATTbVv4JwZyVI2+S03XXb3/ym5sAJplD5ejxMJRxUtYTrJSV++xQTpxF/C99H8OU6PUrcqkScY0OqLiUOlcAiamm4rPbIyNdPS3jHQxvs83eY8/LeyYzHc7gA/InWv+s5u/dbWOISbxtq76CZfcx+N1iMpeOdBkQN4t5lRQ6DCnLXUlZ04wmpcaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6mRbc+WIBIPZBczLDGZc2GRSFBHoKEh8iexGQwAxEw=;
 b=TC1wa84FXq6Oko0z4drKsTP3ienRjYHwmf3YqiNO9p4BMYNDc3sgE+S8j9cTKjd3YGX0ZTC4MKFBT8nMST2K4hdh9Z/rAaBjZcZuQ4Q+Oaj5QZVXYVRvNC+en6YOsZiKYYKvqo4g3lnGfs/S0avvVT+xPDz+9AGFM8d4/V9BgTJ9jDx6tHF/fCR9gAORqhrFTzdsNrF7KUQhaFpUppmswZhAFeIzGHT5KJPA3O8DOHVkjD554B/U8XqT66TUC2xzYUkbMfEtVLf554j6AQzN6swr+rnUvxneebHLYs+IxNUHRsUMXpEyQzAM6UJN//rvRMmMfRBYk/nyuUZWl1J88Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6mRbc+WIBIPZBczLDGZc2GRSFBHoKEh8iexGQwAxEw=;
 b=QQUIZc2NNuKVtstNFBsSYaWjCuyTs1w9xeTTikc6ylDdH7/u/jYLsiCIUTWTW29hbTg8BvCk9y0uUAuReRaCaj9oGQ96sCCVv0k0fmGrpESsnI3kdwH2+N70Il3rp3ImE1w9DnoKmlUeUhaXC8/mixC5HEj0skwlzuFBHy+XXuQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 13 Jun
 2025 05:57:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 05:57:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
Thread-Topic: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
Thread-Index: AQHb0YbvZKdKpGoLPEeGBmVqxN0ROrQAp8mg
Date: Fri, 13 Jun 2025 05:57:17 +0000
Message-ID: <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11465:EE_
x-ms-office365-filtering-correlation-id: 1bbe6b71-ef20-4ff2-8133-08ddaa3f275e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1L9TMUtIO3wDzYfpbjMXqPs/3jzTBknBxbtJvbWxIwFMRkQcSERpX40ICukt?=
 =?us-ascii?Q?/oWRr03RuixHPHUgi5HUC7PrPqqnYv5REht1Z+BxP0O437aCXMUYdxTEGDrd?=
 =?us-ascii?Q?6ZDf7sRLJG+9Sd0ZbLxoQW8EMckmwJZJ4D4zyVppGLVvQlVx+jk39NW0YAgC?=
 =?us-ascii?Q?xT68PNIri44XC5U74NWwhooVlVglRKKZlPUtYArPO3udPZ9xe/LhAVylWQ3R?=
 =?us-ascii?Q?ozslrL99SZcN5K3kHh+XYovxPTKFkeJjqqWiO/m/pdgtJ99DYgGV9Wry64FV?=
 =?us-ascii?Q?oygcC3DVci5+QSoyzNDyLg84hu03ewSMqpxHRv2toNrnwBPVq1BBoMkjcis2?=
 =?us-ascii?Q?w+TqXhNaOhe1ZXJthP+4gJlUQkkR0aNNEII+mAlHtKE6MN0obPTC790yyLfU?=
 =?us-ascii?Q?vTNsVgMjgQ9esuZ8+VorGvkwzU/kv6mIjeWgKH9qHb5j60uqGHk3BnfmPuqN?=
 =?us-ascii?Q?r6BzAAZ3Q9Mmnko5wHFBpElYhlDpi8bh8AvyCeeWmPKHfKVwvX1dzp8Kcz58?=
 =?us-ascii?Q?/4iOAAOhSiEnjnhYKGV10MOlH7HShprrzG43OZ48m4pJSWnChmMusxUmduOf?=
 =?us-ascii?Q?PgiXPWLRWiQliTVzcwyAfoU/sIrPUnrIHPL+R5jxLY+Harh+BBaVtl+WjHsW?=
 =?us-ascii?Q?gsJ4kflgHrdlnpmQiVSZdTpSnzVrJfsrSg6rvPpD5Ac+EtFU6qEHPKT3jAEi?=
 =?us-ascii?Q?TZJBuFL4NI8muR8Pfk1n6AXITTcxbc/ckKuE3o0ZHj+BjMe3Y5Thc5VtmY4H?=
 =?us-ascii?Q?vIBwNdSd72xcjxZAr274i1EPKEQZKYUNVVeLkRZIz6isaehKp9GcnUKkxivY?=
 =?us-ascii?Q?t3O/RGQlQUhlueVh/jrDn0I9QP92qXHXEK0GR/JfeUkbKEzlID19b53pqkwv?=
 =?us-ascii?Q?anY3uRoxRsQhMmqv1nW6EHLFkCo2TKSitQKItt47TaBx8SKpRPHKwvnaMcFN?=
 =?us-ascii?Q?M40zoXFXmuwKFJeBkOjRBLxtLjJeGGrpIMwP5iNzz4nB3krVWBCKjUozyPID?=
 =?us-ascii?Q?Kgdidome0I2mj/SrlwfK2b1uhlrKRIHPosjk4kZE7+UzQ1JLCCC6vqYd34Y6?=
 =?us-ascii?Q?POH343G72UefAqbWzXDk1L6n4pdb5j+4Ph4wbYTpU7S+DmrJw2qcTPkMMAXs?=
 =?us-ascii?Q?K7UwmA5L83uXLUx439nQgz3pVz7OLjdOyq+HMzWqohbw3mRz7pDW8iSPFIBf?=
 =?us-ascii?Q?IveQrGyRdhMSF7MYcHRp1GyxDTh3l3WCFiQs5eXci/7G9xsexcAz5Nf162AC?=
 =?us-ascii?Q?Nofuhhe4shcsfW62hyHyoADTAzvCgUNmp3N800yIaikrQopgsdV+Ff6zFALr?=
 =?us-ascii?Q?dB/Wh5JYyhkiqWqUZmBwj+2cwFczxqd4K/ZSFj/NlJj8civ24ohYP2t5efyw?=
 =?us-ascii?Q?exn6+8dL+02MYl1MVZhwyqGAIi5uwWmU5iFxz/67co7QIwMuNiurlSaeNgM7?=
 =?us-ascii?Q?yxVvYJymhkD5VWMvdsVrkkRZjVPS/Pz+TzvFcCofPgUjA8xPaff95kVlKJKd?=
 =?us-ascii?Q?p+P7anN9IXyp7sU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LLKqKW0Xyc0w2FX48utjSmoPcOXVC56nKjwFZ2X3II/6FYXk35onPPnNvU3u?=
 =?us-ascii?Q?WVEyCImxTW7Y9dq8rpP+0SYbtwLs/tClsLtMjDxKC6Ug68oKp12L/dtsf0iC?=
 =?us-ascii?Q?lKZ54qeaVWrKX4JRNulVspXlTKI4fqTWkq9Kd/swXyRf+E/4RIiYVG22GB+W?=
 =?us-ascii?Q?VPHVWQNPqZwC9iU/dnQb7ZNvJYhoLD05nW212o1M3n3H8iE8UYLfsQ4LkqtN?=
 =?us-ascii?Q?e/iWe8WfMxNb1MVTZLKFLDrQz1ug/sGy6IqBWjZvfCpruiI6gltWeCsKXUea?=
 =?us-ascii?Q?0Mub4/puWs43t1XxWDPlExyQV26LXnlGZYuyV14yYCt+M4ewSU8VmLjFX/qY?=
 =?us-ascii?Q?Orw4fVZ85MBEflmvKIpwbCHqBxoLg4qT9DjQpWGso7TbjEcXom5GCR76Eaaj?=
 =?us-ascii?Q?C7T3S7Zn2HwRlGxGqoHie32m0wwReeoJQYZhj5ya5NdSDgoHyv6pAnCCQOaJ?=
 =?us-ascii?Q?HyYAt6cLkVTh30tmIHmITVzptiqtsY/gk7CQ8YM+UoGBE7kDmcDLXcVbmCrA?=
 =?us-ascii?Q?QLgHgreqjr2Tm8ZvQXEtMKsW303uhe7bSZ+w01AfHAil3uraernSgQkeiyTJ?=
 =?us-ascii?Q?5TFNlk4PPwhXm0FcFf4H23FYlfS7wnDfUaXKY35BzZmzd4YaRlAVu9DBEjjG?=
 =?us-ascii?Q?UV7PPKbUcB99dM8WU+98WFkTpWO50GGmkAKHVXKIpPSOL89pyfbwS06SDosp?=
 =?us-ascii?Q?Pr+TYQlckqNr4Nbh6eazwS60blJJM14I8hn0SHyfSY9YJmgZYvR9khr0gefj?=
 =?us-ascii?Q?4ydVLgkGVMGAPnRJgsYoTDRFV76vT7qp4Y11rvC0mpCe6Y3IChAZ6lju3fWI?=
 =?us-ascii?Q?veK+JJFCN9gCZRx6DxmoLvKiglhobrsyu9yveDRYZCNJi/UA5rp1S9IvbBxA?=
 =?us-ascii?Q?kACp2mQ0kCumvuZfaMGOXtlC2NMQj0L7IAkMA9g3Af4rUOSxcATB9R9M7qIt?=
 =?us-ascii?Q?0Ej4cF0k/+IbquoBSIxjZIQZD22j+XX3IBNQVW+7Mx89wydhBg6L5um/vHhU?=
 =?us-ascii?Q?1itJsiL1zHYZ0hyhsNiF806rDLhulC66v8Og0NTTaj1wIZ5Bc0tDLymMYCaD?=
 =?us-ascii?Q?G/9lZv/a+TaklNZIMtBfvHm2gZQfsXl92tX1ywOFi6hZuXP5qaw3p6wliUHb?=
 =?us-ascii?Q?35hnCKMrRhiSngPSSEEABvm9Z3BSJOePD+vJQVJV5Jozv2NlwS8jD9wIxsHY?=
 =?us-ascii?Q?zlIvnY7Bvuz4BequooO0YpbF2fzb1p5AzyPuclYIMcVf8nGly8v8YzcYN5j1?=
 =?us-ascii?Q?mKE8On897n60O6w3C0nGkf1345GnDUEW9zO1cXAiRx1AQx/ZFdDSInz4FWFm?=
 =?us-ascii?Q?e67U83bFso+EHEoFRcrTxzKcITNYk866vdoZPKqhH1cuoXh22bMuS1icIKnf?=
 =?us-ascii?Q?h4ds3RGaDNPIHTeAYeMhd4H0cKjgTQD3XBNTwaNHwd5VQwigOEuiJnacWWYw?=
 =?us-ascii?Q?xSgWkC8nKVsAhECuYNBfs6oUHNJZrtlvCah+IBUzRIUWIHnrH1r3lTCe0TYy?=
 =?us-ascii?Q?rTXxg0alUYNnGr+Uzheekys117v92fZ73hJsD1SpIwhdylDMVA4qYqGLesOG?=
 =?us-ascii?Q?lQEVxSYeImKLPhfRBrTl/Q3wwm80IH6xp+YQseOl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbe6b71-ef20-4ff2-8133-08ddaa3f275e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 05:57:17.6149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFtmFXZHYwI0VKQYwMrCm0AEakuPD0MaeQ1Udr1L5mvjTZ41kykT4BxkUikpdZ3gTI5qzxqhop0JQh//odujiaN2zhYX+7z95hwjTrsiNwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
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

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 May 2025 18:19
.castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> Subject: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI cloc=
ks
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for PLLDSI and PLLDSI divider clocks.
>=20
> Introduce the `renesas-rzv2h-dsi.h` header to centralize and share PLLDSI=
-related data structures,
> limits, and algorithms between the RZ/V2H CPG and DSI drivers.
>=20
> The DSI PLL is functionally similar to the CPG's PLLDSI, but has slightly=
 different parameter limits
> and omits the programmable divider present in CPG. To ensure precise freq=
uency calculations-especially
> for milliHz-level accuracy needed by the DSI driver-the shared algorithm =
allows both drivers to
> compute PLL parameters consistently using the same logic and input clock.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v5->v6:
> - Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
> - Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
>   CPG_PLL_CLK1_DIV_P macros to use GENMASK
> - Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
> - Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
> - Dropped rzv2h_cpg_plldsi_round_rate() and implemented
>   rzv2h_cpg_plldsi_determine_rate() instead
> - Made use of FIELD_PREP()
> - Moved CPG_CSDIV1 macro in patch 2/4
> - Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
> - Used mul_u32_u32() while calculating output_m and output_k_range
> - Used div_s64() instead of div64_s64() while calculating
>   pll_k
> - Used mul_u32_u32() while calculating fvco and fvco checks
> - Rounded the final output using DIV_U64_ROUND_CLOSEST()
>=20
> v4->v5:
> - No changes
>=20
> v3->v4:
> - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
>   description freq_millihz
>=20
> v2->v3:
> - Update the commit message to clarify the purpose of `renesas-rzv2h-dsi.=
h`
>   header
> - Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
> - Replaced *_mhz to *_millihz for clarity
> - Updated u64->u32 for fvco limits
> - Initialized the members in declaration order for
>   RZV2H_CPG_PLL_DSI_LIMITS() macro
> - Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
> - Replaced `unsigned long long` with u64
> - Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
>   rzv2h_cpg_pll_clk_recalc_rate() instead
> - In rzv2h_cpg_plldsi_div_set_rate() followed the same style
>   of RMW-operation as done in the other functions
> - Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
> - Dropped rzv2h_cpg_plldsi_clk_register() and reused
>   rzv2h_cpg_pll_clk_register() instead
> - Added a gaurd in renesas-rzv2h-dsi.h header
>=20
> v1->v2:
> - No changes
> ---
>  drivers/clk/renesas/rzv2h-cpg.c       | 278 +++++++++++++++++++++++++-
>  drivers/clk/renesas/rzv2h-cpg.h       |  13 ++
>  include/linux/clk/renesas-rzv2h-dsi.h | 210 +++++++++++++++++++
>  3 files changed, 492 insertions(+), 9 deletions(-)  create mode 100644 i=
nclude/linux/clk/renesas-
> rzv2h-dsi.h
>=20
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c index
> 761da3bf77ce..d590f9f47371 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -14,9 +14,13 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/minmax.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -26,6 +30,7 @@
>  #include <linux/refcount.h>
>  #include <linux/reset-controller.h>
>  #include <linux/string_choices.h>
> +#include <linux/units.h>
>=20
>  #include <dt-bindings/clock/renesas-cpg-mssr.h>
>=20
> @@ -48,12 +53,13 @@
>  #define CPG_PLL_STBY(x)		((x))
>  #define CPG_PLL_STBY_RESETB	BIT(0)
>  #define CPG_PLL_STBY_RESETB_WEN	BIT(16)
> +#define CPG_PLL_STBY_SSC_EN_WEN BIT(18)
>  #define CPG_PLL_CLK1(x)		((x) + 0x004)
> -#define CPG_PLL_CLK1_KDIV(x)	((s16)FIELD_GET(GENMASK(31, 16), (x)))
> -#define CPG_PLL_CLK1_MDIV(x)	FIELD_GET(GENMASK(15, 6), (x))
> -#define CPG_PLL_CLK1_PDIV(x)	FIELD_GET(GENMASK(5, 0), (x))
> +#define CPG_PLL_CLK1_KDIV	GENMASK(31, 16)
> +#define CPG_PLL_CLK1_MDIV	GENMASK(15, 6)
> +#define CPG_PLL_CLK1_PDIV	GENMASK(5, 0)
>  #define CPG_PLL_CLK2(x)		((x) + 0x008)
> -#define CPG_PLL_CLK2_SDIV(x)	FIELD_GET(GENMASK(2, 0), (x))
> +#define CPG_PLL_CLK2_SDIV	GENMASK(2, 0)
>  #define CPG_PLL_MON(x)		((x) + 0x010)
>  #define CPG_PLL_MON_RESETB	BIT(0)
>  #define CPG_PLL_MON_LOCK	BIT(4)
> @@ -79,6 +85,8 @@
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
>   * @mstop_count: Array of mstop values
>   * @rcdev: Reset controller entity
> + * @dsi_limits: PLL DSI parameters limits
> + * @plldsi_div_parameters: PLL DSI and divider parameters configuration
>   */
>  struct rzv2h_cpg_priv {
>  	struct device *dev;
> @@ -95,6 +103,9 @@ struct rzv2h_cpg_priv {
>  	atomic_t *mstop_count;
>=20
>  	struct reset_controller_dev rcdev;
> +
> +	const struct rzv2h_pll_div_limits *dsi_limits;
> +	struct rzv2h_plldsi_parameters plldsi_div_parameters;
>  };
>=20
>  #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
> @@ -150,6 +161,24 @@ struct ddiv_clk {
>=20
>  #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
>=20
> +/**
> + * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
> + *
> + * @dtable: divider table
> + * @priv: CPG private data
> + * @hw: divider clk
> + * @ddiv: divider configuration
> + */
> +struct rzv2h_plldsi_div_clk {
> +	const struct clk_div_table *dtable;
> +	struct rzv2h_cpg_priv *priv;
> +	struct clk_hw hw;
> +	struct ddiv ddiv;
> +};
> +
> +#define to_plldsi_div_clk(_hw) \
> +	container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
> +
>  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)  {
>  	struct pll_clk *pll_clk =3D to_pll(hw);
> @@ -198,6 +227,214 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw *=
hw)
>  	return ret;
>  }
>=20
> +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
> +						      unsigned long parent_rate)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> +	struct ddiv ddiv =3D dsi_div->ddiv;
> +	u32 div;
> +
> +	div =3D readl(priv->base + ddiv.offset);
> +	div >>=3D ddiv.shift;
> +	div &=3D clk_div_mask(ddiv.width);
> +	div =3D dsi_div->dtable[div].div;
> +
> +	return DIV_ROUND_CLOSEST_ULL(parent_rate, div); }
> +
> +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> +					       struct clk_rate_request *req) {
> +	struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> +	struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_div_para=
meters;
> +	u64 rate_millihz;
> +
> +	/*
> +	 * Adjust the requested clock rate (`req->rate`) to ensure it falls wit=
hin
> +	 * the supported range of 5.44 MHz to 187.5 MHz.
> +	 */
> +	req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> +
> +	rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> +	if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_dividers->fre=
q_millihz)
> +		goto exit_determine_rate;
> +
> +	if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> +						 dsi_dividers, rate_millihz)) {
> +		dev_err(priv->dev,
> +			"failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}


> +
> +exit_determine_rate:
> +	req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;

I believe this has to go after below assignment.

As parent_rate =3D rate * calculated DSI divider value.

req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MILLI);
req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;



> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MILLI);
> +
> +	return 0;
> +};
> +
> +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> +					 unsigned long rate,
> +					 unsigned long parent_rate)
> +{
> +	struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> +	struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> +	struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_div_para=
meters;
> +	struct ddiv ddiv =3D dsi_div->ddiv;
> +	const struct clk_div_table *clkt;
> +	bool div_found =3D false;
> +	u32 val, shift, div;
> +
> +	div =3D dsi_dividers->csdiv;
> +	for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> +		if (clkt->div =3D=3D div) {
> +			div_found =3D true;
> +			break;
> +		}
> +	}
> +
> +	if (!div_found)
> +		return -EINVAL;

This check can be done in determine rate and cache the divider??

> +
> +	shift =3D ddiv.shift;
> +	val =3D readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
> +	val &=3D ~(clk_div_mask(ddiv.width) << shift);
> +	val |=3D clkt->val << shift;
> +	writel(val, priv->base + ddiv.offset);
> +
> +	return 0;
> +};
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_ops =3D {
> +	.recalc_rate =3D rzv2h_cpg_plldsi_div_recalc_rate,
> +	.determine_rate =3D rzv2h_cpg_plldsi_div_determine_rate,
> +	.set_rate =3D rzv2h_cpg_plldsi_div_set_rate, };
> +
> +static struct clk * __init
> +rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
> +				  struct rzv2h_cpg_priv *priv)
> +{
> +	struct rzv2h_plldsi_div_clk *clk_hw_data;
> +	struct clk **clks =3D priv->clks;
> +	struct clk_init_data init;
> +	const struct clk *parent;
> +	const char *parent_name;
> +	struct clk_hw *clk_hw;
> +	int ret;
> +
> +	parent =3D clks[core->parent];
> +	if (IS_ERR(parent))
> +		return ERR_CAST(parent);
> +
> +	clk_hw_data =3D devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNE=
L);
> +	if (!clk_hw_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	clk_hw_data->priv =3D priv;
> +	clk_hw_data->ddiv =3D core->cfg.ddiv;
> +	clk_hw_data->dtable =3D core->dtable;
> +
> +	parent_name =3D __clk_get_name(parent);
> +	init.name =3D core->name;
> +	init.ops =3D &rzv2h_cpg_plldsi_div_ops;
> +	init.flags =3D core->flag;
> +	init.parent_names =3D &parent_name;
> +	init.num_parents =3D 1;
> +
> +	clk_hw =3D &clk_hw_data->hw;
> +	clk_hw->init =3D &init;
> +
> +	ret =3D devm_clk_hw_register(priv->dev, clk_hw);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return clk_hw->clk;
> +}
> +
> +static int rzv2h_cpg_plldsi_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
> +{
> +	struct rzv2h_pll_div_limits dsi_limits;
> +	struct rzv2h_plldsi_parameters dsi_dividers;
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> +	u64 rate_millihz;
> +
> +	memcpy(&dsi_limits, priv->dsi_limits, sizeof(dsi_limits));
> +	dsi_limits.csdiv.min =3D 1;
> +	dsi_limits.csdiv.max =3D 1;
> +
> +	req->rate =3D clamp(req->rate, 25000000UL, 375000000UL);

I guess this clamping is not required as the child already has clamping
and max DSI divider is fixed.

rate(Max) =3D 187500 * 1000 * divider =3D 187.5 MHz(clamped value) * dsi di=
vider

> +
> +	rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> +	if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> +						 &dsi_dividers, rate_millihz)) {
> +		dev_err(priv->dev,
> +			"failed to determine rate for req->rate: %lu\n",
> +			req->rate);
> +		return -EINVAL;
> +	}
> +
> +	req->best_parent_rate =3D req->rate * dsi_dividers.csdiv;

This is wrong as it will lead to high value for  parent as the rate is fixe=
d 24MHz.

24MHz-> PLL_DSI(This clock) -> DSI DIVIDER-> DoT clock


Cheers,
Biju

> +	req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers.freq_millihz, MILLI);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_cpg_pll_set_rate(struct clk_hw *hw,
> +				  unsigned long rate,
> +				  unsigned long parent_rate)
> +{
> +	struct pll_clk *pll_clk =3D to_pll(hw);
> +	struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> +	struct rzv2h_plldsi_parameters *dsi_dividers;
> +	struct pll pll =3D pll_clk->pll;
> +	u16 offset =3D pll.offset;
> +	u32 val;
> +	int ret;
> +
> +	/* Put PLL into standby mode */
> +	writel(CPG_PLL_STBY_RESETB_WEN, priv->base + CPG_PLL_STBY(offset));
> +	ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +					val, !(val & CPG_PLL_MON_LOCK),
> +					100, 2000);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to put PLLDSI into standby mode");
> +		return ret;
> +	}
> +
> +	dsi_dividers =3D &priv->plldsi_div_parameters;
> +	/* Output clock setting 1 */
> +	writel(FIELD_PREP(CPG_PLL_CLK1_KDIV, (u16)dsi_dividers->k) |
> +	       FIELD_PREP(CPG_PLL_CLK1_MDIV, dsi_dividers->m) |
> +	       FIELD_PREP(CPG_PLL_CLK1_PDIV, dsi_dividers->p),
> +	       priv->base + CPG_PLL_CLK1(offset));
> +
> +	/* Output clock setting 2 */
> +	val =3D readl(priv->base + CPG_PLL_CLK2(offset));
> +	writel((val & ~CPG_PLL_CLK2_SDIV) | FIELD_PREP(CPG_PLL_CLK2_SDIV, dsi_d=
ividers->s),
> +	       priv->base + CPG_PLL_CLK2(offset));
> +
> +	/* Put PLL to normal mode */
> +	writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB,
> +	       priv->base + CPG_PLL_STBY(offset));
> +
> +	/* PLL normal mode transition, output clock stability check */
> +	ret =3D readl_poll_timeout_atomic(priv->base + CPG_PLL_MON(offset),
> +					val, (val & CPG_PLL_MON_LOCK),
> +					100, 2000);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to put PLLDSI into normal mode");
> +		return ret;
> +	}
> +
> +	return 0;
> +};
> +
>  static unsigned long rzv2h_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>  						   unsigned long parent_rate)
>  {
> @@ -213,12 +450,19 @@ static unsigned long rzv2h_cpg_pll_clk_recalc_rate(=
struct clk_hw *hw,
>  	clk1 =3D readl(priv->base + CPG_PLL_CLK1(pll.offset));
>  	clk2 =3D readl(priv->base + CPG_PLL_CLK2(pll.offset));
>=20
> -	rate =3D mul_u64_u32_shr(parent_rate, (CPG_PLL_CLK1_MDIV(clk1) << 16) +
> -			       CPG_PLL_CLK1_KDIV(clk1), 16 + CPG_PLL_CLK2_SDIV(clk2));
> +	rate =3D mul_u64_u32_shr(parent_rate, (FIELD_GET(CPG_PLL_CLK1_MDIV, clk=
1) << 16) +
> +			       (s16)FIELD_GET(CPG_PLL_CLK1_KDIV, clk1),
> +			       16 + FIELD_GET(CPG_PLL_CLK2_SDIV, clk2));
>=20
> -	return DIV_ROUND_CLOSEST_ULL(rate, CPG_PLL_CLK1_PDIV(clk1));
> +	return DIV_ROUND_CLOSEST_ULL(rate, FIELD_GET(CPG_PLL_CLK1_PDIV,
> +clk1));
>  }
>=20
> +static const struct clk_ops rzv2h_cpg_plldsi_ops =3D {
> +	.recalc_rate =3D rzv2h_cpg_pll_clk_recalc_rate,
> +	.determine_rate =3D rzv2h_cpg_plldsi_determine_rate,
> +	.set_rate =3D rzv2h_cpg_pll_set_rate,
> +};
> +
>  static const struct clk_ops rzv2h_cpg_pll_ops =3D {
>  	.is_enabled =3D rzv2h_cpg_pll_clk_is_enabled,
>  	.enable =3D rzv2h_cpg_pll_clk_enable,
> @@ -228,7 +472,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops =3D {  =
static struct clk * __init
> rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
>  			   struct rzv2h_cpg_priv *priv,
> -			   const struct clk_ops *ops)
> +			   const struct clk_ops *ops,
> +			   bool turn_on)
>  {
>  	void __iomem *base =3D priv->base;
>  	struct device *dev =3D priv->dev;
> @@ -258,6 +503,13 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_clk=
 *core,
>  	pll_clk->base =3D base;
>  	pll_clk->priv =3D priv;
>=20
> +	if (turn_on) {
> +		/* Disable SSC and turn on PLL clock when init */
> +		writel(CPG_PLL_STBY_RESETB_WEN | CPG_PLL_STBY_RESETB |
> +		       CPG_PLL_STBY_SSC_EN_WEN,
> +		       base + CPG_PLL_STBY(pll_clk->pll.offset));
> +	}
> +
>  	ret =3D devm_clk_hw_register(dev, &pll_clk->hw);
>  	if (ret)
>  		return ERR_PTR(ret);
> @@ -500,7 +752,7 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk=
 *core,
>  			clk =3D clk_hw->clk;
>  		break;
>  	case CLK_TYPE_PLL:
> -		clk =3D rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops);
> +		clk =3D rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_pll_ops,
> +false);
>  		break;
>  	case CLK_TYPE_DDIV:
>  		clk =3D rzv2h_cpg_ddiv_clk_register(core, priv); @@ -508,6 +760,12 @@
> rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
>  	case CLK_TYPE_SMUX:
>  		clk =3D rzv2h_cpg_mux_clk_register(core, priv);
>  		break;
> +	case CLK_TYPE_PLLDSI:
> +		clk =3D rzv2h_cpg_pll_clk_register(core, priv, &rzv2h_cpg_plldsi_ops, =
true);
> +		break;
> +	case CLK_TYPE_PLLDSI_DIV:
> +		clk =3D rzv2h_cpg_plldsi_div_clk_register(core, priv);
> +		break;
>  	default:
>  		goto fail;
>  	}
> @@ -1043,6 +1301,8 @@ static int __init rzv2h_cpg_probe(struct platform_d=
evice *pdev)
>  	priv->last_dt_core_clk =3D info->last_dt_core_clk;
>  	priv->num_resets =3D info->num_resets;
>=20
> +	priv->dsi_limits =3D info->plldsi_limits;
> +
>  	for (i =3D 0; i < nclks; i++)
>  		clks[i] =3D ERR_PTR(-ENOENT);
>=20
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-=
cpg.h index
> 7321b085f937..1f1ef2fcf878 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -166,6 +166,8 @@ enum clk_types {
>  	CLK_TYPE_PLL,
>  	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
>  	CLK_TYPE_SMUX,		/* Static Mux */
> +	CLK_TYPE_PLLDSI,	/* PLLDSI */
> +	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
>  };
>=20
>  #define DEF_TYPE(_name, _id, _type...) \ @@ -193,6 +195,14 @@ enum clk_t=
ypes {
>  		 .num_parents =3D ARRAY_SIZE(_parent_names), \
>  		 .flag =3D CLK_SET_RATE_PARENT, \
>  		 .mux_flags =3D CLK_MUX_HIWORD_MASK)
> +#define DEF_PLLDSI(_name, _id, _parent, _pll_packed) \
> +	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI, .parent =3D _parent, .cfg.pll =3D
> +_pll_packed) #define DEF_PLLDSI_DIV(_name, _id, _parent, _ddiv_packed, _=
dtable) \
> +	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_DIV, \
> +		 .cfg.ddiv =3D _ddiv_packed, \
> +		 .dtable =3D _dtable, \
> +		 .parent =3D _parent, \
> +		 .flag =3D CLK_SET_RATE_PARENT)
>=20
>  /**
>   * struct rzv2h_mod_clk - Module Clocks definitions @@ -293,6 +303,7 @@ =
struct rzv2h_reset {
>   *
>   * @num_mstop_bits: Maximum number of MSTOP bits supported, equivalent t=
o the
>   *		    number of CPG_BUS_m_MSTOP registers multiplied by 16.
> + * @plldsi_limits: PLL DSI parameters limits
>   */
>  struct rzv2h_cpg_info {
>  	/* Core Clocks */
> @@ -311,6 +322,8 @@ struct rzv2h_cpg_info {
>  	unsigned int num_resets;
>=20
>  	unsigned int num_mstop_bits;
> +
> +	const struct rzv2h_pll_div_limits *plldsi_limits;
>  };
>=20
>  extern const struct rzv2h_cpg_info r9a09g047_cpg_info; diff --git a/incl=
ude/linux/clk/renesas-rzv2h-
> dsi.h b/include/linux/clk/renesas-rzv2h-dsi.h
> new file mode 100644
> index 000000000000..b77f9bc3777e
> --- /dev/null
> +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> @@ -0,0 +1,210 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Renesas RZ/V2H(P) DSI CPG helper
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +#ifndef __RENESAS_RZV2H_DSI_H__
> +#define __RENESAS_RZV2H_DSI_H__
> +
> +#include <linux/limits.h>
> +#include <linux/math.h>
> +#include <linux/math64.h>
> +#include <linux/units.h>
> +
> +#define OSC_CLK_IN_MEGA		(24 * MEGA)
> +
> +struct rzv2h_pll_div_limits {
> +	struct {
> +		u32 min;
> +		u32 max;
> +	} fvco;
> +
> +	struct {
> +		u16 min;
> +		u16 max;
> +	} m;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} p;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} s;
> +
> +	struct {
> +		s16 min;
> +		s16 max;
> +	} k;
> +
> +	struct {
> +		u8 min;
> +		u8 max;
> +	} csdiv;
> +};
> +
> +struct rzv2h_plldsi_parameters {
> +	u64 freq_millihz;
> +	s64 error_millihz;
> +	u16 m;
> +	s16 k;
> +	u8 csdiv;
> +	u8 p;
> +	u8 s;
> +};
> +
> +#define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
> +	static const struct rzv2h_pll_div_limits (name) =3D {		\
> +		.fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA },	\
> +		.m =3D { .min =3D 64, .max =3D 533 },				\
> +		.p =3D { .min =3D 1, .max =3D 4 },				\
> +		.s =3D { .min =3D 0, .max =3D 6 },				\
> +		.k =3D { .min =3D -32768, .max =3D 32767 },			\
> +		.csdiv =3D { .min =3D 2, .max =3D 32 },			\
> +	}								\
> +
> +/**
> + * rzv2h_dsi_get_pll_parameters_values - Finds the best combination of
> +PLL parameters
> + * and divider value for a given frequency.
> + *
> + * @limits: Pointer to the structure containing the limits for the PLL
> +parameters and
> + * divider values
> + * @pars: Pointer to the structure where the best calculated PLL
> +parameters and divider
> + * values will be stored
> + * @freq_millihz: Target output frequency in millihertz
> + *
> + * This function calculates the best set of PLL parameters (M, K, P, S)
> +and divider
> + * value (CSDIV) to achieve the desired frequency.
> + * There is no direct formula to calculate the PLL parameters and the
> +divider value,
> + * as it's an open system of equations, therefore this function uses an
> +iterative
> + * approach to determine the best solution. The best solution is one
> +that minimizes
> + * the error (desired frequency - actual frequency).
> + *
> + * Return: true if a valid set of divider values is found, false otherwi=
se.
> + */
> +static __maybe_unused bool
> +rzv2h_dsi_get_pll_parameters_values(const struct rzv2h_pll_div_limits *l=
imits,
> +				    struct rzv2h_plldsi_parameters *pars,
> +				    u64 freq_millihz)
> +{
> +	struct rzv2h_plldsi_parameters p, best;
> +
> +	/* Initialize best error to maximum possible value */
> +	best.error_millihz =3D S64_MAX;
> +
> +	for (p.csdiv =3D limits->csdiv.min; p.csdiv <=3D limits->csdiv.max; p.c=
sdiv +=3D 2) {
> +		for (p.p =3D limits->p.min; p.p <=3D limits->p.max; p.p++) {
> +			u32 fref =3D OSC_CLK_IN_MEGA / p.p;
> +			u16 divider;
> +
> +			for (divider =3D p.csdiv << limits->s.min, p.s =3D limits->s.min;
> +			     p.s <=3D limits->s.max; p.s++, divider *=3D 2) {
> +				for (p.m =3D limits->m.min; p.m <=3D limits->m.max; p.m++) {
> +					u64 output_m, output_k_range;
> +					s64 pll_k, output_k;
> +					u64 fvco, output;
> +
> +					/*
> +					 * The frequency generated by the combination of the
> +					 * PLL + divider is calculated as follows:
> +					 *
> +					 * Freq =3D Ffout / csdiv
> +					 *
> +					 * With:
> +					 * Ffout =3D Ffvco / 2^(pll_s)
> +					 * Ffvco =3D (pll_m + (pll_k / 65536)) * Ffref
> +					 * Ffref =3D 24MHz / pll_p
> +					 *
> +					 * Freq can also be rewritten as:
> +					 * Freq =3D Ffvco / (2^(pll_s) * csdiv))
> +					 *      =3D Ffvco / divider
> +					 *      =3D (pll_m * Ffref) / divider + ((pll_k / 65536) * Ffref) /
> divider
> +					 *      =3D output_m + output_k
> +					 *
> +					 * Every parameter has been determined at this point, but pll_k.
> +					 * Considering that:
> +					 * -32768 <=3D pll_k <=3D 32767
> +					 * Then:
> +					 * -0.5 <=3D (pll_k / 65536) < 0.5
> +					 * Therefore:
> +					 * -Ffref / (2 * divider) <=3D output_k < Ffref / (2 * divider)
> +					 */
> +
> +					/* Compute output M component (in mHz) */
> +					output_m =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
> +									 divider);
> +					/* Compute range for output K (in mHz) */
> +					output_k_range =3D DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
> +									       divider * 2);
> +					/*
> +					 * No point in continuing if we can't achieve the
> +					 * desired frequency
> +					 */
> +					if (freq_millihz <  (output_m - output_k_range) ||
> +					    freq_millihz >=3D (output_m + output_k_range))
> +						continue;
> +
> +					/*
> +					 * Compute the K component
> +					 *
> +					 * Since:
> +					 * Freq =3D output_m + output_k
> +					 * Then:
> +					 * output_k =3D Freq - output_m
> +					 *          =3D ((pll_k / 65536) * Ffref) / divider
> +					 * Therefore:
> +					 * pll_k =3D (output_k * 65536 * divider) / Ffref
> +					 */
> +					output_k =3D freq_millihz - output_m;
> +					pll_k =3D div_s64(output_k * 65536ULL * divider, fref);
> +					pll_k =3D DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
> +
> +					/* Validate K value within allowed limits */
> +					if (pll_k < limits->k.min || pll_k > limits->k.max)
> +						continue;
> +
> +					p.k =3D pll_k;
> +
> +					/* Compute (Ffvco * 65536) */
> +					fvco =3D mul_u32_u32(p.m * 65536 + p.k, fref);
> +					if ((fvco < mul_u32_u32(limits->fvco.min, 65536)) ||
> +					    (fvco > mul_u32_u32(limits->fvco.max, 65536)))
> +						continue;
> +
> +					/* PLL_M component of (output * 65536 * PLL_P) */
> +					output =3D mul_u32_u32(p.m * 65536, OSC_CLK_IN_MEGA);
> +					/* PLL_K component of (output * 65536 * PLL_P) */
> +					output +=3D p.k * OSC_CLK_IN_MEGA;
> +					/* Make it in mHz */
> +					output *=3D MILLI;
> +					output =3D DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
> +
> +					p.error_millihz =3D freq_millihz - output;
> +					p.freq_millihz =3D output;
> +
> +					/* If an exact match is found, return immediately */
> +					if (p.error_millihz =3D=3D 0) {
> +						*pars =3D p;
> +						return true;
> +					}
> +
> +					/* Update best match if error is smaller */
> +					if (abs(best.error_millihz) > abs(p.error_millihz))
> +						best =3D p;
> +				}
> +			}
> +		}
> +	}
> +
> +	/* If no valid parameters were found, return false */
> +	if (best.error_millihz =3D=3D S64_MAX)
> +		return false;
> +
> +	*pars =3D best;
> +	return true;
> +}
> +
> +#endif	/* __RENESAS_RZV2H_DSI_H__ */
> --
> 2.49.0

