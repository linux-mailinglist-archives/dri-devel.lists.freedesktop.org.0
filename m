Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C702C94121
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 16:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00FC410E107;
	Sat, 29 Nov 2025 15:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jpGdLqNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010039.outbound.protection.outlook.com [52.101.229.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FBC10E205
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 15:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1vqmZObHX7jWoLSGXwh9az2CpuwoHXnT6QPmc26ioDW5MYMedaKt5dQ8v1Ry2xPhEeJIkCvSpIbNfN0jvGYOvzC0xcOVfKxo+Oq9uY5HKIf8SfauWUnOMfuH5a+3ATmK+HVgApT7vwIHbd1T006504/26jip5oTeBXf0fzdOwMdgurnVU3naejeyJk00ybodLfR5wkHGIZdVoWvPkwSaHiuEhnnHo8uqOVVD84VWTRLNWcbT6waMMmwkoqHmCXjHAwbNWQHmha5oBVYsfFgplkZTIYvJ3cw+tWHm7U5FELfItS1U8ENCRzbyFcffaPO53yokLff7hB12rCaZYrJdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtKPJJOsWX/AtHspjsUzFIjqoguKrdJ6KfkGk+RveAk=;
 b=uUEIVj0J6mNRzbgkds4fRAi6J05xCTJ2GMzXAvCh2byaOrl6apbcLDKhdR7i875hVRnuY/V1aQFcmykg/95lK4PcIyAoUW6qhXRst25WjHejJfV0UNtoRZIyfmrOtGn3oqnsZXmP/wIuVLbUSWOggp8PN3l89WsFn3YzvdLRz4WMIMIxvN6g9Xf6+V+aQ3Ps/yPh0syeIyqcKHoM7xOKfXvHu1XWZj+21AHwH22m7/Wj06qxMFpdp66y0t86k/hHm6wTUbDKDXrAorB+BrOOV80zLtw1UijIfIZt/qgN85ZpVpzDvRmWaZjrHnubFE0SESKutUkWxcyREFWl1dCk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtKPJJOsWX/AtHspjsUzFIjqoguKrdJ6KfkGk+RveAk=;
 b=jpGdLqNMP+1FH2KXTJT+VPRTkgc1kBruMe5fDsriR5Nj2mervBKroGONBgAs1Z0bElePIfCX9P4Wyn4DylZcztRqwg0dFXkoL8Jg/dx6DSyUxdc+KOxv5SuwPZZBfofz1t2aH0uoMIzSCrp/gTk4ztOA6XM0fyydcrwPlfijZiY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB16077.jpnprd01.prod.outlook.com (2603:1096:405:2aa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.8; Sat, 29 Nov
 2025 15:33:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Sat, 29 Nov 2025
 15:33:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Tommaso Merciai
 <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, magnus.damm
 <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 00/22] Add support for DU and DSI on the Renesas RZ/G3E SoC
Thread-Topic: [PATCH 00/22] Add support for DU and DSI on the Renesas RZ/G3E
 SoC
Thread-Index: AQHcXt4eikn0bUpkt0CMNQU6Kum+G7UJzN7A
Date: Sat, 29 Nov 2025 15:33:50 +0000
Message-ID: <TY3PR01MB11346657D8C1D15DB548FDBC886DDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB16077:EE_
x-ms-office365-filtering-correlation-id: b07b419f-c22d-488f-3ed9-08de2f5cb1ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?yW4Tt9rmCzWOQbsCc5VA/x746nMZcngVT4VH//azZR/ExEefbkq7sXslbJtS?=
 =?us-ascii?Q?szb5isXWjsagZ/6lv9r+lTuas+6TPf2qVHcoltW/E1cHpWWBlXEz91mqPh6e?=
 =?us-ascii?Q?kDxu7ygB6pbc5enCD85HuhAxYb9OXEvLSXO0xlBAglhPhdK74J3F86WQAU/p?=
 =?us-ascii?Q?Y+TbqbIZoEzOavisQAXqp7Q3YOvbyApVQqpgKqRS0G1TyM4UGVG6ApjAJ7xt?=
 =?us-ascii?Q?O2DfQQOP8Oa4BE5RfbBzhAezku9EHIIKbQthAgCZaPr2tJ84toRjWV3quRz9?=
 =?us-ascii?Q?Sei5p6/wycs026Ttjk2hVvEuENXl10lG6DdHxoVM9v9JFGvenp62KTvQkoa5?=
 =?us-ascii?Q?b5g1OCrOPFbrt/ET6Qgviv+rLicngQb5nETsRXOcpxy/PnpIjD37fme31xdf?=
 =?us-ascii?Q?T86j7Qz1SiwGjcfpKHyVVFKFFWzSORginBLrmjOESeHBXoVexpSQ92Hl6bzw?=
 =?us-ascii?Q?IT9o/Rj8RChMYTOd5ixbLn+gM4jZhwRirgPVHF+JGoIMtcHqR3j+6UNVnbmJ?=
 =?us-ascii?Q?plL3qDuxJyp+FeX8wP6Vk2K2YY0B47ouTzA6mHeIBcRuX9YximpebF4KamrD?=
 =?us-ascii?Q?qpKxQzbrVtf8qFwPGcUSKqNtw3JTf7oXaL7ztvFs2kkrSdh8L7X++bddebkI?=
 =?us-ascii?Q?8AvdbKKZ1mu6ZuqTwgj0/aD4nJk7y8jVuqI46RTiaVyhlsDlFYnRqLDkuLZJ?=
 =?us-ascii?Q?6fLD7BRyIQjR1RafuMOdZLEMGg5y5aK7FDhLzYO3qkvhssSyDZy/gKRb34gW?=
 =?us-ascii?Q?wSUqzQqxskWgtue5oJjtp0VJ589JzOiXfnEN8EATiRix2h4VmKmqAGk/CluI?=
 =?us-ascii?Q?kZzjkSFpriNJ5m++2vTZU9vfke+Lybg2k14qFZUHT34rIV34p5OgvnMrnVA9?=
 =?us-ascii?Q?YP05WVRGnB9TGVC+pb1dFCEeb5FihvzH7CoMiKHaGCOM0PNnVmOrhDMK1sii?=
 =?us-ascii?Q?Ny/pUjRYZQMd5ogXLDDLFCtzi8cUXABB2QxKZg+FRY9T0T+fCP2pRKz6kdC/?=
 =?us-ascii?Q?D5UrAXbsPo/kU1TNEB5kDHDz/dQEMONIYbiWmr6g6Fy6Ljqo4vCK3hm50hv2?=
 =?us-ascii?Q?9qVlJlmktSn2etIgS2CD/CxTVj/et2d9XyRxFpO29R2NvdvGiqJzPZBhc9ev?=
 =?us-ascii?Q?gbBsQsYYUoIPa7/GeiAoXGg9xWh5xHVmzcRcR7lV3aEvunSe4VgJB7upLD87?=
 =?us-ascii?Q?rwYCQ7G5pgYaqcKx6x8oS6k2vXCTedH1XiJ0GKg5O8226HujEbmJmKgF4pNl?=
 =?us-ascii?Q?eM9Hx53/V8j51RQXs081jYPtCTXxmhRxrPZC4+4EyKQu9eqEfLf3nHIn/vaC?=
 =?us-ascii?Q?nDxg8sJ+3UFXaGQb8DcmLeM+dBvIA1kjWEQPc4xP+OTBqDzS5MC5oTulmwMw?=
 =?us-ascii?Q?YhFaEt6LBm+qncsop8IXyscie6u+U7LRFy+l3C32HGPJZ7dzFjY1dCIqm9hc?=
 =?us-ascii?Q?M1HBEJKyjC8ljjFjCnaIgKtu5xdyvbQKpjMF1iq/fNrjHfc5l4lcUDoMXwHX?=
 =?us-ascii?Q?D7wXVpFQDcrB87EFldIDDQUh9DiEY3H4FX2a?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DHwxhcC6qqsLAVyjUxpmNstvVPUfUDI/noThcLbuA8PtTyczUI7hNPTDuU59?=
 =?us-ascii?Q?ANRHh0Mj0yUUTZyJi1Cmt84X7+hZSZC9x3QYkxst06z9NXiZYUi/Okgv7xZ4?=
 =?us-ascii?Q?z94tj1UMCCr3VSkB3ulcsYbv3i0rI73GoX7fqmb0fhfY2NUcFZEwDzlaa63G?=
 =?us-ascii?Q?IYYjSy+1xk6l8rrpkOc4QBVgSF8gJuPhDEpZEuRclgBIA3hs9Qs+M3ZGHxTt?=
 =?us-ascii?Q?kTifrr9h71ID0wOnYP/hjfQcSUJ2+2XB1aoBAVFI75TC1PRWHhB0yHO/Wz8J?=
 =?us-ascii?Q?ysXelf1ndhxQwlJWCz7APKY6x/mebTE3X6CO5PJhckgHEub20GjQJTvNSDJm?=
 =?us-ascii?Q?mn2Bjr01bDnWwtLEvKV8SWHxZsNwCCZPX2qVYjk93jC2bWLl7VYGmjDzODII?=
 =?us-ascii?Q?B/lr5j+1qJqIGE9EO6URtk6+RNO7GtagU8Q7O9H5QMBR1n8JWgEFnF64WicO?=
 =?us-ascii?Q?B5bLnROpvP1yuFRY3RifEECci75yDv+pBvnsTPl1sxfC1cgC1IRdQZSpPILS?=
 =?us-ascii?Q?+A12tboQr0XyxBAVMNJJ/UdOW8m9SjcgfvxDY/HiqF36t+EZS/zbO2CQgrSO?=
 =?us-ascii?Q?WC0r+5UDxbumQVZkqSvuzw4p6bQlzundEH5W0znN5UeKBqMv16N5LrL1DYF0?=
 =?us-ascii?Q?0HWXYSnBkWufbaFvLzF9H7zbNd8Qe68HkxwQ1P20eCs0p7v1G8OmCkR1gAN9?=
 =?us-ascii?Q?IvvD6Wo9Oy2+ql+SHhziQipZKnG/wNG5pjJ3yScXu27IQ4ddYB+rxHQ/foK8?=
 =?us-ascii?Q?YD+uG5fmEIsQcc3//IkZdcMkp7tEaBMLqLn3xO9qIO70NBIqJp5HhGv0atXC?=
 =?us-ascii?Q?gF0M5zHpXJdRdi+ghu9RlEDlIteoowafqKp2ENvLH/dG/YzdhjpneAkr/zFL?=
 =?us-ascii?Q?RQZe1UQF4EFC7YaC9vroGLpinGz+fvU/fA2nDOmKf8Q7TIpwZEg8cT+K9Fa/?=
 =?us-ascii?Q?hxbZXChewXT6PR28YzjQV8yKMbxZyzkf7HwNeOi6eSKebR/kQTvsoSKod4yi?=
 =?us-ascii?Q?K1HKqkpeTinZLxh5Xei2KzehmsxJ5tFUzzddvsmwNz3lsR0siPiN6C5NPHy0?=
 =?us-ascii?Q?2FEYQLQrlAsVVkQpSenGgokXCzcU5j0ACYxU/l7EX7n5gnWVjGRg1dou9vys?=
 =?us-ascii?Q?0Y0aqCL0D3k6apQ+x+R9jux/cppMA6cQgtevm7SA/pXmBHDB0heeb1gAU+WC?=
 =?us-ascii?Q?UyotMxSm94HJiI9BNAEvufddiJgUMEFHT3pDlklbz2LchBqAfs6Zf4vevzpo?=
 =?us-ascii?Q?vx7NR+P+k3Ai5f9TjzlS/XcaUP72pscJULyQplGEIVkIXtRe8db/0jtdFblq?=
 =?us-ascii?Q?NOOxzmEGemR3L4E2Py6HXMmkqa8yovEBCxdwqatVAkciTtuh+xcvuFAVbkVE?=
 =?us-ascii?Q?OvF8dVI14zBeMpLzGQgJtDyzCNvAKX1k3DCZNdHZ5asGBjC/z9DRBYnFsI5y?=
 =?us-ascii?Q?69AoFcvKywiIgVZwwSORuMtdnwaK/dU4kguvNrB++eqSlQJi7yuoCWFOVf0/?=
 =?us-ascii?Q?PcwT+u/9sdexArpnFtZqMC53RBpHeiAUspl7yjPSYtuNW4fInyG5YME3g3NM?=
 =?us-ascii?Q?n7tRgecALUILexlqi09gJ4bMuDAm9bgxU4QcU3zsAl8gNnHeaggr2ZhvAG5L?=
 =?us-ascii?Q?cg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07b419f-c22d-488f-3ed9-08de2f5cb1ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 15:33:50.1744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aShu4i5PP3Ayz2cO7hTIxtd27NkGVOwoV2BGaXAHdGsFG/d5xF+ScQ99n8E9ga49xlfEeajoHLcEPbMz0LSPNp/0853BASGiKa9GO2d0x20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16077
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

Hi Tommaso Merciai,

Thanks for the patch.

> -----Original Message-----
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Sent: 26 November 2025 14:07
> Subject: [PATCH 00/22] Add support for DU and DSI on the Renesas RZ/G3E S=
oC
>=20
> Hi All,
>=20
> This patch series adds support for the 2 Display Units (DUs) and MIPI DSI=
 interface found on the
> Renesas RZ/G3E SoC.
>=20
> RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed of F=
rame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
>=20
> LCDC0 is connected to LVDS (single or dual channel) and DSI.
> LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).
>=20
> This apply on top of [1].

FYI, for the same monitor, it is rejecting 7 modes compared to RZ/V2L.
Looks like we need to improve the algorithm for PLL DSI clocks.

Cheers,
Biju

>=20
> Thanks & Regards,
> Tommaso
>=20
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D1012044
>=20
> Tommaso Merciai (22):
>   clk: renesas: rzv2h: Add PLLDSI clk mux support
>   clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
>   clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
>   clk: renesas: r9a09g047: Add support for DSI clocks and resets
>   clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
>   dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
>   dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
>   drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>   drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
>   drm: renesas: rz-du: Add RZ/G3E support
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
>   media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add fcpvd0 node
>   arm64: dts: renesas: r9a09g047: Add vspd0 node
>   arm64: dts: renesas: r9a09g047: Add fcpvd1 node
>   arm64: dts: renesas: r9a09g047: Add vspd1 node
>   arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support
>=20
>  .../bindings/display/bridge/renesas,dsi.yaml  | 120 ++++++++++--
>  .../bindings/display/renesas,rzg2l-du.yaml    |  42 +++++
>  .../bindings/media/renesas,fcp.yaml           |   2 +
>  .../bindings/media/renesas,vsp1.yaml          |   1 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 173 ++++++++++++++++++
>  .../r9a09g047e57-smarc-du1-adv7535.dtsi       | 124 +++++++++++++
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   |   1 +
>  drivers/clk/renesas/r9a09g047-cpg.c           |  84 +++++++++
>  drivers/clk/renesas/rzv2h-cpg.c               | 131 +++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  51 ++++++  drivers/gpu/=
drm/renesas/rz-
> du/rzg2l_du_drv.c  |  42 +++++  drivers/gpu/drm/renesas/rz-du/rzg2l_du_dr=
v.h  |  11 ++
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 109 ++++++++++-
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
>  include/linux/clk/renesas.h                   |  20 ++
>  16 files changed, 898 insertions(+), 28 deletions(-)  create mode 100644
> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-du1-adv7535.dtsi
>=20
> --
> 2.43.0

