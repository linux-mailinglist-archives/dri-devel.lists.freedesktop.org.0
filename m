Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B8814B05
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9208910E167;
	Fri, 15 Dec 2023 14:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6229F10E167
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:55:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOmiyMvDs+s2iMo5uW7IzDTuwGGdIMnOsuc9VoHDw3Ywfb80UI0HA+5iTWvwz5RMC685p4JGqXehS+0wal8TxhT/3pdY8ISRMrNy3Fv5hy94fAuJH6Ng0T+Q5M673zvvnTp40WZ5laCBX/1zL45jOW8qtOWJzcForo6Ahpjb1u4DPSZdFB/ofmN6CCBxTIWkPhcnGp2eX8tuDZl629zlvNCO0wjbAy4oLmpJAcoGvepKGsmn6cGBXkWVRgnChCx9oABvsLR8ICOkeawMdt20Um8AbzvOqCHsxh/2kvlvKUBd1mKmoG6ShSuozvSUZKiNPE5T7y9ZfbsP+AYkThQk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bf1c9I/xQO7FBiznHBqMsEGbFNUzBraSRvENUTHoQtk=;
 b=NydAPCr+ZrGYFpsS4ZIDHGC6iucdhbpT2R7AvebiYAJYxqRIgpzb8CjHcTYaj1yV5SdsDeBGfjHi47t6MRNYhh7ui8vaDaDkHfaSoe39FVn+6nNMDGhNhE7dpOM5jTjQXjuuG8/xbJ0IJbUdexRBFIa72hKbZky6o2+yvcEQv8hNwvRy31GPhD3fQup7u4Izw/0aRnhgXzqmdokeEj2mDIbt2j1oaRWIbmht3fjxZVFwkhRpSJb5A+Fn1qOrxYocfdDKp+kQ1zKPQqZEH6zEpFoMiEsDShcJemDFJd7GSYBqn2/EUcwQdvfHYaFULFPNvif9ONR5pozLOkxCFZ1XPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bf1c9I/xQO7FBiznHBqMsEGbFNUzBraSRvENUTHoQtk=;
 b=lmnxcAEDQAX+oOec8GAlZ7wuSAJUhImgpUX1DlMO4QmRxh/CWXgZINeJ92FOzniIsY/8UWol3kFrESczruLQqVbJ3Fm4Uv2Cjm8YzBNamo1rUstUYb7rBzTPGYmra2DBEZVWcaccGfMRQrwK7YEEZ/YRx3rwt6/VD+Do9m27GZI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYYPR01MB10497.jpnprd01.prod.outlook.com
 (2603:1096:400:2f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.12; Fri, 15 Dec
 2023 14:55:52 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 14:55:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogIAAEt4AgAADUYA=
Date: Fri, 15 Dec 2023 14:55:52 +0000
Message-ID: <TYCPR01MB11269BCE6CAEE3C5063C4D1728693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
In-Reply-To: <g4uqcavglw2md4ojiw7yxequy37ttozjazr3b4ypqzznlrsinv@zm6mvzaempwp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYYPR01MB10497:EE_
x-ms-office365-filtering-correlation-id: 8c221429-4474-4625-70de-08dbfd7deec5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V33/y3w3KLjydJoakFrhijwXYBgtdgTTziEjq9p11LPktT/ZdUg7/Q1prA8JFzvqZn/Huakiryq4lyTQwK0+d1lZ+bCWWbcWsEwR1hy+D3P6GLlMiD1b6+bGTnX/OJKd+/SNEckHUqqxZbnhIzvHGeSvuBdXww8Lnl0fWRgJWV/QkA0oPZyrtMc/qNknRLhXr1svZ06WqpOiLJw9lxeiUMUxdhSUlCsQ8h3OxXfLCSessxubKzWPC3T7ORWe2NcUqGrqs0EZl5a8B6BXGxnRuG6oAU+JX+OSWPkJS2Gib+hGJciO0sr9AQOQQQ9+lsJsQlngab1B5uT+IZ8tHtKUCT0/R3eokvUFZEa+rF4wPgpLBE6QaSut7kYmaBaF65qeFtxL5HGC5NdXFD8fguIhwJ3ERCH0DXXdCxvmfdASNXl22PFOut0GDJHhNB8GVqe1iSdAQ7dw2T/M9XQluo1Gh415nOGxXzNqflASa+v6RXlZbh/QTityCDsNIVp42F1wqIuFZ7TgH7sKWzwZEzjqyKMJsKlBmZz+sUnRPYCsWqbVxN7hHU/lTtXKR8t79CnvpYSkopaQr3kPdHIUKqOB+SUCqQlXjry49Hk8gfGowgzAFX/Fw8OvFcGbGju4G256
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(55016003)(26005)(7696005)(6506007)(33656002)(38070700009)(86362001)(38100700002)(122000001)(83380400001)(4326008)(52536014)(5660300002)(7416002)(53546011)(9686003)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(8936002)(54906003)(66556008)(66476007)(66446008)(64756008)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xVO0NCSLpNAF2Wf3tE6w4iKrDlB9ZcYX6Z5M/SKnrfKlTrdwAGwAnsCuW7Ip?=
 =?us-ascii?Q?CfXM6md3R2G+ohc9exeAJ9fstALhoX/eLat2QNCZ+OnCiRmbCJKRZoNVzfMA?=
 =?us-ascii?Q?P903fD2wL0aAi/IDX3V4Uvnm0WD/cwxCgapHEZcFVa6SOL2VJA1x5KKUAXVg?=
 =?us-ascii?Q?NhFdoIOzfkoMSNrvRdro5WOEsKWF11dvcQazvI4cFEH7/fpPDSz+1QMSXqho?=
 =?us-ascii?Q?pls01uJm4FzxlN4+1ATfTLosSA0AhoCb2yQQZV7cF2d0rbKBBWupCQ3TUS+G?=
 =?us-ascii?Q?YmB2IdLEEGQ0Bgm2aSGdQ6Iovn2C/pTamz2oj0a44156NY/z/5S0/zptqZVT?=
 =?us-ascii?Q?htv2vItPIgX/5zsVc7wcTujKDGBONmiHhakuQ5Ws4+HibBn33Tc3MAaIREUX?=
 =?us-ascii?Q?9CLurtkUjh3xgovsUFXKQV82jhWvWwxm0eHYcbPm405rLQNvUAiDFmb9Exw0?=
 =?us-ascii?Q?MFnsyEptgzdS04BgJcybIDSa2AXMzWnewUWroS0wiVaw947u/HQUVSz76Chq?=
 =?us-ascii?Q?pAlVffWT2EFZqNNwQpjaE7f9FcSveCwaueOzQXFkROVhUUSjeeotwgjv0rVL?=
 =?us-ascii?Q?SlrFfn62MNYqPlmZekaCumSSBLNDPUhTWTs//lYpkC9qyTWkLSxmVEs/zYdy?=
 =?us-ascii?Q?h4cSFzIzcjAj3b1K1NF3OCkmsqAv7Erd4OCZ3nLG/SpfxxryuwC7ZWzet+jk?=
 =?us-ascii?Q?MXmbA8u8EsinR0GkxgAsk2nDof3Rm20V37uA13fvfW7tOKMULwrQKx77jznL?=
 =?us-ascii?Q?UAPWyCqKjedp1tPwicoiedHI3PUQmym9m3jt2KWabV30bJL9y/UDFudCXyeq?=
 =?us-ascii?Q?99pjx6cfQkoDmbZ+fhxeOou1BS2nQRkF963umeErrTtWX88zNw5ZGkUF1da7?=
 =?us-ascii?Q?fwDIU+NRhK2H+E/B1OO9H18gIydc0OXu/hLsjr+B/2aUjXFP0VeX0isokwlE?=
 =?us-ascii?Q?kd025pHgZHZvzAdUToecEK7AIizs1ZVk4AKMQ00efCglcoCqs4Y1ldcrdJUW?=
 =?us-ascii?Q?bO9/TXrEVBfCkwC3hHE7qGEkWH64F6gex+PR8EQIFlzq2bmCqZoEUWrbQi8F?=
 =?us-ascii?Q?QMsT4+rkdxVX2T7HSX2llVWUgjGtvLx58ceg73y0Ne9h1ExNAKr90GjmGICh?=
 =?us-ascii?Q?wAybuk4PTDKyrTGwpQhJUuhxGnZvK++trYLvF3JMhq+fSWuocbki6G2QckDg?=
 =?us-ascii?Q?Pk8NZyHtbM/xgvFVGCJHcBNor8U1+YYtYhmL7H4BKJ2SKmrZQAd66MgLZ4My?=
 =?us-ascii?Q?v3BqjYVj9MH2yTysdwg2VAFbPmhKOeIIxTjBPEgqpfzU7Us55RleiUelHCrt?=
 =?us-ascii?Q?Hyfz9WrkT+/BiLzZQjeN2hwsH6uc1kVeM1SJ3ubra7AyfReAkb/Gfbz0De21?=
 =?us-ascii?Q?u1L6vftKD0J+MMn4KK05To615rjCv7ypIbJdfFBnRW/jY9xX3q1um0Xct1XV?=
 =?us-ascii?Q?+aBDLebtChgKZqe+Y94uigbL8Mv63UpzZ/x5ivAm+5QRw6Wf05ZJcda62sg1?=
 =?us-ascii?Q?Lr/2+lN2GaV37cePK9U/A+Tvb6DiPH0dmAPh10o3qmufMTazJdIDRKybKQmn?=
 =?us-ascii?Q?vefaN7jRrIf/HgdTyJzHAHTWCUDOnt9nFI3zIgbG8Q+TV7ZTdU6ZcXso84eU?=
 =?us-ascii?Q?FA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c221429-4474-4625-70de-08dbfd7deec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:55:52.1520 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwU0zBEOrB3kCPivkwHsDjJ48DtYi+qDChmJcHiio8bHBUedoryIR9YJvSvgUyu5mQIujWh6/J/eZjxTjDR34mVtxmRcw37CJnHISx5934c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10497
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
 "biju.das.au" <biju.das.au@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime Ripard,

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Friday, December 15, 2023 2:18 PM
> Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> On Fri, Dec 15, 2023 at 01:52:28PM +0000, Biju Das wrote:
> > > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc
> *crtc) {
> > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > +
> > > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > > +
> > > > > > > > +	return 0;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc
> > > > > > > > +*crtc)
> > > {
> > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > +
> > > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > > >
> > > > > > > You should enable / disable your interrupts here
> > > > > >
> > > > > > We don't have dedicated vblank IRQ for enabling/disabling
> vblank.
> > > > > >
> > > > > > vblank is handled by vspd.
> > > > > >
> > > > > > vspd is directly rendering images to display,
> > > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > > called in vspd's pageflip context.
> > > > > >
> > > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > > >
> > > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > > reporting is going to work. Could you explain it a bit more?
> > > >
> > > > We just need to handle vertical blanking in the VSP frame end
> handler.
> > > > See the code below.
> > > >
> > > > static void rzg2l_du_vsp_complete(void *private, unsigned int
> > > > status,
> > > > u32 crc) {
> > > > 	struct rzg2l_du_crtc *crtc =3D private;
> > > >
> > > > 	if (crtc->vblank_enable)
> > > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > > >
> > > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > > >
> > > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> > >
> > > Then we're back to the same question :)
> > >
> > > Why can't you mask the frame end interrupt?
> >
> > We are masking interrupts.
> >
> > [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> > [   70.650243] #########rzg2l_du_vsp_disable ############
> > [   70.652003] ########## vsp1_wpf_stop###
> >
> > Unmask is,
> >
> > [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> > [  176.354922] #########rzg2l_du_vsp_atomic_flush ############ [
> > 176.355198] ########## wpf_configure_stream###
>=20
> Sorry, my question was why aren't you unmasking and masking them in the
> enable/disable_vblank hooks of the CRTC.

I have n't tried that. Will try and provide feedback.

Currently the IRQ source belongs to VSPD in media subsystem.
So I need to export an API though vsp1_drm and test it.


Currently we disable IRQ in rzg2l_du_crtc_atomic_disable() context

And enable IRQ in rzg2l_du_vsp_atomic_flush().

Cheers,
Biju

