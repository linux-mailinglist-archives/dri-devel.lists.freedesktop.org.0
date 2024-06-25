Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C991681D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C3610E09F;
	Tue, 25 Jun 2024 12:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FuHTTNzW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2040.outbound.protection.outlook.com [40.107.113.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C825310E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwQaLE2gaN80iqpeLhWVMJRP/acN5ULBZPE20udq3RoiFOQr3xX2jc+TbXpXb3ajvFgfxj2fjP6zmM41Gv8wetisfX1U369r0Te2tmHVtu/iJcfUg66o8/8XXBIYCV3AFgosoiPbKlRWtkejB8WxG0cnmyVGGWHMp/wdYVpngWsokRRAK2oa7YxPvn4kZWz7LnpqPSyOlXrgOc9fH92SFAjGtVygGQaFKFwKEfOu9wbZQ8299cVNIgr/4JvPBxAMz+lyI28dMtx52/O4TRT5t1Lh2Hzgu4O3f9hGnv4O9wA0wg9dmJfoevNVO0BJbX0N8sxxck0wetcAilfQ0LX1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypUPVq0fmbInMysEF8fF9meeqCnqRTdCiW7yE3ZxH4E=;
 b=iBGoa5lEnKmuRUCFlpVgXOv77VY5FskIqatWsZRB4KNkc+1jJ6Chqisp6/y4KuabDEoKXuZLzHV14/XKMfa29N3LXJR8iSqHb3ucIl7g5zPrvA0YF2ZHBVURbrkclLRJNlMMTx5PXQpKocEoczV/Zxl4xVA7sC33fX6bksJRzYrwfjMnX4MqZU8KCQ6aBDTrmDnCOCY2x0i4mRRv4+ceFgRCLXLHaOCSnP+x0qggeil9XJtiKhaYQtymJm7EZLNsG3Z7U7vRLLwzaxEgJRBfygsYHBMt5eREf0i7GuVt7H2mrVNSY38qIgrtjmdpX77Fe0kXQzYDEeSnhhnr6qxjWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypUPVq0fmbInMysEF8fF9meeqCnqRTdCiW7yE3ZxH4E=;
 b=FuHTTNzWUTjKHxiLjkiahkOOopuKo01OMzVh/qY3poNTSMMStORrObCgREwtNsQ37h/qSHTV+IiUzMopjUA0tU3c1uRYsTAPhnH83W62w2Yh2vIbWur7fSwM0B4xZeAPTm7v1XK7AqHhu4o1191jkFjRCaM3iGm6ekZcH7wtRGo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7364.jpnprd01.prod.outlook.com (2603:1096:400:f4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 12:39:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 12:39:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Thread-Topic: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Thread-Index: AQHaxvvrCVUVLwgOH0e6KnciNkV+R7HYayTg
Date: Tue, 25 Jun 2024 12:39:31 +0000
Message-ID: <TY3PR01MB113468719006B031B20997B0B86D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7364:EE_
x-ms-office365-filtering-correlation-id: 8c89d83d-e6b8-4253-6fe8-08dc9513dca2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|7416011|376011|38070700015|921017; 
x-microsoft-antispam-message-info: =?us-ascii?Q?3+/tX6/M2ZAqp/bpInGn9vC/bt30+ttBSijPZryrfrplgH17hFBeGC66yUF/?=
 =?us-ascii?Q?/gl8GSnO5NIG9vEcV6w+EuDIwsiBM/sEBrdMl2/VdKXGX3TuNNkUD6lu894Y?=
 =?us-ascii?Q?NqLeQZ39vg0rQIfXDwvzF3vPlp5SYh6JjV05LDWkZjnx+PlIsl2VMlJ7REsf?=
 =?us-ascii?Q?Eo4229xNkEFC6Zqqth7w4Y4saOzP3mjtKq6GwDvShMp4xRf/FYFYo7SWuF5T?=
 =?us-ascii?Q?0SqZiE55aD11+eImE9P+aDnISuKVuRjs+bErny1JmehxW/8AY+8AFdoASmMu?=
 =?us-ascii?Q?H/17r86x4mgdTwRQCxBIR3Bf1g6eZCEld/nkpuNAO1aekrV/sK0mLRvWtC/n?=
 =?us-ascii?Q?LaemDVG7dN1hoKh9JuvRjDoUS8mLTaLt2LFlmVCxTbQtvikLaLiQ10pxuCWi?=
 =?us-ascii?Q?THHAulY7Vu3nxhnCSdYYKgO5dUV3WQOdbr7YsAZY9LdjHLIQAZemhkHOcvh7?=
 =?us-ascii?Q?jgxhTZ9tG2YR7uksR/x5oT7XBvpuz0ubHl4UgOmQvz0U0cyBZ2pQDgVrVsmR?=
 =?us-ascii?Q?2vIlh4RVcPyCr0PG7j6Wu60MWascqEa3m5hgclGBUmAVDvqfY+QtKxFNjJ1Y?=
 =?us-ascii?Q?E+ot2a+sLBSdU+XVkrYnr1YJZavgM/zgsHAZ8hQUgdWGWVF/QyAJK9O5DyR/?=
 =?us-ascii?Q?5RV6FOyPwjyHGCTHEo4iVmobKm7A1F9eVJWAIiZIs+hLpTjvYdbeFvqF/e/I?=
 =?us-ascii?Q?PvRcZqPWwfLl0ApWPSWkk9F1ejLzvle36tYru1n6oB6f2KaP8Oc74iZ3bWFp?=
 =?us-ascii?Q?uPxSUAS1OIxMnHInsgsaTvz5X8NrFVtVjNO9dkM7ac4f+pNNxd4OY9rZxNAA?=
 =?us-ascii?Q?Cu0+AvuDmRL0tDJkDeOeN130W7zd8Wzk1DCCw9qSMhrB4DuTvIDRw4a/mz5g?=
 =?us-ascii?Q?gtsGp2UgyRGQiNqmkzaNY9t86Zehdde0KbSY1ZQiMARdAasA9T3lzzDN0/bn?=
 =?us-ascii?Q?te8cfnp9STIoMLINNzb1jVG2PRkxRPEyTFynS5uS26fIhicSO/ncR1Jds3gm?=
 =?us-ascii?Q?n9eYYtVoIw5zK/7FZ5WWL3VG6n0lgs+prkFA6KVq7vG90k/xpv6x89i2ysxt?=
 =?us-ascii?Q?5H1tmcBtAemMD9Q7J2I6WLpJUenB+9M1qfMMxdQV7n/6sA+nLX9G1L5zegJL?=
 =?us-ascii?Q?mE6CMrxqDungHVTvmzzUoD+5/saA7DHBKPp3URblx+871qWbrPHc95XX1SQY?=
 =?us-ascii?Q?hdcCBfCzv/xM59D2+WX0YqzOVYPsZ6r9NLasRFWT9ok5YlAqfmn/TO2S3/K5?=
 =?us-ascii?Q?dOVDdJBPv/KEs71hnsVjwf3OwARWqh8oLH+YFx2sRgEmtTYxYLupM4Ih8R+D?=
 =?us-ascii?Q?sOLXa7AOqcOQtxB5d/1TYHMbeD0tUyXXK3wkKaHbcJpUxc6oXWSmuXEAuMO1?=
 =?us-ascii?Q?Dca8E36irj6cxK0jWpVBJ/zis2Gb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(7416011)(376011)(38070700015)(921017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VXoYOHAKaCB92rk0n/UPw+BJcojnCOcYe4CC3R/OTjH544zimdb0kDwdnfGY?=
 =?us-ascii?Q?BpsROIuWOMOqzT0dZIc3thuujkZ+I0Ds8ks+GGyOoX5rPEq71UL/G4kZPdwz?=
 =?us-ascii?Q?bkSZqLZzyuaGZN92JQLx4bVx35xPLKNHcQT9+HXIGQL9+Rn5P9dcpCpTut2f?=
 =?us-ascii?Q?1TNVTt+cSK20GVN8nEkO8tfJG/F3KIGI2P1gBJ227Z7ikpF4t7pRXH2uS6gX?=
 =?us-ascii?Q?6Y/aaJJn7vMUE5FAYUxZTPEjoyzKaBsNwpXo6dk2Aa9izG+JaWBGiCr169Di?=
 =?us-ascii?Q?VVqV9LfEcIfT+ZeOOOL8EHhdNkYB1gKSS3Cdc8NGIk2q3rDLIen0Y1mMjyjU?=
 =?us-ascii?Q?yeYX5mJ/WdmK2sxeXQZsRCiO79M4D4o0gU+oiXqxXvFJAYkQOz2dCiyq0/f8?=
 =?us-ascii?Q?yUDBDwprCnOdqddLDLsYKOAU6ZQu72Zgwi9ePD5jnYGfQWgqejqo2GID5DS7?=
 =?us-ascii?Q?apX5fQ1Vf/TD1RX+ORHBy0B8qUKo3kkNSQeMp8h6t76ga/zfmwbF/+Vm8f+7?=
 =?us-ascii?Q?YOXSZs8bsl5vOlvNT/XyugXPwORucqXfKWtfBScWlQ0LkcgMZUMnSZ+xVOph?=
 =?us-ascii?Q?aRkLATdNzbZ+qVwG7Qbl5d04Lp6ttn9q66kII013K7EKBFeqcIgszCT5eOYe?=
 =?us-ascii?Q?/5ij1o5HHswFlSQ6yoiUCiRZAnGacveTCzGlboYB06YAMttl5VBfEqLC2NHm?=
 =?us-ascii?Q?ym4dZMaj7fq+ypmvhKLn8GHArqWHUcOiPTOoAymDagafVdArhFB4W/05hk4s?=
 =?us-ascii?Q?n55VGrq4Mx4e56dfxr7NVuYM52E1dkek1SL+WGUB9k1Fk/hMdmUCRQzcqScP?=
 =?us-ascii?Q?u/MTTBbTe6G0wU5+aPNaDV5UjeetPZI/Az0RmTgB0bp1xwDW6ECz1TCP2XgP?=
 =?us-ascii?Q?1k6u8l87Kz5GNk3R03LsCQF05Q8CAOVhCDcZY/rGSCjt9z9eobdqYkszQcDM?=
 =?us-ascii?Q?cZMH1RK2+9tHC+UCHTKvQC5/x0vR5xZCr4uRnoIyawFQwej4w4DwjQCLzAtQ?=
 =?us-ascii?Q?AHRo7J1px9sxIurclP2fH4Zu7AuvssRZ9LHPC6gn9tVI3i5YvAow4YSewQhE?=
 =?us-ascii?Q?MJvAD19T51I3UDuWjaukrPi7FOS3vFYvh38GUqcvQ9nhSehVJ7brywotCS9w?=
 =?us-ascii?Q?9hgyzy6iBlWpHKCv+9NMyRfTk1uTIs9/8+pGbuCGMs//aSZfsXuVLzqtT30o?=
 =?us-ascii?Q?tUejPxjY9gTKFWEq67nXFuwtl1ajlGr49ZIepaBDLoU3YRENXJ+RG+wFpDXB?=
 =?us-ascii?Q?mbfTBireQRIxtIVz4fIFHU69MxidVqd6EcKvByHzsPm1sL1khxKiuCi9fK2U?=
 =?us-ascii?Q?VqFyY/yIFv+jWtH31J54/EMVkp3uE/+iI8ODAbqvTLRpv4UYFiUGYH4FeIWf?=
 =?us-ascii?Q?Vcvh8Pla9h5/TV7lkq2ZAd3F+Dg9ZoqfnnbFo7ngxK69ECP0u8wIwm2wYdHy?=
 =?us-ascii?Q?sNOQMDM2f5SviPz5+sQeryGqlSGBuaKheGSYSQEHteQtztxKFoL0X7XQhZCv?=
 =?us-ascii?Q?55xoX0H174Kl3a/AAYHaqlWV9d54hlYpE2P+4TSJM3XtDpB9RXi+g7QNhIb2?=
 =?us-ascii?Q?bAcH4o9XQBWASHo21JKVUON1ujJ41NeSYxOzrt9KawnXS5B2tia2NDVchqyG?=
 =?us-ascii?Q?uw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c89d83d-e6b8-4253-6fe8-08dc9513dca2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 12:39:31.8095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGoOkmR7lnMSPnnUQC9rX7xfYTlh8+Rvv6MQ85mTkoZmt2IJu0JHpYMt/yz0qMmpKxeLLJXfOn/x+09Vehmstbx5SNOkjNzXkKNt0Wjrnt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7364
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
> Sent: Tuesday, June 25, 2024 1:33 PM
> Subject: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> All the RZ/G2L DU specific components are located under the rz-du folder,=
 so it makes sense to move
> the RZ/G2L MIPI DSI driver there instead of keeping it in the rcar-du fol=
der. This change improves
> the organization and modularity of the driver configuration by grouping r=
elated settings together.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>


Acked-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig                   | 8 --------
>  drivers/gpu/drm/renesas/rcar-du/Makefile                  | 2 --
>  drivers/gpu/drm/renesas/rz-du/Kconfig                     | 8 ++++++++
>  drivers/gpu/drm/renesas/rz-du/Makefile                    | 2 ++
>  .../gpu/drm/renesas/{rcar-du =3D> rz-du}/rzg2l_mipi_dsi.c   | 0
>  .../drm/renesas/{rcar-du =3D> rz-du}/rzg2l_mipi_dsi_regs.h  | 0
>  6 files changed, 10 insertions(+), 10 deletions(-)  rename drivers/gpu/d=
rm/renesas/{rcar-du =3D> rz-
> du}/rzg2l_mipi_dsi.c (100%)  rename drivers/gpu/drm/renesas/{rcar-du =3D>=
 rz-
> du}/rzg2l_mipi_dsi_regs.h (100%)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/re=
nesas/rcar-du/Kconfig
> index 53c356aed5d5..39af73cf2092 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -60,14 +60,6 @@ config DRM_RCAR_MIPI_DSI
>  	select DRM_MIPI_DSI
>  	select RESET_CONTROLLER
>=20
> -config DRM_RZG2L_MIPI_DSI
> -	tristate "RZ/G2L MIPI DSI Encoder Support"
> -	depends on DRM && DRM_BRIDGE && OF
> -	depends on ARCH_RENESAS || COMPILE_TEST
> -	select DRM_MIPI_DSI
> -	help
> -	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders=
.
> -
>  config DRM_RCAR_VSP
>  	bool "R-Car DU VSP Compositor Support" if ARM
>  	default y if ARM64
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Makefile b/drivers/gpu/drm/r=
enesas/rcar-du/Makefile
> index b8f2c82651d9..6f132325c8b7 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rcar-du/Makefile
> @@ -14,5 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+=3D rcar-du-drm.o
>  obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+=3D rcar_dw_hdmi.o
>  obj-$(CONFIG_DRM_RCAR_LVDS)		+=3D rcar_lvds.o
>  obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+=3D rcar_mipi_dsi.o
> -
> -obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/rene=
sas/rz-du/Kconfig
> index 5f0db2c5fee6..8ec14271ebba 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -10,3 +10,11 @@ config DRM_RZG2L_DU
>  	help
>  	  Choose this option if you have an RZ/G2L alike chipset.
>  	  If M is selected the module will be called rzg2l-du-drm.
> +
> +config DRM_RZG2L_MIPI_DSI
> +	tristate "RZ/G2L MIPI DSI Encoder Support"
> +	depends on DRM && DRM_BRIDGE && OF
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select DRM_MIPI_DSI
> +	help
> +	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders=
.
> diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/ren=
esas/rz-du/Makefile
> index 663b82a2577f..2987900ea6b6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Makefile
> +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> @@ -6,3 +6,5 @@ rzg2l-du-drm-y :=3D rzg2l_du_crtc.o \
>=20
>  rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+=3D rzg2l_du_vsp.o
>  obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
> +
> +obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+=3D rzg2l_mipi_dsi.o
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> du/rzg2l_mipi_dsi.c
> similarity index 100%
> rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
> rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h b/driv=
ers/gpu/drm/renesas/rz-
> du/rzg2l_mipi_dsi_regs.h
> similarity index 100%
> rename from drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi_regs.h
> rename to drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> --
> 2.34.1

