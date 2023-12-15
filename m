Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F922814AC7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810D810E07B;
	Fri, 15 Dec 2023 14:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE7510E07B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QU2i/Q7BgiCD725I3WBiVwgBRTQVvSCAt/FiIIsmXdlwt6R4K9BPoWwhLIFcpdeGmuBYYAdxjV5Ym6wysfNU+r5N8MwgGb2gevDYUJozcqw1VShYt7MbkpipQNnBmOsvVjAzu1p4CMe92XAP9xOCyzxlSARdZDQowBLc4UzHktCXMwT+XPVRy2XQMclepi06CCz0lPacV8LrA7vtXTKg7kDVU9eQIdGCHTDm5DlL3wcqScaDPRRDbd52o1k87JcIkKoTeCFPo1SW4sOZPrzN6FYeFYE/t9TGx5tWyrEmx73v6QvU9EuiLYqXJ1hJ4E7L0hYrByefOQ01z4rPmK7/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joBiH2rMz7GUe8L9AU1MRK5LavwIl5EXgPXCsK8TRHM=;
 b=KqJBlDmsQw3EhuKyI2DWdEv1GIlZ/smXbTYT7kLP2favV40yMr8F7VZMYRHOqjUiJ3jeg/5ZluJfxdYWVnEzbhQtdbUpPxY7pqWUc8LHnYGLG9uEB7QhHoB/FIGCNIRi6IN0ytDx3nignuRFsiQ6ZYYsFKH53XTvuMbFuEHSj1OpoCCXomXB38yCqXPsQ14Lwi31SBbhp6+VGhATQi3zBzRqLgUrHTLIx0YP17bT9eJuNaPgQipUpy0tGP4NHFNn6akf3GLj4lEQuTcsXOLSTgUCrrB/LRVD63rfnEU6IjXfiFngoIL90PP4puLX2oJObuzKrKr818RTMZKCony7qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joBiH2rMz7GUe8L9AU1MRK5LavwIl5EXgPXCsK8TRHM=;
 b=tpNIReAyLXZQ9EyXXwKhKDT+9YSb5gRcgTOY612WqQ7J/yFudvg6d9pKmwiXYcHX9P3YbjKCEcPYLfYYjvVznIlbds63fyrqxNWZlzPIEbUT/kSatgV1FHxd7CN3M4lTdYjgN42jd16t1fm8Ax5T1tPSbJ+MGHclMVBX/QudTxI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5298.jpnprd01.prod.outlook.com
 (2603:1096:604:a2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.10; Fri, 15 Dec
 2023 14:42:33 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7113.010; Fri, 15 Dec 2023
 14:42:33 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Topic: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
Thread-Index: AQHaIejqQbh+O2CetkGmd2PHSouIl7Cnc3CAgAFZmGCAAXC4AIAAEXwwgAAZsoCAAANogIAAEsRggAABgACAAAUi0A==
Date: Fri, 15 Dec 2023 14:42:33 +0000
Message-ID: <TYCPR01MB1126962178E65F3D35E61EA808693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
 <20231128105129.161121-4-biju.das.jz@bp.renesas.com>
 <sechknyg33iucaku37vfhk7ie7xgcealfqbvaopm4rrnqbo5g5@s35peonkzzoz>
 <TYCPR01MB11269767836DEB995747B7ED3868CA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <zp2ews2by6fg5irmb7ms6blox6vruezdjlor3rutqtokbvlle2@tl775slyvhyf>
 <TYCPR01MB112699C55873FA75B8F4469C18693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <bw3qxved377k5pmh3dbnimiyxra7k6dgb2tmg23bvxnfglti4g@uqdxmgnqrkg2>
 <TYCPR01MB11269CC132B84CFAD11D307578693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269A92241B3469FAC06AF398693A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <5xmkpbymmvsqdfjxgkrjf7r4b7sgxdd7gq7qmohg5id6ljjg7z@rznod4o464iy>
In-Reply-To: <5xmkpbymmvsqdfjxgkrjf7r4b7sgxdd7gq7qmohg5id6ljjg7z@rznod4o464iy>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5298:EE_
x-ms-office365-filtering-correlation-id: 3ce6aa3c-0973-44bc-60db-08dbfd7c12a0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1EtqONf7c1m94/u+p6ylTfkSs9HlJsZoZwIhKlvCdWJb/fjHampUEtsOdZ9tN6tMtXbo+sfB9HYwDvj2zR3duDWpAu8SH/skDBcHG11XFREYPgH26+QLNbnOLeVNGUVk6956aSPnyMpPOLi11mkueu2d0mlg0LhD0HmWHXuRcC+U8OCiWYy8/MgNwfGFjTsuUKfspijiRxMNLCfwLMl77rTMyIG6g6DtDJa9MaWlY0KQ9oTQFBFLyTfqe8abfEARIr6mGB4LoyE2GsrbG+MrThzXN3cFdGpTeifxVUdlAPAMA3MOkIRUezrEvLqbBP65Ldtxxy1lrssili/wMygM5jT2eXnS7VWj8QSA2JHD/OEDdl+1M1a7ePz6nK51Cxr90DiROZNUqjWP+uxD7CkPLIXxTdHSVRWTWLFFFmSoBqImUFHmjnye+Ct+0qqPkR4/lY777rntfGu4+WoIHqfnjsPszsrK3Sbm1OtMOSv9e7mQ4161kXHCOKAbdRM3//pKhacUZSVH9Mk0ODBvG2K1UpyrPdCemot7ljhbTZBcj1/fYXarNrYR5DmL9I8rEnNY+jLgY4yTTkr3te23IoDC5Fk1/YHWsumFfZGipZntnFEuTEusTnEsDvOFJPONui8M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(26005)(7696005)(6506007)(33656002)(38070700009)(86362001)(38100700002)(122000001)(83380400001)(4326008)(52536014)(5660300002)(7416002)(53546011)(9686003)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(8936002)(54906003)(66556008)(66476007)(66446008)(64756008)(2906002)(41300700001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lMFw2Jpr0OL8Q5TMoXMSDgU+lBhkc07hAQC6wHnI7xpyeWRpglOVoRb0+H8a?=
 =?us-ascii?Q?C62C2Yix5KEzRxoA6uDzq8wn6LKdu5TEb6n5uYIcPVyJ98j2mXnRfJ7tl/BI?=
 =?us-ascii?Q?S/byYE/DM3DwSOSCqX9ANyBOXQ3SOfwUlBM3epertQdrz5x0PLg0wXINDzgm?=
 =?us-ascii?Q?AkJBEg2LkT2omaODi8tQTjWc27RF3FteMAt0jKBxkszqc3fWZUrEfheed8fm?=
 =?us-ascii?Q?jrAjZhBqQCnOsNG/cGvpxGyte+KKMeNKfl7ZxW2sy/TFmO/Q4nea2ysPpVXV?=
 =?us-ascii?Q?4+6Zzfq/O/LKuAadNf69Ozpi4ouD6wRyQUUHvUga0ebzf/JR3F+YYllNouzb?=
 =?us-ascii?Q?v3Dy9QsosUWLQsFKYtQuZVq4Em+5dL6xK9DBpHeFRgo6iV4DLTc4Oro+PQVy?=
 =?us-ascii?Q?c/n4hlV51ro2rGqEhFJJPO71ml8Q5N1VSAXGjVXTERT/AjQK/B1TMftxzidO?=
 =?us-ascii?Q?dYeF8IxjqcYQLQPBOH1tcLxCtgDuWTqazOqefuUTGdHAYdb194z/zOjOpnvg?=
 =?us-ascii?Q?2Gy6QUKwLTq0suIf5HQ8rxObmqqRkjl0ENui+aAyApT0Cxv+DquF+8xmia+J?=
 =?us-ascii?Q?NHfAzgPTV8y5zdgG7nEXC2CyiFMx33uwkyw8FUZ0Djy1R0rNS3o8vRJ6nRJW?=
 =?us-ascii?Q?QKT2lbm6ANsIoBlnKcxOw3FBh0naMu/68HyPu1Zo9BAcTn2rDiuOpvw3qq4c?=
 =?us-ascii?Q?HGzfV52DRAtY+T1Oj1o/6Y3jnXggWkc3mApbORpmekVDZBcpJ+yjji0BPrya?=
 =?us-ascii?Q?sM8GkPzbfo5LIeaVLg2pXiPRVEmQ6pFxMWYUzH2WpaoHryVe92jk/nI7YiBK?=
 =?us-ascii?Q?5QfFjNbLvRbQb6qRdPfZZCN7VfTNS73wGb1RopVumvFkCIyXXnRAQU+fMhFi?=
 =?us-ascii?Q?cDsFgaqxlshF+XlzK6KvdIsp4xdvAtP0lx/1AKAj0ufx25enIXumpeNrKClf?=
 =?us-ascii?Q?+GlW/cvu7lPyeL38nH/RRhQiJ+qGXVfb7XubtadS6K3Nvt7L08bm5kcRrbku?=
 =?us-ascii?Q?0WmKTYuCKEhkJ70aMp/DwMYsbfTTfD4PAQEYELphTzWT5cAVw5Fb02qBBc3c?=
 =?us-ascii?Q?S7VQVrgfmj7KqQBrc8nklvrGvW2JLXRN8XoWNu0SH1tOt4xM76gtpNFc93Z9?=
 =?us-ascii?Q?bcLqEnt81+j5M4+pFOBKn+/GkTMBIbkP+q0OqBJryDujv33xA+w6w3Oisuh4?=
 =?us-ascii?Q?a6OHSrqIfojH9VqvrgF6R5oupaCyNOQuW8ZvXwH1ZvpPo76ijYq3hjXCdFsS?=
 =?us-ascii?Q?cOp87UOeHG6KYhNP6eV92FW4x5Z82xKSAYIKAN+zuoMr1qVZFg6TQzRt6SGM?=
 =?us-ascii?Q?QAXF5lA6r5FS8bIpMv+kw66sZu66qOswbutn3DGMo6tu5UEtehTpV3FVirb/?=
 =?us-ascii?Q?c+WFU82BJXr0ARv1M2lijVz9mg7ucsgH6hr6SYzDDS/LNp3VRa6ilZEIN1+g?=
 =?us-ascii?Q?FFIO60IHJ61eVI4FaIIiA95xEVto22CoDO4KAxVvVq430zDiNg7h0qfLQXJY?=
 =?us-ascii?Q?LsARqB1hpUzVNsv8ufDOA+W55sRr5ywOPeOx7dtD5szFaoJ9H9klEl3zKuqV?=
 =?us-ascii?Q?nf8f2Ks6Aa6AtjhJwquqYAKiiTGZWYJp9G1dilIWqcFB19PqSzC0y8CBc4Bv?=
 =?us-ascii?Q?yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce6aa3c-0973-44bc-60db-08dbfd7c12a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:42:33.3109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMqppWQ2j4St12H3s5/tVeq7J6ogeIBSK4O9HNDzvriLy+3MKtMv34iZQsaWcq6fEbtBC8rKmyJ+x7Em4+HT+BoRic7T0Xh9KDtSO5axdFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5298
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
> Sent: Friday, December 15, 2023 2:23 PM
> Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
>=20
> On Fri, Dec 15, 2023 at 02:19:25PM +0000, Biju Das wrote:
> > Hi Maxime Ripard,
> >
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: Friday, December 15, 2023 1:52 PM
> > > Subject: RE: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > >
> > > Hi Maxime Ripard,
> > >
> > > > -----Original Message-----
> > > > From: Maxime Ripard <mripard@kernel.org>
> > > > Sent: Friday, December 15, 2023 12:58 PM
> > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU Support
> > > >
> > > > On Fri, Dec 15, 2023 at 11:37:07AM +0000, Biju Das wrote:
> > > > > Hi Maxime Ripard,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Maxime Ripard <mripard@kernel.org>
> > > > > > Sent: Friday, December 15, 2023 10:24 AM
> > > > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU
> > > > > > Support
> > > > > >
> > > > > > On Thu, Dec 14, 2023 at 03:24:17PM +0000, Biju Das wrote:
> > > > > > > Hi Maxime Ripard,
> > > > > > >
> > > > > > > Thanks for the feedback.
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Maxime Ripard <mripard@kernel.org>
> > > > > > > > Sent: Wednesday, December 13, 2023 3:47 PM
> > > > > > > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > > Subject: Re: [PATCH v15 3/5] drm: renesas: Add RZ/G2L DU
> > > > > > > > Support
> > > > > > > >
> > > > > > > > > +	 */
> > > > > > > > > +	rzg2l_du_crtc_get(rcrtc);
> > > > > > > >
> > > > > > > > That's a bit suspicious. Have you looked at
> > > > > > > > drm_atomic_helper_commit_tail_rpm() ?
> > > > > > >
> > > > > > > Ok, I will drop this and start using
> > > > > > > drm_atomic_helper_commit_tail_rpm()
> > > > > > > instead of rzg2l_du_atomic_commit_tail().
> > > > > >
> > > > > > It was more of a suggestion, really. I'm not sure whether it
> > > > > > works for you, but it usually addresses similar issues in
> drivers.
> > > > >
> > > > > I confirm, it is working in my case, even after removing
> > > > > rzg2l_du_crtc_get() and using the helper function
> > > > drm_atomic_helper_commit_tail_rpm().
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > > +static int rzg2l_du_crtc_enable_vblank(struct drm_crtc
> > > > > > > > > +*crtc)
> > > {
> > > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > > +
> > > > > > > > > +	rcrtc->vblank_enable =3D true;
> > > > > > > > > +
> > > > > > > > > +	return 0;
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > > +static void rzg2l_du_crtc_disable_vblank(struct
> > > > > > > > > +drm_crtc
> > > > > > > > > +*crtc)
> > > > {
> > > > > > > > > +	struct rzg2l_du_crtc *rcrtc =3D to_rzg2l_crtc(crtc);
> > > > > > > > > +
> > > > > > > > > +	rcrtc->vblank_enable =3D false; }
> > > > > > > >
> > > > > > > > You should enable / disable your interrupts here
> > > > > > >
> > > > > > > We don't have dedicated vblank IRQ for enabling/disabling
> vblank.
> > > > > > >
> > > > > > > vblank is handled by vspd.
> > > > > > >
> > > > > > > vspd is directly rendering images to display,
> > > > > > > rcar_du_crtc_finish_page_flip() and drm_crtc_handle_vblank()
> > > > > > > called in vspd's pageflip context.
> > > > > > >
> > > > > > > See rzg2l_du_vsp_complete()in rzg2l_du_vsp.c
> > > > > >
> > > > > > Sorry, I couldn't really get how the interrupt flow / vblank
> > > > > > reporting is going to work. Could you explain it a bit more?
> > > > >
> > > > > We just need to handle vertical blanking in the VSP frame end
> handler.
> > > > > See the code below.
> > > > >
> > > > > static void rzg2l_du_vsp_complete(void *private, unsigned int
> > > > > status,
> > > > > u32 crc) {
> > > > > 	struct rzg2l_du_crtc *crtc =3D private;
> > > > >
> > > > > 	if (crtc->vblank_enable)
> > > > > 		drm_crtc_handle_vblank(&crtc->crtc);
> > > > >
> > > > > 	if (status & VSP1_DU_STATUS_COMPLETE)
> > > > > 		rzg2l_du_crtc_finish_page_flip(crtc);
> > > > >
> > > > > 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc); }
> > > >
> > > > Then we're back to the same question :)
> > > >
> > > > Why can't you mask the frame end interrupt?
> > >
> > > We are masking interrupts.
> > >
> > > [   70.639139] #######rzg2l_du_crtc_disable_vblank#######
> > > [   70.650243] #########rzg2l_du_vsp_disable ############
> > > [   70.652003] ########## vsp1_wpf_stop###
> > >
> > > Unmask is,
> > >
> > > [ 176.354520] #######rzg2l_du_crtc_enable_vblank#######
> > > [  176.354922] #########rzg2l_du_vsp_atomic_flush ############ [
> > > 176.355198] ########## wpf_configure_stream###
> > >
> >
> > Shall I send V16 now as I am going for xmas vacation or Do you prefer
> > to wait?
>=20
> Waiting is fine, most of us are going to be in holidays too so you won't
> get any reviews either :)

Agreed.

Cheers,
Biju
