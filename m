Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD43AA5CF3
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 12:02:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BC410E16F;
	Thu,  1 May 2025 10:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Y4mGQ6zB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056510E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 10:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjNQzfgkQFev18tCU+zbamR9zfqjHtQfYxh4R6Mgm7rBz5BZetJ8wvkZ4pQtu6TneNru3KJMdXSJAnTpAw8/eHU1FhxQph9kh5CjOQt0bZ1TXtAeUXyQf4fGt0E0FVyIdwr+D3o2p/Hne93IwLgo+yOapPdJ7BLZNJ9fX5TTKblzrrRK8ucVBkXNEKBrwtr6gehbBYvnwZNgIeK2k4rR9yDR7MBcqdlLRKV2gQA9l51LTu/wsqbCj8RhdufcOW6gNdpef9yilHf8sf9tdHvHSU0kZxz+8E9FJpSlMHdyliZdWa+lGan59r8TTKAMloCyBUV0Qsq7VBaanxL33nbAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvESvV/mF6hE7vwatU1ZpDOzbzJhXhgFyfgQNyTCoWQ=;
 b=cKCZJ+43cXUCEV4SsonIb1svXwBPbSetfdGzsI79XaX1sWmttotqrY5GhK769/FqaB6ROdRQoc5q/EkcozvuJ1YHsMq5j1B1BtxZHBnP02G/cseSRCpdI+/qYDZya9nI5L3IE1cpjJ/jtQGuleiFhvS2HlZ8Y2Qv06oCyIny6h1Qr33Ag2n10q0lFR/wq++K9UpWzw48UjEsW+oZbqlRFia18gQeSF9zrR91y2LHjGTvj3GFCn52hyUQCsJUIpiHlpmRb75Oe5d5ljxJYVBblu+5iwrvi/DJ09E0TN5AL71H+Zp0xgFKoAoprS6b3N+Vqj2dMPuxuMcByTLcMvgodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvESvV/mF6hE7vwatU1ZpDOzbzJhXhgFyfgQNyTCoWQ=;
 b=Y4mGQ6zBfounxN4ANHn21gYhvHgg7oNyUeCzz9ydW1njnqB/4su+r2m2FurF0m93w987IbpOMTLrujg9g0TpcdJSHZ6hXaimJ8B9mwz5rJs0Y0DZtJPZlmVa8wRuvCr7oICVnLY1leeinvRCLPWp3L/fd2DKnzGOPtU9I8ZZ4Mk=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYXPR01MB15342.jpnprd01.prod.outlook.com (2603:1096:405:278::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 10:02:03 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%4]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 10:01:58 +0000
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
Subject: RE: [PATCH v4 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P)
 SoC
Thread-Topic: [PATCH v4 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P)
 SoC
Thread-Index: AQHbuhA/mU/aPgN/YEWVKd+KycaDxrO9iz4Q
Date: Thu, 1 May 2025 10:01:58 +0000
Message-ID: <TYCPR01MB11332E2BF4A00F83D0770478886822@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYXPR01MB15342:EE_
x-ms-office365-filtering-correlation-id: 4e84dfde-073a-4b1e-4bcd-08dd889735e7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GRLxylCHNCeZUfD734bMDKkQshVsKVu/6bH9Rr5HaF/Pf+OIoE+dUArUfREw?=
 =?us-ascii?Q?vy98UTAtmmanLMbHtSVaHBBCxki9tucWdNXlz26MmlJdOJQPcNZCZQN2JVLl?=
 =?us-ascii?Q?Zn4X6+cPIXbF9lbRdgPoypQuJp0PyYbQizNFudAGJ/Ggxofxd7qMRMZaHO1B?=
 =?us-ascii?Q?9uIhcWiy1b0UBByT8p+xtt3ZqhBz81vTYLiJWsd2KVR3dbBJPQIthbJZ7PAX?=
 =?us-ascii?Q?bRJ3RwSVpNXdL/AVT2//tudtJbpDqIr6QvWjooQFQlNsoY71CQ+GldhwF4x+?=
 =?us-ascii?Q?7yAZZ6sKWUGVpw2QYB4oClFcWWo5UDaxiliKp/bEgrAK6p9Jxk/LPGZljWqL?=
 =?us-ascii?Q?tisTsJtX8pMvVdHNtlooQWopbu7s5cxZPc5ZfSkloSEfJqNbQdHXXxpOgPVz?=
 =?us-ascii?Q?7LruWByul8+eHMBP0TTywrR+mkQY4Ae7T1IIgovNTivE17tMteOW5r5EgQ1V?=
 =?us-ascii?Q?2QMGsdFw5vuGfmdhWU6UNFJgeerts9hFkJKCMnGHuc2hxeUSMWWDOe5HHfXw?=
 =?us-ascii?Q?p+Of0MqTt7b0/RVZ9jptFVowkv/05fpqOt7Z7ABwLH6TmgUxB0z3PKVsdkxJ?=
 =?us-ascii?Q?6UunwNGp7mQELd4GjaEZXikY7LmYIpCd2RgmeUgLpbQEaip1CKaV4wrpXXQM?=
 =?us-ascii?Q?I7jjEShreZB6ZQOnhuL3a/ovPCDO4M7N5GObm7v+OV+dWgHe15MA8/vbd2ZA?=
 =?us-ascii?Q?qyyIEpUGdzM5pB+t+jiwmezSEfNkX97r064EeSexlxBlhF5A+EGEeAs/o6tn?=
 =?us-ascii?Q?TaJymstVc350o1Mh5NiBFNeCgEYhmhRA7L55t7QyesLrveOmypbQ8wfJs2l7?=
 =?us-ascii?Q?wDLHGksZtaGwjzAFwnhRIg/6WhOovEbK2jyKF3k5Yk8vUjsbPHsTUK+sxPSY?=
 =?us-ascii?Q?0lOaKxqIkdoYP7PhlXQ3F/qJoDNyPwisE4AY4J3dZiryhr6dpgVPNXIxSn8z?=
 =?us-ascii?Q?2DXZg0mQcwuKdtQW8AHgrdJh3TASeALTWAEja5HaaDf2FlewWc/VxlBoEgME?=
 =?us-ascii?Q?xMvr495t+gfXQurmNhdI9Ufm9GhoVQnKnJngY4hGnD4rEjG1XYuUJ0OA7GEt?=
 =?us-ascii?Q?wcuO2hWfhlgeT5eydxuczrejOU+W2ByFvgsQmJsacKj5pRo4Iy4atHRIKaep?=
 =?us-ascii?Q?VqkbqQsS/NdNiGSSgp9YWDoid2cabpXjM+DNYBd4Rdyk20oZm3JIUsKvYEHh?=
 =?us-ascii?Q?p3VC8tKR/03sqV194ZlLkFoCp4jZiP87RrPzjE6/sfWZvd7AgLWmnUA+w9II?=
 =?us-ascii?Q?xZlN3YRW5D3FPTI1dRW+2R56w1MN+HbkPIKTRodpLnWvXXIuxgO1/zXkriRW?=
 =?us-ascii?Q?ZqeKYXk369Dhgy/6T7Hfas6qSw1hy5VonHkHYH8Sm6DIH1AsNQ7c15S5flO0?=
 =?us-ascii?Q?bdVKZ+LXWmSskSjHp18fdzYNrppgezpWWNKZpoYyTNKeXlBLrqFvgwnvkkQF?=
 =?us-ascii?Q?fnDL77s4wA7KzOqkQioP+U1PZ6FlSdCxXeqpeUFH8u+zeNRCM3ZLhAMSxruw?=
 =?us-ascii?Q?yTat7lQjnciZgkE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bFb63oqOBN0oMk9oDCwBwSiIhY0UUYdlWffo6HFpd/OvVSvv6iVbfM+3nsd1?=
 =?us-ascii?Q?jJ4fxplHhAHwfLjW8rWZ95HEG5GAZVUvzKqpuFyFDC8BauvBmriVKv/EurM5?=
 =?us-ascii?Q?oD8CeqjaicbGWJhxXB8q8n7t6ZC4qdC7ewIrZ372jjvvJYZye5Rke5bFnrsh?=
 =?us-ascii?Q?K/zwJd4QpYvSsax2YDUqDMQRReM5hohQ+Uw21xt/YqWIajKptVDlHZ/EJURJ?=
 =?us-ascii?Q?Q1tYfkMjOB21xnYPa1PCZl0Wqiz5KTZL+VSFJcneke3dSTpKpJLM0cSzCbGM?=
 =?us-ascii?Q?Wt9jJ34AiGuKwthIdTFcL8+5WIjEkE1zXAYIoxh4kVZwBxDZXNndblQluqbV?=
 =?us-ascii?Q?Hc32uvCRuBgWQNEBbi4kCJDyn5CJnIohJm9GJSiy4yngoGA9kI1HFhMwuvk8?=
 =?us-ascii?Q?opkj1X/Kn0cXvaI2KzgaSdOxmWsFNILjCSbhDqZf93dOIbS8jPgOHhBstPne?=
 =?us-ascii?Q?F/5WVQDFYCgfwDQo30tLrg3dyeLqYV6VgSdDL7RIXt3mCzroRLtLCWZGGh6A?=
 =?us-ascii?Q?JIt0tXX53KatTb5tYsWyjCHVYXo7WB2qxIb/MULUd/ZinwC2efe58BcJPqtM?=
 =?us-ascii?Q?nbq+o0kcuU8zESKBKXqMtVe/8pDY/GDptx3awdi5UnO34FknKrdh0uycSdjS?=
 =?us-ascii?Q?o7M5ff9fYlhRB3hXFDleVbXyHZ+FefKikO+aPLL4dEX8pUg1DfVQSHi6algW?=
 =?us-ascii?Q?D1Kc1zpWWgTTYzjtk8ZkO7y/ZIKLBiRRdxE2Hx+2Xfo/v3aLiyTqwOC9RJnV?=
 =?us-ascii?Q?0AIWLrj/LjksYuc3uxfZW82oTDr0h/c/TU6TavYqWtx9TRF7MkzOznsdk5Hj?=
 =?us-ascii?Q?DjraXNzJ5VKTiqY05KMg76KYViwas0IW0vbca5j0qVyI+4vgkWRQsLEVxcYy?=
 =?us-ascii?Q?q9Hie5A6Dp3wEEhcEgHBbm9SgSB9rvTXKgm7HK8YX0pnSHAPbh7oDIFwPlrJ?=
 =?us-ascii?Q?0nUefUch0clm2BbBLo+SJQG9jOiDQeTNNVB/mztA2yXypql79J4r2Lu5ob2P?=
 =?us-ascii?Q?55J4Hs8mzlG4Cv/xVFXhP0Vvf6DTW9Ope/6yEkN7vXxBFbVmMrGkuE8dk0l0?=
 =?us-ascii?Q?Tx8jUoWePoeig2TEJnN14DpoVcmEZugLYGhqHK0WXBOlVZPHPkObvtSyp4SX?=
 =?us-ascii?Q?wCTa/hnGUTrnpT0D5akoE9Ja9O5VfomrM5bfrpcEDvDcPgNKPoJ2GjLtST+e?=
 =?us-ascii?Q?gUgaLvuZND8dchJgMy9rPaL58qhsjCBivenekosKdtZLOCdaiyKJYZUT6tRU?=
 =?us-ascii?Q?p7uxuL7WIbVvmNNwnh6HrPW35e5fHm8eb4M6JaTTm/g1q7s9Np4XdFwN0UDm?=
 =?us-ascii?Q?X4ISxWmrJ+h8MIu7fNR2sxRO5X2ZNMFATA5gPdjImH9qbknXm4fH+Wx1FnSy?=
 =?us-ascii?Q?M3lzl7Ubvs6Rb+mzdrvDC7S/jOMHIutQs14VE1b5GNMLwT/Inc/Kgl/Nflj2?=
 =?us-ascii?Q?N9OrUXwa7huiTXsYPK/Cphse4rc9gVvNUtPKAqCMGARDElRMq/yRx+5P4/gB?=
 =?us-ascii?Q?YC9msO4R1GRukhQ+yP1ntwUNmyzdAA4Mu4yFfnYNxfmL65ws06huPVYjtOXE?=
 =?us-ascii?Q?6PO+cI8MTLd3w3ESHvTfCLm7no9QuXyiKXF6lNmzP3FbiJ7I8/EYPLCXjYfc?=
 =?us-ascii?Q?hQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e84dfde-073a-4b1e-4bcd-08dd889735e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 10:01:58.2111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lJlX33Su10szWGaK0Vs7noexw6m2Wzww7rPbid9Et7YKqUnXIOnQwY/2q5Yjp4fXwkxqYBqfF45K1AGICql34AFnLBAkWPZLQqpI3sPOVyA=
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

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 30 April 2025 21:41
> Subject: [PATCH v4 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) =
SoC
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame Compr=
ession Processor (FCPVD),
> Video Signal Processor (VSPD), and Display Unit (DU).
>=20
> There is one LCDC unit available on the RZ/V2H(P) SoC which is connected =
to the DSI.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
> - No changes
>=20
> v2->v3:
> - No changes
>=20
> v1->v2:
> - Added enum for RZ/V2H as suggested by Krzysztof as the list
>   will grow in the future (while adding RZ/G3E SoC).
> - Added Reviewed-by tag from Krzysztof.

Looks this change log is not relevant here as it is related to bindings.

Otherwise LGTM.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_drv.c
> index 5e40f0c1e7b0..e1aa6a719529 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> @@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a0=
7g044_info =3D {
>  	}
>  };
>=20
> +static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info =3D {
> +	.channels_mask =3D BIT(0),
> +	.routes =3D {
> +		[RZG2L_DU_OUTPUT_DSI0] =3D {
> +			.possible_outputs =3D BIT(0),
> +			.port =3D 0,
> +		},
> +	},
> +};
> +
>  static const struct of_device_id rzg2l_du_of_table[] =3D {
>  	{ .compatible =3D "renesas,r9a07g043u-du", .data =3D &rzg2l_du_r9a07g04=
3u_info },
>  	{ .compatible =3D "renesas,r9a07g044-du", .data =3D &rzg2l_du_r9a07g044=
_info },
> +	{ .compatible =3D "renesas,r9a09g057-du", .data =3D
> +&rzg2l_du_r9a09g057_info },
>  	{ /* sentinel */ }
>  };
>=20
> --
> 2.49.0

