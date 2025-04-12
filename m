Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F7A86BBC
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 10:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37ED10E192;
	Sat, 12 Apr 2025 08:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jcQlX9JO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5959C10E192
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Apr 2025 08:01:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2xDUoEahmXVc/YhwWetLD1ZbdZnF8dgNdd8wiZbRBxFCGq9O8w2ZD/IZqyDzivsCWUKdcMXFxglUr/YFkW3KaIPLtCTWgVelrWRRbF9WSKiYfWuvYN7dfA8SfVxw8aMEKXySOkZBgDtHouPxMOI6QYvN242/exaV2TnakoO32MtnFApfs/IQGZPrhRw6H9ekBJ6ySMTEvI7+htdw5o2ra+IRBWlUIK3spMyMBeHxrXdwLihhlr2UXY/wqiTR+69qC0lxDiriENvwVpQivFmxqJ0Bsm9OFnDZfmoKkUoxIA2b+prwDDR91cfH9lk6tRUIAzzlXt8G52CNSW4htHW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9R+XaHWVMS8i8zt2XOQk0Vy30EGqbqY0Rp4mOGqMiY=;
 b=Np9L0SVPKIfC9ZJbvqYdBz8Uh/IlPt6dsvts4+LFqy4uNOmu69gTOU+a+PO5bK/KtbzyoMVXtrj9PbZJJ9tlQSXRXYT7dCwK9rLYn6oCIltJs940nJ2OT1Bgb0m/bWpHWrozmfGXMSAAwak2u74zmZ4NZNd7uANNZhjMrsT/ASPrZE2KPTqU6/YPLbyVBcAErWQH/jvHklzdEfS2W3g03w93V/P5/iOCewdi2709y/iP005TrQGvkzWLym8hiohTL+a6aRjqRYP6Tx6rBeaVq0mrWWK8Zc9Pehh7h3D+7/UGWnWtoOAlj9vZjzkKHx/nW+zE2aymLiHw/4lEiw37Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9R+XaHWVMS8i8zt2XOQk0Vy30EGqbqY0Rp4mOGqMiY=;
 b=jcQlX9JOrFEMkDpCWScllC9/1fOZwv7jf4c/OiTxxy8xV4rN11n6nGP/iUTe+1MXNcbxEx42w9pbj2A0zmCnAfb/0PO8rqxecSr1ZplXtsulkU2XFMqQRpyqWTnuw6IeVI7ei3NRND6Cp5EN8xIC0fq0mrC1rURzFSOKhb6OTlc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB6090.jpnprd01.prod.outlook.com (2603:1096:402:33::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Sat, 12 Apr
 2025 08:00:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 08:00:52 +0000
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Topic: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
Thread-Index: AQHbqMIxyYzOKfcNyUaY3bfci5On4rOfon6Q
Date: Sat, 12 Apr 2025 08:00:52 +0000
Message-ID: <TY3PR01MB113462CC30072B670E23EC7F586B12@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB6090:EE_
x-ms-office365-filtering-correlation-id: 6dab06c9-4413-4e80-dca5-08dd7998251c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1dfGWBrdP+UY6LiRyoZFS3idCPY8p7FZtuXMimbqgcgX4yIh+TuXsET8XwYT?=
 =?us-ascii?Q?WGR0zRpX/NVgOoMpaCScdjkp84wal+r1bG6eGRwhOqUSsO9gA0Mhq5HZm8jZ?=
 =?us-ascii?Q?/sHCFGBCWAKW7PDkccfCUVnOJmzRgzkhYrIhZ11hf3FkLzryLzUqcbm2cxFw?=
 =?us-ascii?Q?6emk17xu52cnxZ48I149qSlZ127s40tz/k04RJrZla9DxKdsQ5U0DJh580AQ?=
 =?us-ascii?Q?FmOdGQdoTLqz2AzbR1SF9/woS8sIC7bECdZrc9fNIop6FYlaNnuaZZDTeZWv?=
 =?us-ascii?Q?DBiNM9sxKSxQb0Hgz63Xkc3Yj1vz/Py3hC2VjdMuFYr8+sVNdcrwT3lewrKv?=
 =?us-ascii?Q?zNAm4T0Gf48H4PD3zm4fsrlJLttMt/ybYabROjfTr6dly+bNzE5NrVxfYvwG?=
 =?us-ascii?Q?yvIb4gJU1rRbjWLKLusqS9uv/AFhg8KhlTO+c9o3B+vx2g3AxNxJYgp4iWNX?=
 =?us-ascii?Q?RAtFEmwBNq+fRe0Q6Iis4KEdT0AEyW8QiCBEOQqGjHjBQHvwB9uccNIjnL/6?=
 =?us-ascii?Q?MNTBko79QHrg902FXFZVuJGErp9Zur+YPmx+eYanVVtP6C+BmseXacYPQ+jo?=
 =?us-ascii?Q?y3ibPdg10415rDhTGaiW2M0ZtcvXrMOEAnbhn8RH6ofmBGnlL0KXO5gl1bLV?=
 =?us-ascii?Q?yhlnC04QCnHUK7CgMzuxvRrQ4K24IjOeBSOPYrcB2PO+h/QZ36QsCHGH/Fy9?=
 =?us-ascii?Q?7EM+kxR2cQw+UljW6DPA4/TU3JXbKKsP7rHSQB0l3lYNkvWs/hHmbthoi+1N?=
 =?us-ascii?Q?/dUifCtN/DRuX/ha222i0J9qQm5z20Y66jpsKkthLaLOcoF2vJj/M3Oetufq?=
 =?us-ascii?Q?q0zBfAiB8e7ojrbh3ivnEf+JJiM5rdFUK2vuvsN4UxgNaC1HTZMrCTN9fnzP?=
 =?us-ascii?Q?GWALAyWeRP1KH0vENFPocahE6E1YZxUA+GzesaMyWK/FYVfNPcD2FFy6WDFr?=
 =?us-ascii?Q?FO/d7mS9mNjE//Gi331EUZfGFK3L8CBcm+7MyAvDtMyT0tShVTwoQ40AI0uE?=
 =?us-ascii?Q?FIqt1DGFSFZi3EGyetbLC0WKccceb1CciyeAfw7k+zb/uHCMD2HONBFPL5VJ?=
 =?us-ascii?Q?3o1a2qCsXe/1Q5F+axPbJPss+9fno0Uo4EHmYAWq0z9huL9TJFGY6Y8V4C5s?=
 =?us-ascii?Q?Wzy2XxMVV4tRSyUs9RxXwWG7F0BBwRz17Q8UqNAocBG4MM6knPcd7Lnhg30R?=
 =?us-ascii?Q?uu9IlWIfdeaYuQB+RPcYG9JUY/Y563FynwCiUi4yfpXmV91i3EgXDhab9q4a?=
 =?us-ascii?Q?0hybuvjM+MUM9X2LKWkl4SyhVYr9K0rh+cOLYjb4nbzPVEWuipNcbexyIdhW?=
 =?us-ascii?Q?F6Ysrt+z86IPx7nKBs9FUGk4lrSJQ9M5L7ZObTxEyznbXYmt/F9zE9tsJKij?=
 =?us-ascii?Q?i26qyFc/n1CdBc0VR9/F/P1FYkCJh7c9UsUcY0IIuq5QAX+daMQcgY55kTN7?=
 =?us-ascii?Q?qM10iiKiSGpNAKwAh3ZrnEt7GqAhhVLZ2MbRMgZpE3T5sMFJihqNcf/6c8qV?=
 =?us-ascii?Q?Jf+3L8UPwmxoBtI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pmLGdgH8alQ5Vx7a2zo7Zxljsz9gWnPGieGx4eaOEjOQVbNkWhCW2h0zc0a3?=
 =?us-ascii?Q?cPyckSYzrbAKpvgQc+L3/gt6jFUxqv+zSGcZSHMz2x21Vu5Im6+BYym3KPUx?=
 =?us-ascii?Q?3S3RNfNb0MklI3O44XyB7ITRzaNkBYJvmEpAx67X3Yk1OgNTLQBP16Th9CFr?=
 =?us-ascii?Q?dNOwYfq7lRPEuJgKA90ncIvZkI3Bs3MycsXC7bU5plIulutupmrArZKdeQco?=
 =?us-ascii?Q?kxf2uoGBaYLRFpvxMmRbo740FdjJie0gR7Hks19wc8Ge3g86CutzRbGt1dBC?=
 =?us-ascii?Q?jo4ahZDYAlHFHjQGqT2C+IQWo2bYYbm/uuVFz3iR8MbVba3BgmNTl6bGecCN?=
 =?us-ascii?Q?izva7uHxyiGCyQihizVVPcjPYj+hhzZ6bvuAU+cnwLdT+U6ge+YvrgyJEUoy?=
 =?us-ascii?Q?8ncS9Q0fctCdXiGufctKwQu3rEbk53OMYPfrRTILou9gzvYHpPRUyzcJO3B/?=
 =?us-ascii?Q?fDKFhByIjgGUh2goNrc60RAysYnlbMY/zRMLbhiC7zaOjJtKmEr698TykXgM?=
 =?us-ascii?Q?hAJAQwBSy/xoZrAeB40AfEVeC2PIgm1yT96elpO16D2xABioHtclmBnldt70?=
 =?us-ascii?Q?YYgaP1rKgMOiE8jgvxdX72UfO2uHhdKDqIyqFi0K4bXaZMZUWLgTPOVH8Cmv?=
 =?us-ascii?Q?FswTl3Jfxdnn8U4SsdZJhL6tAys9hAEDk5c9NKQTy4do+FRhW5l/zL18dpqw?=
 =?us-ascii?Q?FPFfhzvTLfGFCjton4aKFhqRK2uPLd/eJOsLAGoPYhE/+hHP87TJnSih8+ml?=
 =?us-ascii?Q?eKQmnax63H2StoTJaONF5qBhrqhcat0voARsQxXRBkRJ2q8UWHW+3+mpTZSX?=
 =?us-ascii?Q?P6OFpBS4hkSz26leDlRDlD3Rpu8G6O1mjKUssrE2Uhr6b310u5W1eJRfXy1/?=
 =?us-ascii?Q?4InzZhiOnQ6MTUi+s/g/GlQ5tx9+btyC6NXhCkBANgDOEPn+drXg7E5slxTc?=
 =?us-ascii?Q?axhVuZESQwYklzZAo5VSkUlx8UDxnOH/jlP4D/8kRFG19eYAaw5n/WmVMcwf?=
 =?us-ascii?Q?nQjLK+RLmcVLsLNC4EDMfGwe/mJXQjREhgZiHevKlfoA+VzPQc8aot3PcPk8?=
 =?us-ascii?Q?7F3LkRB9MmqWYj7/LdwsdtCxsF6vrUk0TJMmh4pfyFvTJ5oHvXmK6+GZgWYM?=
 =?us-ascii?Q?rTTI1piwP58RZ+p49czuAn9wJ950sUc1NnECZ87AAj8E+gY5IMt5yIS6Osth?=
 =?us-ascii?Q?PbtSe24WKnzd3aw1uB6Kpws5qIhZH/6IsZQ0iM1BsJti3jtCIorOdf7re0bF?=
 =?us-ascii?Q?5XAYDKxnd1gOlFn2YvB41vMjbzImT8jyR6boI6bQFO159IMS20PowEZKLD5k?=
 =?us-ascii?Q?qZdFZF0wbi1xYNpmwJ0swHpKD/xMyqSZNUlm0GGa6H3ggw8qOMwTP6aggL4I?=
 =?us-ascii?Q?mPAXfSD9jPSSP7chdYXSEUeTO0eIkho7Vp+U/ha813KNFZ8FJpgcn4t1wuR8?=
 =?us-ascii?Q?oIOBSmWXTTw9zzRDyTkCOHWDX7OskEEVcp/e376BCqtMH2zgUVAUyu8I2Loa?=
 =?us-ascii?Q?17dS4zKt7l3ynoCX4qizv29kkWa91+3UO5KXj7Gr6WxzhLsP8h7I4qfKizW7?=
 =?us-ascii?Q?uaoKDj7peJSGb/yc5+hMaQfEAmEeM+Dx8KgM/ktqQThZapbXOzgrd03F7/Ic?=
 =?us-ascii?Q?Zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dab06c9-4413-4e80-dca5-08dd7998251c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2025 08:00:52.0887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XgGf6LVPw3VZB2KaxMOZshnMP0FcF79X1hqFIz+CIj3jTKVCc0fppPPQn+m51u7bzKTw42X5vdC/bhuR/XgKDTZr6hhqI6lXeZhgWBr/iOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6090
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
> Sent: 08 April 2025 21:09
> Subject: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for =
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
> v1->v2:
> - Dropped unused macros
> - Added missing LPCLK flag to rzvv2h info
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 451 ++++++++++++++++++
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
>  2 files changed, 485 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 6c6bc59eabbc..e260e2ed03c1 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2022 Renesas Electronics Corporation
>   */
>  #include <linux/clk.h>
> +#include <linux/clk/renesas-rzv2h-dsi.h>

This patch has hard dependency on clk driver.

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
>  			      unsigned long long *hsfreq_mhz);
>  	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
>  					    unsigned long mode_freq);
> +	const struct rzv2h_plldsi_div_limits *cpg_dsi_limits;
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
>  	unsigned long max_dclk;
> @@ -49,6 +54,11 @@ struct rzg2l_mipi_dsi_hw_info {
>  	u8 features;
>  };
>=20
> +struct rzv2h_dsi_mode_calc {
> +	unsigned long mode_freq;
> +	unsigned long long mode_freq_hz;
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
> +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits =3D =
{
> +	.m =3D { .min =3D 64, .max =3D 1023 },
> +	.p =3D { .min =3D 1, .max =3D 4 },
> +	.s =3D { .min =3D 0, .max =3D 5 },
> +	.k =3D { .min =3D -32768, .max =3D 32767 },
> +	.csdiv =3D { .min =3D 1, .max =3D 1 },
> +	.fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA }
>  };
>=20
>  static inline struct rzg2l_mipi_dsi *
> @@ -186,6 +208,249 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mi=
pi_dsi_global_timings[] =3D {
>  	},
>  };
>=20
> +struct rzv2h_mipi_dsi_timings {
> +	unsigned long hsfreq;
> +	u16 value;
> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKPRPRCTL[] =3D {
> +	{150000000UL, 0},
> +	{260000000UL, 1},
> +	{370000000UL, 2},
> +	{470000000UL, 3},
> +	{580000000UL, 4},
> +	{690000000UL, 5},
> +	{790000000UL, 6},
> +	{900000000UL, 7},
> +	{1010000000UL, 8},
> +	{1110000000UL, 9},
> +	{1220000000UL, 10},
> +	{1330000000UL, 11},
> +	{1430000000UL, 12},
> +	{1500000000UL, 13},
> +};

Not sure, Is it right approach to optimize this table as the second entry i=
s sequential
with a fixed number for all tables except last one?=20

28 bytes can be saved, if we use a variable holding start_index.

> +
> +static const struct rzv2h_mipi_dsi_timings TCLKZEROCTL[] =3D {
> +	{90000000UL, 2},
> +	{110000000UL, 3},
> +	{130000000UL, 4},
> +	{150000000UL, 5},
> +	{180000000UL, 6},
> +	{210000000UL, 7},
> +	{230000000UL, 8},
> +	{240000000UL, 9},
> +	{250000000UL, 10},
> +	{270000000UL, 11},
> +	{290000000UL, 12},
> +	{310000000UL, 13},
> +	{340000000UL, 14},
> +	{360000000UL, 15},
> +	{380000000UL, 16},
> +	{410000000UL, 17},
> +	{430000000UL, 18},
> +	{450000000UL, 19},
> +	{470000000UL, 20},
> +	{500000000UL, 21},
> +	{520000000UL, 22},
> +	{540000000UL, 23},
> +	{570000000UL, 24},
> +	{590000000UL, 25},
> +	{610000000UL, 26},
> +	{630000000UL, 27},
> +	{660000000UL, 28},
> +	{680000000UL, 29},
> +	{700000000UL, 30},
> +	{730000000UL, 31},
> +	{750000000UL, 32},
> +	{770000000UL, 33},
> +	{790000000UL, 34},
> +	{820000000UL, 35},
> +	{840000000UL, 36},
> +	{860000000UL, 37},
> +	{890000000UL, 38},
> +	{910000000UL, 39},
> +	{930000000UL, 40},
> +	{950000000UL, 41},
> +	{980000000UL, 42},
> +	{1000000000UL, 43},
> +	{1020000000UL, 44},
> +	{1050000000UL, 45},
> +	{1070000000UL, 46},
> +	{1090000000UL, 47},
> +	{1110000000UL, 48},
> +	{1140000000UL, 49},
> +	{1160000000UL, 50},
> +	{1180000000UL, 51},
> +	{1210000000UL, 52},
> +	{1230000000UL, 53},
> +	{1250000000UL, 54},
> +	{1270000000UL, 55},
> +	{1300000000UL, 56},
> +	{1320000000UL, 57},
> +	{1340000000UL, 58},
> +	{1370000000UL, 59},
> +	{1390000000UL, 60},
> +	{1410000000UL, 61},
> +	{1430000000UL, 62},
> +	{1460000000UL, 63},
> +	{1480000000UL, 64},
> +	{1500000000UL, 65},

Same. Here 128 bytes

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKPOSTCTL[] =3D {
> +	{80000000UL, 6},
> +	{210000000UL, 7},
> +	{340000000UL, 8},
> +	{480000000UL, 9},
> +	{610000000UL, 10},
> +	{740000000UL, 11},
> +	{880000000UL, 12},
> +	{1010000000UL, 13},
> +	{1140000000UL, 14},
> +	{1280000000UL, 15},
> +	{1410000000UL, 16},
> +	{1500000000UL, 17},

Same. Here 24 bytes

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TCLKTRAILCTL[] =3D {
> +	{140000000UL, 1},
> +	{250000000UL, 2},
> +	{370000000UL, 3},
> +	{480000000UL, 4},
> +	{590000000UL, 5},
> +	{710000000UL, 6},
> +	{820000000UL, 7},
> +	{940000000UL, 8},
> +	{1050000000UL, 9},
> +	{1170000000UL, 10},
> +	{1280000000UL, 11},
> +	{1390000000UL, 12},
> +	{1500000000UL, 13},
Same. Here 26 bytes

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSPRPRCTL[] =3D {
> +	{110000000UL, 0},
> +	{190000000UL, 1},
> +	{290000000UL, 2},
> +	{400000000UL, 3},
> +	{500000000UL, 4},
> +	{610000000UL, 5},
> +	{720000000UL, 6},
> +	{820000000UL, 7},
> +	{930000000UL, 8},
> +	{1030000000UL, 9},
> +	{1140000000UL, 10},
> +	{1250000000UL, 11},
> +	{1350000000UL, 12},
> +	{1460000000UL, 13},
> +	{1500000000UL, 14},

Same. Here 30 bytes

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSZEROCTL[] =3D {
> +	{180000000UL, 0},
> +	{240000000UL, 1},
> +	{290000000UL, 2},
> +	{350000000UL, 3},
> +	{400000000UL, 4},
> +	{460000000UL, 5},
> +	{510000000UL, 6},
> +	{570000000UL, 7},
> +	{620000000UL, 8},
> +	{680000000UL, 9},
> +	{730000000UL, 10},
> +	{790000000UL, 11},
> +	{840000000UL, 12},
> +	{900000000UL, 13},
> +	{950000000UL, 14},
> +	{1010000000UL, 15},
> +	{1060000000UL, 16},
> +	{1120000000UL, 17},
> +	{1170000000UL, 18},
> +	{1230000000UL, 19},
> +	{1280000000UL, 20},
> +	{1340000000UL, 21},
> +	{1390000000UL, 22},
> +	{1450000000UL, 23},
> +	{1500000000UL, 24},

Same. Here 50 bytes.

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSTRAILCTL[] =3D {
> +	{100000000UL, 3},
> +	{210000000UL, 4},
> +	{320000000UL, 5},
> +	{420000000UL, 6},
> +	{530000000UL, 7},
> +	{640000000UL, 8},
> +	{750000000UL, 9},
> +	{850000000UL, 10},
> +	{960000000UL, 11},
> +	{1070000000UL, 12},
> +	{1180000000UL, 13},
> +	{1280000000UL, 14},
> +	{1390000000UL, 15},
> +	{1500000000UL, 16},

Same. Here 28 bytes?

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings TLPXCTL[] =3D {
> +	{130000000UL, 0},
> +	{260000000UL, 1},
> +	{390000000UL, 2},
> +	{530000000UL, 3},
> +	{660000000UL, 4},
> +	{790000000UL, 5},
> +	{930000000UL, 6},
> +	{1060000000UL, 7},
> +	{1190000000UL, 8},
> +	{1330000000UL, 9},
> +	{1460000000UL, 10},
> +	{1500000000UL, 11},

Same. Here 24 bytes

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings THSEXITCTL[] =3D {
> +	{150000000UL, 1},
> +	{230000000UL, 2},
> +	{310000000UL, 3},
> +	{390000000UL, 4},
> +	{470000000UL, 5},
> +	{550000000UL, 6},
> +	{630000000UL, 7},
> +	{710000000UL, 8},
> +	{790000000UL, 9},
> +	{870000000UL, 10},
> +	{950000000UL, 11},
> +	{1030000000UL, 12},
> +	{1110000000UL, 13},
> +	{1190000000UL, 14},
> +	{1270000000UL, 15},
> +	{1350000000UL, 16},
> +	{1430000000UL, 17},
> +	{1500000000UL, 18},

Same. Here 36 bytes.

> +};
> +
> +static const struct rzv2h_mipi_dsi_timings ULPSEXIT[] =3D {
> +	{1953125UL, 49},
> +	{3906250UL, 98},
> +	{7812500UL, 195},
> +	{15625000UL, 391},

Here we have problem as it is non-sequential and only has 4 entries?

Since it is ULPS EXIT Counter values compared to DPHY timings
This can have its own structure?

> +};
> +
> +static int rzv2h_dphy_find_timings_val(unsigned long freq,
> +				       const struct rzv2h_mipi_dsi_timings timings[],
> +				       unsigned int size)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < size; i++) {
> +		if (freq <=3D timings[i].hsfreq)
> +			break;
> +	}
> +
> +	if (i =3D=3D size)
> +		i -=3D 1;
> +
> +	return timings[i].value;

This will be then start_index + i for all DPHY timing parmeter table.

And

Maybe use another function to find ULPS EXIT Counter values??


> +};
> +
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg=
, u32 data)  {
>  	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg); @@ -307,6=
 +572,168 @@ static int
> rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
>  	return 0;
>  }
>=20
> +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi=
,
> +					      unsigned long mode_freq)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long long hsfreq_mhz, mode_freq_hz, mode_freq_mhz;
> +	struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> +	unsigned int bpp, i;
> +
> +	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> +
> +	for (i =3D 0; i < 10; i +=3D 1) {
> +		unsigned long hsfreq;
> +		bool parameters_found;
> +
> +		mode_freq_hz =3D mode_freq * KILO + i;
> +		mode_freq_mhz =3D mode_freq_hz * KILO * 1ULL;
> +		parameters_found =3D rzv2h_dsi_get_pll_parameters_values(dsi->info->cp=
g_dsi_limits,
> +								       &cpg_dsi_parameters,
> +								       mode_freq_mhz);
> +		if (!parameters_found)
> +			continue;
> +
> +		hsfreq_mhz =3D DIV_ROUND_CLOSEST_ULL(cpg_dsi_parameters.freq_mhz * bpp=
, dsi->lanes);
> +		parameters_found =3D rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi=
_div_limits,
> +								       dsi_parameters,
> +								       hsfreq_mhz);
> +		if (!parameters_found)
> +			continue;
> +
> +		if (abs(dsi_parameters->error_mhz) >=3D 500)
> +			continue;
> +
> +		hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
> +		if (hsfreq >=3D RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA &&
> +		    hsfreq <=3D RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA) {
> +			dsi->mode_calc.mode_freq_hz =3D mode_freq_hz;
> +			dsi->mode_calc.mode_freq =3D mode_freq;
> +			return MODE_OK;
> +		}
> +	}
> +
> +	return MODE_CLOCK_RANGE;
> +}
> +
> +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned lon=
g mode_freq,
> +				unsigned long long *hsfreq_mhz)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long status;
> +
> +	if (dsi->mode_calc.mode_freq !=3D mode_freq) {
> +		status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> +		if (status !=3D MODE_OK) {
> +			dev_err(dsi->dev, "No PLL parameters found for mode clk %lu\n",
> +				mode_freq);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
> +	*hsfreq_mhz =3D dsi_parameters->freq_mhz;
> +
> +	return 0;
> +}
> +
> +static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> +				    unsigned long long hsfreq_mhz)
> +{
> +	struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_parameters=
;
> +	unsigned long lpclk_rate =3D clk_get_rate(dsi->lpclk);
> +	u32 phytclksetr, phythssetr, phytlpxsetr, phycr;
> +	struct rzg2l_mipi_dsi_timings dphy_timings;
> +	unsigned long long hsfreq;
> +	u32 ulpsexit;
> +
> +	hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
> +
> +	if (dsi_parameters->freq_mhz =3D=3D hsfreq_mhz)
> +		goto parameters_found;
> +
> +	if (rzv2h_dsi_get_pll_parameters_values(&rzv2h_plldsi_div_limits,
> +						dsi_parameters, hsfreq_mhz))
> +		goto parameters_found;
> +
> +	dev_err(dsi->dev, "No PLL parameters found for HSFREQ %lluHz\n", hsfreq=
);
> +	return -EINVAL;
> +
> +parameters_found:
> +	dphy_timings.tclk_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKTRAILCTL,
> +					    ARRAY_SIZE(TCLKTRAILCTL));
> +	dphy_timings.tclk_post =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPOSTCTL,
> +					    ARRAY_SIZE(TCLKPOSTCTL));
> +	dphy_timings.tclk_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKZEROCTL,
> +					    ARRAY_SIZE(TCLKZEROCTL));
> +	dphy_timings.tclk_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TCLKPRPRCTL,
> +					    ARRAY_SIZE(TCLKPRPRCTL));
> +	dphy_timings.ths_exit =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSEXITCTL,
> +					    ARRAY_SIZE(THSEXITCTL));
> +	dphy_timings.ths_trail =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSTRAILCTL,
> +					    ARRAY_SIZE(THSTRAILCTL));
> +	dphy_timings.ths_zero =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSZEROCTL,
> +					    ARRAY_SIZE(THSZEROCTL));
> +	dphy_timings.ths_prepare =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, THSPRPRCTL,
> +					    ARRAY_SIZE(THSPRPRCTL));
> +	dphy_timings.tlpx =3D
> +		rzv2h_dphy_find_timings_val(hsfreq, TLPXCTL,
> +					    ARRAY_SIZE(TLPXCTL));
> +	ulpsexit =3D
> +		rzv2h_dphy_find_timings_val(lpclk_rate, ULPSEXIT,
> +					    ARRAY_SIZE(ULPSEXIT));
> +
> +	phytclksetr =3D PHYTCLKSETR_TCLKTRAILCTL(dphy_timings.tclk_trail) |
> +		      PHYTCLKSETR_TCLKPOSTCTL(dphy_timings.tclk_post) |
> +		      PHYTCLKSETR_TCLKZEROCTL(dphy_timings.tclk_zero) |
> +		      PHYTCLKSETR_TCLKPRPRCTL(dphy_timings.tclk_prepare);
> +	phythssetr =3D PHYTHSSETR_THSEXITCTL(dphy_timings.ths_exit) |
> +		     PHYTHSSETR_THSTRAILCTL(dphy_timings.ths_trail) |
> +		     PHYTHSSETR_THSZEROCTL(dphy_timings.ths_zero) |
> +		     PHYTHSSETR_THSPRPRCTL(dphy_timings.ths_prepare);
> +	phytlpxsetr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYTLPXSETR) & ~GENMASK(7,=
 0);
> +	phytlpxsetr |=3D PHYTLPXSETR_TLPXCTL(dphy_timings.tlpx);
> +	phycr =3D rzg2l_mipi_dsi_phy_read(dsi, PHYCR) & ~GENMASK(9, 0);
> +	phycr |=3D PHYCR_ULPSEXIT(ulpsexit);
> +
> +	/* Setting all D-PHY Timings Registers */
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTCLKSETR, phytclksetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTHSSETR, phythssetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYTLPXSETR, phytlpxsetr);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYCR, phycr);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET0R,
> +				 PLLCLKSET0R_PLL_S(dsi_parameters->s) |
> +				 PLLCLKSET0R_PLL_P(dsi_parameters->p) |
> +				 PLLCLKSET0R_PLL_M(dsi_parameters->m));
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R, PLLCLKSET1R_PLL_K(dsi_parame=
ters->k));
> +	udelay(20);
> +
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, PLLENR_PLLEN);
> +	udelay(500);

Checkpatch warnings, maybe use fsleep()?

CHECK: usleep_range is preferred over udelay; see function description of u=
sleep_range() and udelay().
#475: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:718:
+	udelay(20);
CHECK: usleep_range is preferred over udelay; see function description of u=
sleep_range() and udelay().
#478: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:721:
+	udelay(500);
CHECK: usleep_range is preferred over udelay; see function description of u=
sleep_range() and udelay().
#485: FILE: drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:728:
+	udelay(220);


Cheers,
Biju

> +
> +	return 0;
> +}
> +
> +static void rzv2h_mipi_dsi_dphy_late_init(struct rzg2l_mipi_dsi *dsi) {
> +	udelay(220);
> +	rzg2l_mipi_dsi_phy_write(dsi, PHYRSTR, PHYRSTR_PHYMRSTN); }
> +
> +static void rzv2h_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi) {
> +	rzg2l_mipi_dsi_phy_write(dsi, PLLENR, 0); }
> +
>  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)  { @@ -409,6 +836,9 @@ static=
 void
> rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
>  	case 18:
>  		vich1ppsetr =3D VICH1PPSETR_DT_RGB18;
>  		break;
> +	case 16:
> +		vich1ppsetr =3D VICH1PPSETR_DT_RGB16;
> +		break;
>  	}
>=20
>  	if ((dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) && @@ -439,6 +86=
9,9 @@ static void
> rzg2l_mipi_dsi_set_display_timing(struct rzg2l_mipi_dsi *dsi,
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1HSSETR, vich1hssetr);
>  	rzg2l_mipi_dsi_link_write(dsi, VICH1HPSETR, vich1hpsetr);
>=20
> +	if (dsi->info->dphy_late_init)
> +		dsi->info->dphy_late_init(dsi);
> +
>  	/*
>  	 * Configuration for Delay Value
>  	 * Delay value based on 2 ranges of video clock.
> @@ -867,6 +1300,23 @@ static void rzg2l_mipi_dsi_remove(struct platform_d=
evice *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>=20
> +RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
> +
> +static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info =3D {
> +	.dphy_init =3D rzv2h_mipi_dsi_dphy_init,
> +	.dphy_late_init =3D rzv2h_mipi_dsi_dphy_late_init,
> +	.dphy_exit =3D rzv2h_mipi_dsi_dphy_exit,
> +	.dphy_mode_clk_check =3D rzv2h_dphy_mode_clk_check,
> +	.dphy_conf_clks =3D rzv2h_dphy_conf_clks,
> +	.cpg_dsi_limits =3D &rzv2h_cpg_pll_dsi_limits,
> +	.phy_reg_offset =3D 0x10000,
> +	.link_reg_offset =3D 0,
> +	.max_dclk =3D 187500,
> +	.min_dclk =3D 5440,
> +	.features =3D RZ_MIPI_DSI_FEATURE_16BPP |
> +		    RZ_MIPI_DSI_FEATURE_LPCLK,
> +};
> +
>  static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {
>  	.dphy_init =3D rzg2l_mipi_dsi_dphy_init,
>  	.dphy_exit =3D rzg2l_mipi_dsi_dphy_exit, @@ -878,6 +1328,7 @@ static co=
nst struct
> rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info =3D {  };
>=20
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-mipi-dsi", .data =3D
> +&rzv2h_mipi_dsi_info, },
>  	{ .compatible =3D "renesas,rzg2l-mipi-dsi", .data =3D &rzg2l_mipi_dsi_i=
nfo, },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/driver=
s/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> index 16efe4dc59f4..68165395d61c 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -40,6 +40,39 @@
>  #define DSIDPHYTIM3_THS_TRAIL(x)	((x) << 8)
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>=20
> +/* RZ/V2H DPHY Registers */
> +#define PLLENR				0x000
> +#define PLLENR_PLLEN			BIT(0)
> +
> +#define PHYRSTR				0x004
> +#define PHYRSTR_PHYMRSTN		BIT(0)
> +
> +#define PLLCLKSET0R			0x010
> +#define PLLCLKSET0R_PLL_S(x)		((x) << 0)
> +#define PLLCLKSET0R_PLL_P(x)		((x) << 8)
> +#define PLLCLKSET0R_PLL_M(x)		((x) << 16)
> +
> +#define PLLCLKSET1R			0x014
> +#define PLLCLKSET1R_PLL_K(x)		((x) << 0)
> +
> +#define PHYTCLKSETR			0x020
> +#define PHYTCLKSETR_TCLKTRAILCTL(x)	((x) << 0)
> +#define PHYTCLKSETR_TCLKPOSTCTL(x)	((x) << 8)
> +#define PHYTCLKSETR_TCLKZEROCTL(x)	((x) << 16)
> +#define PHYTCLKSETR_TCLKPRPRCTL(x)	((x) << 24)
> +
> +#define PHYTHSSETR			0x024
> +#define PHYTHSSETR_THSEXITCTL(x)	((x) << 0)
> +#define PHYTHSSETR_THSTRAILCTL(x)	((x) << 8)
> +#define PHYTHSSETR_THSZEROCTL(x)	((x) << 16)
> +#define PHYTHSSETR_THSPRPRCTL(x)	((x) << 24)
> +
> +#define PHYTLPXSETR			0x028
> +#define PHYTLPXSETR_TLPXCTL(x)		((x) << 0)
> +
> +#define PHYCR				0x030
> +#define PHYCR_ULPSEXIT(x)		((x) << 0)
> +
>  /* --------------------------------------------------------*/
>=20
>  /* Link Status Register */
> @@ -116,6 +149,7 @@
>=20
>  /* Video-Input Channel 1 Pixel Packet Set Register */
>  #define VICH1PPSETR			0x420
> +#define VICH1PPSETR_DT_RGB16		(0x0e << 16)
>  #define VICH1PPSETR_DT_RGB18		(0x1e << 16)
>  #define VICH1PPSETR_DT_RGB18_LS		(0x2e << 16)
>  #define VICH1PPSETR_DT_RGB24		(0x3e << 16)
> --
> 2.49.0

