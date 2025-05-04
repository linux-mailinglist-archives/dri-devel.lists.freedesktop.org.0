Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D402FAA8660
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 14:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1DE10E22B;
	Sun,  4 May 2025 12:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rlP+5V+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011027.outbound.protection.outlook.com [52.101.125.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B992610E22B
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 12:41:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG1ctBy8mbSPeoB684pheHXFQ1RMUsLDAspjA7TN8swGzE1sijunpo+xmuWLImbJ20r07Da93mVLqwho0MDV33JMNG1e00+lJop4GW2Xc8xlBm1rwUhWZFNonWYtr3u4ntr5ereFwcVc1KubKJLgkc0Eo9ccv28OBdgrIrbuqkhfTQyihY7hwkyJwGnLxqb/1///TdcduPrx9mpoaSs5Z1Evw6HZ0WkqCvkX0xlVx7oMZlDYDMyeURmWLvxgEqgTQfKmgYuxSzGDGMGgsRI7Imm3fT6Jyon5WNVOBQV/Gu0wtSg2bHBKQKd2ypzoAIRJUisa8uUmfNrElwi0epbB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5LSRrYuB/1W8sGO2LyGMn4xGq3IEVF76lCGixTBpaM=;
 b=uD4DZMHu+0RC3bR3KShHPVUqplM6BU7WVqeM8hdC80e8czJnt0SvUkiHhoOXaw8F1hEz/mZddgVPdRwgzGqBC8+Q9dx9Ao7R04Eixt0lWzHprjJwDS1p/wkfHkFD7Jh/V/DI3KOmrFBAfflCOc+YNcytIWhQDlYpXwsDPZ3eiMuS6cGGYhZjJenKgz+w8aULxlvGw7aieQ4NyO2CIHZrh7lbBy/rw4PTq17oxPxgaApDttZ0q1h1GCBK1JBYP/5bL305zztkmSjg62FxY8faPp8uYulO+XbiJ4XbMwLyx0EoBEIKmY/rqOP3hiUf6I4fYDiTly0OfhfKgP2gPNHIGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5LSRrYuB/1W8sGO2LyGMn4xGq3IEVF76lCGixTBpaM=;
 b=rlP+5V+RriyaNW4iem5fl+xz1FDzz/Lx9qMaFgcHqrm162/2ia3JtJ0bXNdr48arxWVWrFimsd8WozQOdnU3I74Ht2NqDolcx7db/uZerSvyrKhZSwxpLcIipO65+ZkH+dLSc4dszWOHvVvnQrvAshAicVg811SN8XjLTn3xbPE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6154.jpnprd01.prod.outlook.com (2603:1096:402:35::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 12:41:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 12:41:47 +0000
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
Subject: RE: [PATCH v4 09/15] drm: renesas: rz-du: mipi_dsi: Add OF data
 support
Thread-Topic: [PATCH v4 09/15] drm: renesas: rz-du: mipi_dsi: Add OF data
 support
Thread-Index: AQHbuhBC3CWiXofRVUqXnfV4iWMUkLPCbYSA
Date: Sun, 4 May 2025 12:41:47 +0000
Message-ID: <TY3PR01MB113468F023BBECAB10C41DF50868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6154:EE_
x-ms-office365-filtering-correlation-id: 267dbcd4-115a-44dc-e315-08dd8b0908b3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BDsgpgrQq7HPaGr/aGgUgRwmVBA+IBaBJqoQc2Ltx8jFPEVEpkr9qcwoseKs?=
 =?us-ascii?Q?imBezGAl6zZTt3WxEzHPY77g/hV4DaR7lqf5VV+oCo2XPHdPW7Grg6TBK56e?=
 =?us-ascii?Q?0H4p/CmHPP0O/ZlcoClx1TnFes8xDac2m7RvClXoC4orWP3wWRsknBVPcEvQ?=
 =?us-ascii?Q?+ZyAloImKzEftT9es7jiPJbx//neQATHBXw0VkGz+VBnn9YCPdbeAzOgeN0k?=
 =?us-ascii?Q?WxzDT1/hfbR2wglB+A5YjHIwrSDWrSLVa8XN52VomLgKjIXvCciwYZgj1cuS?=
 =?us-ascii?Q?69STYY/QQKXacky6IjpNTnrosOqZdNtvw8IY2cJwRFuK1d9NcZeXdjSMN0g0?=
 =?us-ascii?Q?eueOmCdHlKD/hbGGfKB/L+8AU5c4IQx8pqTdKp5UTg5pJgskRieWlZkgS1XD?=
 =?us-ascii?Q?hE37NwmnqMQ+re8hZb1lvnxAb5IU6Xs7EeU5P6lnEmwejDlnQ+qZYwJqCUdA?=
 =?us-ascii?Q?BSfrVjGJcTlxDTalciwtqTS3KEfHn9e6F+Bm7SW+AIHIKCfS4zSvbnhD6jsH?=
 =?us-ascii?Q?bvdJOei3qLjKZEQzy4KfW4cSRCZVkwYjq824yVyZlslLBvD32+X0CA/9cmrM?=
 =?us-ascii?Q?i4QLIztayWntqM8TK0IcjuPVnu3hnFW+MwPM3lWeJ+2xEtoo/nB2FdQmnSwU?=
 =?us-ascii?Q?sOVRFjCnNEAPvxUPmp+5khS8Eh3sNiOcvDQhsSGPMJes9Ed02ItB0NGNEJ26?=
 =?us-ascii?Q?SHeTMjp7TdRpZpudflnqO2DYvrcpWM/SLrnji21yXIZfi0cESe7zKXI24OU8?=
 =?us-ascii?Q?U5UAxqkeyankqu+l/T3k8Lxp81lPaR3dTY+o/52+//EHxEfUQRl0No8QxG7E?=
 =?us-ascii?Q?qOiWAyn6wYW1Zp65VUoROS15519FLIlF0y0YKH2EvfnNEqrifcLoilL8oobr?=
 =?us-ascii?Q?ukFiuDrUIXZLM87LcGTGNOuYYc+GnPVJlL1MPKzAm24FNBjYaQty46F87LE6?=
 =?us-ascii?Q?vU7SoMwWJljND7R/Rbsa9ijw9TDxFu4ZLusF/cPtJ9G9A0u20/uqEbjP28lA?=
 =?us-ascii?Q?LWsaM3AsSg+Wx5jBLxZXh4Ev/IoJsPDGQteiJixxSQMsf5HT7GFBzs/O0o9O?=
 =?us-ascii?Q?LyqBFSKVYdtVcYwdaiUADVvcjB22FkY3G/iRa1RjUcJ9OL3bvdnwwZIO6Gd0?=
 =?us-ascii?Q?Cbb/cSM+yRDe5OzzmFkYn53+NQFllu/2LAdTmYdYp4T7mMbDoo+TsTkKqNlP?=
 =?us-ascii?Q?C6aOcSLTB/M8e0+X5slXSMkqZ3BF5ZiLVE9SWrEKIHR7pgdrK+NHNjSL4fLO?=
 =?us-ascii?Q?V/JRWQflak2RTQrUqCz86jyYWALPjsu2u7ZkdZ/9p/53aG7cfQDylaP+UhYJ?=
 =?us-ascii?Q?mGo4HreyrrEHcZumtYFSqmAr7d0DtMemdJouh85hhX4UQTHU9UWP/eI2omhh?=
 =?us-ascii?Q?ADCb7n1oFCZHr5HBL08FdPW3C/GM6LxHA+gHUFIC4CJ0ss89WkWqO5mTEx6+?=
 =?us-ascii?Q?+NWeltAHo4IcqnaUygH/VItoav2VW+itYq1ZbF6OUMraZCQqAT4/x4/tFVtL?=
 =?us-ascii?Q?A2cpSRHo+AqZpAk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qul1CkbPTKaFfVPO2Mf3wEWWqJwA5gWHDoSjm47Hn5PelShG5+KsA6l60NwK?=
 =?us-ascii?Q?gMzgYGp0NIV9jYvMo2x9J7LArh90jnOY/Z3pAfom2CxBsNnlckSkxVNvW0JH?=
 =?us-ascii?Q?Z+yA19zpg3OwO+/lihwKd2NhGk7bZ8rPMOXwuPzmv0HVcEJCTWJHlw0x4yGk?=
 =?us-ascii?Q?A2HS6fxf4kFQaGjveNHPoMqgGpNK2xf6AekU18XDWmT31STltE7q6SdJrRE7?=
 =?us-ascii?Q?Eh+eAS1pGg7z3QAVoZqO1oxmubSdLpYNYK+sJTjXqruUVWBRQ5yeafUNeUC4?=
 =?us-ascii?Q?8YIWnlkHvA4oxFE2t+8eJWPCm2aWCdE312D3zb/tjTQbtoaBj6TZ1jdvIPhA?=
 =?us-ascii?Q?aFtzsCiY0eIGzevxD1uUTxErIPgHMrZawE4vufrccMyNZt1SMHCkYH6bL44H?=
 =?us-ascii?Q?oW0cjZrP8RenfFeK0fGQk3yv0QTfPXlq2KNrIPgQoOlaT5lJ5AOOHEe8Tqsn?=
 =?us-ascii?Q?moAB6hsWKptU8EESnMqgKAf4VtcVnFImgmAwRXUuU4IjarMtnZadTMyy9iwb?=
 =?us-ascii?Q?VSwylBG99VOo/W4h32dMFn8TyT+wC+NNxFRc3CwN0Fnfzih+DXbafz5N4U4H?=
 =?us-ascii?Q?lRsGn3POstw1xDgpPHsEgriVqzjg4zwfWuIZjzEiQ8ZQkPomQXwQ7m7QM80K?=
 =?us-ascii?Q?SuBIFJJGAAMke+bxVlhmZPOMLKnTgGZ65c4dngMxdtjIxs2DKHkd8jrcbCrM?=
 =?us-ascii?Q?T+bwBrlaNRtt1/D4/kew5GU8rFC04wu6Jwc7QGUgPw/1BidLUmRv3JCwtH5u?=
 =?us-ascii?Q?++CUp71Bx1YNc4zfb8c/9gEcr+2bGER/RBUxj8rNVbUhDvF26qOJrQ8N6/Ba?=
 =?us-ascii?Q?IwPAGjJbN7QtURCuZcGebHF70QOh6rRgSZDcj3qNs7eeBNHF63h8mxjDR0GY?=
 =?us-ascii?Q?NpyV8dRCGRQ/8kCRc5cxxNz6xNefnKVLejM8l7usiHAafLfV37g3XNaT1aVp?=
 =?us-ascii?Q?QhIfoSy4FdS/qUBaxbri6PKy9KwuIm7pMS+UBNXHW0W/e+Fwf90AaW1vq55P?=
 =?us-ascii?Q?41KOHaAqe3vLAawQadR0hWwA5Ou9YCMx3OK5mpaW405bdRG6hgpHciCjNgnq?=
 =?us-ascii?Q?yY/P/nh0/lR2evRf5nySrsJtfhcqUMy4fYp9g/++fLKBvbmmeGcGvHWGm12l?=
 =?us-ascii?Q?kHl6e2hGz0mnfk00toQ6l8H6wVXjY/apv0J/90QndtFnFPFPpnPCK5TgcMeT?=
 =?us-ascii?Q?nJ5vbVaoonoGOb7ysq7hVty6s9XbvuRBIkB4W12tNq/snn8URpPT0lrwuZEY?=
 =?us-ascii?Q?T8I5zgIO3eTb5WdQBCSuAgwwluQ1QxFkok+Z9Oo2WYQMJXBGVNAuoYozGQs8?=
 =?us-ascii?Q?xySXmQWYcuX7XOI0hLcX6NJaUJoBpnsMvZXv7WoMkWskhUlTrzKJN2wff6nk?=
 =?us-ascii?Q?ONZMZtD3zkjsCIZXCxj66uMnuj3JSQ/t7YEA+ZxdI2N0vrjLmhuVRWDu/TYj?=
 =?us-ascii?Q?OUbEMYe9TiaWqkkkQB8pgn6iTYQvwLRh0Jg9ZCcXrFccn2wKmgn5SzGB0XC1?=
 =?us-ascii?Q?doNNnNE/Zb/kmutS4lp7hLBw4K3knh3Z/AVCG3EnctrY0mbeY3Q2MmrImXdc?=
 =?us-ascii?Q?nkfCBHgrg7JJhDN4b26oxr0ZvPlJcihGhlvmWyYjae2W/Au0bh7DToxczHUx?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267dbcd4-115a-44dc-e315-08dd8b0908b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 12:41:47.3252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ldrsc1I1nv4cmQZOX36OQnG3xZl+7OlT9AGShKcjcGlvrMLduFj4O5JW9f5Ckb5ybjy76+ZG7u01JJP8WqbjmfuDj1gLRje7PSCXAE3J5vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6154
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
> Sent: 30 April 2025 21:41
> Subject: [PATCH v4 09/15] drm: renesas: rz-du: mipi_dsi: Add OF data supp=
ort
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> In preparation for adding support for the Renesas RZ/V2H(P) SoC, this pat=
ch introduces a mechanism to
> pass SoC-specific information via OF data in the DSI driver. This enables=
 the driver to adapt
> dynamically to various SoC-specific requirements without hardcoding confi=
gurations.
>=20
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the on=
e on the RZ/G2L SoC. While
> the LINK registers are shared between the two SoCs, the D-PHY registers d=
iffer. Also the VCLK range
> differs on both these SoCs. To accommodate these differences `struct rzg2=
l_mipi_dsi_hw_info` is
> introduced and as now passed as OF data.
>=20
> These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support b=
y allowing SoC-specific data
> to be passed through OF.
>=20
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - No changes
>=20
> v2->v3:
> - Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not needed.
>=20
> v1->v2:
> - Added DPHY_RST as feature flag
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 ++++++++++++++-----
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
>  2 files changed, 48 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 911c955a3a76..ed259627f5e8 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -28,10 +28,26 @@
>=20
>  #include "rzg2l_mipi_dsi_regs.h"
>=20
> +#define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
> +
> +struct rzg2l_mipi_dsi;
> +
> +struct rzg2l_mipi_dsi_hw_info {
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> +	u32 phy_reg_offset;
> +	u32 link_reg_offset;
> +	unsigned long max_dclk;
> +	unsigned long min_dclk;
> +	u8 features;
> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
>=20
> +	const struct rzg2l_mipi_dsi_hw_info *info;
> +
>  	struct reset_control *rstc;
>  	struct reset_control *arstc;
>  	struct reset_control *prstc;
> @@ -164,22 +180,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mi=
pi_dsi_global_timings[] =3D {
>=20
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg=
, u32 data)  {
> -	iowrite32(data, dsi->mmio + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>=20
>  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 re=
g, u32 data)  {
> -	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>=20
>  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg) =
 {
> -	return ioread32(dsi->mmio + reg);
> +	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>=20
>  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)=
  {
> -	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> +	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>=20
>  /* ---------------------------------------------------------------------=
--------
> @@ -291,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	vclk_rate =3D clk_get_rate(dsi->vclk);
>  	hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>=20
> -	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> +	ret =3D dsi->info->dphy_init(dsi, hsfreq);
>  	if (ret < 0)
>  		goto err_phy;
>=20
> @@ -334,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	return 0;
>=20
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>=20
>  	return ret;
> @@ -342,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>=20
>  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)  {
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  }
>=20
> @@ -584,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge =
*bridge,
>  				 const struct drm_display_info *info,
>  				 const struct drm_display_mode *mode)  {
> -	if (mode->clock > 148500)
> +	struct rzg2l_mipi_dsi *dsi =3D bridge_to_rzg2l_mipi_dsi(bridge);
> +
> +	if (mode->clock > dsi->info->max_dclk)
>  		return MODE_CLOCK_HIGH;
>=20
> -	if (mode->clock < 5803)
> +	if (mode->clock < dsi->info->min_dclk)
>  		return MODE_CLOCK_LOW;
>=20
>  	return MODE_OK;
> @@ -713,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>  	platform_set_drvdata(pdev, dsi);
>  	dsi->dev =3D &pdev->dev;
>=20
> +	dsi->info =3D of_device_get_match_data(&pdev->dev);
> +
>  	ret =3D drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
>  	if (ret < 0)
>  		return dev_err_probe(dsi->dev, ret,
> @@ -728,10 +748,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>=20
> -	dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> -	if (IS_ERR(dsi->rstc))
> -		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> -				     "failed to get rst\n");
> +	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
> +		dsi->rstc =3D devm_reset_control_get_exclusive(dsi->dev, "rst");
> +		if (IS_ERR(dsi->rstc))
> +			return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
> +					     "failed to get rst\n");
> +	}

Dt binding check already checks "rst" as required property the currently su=
pported
SoCs. So for RZ/V2H if it is optional maybe replace
devm_reset_control_get_exclusive()->devm_reset_control_get_optional_exclusi=
ve()
and get rid of this feature bit check? If I understand correctly, optional =
APIs
are introduced for this purpose.

Otherwise LGTM.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju



>=20
>  	dsi->arstc =3D devm_reset_control_get_exclusive(dsi->dev, "arst");
>  	if (IS_ERR(dsi->arstc))
> @@ -756,13 +778,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_dev=
ice *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret =3D rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> +	ret =3D dsi->info->dphy_init(dsi, 80000000);
>  	if (ret < 0)
>  		goto err_phy;
>=20
>  	txsetr =3D rzg2l_mipi_dsi_link_read(dsi, TXSETR);
>  	dsi->num_data_lanes =3D min(((txsetr >> 16) & 3) + 1, num_data_lanes);
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>=20
>  	/* Initialize the DRM bridge. */
> @@ -779,7 +801,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_devic=
e *pdev)
>  	return 0;
>=20
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  err_pm_disable:
>  	pm_runtime_disable(dsi->dev);
> @@ -794,8 +816,17 @@ static void rzg2l_mipi_dsi_remove(struct platform_de=
vice *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
> +	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
> +	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit,
> +	.link_reg_offset =3D 0x10000,
> +	.max_dclk =3D 148500,
> +	.min_dclk =3D 5803,
> +	.features =3D RZ_MIPI_DSI_FEATURE_DPHY_RST, };
> +
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> -	{ .compatible =3D "renesas,rzg2l-mipi-dsi" },
> +	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D
> +&rzg2l_mipi_dsi_info, },
>  	{ /* sentinel */ }
>  };
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index 1dbc16ec64a4..16efe4dc59f4 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -41,8 +41,6 @@
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>=20
>  /* --------------------------------------------------------*/
> -/* Link Registers */
> -#define LINK_REG_OFFSET			0x10000
>=20
>  /* Link Status Register */
>  #define LINKSR				0x10
> --
> 2.49.0

