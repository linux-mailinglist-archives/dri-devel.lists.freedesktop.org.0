Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF217CDA98
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 13:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0995210E0C3;
	Wed, 18 Oct 2023 11:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F200C10E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 11:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOu/Ztp6taQ5pwEVyvuPlJTkMYgwZM3dYskRtIJf5H2uMOGcNhdB9ah957t7emqzU2usW/Gk+GJzKVqxSNPjZs1tBsRo1MYArXkISRFP/aUvff9y4s1SltPPNdzbyrzTLOPkAp5cw2DSrlf4+A+otFxHqVpeXLXU1hHQ5wTg+MIPUqp1QWTdfFC6olDTC+F1VTWk4pb4ktB6g2R2lbB4bFFljKLA+fiiuOkiQbxMh8aCey6gpBiBuJQdp76Ryv+tZgXwnl5b5SMjk9Ty2sQw685v7ITVk4ZDsOGhLwBsfCBuWKTA0pNEuftEsqx+PO5uqT7lL5fWEQa2gri0uJBRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnEOhHe0Z3ytcDmRdQbWWUJmB7LV6XkCot2B4P8Y1u0=;
 b=f+A2lN6n9IocugGqvFQ05KGa+ijcVeZbTLkY6m2CwbSfMei6L1INWl9U24X9fSVaponLzjLHHheOdx4Xldq+kmr5hlOWT6GdPe//k1scMviDEHUVHLF0r6bJ7Z3soQvPyOBWB2lVf2bQ8ichQlE5rGpaHxaZHH6HV/aHaUYluPDYCfuDmDr4mrwl6HpjmHdHkvEDRWpFAfZHajOEWHkjwso9JgjQgwR/FpvD2fJeW3AMDR06o3psjh+BTadqQh9oE3JVZ3mgUpg1aAf2K9yWhWNZHv6DwQzv20u8FGArxVC5i43EsmDuJA1/q9OnxhqNhl6gfx84VPUcKRF2N/SOiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UnEOhHe0Z3ytcDmRdQbWWUJmB7LV6XkCot2B4P8Y1u0=;
 b=Z5ek5RYfC7Qx/zq1MHIavR82CTJw1WJM4YoViKB6Z6yGcImcG/r2HcsykJc0p1GOfzVRicQeQx9dB1F2l1Gi7kN2pUjhpwK+vjc+RGOqgg8zpef1VdJvYYCmSSziW8qFnoog/fz1VO/xox/NyhzX7X1eBknviEeHkt20L3+srHQ=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB6085.jpnprd01.prod.outlook.com
 (2603:1096:604:d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Wed, 18 Oct
 2023 11:36:17 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::c90e:cd43:c967:5218]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::c90e:cd43:c967:5218%5]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 11:36:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v11 0/4] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit support
Thread-Topic: [PATCH v11 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Thread-Index: AQHZ9SveS6kTO1ohDUi12FyPXzVLkbBPg22g
Date: Wed, 18 Oct 2023 11:36:15 +0000
Message-ID: <TYCPR01MB112691BB77CFF04BEB547B94486D5A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231002122740.220177-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231002122740.220177-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB6085:EE_
x-ms-office365-filtering-correlation-id: 628cef6e-7a6d-4df9-e49a-08dbcfce7069
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hmJKcL4pACDbiptSMNVSne/cqzMelEEq5mLQAgHRZL5NZnTjfLB+DyI59d+K3urHF2r7K6gx66YlTeo3Z3SfXBrXSvqP5dnzy/qmKrmTEJ//iB22j1o6f1mOZXMJspqBSJWUHdn4SWeBUCmyR9sFRLH3v1cKwvMhX37TReo1tJIRU2BBzGPzuS21w485pVs0p/x1FIheYn3tnxIuPlCWa6cWkBxR/2WXFtqd0DoO8CJlaJ1m3XCIt56aQTWT+gUbxXWVp5wE0fedy2BoukY2c9TO9ejXoltButv8Q3P60KG4Cst4+tkvndtCegFX1dAKFoZKSpvsOuw3NbNm8t1BXxFFdQTZrl7zG06DwvIQS6m+jkh0liqwyuFWIFXT2Id+hEyaF2xHNwTDKNbFpORyNeD6m3MOiVN648GG3qE/oNU7Rmi7FAu4wTzRye0OTQULmk/40zzLIBn0+UBetZxxFvt5OhofkKUPQK0tcOOUset1utwvLoIOEuCx5izWOM/pS1PU6EJMFMN2zoO9+iQfuErpoddse1vEWIW7paSztUULejZ65hM56qEcqUXUIwrGz8Yy8kUTO89dDi/BgIVmai0xLtUcSfezBkF6EeRW8biF1yk87vlwuTd4E1WSMz83
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(396003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(41300700001)(316002)(4326008)(8936002)(8676002)(33656002)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(54906003)(110136005)(55016003)(38070700005)(5660300002)(52536014)(107886003)(122000001)(38100700002)(26005)(478600001)(86362001)(45080400002)(966005)(53546011)(9686003)(71200400001)(7696005)(6506007)(7416002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?shhpyZhHb0n+wHUqlNWvoyPuk/J6KkZaxJss8oFiN8MO+0B0Gjra/MUH0o/9?=
 =?us-ascii?Q?hSjONtPdHAx0wUqjNxnqGDr8OB64IYeAzWcpJzFOhJzv1vKvqBz72Ytao8fA?=
 =?us-ascii?Q?evA70iKXsmkkRgpigUAmKFgF1j3D0jBhI1RZCSmwvq46bcNSJsdv4H5dzaor?=
 =?us-ascii?Q?1sF8GkrkZqsippHb06/UtZ+9lxXJGLH0swIr2I2abygUcOunQWUOi9KlUAYM?=
 =?us-ascii?Q?fDmbuKy+ypV2/W4pB+oPTjoOQ9kMyRSPoaY1Hf2f6tw9J7XXWAAqs7ATERQ1?=
 =?us-ascii?Q?L02tqKBAZulS36I41EKSh6mYaSintBSwPZIpvID2ly9MlQ9/HDAH0gMuen4f?=
 =?us-ascii?Q?U19gOu2M+V1CmxFjQ9M5kCQa2CoGNm3UlTiNebjbjQS0MjQIb4uGWhl3Eun5?=
 =?us-ascii?Q?33CHqErrUCNVXnTxvPvscG6Wg4porvR4yLo5xPcMOq+9UpgznB5lwjHDc2kV?=
 =?us-ascii?Q?ujL772oHPhXNRrNVtHhecPxaJKk/2OjJfNRKkelyA8FB9KhkxtMhcG58t/yM?=
 =?us-ascii?Q?CKUKsWdhY8dtIrq9Yi+ZYZ+ufcyGr81xXiQZZNCF6bfED6lDpU4es4TQ6d1+?=
 =?us-ascii?Q?AsZ1rHlwq3icihAhbUkdPdzHkMP1G1FFqr209GFwnO0F+CB/3ntqOvdimqA7?=
 =?us-ascii?Q?JEud/I4CMzv/6DooXwA/8qAPn7NTJoaDImsfjkEBJQz/v5Fkz9brx11OybEf?=
 =?us-ascii?Q?UMe5vJjPXsmBnWOjEQGSHtdq4PIkWlKokmvXDzC09ixG3wxH8pMYJxU8ylvm?=
 =?us-ascii?Q?sNNcGFPeHoTqvoPuyk+JtblJdfKi6k1OgfEpiEXw3zrEmbGLQBhq2HhLVfbP?=
 =?us-ascii?Q?4jsGBupsHbkVwaj7/slkueN0RRndUNlsV+muUyQnJXqTDIzwNGg0H4lO+bvM?=
 =?us-ascii?Q?jP46KQrLKdul62ZDll/S+j80KFvkEHCp7s3e9///E1Y1bvGitHEi70TS+WKh?=
 =?us-ascii?Q?/WPJ/5uys8JgHbkWV3VfUStrDotD/pC2UmpdIE/RI1YugD76ZB3w+nt3LoE0?=
 =?us-ascii?Q?MK85aloqE6PX+5icDF9fftDfiJQUB30TLr8prH9hSN8nHILBFI0WRkq2iKeK?=
 =?us-ascii?Q?+ri56amrvNn774v5o8w+NTcS4ffR8xrx1Q4HdgGCeFFxopfDm7o+u15iGpal?=
 =?us-ascii?Q?VZB1UqHbAXmHJCaPdG96dELLhM9RJXaCuuR4rqCEqaaYEIEXbzM2PVb4Db40?=
 =?us-ascii?Q?b9eNTHsR+ZnAI5Q+3Xxj7EX2ceaMgQsqf25BsY5nAqLjDF+kS3+02gChCGFZ?=
 =?us-ascii?Q?rou4TRS7/CpiJTBiq8JCOwZSnrMjqyEPVwtEBSZ5keGdLtFRkgioVBANqo5k?=
 =?us-ascii?Q?H0pnb1u2/uY2qEdDXRi5ZH3H7XNPvY0hVi5FrO56FQXacyzFmdJJ+lVJh/ry?=
 =?us-ascii?Q?6AVXAN7nqSkTA5yLCrd/KmE97VGmYt1630gAX5nZcU3WHPerkt1581kYoqXL?=
 =?us-ascii?Q?fLQWk8yMlP+muEPTag/BzNKorx/qzP0QzCX3wjPxrW1Qq6V7B3Oqr7WBzrl+?=
 =?us-ascii?Q?CbB07XFG0IXwtF17mlyW/R76D79p23fxMOXswM2eNiYoMW/7ngwMlple/n6y?=
 =?us-ascii?Q?Yy86SJsvHG2wDWC8UADDmxGu+OxzfMMC8rYsZl4auj7X8C9iMK2lNA3mCJSB?=
 =?us-ascii?Q?kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628cef6e-7a6d-4df9-e49a-08dbcfce7069
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 11:36:15.8917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: odiVtF817MdsQWiKWAow8pX3TkJV3/hpV/00SxG1nOZtMqKr7kAsskJYMLPt7Wfb9cvif22vO+G80vCLnENMjJbAiwt3q0dfIRgRgMDOIHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6085
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jacopo, Laurent and all,

Gentle ping. Are we happy with this patch series?

Please let me know.

Cheers,
Biju



> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Monday, October 2, 2023 1:28 PM
> Subject: [PATCH v11 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit suppor=
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
>=20
> This patch series is tested with [2]
> [2]
>=20
> v10->v11:
> * Replaced CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1 for building
>   rzg2l_du_vsp driver.
> * Dropped "rzg2l_du_regs.h" instead the relevant definitions defined in
>   .c file.
> * Dropped setting ditr5 based on latest HW manual 1.3.0/1.4.0
> * Updated the comment for auto clear.
> * Replaced writel()->rzg2l_du_write() in rzg2l_du_start_stop().
> * Dropped CRC related functions as it does not have DISCOM.
> * Replaced the variable possible_crtcs->possible_outputs in
>   struct rzg2l_du_output_routing.
> * Updated DMA_BIT_MASK from 40->32.
> * Dropped unneeded struct drm_bridge from rzg2l_du_drv.h.
> * Dropped colour keying support as it doesn't have planes.
> * Added only RGB formats in rzg2l_du_format_infos.
> * Dropped chroma planes from rzg2l_du_fb_create().
> * Updated the comment for max_pitch in rzg2l_du_fb_create().
> * Dropped possible_crtcs check in rzg2l_du_encoders_init().
> * Dropped additional empty line from struct rzg2l_du_device.
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
> m%7Ce669be40ca4449ebb44708dbc342fc7a%7C53d82571da1947e49cb4625a166a4a2a%7=
C
> 0%7C0%7C638318464751238898%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
J
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DjlkoT=
Ml1
> V3JfKQchd3o0HhWvgppWE3q%2FBjejCWLcxX8%3D&reserved=3D0
>=20
> Biju Das (4):
>   dt-bindings: display: Document Renesas RZ/G2L DU bindings
>   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
>   drm: renesas: Add RZ/G2L DU Support
>   MAINTAINERS: Add maintainer for RZ DU drivers
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++++
>  MAINTAINERS                                   |  15 +-
>  drivers/gpu/drm/renesas/Kconfig               |   1 +
>  drivers/gpu/drm/renesas/Makefile              |   1 +
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 438 ++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  89 ++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 176 +++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  78
> +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  72
> +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 ++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 441 ++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 ++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 469 ++++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 ++++
>  16 files changed, 2096 insertions(+), 2 deletions(-)  create mode 100644
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
> --
> 2.25.1

