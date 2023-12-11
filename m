Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0E80C912
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 13:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F6310E0E1;
	Mon, 11 Dec 2023 12:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7855E10E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 12:10:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aj/VAqfhFJX09y01cG+FOvSXq1H3MtKBW7D6E/t1yLFkac0YJrNtnqj7qP4tu20K0LyMPk4pwZNjXAxWXJuz7DmAJCGlmXHjgBOfOGiOdGwfn85Mjvx3FpujC5Wlzm+3AL2WDVYdbJPv97a4uhOxop6d1hOehYTJTNtaRU94C7WZP1IZPoiBGpEzIyoSyNFwsGzhUecKUh3MsLXo+zX+NtuDYA1dbx+yQ9eyxVChIJO6lxT9uFx0OOraXD1alJ7pyMa5VNk3xTNl9R3byBMYIY4mVFhI9j697SoIe7RUJSkZU2bL3qQY7VGpwp7gXAXlVdudB57ZqhfSgOx9B0GT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly/d/TdwIM2cCyKDMDmiSXsdOGnIBFs63YM3iMOmXLc=;
 b=bfI55qr/xvRujqTZnSz7SQtsRb6AWnxMg1mXRr9un82KN1MXRkqB3wMvKB4jTIUej7aYGL00VhR3gbXwySAtzDTAMvzvAhsrHUEQdyjs1av9cNRWcfDZrC0H6R8kCvB4OKqoWHhNYd5ENP24JYkl4cUgBD/xPVRCQUy112mL98HL31Tz7nj9fbGxZqXIrSTRmPqrnCVbudB8a4AoD+q+L06Nt3ih8nHu6eWTf7ImBdRqyP2nHKuHcxFpebNwx4jrj8C8gnDkgvWZAY54ha+YOgZaee+7Ox9oOT8JAHk9hR3RVm/JvtyQzKJfNCtUvwhfA/2Heifh+lYOlfolFELTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ly/d/TdwIM2cCyKDMDmiSXsdOGnIBFs63YM3iMOmXLc=;
 b=JPnrnZaq/5Yrci5jHj6/b1PeeKekkUwTQANUB9UeYuJm/cQNAbGE74I1dhKz6wBSl9mLaR+Ow/jyNhl3Kn2ec+Wm7J8DREAxZS7ukM+iZQCvMt2kXVT2K9ighZX7tsuR9dYj3LfpFvu327e+to0yqJgUKHwLCYupGr4hKWLSNgc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9741.jpnprd01.prod.outlook.com
 (2603:1096:400:233::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.23; Mon, 11 Dec
 2023 12:10:36 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 12:10:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: RE: [PATCH v15 0/5] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit support
Thread-Topic: [PATCH v15 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Thread-Index: AQHaIejdHNUI2Ej89k6b5fWb35pfDbCkETMQ
Date: Mon, 11 Dec 2023 12:10:36 +0000
Message-ID: <TYCPR01MB1126996B6994AF22A00BB7196868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9741:EE_
x-ms-office365-filtering-correlation-id: 7e1a98b9-52ff-438b-20dc-08dbfa422f20
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rI04qX4NKrMMjIwG5mYhAivkFKxYOmKniCi9POpSKfTUkKquB6gh2i1p2oLWSR2DomMJRKOctC59j18Nb/jSXPicWP+6fTlinzXMvB0GHfMrc16qeeWODx5A6j3CI+1tpjgrLyz8QuQ61j2lXHweO2EsUVexMaI71DWzYEVZ6rG8o8lvnslRJQvhrWafLD7kX6QV/r7nWhL4D+VahO27gqxlBz8/ltj/xpEaPM1qV8Zk9Ym7V5+EDEAmvF3GiXYYI1idS/B+YpSb5UHANU3hnix6a+q/241DAcLrYR6yqtoyzq8fq1hjrdN+sJZEnrOjT3ykxC3MgxWEOR54XP2JN1x8DAk5pkkOlItSoDUFjapEzT4RrtWptLm3oXxdzcJOUc8N7Gw+9JjgzbJavj2jXKwiipzZ9DEvOvPaZahPrzdCCr2lIZCusZpnKlRthtlxGHh0xM56VmrAjY1fx9YkaQQNc+oAaLCBNDUZZ4TmPKSx6AJtvWuO7KPOLbMGW0imTp8BtX3C0UqlimeTmG5aq2O4nwhVrNNDtxj0bFx3KM4w75U4/MJQYbtE1ibfBiWMCt2Qy1oPoZMSF4W4g4lRbE9+8xRyhtA7h4ASfJZmbAq5O8yvypq/0BGj6x+nXG7P2LKyt5rururvVZuVNOYAYQEO57HzaGfWfSGI9tZlqgiAmOuVbn2hdC6nGfEMUypF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(39860400002)(396003)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(26005)(6506007)(7696005)(9686003)(71200400001)(53546011)(45080400002)(83380400001)(5660300002)(7416002)(52536014)(64756008)(41300700001)(2906002)(30864003)(4326008)(478600001)(966005)(8676002)(8936002)(66946007)(76116006)(110136005)(66556008)(66446008)(316002)(66476007)(54906003)(122000001)(33656002)(86362001)(38100700002)(38070700009)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CtNHYGPFeUk/Dve88/RJdRf+W8uVXEikVj4XYqwy+h07pqtD+0wsk6VLG5pb?=
 =?us-ascii?Q?SKAZJp7afiSkmRQWeJEaOdQ1aRtALiHhcTQKcIFyG++0EY4QESqx/lwTrbtP?=
 =?us-ascii?Q?upqgr4SKa6URBHUUtausZT9R1VQr2y9VfK++LLtZQyVts/BRxeMd8J3TP5fF?=
 =?us-ascii?Q?cL9NYA2pjdhHuzKcA091CAGq2sxffuI8cQO0L5whXvLDucf62tIBgUteXMbb?=
 =?us-ascii?Q?2HisKz872MavtxorEc6yYJu2GH4ggsX70wFLBQUS1A5bWRkvA+FhrdnWv0Sz?=
 =?us-ascii?Q?S/3XKysw/x1pgV6rPVIs1PzM1Urin8V47ELvChqLA6aNarEbAIA1OVxKw+9z?=
 =?us-ascii?Q?pbjL8uJDGqL9IN6yVGVfqVKA+QEqm0hRkb4shsfeJbXBMCABmY4rAK9TQpLK?=
 =?us-ascii?Q?PuZq0U9jmb7Hm5qkJhaZuNdk8Zl5goQH4iMc9KGtd8jIW3WgtlSCV49KPTM9?=
 =?us-ascii?Q?XDXH9gWP+sEG8T63XbOUCTETVkYlS2OpmJcCwyw5a3U/9c7XMiWcKZU2OL5/?=
 =?us-ascii?Q?5Nwd4WFIFXMtC3fXndZGaBfKbJ5yY5Q3RkdyoC0S00az2IfO22ltBeH60dW/?=
 =?us-ascii?Q?lmHKgCDCEsoQAHpdd2l5ECi0MRAABDyMTrfUcTCMjxgR+BmYdo2WbGfcqM51?=
 =?us-ascii?Q?LLTGQCexb/bFcTBPiczMMbZSJ8Ze+QRN7uDS0N7WWIyD1zl/389TWOJQGGwc?=
 =?us-ascii?Q?WHxBQ+dz7EWjbJwIemIBRZy4/2TWbZI8AT476k2w2z53YhP7tHHbrLgSTcUU?=
 =?us-ascii?Q?tvHJdN6fJSwic94Fktws/bXNkk40n36p0zSChKtMAC6NoevniSbqcAmINcwe?=
 =?us-ascii?Q?wYR/8JrlL9GRrpsTJZzrFLdRuDQ59OezlfN60Sk6zFR7zvxir01gjY2jVcO6?=
 =?us-ascii?Q?Nbx5hL0FhwZEuOXI8cGc4jQTh618PVmw8dNCIFkXaRm7SqqLZadwycuLlomU?=
 =?us-ascii?Q?xwLQbZ9qzZ1Lsu/L7LHSjY1xLSJ1ZIqNor8xHAhNTScv87RCEHYO3rTip8Nt?=
 =?us-ascii?Q?f7UB8Z025tn88NU1l5LU744XPDRdvucckhQK9BnsGMZbHWS1DUJHGTwrxLTT?=
 =?us-ascii?Q?HI4g9c+9b1Qt6LFvPqiUGC5yK0+R5krYEQoRxsc77UDGuYC3XBxlSHiE7KuX?=
 =?us-ascii?Q?/FldI1ZRWm1G9wCWl0leWdZ40J4hZt7QL0WBC5yvSxWkKfO1lx/VFF1QkN86?=
 =?us-ascii?Q?Gdu7vaFGuyOO5mpoXcR1YbqTxawaw2l3OvC7dtc8RBAGlFNNJGP5nUFFiteO?=
 =?us-ascii?Q?0D4Gvb/smf4n/m+4BXCNf6rQdaN4V3EcZB9DfckMW8trM/OZvVV24zuwI/Dl?=
 =?us-ascii?Q?zYLiijrPV+BesrxmIBeaN4taua1ABXWWpl+rcrfBcKS6K4/IxOXVS/U55OB4?=
 =?us-ascii?Q?XT/rZ4AN3TnwmfPCuCwKAGINW8BFeM6SGfTqSOuG47cmCjLL+Ls4xJUfiAVp?=
 =?us-ascii?Q?24eODFIVTnnzg3zwSBA3bFgXHOKY+jRweTuK5CRS5RtZilH9VF8RMLSDklc+?=
 =?us-ascii?Q?1XmkBbt7JgVwO3D3tkW0hkxJuu+393wZkSmhMTUWmKom2kK5dwFNwL7Mzb0d?=
 =?us-ascii?Q?7pSIBaKnX1+cdRG2dm/T1zw2gch5ytNBO7dARs4P54IkbmrgHhcB/5aDyggx?=
 =?us-ascii?Q?ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1a98b9-52ff-438b-20dc-08dbfa422f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 12:10:36.7933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPX9e/Epqkf+u++WHLi62pZV4VZH0Ub+aTmSAIpxXjsrxKY9+oWy/gQk6rweARkkqD/8pYC7wAoHEO9M97D8wfRM+HKUuWJQoekCVFuRCbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9741
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping.=20

Can it be applied to drm-misc-next, if you all are happy with this patch se=
ries?

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, November 28, 2023 10:51 AM
> Subject: [PATCH v15 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit suppor=
t
>=20
> This path series aims to add support for RZ/G2L DU DRM driver.
>=20
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> Video signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
>=20
> The output from DSI is connected to ADV7535.
>=20
> Ref:
https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922717E4CCFE07F3C25FBC9=
86989@OS0PR01MB5922.jpnprd01.prod.outlook.com/#t

>=20
> This patch series is tested with [2]
> [2]

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D74281=
0

>=20
> Test logs kmscube: [3]
> v14->v15:
>  * Added patch#4, The rcar-du has never been maintained in drm-misc. So
>    exclude only this driver from drm-misc. Also, add the tree entry for
>    sh_mobile.
>  * Added drm-misc tree entry.
>  * Sorted the entry(Placed before SHMOBILE)
> v13->v14:
>  * Replaced the label 'error'->'done' in rzg2l_du_vsps_init() as it
>    applies to non-error case as well.
>  * Update the error check condition for rcar_du_vsp_init() to avoid
>    breakage in future, if it returns positive value.
>  * Now SHMOBILE has maintainer entries. So dropped updating
>    DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
>  * Updated comment header and description for maintainer entry patch.
> v12->v13:
>  * Dropped DU_MCR0_DPI_OE and unused macros.
>  * Dropped unneeded backward compatibility with old DTBs as it is new
> driver.
>  * Replaced "cells > 1"-> "cells !=3D 1" in rzg2l_du_vsps_init().
>  * Fixed memory leak in rzg2l_du_vsps_init().
>  * Dropped drm_plane_create_{alpha,zpos,blend_mode}_property().
> v11->v12:
>  * Dropped quotes in ref handle for renesas,vsps property.
>  * Retained tags as it is trivial change.
>  * Replaced rzg2l_du_write()->writel().
> v10->v11:
>  * Replaced CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1 for building
>    rzg2l_du_vsp driver.
>  * Dropped "rzg2l_du_regs.h" instead the relevant definitions defined in
>    .c file.
>  * Dropped setting ditr5 based on latest HW manual 1.3.0/1.4.0
>  * Updated the comment for auto clear.
>  * Replaced writel()->rzg2l_du_write() in rzg2l_du_start_stop().
>  * Dropped CRC related functions as it does not have DISCOM.
>  * Replaced the variable possible_crtcs->possible_outputs in
>    struct rzg2l_du_output_routing.
>  * Updated DMA_BIT_MASK from 40->32.
>  * Dropped unneeded struct drm_bridge from rzg2l_du_drv.h.
>  * Dropped colour keying support as it doesn't have planes.
>  * Added only RGB formats in rzg2l_du_format_infos.
>  * Dropped chroma planes from rzg2l_du_fb_create().
>  * Updated the comment for max_pitch in rzg2l_du_fb_create().
>  * Dropped possible_crtcs check in rzg2l_du_encoders_init().
>  * Dropped additional empty line from struct rzg2l_du_device.
> v9->v10:
>  * patch#1 is mainlined, so dropped from this series.
>  * Added Rb tag from Laurent for the binding patch.
>  * Updated the commit description.
>  * Updated description of the port by dropping the text "specified in
>    Documentation/devicetree/bindings/graph.txt."
>  * Dropped empty endpoint from example.
>  * Dropped ARM64 dependency from Kconfig.
>  * Sorted the configs alphabetically in Kconfig.
>  * Dropped DRM_RCAR_VSP config option and make DRM_RZG2L_DU depend on
>    VIDEO_RENESAS_VSP1.
>  * On rzg2l_du_crtc_set_display_timing() replaced the setting of parent
>    clk rate with dclk rate.
>  * Added rzg2l_du_write() wrapper function.
>  * Updated the comment atomic_begin->atomic_flush.
>  * Dropped .atomic_check and .atomic_begin callback
>  * Renamed __rzg2l_du_crtc_plane_atomic_check->__rzg2l_du_vsp_plane_atomi=
c
>    _check and moved it to rzg2l_du_vsp.c
>  * Added struct clk in rzg2l_du_crtc.h
>  * Dropped the variables mmio_offset,index,vblank_lock,vblank_wait,
>    vblank_count from struct rzg2l_du_crtc.
>  * Replaced the macro to_rzg2l_crtc with static inline functions.
>  * Dropped the unneeded header files clk.h, io.h, mm.h, pm.h, slab.h,
>    wait.h and drm_managed.h from rzg2l_du_drv.c.
>  * Replaced DRM_INFO->drm_info
>  * Dropped the callbacks prime_handle_to_fd, prime_fd_to_handle and
>    gem_prime_mmap.
>  * Replaced the callback remove->remove_new.
>  * Dropped header file wait.h and added forward declarations struct clk
> and
>    rzg2l_du_device from rzg2l_du_drv.h.
>  * Dropped the dsi and dpad0_source variables from struct rzg2l_du_device=
.
>  * Replaced the macro to_rzg2l_encoder with static inline functions.
>  * Dropped header files dma-buf.h and wait.h from rzg2l_du_kms.c.
>  * Dropped struct sg_table and added the scatterlist.h header file in
>    rzg2l_du_vsp.h
>  * Added container_of.h header file, forward declarations struct device
> and
>    struct rzg2l_du_device in rzg2l_du_vsp.h.
> v8->v9:
>  * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1.
>  * Added Rb tag from Laurent and Geert for patch#3.
>  * Dropped reset_control_assert() from error patch for rzg2l_du_crtc_get(=
)
> as
>    suggested by Philipp Zabel.
>  * Added Rb tag from Laurent oatch#5.
>  * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
> v7->v8:
>  * Moved rcar-du and shmobile DRM drivers to renesas specific vendor
> directory.
>  * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
>  * Added Rb tag from Rob for RZ/V2L DU bindings patch.
>  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating rz_du
> folder.
>  * Updated MAINTAINERS entries.
> v6->v7:
>  * Split DU lib and  RZ/G2L du driver as separate patch series as
>    DU support added to more platforms based on RZ/G2L alike SoCs.
>  * Rebased to latest drm-tip.
>  * Added patch #2 for binding support for RZ/V2L DU
>  * Added patch #4 for driver support for RZ/V2L DU
>  * Added patch #5 for SoC DTSI support for RZ/G2L DU
>  * Added patch #6 for SoC DTSI support for RZ/V2L DU
>  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L} SoCs=
.
>  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> v5->v6:
>  * Merged DU lib and RZ/G2L du driver in same patch series
>  * Rebased to latest drm-misc.
>  * Merged patch#1 to RZ/G2L Driver patch.
>  * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
>  * Optimized rzg2l_du_output_name() by removing unsupported outputs.
>=20
> v4->v5:
>  * Added Rb tag from Rob for binding patch.
>  * Started using RCar DU libs(kms, vsp and encoder)
>  * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
>    rcar_du_format_info and rcar_du_encoder.
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-d=
u
>  * started using same compatible for RZ/G2{L,LC}
>  * Removed rzg2l_du_group.h and struct rzg2l_du_group
>  * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
>  * Removed rzg2l_du_group_restart
>  * Updated rzg2l_du_crtc_set_display_timing
>  * Removed mode_valid callback.
>  * Updated rzg2l_du_crtc_create() parameters
>  * Updated compatible
>  * Removed RZG2L_DU_MAX_GROUPS
> V2->v3:
>  * Added new bindings for RZ/G2L DU
>  * Removed indirection and created new DRM driver based on R-Car DU
> v1->v2:
>  * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
>  * Updated commit description for bindings
>  * Removed LCDC references from bindings
>  * Changed clock name from du.0->aclk from bindings
>  * Changed reset name from du.0->du from bindings
>  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
>  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
>  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
>  * Added forward declaration for struct reset_control
>=20
> [1]
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
wor
> k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220312084205.31462=
-
> 2-
> biju.das.jz%40bp.renesas.com%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.renesas=
.co
> m%7C1366ff80247547c90f5608dbefffff15%7C53d82571da1947e49cb4625a166a4a2a%7=
C
> 0%7C0%7C638367655000855154%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
J
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DW29hW=
tb6
> aLweEsamSQBhNkav%2FNEtT77%2BMbwhvfjHZtc%3D&reserved=3D0
>=20
> [3]
> root@smarc-rzv2l:/cip-test-scripts# kmscube Using display 0xaaaad2a6a160
> with EGL version 1.4 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> EGL information:
>   version: "1.4"
>   vendor: "Mesa Project"
>   client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base
> EGL_EXT_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base
> EGL_KHR_client_get_all_proc_addresses EGL_KHR_debug
> EGL_EXT_platform_device EGL_EXT_platform_wayland EGL_KHR_platform_wayland
> EGL_MESA_platform_gbm EGL_KHR_platform_gbm EGL_MESA_platform_surfaceless"
>   display extensions: "EGL_ANDROID_blob_cache EGL_EXT_buffer_age
> EGL_EXT_image_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers
> EGL_KHR_cl_event2 EGL_KHR_config_attribs EGL_KHR_create_context
> EGL_KHR_create_context_no_error EGL_KHR_fence_sync
> EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace
> EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image
> EGL_KHR_gl_texture_3D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_imag=
e
> EGL_KHR_image_base EGL_KHR_image_pixmap EGL_KHR_no_config_context
> EGL_KHR_partial_update EGL_KHR_reusable_sync EGL_KHR_surfaceless_context
> EGL_EXT_pixel_format_float EGL_KHR_wait_sync EGL_MESA_configless_context
> EGL_MESA_drm_image EGL_MESA_image_dma_buf_export EGL_MESA_query_driver
> EGL_WL_bind_wayland_display "
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> OpenGL ES 2.x information:
>   version: "OpenGL ES 3.1 Mesa 21.3.7"
>   shading language version: "OpenGL ES GLSL ES 3.10"
>   vendor: "Panfrost"
>   renderer: "Mali-G31 (Panfrost)"
>   extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays
> GL_EXT_texture_filter_anisotropic GL_EXT_texture_compression_rgtc
> GL_EXT_texture_format_BGRA8888 GL_OES_compressed_ETC1_RGB8_texture
> GL_OES_depth24 GL_OES_element_index_uint GL_OES_fbo_render_mipmap
> GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES_standard_derivatives
> GL_OES_stencil8 GL_OES_texture_3D GL_OES_texture_float
> GL_OES_texture_float_linear GL_OES_texture_half_float
> GL_OES_texture_half_float_linear GL_OES_texture_npot
> GL_OES_vertex_half_float GL_EXT_draw_instanced GL_EXT_texture_sRGB_decode
> GL_OES_EGL_image GL_OES_depth_texture GL_OES_packed_depth_stencil
> GL_EXT_texture_type_2_10_10_10_REV GL_NV_conditional_render
> GL_OES_get_program_binary GL_APPLE_texture_max_level
> GL_EXT_discard_framebuffer GL_EXT_read_format_bgra GL_EXT_frag_depth
> GL_NV_fbo_color_attachments GL_OES_EGL_image_external GL_OES_EGL_sync
> GL_OES_vertex_array_object GL_ANGLE_pack_reverse_row_order
> GL_EXT_occlusion_query_boolean GL_EXT_texture_rg GL_EXT_unpack_subimage
> GL_NV_draw_buffers GL_NV_read_buffer GL_NV_read_depth
> GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_draw_buffers
> GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_texture_compression_astc_ldr
> GL_NV_pixel_buffer_object GL_OES_depth_texture_cube_map
> GL_OES_required_internalformat GL_OES_surfaceless_context
> GL_EXT_color_buffer_float GL_EXT_sRGB_write_control
> GL_EXT_separate_shader_objects GL_EXT_shader_framebuffer_fetch
> GL_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix
> GL_EXT_base_instance GL_EXT_compressed_ETC1_RGB8_sub_texture
> GL_EXT_draw_buffers_indexed GL_EXT_draw_elements_base_vertex
> GL_EXT_gpu_shader5 GL_EXT_primitive_bounding_box GL_EXT_shader_io_blocks
> GL_EXT_texture_border_clamp GL_EXT_texture_buffer GL_EXT_texture_view
> GL_KHR_blend_equation_advanced GL_KHR_blend_equation_advanced_coherent
> GL_KHR_context_flush_control GL_NV_image_formats
> GL_OES_draw_buffers_indexed GL_OES_draw_elements_base_vertex
> GL_OES_gpu_shader5 GL_OES_primitive_bounding_box GL_OES_sample_shading
> GL_OES_sample_variables GL_OES_shader_io_blocks
> GL_OES_shader_multisample_interpolation GL_OES_texture_border_clamp
> GL_OES_texture_buffer GL_OES_texture_stencil8
> GL_OES_texture_storage_multisample_2d_array GL_OES_texture_view
> GL_EXT_blend_func_extended GL_EXT_float_blend GL_EXT_texture_sRGB_R8
> GL_EXT_texture_sRGB_RG8 GL_KHR_no_error
> GL_KHR_texture_compression_astc_sliced_3d GL_OES_EGL_image_external_essl3
> GL_OES_shader_image_atomic GL_EXT_multisampled_render_to_texture
> GL_EXT_multisampled_render_to_texture2 GL_MESA_shader_integer_functions
> GL_EXT_color_buffer_half_float GL_EXT_texture_mirror_clamp_to_edge
> GL_KHR_parallel_shader_compile GL_EXT_EGL_image_storage
> GL_EXT_shader_framebuffer_fetch_non_coherent GL_INTEL_blackhole_render
> GL_MESA_framebuffer_flip_y GL_EXT_depth_clamp GL_MESA_bgra "
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  cat /sys/class/devfreq/11840000.gpu/trans_stat
>  [INFO]      From  :   To
>  [INFO]            :  50000000  62500000 100000000 125000000 200000000
> 250000000 400000000 500000000   time(ms)
>  [INFO]    50000000:         0         0         0         0         0
> 0         0         2       380
>  [INFO]    62500000:         0         0         0         0         0
> 0         0         0         0
>  [INFO]   100000000:         0         0         0         0         0
> 0         0         0         0
>  [INFO]   125000000:         0         0         0         0         0
> 0         0         0         0
>  [INFO] * 200000000:         1         0         0         0         0
> 0         0        79      4576
>  [INFO]   250000000:         0         0         0         0        69
> 0         0         0      5292
>  [INFO]   400000000:         0         0         0         0         5
> 0         0         2       440
>  [INFO]   500000000:         1         0         0         0         7
> 69         7         0      5340
>  [INFO] Total transition : 242
>=20
> Biju Das (5):
>   dt-bindings: display: Document Renesas RZ/G2L DU bindings
>   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
>   drm: renesas: Add RZ/G2L DU Support
>   MAINTAINERS: Update entries for Renesas DRM drivers
>   MAINTAINERS: Create entry for Renesas RZ DRM drivers
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++++
>  MAINTAINERS                                   |  12 +-
>  drivers/gpu/drm/renesas/Kconfig               |   1 +
>  drivers/gpu/drm/renesas/Makefile              |   1 +
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 431 ++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  89 ++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 176 +++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  78
> +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  72
> +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 ++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 433 +++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 ++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 460 ++++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 ++++
>  16 files changed, 2070 insertions(+), 1 deletion(-)  create mode 100644
> Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>=20
>=20
> base-commit: e17049148678725248a57ecbf9c21df0fde3b434
> --
> 2.25.1

