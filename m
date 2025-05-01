Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799B7AA5D04
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 12:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2F410E34B;
	Thu,  1 May 2025 10:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aOryf0Qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C2B10E346
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 10:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVv1LrQE3vBz5r9NiVntEWdB9/hUSvmZKtr8eCGxH5g7y+Ah+oSqLwWlHKIP4bhKrCXBTvRgLp3oSMpBAxgO98IUVpjNRdnyS99fSdhhYATl71KEim5PLZecH86e9W/LhRYtIy1Ye0tE9CdUG6QMbMm2rzJctj4dyNr334ze2cNNvChKNciH3uRafD74J4UKm3chHm1wb9pezzcFWVFMgb2l462H1XgUMxTqV6yDE37g3LQQ5BDcxVH5cr2c9kv8fIr45AmltaV7KgbymRzU9JPscBx5l85E20SJ3sdeT1c6qfCRateUJC/qqgFUzsQ2cQO5bP2sK5qHeZsCckrDyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiMs+lg+nwTl5ntXlqEszCoTcxEdlquqxyHCAB3fANg=;
 b=j+R6UbqrzgvPOZoBHidVSQYXCQ4abXXxB50IbClJuJvA4ny/tEJ8SkvnIlBu2ZACxMipISHtxO4RkKpmNoUNRG08WkXXOZuNkuYjPRQNiO0JeDVAt5itzJPSS+b5O+GJTFG3K3KrDUU7Ny7tHuEBQgf3xR1iH9oCvCt9Sv6BQr956HVay8/AcTdcFCAwyYcBpcYS1dYmA07IS9dmiqCt6gjK+EzuM+SxP682z5ZQ0zvjyIsAUaLEGSWKm0M+eU+SNFutFr3CxAYGESQ9YOTEB7XMi2jQT+zAjaeXdWpux+9iEtfEEdgbvUVlPoUOeQLdAzDiCtPVz4d4VjB3+hNi4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiMs+lg+nwTl5ntXlqEszCoTcxEdlquqxyHCAB3fANg=;
 b=aOryf0QyXkoi+FXV4gqKbbmnrEcxZjfc2k7U8UPDr3mJVHWvBNvw9scQi1HxvNXXXsnvoMkOLDY5ciCdbYqaES0KZxwOuhftaJcqHl0LokhpHKwZJpTZOOeVplFKU183pHOkVoUOhCJlXFFStgxD2sPYyLbgQQPJfdu3/tcttck=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYXPR01MB15342.jpnprd01.prod.outlook.com (2603:1096:405:278::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 10:05:25 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 10:05:25 +0000
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
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v4 03/15] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
Thread-Topic: [PATCH v4 03/15] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
Thread-Index: AQHbuhA+UXHXX77ocE+XkQ0oeQwPirO9jK1g
Date: Thu, 1 May 2025 10:05:25 +0000
Message-ID: <TYCPR01MB113326E14B63E021249C2BB4286822@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYXPR01MB15342:EE_
x-ms-office365-filtering-correlation-id: cf2c89f3-4945-4531-1796-08dd8897b199
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q5UUMyWCJwCMy5YgGd+V9Bcnt2Co6c/GnNuwaLX2lJg5+lzFhEZ/RZJkhKfB?=
 =?us-ascii?Q?eUreMOjFml9PViITvZUP1XDt71N/pARqdp1jYQGipbqWvMtOekmdfoFFQA8h?=
 =?us-ascii?Q?XJHrthPhmcPCMu0iyz/4+burQGIHiEUy4tXvsXmA9MPndVBg+GpWDJ1HcTdL?=
 =?us-ascii?Q?W102dKDIgzWChsO8O9gF5REycyZDWoi7wfznNKjkQqHMBPRxduU/s7P+YDU7?=
 =?us-ascii?Q?bfqWEINIt06iMg4FwCizyMX9FsQpSFPMQFbiYKoRgJekZUnGiL5v+2nT0/cd?=
 =?us-ascii?Q?YpbicPld0ydCtalFm4dml4OMPwnFuvblbEC3FVtIPqUzQMd1szDafpA9cIfP?=
 =?us-ascii?Q?KunVK+FQ+HdysGw81ge0I6QrXe5JWwbLapoAtpXwaeZzJeYs9FACdPBmdB5t?=
 =?us-ascii?Q?Zwy/H1QeTD94gF+5Vm2NErDqEpArDy5e9F18e/peESz19phXq+WjF2MVKqhG?=
 =?us-ascii?Q?sBT1KH/XCS4l3obWkUwmBzgOFvm7WOWajUyvkGqwB6oCDm6GjM/cbhM4/+OP?=
 =?us-ascii?Q?4ni9OzNTx5PZ1cPgjImnFq9rVGm3aBsfQgQ33F05OOgrytp304qanwnjBGJG?=
 =?us-ascii?Q?UF6GmITJbPbpar/R4aC9yadaS1H3Oi1GPqDexDMy7QYgRHIHx/BfP0AurXAj?=
 =?us-ascii?Q?s3W1rBVVAEOH2QAgyn/+p0Dy8TZxuL3OGQ0fX8LB3OZIrd7USWIUB3N2jcdM?=
 =?us-ascii?Q?aX7mGneMMBxtQ6DEV0nqCjsLbbwRk8f31Jh9OPUuPyVArkp+Q8g8ofdOGKB8?=
 =?us-ascii?Q?cLqxcwzpY5qkBr4xhVJ8ze7hz/Jc3CUNU8u/WSoESKDoi8qrf/FEd7wgx4tf?=
 =?us-ascii?Q?Y6gUOBcYFr/6BKeo3YXafJcxGZwK1qdth3rMMB+iTaJKjP628iygS8l4X3bj?=
 =?us-ascii?Q?YtVBF9evEdlWQVBJyBQIGc9oF55wy878YEWb78rscmZm8rTbwjotB7tKJmnP?=
 =?us-ascii?Q?YympiAZaR9yqO88VjhrPsaz21kb+L90F+OO6014C4Kbm10e68MZZ29wHk4TU?=
 =?us-ascii?Q?EdYB1kdhurodaEO7LuXx9xXvQqeLM0S/qWLYxe87U3Gf/nHDrODlnIA4BWEg?=
 =?us-ascii?Q?V8OCbrl5FriDmbswmY2xm7y6JCU8TS41tHxmBLE3a/6249Fams7NUeSLUYFZ?=
 =?us-ascii?Q?18WTlnmyE3bj4mQY+HPHOLVoAvDixtL6FE8Q4g07pClI5YlULoL/0cO4TyGz?=
 =?us-ascii?Q?qIn/Db0zzQUI8fqly+shiUaatQ+8L8FpZ+oRlBxkSsm3OBovCaGlwkkx1gSR?=
 =?us-ascii?Q?nbRZ6uqwIGQ3XTVzToNrHK6ZmyAWN+LRwgoMHcrANCcNnjZH0kZr3nB555OW?=
 =?us-ascii?Q?kB0nEpVLRWobJGJPLjCDnHJ79WVrHr82iq/GEz2Kp/gTeR66Z+WobNUQrNBJ?=
 =?us-ascii?Q?MikkdsJxe3D3hbANLTK1udHJIPiGmC/a0hNcboYGx6++k69OrzjpFu6g2PNy?=
 =?us-ascii?Q?iFsBxiGPJ31o9RnjDqWF1ZvktyYqTwW/cvUiJ5RgGaKE9iMHgkZz9xbusHJ/?=
 =?us-ascii?Q?M8r6kP5YWkS9Qac=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?34Bn1tNIBf3X9KIMYU7qAgRWF27TocpSYdKoGK4xS9GPqTrxJUbLC+2SXJAf?=
 =?us-ascii?Q?TvjHXy5S0V5RZTc3q+6+uDGRDfJS0u3Br/qrELKhxNOOddUwLXlGm09o8y7I?=
 =?us-ascii?Q?8Ll1DMM83rCPjzLxujIkvpfEZEPEQLngX7W9BqlnwH0vwrw3a85I3S9MhsoL?=
 =?us-ascii?Q?RRB2FhrqkiEVTnucKnpTMjheLR0RLxZ2e5eC0cBzaQtq/Nd06y9Usfol4DRK?=
 =?us-ascii?Q?YDChR7Fq1fi/i0jwUXwMK2O/LaWLzRNOH9/o7v6wgtnKtnW0omUYHNt5oqyl?=
 =?us-ascii?Q?03v7BcmnemgNeSHPzdtICH4n7jMpRPmj8Moc2a0dvconly7JcaNAJw9VYg5l?=
 =?us-ascii?Q?xqLSqqhIG4eMbqi+bNyJeYC1+ckWeLYn2HBNvrh4zP/FEDyEQ44FedPL2DRB?=
 =?us-ascii?Q?QpHGSHiAehP/SKzGsEOtiK58DFeVFdo6AYzr/3M3HCCXT7JWxy3X3eOZBtQ5?=
 =?us-ascii?Q?V2D2GWbb5HDvARPGxHqOA3L0kuQQwtR0btzuaTVrFe0DVsHfLiw/v8LZNgCk?=
 =?us-ascii?Q?VAAAiYGqHuRmAFHb2/kNkV8bzk/trhtLYEiqAduugYOIx2Sro5yFsuFTn1Yn?=
 =?us-ascii?Q?bcwAz4NNB5FYpScZhEKdD1HqhUfrQApBSQjbGnWvgEWkkxeS2tlcTQLD7G75?=
 =?us-ascii?Q?HKNEumBWXXf4k2KcVjIutKzdgZptNnMjp4whFzaOr9YFdivMTypPYH5juFvs?=
 =?us-ascii?Q?Ief07AgVMu9dZzVb4DdUknBhwkfgHpLI+CJfhk9reg391hkqQkeBy6OIQz7e?=
 =?us-ascii?Q?GdevCDYIgoHyMBI1qrFQzEyyklS2FGmy4PIC2cwoy0PcrKrIXouqCkuZbGzb?=
 =?us-ascii?Q?cMvwD2y0XG4LzmWrjtsH3YW0WmufWchcVBTmlchv36H3W+JklCGqAi8Sih/O?=
 =?us-ascii?Q?HGdOZjl8dLoKSBfT380XoJ1id2U+/D4KDbJLNIw9tlW2oKHR7Y0du0+NeZoq?=
 =?us-ascii?Q?/+8TUpIMqzR8AGwckqxAl5QHa5e0DHqzy0KMeEAY9INguYJ2Vfvx2ZZReWuz?=
 =?us-ascii?Q?jbAXP/mvWevPDpxpjxz8rq+ja8txAwBtSlfXzYiOCE5vCJLLIfjGSfoDkn3o?=
 =?us-ascii?Q?0FWtx6B3C5/vL/qsYEO8t55oS7zTq/gxng5GTvISZzdyyXI4ncJyLRK7Ect2?=
 =?us-ascii?Q?K5KmNQ37OsIjqN+y10v19PoVy/iDk4Cn9ER0fxg+Cugl84mi62SinyMC85bS?=
 =?us-ascii?Q?5PU3Ratol2Ie+owAVaMgtLghXds/0MH2y1RvylnkM1pHWsIgh6or2jIiGZY0?=
 =?us-ascii?Q?XnD9SGnrwnaY0h3eWUOWd6ES9RCZMlJ5xSQthsG3XFGb9IVg2d07GLJYrj0M?=
 =?us-ascii?Q?992cH5OfKh8xp8hp/Up3HCTsCAQ30qClR68FsUiUE/t6+nwQFRc9wE4JnYt+?=
 =?us-ascii?Q?e2Y/C6Gs7LiTTp7blNWQRushOP5+x+1FEkbfkQZHmE94pvhVsaFhmNVOWF1J?=
 =?us-ascii?Q?rWfqSLkBmo/M4hp4WnB3nQefYBTTb7GIo7ERep3is2hPZrLrPz1yWHtWZO7g?=
 =?us-ascii?Q?kFfCcfKgL+MKd9iQKTNQmiJYksmIeoonMjltWG7rt8Gq9yjqPWApYW3WVyDw?=
 =?us-ascii?Q?PvDYt0rE/xwk4BFa5eeMXBThYAQ//6VS69w+N9QZIzb23hw5CyKTGqNeWBCM?=
 =?us-ascii?Q?TQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2c89f3-4945-4531-1796-08dd8897b199
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 10:05:25.7159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jPT5UdIcDtrPvKX4JdeSdQVFtaAOLmgzdcUKG/VigJFl7yvLr5VdwS9K5DIDzcAbht8tFRzxfhQTQvcFPYvpB23xCG+TrwW6fu6Z6dzVflk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15342
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
> Subject: [PATCH v4 03/15] dt-bindings: display: renesas,rzg2l-du: Add sup=
port for RZ/V2H(P) SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The DU block on the RZ/V2H(P) SoC is identical to the one found on the RZ=
/G2L SoC. However, it only
> supports the DSI interface, whereas the RZ/G2L supports both DSI and DPI =
interfaces.
>=20
> Due to this difference, a SoC-specific compatible string 'renesas,r9a09g0=
57-du' is added for the
> RZ/V2H(P) SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Change log is missing here.
Otherwise LGTM.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>


Cheers,
Biju


>  .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y=
aml
> b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 95e3d5e74b87..1e32d14b6edb 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
>                - renesas,r9a07g054-du    # RZ/V2L
> @@ -101,7 +102,12 @@ allOf:
>=20
>            required:
>              - port@0
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-du
> +    then:
>        properties:
>          ports:
>            properties:
> @@ -113,6 +119,21 @@ allOf:
>            required:
>              - port@0
>              - port@1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1: false
> +
> +          required:
> +            - port@0
>=20
>  examples:
>    # RZ/G2L DU
> --
> 2.49.0

