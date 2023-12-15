Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DF814A4C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8788F10EA32;
	Fri, 15 Dec 2023 14:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2090.outbound.protection.outlook.com [40.107.114.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2323C10EA32
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:19:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DD/IoZpi/gOrsJtdIElI3c8ZWhpWY4t476TyzK0M+gADSfZZhKSIhWOhekk5Qg+g7gWWO50Lxx8hn3njScH9O22CUEWAwsirwVVlvamfhVzMvdL72L0cqVfbFULMcROcOjLMI5eb3+T+G/0y6S4K7rqcAHorzmnaw785jWSapRzpxJexSsFEZTii9yrIrx3ZhUSw8QLf66vZDOT7B4TEO1LfidXx/dvFSbM/N3rDd85/K1vy+l0Yv1Zm2iZaSz56zQnmN632Tfx72WNsbA2iJ89F82McDLtvS/OOO0QwHs6wM/45nd8jUnSOMIhEHxuF6rmW+SmEe+InWCSHLQQOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7WIfAyOT8FmFknswBSZ1K57JNri/SSg5GlOU2WsmR0=;
 b=WteHQRH1wfJMScNXDFunls785kPCDj0MdZGSsd0xsAZJuzfpz3owr3cp5/ZkeaSWSpDdlltFPgE/aniisaH8rDsow/kxCVAN9Ygs6r35X9UP/1TOq8j5ZPs40Rpc5LBYVixDVvt7Gs8I5plloExju0gJu868BRAWsYfvlxU5BXT4m59MDN1lFmo2JRzoAD6Ko27s32yq2oJVTTA+uR+ZvyFG9r7Ug4PNbr7PE1j37O9BLSTJSOgFufC/qcvYtJqZkeVNyB37GAbdSZACVfmD+yDUw7e+UBUekmOl//HwJxkPdnXWdSbu34PvQYArRdnpC5ZxC3CG6CS+G+yA6A/QmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7WIfAyOT8FmFknswBSZ1K57JNri/SSg5GlOU2WsmR0=;
 b=WFnLIORPs236xcPnzxtREarrgk0QENeI9dY5kpd5U8u9GYoD71NI55bKstGu3W97cirIhtxW0WPObBiCL8ciYlxnMN/rCt/ixX/AMGCkb5U0ni0E+bVkeuH8Wq+7WJ6BQDaZq0lcsKHUg0ckXe/jNIUSowZ38lMjOHPJkDOq9R4=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS7PR01MB11571.jpnprd01.prod.outlook.com
 (2603:1096:604:240::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.9; Fri, 15 Dec
 2023 14:19:25 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 14:19:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogIAAEsRg
Date: Fri, 15 Dec 2023 14:19:25 +0000
Message-ID: <TYCPR01MB11269A92241B3469FAC06AF398693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS7PR01MB11571:EE_
x-ms-office365-filtering-correlation-id: 135a4e09-c48f-40a1-9281-08dbfd78d784
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 57f/VWC4sMfaDQZbDS+0X3WWeh258PqRCoo+tpE38qeuKO65/GASq7/bDjawS+Wr0IwfT2+C5uXt6cOEPHbVjeQkRQKGB9GTnrT0u0Cc31hIzr7W7s6TVqfkTmyPULJo6riRfh3StLiVwxFgyu6RZxjMJ4LQNclKibBQaETOkdK840whpektm/MMCVGlE9e5LFw1vHdZ7NgVDf63n/PfSNjUpfOQZqFLtjcZ2bL+88DGziQLSaZ9sLs5dFctauKLMP/dDeGPXnTL6NyM6bHAPmdVbmF8AnL5hsrv7JRjDKo9Y9/7thwySwRl2knC48AO/3PnJx0MoOikSfbVfJjuWny3qapMdlH7SShCLojVh0LKQoaNPdf2lv0j1K2HMHeqDbi7fweaEYJ6qM5Yz9X6+p1rHaMrE8/gTpdNyKnkHgQyC44is79feNcwzBOmbgpyGFj/0RJdC+iWo9Zd1kcl5FzpDT2p1WKviKKnwW+sNO6SVyfAXHiGvC9UMNr76Ao4e5wZYeWqkCFQ1muODzZPjulQKsLY+GYyFEh9hT6BxY3mv1ZEzBYLwuQhqBukmTKkqo7j8TPyFYuAzs3NcpTqnPOgfDYZ9SaSmr4sP8UAF/8U+uexXiQGDT8OGQVJBxE4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(7416002)(8676002)(8936002)(26005)(4326008)(5660300002)(83380400001)(52536014)(122000001)(86362001)(55016003)(38100700002)(7696005)(6506007)(53546011)(2906002)(71200400001)(33656002)(478600001)(41300700001)(2940100002)(316002)(66476007)(66556008)(76116006)(66946007)(66446008)(9686003)(54906003)(64756008)(38070700009)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SPcy7ExcDrT73oI3qt3MjKWJl3oU6t4FS2yRhEt40KKnu2F2RTjpqn7Y28kR?=
 =?us-ascii?Q?FpxuRGCbWCxtq4OTUy4B3P4dGz16QCfsuJ9khZwS8kYuzy3PS44aL0fAeC+x?=
 =?us-ascii?Q?5fsBXHayIv3DorulyZeeBRGplNMguAud86/784mgspUvJeg4mV4mxcQOK0lb?=
 =?us-ascii?Q?7VwyAvaC+g59SZDo/qMQA5MuStxM11he0tAm2z8lCo2maVnhT/V94WhqmVYe?=
 =?us-ascii?Q?8HJ65zSSktbIfbCfZKQSEE3Zyzj+w+gro6WNw0IqKRMAxPGepRNcHoEaU8/s?=
 =?us-ascii?Q?iwpP3KBFzoU9qXGcM73VY3orbvXXTuu04hEiRssUsxK+bp2T/p12QNz8F/pX?=
 =?us-ascii?Q?SxKZq8ZbZPWEXpV8Bk/Rx5zxr9384/ypf3YB/VdJasJiG1gPDOSYdBJk0vlE?=
 =?us-ascii?Q?ma+y70CBto9Q7DxUms1trSK4XlS8LshpEjD3qA4LGJfkYCw4AGWXfUcZvpZr?=
 =?us-ascii?Q?9KHanD8GQvMUuEG1wNOn8hCo/CuMqM1qASL83YI7CBVnRja64Adv/YjOdB+n?=
 =?us-ascii?Q?+tU1Anf9BwhNJi9FC0YN9ZpSJvNyxDBnMgmHyEBhfa7lFBp4AMPSKqolHDV7?=
 =?us-ascii?Q?aEX633STY9jHPFsSV8+2RDsNQb7oWA3hb02IAOF8D3K+rHLe1xBuBISQ5HtC?=
 =?us-ascii?Q?+zgkZ6/0d6c3QsZE4AVMvjIKz4u2qULNZ+w/hQeCA42Wd36Cwxoxuj43OoPz?=
 =?us-ascii?Q?0sxVdhcwc4UW74a7POxhLD/pZ84Ul28P5ePBXgrRpt1XiFrtOPalVOxwkzrX?=
 =?us-ascii?Q?dtED1tdXxeF9GMNS0TLvwU+E7okbRwHssje/o5HjY78AHyiKs4KqFEq4XlOe?=
 =?us-ascii?Q?YMyL08RFC/+zNdtXVXAqbZ3YuYWiKs+2c7qBFktciq6l4kgEZEuLMq1777z0?=
 =?us-ascii?Q?szDkgQujIF1KUL9uF7upR14MhTPXKhCApKJoOWwsgJHo9UFwv+O2IFx3S126?=
 =?us-ascii?Q?qUkYTRSkh11TOlfbNOCnQtRVLpWlEwCgnGo4sOblJz2r2rPcu50syiXXDute?=
 =?us-ascii?Q?370vuPjMYAoNZ27ckncI6dryepUtnhbGbUpTdoKCh2AlcmI+nn8sRrkKGvbk?=
 =?us-ascii?Q?PaNSzP31DDtgmxPk7DqorM9hQI1Wo/HwyyaF12YnRTbLpZayNwTBgvxckCYS?=
 =?us-ascii?Q?M5D24gF+b42TrhU3J9ibhP0Qha0ekp/FnOHohLOxJKNMluFrZcEcS/fKLgi9?=
 =?us-ascii?Q?KSzHszesizAzI+OgdKdSx8u6rNvroc+7AyCAG+kIQVCug3pYUC0XWF2o6/mU?=
 =?us-ascii?Q?OjiRlnL3hXWc0l9fQNJuH6AYU4KvF6W+SM1x+YgXj3Cv48Q9MsICAHNgXP6F?=
 =?us-ascii?Q?AEa13EjHvjH0bN5gdB6juWlSXruicQP9HqfKpCg9YiP1G9yo0UudPatPjil9?=
 =?us-ascii?Q?L3K1FyuZxNcj7vkv3njtpgs8GDITU9YE20+hXFhVxRRKa7weNHim4sViTfq/?=
 =?us-ascii?Q?eDb4QXPl5pvPWNb42QU2zNSSMqDnXq2rkGsT1GZyHtFEiJ7NVxA6XW4DGHYh?=
 =?us-ascii?Q?CjO6QfhhlrtH/IieU8hg/uu9NVUUfgcdi++rZWYK4QCwZAUi7elcgekbLEO0?=
 =?us-ascii?Q?MBWPKBGxnW9V329lpdki0ErpV2Q1pCHx3T8fsKRNBbKA8wS3sulthiwZaohI?=
 =?us-ascii?Q?AA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135a4e09-c48f-40a1-9281-08dbfd78d784
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:19:25.6666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adEzG+MOzg3A3LzhjSZW6HQR+4mQIjAFYRJWN/hKP2XmKpIwsEhJcl3gFRDYQ0d2KW5LoJF9PU9EdVU/S72P7KbgJjixSc3kQ34qEWoZvyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11571
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
> From: Biju Das
> Sent: Friday, December 15, 2023 1:52 PM
> Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> Hi Maxime Ripard,
>=20
> > -----Original Message-----
> > From: Maxime Ripard <mripard@kernel.org>
> > Sent: Friday, December 15, 2023 12:58 PM
> > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> >
> > On Fri, Dec 15, 2023 at 11:37:07AM +0000, Biju Das wrote:
> > > Hi Maxime Ripard,
> > >
> > > > -----Original Message-----
> > > > From: Maxime Ripard <mripard@kernel.org>
> > > > Sent: Friday, December 15, 2023 10:24 AM
> > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > >
> > > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > > Hi Maxime Ripard,
> > > > >
> > > > > Thanks for the feedback.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Maxime Ripard <mripard@kernel.org>
> > > > > > Sent: Wednesday, December 13, 2023 3:47 PM
> > > > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU
> > > > > > Support
> > > > > >
> > > > > > > +	 */
> > > > > > > +	rzg2l_du_crtc_get(rcrtc);
> > > > > >
> > > > > > That's a bit suspicious. Have you looked at
> > > > > > drm_atomic_helper_commit_tail_rpm() ?
> > > > >
> > > > > Ok, I will drop this and start using
> > > > > drm_atomic_helper_commit_tail_rpm()
> > > > > instead of rzg2l_du_atomic_commit_tail().
> > > >
> > > > It was more of a suggestion, really. I'm not sure whether it works
> > > > for you, but it usually addresses similar issues in drivers.
> > >
> > > I confirm, it is working in my case, even after removing
> > > rzg2l_du_crtc_get() and using the helper function
> > drm_atomic_helper_commit_tail_rpm().
> > >
> > > >
> > > > > >
> > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc=
)
> {
> > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > +
> > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > +
> > > > > > > +	return 0;
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct drm_crtc
> > > > > > > +*crtc)
> > {
> > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > +
> > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > >
> > > > > > You should enable / disable your interrupts here
> > > > >
> > > > > We don't have dedicated vblank IRQ for enabling/disabling vblank.
> > > > >
> > > > > vblank is handled by vspd.
> > > > >
> > > > > vspd is directly rendering images to display,
> > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > called in vspd's pageflip context.
> > > > >
> > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > >
> > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > reporting is going to work. Could you explain it a bit more?
> > >
> > > We just need to handle vertical blanking in the VSP frame end handler=
.
> > > See the code below.
> > >
> > > static void rzg2l_du_vsp_complete(void *private, unsigned int
> > > status,
> > > u32 crc) {
> > > 	struct rzg2l_du_crtc *crtc =3D private;
> > >
> > > 	if (crtc->vblank_enable)
> > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > >
> > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > >
> > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> >
> > Then we're back to the same question :)
> >
> > Why can't you mask the frame end interrupt?
>=20
> We are masking interrupts.
>=20
> [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> [   70.650243] #########rzg2l_du_vsp_disable ############
> [   70.652003] ########## vsp1_wpf_stop###
>=20
> Unmask is,
>=20
> [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> [  176.354922] #########rzg2l_du_vsp_atomic_flush ############
> [  176.355198] ########## wpf_configure_stream###
>=20

Shall I send V16 now as I am going for xmas vacation or
Do you prefer to wait?

Cheers,
Biju
