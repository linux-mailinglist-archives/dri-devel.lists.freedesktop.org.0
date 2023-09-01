Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C6078FCBD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 13:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0510E7A7;
	Fri,  1 Sep 2023 11:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556210E7A9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 11:57:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE4fD7vHbSQL9ZwMuwdGqaa5MY30dOPpkOH27EvTMgy5kLUFg/IULLnPfNOzZb248RtUFNnARWWA0XYGuhOSUDXDz1sdXNJDWO+M4tQiP0qj8dlhxuA6JzzdB0E2d4tB5tHgSXwunsjusL4tVDwkqaxzMHUtA9MTsOtM8u4K9kZ32JKZmmRNQpmOpsT4RegqMNcLigLT6kTbPjFQXFTxx4HqH8t0gAMOfu0JfZoYVGJEarTNy45pnUcexxfnBVCEq+39YdSqZUB+KJ+szv9xtAHfc+l4xIlNnqG/tyPcMSMBorGYXCIL4r8U4tRmUbmh+TVfJcpWLThqUpSd4KwGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muwIxUFWA1MYenLR1jNcllOVsMI8SQqyuOY0MmOhhbU=;
 b=cIOQCWxXH8IY3BI+Eg2zw7N5CBwHQIT+H6IGUI5aZkKQwC/gf1OtMrTbbwCfKBvQI/V0JGXYqTy7mDqqdyCGjY8qNQ0SzKd2VWArZGSLd+aheVh5H3KHExdReV9Hn0dW5MoS12MmQ5OZuPny5OmD15IAY1JAYfqWauF0N67KZbub/wRetEXuMxWSWK2OpebeZtFPESPiJJUk3y4aZXQVpgKRAqJYfRtn2B4lvNaxB07C+7wd6tgG4goR9OQ/fN1utxFHOppw50a6K3JBcjJ6RX9V/F7CdsZAohHyjk7Kd9wLiNsxGSFtNATBDsYNRYywPdmSk7WK/wqGUGygu6drwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muwIxUFWA1MYenLR1jNcllOVsMI8SQqyuOY0MmOhhbU=;
 b=ub9k96GgRTOeymUGYTz7iTDHtodWtfcRAPesCtclPRBAgNjkypMi6BuQT+wtjoPM2WMuSmW8BoxyUwB5VsWlYIKOZjAbqUIIq6aenVjV4ZGstTDEhdF+8JGTVQKZdCJsK3E/su05+kYMrFLnkcWr8wy1qJu74/v4DwQUC3jfkAs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8917.jpnprd01.prod.outlook.com (2603:1096:400:16d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 11:57:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 11:57:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp
 Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v10 0/4] Add RZ/{G2L, G2LC} and RZ/V2L Display Unit support
Thread-Topic: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Thread-Index: AQHZrlaa38MndGA920+57Yp0DiWkBq/e7VYwgBfdjsCAD25foA==
Date: Fri, 1 Sep 2023 11:57:45 +0000
Message-ID: <OS0PR01MB59228E0C6048204BD4B239F286E4A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922C1FDA4200E067957EBC0860CA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59229075D5C1E201C210FF53861FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59229075D5C1E201C210FF53861FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8917:EE_
x-ms-office365-filtering-correlation-id: 8a62297d-bd94-4af7-be54-08dbaae2a7bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mZAedKeXMtA/nquv/VnzZFrtg0AtRFJnrZb9MzXtz20PFadwfaFa/FCrafp+fJgoCFGI3EHR6AWX2IcmokhoGLBRHTfxemnBI9gbN/hdOwpyS3L2r+gLG3sh57snGm8/fvzSonAeBhDhSQm/LlI+Yk4MPuhhH18f2vFB5aiSW3N0x5orxKeyEd9cCoQERbYF0QxAPgG5DOx4xI8vIzGJgUub5cOI0ZwVfXGgNqfaPQQcH+q03h/kTuuHAFMDklSJJDTMyi6GBHkbRsD1d5AItKxKV1nFEXMt7GsyCfOnjDDAzLWrNkgj/6cwlWJJKXCbrcRv93XZkWpUJIzpYax9vW7Yq+d7XNly2WUselWb2Kp9ztkhLf6YtxHZaVvBiks77S150PlpGnpCBwsyTci4mK5IZI/any+R85TEdN4jbTTy/PbFoaGBimKYs+VUsjt8PmBSwxJCcglfGEwSqwu1Ri7/CfTso/2YgfTZCEoDBS8A7BiVCcNH2S6AB/5ZYxmIQeZWeHiSU8hxhBH0P2U/zczD2f3+7N9eb4soHPfnQ2purzOacKja/P8sEHFUW2aQ28UA4Ofl+pp0Up9RhJECRh3Xs6pGNAhsQcQCSRfzr/U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(1800799009)(186009)(451199024)(9686003)(66556008)(41300700001)(86362001)(66946007)(66476007)(2906002)(76116006)(64756008)(54906003)(316002)(66446008)(33656002)(8936002)(4326008)(8676002)(52536014)(26005)(5660300002)(7416002)(55016003)(83380400001)(38100700002)(38070700005)(45080400002)(122000001)(71200400001)(966005)(478600001)(7696005)(6506007)(53546011)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qcXotdTnlILx8imx0UDVBI7QkJs6inlr/KjwBjoUiBLLw49RzpwhsqezUqpC?=
 =?us-ascii?Q?H0O08KT53OHEpr6zbzN9YsqMsJjULmEyDRhUL6H3zkxc1wCBR3mPsAFtYU6M?=
 =?us-ascii?Q?NsM45m0qHcTzWzqBcy+4uknoQWnS/muQCSVrujHwnII2JFp5oDxJkXaa82yL?=
 =?us-ascii?Q?EDFhKAXpkbBEV+tn9Z2bl6jOVHi3vToIFSd/SyBbwKUW0Ijmbg+M7vgbCLe8?=
 =?us-ascii?Q?Z+wPQ82CXvf/YUPQha4bzVzUzfvurXvcxs8AnRZ5AKiEKhnIOoPtrUSttpvs?=
 =?us-ascii?Q?uSo+M8B2CQHjrio1rbNP6YP+ihsvVt2uOo3w4GneK9nRw47mCeII/irhTm4m?=
 =?us-ascii?Q?0R5inwhutf9aMJ8IAplWFOcIJ+URgadROfV/eLq/bpZXQHLfLtDJAKVAJZ75?=
 =?us-ascii?Q?lM6XWstuk/SVaRN4GXprjshnhCv6aZs5IZ3/Gpc+x6F39Y49+VahRNLw8w3F?=
 =?us-ascii?Q?m5jJ0ERdrTykxGRng0w1zj48RC2kl2Vh9Sx5AsRGHN3dDbHvb7s8PqnEnfYD?=
 =?us-ascii?Q?VKxv/uBS2Fz8oMbMdTV8gyHmSeLZnrwCODifWTNC7sKkf6NiloEyOgPK7qgE?=
 =?us-ascii?Q?ngwZYTNFLTYY51zfHi20h7ocsUnfIsCbWqi4HunizTDLS0FlHz4PwxKLgeRX?=
 =?us-ascii?Q?f9crRvbeuxuOYYU2DxDyXFr6uI5fQGXA1wyUE39uG/meNzYmycEaXDQcvTli?=
 =?us-ascii?Q?p8fkhNmhzNt8EMgHHElbdigN2r7U67IHu+iTDMxi6PNTLN8v7FdSLHeylXld?=
 =?us-ascii?Q?mdCMzihdM+zmQT4fn05uPbbsCwdtKTjRjyFodvTK0/fKh1HR5qVcSVVXDVYh?=
 =?us-ascii?Q?ShBr+UYnj5JG/ogbGT+i+APVrc7Fakf/lUDeu6s+JGEujV8J15IzL8Hhd1le?=
 =?us-ascii?Q?X0FKNmy7oW2+AH25EiyWR5/z9C53osFDu4BRx8Tik0+BiiaYG17k+1dd3Y1S?=
 =?us-ascii?Q?xezv6nvIBNZaaHC58eyDc9gPdzPyDm2K1YdFMyEXHndZDSbM7Bj46eFdfI/A?=
 =?us-ascii?Q?UPTEtCFToJYUvLwVTpTilCK3YxRTAtIu0SF7uvpH+lKrB7hwzTRguU0556Xf?=
 =?us-ascii?Q?oFc1a8LhNjPhT5V73LaDpkfFGRJCW3e9dvbygqNzk9qU2vmQoIEWQVLZ+JmE?=
 =?us-ascii?Q?aOOixS/DXzQrVpg8UKtH+ATbi07NQVd6OzkSAOei2rsWKaGCE0laU4nL+o43?=
 =?us-ascii?Q?MAUpt9osbU4yolgQlabOWBNbG3ePJJro94bkJ5XDjDrTkzc/YPBpODzgCO02?=
 =?us-ascii?Q?XO8OpVOV+yle/8/ppAI+rsyUwYrajoFMR3mjwSEFaf0bukIdvWeTXr4odqvw?=
 =?us-ascii?Q?AG7wQKDi7Vm4p88i4HRNgKJDqrlYgRtxGoHYu64s5yQdKlRuV21c6e9v0R/R?=
 =?us-ascii?Q?c31UpzY9R0WWPKDrqqbxc3wEXB6XdFI3vx3BQiZSbw/OJWQWxYscu+xzmFur?=
 =?us-ascii?Q?lFh6abBrd92v9v2Xu+V5+9VtSsTGbk+KI/OA3wDllGiuNAh9epCuRlSM1PPc?=
 =?us-ascii?Q?WcqmSkDxDW7weAI+G2nQYSPkL87iiyl3/NA+bxv4mPYNhj3UMCnbsj0ZHz3U?=
 =?us-ascii?Q?zgr31V3hUwaczysAumW0E8ZOBZB6jA+PJYmdRz5es8CKhx6uTXZHTP35W5vx?=
 =?us-ascii?Q?OA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a62297d-bd94-4af7-be54-08dbaae2a7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 11:57:45.6552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRF/9yFT1YSBWKosRuLqs1c5GNutIy3KfMj9L1dHCU+LJMJH5V2+ZIgaRuj2rHJ5gqQjPahqXhX9x0+dZsE9SX8txWCSmRwp95wXYhDkh7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8917
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Helen Koike <helen.koike@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Gentle ping. This patch[1] is posted around 2 months now.

Please let me know is there any dependency/blockers for
accepting this patch series?

https://lore.kernel.org/all/20230704090447.27420-1-biju.das.jz@bp.renesas.c=
om/


Cheers,
Biju

=20
> -----Original Message-----
> From: Biju Das
> Sent: Tuesday, August 22, 2023 5:18 PM
> Subject: RE: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
> support
>=20
> Hi Laurent and all,
>=20
> Gentle ping. Are we happy with this patch series?
>=20
> I will send follow up fixes if we find any issues later.
>=20
> Cheers,
> Biju
>=20
> > Subject: RE: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
> > support
> >
> > Hi Laurent and all,
> >
> > Gentle ping. Are we ok this patch series?
> >
> > Cheers,
> > Biju
> >
> > > Subject: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
> > > support
> > >
> > > This path series aims to add support for RZ/G2L DU DRM driver.
> > >
> > > RZ/G2L LCD controller composed of Frame compression
> > > Processor(FCPVD), Video signal processor (VSPD) and Display
> > > unit(DU). The output of LCDC is connected to Display parallel interfa=
ce
> and MIPI link video interface.
> > >
> > > The output from DSI is connected to ADV7535.
> > >
> > > Ref:
> > >
> > >
> > >
> > > This patch series is tested with [2] [2]
> > >
> > > v9->v10:
> > >  * patch#1 is mainlined, so dropped from this series.
> > >  * Added Rb tag from Laurent for the binding patch.
> > >  * Updated the commit description.
> > >  * Updated description of the port by dropping the text "specified in
> > >    Documentation/devicetree/bindings/graph.txt."
> > >  * Dropped empty endpoint from example.
> > >  * Dropped ARM64 dependency from Kconfig.
> > >  * Sorted the configs alphabetically in Kconfig.
> > >  * Dropped DRM_RCAR_VSP config option and make DRM_RZG2L_DU depend on
> > >    VIDEO_RENESAS_VSP1.
> > >  * On rzg2l_du_crtc_set_display_timing() replaced the setting of pare=
nt
> > >    clk rate with dclk rate.
> > >  * Added rzg2l_du_write() wrapper function.
> > >  * Updated the comment atomic_begin->atomic_flush.
> > >  * Dropped .atomic_check and .atomic_begin callback
> > >  * Renamed __rzg2l_du_crtc_plane_atomic_check-
> > >__rzg2l_du_vsp_plane_atomic
> > >    _check and moved it to rzg2l_du_vsp.c
> > >  * Added struct clk in rzg2l_du_crtc.h
> > >  * Dropped the variables mmio_offset,index,vblank_lock,vblank_wait,
> > >    vblank_count from struct rzg2l_du_crtc.
> > >  * Replaced the macro to_rzg2l_crtc with static inline functions.
> > >  * Dropped the unneeded header files clk.h, io.h, mm.h, pm.h, slab.h,
> > >    wait.h and drm_managed.h from rzg2l_du_drv.c.
> > >  * Replaced DRM_INFO->drm_info
> > >  * Dropped the callbacks prime_handle_to_fd, prime_fd_to_handle and
> > >    gem_prime_mmap.
> > >  * Replaced the callback remove->remove_new.
> > >  * Dropped header file wait.h and added forward declarations struct
> > >clk and
> > >    rzg2l_du_device from rzg2l_du_drv.h.
> > >  * Dropped the dsi and dpad0_source variables from struct
> > rzg2l_du_device.
> > >  * Replaced the macro to_rzg2l_encoder with static inline functions.
> > >  * Dropped header files dma-buf.h and wait.h from rzg2l_du_kms.c.
> > >  * Dropped struct sg_table and added the scatterlist.h header file in
> > >    rzg2l_du_vsp.h
> > >  * Added container_of.h header file, forward declarations struct
> > > device and
> > >    struct rzg2l_du_device in rzg2l_du_vsp.h.
> > > v8->v9:
> > >  * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1=
.
> > >  * Added Rb tag from Laurent and Geert for patch#3.
> > >  * Dropped reset_control_assert() from error patch for
> > > rzg2l_du_crtc_get() as
> > >    suggested by Philipp Zabel.
> > >  * Added Rb tag from Laurent oatch#5.
> > >  * Updated MAINTAINERS entries for common parts(Makefile and Kconfig)=
.
> > > v7->v8:
> > >  * Moved rcar-du and shmobile DRM drivers to renesas specific vendor
> > > directory.
> > >  * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
> > >  * Added Rb tag from Rob for RZ/V2L DU bindings patch.
> > >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating
> > > rz_du folder.
> > >  * Updated MAINTAINERS entries.
> > > v6->v7:
> > >  * Split DU lib and  RZ/G2L du driver as separate patch series as
> > >    DU support added to more platforms based on RZ/G2L alike SoCs.
> > >  * Rebased to latest drm-tip.
> > >  * Added patch #2 for binding support for RZ/V2L DU
> > >  * Added patch #4 for driver support for RZ/V2L DU
> > >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> > >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> > >  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L}
> > SoCs.
> > >  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> > > v5->v6:
> > >  * Merged DU lib and RZ/G2L du driver in same patch series
> > >  * Rebased to latest drm-misc.
> > >  * Merged patch#1 to RZ/G2L Driver patch.
> > >  * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
> > >  * Optimized rzg2l_du_output_name() by removing unsupported outputs.
> > >
> > > v4->v5:
> > >  * Added Rb tag from Rob for binding patch.
> > >  * Started using RCar DU libs(kms, vsp and encoder)
> > >  * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
> > >    rcar_du_format_info and rcar_du_encoder.
> > > v3->v4:
> > >  * Changed compatible name from
> > > renesas,du-r9a07g044->renesas,r9a07g044-du
> > >  * started using same compatible for RZ/G2{L,LC}
> > >  * Removed rzg2l_du_group.h and struct rzg2l_du_group
> > >  * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
> > >  * Removed rzg2l_du_group_restart
> > >  * Updated rzg2l_du_crtc_set_display_timing
> > >  * Removed mode_valid callback.
> > >  * Updated rzg2l_du_crtc_create() parameters
> > >  * Updated compatible
> > >  * Removed RZG2L_DU_MAX_GROUPS
> > > V2->v3:
> > >  * Added new bindings for RZ/G2L DU
> > >  * Removed indirection and created new DRM driver based on R-Car DU
> > > v1->v2:
> > >  * Based on [1], all references to 'rzg2l_lcdc' replaced with
> 'rzg2l_du'
> > >  * Updated commit description for bindings
> > >  * Removed LCDC references from bindings
> > >  * Changed clock name from du.0->aclk from bindings
> > >  * Changed reset name from du.0->du from bindings
> > >  * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
> > >  * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
> > >  * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
> > >  * Added forward declaration for struct reset_control
> > >
> > > [1]
> > > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fp=
a
> > > tc
> > > hwor
> > > k.kernel.org%2Fproject%2Flinux-renesas-soc%2Fpatch%2F20220312084205.
> > > 31
> > > 462-
> > > 2-
> > > biju.das.jz%40bp.renesas.com%2F&data=3D05%7C01%7Cbiju.das.jz%40bp.ren=
e
> > > sa
> > > s.co
> > > m%7C8e48927180a7413aaa7308db7c6dbc04%7C53d82571da1947e49cb4625a166a4
> > > a2
> > > a%7C
> > > 0%7C0%7C638240582971112471%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> > > DA
> > > iLCJ
> > > QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DX=
s
> > > p0
> > > khWV
> > > DyFkR%2F5Ww4%2B9NlE0RWC5w%2B2tSWcPp8cpbEo%3D&reserved=3D0
> > >
> > > Biju Das (4):
> > >   dt-bindings: display: Document Renesas RZ/G2L DU bindings
> > >   dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
> > >   drm: renesas: Add RZ/G2L DU Support
> > >   MAINTAINERS: Add maintainer for RZ DU drivers
> > >
> > >  .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++
> > >  MAINTAINERS                                   |  15 +-
> > >  drivers/gpu/drm/renesas/Kconfig               |   1 +
> > >  drivers/gpu/drm/renesas/Makefile              |   1 +
> > >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
> > >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 599 ++++++++++++++
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  92 +++
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 180 +++++
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  84
> > > ++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 109
> > > +++  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 +
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 741
> > > ++++++++++++++++++ drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |
> > > 43 + drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 469 +++++++++++
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 +++
> > >  17 files changed, 2674 insertions(+), 2 deletions(-)  create mode
> > > 100644
> > > Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > >
> > > --
> > > 2.25.1

