Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F14D7206CC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 18:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4D510E1E9;
	Fri,  2 Jun 2023 16:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0EC10E1E9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 16:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vn58o0xqmFANJyFqG1eOAfPONI2TldCydpyDR/ChXKBjg3vrCZBRwBvDJMFu7+YnGYZ3ZgBgxft9Hd++pAC/nKWJgWrsVBSsMP/pUk9Y4xzvaMy+9sHmpmNcDW9l85R2LZhkju17bgtT2Gk7xkoNTjihTtF0xvryTXkDmrBclPj3xRcInjEo2WDQoD4NgKDEI86ClyTenY2cQ8cAtvW1JU/BaMFkROZDp7MYXbPi3DMtf8LytXBUSQXMECc0I0S4STBQDG3u/tJvYPzJ9RojamREwKGqmFwEP/VW4H8vWwTqoN/ST/bB2a92OaBLc8y3JhEvd56kJi2g776zvyJFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ehf2FHrTuC8Qtl1GldjKw1URA0TYTPZov+CZO3FcIkU=;
 b=FZJqq36RT0RqbvAYFkw3SDV3zSZsdcFTey2gZWku8dAxQPgO0/fESnWaDZ8jnwcxCmo+PRodqH7LddBC7fMuCpWKL/SGGWsGfGq1udmaOjfEthcZtSbDtvIvgIfwjKjGF4iWcElcqRynDzK8/rGaKmjbWTUfJnP8f6xi/CqKmF66W0GOwmrkLP4L5GVIH8O6MREi2gk7Ien1/w0DalfMXtQhKBmiFNQonld28Y1vcOEBHAG3Zi6f5cuXS3pLMDomxFlVVDUxmw9+2LNjTJbQI2zRAvsol23GpC6eIq1g1mEqaWOevpjXF/OCpSxrwSqNst2t1t906qBIC5a349BpuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ehf2FHrTuC8Qtl1GldjKw1URA0TYTPZov+CZO3FcIkU=;
 b=LDGteYbz2ajKpCfBH+5qyH58vnTQQvhyPnLfiJzVCRhUiX+z0uysKWhSpz/K/AltPrnUyva8nY7nTwHlEpx/47UdOs7OnWdpSJ2+LeEyRUPVEOCylSsPYSbKEKdb38I9I1cj3ygvTwCCvG27j3Ta9o285noQL9mVE57p/D+w4W8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10087.jpnprd01.prod.outlook.com (2603:1096:400:1ec::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Fri, 2 Jun
 2023 16:05:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 16:05:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
Thread-Topic: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
Thread-Index: AQHZfN42vFEZgG4dzkicin0/DbOzxq9xjseAgAR2VhCAAY2ZgIAARLOQ
Date: Fri, 2 Jun 2023 16:05:27 +0000
Message-ID: <OS0PR01MB5922CC929718F18560CC2C40864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230502100912.143114-1-biju.das.jz@bp.renesas.com>
 <20230502100912.143114-5-biju.das.jz@bp.renesas.com>
 <20230529154305.GB15264@pendragon.ideasonboard.com>
 <OS0PR01MB5922ED8C626E23D80D1458E386499@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230602113443.GF26944@pendragon.ideasonboard.com>
In-Reply-To: <20230602113443.GF26944@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10087:EE_
x-ms-office365-filtering-correlation-id: 76c55651-661a-459a-649d-08db63832e3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6eGioBOH48GutcY/ipxVbI2Ojho3hjtPBsaaxXbBBqri1ydK5luSX6ZTNubtxMdk0b3SChlIIE3dRGIDN/LR1W2cckIjGdzULpN7Qa25tYZZBXkVNrGLE6eQbBNnRiYfK4jNhFzKtgsoCwgD/zEoWnf2quvzLHYi4Up6juarjSX3hzoq0steHrFGCp51sNAorusBwrYLgFwVGOLrfw4P4j9qmNOwIFM8ljg7A7W+Win5lmtiF51YpdQ4WS9X+7ikClbXCRsvQC+WKmXai2V9oOhiOjIGzfXRsuAnLoQ5dJl8m8wbfWfDxLNWuW1QaZfIKjU1RBbSfJjI8GFLu4oQuVwF70/+/EwlMJAENuz+hyaZc/ppmp1Gpm5+2/vG8RuWSFZBq1455Xr9eUR1Fgg01+LFKTfNme5rZGBvjhaxf9NLy3tyUbBHIEUwskAnHvrOmLvienBTFR1dSEJu/V34cb8MJTbJD+hiu5Qc9CL1YF5Ads68it40V7mmdAH4QVBQE2Q3NTGnYVbAmrepJzv2YilrVEyiOdw893fuGbkRCi6XCopY5x7OYYaHRkJBiKNA/q6BhlnbOgyiMmf8/Oun7gBSFRhFaav0iMNiOJW3TxYNRct97vPQFDG8ekAkEC13
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199021)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(316002)(4326008)(6916009)(41300700001)(5660300002)(52536014)(8676002)(2906002)(30864003)(8936002)(54906003)(478600001)(71200400001)(7696005)(55016003)(107886003)(9686003)(6506007)(186003)(83380400001)(26005)(33656002)(122000001)(86362001)(38070700005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GB8eLlLSzkfFgVBbetJnnxIoWUxPEE/LoKR1JMHY71YhyV09rJQM9Wb3fvN7?=
 =?us-ascii?Q?yFCRdbBfymzqe+SDD5YvgTqvrAt2Ow8Os7Jn46QCG1fwIxmqh6oI3oJEEwM7?=
 =?us-ascii?Q?M85nxhW4aj5UFsYH9O86pD7pl6TCAureAA9rgCsP+9rK3NzNj1HGNbZ2f1aN?=
 =?us-ascii?Q?0csE9EXT7c0zZP1dVjnN0QbBjlOXsmQMz/ndhy+fD+P5WBbeERuwe2LG19Dg?=
 =?us-ascii?Q?datY/7yPcKFYRz10WDT2IOgxVi3oPe7JZ2Ib6K0VwpTHDAlZ1qM3KtB/IWsr?=
 =?us-ascii?Q?YPsArTZ8pAHKgXrQYD34j/hsV1PCuFWoPtZt6Z1kOTHm7ZGUvQt1/hn/GuFk?=
 =?us-ascii?Q?6sAnpjsEAtZZ5eMuTwtwgJs6AY8CFWVUnjkE7FxPJY/j9JwDumTndP6fh7k8?=
 =?us-ascii?Q?zoGN7d8dB161hV7COjgcGAsai+g8S8tuEmSUNb0qHhwkelPeXiO/sGN6LXTV?=
 =?us-ascii?Q?nzAZTo8XvbQ0j2GoMHC248b3ahCmUVce2HL92BK5UCCRaCWvSDX2pP0rDXDM?=
 =?us-ascii?Q?Ze8h4rRtW3BErjJq2bOD4l/tahmgheS3PRbBLYLM47b0f3JVJIdfK0uGF5mS?=
 =?us-ascii?Q?4JoM9N77A0KgWI2lHq3sIOXMNKAuQ79CLGfb4FXFLFkM6unienHXsrT6mSTz?=
 =?us-ascii?Q?V9tZloe/a5cpPH8dxvPzIQDCXDGJXNAaKKiY1xFSWKCBcNqwTIRxVwQD8qgG?=
 =?us-ascii?Q?xju8/jloZMCyXjgjpC36rQO+J5TVabmdxUoTC9CCcgO2nuvXc19QXCnbA4jL?=
 =?us-ascii?Q?9lEQaltVKpm9W4pIn1N9ETW0NkvYAMUpXQfE8vh6vRX/71Rh8krCBoKKlZp/?=
 =?us-ascii?Q?p/Rr5tHelFOAcyJmHvfGZDpbe9qYumsfHnorE6UG/Q5E61iENElMgqpjoTEo?=
 =?us-ascii?Q?uV1d/wRGRmqFecD1JORWI+cbZ5deUhT6DbkpG+9XpsoWgc+01BBl2xIipJrQ?=
 =?us-ascii?Q?8tr7/ZxsI2kwCS23uWzCi93sZ7Q3GJ5hfWxbOm4dhD+QTnK/igZC++WQIcRM?=
 =?us-ascii?Q?dGvMfyHOtepxXWkFrCnLweTf/wU7DFrJet2ls5gYwT9Aw2I3+RDNEa8xp7bc?=
 =?us-ascii?Q?Lw/+abCEpmz9kZZRzja4FvPka1HkO7JXdar8O8x5cXijxoCPSPzTOOBPjpwj?=
 =?us-ascii?Q?/ys9mc3BW6XU/RI0Z5RqEqAgwNutulLP7aMPbPQlU/TleA3+elWSgRyZGKbD?=
 =?us-ascii?Q?Kgl2NnD4ewavqVeQ7Ghpj+sc0z84l4hRwKyG1K/Bi3SmMeIrLJddbjIg6IFw?=
 =?us-ascii?Q?8X+XWMXWeJbIgk1ez+KTcwADQvhCv5RcA5vpqPZePn7xaPP5pcTOXONGdTf1?=
 =?us-ascii?Q?knxILC52vVxY89xJIexXyAukSFT9LVJd64chtCY4PixsPc59ryUZxFqn0uGN?=
 =?us-ascii?Q?UBjipFTm0auJp7sjgTx7L574XzpBInsarg6pKe33GXaP7EIcjx+kqL/CUMY/?=
 =?us-ascii?Q?VFqUFuZQUsCJ0jsCw8HUNxPVgge4dMrE4G8A9AqRxZ2kQLmJoRo2PtryoPV2?=
 =?us-ascii?Q?6nl3GFnxD3szw8YswOW0+Stekvll5Pngy+ebzXgmL9d5kBQqqIyrCDcdCp/C?=
 =?us-ascii?Q?qVug6WIPiqr7ntKK7Dihc3im5CmheRdpqmgoFKgY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c55651-661a-459a-649d-08db63832e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 16:05:27.0613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jArqZfrKTwmPZalOO1gkkr5dZHMWLG4H8UURcsOek+3ZYXeqpxVvvYhIgsCqncPPmO29aGNQvT0XuEbVVGbLeAxX4Zyq6OkzeJ8AUlNfmMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10087
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
> On Thu, Jun 01, 2023 at 12:08:44PM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v9 RESEND 4/5] drm: Add RZ/G2L DU Support
> > >
> > > Hi Biju,
> > >
> > > Thank you for the patch.
> > >
> > > This is a partial review, because the driver is big, and because
> > > some changes in v10 will (hopefully) simplify the code and make
> > > review easier.
> >
> > I agree v10 will simplify the code as I have do clean-ups based on
> > your review commnet.
> >
> > > On Tue, May 02, 2023 at 11:09:11AM +0100, Biju Das wrote:
> > > > The LCD controller is composed of Frame Compression Processor
> > > > (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> > > >
> > > > It has DPI/DSI interfaces and supports a maximum resolution of
> > > > 1080p along with 2 RPFs to support the blending of two picture
> > > > layers and raster operations (ROPs).
> > > >
> > > > The DU module is connected to VSPD. Add RZ/G2L DU support for
> > > > RZ/G2L alike SoCs.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > Ref:
> > > >
> > > > v8->v9:
> > > >  * Dropped reset_control_assert() from error patch for
> rzg2l_du_crtc_get() as
> > > >    suggested by Philipp Zabel.
> > > > v7->v8:
> > > >  * Dropped RCar du lib and created RZ/G2L DU DRM driver by
> creating rz_du folder.
> > > >  * Updated KConfig and Makefile.
> > > > v6->v7:
> > > >  * Split DU lib and  RZ/G2L du driver as separate patch series as
> > > >    DU support added to more platforms based on RZ/G2L alike SoCs.
> > > >  * Rebased to latest drm-tip.
> > > >  * Added patch #2 for binding support for RZ/V2L DU
> > > >  * Added patch #4 for driver support for RZ/V2L DU
> > > >  * Added patch #5 for SoC DTSI support for RZ/G2L DU
> > > >  * Added patch #6 for SoC DTSI support for RZ/V2L DU
> > > >  * Added patch #7 for Enabling DU on SMARC EVK based on
> RZ/{G2L,V2L} SoCs.
> > > >  * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC
> SoC.
> > > > ---
> > > >  drivers/gpu/drm/renesas/Kconfig               |   1 +
> > > >  drivers/gpu/drm/renesas/Makefile              |   1 +
> > > >  drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
> > > >  drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
> > > >  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 714
> > > > ++++++++++++++++  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |
> > > > 99 +++  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
> > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
> > > > .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
> > > > .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
> > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770
> > > > ++++++++++++++++++  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> > > > |  43 +  drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
> > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
> > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
> > > >  15 files changed, 2664 insertions(+)  create mode 100644
> > > > drivers/gpu/drm/renesas/rz-du/Kconfig
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > >  create mode 100644
> > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
> > > >  create mode 100644
> > > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> > > >  create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
>=20
> [snip]
>=20
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > > new file mode 100644
> > > > index 000000000000..d61d433d72e6
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > > > @@ -0,0 +1,714 @@
>=20
> [snip]
>=20
> > > > +/*
> > > > +-----------------------------------------------------------------
> > > > +------------
> > > > + * CRTC Functions
> > > > + */
> > > > +
> > > > +int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
> > > > +				       struct drm_plane_state *state,
> > > > +				       const struct rzg2l_du_format_info
> **format)
> > >
> > > This function is only called from rzg2l_du_vsp_plane_atomic_check(),
> > > I would inline it there.
> >
> > Agreed.
> >
> > > > +{
> > > > +	struct drm_device *dev =3D plane->dev;
> > > > +	struct drm_crtc_state *crtc_state;
> > > > +	int ret;
> > > > +
> > > > +	if (!state->crtc) {
> > > > +		/*
> > > > +		 * The visible field is not reset by the DRM core but
> only
> > > > +		 * updated by drm_plane_helper_check_state(), set it
> manually.
> > > > +		 */
> > > > +		state->visible =3D false;
> > > > +		*format =3D NULL;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	crtc_state =3D drm_atomic_get_crtc_state(state->state, state-
> >crtc);
> > > > +	if (IS_ERR(crtc_state))
> > > > +		return PTR_ERR(crtc_state);
> > > > +
> > > > +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> > > > +						  DRM_PLANE_NO_SCALING,
> > > > +						  DRM_PLANE_NO_SCALING,
> > > > +						  true, true);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	if (!state->visible) {
> > > > +		*format =3D NULL;
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	*format =3D rzg2l_du_format_info(state->fb->format->format);
> > > > +	if (*format =3D=3D NULL) {
> > >
> > > Can this happen, or does the DRM core already checks that the
> > > framebuffer format is supported by the plane ?
> >
> > This will make sure the format is as per rzg2l_du_format_info,
> > Otherwise print unsupported format.
>=20
> I understand that, but it wasn't my question. Does the DRM core check if
> the framebuffer pixel format is supported by the plane, using the
> plane's supported pixel formats specified by the driver when the plane
> was created ? If it does, you could drop this check, as
> rzg2l_du_format_info() should support all the formats that the driver
> specifies as supported by the plane.
>=20
> I believe the DRM core handles this already, given the
> drm_plane_check_pixel_format() call in drm_atomic_plane_check().

Yes, it handles already. I will drop the check.

As you said it calls drm_atomic_plane_check()
which calls drm_plane_check_pixel_format()

>=20
> > > > +		dev_dbg(dev->dev, "%s: unsupported format %08x\n",
> __func__,
> > > > +			state->fb->format->format);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
>=20
> [snip]
>=20
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > new file mode 100644
> > > > index 000000000000..0fea1fea837c
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
> > > > @@ -0,0 +1,188 @@
>=20
> [snip]
>=20
> > > > +static int rzg2l_du_probe(struct platform_device *pdev) {
> > > > +	struct rzg2l_du_device *rcdu;
> > > > +	int ret;
> > > > +
> > > > +	if (drm_firmware_drivers_only())
> > > > +		return -ENODEV;
> > > > +
> > > > +	/* Allocate and initialize the RZ/G2L device structure. */
> > > > +	rcdu =3D devm_drm_dev_alloc(&pdev->dev, &rzg2l_du_driver,
> > > > +				  struct rzg2l_du_device, ddev);
> > > > +	if (IS_ERR(rcdu))
> > > > +		return PTR_ERR(rcdu);
> > > > +
> > > > +	rcdu->dev =3D &pdev->dev;
> > > > +	rcdu->info =3D of_device_get_match_data(rcdu->dev);
> > > > +
> > > > +	platform_set_drvdata(pdev, rcdu);
> > > > +
> > > > +	/* I/O resources */
> > > > +	rcdu->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> > > > +	if (IS_ERR(rcdu->mmio))
> > > > +		return PTR_ERR(rcdu->mmio);
> > > > +
> > > > +	/*
> > > > +	 * When sourcing frames from a VSP the DU doesn't perform
> any memory
> > > > +	 * access so set the DMA coherent mask to 40 bits to accept
> all buffers.
> > > > +	 */
> > > > +	ret =3D dma_coerce_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(40));
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/* DRM/KMS objects */
> > > > +	ret =3D rzg2l_du_modeset_init(rcdu);
> > > > +	if (ret < 0) {
> > > > +		if (ret !=3D -EPROBE_DEFER)
> > > > +			dev_err(&pdev->dev,
> > > > +				"failed to initialize DRM/KMS (%d)\n",
> ret);
> > >
> > > Use dev_err_probe()
> >
> > As per your patch [1], I guess it is not required
> >
> > [1]
>=20
> If you add dev_err_probe() calls in rzg2l_du_modeset_init() as
> appropriate, like done in [1] :-)

OK will do similar change.

>=20
> > > > +		goto error;
> > > > +	}
> > > > +
> > > > +	/*
> > > > +	 * Register the DRM device with the core and the connectors
> with
> > > > +	 * sysfs.
> > > > +	 */
> > > > +	ret =3D drm_dev_register(&rcdu->ddev, 0);
> > > > +	if (ret)
> > > > +		goto error;
> > > > +
> > > > +	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
> > >
> > > Use drm_info().
> >
> > Agreed.
> >
> > > > +
> > > > +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +error:
> > > > +	drm_kms_helper_poll_fini(&rcdu->ddev);
> > > > +	return ret;
> > > > +}
>=20
> [snip]
>=20
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > new file mode 100644
> > > > index 000000000000..3b84e91aa64a
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
> > > > @@ -0,0 +1,89 @@
>=20
> [snip]
>=20
> > > > +enum rzg2l_du_output {
> > > > +	RZG2L_DU_OUTPUT_DSI0,
> > > > +	RZG2L_DU_OUTPUT_DPAD0,
> > > > +	RZG2L_DU_OUTPUT_MAX,
> > > > +};
> > > > +
> > > > +/*
> > > > + * struct rzg2l_du_output_routing - Output routing specification
> > > > + * @possible_crtcs: bitmask of possible CRTCs for the output
> > > > + * @port: device tree port number corresponding to this output
> > > > +route
> > > > + *
> > > > + * The DU has 2 possible outputs (DPAD0, DSI0). Output routing
> > > > +data
> > > > + * specify the valid SoC outputs, which CRTCs can drive the
> > > > +output, and the type
> > > > + * of in-SoC encoder for the output.
> > > > + */
> > > > +struct rzg2l_du_output_routing {
> > > > +	unsigned int possible_crtcs;
> > > > +	unsigned int port;
> > > > +};
> > > > +
> > > > +/*
> > > > + * struct rzg2l_du_device_info - DU model-specific information
> > > > + * @channels_mask: bit mask of available DU channels
> > > > + * @routes: array of CRTC to output routes, indexed by output
> > > > +(RZG2L_DU_OUTPUT_*)  */ struct rzg2l_du_device_info {
> > > > +	unsigned int channels_mask;
> > > > +	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
> };
> > >
> > > The driver supports a single SoC, with two outputs, connected to the
> > > same DU channel. Do you really need to copy the rzg2l_du_device_info
> > > abstraction from the rcar-du driver, or could you simplify the code
> ?
> >
> > After adding basic support, as an optimization will simplify the code
> > later. Hope it is ok for you??
>=20
> I'm OK with patches on top. Please don't forget about them :-)

Agreed.

Cheers,
Biju
