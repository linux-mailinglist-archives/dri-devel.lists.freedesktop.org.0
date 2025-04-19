Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB29A9421C
	for <lists+dri-devel@lfdr.de>; Sat, 19 Apr 2025 09:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F5D10E22B;
	Sat, 19 Apr 2025 07:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VltwcdrH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD72D10E22B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Apr 2025 07:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEw6IpAxXDY7sxGW8G9uTJChBnNgCi7mLK15Y9Gb3/0u6XavcTsclvRAnN3AUWjdwW9LUE0OWwUVezIL9t1m78Vlrzs1zVrljkvCbU+qYHrtFhnGYSb8xl/Dh0HznjbM0vy5hRanLbDFZO7wpiYP/xLvT1NDfILmCYsu/JV84dF8WUJjq3cqLRXOZz/1DRoafTjAxxS3T320VmjK1qkP2/ohbjYXShkwp0rwFDzFwnL4frL+Lli59c0cXAWzDoeHYNc+VOPH7I4zmOIY6xx5QGt3xxdUR4YUXQSZpNMZgCiUS2zbPGe7b3x/h0pw976WwPdgPlMXySY56AlPtSjDNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaCAf8COAn96tT2qDvSe3DaIfhRNGLts9yxu9aiNfrA=;
 b=J/tTq6i+RYj0W+8VVmpP1Das5jBctf/dzWrPwM5f06ZJScslahSifjOOc9EGt34GQcmAX+9ySByX/HLRcc9zykidtHTT14L+/8lYyJ1A0bq+D7fRml9asiYY6xRWUpQAc58IMWM+MN/T/tvaF1nJ2GsJ4nzDgNrW2scOQPfy+F+TK4kG//RCjW2BLRA31fjtUAEDLN3rDlV/O+3nFn/GWyiI9UYGfrdIFMDLBnWMTY6Jkjyk/YiWEzQyeSE+1+IeqmHGx2efoyMbLhEWVSNb7dY8pB3Qh78n9JgawqlN06FNtZjl6OFOB/z6+H/udlxcstJuRiklJl+4uWk8BmaWgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaCAf8COAn96tT2qDvSe3DaIfhRNGLts9yxu9aiNfrA=;
 b=VltwcdrHYw0R32miE2tkk6/t7zLc4emB8ltr2HSouFjBRnXu1e3UIBX0FOi6rAoZM1rXUWQa82AdOnqOu5s9XrKTWCSgbfj6eIWLpXCwppXw07xF/S06FI9VphcHPQpg6RhVxeXVNzx7+LwhGX2mcS/Jkg70M3fdbhknPqaUF0Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6412.jpnprd01.prod.outlook.com (2603:1096:400:a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Sat, 19 Apr
 2025 07:28:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.022; Sat, 19 Apr 2025
 07:28:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH v3 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHbsJJZpskYsPIDCUSFmsNedDvOibOqlv0Q
Date: Sat, 19 Apr 2025 07:28:15 +0000
Message-ID: <TY3PR01MB113469966D8B9B58EE4E2D88B86BE2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250418184658.456398-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250418184658.456398-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6412:EE_
x-ms-office365-filtering-correlation-id: 429b980f-7a66-4322-6022-08dd7f13bfbd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BLu+OrdiwkFjaWfmdFu4ohJW5hgO3Y9hl5frSvfPPPc0t00Vz1EfzOEpb0HJ?=
 =?us-ascii?Q?fiZUEgFouEO6tmxOZiuyXR9DTrAGgTG1WEGQn8c3FcGdNLzcTeowf+CaEfjF?=
 =?us-ascii?Q?7Dmm+y9M0RA3Obq4mWCLw7sCmMhaPmzfHm/R26Y61CoMuOMKlRUiY84p5Swj?=
 =?us-ascii?Q?z4lf+LxLEpZD3rT8RPLu2VjCyZXuL2ZBvz6d1CRy5q5Y+aBfP/UDu38xtlx/?=
 =?us-ascii?Q?UbdQX/2EbCtdB4Mr3cIBM8xSOxClAfwlTaf1NrHAir+TTJFW088/d3qrqy+F?=
 =?us-ascii?Q?D+RbHOWHB1Y99CTR2GhrenKcOo5T58mgjd1sY9I5lM6LgZ+KBnFPLZx9e6X6?=
 =?us-ascii?Q?Y05EyD2l8ab3aAAnYwBqA7Au++W6YCpg6icHWPOZlPuk6jqe8B3zHYsMtOm5?=
 =?us-ascii?Q?lzh2pWFdPbc+JePoPGYgn1CQefMwZrNQEG3UgszxZz8c3376gp1APTHfekek?=
 =?us-ascii?Q?RAbrAcO9/v2rbMwokNTAvwNPIsfM26Mi2DjHSLyxacXfsz1R/NV/U/yT/9Iy?=
 =?us-ascii?Q?bfy90oByHAzfF/g+Gf037B8swn61f1bDpvGJkkWOR+AZdlqZTt7i1tambVX7?=
 =?us-ascii?Q?AmEQrfHgkDGPFvIIimIWeyDJYk/SYU0RLqzh5P7z+6C8SqjHuNmA14l8n0/8?=
 =?us-ascii?Q?LrM8k8J78JbPG8obrkGMo+Hdh7kupw98MVB3YPSdfKg8uLfD/c8jKMkq3CAF?=
 =?us-ascii?Q?f7Bim9DPxWT/0pSOunPfBSZTLJg7SVma0qwXC31vpJl7vEInQ/L6TRJtYqh/?=
 =?us-ascii?Q?covybxjVeMP2uHdfWFMAr5lqYHJ8uI1FnYlfqfNDw3N4HdK27QP82+k/+miz?=
 =?us-ascii?Q?GPP2OYc4MvZuQ/lkHv7Lv2IMkJ/xuxzYP+bTmMRTjyhQE4j5wI/AJgacAOVM?=
 =?us-ascii?Q?Vct239LOqqkIjCUTOrAvy/XvioBPU9ZDfHbAnuHx/c8P9fmI9gbKkO+G9Fuz?=
 =?us-ascii?Q?xl/afRHW5SSE+OoypJCgoXXjOlrRxNN5RtAhPP7l/V4NG0vRWzYvgn7TXDFa?=
 =?us-ascii?Q?aGHEohbZUbW2wn7zcvV88R/mVWrLsJ6BZ2H0Pr8fNdtJbgj0PjR3PpknlDPr?=
 =?us-ascii?Q?3FFRRynHCGTOC4XmmS4VcCGD7G8hXsdiS1umNuhu4pRgeA0yN6yftNNzoahN?=
 =?us-ascii?Q?rZqV6HuJzU6y5dAISDmjeqZx74wakaTcrpkhCB96gntKiFevI1wPBii0H6dg?=
 =?us-ascii?Q?wybIycpqxxRW3ekNTFXXHau2NTgyULERAnP1UfzVmgOnANqEUyI7gW4kfpum?=
 =?us-ascii?Q?q+zSlg1UoQoarmQJyzD9Qd0T2KC/AYIoeE6HR319w/DcaLLImM2OQsHzVtau?=
 =?us-ascii?Q?Kv6T6b+pluJKkv86JYfSSI7GFhzo+7GLDHjxmf4X2Gc8gycTIu5ELN77K5Ys?=
 =?us-ascii?Q?x5LXz+uGQIYDAqY8LJGtjKN5u/Z2ADRBEAGfbMvWs/drekccpjwCfiE5IysB?=
 =?us-ascii?Q?wTJz9KRlnbSzZTeXr3CbAHz3hr0tVGvi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wY4f4SWG0wwfidw555Iruup8QIw9+A5s1pPM8sGwp4WBh9eYbpH22TwtsTcX?=
 =?us-ascii?Q?CQqreskUeu3sUqFG4UJlEZrSEB1yz0C9XdYzX0zn5C7LmFEFBlvbRBJB+xQc?=
 =?us-ascii?Q?gzsdX5KFkvIHSpwr/3CAOeX+XtHqx40GdRESZXYrw3gGxt3QKH6lpOlv/xDL?=
 =?us-ascii?Q?N9DyyYJmgOj9pOI7fWcQCp+aXBp1+shD5+0Gfelt5b/LMulP1rF8U4HdOkHY?=
 =?us-ascii?Q?ri8MZk4Ed3+LCx2o0w91qvLNFMn6oGYmN6mRRLXOtAPMRGyliEr1neI1Cmcc?=
 =?us-ascii?Q?MFUJ4MOECpcV+g0lHnIiWrEu5kUcOUTSEMcm1oYr2Ooqwk3t1CUJh1HYFI68?=
 =?us-ascii?Q?/yPp5dYNay9bjxGp+fN7KP20pRXh92QiN3nvNwH30X3j4n6ML6SwLA0K2Ekz?=
 =?us-ascii?Q?kgF5h3+wx9Krqy8St/RhY0e2pesOy+Xdkibqhph3JyM9h+v6/b+TFiMFbdR/?=
 =?us-ascii?Q?bL49Ekn7ReXyUpZoVkQqSWSDDejVGlQJHz5SZTSPeDB0bey0thOK4KUrug2H?=
 =?us-ascii?Q?uNgIghaJHqDEepcXY8HHkQH8PzvJOAEEPzCJF0tIBzNglavHfDN6Iupeyu/5?=
 =?us-ascii?Q?UKZH1NPGsA8IPj9n36u+vEcxx8BgDJ9XwcU5Wv4mgeZyXeAiOhA9ZYMVxl9y?=
 =?us-ascii?Q?xEBWse1fxzgjPY11HXihh7SWhvIE8hDm3z2F71jSvvZfRZSumzj33nFxhEhC?=
 =?us-ascii?Q?m3oK/6mf2yaJ0CvjfYt4+TkIGnoOTX6zHnxXvossa6JD5/FuGczmU4oXp7Bk?=
 =?us-ascii?Q?80gEGJF/JXWcf8+zmS1yzSF63BkNfGGgKzPwkEk+5tnefb/wRz5UZ16LhHUY?=
 =?us-ascii?Q?eS186Q49g5LoBH+bkbisjakVZeyoDKOox+fBN1tEyf36l8OeAWExxKnXvfW+?=
 =?us-ascii?Q?tdvSiNZDLj3Z7yeuI7IlRJfMARlIMf9j0xAZifpWfEBpnxA9xj8eWEM+AFSI?=
 =?us-ascii?Q?Zp3VGUkAVA7PzFoGlbGrzupDuecj9nG2QSwASnaHc3bpI/uVN6BKp6KHn7Aj?=
 =?us-ascii?Q?hKn+oerijIejUYXnUdq843vXtMtHAQwJTv3XpY9EfjXqe1pSSlDIMTTcNtdg?=
 =?us-ascii?Q?lhN0DNMdzpGQLY+4oxyQeetim4JbAnA86fGT289U++kZy+ePwlHiMQq1GiLp?=
 =?us-ascii?Q?y6kJCKMOzaRhIe07azhI4QExOkqKnfsL4q674WORgFkiwvv37AlAOXnBrZ0w?=
 =?us-ascii?Q?9H5v4gMVOPtHETCtx3TkHJRtXdfZgokFS+le0ZbWpcD65jxc32fAG2fmmFq3?=
 =?us-ascii?Q?ddQceK5kjIIGdHCtZdCZ5oqLI//m5pfgKZIgT/Wvj1qqOKXsEJQeP6Evpzh5?=
 =?us-ascii?Q?VEs4u92mO15C/FC9/TdKuJOA/0K7tsdwfVTIYAYiw4zdK9mtEAcAonoIgVEh?=
 =?us-ascii?Q?ckMHKj1EJtyYPmK7iapd9tAkEmhmI0T8dTgjtSQqfMvi88JhhVO0hV8uaApS?=
 =?us-ascii?Q?PVNLiS/i2l8xMjO3CvdkLcsAK70jIwcr2pLrSTLZUTjfqtwxmfe9xWwLEkpX?=
 =?us-ascii?Q?EYIsPWfk4OWXHVDoN91ONURJ7lTWS11awaCkNAdxS7/1acF6DADqW22hh8Jq?=
 =?us-ascii?Q?kPEWe18YZ4pj+P77H8sAW10Z7mAB7DgpFwhpOUCoISs02QXbrQAaSW2Hj29t?=
 =?us-ascii?Q?Ww=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429b980f-7a66-4322-6022-08dd7f13bfbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2025 07:28:15.4169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b2Lzdv7tZNMWPmcV4QONCxrnsFnokb78cfkPIlACrNIOlUypCEW0KQOdHODL+FUAhweCnQbSNP+IYs2FL7SjtA9/wNoMHVHZqvLdjhrY2uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6412
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
> Sent: 18 April 2025 19:47
> Subject: [PATCH v3 15/15] drm: renesas: rz-du: mipi_dsi: Add support for =
RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add DSI support for Renesas RZ/V2H(P) SoC.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Simplifed V2H DSI timings array to save space
> - Switched to use fsleep() instead of udelay()
>=20
> v1->v2:
> - Dropped unused macros
> - Added missing LPCLK flag to rzvv2h info
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 344 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
>  2 files changed, 378 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 133a8f306d47..a957b6c5f28d 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
>  #include <linux/clk.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -32,6 +33,9 @@
>  #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
>  #define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
>=20
> +#define RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA	(80 * MEGA)
> +#define RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA	(1500 * MEGA)
> +
>  struct rzg2l_mipi_dsi;
>=20
>  struct rzg2l_mipi_dsi_hw_info {
> @@ -42,6 +46,7 @@ struct rzg2l_mipi_dsi_hw_info {
>  			      u64 *hsfreq_millihz);
>  	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>  					    unsigned long mode_freq);
> +	const struct rzv2h_pll_div_limits *cpg_dsi_limits;
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
>  	unsigned long max_dclk;
> @@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u8 features;
>  };
>=20
> +struct rzv2h_dsi_mode_calc {
> +	unsigned long mode_freq;
> +	u64 mode_freq_hz;
> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
> @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
>  	unsigned int num_data_lanes;
>  	unsigned int lanes;
>  	unsigned long mode_flags;
> +
> +	struct rzv2h_dsi_mode_calc mode_calc;
> +	struct rzv2h_plldsi_parameters dsi_parameters; };
> +
> +static const struct rzv2h_pll_div_limits rzv2h_plldsi_div_limits =3D {
> +	.fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA },
> +	.m =3D { .min =3D 64, .max =3D 1023 },
> +	.p =3D { .min =3D 1, .max =3D 4 },
> +	.s =3D { .min =3D 0, .max =3D 5 },
> +	.k =3D { .min =3D -32768, .max =3D 32767 },
> +	.csdiv =3D { .min =3D 1, .max =3D 1 },
>  };
>=20
>  static inline struct rzg2l_mipi_dsi *
> @@ -186,6 +208,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mi=
pi_dsi_global_timings[] =3D {
>  	},
>  };
>=20
> +struct rzv2h_mipi_dsi_timings {
> +	const u8 *hsfreq;
> +	u8 len;
> +	u8 start_index;
> +};
> +
> +enum {
> +	TCLKPRPRCTL,
> +	TCLKZEROCTL,
> +	TCLKPOSTCTL,
> +	TCLKTRAILCTL,
> +	THSPRPRCTL,
> +	THSZEROCTL,
> +	THSTRAILCTL,
> +	TLPXCTL,
> +	THSEXITCTL,
> +};
> +
> +static const u8 tclkprprctl[] =3D {
> +	15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150, };
> +
> +static const u8 tclkzeroctl[] =3D {
> +	9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
> +	41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
> +	75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
> +	107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
> +	134, 137, 139, 141, 143, 146, 148, 150, };
> +
> +static const u8 tclkpostctl[] =3D {
> +	8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150, };
> +
> +static const u8 tclktrailctl[] =3D {
> +	14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150, };
> +
> +static const u8 thsprprctl[] =3D {
> +	11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150, };
> +
> +static const u8 thszeroctl[] =3D {
> +	18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
> +	95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150, };
> +
> +static const u8 thstrailctl[] =3D {
> +	10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150, };
> +
> +static const u8 tlpxctl[] =3D {
> +	13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146,	150,
> +};
> +
> +static const u8 thsexitctl[] =3D {
> +	15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
> +	95, 103, 111, 119, 127, 135, 143, 150, };
> +
> +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[] =
=3D {
> +	[TCLKPRPRCTL] =3D {
> +		.hsfreq =3D tclkprprctl,
> +		.len =3D ARRAY_SIZE(tclkprprctl),
> +		.start_index =3D 0,
> +	},
> +	[TCLKZEROCTL] =3D {
> +		.hsfreq =3D tclkzeroctl,
> +		.len =3D ARRAY_SIZE(tclkzeroctl),
> +		.start_index =3D 2,
> +	},
> +	[TCLKPOSTCTL] =3D {
> +		.hsfreq =3D tclkpostctl,
> +		.len =3D ARRAY_SIZE(tclkpostctl),
> +		.start_index =3D 6,
> +	},
> +	[TCLKTRAILCTL] =3D {
> +		.hsfreq =3D tclktrailctl,
> +		.len =3D ARRAY_SIZE(tclktrailctl),
> +		.start_index =3D 1,
> +	},
> +	[THSPRPRCTL] =3D {
> +		.hsfreq =3D thsprprctl,
> +		.len =3D ARRAY_SIZE(thsprprctl),
> +		.start_index =3D 0,
> +	},
> +	[THSZEROCTL] =3D {
> +		.hsfreq =3D thszeroctl,
> +		.len =3D ARRAY_SIZE(thszeroctl),
> +		.start_index =3D 0,
> +	},
> +	[THSTRAILCTL] =3D {
> +		.hsfreq =3D thstrailctl,
> +		.len =3D ARRAY_SIZE(thstrailctl),
> +		.start_index =3D 3,
> +	},
> +	[TLPXCTL] =3D {
> +		.hsfreq =3D tlpxctl,
> +		.len =3D ARRAY_SIZE(tlpxctl),
> +		.start_index =3D 0,
> +	},
> +	[THSEXITCTL] =3D {
> +		.hsfreq =3D thsexitctl,
> +		.len =3D ARRAY_SIZE(thsexitctl),
> +		.start_index =3D 1,
> +	},
> +};
> +
> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq) {
> +	const unsigned long hsfreq[] =3D {

Please don't populate the read-only const array offsets on the stack
but instead make it static, see [1] and [2]

[1]
https://lkml.iu.edu/2201.1/00608.html
[2]
https://patchwork.ozlabs.org/project/intel-wired-lan/patch/20250317144606.4=
78431-1-colin.i.king@gmail.com/

> +		1953125UL,
> +		3906250UL,
> +		7812500UL,
> +		15625000UL,
> +	};
> +	const u16 ulpsexit[] =3D {49, 98, 195, 391};

Same here.

Cheers,
Biju


