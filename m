Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE929B29DA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 09:07:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9808810E368;
	Mon, 28 Oct 2024 08:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PaEaIVHO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010016.outbound.protection.outlook.com [52.101.229.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7D410E367
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 08:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPrZ0A7QFGGKeNcAkmqxqEW0MpLfq7uMxYhDxxVM109SmdE4gqQ6bGKdn96ckSK0VRGsnB0FHQ6m6yXu3sdRAwG4EqpxQetyJ3u8vfNK2ko1pJkuMTuf0iuCHOIowIsN21/+n8ZRDOKNsBEmaeS/N2ItBNoDhlOKgLB3cD/gyWzWbH4sjujMnF11uw9111kgI7psLHnwoXcXhARGrxrO2LuuWqbDsMbAERR4hwhro0rkHBQEWHvNS7xYpJqXUQ/mbZr0mHj8jEeNUkuS7xQpizI4TEXhzmHREitOgtLIaToSxSTEnzs8j2moHxzqsm/ng5gjzfACDZdUJ8H6zw1b2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bqkjir8OeLvFtRt8Xd67DBu8IaWBG+ib35s0Dvll0dI=;
 b=qgjR+pSISDmexe5oSSUgevSy0GoXF7WEW928rV7SiuAIW4nwz6qzTEOinIlNrXEjGEKb64Ig+mDMTl09rT1XrxAjoVS2htL/anDe+3kNBb6IDcmDtG3e4DfvYUG90MWYm5TAhGKJlbjUBg9EfgDPBSiOemToeS34zBLgT6DxcD+oI67YKR5r1HUNRuaXNP9w7GvFbRji4sv0XFVpkyZz6/ggj7Ita5Chla1f0PpwhGBfbcfBCgJOH4JV6uHEwpDSMOhwbn9OQvQBlc6Rt0GpNxmSd4z7Of+vTb/nS6CjEEtPNpy6JZREoOTdTeX/tRdXIjuh2yUHYk3phcb0BYlehQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bqkjir8OeLvFtRt8Xd67DBu8IaWBG+ib35s0Dvll0dI=;
 b=PaEaIVHOOtj9ohqWOq3TiwI7q4NlXiL3rnshyLt21PecXEY3Er6kQoNRh0IRfY82eFZNNqMGj9st4GTTLi2HMAtZy2zj4jbGHCQPs+z9eqsOv9Ih+mClh93bXdX6WXHbkrqqwZu3fIT5JcfdFJlbYY+O0UHoohg1Rp8Tm3ZXsUM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6457.jpnprd01.prod.outlook.com (2603:1096:402:3f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 08:07:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 08:07:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263
 LVDS to HDMI converter
Thread-Topic: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263
 LVDS to HDMI converter
Thread-Index: AQHbKOKdir/Hq5yWo06qpK6ta5P/J7KbzTmQ
Date: Mon, 28 Oct 2024 08:07:34 +0000
Message-ID: <TY3PR01MB1134615A1D3C84EBCEB23130C864A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-10-victor.liu@nxp.com>
In-Reply-To: <20241028023740.19732-10-victor.liu@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6457:EE_
x-ms-office365-filtering-correlation-id: 8dd63820-0b76-4160-c6ed-08dcf727949c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?L2/GMfULBb7TA79L3DN4CRVOBOa5ikW++C6/7vuX/CH7zM+ZUJsyVc/mUeU5?=
 =?us-ascii?Q?p3CyYG+SO1T+1Dx520fVRF/S23eYTYIUVYG+UqoOc3E3W9XJDEa1KLpD6E7I?=
 =?us-ascii?Q?xtkGFjqjFwNl04wQPMSeJpz/q+TVAL4bM+b8b7ZPOHlPUrJjDTPd41PVpFz7?=
 =?us-ascii?Q?cHCAEkpaoq98cI+qIAvsPMd+O4OreOsz5VG4zV6/JTcBUHemh26yAk4yA9A5?=
 =?us-ascii?Q?bcp2FZxuqKlfMMIFo/pQPkf0b+JLBTcmg63Q0BVTATFxLz1KVTPVHdEphGjx?=
 =?us-ascii?Q?1Gd76eeaQ3l6piHnrT/L6IrNLuljWxzlx5qRrEcXvcwTgHZdJYeGx7+e8yxg?=
 =?us-ascii?Q?MEMhl4ekuuCDdb+6yhHHLBQHB8YgfyjAY23yDp9S+WqbB83USxPc7tt7rQwk?=
 =?us-ascii?Q?j7mz0bKeZ3Mu2pXLiQ+70zC4QzJhoHGqhhinFr6Jfy4B+PHDTgldlGOgRi3W?=
 =?us-ascii?Q?zFuuThdb36Ee8R+xDAUJ70AOixpD9Vbg/3U8y+iawQedKfqwKOMXoEZuygTn?=
 =?us-ascii?Q?TyIct895ZIfDts3zcrCfxwsSUk3AMl63Lvt/TVv4VVqCL5Z/ghue6AfXY4bB?=
 =?us-ascii?Q?NxWP/VUdhsfuXevc5AQP16eZU8YnhzXnNNmmmQoFlnbvpeekkZ5FOqO7ZwnT?=
 =?us-ascii?Q?1Khhvn53Ug/FZPG3lVcG7LtgA54HgBxUusOA+pltxgGMu6aqW3r3Ly092m9w?=
 =?us-ascii?Q?O0sw1l70wll2JyJrYaf4QUco47WIf8m/acfeuoJ1PwGLY33cN+67arZPCWXp?=
 =?us-ascii?Q?dlf7REuiRQkbusgNX5Jik7XEPBzkdl3w83xg+CtgWHegOXdUCL124JsdIQ4j?=
 =?us-ascii?Q?SEwiWvh1lmIpmzTNKWYQKK6nXL3Uni4Xj4rLePotzQUjsIwyWw4ZifBMrrlr?=
 =?us-ascii?Q?58v52I7VS60wNPXYKOSW/mJ8xM2DkSfSWNLIy6LoUUdLoF/CqQ3XGSw4+pc0?=
 =?us-ascii?Q?0uW8BrqZ5x/GobA3T2YnzdeeEI2ELm6rbzijVJ2eqHUFfXKzFn5ihgl7aqSW?=
 =?us-ascii?Q?FJC4HXaWPRWGUj/2ZhfVPuMAi99NK90/pkNcD6panThoVVv2rSQTtFpXAtDR?=
 =?us-ascii?Q?Zhq4EdRJH0yjoY6VoGnfTaC+CD4xypM9mx9OCPC++dpcWTsI5pDpGe7eq5P7?=
 =?us-ascii?Q?vqqg/zzSg//zKDgxF4BkXh7Y+7c+B8xB8/VFXrzEO7Z1NUb1qTF1/K0T1Lml?=
 =?us-ascii?Q?9LF8e60m/0HBYXtHs7f3dzlC7VkK+mejxJXUoVtLt/KbWVVTE5Rz/IS7/Xe4?=
 =?us-ascii?Q?V4pFnnn4NRIGMKPt3F5lMok5HsUiAArTz1uukMNfCf51r0GdSMHXU0DcxGen?=
 =?us-ascii?Q?ZKfSClhytTGiJ5vjuZvQi4xb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?FfWaqj76K48q0WExrvgS1VEt+btuGAeQzgTj6pdqXOFScTUcrFjDikdVAWgU?=
 =?us-ascii?Q?0ZvRJFS5j/pGe2NadOMQ5o1VkxW0MXFBf29xOy8Sq7jCQ+5YJA1q8sShMB9j?=
 =?us-ascii?Q?/kswzvIyxN8RZO4+pgVzZHL2u1kvPWa18s8ZG4xe1aTCObf5OvknGrlcy/23?=
 =?us-ascii?Q?sVmb8LYm1T/jOvwAznAApWrENnmcHh3dcGz93mJHicDHg4FHBx+/Jn+iuP4N?=
 =?us-ascii?Q?7jgtJVdMnv18wbpY1degLamN3HCeg2T2buuInGCbGMbiIg5FInf4mbpCgxh5?=
 =?us-ascii?Q?ffR/TS6gzyruPdD5IE0G/Rf0kkoQJ5Lb7nr1hZYw5EUt702YpSv5qFGKBYR8?=
 =?us-ascii?Q?YrKXbig/XzDQQqpefU64drBvpbSNJ8P72fIZkQsGDnIoShV9YjL6k0Y0Dkb7?=
 =?us-ascii?Q?Wr/mdjGFZySL01XPjraxGLWqThOWU3VEWy/LKpQMGXyZMF5CsyjtTBW6OPl9?=
 =?us-ascii?Q?YA2EAU9NBfHdLT6Wm860OWoQ5aOjaIgrjn4ZC1YUyjnoJj39ReGuJxVwT0tR?=
 =?us-ascii?Q?iajWg69xdnlK3Yhi0J9YnDNaARacstIubjDXcrP2i0tMYI9BI2OssPQ00t/s?=
 =?us-ascii?Q?K+lWdpx8PynuNt7MUb2K2AltOyy1426DfMcUzbddIJdot+C8W1znKsK9LFgO?=
 =?us-ascii?Q?zWG/EyAXHTSM1ZDI4RjlfTi3IQh6d5b1oz8yHFVacGctYf+fqBlVWWeI1jo2?=
 =?us-ascii?Q?4XewuSMGjw/VVHc3Kxy+uJkFSpYFBk4VNlFdPMNn8gOAnEn4ovffAVla7iff?=
 =?us-ascii?Q?dZu4oNsUpIDCexGuIXG8MYyx6KscxhoSAMyD+IYTyvGY1UeqDbmI5X7ZpnGd?=
 =?us-ascii?Q?tLt3bYw0804bejrecSNK1KaHBlX0A22tciFE3UmxxUgBqaIPi/8P+UQwJl2z?=
 =?us-ascii?Q?NYnqJiLDiZldwJ+2LfK5h9cGfPKtWI5iS7mKSscGIVm5cvOpfVbOct4KYPsN?=
 =?us-ascii?Q?tXw0YE8W3xuJwNkyvrKOpvEFrC3vMFl8/3XUolkSuLbgcJr6t+9CbqOiVlxP?=
 =?us-ascii?Q?9EpA43wiTjR4ZOyPw5rFfJ88nTvze1O7SLt1UpvFrCZUcxk9LTyDWgh66Rar?=
 =?us-ascii?Q?jUEBpr0n+ARWcCHttAapfnuQR5U2SkPsARm5Ae8IV4sOJaaEOvNPxbmqrdhc?=
 =?us-ascii?Q?7Lm+GGaQ7212g/kktvWXmrWmPMJ5/DZbuJIRHT3nFEmHhUOAM/6DdrTzT5+6?=
 =?us-ascii?Q?e1LY5bh2Hu5tN0rmnzPFO97pbnDMYfnVX3JxCHywQLGEg89qi5MtLiIVqNFE?=
 =?us-ascii?Q?n5h7FhCw5H+GJcTdt/sCVk0icLaBNor5eWctweS04+SrHpn/rBh0dRuSYH0j?=
 =?us-ascii?Q?E7L5bGjJuidxr5wixtyK+Z5LBUTYOEQyQ1QZWmn1dEo6CHUE+ZflW5xH+gET?=
 =?us-ascii?Q?YMg9jrwkYMeLD33r0s2/SeUK2DFG1cZjz8iTUMrctPn4A8wr3+G7/wQZK9tv?=
 =?us-ascii?Q?mllszkT/76R0Mw07sHr6ZhsIB5Vh/3tX5QV7ttrD/HPJBdPv57cYFRLznHx0?=
 =?us-ascii?Q?lfBxgTIZ5ohernwFcpm1ucW24mCpWI3hE+878zWg6yhIAsQi/aLprvMsgcHw?=
 =?us-ascii?Q?YRH+bJbmxPgzIZG9ytuSE1ayjqZMVtjeyOJfdtmOBx/l7EMTLg1h5JEB6pzL?=
 =?us-ascii?Q?cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd63820-0b76-4160-c6ed-08dcf727949c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 08:07:34.8760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E36hU6kGYoz2nCfYN8WXdnIUa2MH1CBIh4TYURcuKgzeEmy1QLsDL+elJfm6lADW56s7Phn5w4QyCYhwnIbhqMdDM30n+RlrOZPe9a36/cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6457
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

Hi Liu Ying,

Thanks for the patch.

> -----Original Message-----
> From: Liu Ying <victor.liu@nxp.com>
> Sent: 28 October 2024 02:38
> Subject: [PATCH v4 09/13] dt-bindings: display: bridge: Add ITE IT6263 LV=
DS to HDMI converter
>=20
> Document ITE IT6263 LVDS to HDMI converter.
>=20
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju


> ---
> v4:
> * Require dual-lvds-odd-pixels or dual-lvds-even-pixels DT properties for
>   port@1.
> * Drop "data-mirror: true"(30-bit LVDS data bit order is not reversed).
>=20
> v3:
> * Reference lvds-dual-ports.yaml.  (Dmitry)
> * Add data-mapping DT property.  (Dmitry, Biju)
> * Allow data-mirror.
> * Drop ite,lvds-link-num-data-lanes DT property.  (Dmitry, Biju)
>=20
> v2:
> * Document number of LVDS link data lanes.  (Biju)
> * Simplify ports property by dropping "oneOf".  (Rob)
>=20
>  .../bindings/display/bridge/ite,it6263.yaml   | 250 ++++++++++++++++++
>  1 file changed, 250 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,=
it6263.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ite,it6263.=
yaml
> b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> new file mode 100644
> index 000000000000..0a10e10d80ff
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
> @@ -0,0 +1,250 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ite,it6263.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ITE IT6263 LVDS to HDMI converter
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The IT6263 is a high-performance single-chip De-SSC(De-Spread
> +Spectrum) LVDS
> +  to HDMI converter.  Combined with LVDS receiver and HDMI 1.4a
> +transmitter,
> +  the IT6263 supports LVDS input and HDMI 1.4 output by conversion funct=
ion.
> +  The built-in LVDS receiver can support single-link and dual-link LVDS
> +inputs,
> +  and the built-in HDMI transmitter is fully compliant with HDMI
> +1.4a/3D, HDCP
> +  1.2 and backward compatible with DVI 1.0 specification.
> +
> +  The IT6263 also encodes and transmits up to 8 channels of I2S digital
> + audio,  with sampling rate up to 192KHz and sample size up to 24 bits.
> + In addition,  an S/PDIF input port takes in compressed audio of up to 1=
92KHz frame rate.
> +
> +  The newly supported High-Bit Rate(HBR) audio by HDMI specifications
> + v1.3 is  provided by the IT6263 in two interfaces: the four I2S input
> + ports or the  S/PDIF input port.  With both interfaces the highest
> + possible HBR frame rate  is supported at up to 768KHz.
> +
> +allOf:
> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
> +
> +properties:
> +  compatible:
> +    const: ite,it6263
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: audio master clock
> +
> +  clock-names:
> +    const: mclk
> +
> +  data-mapping:
> +    enum:
> +      - jeida-18
> +      - jeida-24
> +      - jeida-30
> +      - vesa-24
> +      - vesa-30
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  ivdd-supply:
> +    description: 1.8V digital logic power
> +
> +  ovdd-supply:
> +    description: 3.3V I/O pin power
> +
> +  txavcc18-supply:
> +    description: 1.8V HDMI analog frontend power
> +
> +  txavcc33-supply:
> +    description: 3.3V HDMI analog frontend power
> +
> +  pvcc1-supply:
> +    description: 1.8V HDMI frontend core PLL power
> +
> +  pvcc2-supply:
> +    description: 1.8V HDMI frontend filter PLL power
> +
> +  avcc-supply:
> +    description: 3.3V LVDS frontend power
> +
> +  anvdd-supply:
> +    description: 1.8V LVDS frontend analog power
> +
> +  apvdd-supply:
> +    description: 1.8V LVDS frontend PLL power
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  ite,i2s-audio-fifo-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      Each array element indicates the pin number of an I2S serial data =
input
> +      line which is connected to an audio FIFO, from audio FIFO0 to FIFO=
3.
> +
> +  ite,rl-channel-swap-audio-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    uniqueItems: true
> +    items:
> +      enum: [0, 1, 2, 3]
> +    description:
> +      Each array element indicates an audio source whose right channel a=
nd left
> +      channel are swapped by this converter. For I2S, the element is the=
 pin
> +      number of an I2S serial data input line. For S/PDIF, the element i=
s always
> +      0.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0: true
> +
> +      port@1:
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]
> +          - required: [dual-lvds-even-pixels]
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: video port for the HDMI output
> +
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: sound input port
> +
> +    required:
> +      - port@0
> +      - port@2
> +
> +required:
> +  - compatible
> +  - reg
> +  - data-mapping
> +  - ivdd-supply
> +  - ovdd-supply
> +  - txavcc18-supply
> +  - txavcc33-supply
> +  - pvcc1-supply
> +  - pvcc2-supply
> +  - avcc-supply
> +  - anvdd-supply
> +  - apvdd-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    /* single-link LVDS input */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hdmi@4c {
> +            compatible =3D "ite,it6263";
> +            reg =3D <0x4c>;
> +            data-mapping =3D "jeida-24";
> +            reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +            ivdd-supply =3D <&reg_buck5>;
> +            ovdd-supply =3D <&reg_vext_3v3>;
> +            txavcc18-supply =3D <&reg_buck5>;
> +            txavcc33-supply =3D <&reg_vext_3v3>;
> +            pvcc1-supply =3D <&reg_buck5>;
> +            pvcc2-supply =3D <&reg_buck5>;
> +            avcc-supply =3D <&reg_vext_3v3>;
> +            anvdd-supply =3D <&reg_buck5>;
> +            apvdd-supply =3D <&reg_buck5>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +
> +                    it6263_lvds_link1: endpoint {
> +                        remote-endpoint =3D <&ldb_lvds_ch0>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg =3D <2>;
> +
> +                    it6263_out: endpoint {
> +                        remote-endpoint =3D <&hdmi_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    /* dual-link LVDS input */
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        hdmi@4c {
> +            compatible =3D "ite,it6263";
> +            reg =3D <0x4c>;
> +            data-mapping =3D "jeida-24";
> +            reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +            ivdd-supply =3D <&reg_buck5>;
> +            ovdd-supply =3D <&reg_vext_3v3>;
> +            txavcc18-supply =3D <&reg_buck5>;
> +            txavcc33-supply =3D <&reg_vext_3v3>;
> +            pvcc1-supply =3D <&reg_buck5>;
> +            pvcc2-supply =3D <&reg_buck5>;
> +            avcc-supply =3D <&reg_vext_3v3>;
> +            anvdd-supply =3D <&reg_buck5>;
> +            apvdd-supply =3D <&reg_buck5>;
> +
> +            ports {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                port@0 {
> +                    reg =3D <0>;
> +                    dual-lvds-odd-pixels;
> +
> +                    it6263_lvds_link1_dual: endpoint {
> +                        remote-endpoint =3D <&ldb_lvds_ch0>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg =3D <1>;
> +                    dual-lvds-even-pixels;
> +
> +                    it6263_lvds_link2_dual: endpoint {
> +                        remote-endpoint =3D <&ldb_lvds_ch1>;
> +                    };
> +                };
> +
> +                port@2 {
> +                    reg =3D <2>;
> +
> +                    it6263_out_dual: endpoint {
> +                        remote-endpoint =3D <&hdmi_in>;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.34.1

