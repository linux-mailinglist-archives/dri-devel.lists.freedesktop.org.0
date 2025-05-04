Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2260AA8671
	for <lists+dri-devel@lfdr.de>; Sun,  4 May 2025 14:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1EF10E26F;
	Sun,  4 May 2025 12:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KidIQray";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011062.outbound.protection.outlook.com [52.101.125.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70C710E26D
 for <dri-devel@lists.freedesktop.org>; Sun,  4 May 2025 12:53:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qy4uXPCaKCSTHBvvHsTthHP8WjPFKLVqyCJG7P806s053vghBReD4pZcbr6ul1krdKsVthBolcFfZcpsYhEP5AxSuJ8/jzMVf0AFTw9InHzGJFhzD7JjrX5In1KFf0avNgpfaSJpYjl+24DT4RSk/HjrKOhpd4s0LBres4sWcjAUOtHjsBpAmg6zfcwv6UYI+QMUd4+GqrFXFaB1QmJEOxlzCAqeFIjqeWjfqNdOHh8jEOmp3uGzDSja0WMkZPAprIwPOc6tECjLr3CRHkDf42Z3BNwoTd2vx+k5ebpJXLR2Is2Rq4ihBWjfzqc21mPi3D2pcx3kzcTqTuKZnpkCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAj4Tgew2yQFSEbYTh7RBff5QH737OCKGA8Re8dFatY=;
 b=prmxAxo4fayj1H9xwW4X1GTQjyBT9OoxaBx0ENA+fHQixQa5JtzA01dtsee1CQKOwelbRkjMewSM7zdpdIMBQLaRZmhxhYjYOuZdmi+n/gw2oiYQVsrOByAbpbMz6Kw7UBJyHDFC+CYvU7Cfc5kDREePc5dr59+2tXytwwBEpKUguUrIEfyzqPjHjn5/J2JzYcAQVSXetK9W2n46iOZAjV6iQWldMN+MRUiuTnDhOBFHvtVx7V8PQLeZ8TEroZ4K1NYaTyp3raQ6RsrOr6a5hl+oHn5WoFXq485uKvYb2TMR2SiXDyTKMoURvjfDVHJoddslhVesXAP+TewmN5uPRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAj4Tgew2yQFSEbYTh7RBff5QH737OCKGA8Re8dFatY=;
 b=KidIQrayg8RhYHK5wwI83Kt7rmUBHK9TmDkCYa+7zM6b29JB34BxQOr9Io+PfsNhzbBbJU3shcl/x9ZhRTGWmuY5CzmsCjrwOTeenDQQwekv8AzoEMTLcsFIsMbK2MjFTKnfQ2nq6ImoOMYwhrEhoWnt/2XG74+bsu6iNISwD3I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7108.jpnprd01.prod.outlook.com (2603:1096:400:c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sun, 4 May
 2025 12:53:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8699.022; Sun, 4 May 2025
 12:53:25 +0000
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
Subject: RE: [PATCH v4 12/15] drm: renesas: rz-du: mipi_dsi: Add
 dphy_late_init() callback for RZ/V2H(P)
Thread-Topic: [PATCH v4 12/15] drm: renesas: rz-du: mipi_dsi: Add
 dphy_late_init() callback for RZ/V2H(P)
Thread-Index: AQHbuhBEHIXQ4f8QNEOzUP6Ud/smQrPCcsVw
Date: Sun, 4 May 2025 12:53:25 +0000
Message-ID: <TY3PR01MB11346F0E380118A4ED564CDDD868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250430204112.342123-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7108:EE_
x-ms-office365-filtering-correlation-id: 3eaf98ac-0488-4e7d-3c8f-08dd8b0aa8a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?oMHspKrmz7w5ieHQTIf+EyKmL/mo0+8TT+iV97QE2BylbhIheD/nDr5uU9tH?=
 =?us-ascii?Q?+9ZINmWy8sE1JmEhAGGr96qemEeAjl9IPrGq+UZU7eh3+Lzt8Fll4cquluuD?=
 =?us-ascii?Q?3lICi5bAwNuShouMn49DIA+BIr+sP3PP+xmzBXkXZYhAgAL6KX4XBr0tLtgv?=
 =?us-ascii?Q?HC1WjIJbj6kEuUKEG1L8BzEpMUbSGSXIbXt9HtrZLjuMgX+uaODuAdpZMbAM?=
 =?us-ascii?Q?ZZgINLKMaCUqEZ2iY71KeG9rk4y2YZPin8hh8ILGrdhH/wmWF3ntAJ8jmcOl?=
 =?us-ascii?Q?iMoELftDJLosYLF1ueoCBDeWG8xYss1MA6o9rdkXwR75+sCt0qjV/OZ1zqIc?=
 =?us-ascii?Q?eFHz1aqBwhueAT+v/gl7YreZmW9Yy9U2tQpvCHtRXLsvdcLvYiM+QtrJbFxd?=
 =?us-ascii?Q?Ydhmx2DbzTduMm2OVmGfFd7INtRhSTLPrwCdYG6L1ZQTnqureUE8G5EA3v/Z?=
 =?us-ascii?Q?bnI761dtSBV8X4Qi4KBdxvwDpdwBdKKHkLzLsRwSTuVN+706y10iSEnu5HyV?=
 =?us-ascii?Q?Z0kqFntVWswha93grGggfAEDt8eGX8o/6ARC4pfSdDvHfCodrI7iLTHD0xC2?=
 =?us-ascii?Q?aOh4jU1gbBaIdg4ffB7sNB2sY+KDkYjqLnOBakLBWEv8Z/B2/Gw24h2A+Wdc?=
 =?us-ascii?Q?TX0MjMw6WwvBYMoRnAL78pi3HX0vwtd74XUCbWxD+MUGFPiIbkVgAwEHjCI0?=
 =?us-ascii?Q?Rntpdux3gQmdrq2dhMDiAWW9nbULYGGy4nLfKMx1/thU98T0+1roS2dpZ2vJ?=
 =?us-ascii?Q?c0Rp19Hrkc519NZk6McdxqgTK07tBuhZAftHSYzrDobtbsItzvoXbl0ZqyBz?=
 =?us-ascii?Q?ceHTgJqj5Ysb9sFY9k466xmU1aZGNt6HXyB6RkuDCUt3AWP/WtTeOLZBXZsV?=
 =?us-ascii?Q?0qBQKrqBH8g5wRe1WCohdOUUx711ng+9wJyeeiSq9mH/c99o/btbpeBrzPag?=
 =?us-ascii?Q?KmosXnusUkF4MmVgj3JB/mgnhwJKih71EEkHGG61ctBfJaCaNbKPA68cYkl8?=
 =?us-ascii?Q?qp+gVSLjSmdSUCBEhpbZMBRIST7e+ZFcMPILw7PHhSHIcQy1LbB2GHXd6JnR?=
 =?us-ascii?Q?7lwQZgVM7uSLll36ITG9AajlbkCv2Cjk+E4EuxLO2EMDNGIacdAfcLM8z4Gl?=
 =?us-ascii?Q?8i2O5Lzbe0EIFOUgpWzTFIR34dKNpa62q2bR3zwK9/smeILgYh5Fv/TBFfqm?=
 =?us-ascii?Q?8gERIWIqePLnCVgDv4+e/3guka/xIgSDfQl636LitJx2vpV6sgOGAcvQxWo+?=
 =?us-ascii?Q?3CYNy2Afxzro7GVmgdgRG87QdOXSiBqmCbHGTvSvkqHd3GdSowFsj7VCc/ds?=
 =?us-ascii?Q?KFA5z05O6gsHrqaV+dLRyLk2b1A678MgZ06iKK93xXPD+MfKT35RARXnGYT3?=
 =?us-ascii?Q?LU5uKFUH/gLJTnsI/I6B8uxQgmrXLw0y3U4O93pqNq0tQKREyvSoZfj1G4tg?=
 =?us-ascii?Q?a8dMMzXrNL34X+xmSLeTksgBzQvvG0kX9W6ml8N9tb88seZtAnVhmiglbcYW?=
 =?us-ascii?Q?oKCi7G8/mtTTCOc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nk7i0XBFqcnClC2MM5uROa168DE1lvqfKl9HTPuSJ+nP/l9SIZ0G5WbCcpPZ?=
 =?us-ascii?Q?QrdjqKc1cO30FlhE6yrmJdJS0eqelLSogY2GlSeSSOQ7z9SiP1k+Yvh/N3GF?=
 =?us-ascii?Q?hYCkrt/Z6egc3hmQIiQ0viAzwjki+B8FMdXFaYgnGLq0s1J4sFI4DaL4v73Q?=
 =?us-ascii?Q?EIiL62ocf3UFCKb3BZt42G834+xb8bwnbz74g9XTE5wQNzPxfII5z39n+zlS?=
 =?us-ascii?Q?NxI5ZowKJMbHVzllaxuCU5aE8UGFjWpQYlzE77bwIjam9ByQKjLEq7pTBOHp?=
 =?us-ascii?Q?JJ7KX31Z5Gj9dfYHDDE1YrnFcxizEdLrCxLsWw4tSRV+dW28QkGVvSQnobsC?=
 =?us-ascii?Q?W9rqtlSi7c+yhiR/ibl8pAXfkG0t2gHlfzMd1l1R3YrwC8BLMwSHMCB3kc87?=
 =?us-ascii?Q?kYhDeQtKfhzVafg4T3XFpsNPBRF0M6wfRYroVPdRT3nKhyXQ9TQjwMG+ixEh?=
 =?us-ascii?Q?eoNAFjVqikjblsjz6eq4+NecKbEHR4NeJtmdC/J7ffFtkc779LxHFUA432D8?=
 =?us-ascii?Q?1gjjeMnrJRKBefLSf04qx7D/VWP0krM3ImVZBfmG0mTp5V2No3I8aY3HVmtk?=
 =?us-ascii?Q?zfkrn4gH7H8XdnRo7lMXOttHrUTjWFwBTmZ4bIRFppX1EYrBPHAesbj9Xqog?=
 =?us-ascii?Q?E9Zjk1zF7r/xIOP+sp9CXgAc3WR382e2tuBYGtP0cXahAZYCX3Ypsx22p8pl?=
 =?us-ascii?Q?l2q2KH6onZHrGHTrhCukbBeP6+o2wMxu7QLyWiANRzEbtpsDQRJPGSx4QAPi?=
 =?us-ascii?Q?uoAJUfjb+4n21ewxtls3Nu+4wql1Kv1a7hVPjfolK67oLoFKu0Nv+dIvRll8?=
 =?us-ascii?Q?xAcjKwsz2/QU3zEaCGV+R0H06R0o7OpsYI/nO63eWGwShkMkrJ95OdT3q6RL?=
 =?us-ascii?Q?fQVrEUax3w0L1yyqXtv8FHpJHs6HBLP7/6JMcOk6BD7YJAV6vrnLr6FEbYRS?=
 =?us-ascii?Q?QMYAr+Y2zFM8zJlQodRsJE0qgLRzxKf85TGTYknfe3Ser18dyfndpGVozEX/?=
 =?us-ascii?Q?toLOMBPEzSRgrC0RBO7vhmT3vdDlACfdDjcQpZSyhcUMsz9dFokSNLflt/5J?=
 =?us-ascii?Q?CBXxuvSs9oscbJXtAllWZ3TGUOBE/PNHSkQnT7zztRZhvvjekUXYsfueUtwx?=
 =?us-ascii?Q?xlIky/bFFCkHuRmW8rkL/1x/c/IE/UirZsWBISCjWgPpnbfbplBqtwfW1PRh?=
 =?us-ascii?Q?ttDMw0j2KjW+n1o/Dxrws1btxg5UFB6pJViPj0D2HMBSe7hvImjo355S87AB?=
 =?us-ascii?Q?rnKX0JS/QJLrukpYwTaAPzGstwXx6qwAzo0yxcEtg0YUtMGUHsqkNfV+YAtQ?=
 =?us-ascii?Q?6q8nR5CkjtOH9uJbq/WtFn55igYf9uR+nLoA99lJysLKEicZU4BdCckxIwW3?=
 =?us-ascii?Q?vI5K9n9vRoYrPMZDcHFv2NQshXJD2zFvWzjuKbsrHa7TgpY7v6dNREodOej+?=
 =?us-ascii?Q?TdCvjJVuwEC1Mj7Qvw83BcBKd/xoiIUANbWKVLhpH0/6Gt+E6xhMw1xPn6aD?=
 =?us-ascii?Q?5QHjZr/VFUARfabQ/HyJhL6eMJ/zO4eTVF+KlJHA85D05jGhfBzqIIp8DCWG?=
 =?us-ascii?Q?7eRDP7YIdDIlB+eNt0BTkaJNdaTriu0ZfzA4TPnZCwbkyEzXP8AKFP5FXNn5?=
 =?us-ascii?Q?eA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eaf98ac-0488-4e7d-3c8f-08dd8b0aa8a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 12:53:25.1545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/e7FRBoDtqcnz45blAvyInryKPqpxGImPko6jwqeqmGTdiiAVqCqZ2X/9UJT3DwpFFUXmuyM3nJssbGGh1Z+vIIOnfKuITbtOZiL7bm78w=
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
> Subject: [PATCH v4 12/15] drm: renesas: rz-du: mipi_dsi: Add dphy_late_in=
it() callback for RZ/V2H(P)
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to al=
low additional D-PHY register
> configurations after enabling data and clock lanes. This is required for =
the RZ/V2H(P) SoC but not for
> the RZ/G2L SoC.
>=20
> Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined, =
ensuring SoC-specific
> initialization is performed only when necessary.
>=20
> This change prepares for RZ/V2H(P) SoC support while maintaining compatib=
ility with existing
> platforms.
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
> - No changes
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu=
/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> index 8c7384b95411..66eef39af35e 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -35,6 +35,7 @@ struct rzg2l_mipi_dsi;
>=20
>  struct rzg2l_mipi_dsi_hw_info {
>  	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
> +	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
> @@ -318,6 +319,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_d=
si *dsi,
>  	txsetr =3D TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLE=
N;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
>=20
> +	if (dsi->info->dphy_late_init)
> +		dsi->info->dphy_late_init(dsi);
> +
>  	hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	/*
>  	 * Global timings characteristic depends on high speed Clock Frequency
> --
> 2.49.0

