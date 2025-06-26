Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39151AE95B5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 08:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEC710E071;
	Thu, 26 Jun 2025 06:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r72Spdsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE51410E071
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 06:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPQz4esn3iYYy0F0siomokCmlH8mIpEm4NCNkWOmdWTfoOCOmzTW/w2SO6vzTC/tcX4a3BozxnwpW7PkTQnPvDl38V+N5KNgVo8wtW5eftXwKyHF8H+T9+wZMRbWpDTKHBgjxgTAR9Thrz9UWB1ujlhyMO3yra5GuC379y4+bzMiLH8stRUVO5tOQrfaPI94DuT+dppWiWvqXJY1qt70xPZduaDbr/GiDTMb479a54lKrEk+yLDfb+T3SBAco8mTe9+IRvd5U/F2p69Yo3tLDamkWUsZEKYXQHjo3yT1b4FMY3Jp8Gs8js7Na5r2VNLgQmchJLcJajW4BjqxbVZPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEafgiyl2GgZrh2PV4sRBRInj23t2ADe0Hrl3qyAB4g=;
 b=pC9y+GVY6QSEV9Onsd8PGT0SpdacDO88vlMrOTFRYMbV+ZrNAAj7zvNqUXyxqsC1xto/BTe2KU7GxEI0jDRVTDAxGbXm5v/8ZnvuFigd/y42AfDtiLB3Ms7UHfls/Vs8kAra6fmRuV4EmqHJfDLuZ28xBe6o9DT0PvtPDSkHcsYQD5He4nwAe2kgH/145OA1i59gYnOVqcfU40HcM5fuqey2Np8ja5ZWAiJeK7bGs4ikU4K4oSnhB44hGBvL4EIRW45M4lZrIRr5MRiXWd0/O1xUY10DFTqRAplSHXlXHPd21/gnIOd0fkpggDCITgm5zWhwcqy3DZPhs7gP6Czijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEafgiyl2GgZrh2PV4sRBRInj23t2ADe0Hrl3qyAB4g=;
 b=r72SpdsxiBWBnXNFs2AXP/Lig+Rrl4iNYLYXwnaK+Cu0++Ignu35V9KrrCEVyXCikuNeLNGXRIYw1naRQTiL5LEqLEnONgSFOXBW8ImCsgfbE+RA97e3Bdi/P6PE4rkf6R2Ujhf+z60+gU/ira2JjFIICmRPFYDXbiMnlEyS378=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14639.jpnprd01.prod.outlook.com (2603:1096:405:236::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Thu, 26 Jun
 2025 06:10:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 06:10:13 +0000
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
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v6 3/4] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
Thread-Topic: [PATCH v6 3/4] dt-bindings: display: bridge: renesas,dsi: Add
 support for RZ/V2H(P) SoC
Thread-Index: AQHb0YbwzqUt/5SkrU22YEsdgOgdWrQVHfXw
Date: Thu, 26 Jun 2025 06:10:13 +0000
Message-ID: <TY3PR01MB11346D4F0B35092B85AA7B197867AA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530171841.423274-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14639:EE_
x-ms-office365-filtering-correlation-id: 53b09dd7-af9e-4ae0-6a06-08ddb4781d0b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Tl6J3dmRvOKKda77XYUWIv2Vtyi7sFF2c8Zehs9pEzACN1T4ba99sMQ/tOfi?=
 =?us-ascii?Q?1p/WaYDHChRp5XgfQEe6IcN17mBdAlBUZPtGfiyhvnIJ9jfgznmnG5VVoUNT?=
 =?us-ascii?Q?KQix/KxKJL1tf9wKl2wHHRBqdTXGrKGPN9Opuwt5kevG5/kAjrCk9kPkZHDl?=
 =?us-ascii?Q?1f0FPprrxO+MSfxEYDyUQ4T0Xz1/f7yrH+7/1pV+msTuL448T/zblrCWgUb4?=
 =?us-ascii?Q?oH0xr7jsjHB6YDTuAm/0Co/xFniymnCTEiXRK8UFqcaFuHBBKkDgS9IA6zWJ?=
 =?us-ascii?Q?RJlDm1eYZ8niodL1LFjJuc/e2XnIOi4lk3iNpYT0BhrguXZZZL0Fk+XYHgQy?=
 =?us-ascii?Q?H01P5s1MnUVecm1KnFOsLVxEAK7tQuZVwO9/ylmZOWEy7XgYYGgL3XZW5h4o?=
 =?us-ascii?Q?LGpyIi5dItjh3i0h4U1Ui1fZUEOt4C5iBmeRoghHuLmG4LYsSmkWHI1nCr5J?=
 =?us-ascii?Q?BtRGL6vz0BNNUat9IheazzM8RKLKbYvRsyg3MNTBpmZdtlXNoWbLpnWLGrXk?=
 =?us-ascii?Q?MxvdS9M1MEgnOtWZQQ9L/KeU8BlXLIiucVXgwL/hMl4M+QURnL3q41WWzjgk?=
 =?us-ascii?Q?g1Yn4msSki8MVqk209olDgD65UrWS6U3OOttiWe1fNLgllOZNcGi4mXeacBZ?=
 =?us-ascii?Q?EhZMyCuF+oKSgB+Ny0E3QnK5Lt6iHGPwiqtRYd/Hby7lYBK8YCuIg3qO5r4p?=
 =?us-ascii?Q?IqnnaQLEqIQJ9qwC7tQS6xvRKXb1tVxBVCx9xWBBDov6LnX3IULwehyv3qUd?=
 =?us-ascii?Q?qfo0A++YYNKTnOwpy2Mh89JcInT69cblHx4LA7VqkbR7Zg83n4CoUFZYlEgu?=
 =?us-ascii?Q?nPpSKF3vsLVR0vr2Le07G4Q0mqKZaZY1mA9L1rdNJg41hU+DyQ6Vjpn+ObOs?=
 =?us-ascii?Q?6Iwe8e1jhK6sga/wY2ME/C3OvabpTsyyLhsgHOnAFTmpGTVTzp/UjVH+91z9?=
 =?us-ascii?Q?xXHnJiQ39Njwbyqtjj2c9YjELAlGphy0ie6IvXEWDuP/PVJTDMbV929sLdeV?=
 =?us-ascii?Q?rNAV3Tdw6h3KPizMfd1PcQlnIT9OF31lvn8drzpjduYY4glLlX2L5wq+Hw/d?=
 =?us-ascii?Q?jqdT5bAVlRdBGYhlITFdS8PK7Fo/grUsurDudTV9CjW5eEBew2p2u9RqbtFz?=
 =?us-ascii?Q?ao2uhzpg+/IZK58WH7waaKaGrLVuinYrMKwPqY1kTdXOWz0TkNpYY3yDx9Nz?=
 =?us-ascii?Q?WsF4MYQLVPNzP0AJ8OKDwfl82tA9sEk84NuUztItJf6/zGPSjmeC1mvukTic?=
 =?us-ascii?Q?AVw54jOfYuXaB+dIChXq1nSU/q8dGj1SEdfUVXOvwdEbz4yqtBNCs78T4DkA?=
 =?us-ascii?Q?rjA3nfpTbij9mdh8ostap3sa6YOUXinRRcTnhWetn5zIoegsMa6LOq+2DQ6t?=
 =?us-ascii?Q?giqBMwADyCZOkC4aYN9tN+z+EQTJ1U7LY6GA3V2SPegKdN6wPs8QQOjJay0H?=
 =?us-ascii?Q?Rq0B+ECw6iJnhebhtBTC+NyKcf2wWT2uap1EEeNDo14kJsbeJL644sKCbugL?=
 =?us-ascii?Q?XrLvuOnP2GrEeyY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4OQ14uRmBpH3tD0t4WdD/WGb27lFyQe9sg2AStF2GKWUxUpmsYju+xum6CFS?=
 =?us-ascii?Q?Dwp+mE3FLNtb74gGE/cCJY8BTRpo8DD1y76cCzd7yYkoB2LBN4UQYDR0xGQ4?=
 =?us-ascii?Q?l13Raq2OiZPbUgq/WGlntZQMzYMQgUbPVC2Ge8aWolKPrAX8Lwb/ZTCtAFz0?=
 =?us-ascii?Q?malmBKdC8Gu82Ul7V6PpJYZ6502Pj8+vbsFbgzCZLMjqIFc/CyeBDmPQuYAX?=
 =?us-ascii?Q?MVq4emVJjFvfeUa7D1wfln0/glUM/JmnEr0qjKD2/LDsQXOG0104aVW4npgE?=
 =?us-ascii?Q?On6lt4lNTdWmZNas8S0Y3QW1qPS7iA9qwUrmyrAFMrzs2hjG+AE0A1miVFrl?=
 =?us-ascii?Q?7z9gGvl25qFHlGVrZ+uctMLhQTQY57uyGeCjh0TbziqLYfkWYI+C9hbaHXRQ?=
 =?us-ascii?Q?a6hf6uIHbbB5iN5LaTczLQEjehSkMJ9xeJ5gD6kRbOUIb9M39UHveXhuctqa?=
 =?us-ascii?Q?rZ+vTSOqID//WCTdQGl7XBkhmuL0BHkiBlodO+6T8PS7CoWFpM33uuIwZif6?=
 =?us-ascii?Q?1ksWUi8gQKPajFULIIXvAwYWynA0zxgWqJSekk0iuiova+gXP9eMZfYNuRev?=
 =?us-ascii?Q?77MxgPrNx4euC6w7bDh/5EW83IzOXo8zzk62wpXWaz0+1CqxP1YlQ5jD9GMZ?=
 =?us-ascii?Q?lVqYU9Es/kYHr5aL1ROPx/KqszyAFNYsJWEv9D09QQeaFvfrVhcU3Pwg9BPg?=
 =?us-ascii?Q?n/1h+UUQUiBIafSw10GhQP1yPgGDtDgiNDhl+A3FOCjB26DzazAid/hvu5Ip?=
 =?us-ascii?Q?kyOaMA5zAVWKjNXGOWSlO13JzmAUJMuIlwzugLEuLii6b39YSwLhdiHc6FCm?=
 =?us-ascii?Q?tthLRcafVp5jZuO2yNMKOqquIvdJN3i7aqgZd1vNPfvi1yn+0h1AUN9SU+r9?=
 =?us-ascii?Q?v+MEkSyPvXDlmjf0aRglh31LIBaM5u3d33lSRF1CgNGdgDai+GrjpG8efB89?=
 =?us-ascii?Q?6E8VPgrmjvZwTC7n+XqJ0vCew4rL5AGBgkfGLw6XvqSTTFLQ+u5UzIKA7ZK4?=
 =?us-ascii?Q?N3N4Ul7OCT4I7ZVWKglQfspvGzclC++eN6ZzGlzPzAvqnElmOXc1Mt3VhsyD?=
 =?us-ascii?Q?aEi7v7OeTn5rn4apGYPhq6wZVUPnAYAZS07hf709d5xfplg4HPK15/m7ugmI?=
 =?us-ascii?Q?OoNA6y925bCHaSqxDDrt38cWdER8vDs3sLzhJ2c9EgF7zxOfOvW8WNhrZZiT?=
 =?us-ascii?Q?vG5JFlpJDn8nx5V4dkl05bUCf86jCMD4hC3ID0n85uU/5A+Ow2WadlAzTsGH?=
 =?us-ascii?Q?WasPcfYp0/LjJQZgSsle95a0MOQa6ISBpedcTDclI9XsQZAWfOlrjkKqm6+2?=
 =?us-ascii?Q?cRyW2mNJeMu773Pzd6yjjlCPNjiN0FnCghBW1YnQQDY8i1YogXw2nWkTVagf?=
 =?us-ascii?Q?H0fM+jrMuGLtH/bupdUHESLRaWEpidySR2xw8nPCWZVjYtTCGGp7Z0QXKbgO?=
 =?us-ascii?Q?Fmgdnc3WDruiaa1wR38DBLehLX65AbO6PNB4LV+DpQdb+TBtsOXBCPf5qoj5?=
 =?us-ascii?Q?O2KRnkSAgsV+UQFM0+WdkF4VGmqMUxfkQPCjPeuZzzAv5OMpHGAzj+pwVc+Y?=
 =?us-ascii?Q?NsD9lVrl8E6KWjz1tR8tZNNrOIep7idvJmKyNOtVQ9DctatGr9GCPXZa0HBN?=
 =?us-ascii?Q?rQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b09dd7-af9e-4ae0-6a06-08ddb4781d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 06:10:13.2240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G34vK7k73pl1RSKUrYzBUM7GbvtiSNel6/Hubip1N2Sfymxag3Y+9mKXD+lbUzyMRaFbiD+6JLrwsh5ohrtKhJBf8NYT1/ghiW57es++Ass=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14639
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
> Sent: 30 May 2025 18:19
>
> Subject: [PATCH v6 3/4] dt-bindings: display: bridge: renesas,dsi: Add su=
pport for RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to that o=
f the RZ/G2L SoC. While the
> LINK registers are the same for both SoCs, the D-PHY registers differ. Ad=
ditionally, the number of
> resets for DSI on
> RZ/V2H(P) is two compared to three on the RZ/G2L.
>=20
> To accommodate these differences, a SoC-specific `renesas,r9a09g057-mipi-=
dsi` compatible string has
> been added for the
> RZ/V2H(P) SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5->v6:
> - Preserved the sort order (by part number).
> - Added reviewed tag from Geert.
>=20
> v4->v5:
> - No changes
>=20
> v3->v4:
> - No changes
>=20
> v2->v3:
> - Collected reviewed tag from Krzysztof
>=20
> v1->v2:
> - Kept the sort order for schema validation
> - Added  `port@1: false` for RZ/V2H(P) SoC
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 116 +++++++++++++-----
>  1 file changed, 87 insertions(+), 29 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi=
.yaml
> b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> index e08c24633926..8c7e2b17ba79 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -14,16 +14,17 @@ description: |
>    RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, wit=
h
>    up to four data lanes.
>=20
> -allOf:
> -  - $ref: /schemas/display/dsi-controller.yaml#
> -
>  properties:
>    compatible:
> -    items:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> +              - renesas,r9a07g054-mipi-dsi # RZ/V2L
> +          - const: renesas,rzg2l-mipi-dsi
> +
>        - enum:
> -          - renesas,r9a07g044-mipi-dsi # RZ/G2{L,LC}
> -          - renesas,r9a07g054-mipi-dsi # RZ/V2L
> -      - const: renesas,rzg2l-mipi-dsi
> +          - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
>=20
>    reg:
>      maxItems: 1
> @@ -49,34 +50,56 @@ properties:
>        - const: debug
>=20
>    clocks:
> -    items:
> -      - description: DSI D-PHY PLL multiplied clock
> -      - description: DSI D-PHY system clock
> -      - description: DSI AXI bus clock
> -      - description: DSI Register access clock
> -      - description: DSI Video clock
> -      - description: DSI D-PHY Escape mode transmit clock
> +    oneOf:
> +      - items:
> +          - description: DSI D-PHY PLL multiplied clock
> +          - description: DSI D-PHY system clock
> +          - description: DSI AXI bus clock
> +          - description: DSI Register access clock
> +          - description: DSI Video clock
> +          - description: DSI D-PHY Escape mode transmit clock
> +      - items:
> +          - description: DSI D-PHY PLL multiplied clock

This is PLL_Reference_CLK(24 MHz) compared to the DSI D-PHY PLL multiplied =
clock in RZ/G2L(~3000MHz).

> +          - description: DSI AXI bus clock
> +          - description: DSI Register access clock
> +          - description: DSI Video clock
> +          - description: DSI D-PHY Escape mode transmit clock
>=20
>    clock-names:
> -    items:
> -      - const: pllclk
> -      - const: sysclk
> -      - const: aclk
> -      - const: pclk
> -      - const: vclk
> -      - const: lpclk
> +    oneOf:
> +      - items:
> +          - const: pllclk
> +          - const: sysclk
> +          - const: aclk
> +          - const: pclk
> +          - const: vclk
> +          - const: lpclk
> +      - items:
> +          - const: pllclk

pll_ref_clk ??

Cheers,
Biju

> +          - const: aclk
> +          - const: pclk
> +          - const: vclk
> +          - const: lpclk
>=20
>    resets:
> -    items:
> -      - description: MIPI_DSI_CMN_RSTB
> -      - description: MIPI_DSI_ARESET_N
> -      - description: MIPI_DSI_PRESET_N
> +    oneOf:
> +      - items:
> +          - description: MIPI_DSI_CMN_RSTB
> +          - description: MIPI_DSI_ARESET_N
> +          - description: MIPI_DSI_PRESET_N
> +      - items:
> +          - description: MIPI_DSI_ARESET_N
> +          - description: MIPI_DSI_PRESET_N
>=20
>    reset-names:
> -    items:
> -      - const: rst
> -      - const: arst
> -      - const: prst
> +    oneOf:
> +      - items:
> +          - const: rst
> +          - const: arst
> +          - const: prst
> +      - items:
> +          - const: arst
> +          - const: prst
>=20
>    power-domains:
>      maxItems: 1
> @@ -130,6 +153,41 @@ required:
>=20
>  additionalProperties: false
>=20
> +allOf:
> +  - $ref: ../dsi-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-mipi-dsi
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +
> +        clock-names:
> +          maxItems: 5
> +
> +        resets:
> +          maxItems: 2
> +
> +        reset-names:
> +          maxItems: 2
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 6
> +
> +        clock-names:
> +          minItems: 6
> +
> +        resets:
> +          minItems: 3
> +
> +        reset-names:
> +          minItems: 3
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/r9a07g044-cpg.h>
> --
> 2.49.0

