Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3729FAC999E
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 08:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977AB10E8BD;
	Sat, 31 May 2025 06:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ymlt99yG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67A10E0E2
 for <dri-devel@lists.freedesktop.org>; Sat, 31 May 2025 06:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCtkLowKwV6BvcvgcIGzMiwu7b7WHUIHuZRXQLxbtn3pH3VBvESbpZdSyDoknVoFCABrGJjhnkp2YYOdd+nMqjrCRKErG+GfQ1mIqlx0cUhijldHvG6RCBVo5zJSDnZobvV5+IR1G6Ei+dFeNFrNjurpyX8kSPlmNOtXf6OhK28/KvSq6/te8YOtdDHkpQW/ugZNQ8m8/nW8AC2zThfS7iiDHxgLzO40chwQugIrU3AgQBaelEpR01+uClfhhmA3VHRfdZIGdmupJDF0Ibz5rQa9Y8IzWsrZ3/N6m7yzl/YaRnjKM3487Vu4enf+/w36orBO3G6NpvnuOl2ISOhZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hm9MW2Meq8uwzz913t7DXqTloxItHenM5RpTmGagaQs=;
 b=swrUdnrnGtRKUpTjChddFz7H54UIJtLA3BxbeGCT6dLgA0ZQPR/maWW23ltw6fablWIBvb+gBUAHeURBDsyYJMwkwaAbj8MlZtykYwiOITkB7tICx1qke9agnja9+z3fVhi56L+SPy+MLqupJugagZd2Glo9+7DHDljKeMTQ2Zvg2VJruJ/tzOr7ui+xpx4B1Fl1r4Vj1QhYeo/dRA28dTby9xD2IcTvltCfVwcYP2Cg54XTxV79YIOvkYwqh3nR+P80WRsILZ6DC3s9yQFGO8qXM7FGyjQhThjMqXHmLnRNtvTSP0rWLZ/o4fa2B/vfEY62YjIwdHdL5/VZRIY02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hm9MW2Meq8uwzz913t7DXqTloxItHenM5RpTmGagaQs=;
 b=Ymlt99yGX/8CrLhpE2UcgTrr+2T9+FTq+5NoxodVi1i9TTmgBzTGqEyP94GD4xZqXJK+sa7/oQ/VBEBEuPeysjrEzA6msfjqiFq1hiqRE86H+4jvHgs/EXUsE0amMaLmTJV2NtdjH/IK4uH0yObOT29OZ+pQEVYH91LmsPXDiO8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13441.jpnprd01.prod.outlook.com (2603:1096:604:334::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Sat, 31 May
 2025 06:36:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8769.033; Sat, 31 May 2025
 06:36:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P)
 SoC
Thread-Topic: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P)
 SoC
Thread-Index: AQHb0YQuCAjBL7UzmU+YPCzxy3tHnLPsSVEg
Date: Sat, 31 May 2025 06:36:21 +0000
Message-ID: <TY3PR01MB11346673EBBFD1FB88D29E51B8660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250530165906.411144-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13441:EE_
x-ms-office365-filtering-correlation-id: 633e6ce7-2419-4618-2587-08dda00d754d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Upxu+FBkNIV9j/496SRalZpJs0yhhOEvPBayAcsB3Pb70Kt73IvLvHaozsbs?=
 =?us-ascii?Q?+RP/pHiMGyHXKLTTRE3dGQdDjTtHsDwxVyF/CZkjeWGlaF9P08RPdIoGho73?=
 =?us-ascii?Q?KfRxnIdxPInQO4vPvtDlbeBQFOCmsoxSUwT4yC4oH0z9xKWN4Ol7reSkUknJ?=
 =?us-ascii?Q?paTJDFg54zaQi9vvrKuwtpEP5PtvzTWK3shRFdRUIprsGS9IDyt0kVdvtqKk?=
 =?us-ascii?Q?8VGkDx5RHrLUcvYz73ebLOtlZxE4owXhKlnd1h8J2IkYN/bw0sHPYgkdqfa8?=
 =?us-ascii?Q?bxHL+7pfIAZnhuVsgBzKPnNZdlpnDYTzp3DmU+Csxy6CCJxc4Omu+MQD+vKH?=
 =?us-ascii?Q?ITFN5bENpWSOmEp6AcsdvS3EpJQXdsoQVeuyICDXbq2kz44eh3lurliyzquq?=
 =?us-ascii?Q?/emLwqIxptruI/wtvm+kzOYJzRYkRmXVNG6hRAXAnDn2mc/YxP/FhilOqsPy?=
 =?us-ascii?Q?60U6TKIW1r6du9OupKpFgZPcwpexSrlZckYG67PQwDfRSBrH1+YWSrVwCsPP?=
 =?us-ascii?Q?1kKwrB9YA0AwH7ljiWlFBUGm9ENqnKEq/E0Mgo4zQkxl8bP1XBbzrqItKhjn?=
 =?us-ascii?Q?SGF6LXQZ8ZyipEZCYxAC/ermjS333iNNmRQfOgJca4G59tyv0SL4UGlqZxbn?=
 =?us-ascii?Q?yBavbhRnSgenYv96Aj4JzDHxmnR67T80TOhUVh7zObTu3sO5CWwLg/qJJPLJ?=
 =?us-ascii?Q?QUr8TnGQW5cg3gIxMVI14MXtvcS3SiRVt6xNaUIy6B0g7ASsP4twRpUZR6LL?=
 =?us-ascii?Q?nqLs/Hbqx77J8wDemY8VcBRID3VEL0Q/zt2waVN4yjGrPgfzoeJLIf8GCzDA?=
 =?us-ascii?Q?IIu+WchDJNs+PsMPnjlrUU8KON0ECHbmyU1Hb/G/AH6Nuk/vigvmTZ7y+N71?=
 =?us-ascii?Q?hFLXKerCExO1W/Pzgurwb7PEvtp88Iy03rLQweedjyVe3kV/wsn762loCnbm?=
 =?us-ascii?Q?c2sSrTapSoybJ0+nFey0OrVQdcOM+cP9fw0sOqhfEr5J4xy42JGkoUzZ/iG7?=
 =?us-ascii?Q?J60unsVTCOv2+/6fZCnRnSZ8zz3S50jRT0nLKSLO4ZfLMmeB/P/mvW/gUQu6?=
 =?us-ascii?Q?UzhyIeixHBHzIsl7Vd4j5vW3ybMNOrzOKXvzWI5ImBGn9pcQ1/C03OrkGA9N?=
 =?us-ascii?Q?7BhnV6SRAFUnq8mRCgSWHnu8gzKpopYozlHdKoIpGz0pBGR9gg0jef37Zvqr?=
 =?us-ascii?Q?zft1pzAAKOS4F56MXR+/IRoQE4vkLLFV4LQg93wETA9dfW3h8UFwqf1SN3C8?=
 =?us-ascii?Q?vdUbWRS8a6zDPiQZiR9DNtSuQcGM+yjix/pXmfz7+5gNupn20C5Lz6wPZpHl?=
 =?us-ascii?Q?3kGR0f0AuK0a09gz1yJADmWsmAljYhGjXCRZUgzB0YOE/acrksBwKgwbNohI?=
 =?us-ascii?Q?VKo++VF//7roy0ULXFw8CNGTukZNwMewQyf8gKOFBFSAjWxLFkGKF0/BcIaG?=
 =?us-ascii?Q?DcASldkzNdXqrhhfxEuBVjHX8c5nV4tJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SXUwQ/l3AMc7GD0V50H8WgRmS8zN4HPs7CSByu+dhZiM/AIeojQDjkIEEfwb?=
 =?us-ascii?Q?A8Ve1loHbQ6Pyck0K+fDQqABT11as5+A2DGsv2yXgfOByV+ce/PUaVj1Y1Xs?=
 =?us-ascii?Q?wCLqNOdnpxP53fxt47YVmSAwlnarzIGqJMewHZzEKErIi3oKzBjw00xFaX43?=
 =?us-ascii?Q?AKh1NgkOKa0rdxGdNr5y9NLWESjRAMAq+BU4xbTqdUVDwR52TEoOCTGML+5M?=
 =?us-ascii?Q?Abu3serGoqc+o/0Uxqr8+ACot441m5l/CdGb10jo518+Hw4afFGZCEdrbIbu?=
 =?us-ascii?Q?bw6TPB/2ZbdSnAPkguaZsGWL5qs77A8rDtHi3Z9oYWUOq1HhKADKBsZullE/?=
 =?us-ascii?Q?LkvM6oarvyHJRq2Mx2ls1gWX1Rm43qUJPl/9DNdp3hIa0q6Ph6owM696zbyT?=
 =?us-ascii?Q?PtcH/LpOZLf+5PEN0sEyX65el+lfIvyCNQMdZGQtxLQp30tGImuphydK093w?=
 =?us-ascii?Q?4m3euS1B/3vuHNMZIk8xLPNFJ1dUOFcFoWeLDRtiY2r5UrhrbFr21nWqkC5i?=
 =?us-ascii?Q?HYx+fX0N5z45dodQoUeJ0wTkjJ/H9KLEDc8iJp6L8pjGj+CJsIIlUFl0xJdi?=
 =?us-ascii?Q?EQTzKPqWGDz4JLWmMJqo1mrBMUBydSnIQVUZ7w1bVCnAgtgJ/qzKuB6T/vGK?=
 =?us-ascii?Q?9a4RpwnOLBCAI1R0/VNJPUNM/z61YjlD5Xad996avuHsWE/N8l9Zk/Mf3VpZ?=
 =?us-ascii?Q?OsM5LmrlrxC3ZcNqfouMoeK70iTh+xVfUbe/9VlPKe+3cYUI67UNzqsZpJmO?=
 =?us-ascii?Q?NRzNtzfj/FQ3q2yk1vMbgv8yp6D1KhHq+09BrkzhJJfOOOrWIyU6UJBz7woY?=
 =?us-ascii?Q?sAUGxHtI/63dcMHXwN7W+JYrOM6e8i/AF7hREyOw0t2SO3H/9CMcsXH1FTWe?=
 =?us-ascii?Q?B7KMV89BQvYmWgpVgwUZWhxJmIn0kAXWBffyket08bhdvx/ol8yISz4IYen/?=
 =?us-ascii?Q?nnoIcq1+EzlaqxrfPHcTFmSGUzRx0QkmLjLi2tFwF8+ZVSslfPQ8Fx6pezfq?=
 =?us-ascii?Q?A/llvG+0cL1uZWKNT9Qm8puTsqFEC9ChuDV6DEWHUNGwYxuqncNNh1kFN4JT?=
 =?us-ascii?Q?p+iMtkAyob3ThP2fAHexZR5Pu39qP8HAwp/g+13KEDfM9uCOQBz5zfsusH0Q?=
 =?us-ascii?Q?PnQqlF96cLt3XNShO7w3gP61MwOkTCDenbGm8RL+mqxO9ngDRi1XtbEIF9+R?=
 =?us-ascii?Q?Hce+R99BH8sNT3d7SLESc4KBeoUNCNSQTBijEBH0J3gYmooXpVzExoF5TniV?=
 =?us-ascii?Q?vA1De4XVGRsQLK/okmZq2zBS9wVOwWN0U9l0JHwOXA/y0z/JziI18jsWWFFR?=
 =?us-ascii?Q?nDycfyjCt0hoZujMwCGQGiSZ+48Coit5JLVFrCxCf7l5vaPeum8SrtVH7KpN?=
 =?us-ascii?Q?bQvxv3czpGguHem/Ivwx4lAER0INflxas5kXyk1lxfCWndOkuZRodD57b0vJ?=
 =?us-ascii?Q?yTmAxj1rvuNCWCR8z8yLkSxzzw1GMGefwgG4yErBUN6FVsQ244EJF7gnaB54?=
 =?us-ascii?Q?E5eMm53AEnDSRhy2TDqu96Fr9tBBPq7/Qndz0L5fhoVuXOgp8EECz4ADVkWo?=
 =?us-ascii?Q?8v45KwGF/MDmfI7DRlzdA2qL1UyMoRi9JMQYijvqKDP7tYGER1ekUk7eZeyE?=
 =?us-ascii?Q?5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633e6ce7-2419-4618-2587-08dda00d754d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2025 06:36:21.9388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1sQKHTZb2fHaIIIeWKfmzf1JJ6HPzNuy4RRTwzGNDOerQVpdXBwQ0FhtxfhNisP/CVGfZXPc3JgGIlcA3E9VjZau/g77el3vpnggcCVhkIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13441
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
> Sent: 30 May 2025 17:59
> Subject: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) =
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
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

This patch is already applied in drm-misc-next [1]
[1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1f957fbb88b61eaf=
5ac9bf2db6bc2e54121a4359

Cheers,
Biju

> ---
> v5->v6:
> - Added reviewed tag from Laurent
>=20
> v4->v5:
> - Added reviewed tag from Biju
>=20
> v3->v4:
> - No changes
>=20
> v2->v3:
> - No changes
>=20
> v1->v2:
> - No changes
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

