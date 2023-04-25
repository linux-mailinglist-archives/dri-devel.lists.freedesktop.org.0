Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21D6EDDAE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 10:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEC110E6C0;
	Tue, 25 Apr 2023 08:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145F10E6C0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 08:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqEVzTtP06co3YlJ6uLBbQSUWEBD2aK0gPfxj5wIiZ7Yxe/mnR9OyjdJaXBal1Hd4zH93clDRHh5R4W6SGAeJAVz0qeh3oI8fd1ZR7iXQ/gjFUWzGeUCr+ii1n02rfFf0oI+nnaX2TSZl2FpI9vVeZNHKyzUgoZJLN3JM2dvM2ZnirAa8E7lzEHw8NGsFk1BGW6GsI+6rssCWzf4tb91BZB+YWcc2y7L3QevApmCgRKexxeid4s18oVmGUXvRc6MapkCBRzgZuJi6TCvGbpjtc4OvwCBRQr9JJNxdzDJq+d43f7oQ+OVVJVhfYssk22r4qfIBeHt98XqUpfta6Vi6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz543hxLdkY5CeUpG5V5kWsSLOGpN6c4Ys0wePUY0DU=;
 b=NpHkpIwwTCxW9WUjN7zpFf7ZjSXjyf6qkKf14dCT9CuUkwhKcSgirOIBG3r2ZYvIy1aq9bYs9mCcG8ueWCbYQ4DPoBmdfhKpJT7aq8VfUsJKtYWHoLY/xBy+r6czuAmSdPhWTYnuKBviklvfa6tc1oW1OFF6eTFNP38J0UqLi6q4zUSlIW9LNAh4GHmAahgh0Yec5fwvY4QPDM9R49OvivMQv98Xy+BQCefn2Y1Lnuvto/HwQEGXhh5e87c4YJdakqPg/Lw8if6Yy7xbfuZ1XHO/lu3Da/dQOtVE+iXlBvBcK0JcFVMlVLqdmfxpUijxs0/vc2WkPylHMgODXCzO+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vz543hxLdkY5CeUpG5V5kWsSLOGpN6c4Ys0wePUY0DU=;
 b=WHiUfabEtJohaDvGPZ6MUrxEL2nHorUVqb/qqjDqAIa7sT8lBIaGGsQOFyNAb8o+0cBAIzYGIkj7QO9M57QqjycGpkPpDr6HfxJdk4t/IMjtguser79c6+cPvclVdnzpzRm0nrXptkX6DbVhUyfnskpKI2e4kjNcUvreVs56Ano=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB11172.jpnprd01.prod.outlook.com (2603:1096:400:3c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 08:10:18 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 08:10:16 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: RE: [PATCH v8 4/5] drm: Add RZ/G2L DU Support
Thread-Topic: [PATCH v8 4/5] drm: Add RZ/G2L DU Support
Thread-Index: AQHZdsdYCzL8DhdmU02A5Ur6Uqn/u686ylYAgADimdA=
Date: Tue, 25 Apr 2023 08:10:16 +0000
Message-ID: <OS0PR01MB592203CA7E817B1DA67AAC3286649@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
 <20230424161024.136316-5-biju.das.jz@bp.renesas.com>
 <20230424183822.GA30248@pengutronix.de>
In-Reply-To: <20230424183822.GA30248@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB11172:EE_
x-ms-office365-filtering-correlation-id: fd45b1e1-7c0a-41f6-47f3-08db45648130
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2MbPgGU5pBsAsYHeZO3vIX4plvHmDMII9u0/HY43tfv9wjOh0hNhpLSC/4jxF37cdYXdbFWyvmYbgMZTx311VUmZG8RnKlr5EmDYoJWA68xHVrEQyk3FMlilWGD4g6vPzFhBYAgh3ygSwSHTxG6ub2vZslm6fz8jO3kolUvTHnvT5Ey5ocmf0gRUeHZKgkKxXaid82YAGP7kS+T8JggiY6d1OYyXrv6SWQYRJq1JHDf9WzPWQKomrZG5cor0u3MdKEvlXXMZ36x3AeVMN6ckEgTiozkUc+4p7e/R198OL7eze8cK7gGYcXbX8xeYmYTb8M6zbdb/CWRGq3yTxMHqDc8DcN5qSfC9D40tJtYrbay2dpqPz7RSSQ7Wy73NjjZFuVTKOPkYpFYzpYOlYeZx/d5rewCnPtBt+SNDuEoNzY9NDeQIRsozDy2PEBtkaVdfzstA1/reyeoaTOiZipaXwiTScfmi0wSLwUg9ppWD/1Y0D+ZYvICdmDe+gCSiIwMaihcMyWzra1/5Pnk7AAL4FYwL2n5/2W/J9U2vDFa9xEcsAjzVzDve4CambF4VrJlXdbXDIB5TRPsncOb0zNOU/owpu+iWCsRt53fO23mgtiupZWEXnkEeya98R4dXqlm9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199021)(2906002)(71200400001)(107886003)(7696005)(55016003)(6506007)(9686003)(186003)(53546011)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(8676002)(8936002)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(52536014)(5660300002)(54906003)(38070700005)(122000001)(38100700002)(86362001)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8PikqRCwwxmwnav7c3+Zt/ZyEeIBVkYiiA9dBx9Qz70Zar7H3VhwJw1BmYq0?=
 =?us-ascii?Q?6+RZyIVYWlu07h242r1c4RvNPxt52cEhCSiiCSUoiU8/gektdtZGor8jU+y1?=
 =?us-ascii?Q?4zD5GRM8s3kWIMrxXYpshLlAjUo3y57hrvtC8yoLjKgDIE7O01hK2cCC/AS7?=
 =?us-ascii?Q?c3wehIdmoy5stljNNqkbzI0Wh7Il2vvwnI0dr6iUhJ3fxnPEVgcbSijOMKx7?=
 =?us-ascii?Q?e5obkbTpG57jHy9tNUEdk4h9Mp52yniURVRMmJ0WlEWAadNUH3RMwVOyLU/E?=
 =?us-ascii?Q?jrrNDMLFLZc/ga4k8srzgEYnPDLxw1KHC4lfoyoeQwFcGuwgEJVLzfTrLfFz?=
 =?us-ascii?Q?/KQhJEELyyGUyPIG+etRugaJThzi4PZ4pWMaTyifv7ieuKsr3dLTEDsIefLA?=
 =?us-ascii?Q?n6LcE0lECQetZH/tbHwPs12FJvpfsoUh+TxTS+0ouyo/wVVrQYSUYIXqZMQ8?=
 =?us-ascii?Q?GxangJ0j9os8bC2uJsO3kix3CrwAcYTQNwd0Sgku9hgW6INCRPxEryGCwc90?=
 =?us-ascii?Q?icmjyHOhBRihS760/lI6uTAPx2of++c5tXKO1PXFytiT70WMKjFTC6ebAxar?=
 =?us-ascii?Q?yFZGY+7r9xQ/tS6Dj6xe1F/VLOmt4zSiHwgQnJjQcDW4bN6nXSWt+MBw3A1+?=
 =?us-ascii?Q?Kyo4GIGSH6cs+kRbdOzqHTaVhqoMSPHldsSma0rWqZAAwR6nd/qmOisJkgAt?=
 =?us-ascii?Q?esbKX2y7BXVPHezu/8agQHaFNrAZWYYtsh3NlG+bGXot8g6fA6v6I3CYw0h5?=
 =?us-ascii?Q?oWFZ8MAVKXRGfS6jiSwzb0qd3MKkjIq5E/P1sesMuMWhuWdtvsgRVLvA6cCM?=
 =?us-ascii?Q?o1O0C7QnQWm8tX2yWAgQ+ri0Qe3VhTQWqvjlmnT4m9wM6Eelix3wMPsQHNCc?=
 =?us-ascii?Q?djAF+gGjltZYCWYm4Mu+v2naOhQ+qLTZrnF4H8f1YSIWJIQed3Mb4fhK/Kb6?=
 =?us-ascii?Q?uHKTpPvMb9LEbktEefdmqH25T/p30lEB0eD6vtuFD1NVBIApeA+QCcPnChdE?=
 =?us-ascii?Q?dy2cGkDGn/0rXL1+b8n0Nd1v5YBylUBUdaLjjsM+MyzaJNB5pnsW3RiIVRJi?=
 =?us-ascii?Q?5S5WDJlIxPreLv11RtnN5KYnBp7wEQwt/UaM1vS4gwwL/XhTib/mXgVJbfNI?=
 =?us-ascii?Q?IRu4ZIqwk7MuYfSbkhK7TEmrH5Nhf+mrEQluq4EjG9TNTDQa1BZKrXXsx1kC?=
 =?us-ascii?Q?Jwn1WxFt1KncbQzZeiDTEt/peOT6gcoTdYm0paYMPaXW5cU+u2xyCswVpOyS?=
 =?us-ascii?Q?dl9vZbpyLA4kQZi27usEiubznPfZJ1QcXxmYprpRyabd7q2q5bIKpRonOp4j?=
 =?us-ascii?Q?AlxzWxCeAqwKA3NQh0hiAY1aN5yHY2bYZSZBuCSrQ0vyOAuTmnH7aSl/YI8T?=
 =?us-ascii?Q?oAe5vujFGAEaidLDBNDlfSg3H9tpYziB9Vk0Ru1IHbcPxvuA4U6BRNPsnCM/?=
 =?us-ascii?Q?GdHhKBmOJoGHJ7TdnGTnZeZcgHd002B5+m4nYfqkqjIpIO++UQutdxwwBfKr?=
 =?us-ascii?Q?V+jrDYDsiwBuizeY4T6rHiSKwVCDhOSIoDhFgmt1leY5Rut/0ea9pG1XFb6M?=
 =?us-ascii?Q?ABBECQ5Y1L5OWtBfrStsZUae/HExE1fsEpAfVV0M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd45b1e1-7c0a-41f6-47f3-08db45648130
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2023 08:10:16.8961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBIgcZMyif1AcsQ+K+bLoHcP3fL/i/LXMKQkr8iJNROOJ3B+7zGEQQXMfYVEq3s82Yg6waJZLV3ROnEV3wszcuSLR2iaitEV2ehY0x5m0cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11172
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
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Thanks for the feedback.

> -----Original Message-----
> From: Philipp Zabel <p.zabel@pengutronix.de>
> Sent: Monday, April 24, 2023 7:38 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; dr=
i-
> devel@lists.freedesktop.org; linux-renesas-soc@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahade=
v-
> lad.rj@bp.renesas.com>
> Subject: Re: [PATCH v8 4/5] drm: Add RZ/G2L DU Support
>=20
> Hi Biju,
>=20
> On Mon, Apr 24, 2023 at 05:10:23PM +0100, Biju Das wrote:
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
> [...]
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > new file mode 100644
> > index 000000000000..af877d0dadc2
> > --- /dev/null
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
> > @@ -0,0 +1,716 @@
> [...]
> > +static int rzg2l_du_crtc_get(struct rzg2l_du_crtc *rcrtc) {
> > +	int ret;
> > +
> > +	/*
> > +	 * Guard against double-get, as the function is called from both the
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
> > +		goto error_clock;
> > +
> > +	ret =3D reset_control_deassert(rcrtc->rstc);
> > +	if (ret < 0)
> > +		goto error_reset;
> > +
> > +	rzg2l_du_crtc_setup(rcrtc);
> > +	rcrtc->initialized =3D true;
> > +
> > +	return 0;
> > +
> > +error_reset:
> > +	reset_control_assert(rcrtc->rstc);
>=20
> If deassertion did not succeed, there is no need to assert.
> Worse, for shared reset controls this messes up the deassert_count.
> You can just drop the reset_control_assert() here.

Agreed, will drop reset_control_assert()

Cheers,
Biju
