Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E2770267B
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299EE10E169;
	Mon, 15 May 2023 07:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B750710E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 07:57:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD5qhZZTL6yz7m9PZ6EI42oLQwbyRdKznfx9HbK6kHDEyx55Ri0x2FPxJAk2BryIr+KW5WyFKxZWnxJYunqF3khc0lywuoReATdlkaeoudNzS+Dkn3Jw4C8r4hbHO6ZCqMlYcgXNZRKvwwZWvmCP/Xf8YWPQEKyV3ZmrHf/ov7B1Rs9329gKp3AySbs05lseGT+CbNW33x9LRKcFWKhQOo4P6uMrxl9grBwf8xFlzHKiJvszvITJeYWOI2+CSRarxK1J/Bclqox0Xn+YwD+TiA9qs2RxqCfoto7WrnVw2mnooGc3WIHkJbyN6xlozwQw5qX9snSWaS/PVjETK5dJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExFUzSR3gOdeKTmjIjbTP3TFtj9JDC4c/ouuWgQn/IY=;
 b=fiyIAwdb675Pd7lEfH8ImNdC2fYid9feE1DjwP0lLawoQB0toboW47F3ELsCbG0qm6Xd+3wpmeoCEDAKID6u1UzDac6Pt1V0Ad7qYmX05kKPtY8q+n7pGf+Fzkt3+aCp5jCjJ1jN9zqGxPOOfqZf7DrVOy2ot24FqnePjRLIStCUqlr6Hzg/A3V1AQy41zYggReRkKWXYkw8ohcjY45Se1xP3rDMHNsulK815xvdppR8aarmX7QB9VDrmZliQz+nGnlLGQKxOIsEy5E483TaywRdsTLB1I8vfgfHqaumVdw9DctI/tkuEhe2VuV7usfH74DWiTjnRPK1catr8tT4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExFUzSR3gOdeKTmjIjbTP3TFtj9JDC4c/ouuWgQn/IY=;
 b=gYX4e7bq/dMTWUYPcb3o7uznUEWjboFgpNEkgLVvEoBwz1tw6xiIdJlMi4AVInK/xup0KWrLwq40DeWNOu+H8exs0Bs11QlP9BPW17Pn3FJVDNE4rfhfchkQPK995btg0CKrpAmL7aLUhFRmgaObsyd2XuCVRcFqTB8NlsW7PUs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10829.jpnprd01.prod.outlook.com (2603:1096:400:2af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 07:57:35 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 07:57:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
 support
Thread-Topic: [PATCH v9 RESEND 0/5] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit
 support
Thread-Index: AQHZfN4p/b5orSrwk0ai5QpLpQqzGK9bCteA
Date: Mon, 15 May 2023 07:57:35 +0000
Message-ID: <OS0PR01MB59220E8306506F3E0B17968A86789@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10829:EE_
x-ms-office365-filtering-correlation-id: 548ce80c-74ad-4091-add0-08db551a0b7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z643srN1Es99iFkeKk2E+YZy1JJzBWGOGinjwdLx2aldHLwbp8SxA0jThUzCAjO6LWFljinC6ti9bRfSbVKCbEN1Ev4M5UeR8ok336u9qCwwV/9GnGmjSXOcuSpS9qmZmvCcgw12eOpcePOCi33BWrxN0OUk9odROPsV7o+pnkXA/v56fGlseMEhhCf0b9MWRcbV9P0q4avTUBowcj7fI4mQaCaOBzKQGeH61xpJNXZvXSY8RfgeuQMpHnbukB3Uq0xr0gRX9YPTFu+gGU6N5agJDzTe09mZmR5oJthtrSqIL/bANt5ASNqfoqYL9SsRWfQDYhbry/xefU1jdvwI/oI1UiqAqvd5HCgEO1zhZr1x2PzPea4euMz6EGHiRkvHubG6zuLrXVPycilC7wfPDml2qZsivuFHtha60bBPlV0Cny6aKR8CMpIptERMeXgH2mNjMo65Y9Ftid14PVTvG4hDao/W7UtagXjfXvz6qs+yxEByjW4fXpFpLaUXIcS0pbTkFrl4943MQmWVPYD9ZiZoJrvHo0JrGMowdnk7F8AZs8HAbYJ3yRRqrIzsNAFGdEaiwgbKuNq8dZSXXhGFKcQvylmdhAt6x+sehqBQNcj8QT5dBlnI6ykdkEBdee7v
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199021)(316002)(64756008)(4326008)(66946007)(2906002)(76116006)(5660300002)(52536014)(8936002)(8676002)(30864003)(66556008)(66476007)(66446008)(41300700001)(86362001)(54906003)(110136005)(478600001)(55016003)(7696005)(71200400001)(26005)(186003)(33656002)(6506007)(83380400001)(107886003)(122000001)(9686003)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8k3zQUI9yL9Ff95+X4bBGXuyqu2s0DivnJ3fXGrwoD+jpGR2Kx29JlBodw5h?=
 =?us-ascii?Q?07EZXPCuRDpPvV5q9l0zGZFVzjxJ9IHSizKOc9AIeJ+AXDkmV3YyJuR3aNug?=
 =?us-ascii?Q?2UCygiEmSj2okrSndXiSwF1rGorgu1karvMuslTVD9lddNZhmeBb72NRT0EL?=
 =?us-ascii?Q?wWwunJfYVoXETD2xdZAGleNhtViCYJy5Uf24D36JQ8TpYbAwEiJ/uftG7XFq?=
 =?us-ascii?Q?XRKykSr7AGoJchsv7bXfj3X+SGvgMh999RI/Mtl8f+0ZhUp6SGYdnShiQRAu?=
 =?us-ascii?Q?e0yAm9/LdAn0PwBL6hClsvLwMio5LJNbmPPcNir2rSeXveKc3XN4eDqAmjAf?=
 =?us-ascii?Q?ZHX0UNpU9gDFdZfxQ1Q1wFQOfknAN51qD9c8zyRN2zD8r5DrvhdEQHDJoQvs?=
 =?us-ascii?Q?tBOuLpCYIOH4LQ7jMNaKb/fKmAsXAPsiXh4h0te6LsDTJKUuE3xOy4qfO+Oh?=
 =?us-ascii?Q?AP8J9wB8tq1euxW92AuCqc5AdXSNyOrq1OE75IEf6SKCrT5pkptLdRwznzlS?=
 =?us-ascii?Q?zqA1m0IzflkxYjfg7Jj/CXEP5Ia27dD5xMWl+INDYdP9o8/53QEQq+At20ei?=
 =?us-ascii?Q?zt8+HbVDffyGzw/k32BNtekV/h6Rai9SCDWyKzZNOHXWZKrqb8qhF5vi9i5W?=
 =?us-ascii?Q?TwMbL2MDwGro+rDruVm2roatmvJA5sikvwS3SaJTkdrxihe6Qu3YYt17vQ7o?=
 =?us-ascii?Q?XGXVrXXdFtrriLNnGsc4/BnORmNoIt24JZiyF9u76YOE5uxseEBKb76/CEPl?=
 =?us-ascii?Q?hxcUQwL7Ay5+5kNLOv6s7mpoP4DHakWJ7P0L8U0qeW/NW8o0S1e+CGPsvjlo?=
 =?us-ascii?Q?NEa//hG659OdrojB0AJX9fitFnfu/Z8Lg9Vitth/Cps3xnDZNleTB88SIxS0?=
 =?us-ascii?Q?or9LDH4eOQeXAb+nljw08TXjqc9SckQ5HufbPmGT2dJpKy+KycAC1LTqH7fl?=
 =?us-ascii?Q?Ur4GDrbwS8vjhi2UBmcX1C1b2DAaV0lTr4mp76Ah/GyYjtaRHFQZtsAUEFQE?=
 =?us-ascii?Q?ABR7bCh/FN0iwA8Ph/+3tD/yAKnW4x0tDFprWfiwGu0lwBK5W5S7eHMOGr5q?=
 =?us-ascii?Q?v7Hy06SuH4IFCbKSvEvfwIL2k3iMc/Tuua2vMM5+8hja/aUPOLmZpb8btwW0?=
 =?us-ascii?Q?d+hkbq2uEphVBvUYlywo9cLGvLpJsfGQmZra48mhT6nGh3//vdlJ/T+L2lkj?=
 =?us-ascii?Q?QmvlxNj2bpiK9bu6xblD/CeJeozckCXnJNhrHQEltEpbJNBKxTBKPFpAhTHt?=
 =?us-ascii?Q?vH6AXJCK0MlN55wGaniDnR85DNC3YhgM7ui28riLyiY2nyaDiXr2ve9O3rMz?=
 =?us-ascii?Q?6CU7cnivD7udWMDH6yARpOAAJwvrCemWxKRchMCVwK3seH3nTSi5IF7/8srj?=
 =?us-ascii?Q?x8Rw1JG3oNOdUDO2p02oPDuSPMC4ZZumolw+n0X1BODAr8osHiTTvP00kupg?=
 =?us-ascii?Q?U4vUZkScrWpsjFssgV5S9Lh2On1oKBeiiFI4+kdismr24G3oeFwsERe8rs/0?=
 =?us-ascii?Q?SaM0qVhwYz1xkMbn5CjJ0x9pNKvzVoBAHwHM/y9+Oh6YGDUI+M+n6AfIdI6Q?=
 =?us-ascii?Q?0ud+yxaf86HG13QFOQPh4fhJ83q5+/rENpWpumrb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 548ce80c-74ad-4091-add0-08db551a0b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 07:57:35.3141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRKY0+bnoS96yc/sGh3dFyPr04XI4K1ir5XNLBtxfTvR0jzCzh9okOasGBy+wON3xmjGmVcFCLfHEULhIcS3ROEQ2uOvk7xCbX5mv1116x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10829
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. Are we happy with this patch series?

Cheers,
Biju

> Subject: [PATCH v9 RESEND 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
> support
>=20
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD),
> Video signal processor (VSPD) and Display unit(DU). The output of LCDC
> is connected to Display parallel interface and MIPI link video
> interface.
>=20
> The output from DSI is connected to ADV7535.
>=20
> Created a vendor specific directory renesas and moved all renesas drm
> drivers to it (rcar-du and shmobile). Then added support for RZ/G2L DU
> DRM driver by creating rz_du directory.
>=20
> Ref:
>=20
>=20
> v8->v9:
>  * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1.
>  * Added Rb tag from Laurent and Geert for patch#3.
>  * Dropped reset_control_assert() from error patch for
> rzg2l_du_crtc_get() as
>    suggested by Philipp Zabel.
>  * Added Rb tag from Laurent oatch#5.
>  * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
> v7->v8:
>  * Moved rcar-du and shmobile DRM drivers to renesas specific vendor
> directory.
>  * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
>  * Added Rb tag from Rob for RZ/V2L DU bindings patch.
>  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating
> rz_du folder.
>  * Updated MAINTAINERS entries.
> v6->v7:
>  * Split DU lib and  RZ/G2L du driver as separate patch series as
>    DU support added to more platforms based on RZ/G2L alike SoCs.
>  * Rebased to latest drm-tip.
>  * Added patch #2 for binding support for RZ/V2L DU
>  * Added patch #4 for driver support for RZ/V2L DU
>  * Added patch #5 for SoC DTSI support for RZ/G2L DU
>  * Added patch #6 for SoC DTSI support for RZ/V2L DU
>  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L}
> SoCs.
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
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-
> du
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
>=20
> Biju Das (5):
>   drm: Place Renesas drivers in a separate dir
>   dt-bindings: display: Document Renesas RZ/G2L DU bindings
>   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
>   drm: Add RZ/G2L DU Support
>   MAINTAINERS: Add maintainer for RZ DU drivers
>=20
>  .../bindings/display/renesas,rzg2l-du.yaml    | 129 +++
>  MAINTAINERS                                   |  16 +-
>  drivers/gpu/drm/Kconfig                       |   4 +-
>  drivers/gpu/drm/Makefile                      |   3 +-
>  drivers/gpu/drm/renesas/Kconfig               |   5 +
>  drivers/gpu/drm/renesas/Makefile              |   5 +
>  drivers/gpu/drm/{ =3D> renesas}/rcar-du/Kconfig |   0
>  .../gpu/drm/{ =3D> renesas}/rcar-du/Makefile    |   0
>  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.c  |   0
>  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_cmm.h  |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.c  |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_crtc.h  |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_drv.c   |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_drv.h   |   0
>  .../{ =3D> renesas}/rcar-du/rcar_du_encoder.c   |   0
>  .../{ =3D> renesas}/rcar-du/rcar_du_encoder.h   |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_group.c |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_group.h |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_kms.c   |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_kms.h   |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_plane.c |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_plane.h |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_regs.h  |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.c   |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_du_vsp.h   |   0
>  .../{ =3D> renesas}/rcar-du/rcar_du_writeback.c |   0
>  .../{ =3D> renesas}/rcar-du/rcar_du_writeback.h |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_dw_hdmi.c  |   0
>  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.c |   0
>  .../gpu/drm/{ =3D> renesas}/rcar-du/rcar_lvds.h |   0
>  .../{ =3D> renesas}/rcar-du/rcar_lvds_regs.h    |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.c |   0
>  .../drm/{ =3D> renesas}/rcar-du/rcar_mipi_dsi.h |   0
>  .../rcar-du/rcar_mipi_dsi_regs.h              |   0
>  .../{ =3D> renesas}/rcar-du/rzg2l_mipi_dsi.c    |   0
>  .../rcar-du/rzg2l_mipi_dsi_regs.h             |   0
>  drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
>  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714 ++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  99 +++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
> .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
> .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770 ++++++++++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
>  .../gpu/drm/{ =3D> renesas}/shmobile/Kconfig    |   0
>  .../gpu/drm/{ =3D> renesas}/shmobile/Makefile   |   0
>  .../shmobile/shmob_drm_backlight.c            |   0
>  .../shmobile/shmob_drm_backlight.h            |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_crtc.c   |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_crtc.h   |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_drv.c    |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_drv.h    |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_kms.c    |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_kms.h    |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_plane.c  |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_plane.h  |   0
>  .../{ =3D> renesas}/shmobile/shmob_drm_regs.h   |   0
>  62 files changed, 2816 insertions(+), 8 deletions(-)  create mode
> 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
>  create mode 100644 drivers/gpu/drm/renesas/Kconfig  create mode 100644
> drivers/gpu/drm/renesas/Makefile  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/Kconfig (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/Makefile (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_cmm.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_cmm.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_crtc.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_crtc.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_drv.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_drv.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_encoder.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_encoder.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_group.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_group.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_kms.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_kms.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_plane.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_plane.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_regs.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_vsp.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_vsp.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_du_writeback.c (100%)  rename drivers/gpu/drm/{ =3D=
>
> renesas}/rcar-du/rcar_du_writeback.h (100%)  rename drivers/gpu/drm/{ =3D=
>
> renesas}/rcar-du/rcar_dw_hdmi.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_lvds.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_lvds.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_lvds_regs.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_mipi_dsi.c (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_mipi_dsi.h (100%)  rename drivers/gpu/drm/{ =3D>
> renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)  rename drivers/gpu/drm/{
> =3D> renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)  rename drivers/gpu/drm/{ =
=3D>
> renesas}/rcar-du/rzg2l_mipi_dsi_regs.h (100%)  create mode 100644
> drivers/gpu/drm/renesas/rz-du/Kconfig
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
>  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/Kconfig (100%)  rename
> drivers/gpu/drm/{ =3D> renesas}/shmobile/Makefile (100%)  rename
> drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_backlight.c (100%)
> rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_backlight.h
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.c
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_crtc.h
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.c
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_drv.h
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.c
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_kms.h
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_plane.c
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_plane.h
> (100%)  rename drivers/gpu/drm/{ =3D> renesas}/shmobile/shmob_drm_regs.h
> (100%)
>=20
> --
> 2.25.1

