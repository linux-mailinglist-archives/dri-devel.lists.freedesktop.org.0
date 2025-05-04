Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0AAA866C
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 14:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD6710E26A;
	Sun,  4 May 2025 12:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YbgQfDzS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010067.outbound.protection.outlook.com [52.101.228.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893610E26A
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 12:52:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyU1RRGNc1/ZA+kM0f/+/J0vP9OLqrXpEFBLFJI8lS9iUnMAcpECpqtxSgCXK4s2mvgESEtOS61O5JYONK0wWEMSER29Sbyr3BzkCkDMyfvuJw9Zc6hWGAhogimwiZ8R+g1epKPNQngV4rXuch2azdU1GIgCAnvJVLF/BR1fP9JN0QvuDvJAA8G1VOv8fcAqw6TC0Nvt9+4x1nqfievw79D0j0fUAB9bE86/mOy+wm8P5rU84otbgU9fVAeD9GkCjKZLQpcgLdw97km8Y/Nk2ysHicOQYY0+qNMlr5+ojgPfVteq9UvaulN8XPX327Nwvyd4V7ml1BnBFtQprsqFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpk5X+kPWnRr2wfEXfPaGm8pHpaWSe6gIF5wMk1NeSg=;
 b=lp7xCFSmk3/MwEMZYA1fwVcJUHnu+O2wDdke6tA0wpUHseQeOPFynm7COikvwO4eiw/TrIy4OUO7KVNk1lvdTvJwX4o3ZFE1tRlRPGUdlvWAtos5Pzsqejcg/hij+MyMXJ1xZut/az4U3kXrvqPveSwsN8jRE8V6TKtp8ZIxsHJyuYAmFo37YUvXUGTJJVzxBr2DRS3SRKAMC1QeBXwLLN9JxyYxKIgj7fvxwhcHgVITN2BHX2FXU3GQWVOOAfUwy3a50mwonzrLUA8n5cG02gYVqLEDC/Uhn76ELNSjySaStQAesD5Zoq+0Yj1ptn9DYdLEh/Gij7bYfJ6IqUj5PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lpk5X+kPWnRr2wfEXfPaGm8pHpaWSe6gIF5wMk1NeSg=;
 b=YbgQfDzSPtQMJWYLK67ZxOwR36h1lP7lznKeXjA3G2Z0ZkBFyhAcCS5kBmkc91DASAjLH5oerjLG/Sza9j/w9LF7H2mvmPZC594eU8z09Ls0jDJYALrx7RETZVdOOselzXsVUISKNhpFxC9xQ4GOn7qC4d8peuD1TXj3F0YSN4o=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7108.jpnprd01.prod.outlook.com (2603:1096:400:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 12:52:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 12:52:34 +0000
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
Subject: RE: [PATCH v4 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag
 for 16BPP support
Thread-Topic: [PATCH v4 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag
 for 16BPP support
Thread-Index: AQHbuhBDeNezpQgD1ES8oQ1ZjkdJcLPCcoDQ
Date: Sun, 4 May 2025 12:52:34 +0000
Message-ID: <TY3PR01MB113463B8B958391E736F65289868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7108:EE_
x-ms-office365-filtering-correlation-id: 5efadc9e-fea1-4e27-55d6-08dd8b0a8a43
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aimlSfoLVDgXAxr2gz0IMCel2DU/srEDfItP7mdKzo+6Nb8vXTsFYK2GoTW0?=
 =?us-ascii?Q?YGPev3brb+ZDPtfYnXRRw92uPWQgvqPqrZqPa3jfXjfX+6jkpInam/E1uWHT?=
 =?us-ascii?Q?iSXy8nFwdRnYrC+Ho2OjbNb9vrhiqpqIWYaS5BHBXh6yfWlIhLH0kz22zlGW?=
 =?us-ascii?Q?yiWPXu6W9TNUZf3sB1F7c4Gi1kHyFybl2NnU2ZJQo2J3RhcH2edarBn8klHv?=
 =?us-ascii?Q?CvpvgQCxFwpZ28VDlKVnpPe+e82PaGzTCRO4sotQ8gBNWbUGbsxcv3QKvFMv?=
 =?us-ascii?Q?bszzJeC/f7g+tT6W5Hu0sKLHxoArJJSrcyqOJLqtdZpAt1ECluGZKwOoNVH1?=
 =?us-ascii?Q?5PdeHLI+ii4pCDImihf9GG4vYeRW+RKVMcsmWy86QpsT4Opf9MAWjIB1sTHZ?=
 =?us-ascii?Q?x7Pl+JBhrLm62hYRpzKjRm20bFMHGDIjc+jF16b0Kd+uQaCm+mj6TEICFGE/?=
 =?us-ascii?Q?rg2NHCyYaryz5oMhMW7iR1m+rL814iFb1jYfX2L6fnmhcfqpp/gg3PQ5VH3Y?=
 =?us-ascii?Q?yUuJXYmumv4dMmLWwU/5w0Osx7ck0zE3EELnVCU9wDqk1bRfdJ5TXBGoIhaK?=
 =?us-ascii?Q?JWoX1cjD2WbHRA84ci3f9V3+WEcbxRV5U0GedpAyQ0LmR5ddNYPiG34tF0U6?=
 =?us-ascii?Q?yDg2HtipU8R/y20t9HLtzTWsiABgDzPZ4iOSoNZvuIeUQmRUsWhoVR4esrPZ?=
 =?us-ascii?Q?0vi02hT6tBMNdSepCXOGrdDgfk46zsK2CiWu2CWvNOV3day2JrtB45p9LB7h?=
 =?us-ascii?Q?SE5eUG181+P2SBNS1ddn0WfLDBZ8b92yFbM8oF3mJhKOSTfeoxqhH964nWJL?=
 =?us-ascii?Q?Fo/2Cj+2ZnUN/AE52uDoczdizMilNOQm6a3YBMt+2nTpaJttulR0WH5IQRX3?=
 =?us-ascii?Q?bg/uQQtjnX7Dg5ieAfsUyDtZo9BVIMNkzn9Q+LeD/e4+N1BE9DVZknWVBZLU?=
 =?us-ascii?Q?Z5rctwYM63xEi/tsYmZZhhgQyo6GjpkocZW90VoFFtCiv+qz1e2OWLs6bvG3?=
 =?us-ascii?Q?158FIGcK43t7dhoeIyqDOGN3yRsIEq4NcUhLCTv7f2HhzjCKEYAAkTh3fXMj?=
 =?us-ascii?Q?tXt52z3ThfQnb8jIch+RJPr6yxYkEu2crLNadbFlfLag3NKTZN3k4FbYGA3b?=
 =?us-ascii?Q?I0yYsgNXGUS7i0xzmjN0wOs4wJyu4jKZuyjcMeCjCm6Gl8wh8bjahwG6LxFz?=
 =?us-ascii?Q?8Xnt2JHePy9QeBG34r1edTITPztR93vkusF44QpXQ43Zr1YM8xw5Y/pvdPr2?=
 =?us-ascii?Q?1nC3MWZhW+D1oF8r5SSgZznU4+Hk078jkhCxs2QLIBDIr7B562RJWsrqVXNh?=
 =?us-ascii?Q?Z724bwpMUSUrEUCSsH5w5B16dd/o4htj3FeaYR9EEaM4zoMsq/eG5C/1egaA?=
 =?us-ascii?Q?US2BwuZPoA+lo+xr8NkEWXyAivwj3K7IttESKX18/s/X+8jMu76ihushR8zJ?=
 =?us-ascii?Q?2RYdWBVokHt8dCbaPSzJRSKqTAyIXeINMExkPsYLYAeGvZmCUWEy1KDW8oz3?=
 =?us-ascii?Q?fgrOuil5ZuId/TQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eFXIYCm32sDB0j7J2nN6DZ1r7UAzuDJR9pgP4e4fBL3tIiPXwJaIBVFHRZUh?=
 =?us-ascii?Q?YYzJszDwkAf6xDaZ10+/YKmGWrVTrdDYEfGkQd5YVtarvj5izDp3utpJpSNS?=
 =?us-ascii?Q?nFPiA9WtfBHM9eWXJ/P2Sz71IcxMsLzWu6JnMu69ZKueFsoN3Nf3UyMwrnq3?=
 =?us-ascii?Q?9V6/InIx3I9XYhi/NBZ/dBAlP3mgjAFoSNixjNjqGLMb2aiUEaxZDBm2BLFZ?=
 =?us-ascii?Q?iIJlIvqhC0BVgrWjycF58Cxx218BHhnky3epXDEzKkGG0rZIaNjcY6ZgAOX4?=
 =?us-ascii?Q?VF+sQrM2exzntbCYhDv2laiQGpa2xINNHvdR6kE6PaNU8Ai3mIMsxuR5cHiW?=
 =?us-ascii?Q?a6VxYWO03HqrB9SfGUONt43nrAgPOpqy1zLHytnh+ANZs3op4sVjxNcmoiTU?=
 =?us-ascii?Q?bAhxyikhHHNF7dlhW+LQfLh0pouEVN6Ofv8I1yxlqKPyC5etLYqYa8E4PUOT?=
 =?us-ascii?Q?1HzFtR6xXhF++8lyVERGpkSfibbzAY1ScL/YWsA+5KFL0YSVZuVLmnGECBy1?=
 =?us-ascii?Q?0CIucIFTQG23vAgzIn5PtHngqg4POGILgd7OqB+WEvKPcwzWPsi7D/7Ej8RY?=
 =?us-ascii?Q?IyDfgZFtB7WN2xasJZWFYWDF9PiFcQcGcxiPodX43GG/KDC4kBAJMHbVAaG+?=
 =?us-ascii?Q?Za5mcZwsYDmyZJ1zzmGPqJA4uZNptXpki4NkOKNCX/k1b/MlahjEYXwHdBO4?=
 =?us-ascii?Q?0FUQ8J3GjWGWoxDDXD5eavy9AuEnIiq3iBmTW1TmcvMCcxpfdbRPHSuWf+GN?=
 =?us-ascii?Q?EJhQrDFyN05ZdmLf02/vw1kYpHzVz9sdnFdNIvIzfnhA9rQwGk8hDMJzM7nt?=
 =?us-ascii?Q?qts/puuVdsSba64YwDaOfgOo2hwuFMqAmQ6m4MMq7daHKLK7JkJpGXo/KkQy?=
 =?us-ascii?Q?Mou28SrRetNpHw+ChX60A2uE+J8rXnVLAtTSEyumepm+P2EZ82mPZT++cOcH?=
 =?us-ascii?Q?WUmfOOjW8Nxz+X50oXDPq2mbwCjP1pzcH2z5KHfE0g1nxlzr8L1duUaL95Rr?=
 =?us-ascii?Q?9zvmzCg1iyta0POh6kN0QhsCfEat47+oOvHg8ONk6b2KiE9Xdo8ACMFfFwgO?=
 =?us-ascii?Q?pLEDbXQ3DVYyPS62aH5qSom0OIDV21tfmYcFPoLHavujImB4HANp4AiPNB3t?=
 =?us-ascii?Q?/9og9jBC8TpQAhKZokusZEwbilCt2ermNJKewSEzZmQNcQwCHpapVMTuSXlZ?=
 =?us-ascii?Q?8C1/GJr2O3c/YGCn9w6fRXTmXgstXcwwlFB6TQd5n5snNoYdZIWoPEhyeGr8?=
 =?us-ascii?Q?kPLapSV9uByEKnut5vzZ5AoqGzLkPT11cPTlh07j7b/q2OU5hd/ES680fnJU?=
 =?us-ascii?Q?5uWrTBVmqZhV/i7+FFlyBBmf0tZcu6K0dj84i4Cy1rEgEi6NOI52s1bymkaP?=
 =?us-ascii?Q?eQsZ08mqXmjBf9keM7MKOpUcEkAkrvfY5MXj7J6Idqd5RSoHHcAVdpdpssQz?=
 =?us-ascii?Q?pvxe7wyLwBeiUWDHN52owRJMcOI00IDX+9b15CNBPxT+GtxZOWIfpE1f5yLS?=
 =?us-ascii?Q?7iheGZWAiuRkY+Y2ifHCroQndEa3BCc/d3oKEQENDJp0n8fqZ56M9VlWtaGM?=
 =?us-ascii?Q?8xnp5zdjo4tjQMM0DGgH289RpdLq5Q5c5u3+PSCf3mhS4I8Ydt0F7XKXcj3x?=
 =?us-ascii?Q?yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efadc9e-fea1-4e27-55d6-08dd8b0a8a43
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 12:52:34.1631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cN8RUk1zBVcl/g64MsIxCWZIThG7MPCifOD78SNZPRFth+iWw4w4JL5HSwSSGK6HwAEZS7YqM/7qaG2L7/jOCJj4ICrNlO8unnl9MN7lMyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7108
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
> Subject: [PATCH v4 11/15] drm: renesas: rz-du: mipi_dsi: Add feature flag=
 for 16BPP support
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce the `RZ_MIPI_DSI_FEATURE_16BPP` flag in `rzg2l_mipi_dsi_hw_info=
` to indicate support for
> 16BPP pixel formats. The RZ/V2H(P) SoC supports 16BPP, whereas this featu=
re is missing on the RZ/G2L
> SoC.
>=20
> Update the `mipi_dsi_host_attach()` function to check this flag before al=
lowing 16BPP formats. If the
> SoC does not support 16BPP, return an error to prevent incorrect format s=
election.
>=20
> This change enables finer-grained format support control for different So=
C variants.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> v3->v4:
> - No changes
>=20
> v2->v3:
> - No changes
>=20
> v1->v2:
> - Renamed RZ_MIPI_DSI_FEATURE_16BPP
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index a4c0dbae4a46..8c7384b95411 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -29,6 +29,7 @@
>  #include "rzg2l_mipi_dsi_regs.h"
>=20
>  #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
> +#define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
>=20
>  struct rzg2l_mipi_dsi;
>=20
> @@ -643,8 +644,16 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_ds=
i_host *host,
>=20
>  	switch (mipi_dsi_pixel_format_to_bpp(device->format)) {
>  	case 24:
> +		break;
>  	case 18:
>  		break;
> +	case 16:
> +		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
> +			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
> +				device->format);
> +			return -EINVAL;
> +		}
> +		break;
>  	default:
>  		dev_err(dsi->dev, "Unsupported format 0x%04x\n", device->format);
>  		return -EINVAL;
> --
> 2.49.0

