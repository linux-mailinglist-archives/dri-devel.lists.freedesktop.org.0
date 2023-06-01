Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78097719B7D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 14:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BBA10E116;
	Thu,  1 Jun 2023 12:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C094710E116
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 12:08:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDKKmmq1exXJcqumZtUczrK/axFfb/AQHo6yWLS/toX9zPPf39M8Bj4FzQy16nMYQ4aZyaw8mkFGvT/xf7NuXORx42txHwd639JTBlBRyzCVC7zyB2xi7IKBW3RYYa4EamvxMTqQRpudkWYMkxC9kd1Iebn0dl0g/0VKsKD4AZUAAFV5SGo8KD7fpztZAAXUYQ/8TP4hjo1lifSRHrzMMwTD1Nby9OzHenJFWzt2Kc6HESF6PDYuESQXtf8IPBVSLs1eGeS2iPxMMszvkHdspzPKzrNbS/wk2FyRfU+uvxB6QPGP2xMpCWAUa2iUbrrH9ueRWPJmc018GWkzQEhNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPzKIKkuF540P9n8tprKgOb6txSfGZaIb1S6YUauQ0E=;
 b=BYMMW1uTImoM5KjilRR0ktMH0RfdsCiBGbyEcymCiNGOFzUw9425AFccwINBcEKI/5asFP7crjg0HLP0WW+Zc4feIdTAWNri0N8wqyDO9PxixPNNzeWBPktoKBVmxNHrKVeXPeDG05gdxP3flF+slqcVoTVKvAGX1NIaz9bYcf+u+XCWoPxKovVml0zomOQXa6xmWb1cH6Qf7upGmBmZaB0OtPJKMUC1q6s6brn6igsbLW9tHf/pw0/XlITlF8FnzrmVuZtVIlkpYWfnbas1i847Q5bayvrZEzA2ll1+jjCs2VfYeLWuVDTHouzZJEaZSJ9Ir33AOXyx64FjVvJAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPzKIKkuF540P9n8tprKgOb6txSfGZaIb1S6YUauQ0E=;
 b=D9rdz/80941GJEaKEznGY+2uXs1knbbUFpTS926R4NX0eXur0wyMvJO2D+UqGDE7lB/i5G6rBF/aAECDS3o0MD6k+n/Muz4RSIz8Zm6wlWqTRK2IiS4hJBZiEmsxfDQTmmqtFPcAc44Nh+zkdhulNAN8Wd1sFRvhB1+OdH5dn44=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYBPR01MB5550.jpnprd01.prod.outlook.com (2603:1096:404:8024::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 12:08:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 12:08:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
Thread-Topic: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
Thread-Index: AQHZfN42vFEZgG4dzkicin0/DbOzxq9xjseAgAR2VhA=
Date: Thu, 1 Jun 2023 12:08:44 +0000
Message-ID: <OS0PR01MB5922ED8C626E23D80D1458E386499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <20230502100912.143114-5-biju.das.jz@bp.renesas.com>
 <20230529154305.GB15264@pendragon.ideasonboard.com>
In-Reply-To: <20230529154305.GB15264@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYBPR01MB5550:EE_
x-ms-office365-filtering-correlation-id: 5c5e28d3-168f-4dc1-066d-08db6298f2c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZlPsCy0VmVLIVPtq/iRGz/R7NB2QXacMJRsGxsPS76WlVg/6dtwmTfm37HCgoCsaqXK2PPdViX5YOwwRHf53EosnrEVpGDMRdk4K+/rNiCRWraMAO5OEVU+LkijQqZRz3nUBm+jVaj/h0jLqt1XtUe1SYCRen8dfIX/7u1M28okcwsUoKvzJkt+tyL/33DjurZVHIDC5+4jKKYfJh004NEcG9fXkiEFJV6klzX+rpwv0CFB1Y09ymbrdl+9kJAKmFD2zhHTz76UHNehiVK1V8bsb7L9VEQoPG8vyH6BDcMhB5kBttzhQRSy5JjjkjzYbUUr425tbzoLaFGI0M4Sp8GjZFAaO1wgSQlJqANWxMPhx+tj0/qbb3dfcmpfinF0E7QqXtgFG0vhCLlffxwQNNdFkynC2xc0Hgw3jlGrPEwTYGjwWYu/y+Cfj74/t0pvIg0W0JxVTNNvtUOYV7ZvpOXm4p1kYLKkPKjLmVXUEcMJrnyaOK3eNQp/85oMSa0EdvY+gB7tlrxM32LDXtQ5MuXXSeJjdFSKlKQ+aiZayCiCul8LqLdiv64mwSSX7MtGwMELAePHsT6qDw4/uf+TTtN7/lAT4uFRJgUKiRPFt0M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(966005)(71200400001)(7696005)(478600001)(33656002)(186003)(26005)(6506007)(9686003)(83380400001)(38100700002)(38070700005)(86362001)(122000001)(55016003)(107886003)(316002)(6916009)(4326008)(41300700001)(66946007)(66556008)(76116006)(66476007)(66446008)(64756008)(30864003)(2906002)(8936002)(8676002)(5660300002)(52536014)(54906003)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pXLnk5lqgUa3siwvpvG3Fy8/AtCCP54uR1LZJqnmpQhw5JDrb9mbXGQJTcgG?=
 =?us-ascii?Q?WCNkCJyAt9paK+4f1eer8/nWbV2W++px7G16N0hWfIkcE6yiSzqMRWxb+pQX?=
 =?us-ascii?Q?5l5TP+NKtUuDIEGjWW2TBdvm8Lk5NCRsX8PqO9QKBPXrucJAAfxdea1wmCQg?=
 =?us-ascii?Q?0e8UK63+eisldqkN29BK6JaMtDs0+wEb17gIFXSb4RnqUWXndsIcdHuGgX5Q?=
 =?us-ascii?Q?MLSMXglh2M7wcjtPebbvMLLkwhm3TNDrY5c75feSisiFLtdcXja8efQAZLom?=
 =?us-ascii?Q?550N7tAqJJqbGEDAEiNS4PWb1TbOPDbghd5IMqdG+mh0kOCsfTVISWyG2SaL?=
 =?us-ascii?Q?2Tq/ASJQ2hp0pSDEOnz0q9SfaHNIWsd4Qw8Jmy8nIKZ2XX07m3SXwaOEUxsh?=
 =?us-ascii?Q?RmacfHmNcnM/TVw8ItBJv//vU+Eoyav9xbCrKtLXVaGzdhl7cCR+9Zg/SDgf?=
 =?us-ascii?Q?vvqdQRmj1Xy1SP9AcLrQruOH6P41eQmtFWmzNVEq8vl1rMxnC3ktKv4WWiyR?=
 =?us-ascii?Q?YMzUDJIvJDwnc9J98vSyeg573LTXnJWCIuDu8QTsnXUqdq2J8oEmt3LTM1TI?=
 =?us-ascii?Q?bK9Q2dRdXgAtlChTsGEud7NSvH31teqFK/0U78ob2sXrZ9dek4qQQWqcH7jN?=
 =?us-ascii?Q?yWRNRAgc9Df9PZK+24Ed3vJpmChz1iIDHNct6Kn38XwkXYi4V6J8I3ZGGNkD?=
 =?us-ascii?Q?z/cZc/wUIamR/0ldPY2nY4sk8Un8e9+GDxzKQdInIph8Wy5rxHLEtvLUsako?=
 =?us-ascii?Q?+Q/tpWjeR9pxff8TTXiFmLevs54bzPNO6WfPiqUd85JH2tU4fZrHS/LvPO8H?=
 =?us-ascii?Q?scrbcs9Ibb/lZypS8tOhKczgP+GRe/tfrupEPGA720W7lGuc0/Qu553xvoUo?=
 =?us-ascii?Q?rOfuLqWTrvlc722OcgKRA/cclMxKMIlXWV2dzbbX3VaIToZiK7i45UBqcrPH?=
 =?us-ascii?Q?zaiTu+0iE9JOXqQpTXibbxHdRdqAx7xN4MmcCb34WErQ6FLKW6VJvc7X4aCh?=
 =?us-ascii?Q?eDNqClsoEWsZGXCf5h3fSOd2ZjKKNyNaoesgFvzFu0HH7q0IHvK3+xMNjtKQ?=
 =?us-ascii?Q?4lSZGMvNpPCo8M5DCbum+RXx96C2zzVqWtuv+jCQ4r9VQ1wz8h7F3YUj4q4U?=
 =?us-ascii?Q?R0sT5eBiT0NeU93iv4em8DQoiuylVVK58naHBoiGoH7hy6xXWtsqULgVyrDp?=
 =?us-ascii?Q?hdBTl70IDgp/6qbUipjE2pB8gYcUGYb+IPqvf4ZV0cd4MX4D5X9Unmz7OTdQ?=
 =?us-ascii?Q?MjGg3MrRq9/WiIrgE5mnVoOVXxQyrynuJrUk2QiIX6LzGbSnEmvlDOfEqNBU?=
 =?us-ascii?Q?nyhe5oqMghqwg3IZ4xfDUJ3l9lqM2b95/KCeukdjuRdOqNlzKZcuAZYksg9y?=
 =?us-ascii?Q?iM28/puJQ6veJyHI3kbFivgLGvq3/VgZWVbLxpzNxPFIYmf+ezQiuWlWithX?=
 =?us-ascii?Q?oMbmS72I344uomAo78Ix7i0Bw8FDXz0UUmU9u49tIh035f/jNz3ZtBMXAmq/?=
 =?us-ascii?Q?GPI3Rhn5Ju6iYY1rjSPA03prl74HohQwzRKZdyBb5TqYq1zY0H/anfF71W5S?=
 =?us-ascii?Q?bCXybiV2MYJvvrqbO9OQhEqzD4npvI4infP5Ph9p9WQwi8gPoX4ns9jll36L?=
 =?us-ascii?Q?3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5e28d3-168f-4dc1-066d-08db6298f2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 12:08:45.0388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /7XQZrQDN2im+y9fPk+AB3oYXXZls4wyWXUKgzwQMryoIZSB63k9bLufA2yinoSFbdY5u1++orfqxX3N7K4HkQ5pz714pujQ62GHhaN7bXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5550
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> This is a partial review, because the driver is big, and because some
> changes in v10 will (hopefully) simplify the code and make review
> easier.

I agree v10 will simplify the code as I have do clean-ups based on your
review commnet.

>=20
> On Tue, May 02, 2023 at 11:09:11AM +0100, Biju Das wrote:
> > The LCD controller is composed of Frame Compression Processor (FCPVD),
> > Video Signal Processor (VSPD), and Display Unit (DU).
> >
> > It has DPI/DSI interfaces and supports a maximum resolution of 1080p
> > along with 2 RPFs to support the blending of two picture layers and
> > raster operations (ROPs).
> >
> > The DU module is connected to VSPD. Add RZ/G2L DU support for RZ/G2L
> > alike SoCs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > Ref:
> >
> > v8->v9:
> >  * Dropped reset_control_assert() from error patch for
> rzg2l_du_crtc_get() as
> >    suggested by Philipp Zabel.
> > v7->v8:
> >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating
> rz_du folder.
> >  * Updated KConfig and Makefile.
> > v6->v7:
> >  * Split DU lib and  RZ/G2L du driver as separate patch series as
> >    DU support added to more platforms based on RZ/G2L alike SoCs.
> >  * Rebased to latest drm-tip.
> >  * Added patch #2 for binding support for RZ/V2L DU
> >  * Added patch #4 for driver support for RZ/V2L DU
> >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> >  * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L}
> SoCs.
> >  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
> > ---
> >  drivers/gpu/drm/renesas/Kconfig               |   1 +
> >  drivers/gpu/drm/renesas/Makefile              |   1 +
> >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
> >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714 ++++++++++++++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  99 +++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
> >  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
> >  .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770
> ++++++++++++++++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
> >  15 files changed, 2664 insertions(+)
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> >
> > diff --git a/drivers/gpu/drm/renesas/Kconfig
> b/drivers/gpu/drm/renesas/Kconfig
> > index 3777dad17f81..21862a8ef710 100644
> > --- a/drivers/gpu/drm/renesas/Kconfig
> > +++ b/drivers/gpu/drm/renesas/Kconfig
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >
> >  source "drivers/gpu/drm/renesas/rcar-du/Kconfig"
> > +source "drivers/gpu/drm/renesas/rz-du/Kconfig"
> >  source "drivers/gpu/drm/renesas/shmobile/Kconfig"
> > diff --git a/drivers/gpu/drm/renesas/Makefile
> b/drivers/gpu/drm/renesas/Makefile
> > index ec0e89e7a592..b8d8bc53967f 100644
> > --- a/drivers/gpu/drm/renesas/Makefile
> > +++ b/drivers/gpu/drm/renesas/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  obj-y +=3D rcar-du/
> > +obj-y +=3D rz-du/
> >  obj-$(CONFIG_DRM_SHMOBILE) +=3D shmobile/
> > diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig
> b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > new file mode 100644
> > index 000000000000..90b1bf72e23b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> > @@ -0,0 +1,20 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +config DRM_RZG2L_DU
> > +	tristate "DRM Support for RZ/G2L Display Unit"
> > +	depends on DRM && OF
> > +	depends on ARM64
>=20
> Does the driver fail to compile on !ARM64 platforms ? If no, I'd drop
> this.

Agreed.

>=20
> > +	depends on DRM_RCAR_VSP
> > +	depends on ARCH_RZG2L || COMPILE_TEST
> > +	select DRM_KMS_HELPER
> > +	select DRM_GEM_DMA_HELPER
>=20
> Alphabetical order please.

Ok.

>=20
> > +	select VIDEOMODE_HELPERS
> > +	help
> > +	  Choose this option if you have an RZ/G2L alike chipset.
> > +	  If M is selected the module will be called rzg2l-du-drm.
> > +
> > +config DRM_RCAR_VSP
> > +	bool "R-Car DU VSP Compositor Support" if ARM
> > +	default y if ARM64
> > +	depends on VIDEO_RENESAS_VSP1
> > +	help
> > +	  Enable support to expose the R-Car VSP Compositor as KMS planes.
>=20
> This duplicates the config symbol in
> drivers/gpu/drm/renesas/rcar-du/Kconfig.
>=20
> Unlike on R-Car, where some SoC generations can operate without the VSP,
> RZ/G2L requires the VSP. You can drop this configuration option and just
> make DRM_RZG2L_DU depend on VIDEO_RENESAS_VSP1.

OK, Will make DRM_RZG2L_DU depend on VIDEO_RENESAS_VSP1.

>=20
> > diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile
> b/drivers/gpu/drm/renesas/rz-du/Makefile
> > new file mode 100644
> > index 000000000000..2cdf3ccd0459
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/Makefile
> > @@ -0,0 +1,8 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +rzg2l-du-drm-y :=3D rzg2l_du_crtc.o \
> > +		  rzg2l_du_drv.o \
> > +		  rzg2l_du_encoder.o \
> > +		  rzg2l_du_kms.o \
> > +
> > +rzg2l-du-drm-$(CONFIG_DRM_RCAR_VSP)	+=3D rzg2l_du_vsp.o
> > +obj-$(CONFIG_DRM_RZG2L_DU)		+=3D rzg2l-du-drm.o
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > new file mode 100644
> > index 000000000000..d61d433d72e6
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > @@ -0,0 +1,714 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * RZ/G2L Display Unit CRTCs
> > + *
> > + * Copyright (C) 2023 Renesas Electronics Corporation
> > + *
> > + * Based on rcar_du_crtc.c
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include <drm/drm_atomic.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_framebuffer.h>
> > +#include <drm/drm_gem_dma_helper.h>
> > +#include <drm/drm_vblank.h>
> > +
> > +#include "rzg2l_du_crtc.h"
> > +#include "rzg2l_du_drv.h"
> > +#include "rzg2l_du_encoder.h"
> > +#include "rzg2l_du_kms.h"
> > +#include "rzg2l_du_vsp.h"
> > +#include "rzg2l_du_regs.h"
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * Hardware Setup
> > + */
> > +
> > +static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc
> *rcrtc)
> > +{
> > +	const struct drm_display_mode *mode =3D &rcrtc->crtc.state-
> >adjusted_mode;
> > +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> > +	unsigned long mode_clock =3D mode->clock * 1000;
> > +	u32 ditr0, ditr1, ditr2, ditr3, ditr4, ditr5, pbcr0;
> > +	struct clk *parent_clk;
> > +
> > +	parent_clk =3D clk_get_parent(rcrtc->rzg2l_clocks.dclk);
> > +	clk_set_rate(parent_clk, mode_clock);
>=20
> Shouldn't the clock framework configure the parent correctly if you set
> the dclk rate ?

Yes it will do.

>=20
> > +
> > +	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
> > +
> > +	ditr0 =3D (DU_DITR0_DEMD_HIGH
> > +		 | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DU_DITR0_VSPOL :
> 0)
> > +		 | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DU_DITR0_HSPOL :
> 0));
>=20
> No need for the outer parentheses.
>=20
> I usually align the | under the =3D, but that's up to you.

OK will align | under the =3D

>=20
> > +
> > +	ditr1 =3D DU_DITR1_VSA(mode->vsync_end - mode->vsync_start)
> > +		| DU_DITR1_VACTIVE(mode->vdisplay);
> > +
> > +	ditr2 =3D DU_DITR2_VBP(mode->vtotal - mode->vsync_end)
> > +		| DU_DITR2_VFP(mode->vsync_start - mode->vdisplay);
> > +
> > +	ditr3 =3D DU_DITR3_HSA(mode->hsync_end - mode->hsync_start)
> > +		| DU_DITR3_HACTIVE(mode->hdisplay);
> > +
> > +	ditr4 =3D DU_DITR4_HBP(mode->htotal - mode->hsync_end)
> > +		| DU_DITR4_HFP(mode->hsync_start - mode->hdisplay);
> > +
> > +	ditr5 =3D DU_DITR5_VSFT(0) | DU_DITR5_HSFT(0);
> > +
> > +	pbcr0 =3D DU_PBCR0_PB_DEP(0x1f);
> > +
> > +	writel(ditr0, rcdu->mmio + DU_DITR0);
>=20
> Please implement read/write wrappers that take an rcdu pointer and add
> the offset. It will simplify the callers.

I have implemented write as there is no user for read.

>=20
> > +	writel(ditr1, rcdu->mmio + DU_DITR1);
> > +	writel(ditr2, rcdu->mmio + DU_DITR2);
> > +	writel(ditr3, rcdu->mmio + DU_DITR3);
> > +	writel(ditr4, rcdu->mmio + DU_DITR4);
> > +	writel(ditr5, rcdu->mmio + DU_DITR5);
> > +	writel(pbcr0, rcdu->mmio + DU_PBCR0);
> > +
> > +	/* Enable auto resume when underrun */
> > +	writel(DU_MCR1_PB_AUTOCLR, rcdu->mmio + DU_MCR1);
> > +}
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * Page Flip
> > + */
> > +
> > +void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	struct drm_pending_vblank_event *event;
> > +	struct drm_device *dev =3D rcrtc->crtc.dev;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&dev->event_lock, flags);
> > +	event =3D rcrtc->event;
> > +	rcrtc->event =3D NULL;
> > +	spin_unlock_irqrestore(&dev->event_lock, flags);
> > +
> > +	if (!event)
> > +		return;
> > +
> > +	spin_lock_irqsave(&dev->event_lock, flags);
> > +	drm_crtc_send_vblank_event(&rcrtc->crtc, event);
> > +	wake_up(&rcrtc->flip_wait);
> > +	spin_unlock_irqrestore(&dev->event_lock, flags);
> > +
> > +	drm_crtc_vblank_put(&rcrtc->crtc);
> > +}
> > +
> > +static bool rzg2l_du_crtc_page_flip_pending(struct rzg2l_du_crtc
> *rcrtc)
> > +{
> > +	struct drm_device *dev =3D rcrtc->crtc.dev;
> > +	unsigned long flags;
> > +	bool pending;
> > +
> > +	spin_lock_irqsave(&dev->event_lock, flags);
> > +	pending =3D rcrtc->event;
> > +	spin_unlock_irqrestore(&dev->event_lock, flags);
> > +
> > +	return pending;
> > +}
> > +
> > +static void rzg2l_du_crtc_wait_page_flip(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> > +
> > +	if (wait_event_timeout(rcrtc->flip_wait,
> > +			       !rzg2l_du_crtc_page_flip_pending(rcrtc),
> > +			       msecs_to_jiffies(50)))
> > +		return;
> > +
> > +	dev_warn(rcdu->dev, "page flip timeout\n");
> > +
> > +	rzg2l_du_crtc_finish_page_flip(rcrtc);
> > +}
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * Start/Stop and Suspend/Resume
> > + */
> > +
> > +static void rzg2l_du_crtc_setup(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	/* Configure display timings and output routing */
> > +	rzg2l_du_crtc_set_display_timing(rcrtc);
> > +
> > +	/* Enable the VSP compositor. */
> > +	rzg2l_du_vsp_enable(rcrtc);
> > +
> > +	/* Turn vertical blanking interrupt reporting on. */
> > +	drm_crtc_vblank_on(&rcrtc->crtc);
> > +}
> > +
> > +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	int ret;
> > +
> > +	/*
> > +	 * Guard against double-get, as the function is called from both
> the
> > +	 * .atomic_enable() and .atomic_begin() handlers.
> > +	 */
> > +	if (rcrtc->initialized)
> > +		return 0;
> > +
> > +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret =3D clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
> > +	if (ret < 0)
> > +		goto error_bus_clock;
> > +
> > +	ret =3D reset_control_deassert(rcrtc->rstc);
> > +	if (ret < 0)
> > +		goto error_peri_clock;
> > +
> > +	rzg2l_du_crtc_setup(rcrtc);
> > +	rcrtc->initialized =3D true;
> > +
> > +	return 0;
> > +
> > +error_peri_clock:
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> > +error_bus_clock:
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> > +	return ret;
> > +}
> > +
> > +static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.dclk);
> > +	reset_control_assert(rcrtc->rstc);
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
> > +	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
> > +
> > +	rcrtc->initialized =3D false;
> > +}
> > +
> > +static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool
> start)
> > +{
> > +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> > +
> > +	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
> > +}
> > +
> > +static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	rzg2l_du_start_stop(rcrtc, true);
> > +}
> > +
> > +static void rzg2l_du_crtc_disable_planes(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	struct rzg2l_du_device *rcdu =3D rcrtc->dev;
> > +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> > +
> > +	/* Make sure vblank interrupts are enabled. */
> > +	drm_crtc_vblank_get(crtc);
> > +
> > +	if (!wait_event_timeout(rcrtc->vblank_wait, rcrtc->vblank_count =3D=
=3D
> 0,
> > +				msecs_to_jiffies(100)))
> > +		dev_warn(rcdu->dev, "vertical blanking timeout\n");
> > +
> > +	drm_crtc_vblank_put(crtc);
>=20
> This while function seems dubious given that vblank_count is never set
> to a non-zero value. I think you need to revisit the CRTC enable/disable
> code to match the needs of your hardware, which seems to be different
> than what the R-Car DU needs.

OK, will drop this function.

>=20
> > +}
> > +
> > +static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> > +
> > +	/*
> > +	 * Disable all planes and wait for the change to take effect. This
> is
> > +	 * required as the plane enable registers are updated on vblank,
> and no
> > +	 * vblank will occur once the CRTC is stopped. Disabling planes
> when
> > +	 * starting the CRTC thus wouldn't be enough as it would start
> scanning
> > +	 * out immediately from old frame buffers until the next vblank.
> > +	 *
> > +	 * This increases the CRTC stop delay, especially when multiple
> CRTCs
> > +	 * are stopped in one operation as we now wait for one vblank per
> CRTC.
> > +	 * Whether this can be improved needs to be researched.
> > +	 */
> > +	rzg2l_du_crtc_disable_planes(rcrtc);
> > +
> > +	/*
> > +	 * Disable vertical blanking interrupt reporting. We first need to
> wait
> > +	 * for page flip completion before stopping the CRTC as userspace
> > +	 * expects page flips to eventually complete.
> > +	 */
> > +	rzg2l_du_crtc_wait_page_flip(rcrtc);
> > +	drm_crtc_vblank_off(crtc);
> > +
> > +	/* Disable the VSP compositor. */
> > +	rzg2l_du_vsp_disable(rcrtc);
> > +
> > +	rzg2l_du_start_stop(rcrtc, false);
> > +}
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * CRTC Functions
> > + */
> > +
> > +int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
> > +				       struct drm_plane_state *state,
> > +				       const struct rzg2l_du_format_info
> **format)
>=20
> This function is only called from rzg2l_du_vsp_plane_atomic_check(), I
> would inline it there.

Agreed.

>=20
> > +{
> > +	struct drm_device *dev =3D plane->dev;
> > +	struct drm_crtc_state *crtc_state;
> > +	int ret;
> > +
> > +	if (!state->crtc) {
> > +		/*
> > +		 * The visible field is not reset by the DRM core but only
> > +		 * updated by drm_plane_helper_check_state(), set it
> manually.
> > +		 */
> > +		state->visible =3D false;
> > +		*format =3D NULL;
> > +		return 0;
> > +	}
> > +
> > +	crtc_state =3D drm_atomic_get_crtc_state(state->state, state->crtc);
> > +	if (IS_ERR(crtc_state))
> > +		return PTR_ERR(crtc_state);
> > +
> > +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> > +						  DRM_PLANE_NO_SCALING,
> > +						  DRM_PLANE_NO_SCALING,
> > +						  true, true);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	if (!state->visible) {
> > +		*format =3D NULL;
> > +		return 0;
> > +	}
> > +
> > +	*format =3D rzg2l_du_format_info(state->fb->format->format);
> > +	if (*format =3D=3D NULL) {
>=20
> Can this happen, or does the DRM core already checks that the
> framebuffer format is supported by the plane ?

This will make sure the format is as per rzg2l_du_format_info,
Otherwise print unsupported format.

>=20
> > +		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
> > +			state->fb->format->format);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
> > +				      struct drm_atomic_state *state)
> > +{
> > +	struct drm_crtc_state *crtc_state =3D
> drm_atomic_get_new_crtc_state(state,
> > +									  crtc);
> > +	struct rzg2l_du_crtc_state *rstate =3D
> to_rzg2l_crtc_state(crtc_state);
> > +	struct drm_encoder *encoder;
> > +
> > +	/* Store the routes from the CRTC output to the DU outputs. */
> > +	rstate->outputs =3D 0;
> > +
> > +	drm_for_each_encoder_mask(encoder, crtc->dev,
> > +				  crtc_state->encoder_mask) {
> > +		struct rzg2l_du_encoder *renc;
> > +
> > +		/* Skip the writeback encoder. */
> > +		if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_VIRTUAL)
> > +			continue;
> > +
> > +		renc =3D to_rzg2l_encoder(encoder);
> > +		rstate->outputs |=3D BIT(renc->output);
> > +	}
>=20
> Unless I'm mistaken, once you drop dpad0_source, this whole function can
> be dropped too.

I agree. Will drop it.

>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
> > +					struct drm_atomic_state *state)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	rzg2l_du_crtc_get(rcrtc);
> > +
> > +	rzg2l_du_crtc_start(rcrtc);
> > +}
> > +
> > +static void rzg2l_du_crtc_atomic_disable(struct drm_crtc *crtc,
> > +					 struct drm_atomic_state *state)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	rzg2l_du_crtc_stop(rcrtc);
> > +	rzg2l_du_crtc_put(rcrtc);
> > +
> > +	spin_lock_irq(&crtc->dev->event_lock);
> > +	if (crtc->state->event) {
> > +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> > +		crtc->state->event =3D NULL;
> > +	}
> > +	spin_unlock_irq(&crtc->dev->event_lock);
> > +}
> > +
> > +static void rzg2l_du_crtc_atomic_begin(struct drm_crtc *crtc,
> > +				       struct drm_atomic_state *state)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	WARN_ON(!crtc->state->enable);
> > +
> > +	/*
> > +	 * If a mode set is in progress we can be called with the CRTC
> disabled.
> > +	 * We thus need to first get and setup the CRTC in order to
> configure
> > +	 * planes. We must *not* put the CRTC in .atomic_flush(), as it
> must be
> > +	 * kept awake until the .atomic_enable() call that will follow.
> The get
> > +	 * operation in .atomic_enable() will in that case be a no-op, and
> the
> > +	 * CRTC will be put later in .atomic_disable().
> > +	 *
> > +	 * If a mode set is not in progress the CRTC is enabled, and the
> > +	 * following get call will be a no-op. There is thus no need to
> balance
> > +	 * it in .atomic_flush() either.
> > +	 */
>=20
> This should also be reconsidered based on the needs of your hardware,
> given that you don't need to setup planes like in the R-Car DU driver.
> The CRTC handling can most likely be simplified a lot.


OK will drop this function and move the below code to flush.

WARN_ON(!crtc->state->enable);
rzg2l_du_crtc_get(rcrtc);=20

>=20
> > +	rzg2l_du_crtc_get(rcrtc);
> > +
> > +	rzg2l_du_vsp_atomic_begin(rcrtc);
> > +}
> > +
> > +static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
> > +				       struct drm_atomic_state *state)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +	struct drm_device *dev =3D rcrtc->crtc.dev;
> > +	unsigned long flags;
> > +
> > +	if (crtc->state->event) {
> > +		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
> > +
> > +		spin_lock_irqsave(&dev->event_lock, flags);
> > +		rcrtc->event =3D crtc->state->event;
> > +		crtc->state->event =3D NULL;
> > +		spin_unlock_irqrestore(&dev->event_lock, flags);
> > +	}
> > +
> > +	rzg2l_du_vsp_atomic_flush(rcrtc);
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs crtc_helper_funcs =3D {
> > +	.atomic_check =3D rzg2l_du_crtc_atomic_check,
> > +	.atomic_begin =3D rzg2l_du_crtc_atomic_begin,
> > +	.atomic_flush =3D rzg2l_du_crtc_atomic_flush,
> > +	.atomic_enable =3D rzg2l_du_crtc_atomic_enable,
> > +	.atomic_disable =3D rzg2l_du_crtc_atomic_disable,
> > +};
> > +
> > +static void rzg2l_du_crtc_crc_init(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	const char **sources;
> > +	unsigned int count;
> > +	int i =3D -1;
> > +
> > +	/* Reserve 1 for "auto" source. */
> > +	count =3D rcrtc->vsp->num_planes + 1;
> > +
> > +	sources =3D kmalloc_array(count, sizeof(*sources), GFP_KERNEL);
> > +	if (!sources)
> > +		return;
> > +
> > +	sources[0] =3D kstrdup("auto", GFP_KERNEL);
> > +	if (!sources[0])
> > +		goto error;
> > +
> > +	for (i =3D 0; i < rcrtc->vsp->num_planes; ++i) {
> > +		struct drm_plane *plane =3D &rcrtc->vsp->planes[i].plane;
> > +		char name[16];
> > +
> > +		sprintf(name, "plane%u", plane->base.id);
> > +		sources[i + 1] =3D kstrdup(name, GFP_KERNEL);
> > +		if (!sources[i + 1])
> > +			goto error;
> > +	}
> > +
> > +	rcrtc->sources =3D sources;
> > +	rcrtc->sources_count =3D count;
> > +	return;
> > +
> > +error:
> > +	while (i >=3D 0) {
> > +		kfree(sources[i]);
> > +		i--;
> > +	}
> > +	kfree(sources);
> > +}
> > +
> > +static void rzg2l_du_crtc_crc_cleanup(struct rzg2l_du_crtc *rcrtc)
> > +{
> > +	unsigned int i;
> > +
> > +	if (!rcrtc->sources)
> > +		return;
> > +
> > +	for (i =3D 0; i < rcrtc->sources_count; i++)
> > +		kfree(rcrtc->sources[i]);
> > +	kfree(rcrtc->sources);
> > +
> > +	rcrtc->sources =3D NULL;
> > +	rcrtc->sources_count =3D 0;
> > +}
> > +
> > +static struct drm_crtc_state *
> > +rzg2l_du_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc_state *state;
> > +	struct rzg2l_du_crtc_state *copy;
> > +
> > +	if (WARN_ON(!crtc->state))
> > +		return NULL;
> > +
> > +	state =3D to_rzg2l_crtc_state(crtc->state);
> > +	copy =3D kmemdup(state, sizeof(*state), GFP_KERNEL);
> > +	if (!copy)
> > +		return NULL;
> > +
> > +	__drm_atomic_helper_crtc_duplicate_state(crtc, &copy->state);
> > +
> > +	return &copy->state;
> > +}
> > +
> > +static void rzg2l_du_crtc_atomic_destroy_state(struct drm_crtc *crtc,
> > +					       struct drm_crtc_state *state)
> > +{
> > +	__drm_atomic_helper_crtc_destroy_state(state);
> > +	kfree(to_rzg2l_crtc_state(state));
> > +}
> > +
> > +static void rzg2l_du_crtc_cleanup(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	rzg2l_du_crtc_crc_cleanup(rcrtc);
> > +
> > +	return drm_crtc_cleanup(crtc);
> > +}
> > +
> > +static void rzg2l_du_crtc_reset(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc_state *state;
> > +
> > +	if (crtc->state) {
> > +		rzg2l_du_crtc_atomic_destroy_state(crtc, crtc->state);
> > +		crtc->state =3D NULL;
> > +	}
> > +
> > +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > +	if (!state)
> > +		return;
> > +
> > +	state->crc.source =3D VSP1_DU_CRC_NONE;
> > +	state->crc.index =3D 0;
> > +
> > +	__drm_atomic_helper_crtc_reset(crtc, &state->state);
> > +}
> > +
> > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	rcrtc->vblank_enable =3D true;
> > +
> > +	return 0;
> > +}
> > +
> > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	rcrtc->vblank_enable =3D false;
> > +}
> > +
> > +static int rzg2l_du_crtc_parse_crc_source(struct rzg2l_du_crtc
> *rcrtc,
> > +					  const char *source_name,
> > +					  enum vsp1_du_crc_source *source)
> > +{
> > +	unsigned int index;
> > +	int ret;
> > +
> > +	/*
> > +	 * Parse the source name. Supported values are "plane%u" to
> compute the
> > +	 * CRC on an input plane (%u is the plane ID), and "auto" to
> compute the
> > +	 * CRC on the composer (VSP) output.
> > +	 */
> > +
> > +	if (!source_name) {
> > +		*source =3D VSP1_DU_CRC_NONE;
> > +		return 0;
> > +	} else if (!strcmp(source_name, "auto")) {
> > +		*source =3D VSP1_DU_CRC_OUTPUT;
> > +		return 0;
> > +	} else if (strstarts(source_name, "plane")) {
> > +		unsigned int i;
> > +
> > +		*source =3D VSP1_DU_CRC_PLANE;
> > +
> > +		ret =3D kstrtouint(source_name + strlen("plane"), 10, &index);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		for (i =3D 0; i < rcrtc->vsp->num_planes; ++i) {
> > +			if (index =3D=3D rcrtc->vsp->planes[i].plane.base.id)
> > +				return i;
> > +		}
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> > +static int rzg2l_du_crtc_verify_crc_source(struct drm_crtc *crtc,
> > +					   const char *source_name,
> > +					   size_t *values_cnt)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +	enum vsp1_du_crc_source source;
> > +
> > +	if (rzg2l_du_crtc_parse_crc_source(rcrtc, source_name, &source) <
> 0) {
> > +		DRM_DEBUG_DRIVER("unknown source %s\n", source_name);
> > +		return -EINVAL;
> > +	}
> > +
> > +	*values_cnt =3D 1;
> > +	return 0;
> > +}
> > +
> > +static const char *const *
> > +rzg2l_du_crtc_get_crc_sources(struct drm_crtc *crtc, size_t *count)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +
> > +	*count =3D rcrtc->sources_count;
> > +	return rcrtc->sources;
> > +}
> > +
> > +static int rzg2l_du_crtc_set_crc_source(struct drm_crtc *crtc,
> > +					const char *source_name)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > +	struct drm_modeset_acquire_ctx ctx;
> > +	struct drm_crtc_state *crtc_state;
> > +	struct drm_atomic_state *state;
> > +	enum vsp1_du_crc_source source;
> > +	unsigned int index;
> > +	int ret;
> > +
> > +	ret =3D rzg2l_du_crtc_parse_crc_source(rcrtc, source_name, &source);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	index =3D ret;
> > +
> > +	/* Perform an atomic commit to set the CRC source. */
> > +	drm_modeset_acquire_init(&ctx, 0);
> > +
> > +	state =3D drm_atomic_state_alloc(crtc->dev);
> > +	if (!state) {
> > +		ret =3D -ENOMEM;
> > +		goto unlock;
> > +	}
> > +
> > +	state->acquire_ctx =3D &ctx;
> > +
> > +retry:
> > +	crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > +	if (!IS_ERR(crtc_state)) {
> > +		struct rzg2l_du_crtc_state *rcrtc_state;
> > +
> > +		rcrtc_state =3D to_rzg2l_crtc_state(crtc_state);
> > +		rcrtc_state->crc.source =3D source;
> > +		rcrtc_state->crc.index =3D index;
> > +
> > +		ret =3D drm_atomic_commit(state);
> > +	} else {
> > +		ret =3D PTR_ERR(crtc_state);
> > +	}
> > +
> > +	if (ret =3D=3D -EDEADLK) {
> > +		drm_atomic_state_clear(state);
> > +		drm_modeset_backoff(&ctx);
> > +		goto retry;
> > +	}
> > +
> > +	drm_atomic_state_put(state);
> > +
> > +unlock:
> > +	drm_modeset_drop_locks(&ctx);
> > +	drm_modeset_acquire_fini(&ctx);
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct drm_crtc_funcs crtc_funcs_rz =3D {
> > +	.reset =3D rzg2l_du_crtc_reset,
> > +	.destroy =3D rzg2l_du_crtc_cleanup,
> > +	.set_config =3D drm_atomic_helper_set_config,
> > +	.page_flip =3D drm_atomic_helper_page_flip,
> > +	.atomic_duplicate_state =3D rzg2l_du_crtc_atomic_duplicate_state,
> > +	.atomic_destroy_state =3D rzg2l_du_crtc_atomic_destroy_state,
> > +	.enable_vblank =3D rzg2l_du_crtc_enable_vblank,
> > +	.disable_vblank =3D rzg2l_du_crtc_disable_vblank,
> > +	.set_crc_source =3D rzg2l_du_crtc_set_crc_source,
> > +	.verify_crc_source =3D rzg2l_du_crtc_verify_crc_source,
> > +	.get_crc_sources =3D rzg2l_du_crtc_get_crc_sources,
> > +};
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * Initialization
> > + */
> > +
> > +int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
> > +{
> > +	struct rzg2l_du_crtc *rcrtc =3D &rcdu->crtcs[0];
> > +	struct drm_crtc *crtc =3D &rcrtc->crtc;
> > +	struct drm_plane *primary;
> > +	int ret;
> > +
> > +	rcrtc->rstc =3D devm_reset_control_get_shared(rcdu->dev, NULL);
> > +	if (IS_ERR(rcrtc->rstc)) {
> > +		dev_err(rcdu->dev, "can't get cpg reset\n");
> > +		return PTR_ERR(rcrtc->rstc);
> > +	}
> > +
> > +	rcrtc->rzg2l_clocks.aclk =3D devm_clk_get(rcdu->dev, "aclk");
> > +	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
> > +		dev_err(rcdu->dev, "no axi clock for DU\n");
> > +		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
> > +	}
> > +
> > +	rcrtc->rzg2l_clocks.pclk =3D devm_clk_get(rcdu->dev, "pclk");
> > +	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
> > +		dev_err(rcdu->dev, "no peripheral clock for DU\n");
> > +		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
> > +	}
> > +
> > +	rcrtc->rzg2l_clocks.dclk =3D devm_clk_get(rcdu->dev, "vclk");
> > +	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
> > +		dev_err(rcdu->dev, "no video clock for DU\n");
> > +		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
> > +	}
> > +
> > +	init_waitqueue_head(&rcrtc->flip_wait);
> > +	init_waitqueue_head(&rcrtc->vblank_wait);
> > +	spin_lock_init(&rcrtc->vblank_lock);
> > +
> > +	rcrtc->dev =3D rcdu;
> > +	rcrtc->index =3D 0;
> > +
> > +	primary =3D &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
> > +
> > +	ret =3D drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
> > +					&crtc_funcs_rz, NULL);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
> > +
> > +	rzg2l_du_crtc_crc_init(rcrtc);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > new file mode 100644
> > index 000000000000..290b5ea99545
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > @@ -0,0 +1,99 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * RZ/G2L Display Unit CRTCs
> > + *
> > + * Copyright (C) 2023 Renesas Electronics Corporation
> > + *
> > + * Based on rcar_du_crtc.h
> > + */
> > +
> > +#ifndef __RZG2L_DU_CRTC_H__
> > +#define __RZG2L_DU_CRTC_H__
> > +
> > +#include <linux/mutex.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/wait.h>
> > +
> > +#include <drm/drm_crtc.h>
> > +#include <drm/drm_writeback.h>
> > +
> > +#include <media/vsp1.h>
> > +
>=20
> Missing struct clk. Please go through the headers and add missing
> forward declarations, or drop unneeded ones.

OK will do.

>=20
> > +struct reset_control;
> > +struct rzg2l_du_vsp;
> > +struct rzg2l_du_format_info;
> > +
> > +/**
> > + * struct rzg2l_du_crtc - the CRTC, representing a DU superposition
> processor
> > + * @crtc: base DRM CRTC
> > + * @dev: the DU device
> > + * @mmio_offset: offset of the CRTC registers in the DU MMIO block
> > + * @index: CRTC hardware index
> > + * @initialized: whether the CRTC has been initialized and clocks
> enabled
> > + * @vblank_enable: whether vblank events are enabled on this CRTC
> > + * @event: event to post when the pending page flip completes
> > + * @flip_wait: wait queue used to signal page flip completion
> > + * @vblank_lock: protects vblank_wait and vblank_count
> > + * @vblank_wait: wait queue used to signal vertical blanking
> > + * @vblank_count: number of vertical blanking interrupts to wait for
> > + * @vsp: VSP feeding video to this CRTC
> > + * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
> > + * @rstc: reset controller
> > + * @rzg2l_clocks: the bus, main and video clock
> > + */
> > +struct rzg2l_du_crtc {
> > +	struct drm_crtc crtc;
> > +
> > +	struct rzg2l_du_device *dev;
> > +	unsigned int mmio_offset;
>=20
> Not used. Please go through all structure fields and drop the unused
> ones (including both the fully unused fields, and the fields that are
> written but never read).

Agreed.

>=20
> > +	unsigned int index;
> > +	bool initialized;
> > +
> > +	bool vblank_enable;
> > +	struct drm_pending_vblank_event *event;
> > +	wait_queue_head_t flip_wait;
> > +
> > +	spinlock_t vblank_lock;
> > +	wait_queue_head_t vblank_wait;
> > +	unsigned int vblank_count;
> > +
> > +	struct rzg2l_du_vsp *vsp;
> > +	unsigned int vsp_pipe;
> > +
> > +	const char *const *sources;
> > +	unsigned int sources_count;
> > +
> > +	struct reset_control *rstc;
> > +	struct {
> > +		struct clk *aclk;
> > +		struct clk *pclk;
> > +		struct clk *dclk;
> > +	} rzg2l_clocks;
> > +};
> > +
> > +#define to_rzg2l_crtc(c)	container_of(c, struct rzg2l_du_crtc,
> crtc)
>=20
> A static inline would be better than a macro, it's more type-safe. Same
> for to_rzg2l_crtc_state() and to_rzg2l_encoder().

Will use static inline.
>=20
> > +
> > +/**
> > + * struct rzg2l_du_crtc_state - Driver-specific CRTC state
> > + * @state: base DRM CRTC state
> > + * @crc: CRC computation configuration
> > + * @outputs: bitmask of the outputs (enum rzg2l_du_output) driven by
> this CRTC
> > + */
> > +struct rzg2l_du_crtc_state {
> > +	struct drm_crtc_state state;
> > +
> > +	struct vsp1_du_crc_config crc;
> > +	unsigned int outputs;
> > +};
> > +
> > +#define to_rzg2l_crtc_state(s)	container_of(s, struct
> rzg2l_du_crtc_state, state)
> > +
> > +int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu);
> > +
> > +void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc);
> > +
> > +int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
> > +				       struct drm_plane_state *state,
> > +				       const struct rzg2l_du_format_info
> **format);
> > +
> > +#endif /* __RZG2L_DU_CRTC_H__ */
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > new file mode 100644
> > index 000000000000..0fea1fea837c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * RZ/G2L Display Unit DRM driver
> > + *
> > + * Copyright (C) 2023 Renesas Electronics Corporation
> > + *
> > + * Based on rcar_du_drv.c
> > + */
> > +
> > +#include <linux/clk.h>
>=20
> Not needed.

OK.

>=20
> > +#include <linux/dma-mapping.h>
> > +#include <linux/io.h>
>=20
> Not needed either. Could you check if the other headers are needed ?

OK will do.
>=20
> > +#include <linux/mm.h>
> > +#include <linux/module.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pm.h>
> > +#include <linux/slab.h>
> > +#include <linux/wait.h>
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_fbdev_generic.h>
> > +#include <drm/drm_gem_dma_helper.h>
> > +#include <drm/drm_managed.h>
> > +#include <drm/drm_probe_helper.h>
> > +
> > +#include "rzg2l_du_drv.h"
> > +#include "rzg2l_du_kms.h"
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * Device Information
> > + */
> > +
> > +static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info =3D {
> > +	.channels_mask =3D BIT(0),
> > +	.routes =3D {
> > +		[RZG2L_DU_OUTPUT_DSI0] =3D {
> > +			.possible_crtcs =3D BIT(0),
> > +			.port =3D 0,
> > +		},
> > +		[RZG2L_DU_OUTPUT_DPAD0] =3D {
> > +			.possible_crtcs =3D BIT(0),
> > +			.port =3D 1,
> > +		}
> > +	}
> > +};
> > +
> > +static const struct of_device_id rzg2l_du_of_table[] =3D {
> > +	{ .compatible =3D "renesas,r9a07g044-du", .data =3D
> &rzg2l_du_r9a07g044_info },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rzg2l_du_of_table);
> > +
> > +const char *rzg2l_du_output_name(enum rzg2l_du_output output)
> > +{
> > +	static const char * const names[] =3D {
> > +		[RZG2L_DU_OUTPUT_DSI0] =3D "DSI0",
> > +		[RZG2L_DU_OUTPUT_DPAD0] =3D "DPAD0"
> > +	};
> > +
> > +	if (output >=3D ARRAY_SIZE(names))
> > +		return "UNKNOWN";
> > +
> > +	return names[output];
> > +}
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * DRM operations
> > + */
> > +
> > +DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
> > +
> > +static const struct drm_driver rzg2l_du_driver =3D {
> > +	.driver_features	=3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> > +	.dumb_create		=3D rzg2l_du_dumb_create,
> > +	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
> > +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> > +	.gem_prime_import_sg_table =3D rzg2l_du_gem_prime_import_sg_table,
> > +	.gem_prime_mmap		=3D drm_gem_prime_mmap,
> > +	.fops			=3D &rzg2l_du_fops,
> > +	.name			=3D "rzg2l-du",
> > +	.desc			=3D "Renesas RZ/G2L Display Unit",
> > +	.date			=3D "20230410",
> > +	.major			=3D 1,
> > +	.minor			=3D 0,
> > +};
> > +
> > +/* ------------------------------------------------------------------
> -----------
> > + * Platform driver
> > + */
> > +
> > +static int rzg2l_du_remove(struct platform_device *pdev)
> > +{
> > +	struct rzg2l_du_device *rcdu =3D platform_get_drvdata(pdev);
> > +	struct drm_device *ddev =3D &rcdu->ddev;
> > +
> > +	drm_dev_unregister(ddev);
> > +	drm_atomic_helper_shutdown(ddev);
> > +
> > +	drm_kms_helper_poll_fini(ddev);
> > +
> > +	return 0;
> > +}
> > +
> > +static void rzg2l_du_shutdown(struct platform_device *pdev)
> > +{
> > +	struct rzg2l_du_device *rcdu =3D platform_get_drvdata(pdev);
> > +
> > +	drm_atomic_helper_shutdown(&rcdu->ddev);
> > +}
> > +
> > +static int rzg2l_du_probe(struct platform_device *pdev)
> > +{
> > +	struct rzg2l_du_device *rcdu;
> > +	int ret;
> > +
> > +	if (drm_firmware_drivers_only())
> > +		return -ENODEV;
> > +
> > +	/* Allocate and initialize the RZ/G2L device structure. */
> > +	rcdu =3D devm_drm_dev_alloc(&pdev->dev, &rzg2l_du_driver,
> > +				  struct rzg2l_du_device, ddev);
> > +	if (IS_ERR(rcdu))
> > +		return PTR_ERR(rcdu);
> > +
> > +	rcdu->dev =3D &pdev->dev;
> > +	rcdu->info =3D of_device_get_match_data(rcdu->dev);
> > +
> > +	platform_set_drvdata(pdev, rcdu);
> > +
> > +	/* I/O resources */
> > +	rcdu->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(rcdu->mmio))
> > +		return PTR_ERR(rcdu->mmio);
> > +
> > +	/*
> > +	 * When sourcing frames from a VSP the DU doesn't perform any
> memory
> > +	 * access so set the DMA coherent mask to 40 bits to accept all
> buffers.
> > +	 */
> > +	ret =3D dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* DRM/KMS objects */
> > +	ret =3D rzg2l_du_modeset_init(rcdu);
> > +	if (ret < 0) {
> > +		if (ret !=3D -EPROBE_DEFER)
> > +			dev_err(&pdev->dev,
> > +				"failed to initialize DRM/KMS (%d)\n", ret);
>=20
> Use dev_err_probe()

As per your patch [1], I guess it is not required

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2023053015=
3251.22302-1-laurent.pinchart+renesas@ideasonboard.com/

>=20
> > +		goto error;
> > +	}
> > +
> > +	/*
> > +	 * Register the DRM device with the core and the connectors with
> > +	 * sysfs.
> > +	 */
> > +	ret =3D drm_dev_register(&rcdu->ddev, 0);
> > +	if (ret)
> > +		goto error;
> > +
> > +	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
>=20
> Use drm_info().

Agreed.

>=20
> > +
> > +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> > +
> > +	return 0;
> > +
> > +error:
> > +	drm_kms_helper_poll_fini(&rcdu->ddev);
> > +	return ret;
> > +}
> > +
> > +static struct platform_driver rzg2l_du_platform_driver =3D {
> > +	.probe		=3D rzg2l_du_probe,
> > +	.remove		=3D rzg2l_du_remove,
> > +	.shutdown	=3D rzg2l_du_shutdown,
> > +	.driver		=3D {
> > +		.name	=3D "rzg2l-du",
> > +		.of_match_table =3D rzg2l_du_of_table,
> > +	},
> > +};
> > +
> > +module_platform_driver(rzg2l_du_platform_driver);
> > +
> > +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> > +MODULE_DESCRIPTION("Renesas RZ/G2L Display Unit DRM Driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > new file mode 100644
> > index 000000000000..3b84e91aa64a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > @@ -0,0 +1,89 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * RZ/G2L Display Unit DRM driver
> > + *
> > + * Copyright (C) 2023 Renesas Electronics Corporation
> > + *
> > + * Based on rcar_du_drv.h
> > + */
> > +
> > +#ifndef __RZG2L_DU_DRV_H__
> > +#define __RZG2L_DU_DRV_H__
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/wait.h>
>=20
> Not needed.

OK.

>=20
> > +
> > +#include <drm/drm_device.h>
> > +
> > +#include "rzg2l_du_crtc.h"
> > +#include "rzg2l_du_vsp.h"
> > +
> > +struct clk;
>=20
> Not used in this header.

Will remove.

>=20
> > +struct device;
> > +struct drm_bridge;
> > +struct drm_property;
> > +struct rzg2l_du_device;
>=20
> Not needed.

Ooops. Will take out.

>=20
> > +
> > +enum rzg2l_du_output {
> > +	RZG2L_DU_OUTPUT_DSI0,
> > +	RZG2L_DU_OUTPUT_DPAD0,
> > +	RZG2L_DU_OUTPUT_MAX,
> > +};
> > +
> > +/*
> > + * struct rzg2l_du_output_routing - Output routing specification
> > + * @possible_crtcs: bitmask of possible CRTCs for the output
> > + * @port: device tree port number corresponding to this output route
> > + *
> > + * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
> > + * specify the valid SoC outputs, which CRTCs can drive the output,
> and the type
> > + * of in-SoC encoder for the output.
> > + */
> > +struct rzg2l_du_output_routing {
> > +	unsigned int possible_crtcs;
> > +	unsigned int port;
> > +};
> > +
> > +/*
> > + * struct rzg2l_du_device_info - DU model-specific information
> > + * @channels_mask: bit mask of available DU channels
> > + * @routes: array of CRTC to output routes, indexed by output
> (RZG2L_DU_OUTPUT_*)
> > + */
> > +struct rzg2l_du_device_info {
> > +	unsigned int channels_mask;
> > +	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> > +};
>=20
> The driver supports a single SoC, with two outputs, connected to the
> same DU channel. Do you really need to copy the rzg2l_du_device_info
> abstraction from the rcar-du driver, or could you simplify the code ?

After adding basic support, as an optimization
will simplify the code later. Hope it is ok for you??


> > +
> > +#define RZG2L_DU_MAX_CRTCS		1
> > +#define RZG2L_DU_MAX_VSPS		1
> > +#define RZG2L_DU_MAX_DSI		1
> > +
> > +struct rzg2l_du_device {
> > +	struct device *dev;
> > +	const struct rzg2l_du_device_info *info;
> > +
> > +	void __iomem *mmio;
> > +
> > +	struct drm_device ddev;
> > +
> > +	struct rzg2l_du_crtc crtcs[RZG2L_DU_MAX_CRTCS];
> > +	unsigned int num_crtcs;
> > +
> > +	struct rzg2l_du_vsp vsps[RZG2L_DU_MAX_VSPS];
> > +	struct drm_bridge *dsi[RZG2L_DU_MAX_DSI];
>=20
> This is written but never read. You can drop the field.

Agreed.

>=20
> > +
> > +	struct {
> > +		struct drm_property *colorkey;
> > +	} props;
> > +
> > +	unsigned int dpad0_source;
>=20
> This is written but never read. You can drop the field.

Agreed. Will add later when we add support for DPI.

Cheers,
Biju
