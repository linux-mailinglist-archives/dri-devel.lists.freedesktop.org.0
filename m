Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B396985F370
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:50:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F201F10E8C0;
	Thu, 22 Feb 2024 08:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="r9tPTYdB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2043.outbound.protection.outlook.com [40.107.113.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3B410E8C0;
 Thu, 22 Feb 2024 08:49:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZF7rSbri1u6VDhiJ8GgCkx9+j0nTUkz53xwgfO48Sy59tupLc3/OWMdZMiSmZU5kCebEsSKDyZQRzMDoAsTRGr4KZLsZEVGJbrubwrrUOc1kPX5GX+D3tCx089PdtCiwNvMPn/RhohT/laixAENHQ3AaJHZPEdzaheaCvAmUoW09ONrUJWlfCv/tB7LzFdKf1NkPpK7xFFSjhhWayaSzWoVdKmFs0Es2VlsRqA/KCkrvBEec8qUtR9lhUbmtlqGGmy32YdMW2AbGEx4LUvAqAsV6a2hEv1M8kW48KROva89JUh3WssghR3mALD+8IKomBmiNzxBGPGvLO9iymGKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oiBOH89qZFGL0oi+eLbAYIoR5OV0QfO6IYl5wrCHbok=;
 b=mj+rIZa461NmVyNck/0qUySuMMkD8AJKf3LRXf97+TNEr1D6JgmiBPLV9S7wR6c5th5gbjt8XmwfDNe5VZEBTHxwPXPPNi9kYiMjoCHjutvrE9FkuPWOR6x8tfIv898/aycyQ/Ch0Htid+OwmXXebE4gt9cMPTjvx0Xhal+me6VQ7DQvVi52dawxIEDIZNzURNxb5PqYxzFkN5NEVgjrAiAnctEaL1DDT8l52oQvKbIIN0YYBo9KUXeJ3U5y5pF+9xEfjr5MsipI+06R67/+5rpiEwkWyJotrk3UlbkUwqgkH/FQe/VtSmg8t1P2Ur4LZiew+RyTCyzxQDtWba/6dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiBOH89qZFGL0oi+eLbAYIoR5OV0QfO6IYl5wrCHbok=;
 b=r9tPTYdBzU0imFltIRrkqf0wPelcYYHWRZvnILxyGyQ1MqKHR85a2VJyAj8ovHUUXS68/gArdIvjJO3MbwYLQcC5QWt/Wgi5fon08YwdVQk5S+xmYajpAgdPElRKGMUpLFVXKEbqSfbqh5wCozd3i097nyFunWtKSa7uOYMN8s0=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB11245.jpnprd01.prod.outlook.com
 (2603:1096:400:369::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 08:49:53 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 08:49:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: linux-next: build failure after merge of the drm-misc tree
Thread-Topic: linux-next: build failure after merge of the drm-misc tree
Thread-Index: AQHaZTDuEl5j7jpCP0Wkfk+nxl48zbEV+sGwgAAOHYCAAATT0A==
Date: Thu, 22 Feb 2024 08:49:52 +0000
Message-ID: <TYCPR01MB11269CD3070201364E92C582186562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240222124610.383e1ce3@canb.auug.org.au>
 <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <4hdbpzyab7djy7gxsn6qjhgmr3qczstfgwhefgar4nuxohajdq@5hn6m3b4m64n>
In-Reply-To: <4hdbpzyab7djy7gxsn6qjhgmr3qczstfgwhefgar4nuxohajdq@5hn6m3b4m64n>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB11245:EE_
x-ms-office365-filtering-correlation-id: 93be6cbe-48cf-4b80-c011-08dc33833c71
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6p95UOWal1I83AfAZamXpiLATIrUCTzB2QBxQ686Eal2DzjfUdtmlgvetIVzcGlhBQWyJFRBRYgXoOnkdPDBWHbfzzaJnDSaktC8AR+MfwLUM5P4/chK1VYxCJVURKmWFnVoCPyI+IYTJ1eZXJi7Rq5W4LvPMVy8oHG+0A6mzwV4cKdhz9jAmik4gp2WkTgO9iGc2ShRxPo5j+QCIE/CjxzyQ4uF08/mrQCy/9MvOqa98JtbS/4wxwklenPn7JBUKDZmfzFfpsGoMlF9x+tmaucG/z0jKby74cbYihyPnnIvUXXrQDBXLVSv3AxxHg0ibEc28QND3GuxptGTW/nZXfCubrY3tW5ZlAPh5kqQwf+MGu/3DNtVq83LBzwW1UPwqnZKe6O/hEB2ApbF8IF7ZhHDQ5Dmx7o/CLmhmyoAwi1btgGOJ2Daq+rfUmjRKiZxfcDRCG41rlXWhHX6mRRRIrpkGhz4Us9ujGulTzkauxAqzStywbcqY2kZ4aw0uqXcpwZYQs5GqUl4Cv9ha2PPbZxmeyro6t10MQXwN/qrIHx3wgCI/Czi5E1ppY1jXm4gES2anDS8j5BXLvjkJO4Y2TMuGwvTALM6M7kewpLvN/rIcgLbztG4F1uSxP+wVZAx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EREmshZiGa3gXPh4/TWAEcbxglAbzHAMempBDP5N3Wmw9zO6kyW7ahR0LvC2?=
 =?us-ascii?Q?ah9OeV3UkixGZwwUXIBVY/3Lfa0Pquw+fZtdRnt3Dc44JajNyN1dNdA8AI0O?=
 =?us-ascii?Q?97E/FEdJv5hStkw9X1HQZzFf38zmKgZmSy4L9mlaX0zMmq/RQvh+Oe+9wjPE?=
 =?us-ascii?Q?Y7C+zwO7z5jmCreFUAO/GQmsGi+w4BFvEZOQiqVfbYsACjbC0YsRogXMck6r?=
 =?us-ascii?Q?bBkLernluEzkW/olYd/HfdAq2KRwIPQDFoCVfqzebAAZGA0XbXP/2MHzqDH8?=
 =?us-ascii?Q?nCSGkMshYL9uuirfxoW7f8lsBFF2jP5bauj/dXHv87opV1rIbM/abqEYTvyp?=
 =?us-ascii?Q?8CYs0VDur1zRmBhkBuk0VZa+NJdsn79Ahoq0h//uovI6sqJizPj9ZhGMD/uf?=
 =?us-ascii?Q?/On1jpyTYlcB1kHi6YaLGXNwOQJQ+2VJgc8vjEMrB0V+oA69++N2Kr+17gCl?=
 =?us-ascii?Q?RqeLDxrM/rt3oIC51UqoMfEsCscQWr+eoIq5r23/KKIyYlrmxVwNmu61W70Y?=
 =?us-ascii?Q?oErImlQ0cAfX9U4wJHGF4NfEp3gi7x/ipOsqZ5MiGiIQx5UuGg/4PRpAR2vw?=
 =?us-ascii?Q?RHKnNIIR2dGZ5f254Njs13mJ6OUMjVlTFphaWvsGF5Rz4kCGxvic8uC6IEJD?=
 =?us-ascii?Q?gj6TukUyUFKGk2cQKV4T2frrer7fdYUJyphplaGm5AhvWpVoOe3GvKpOgb3j?=
 =?us-ascii?Q?tIli8eT1WrmMM3zz7dYCLx7qs1Okbb/Oi4cV4SOdnEkuMaQjtczc6+fuxHhj?=
 =?us-ascii?Q?re8oNg/Kt1aeM/fsy4WXlnnHm5x5w86lvUOBmFAeWp+qWQeLptyWUurAukVd?=
 =?us-ascii?Q?Xd7s5Qfb270hWfNBOTGYKj2PkJ9yAiIcpZ4mus/matT4UYu/4+6UjsH848kC?=
 =?us-ascii?Q?DLySMN3QFW8S7ZT38thEs5lG5/3RdQQ5cGAi2Lr5EGDdZf1zNrolpg0H/967?=
 =?us-ascii?Q?DEZRLbcBXclsvY90og6f9+hJkEbdlKzUxXuL7N9HjWZqcdCndT4YJ662YlOE?=
 =?us-ascii?Q?46+OLU1j36nMcJgC9d0TSOEoTtq6O/W2oGj25qkAXZJhfLrvvIUNzqwLv3IG?=
 =?us-ascii?Q?eJtSqJbrGXansRuDdxnMk7u6+sHBuCEWwU3TC07QXr9F3GZSMV4Lkwrg9yfH?=
 =?us-ascii?Q?6HkEdSNbmESBemCOzhvJX5nEaK+/OFyvDwEUgYX+CHaM4qQsGKwwr+Bq5yQ9?=
 =?us-ascii?Q?ULVbQ/daGGTQtrffwcGw/vR8h15xhNRmUVT4mxPiPVj1dC394t8loYLORHHa?=
 =?us-ascii?Q?FqYXwpuTJB+SeyaAKQvOTqop4Z6R8RqB6gNiO/kIZnCMbiievXsVq854y1b3?=
 =?us-ascii?Q?mb7xzmNR/fCVbjcyNgP+sJEmkpbv3cAwx6j6cDCSSbWQ/5rHo4eVfx6Jcogt?=
 =?us-ascii?Q?+ShxPBBUSH/Yr2307d/K5Ogs+/rgbNIduugRUX3XFyTLBcCZ4VlG6bPqx2yI?=
 =?us-ascii?Q?PDvStN1UmUCbngVn/1AGb5BS7yixLLAz4AZTfL217BLMonO9Ms9Hb0KCabdP?=
 =?us-ascii?Q?XiitcBc7xvzgK/xwCf7+5fiuHXIIaM2aKOVAvnC0LlfZ7/xb1TSivB6s1SeT?=
 =?us-ascii?Q?UA1ivDIsQcEumUD6BAB3guV95XfsUyH9bK4PrRPduwF4MQCZMvWHajcrnhgH?=
 =?us-ascii?Q?fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93be6cbe-48cf-4b80-c011-08dc33833c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 08:49:52.6989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5xuyTqiz8LvfV09yP1EvKFS+4vdo5dtvzJCCwa+l3+AXsEBBFY0GNHbfIG56wleMLYLiQqJ7e1+cJMBvyT0K6KYXPNFDsXZGypEfbxIQHM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11245
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime Ripard,

> -----Original Message-----
> From: Maxime Ripard <mripard@kernel.org>
> Sent: Thursday, February 22, 2024 8:32 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: linux-next: build failure after merge of the drm-misc tree
>=20
> Hi Biju,
>=20
> On Thu, Feb 22, 2024 at 08:14:14AM +0000, Biju Das wrote:
> > > -----Original Message-----
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Sent: Thursday, February 22, 2024 1:46 AM
> > > Subject: linux-next: build failure after merge of the drm-misc tree
> > >
> > > Hi all,
> > >
> > > After merging the drm-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error:
> > > redefinition of 'rzg2l_du_vsp_enable'
> > >    47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
> > >       |      ^~~~~~~~~~~~~~~~~~~
> > > In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18=
,
> > >                  from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30=
:
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous
> > > definition of 'rzg2l_du_vsp_enable' with type 'void(struct
> > > rzg2l_du_crtc *)'
> > >    72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc
> > > *crtc) { };
> > >       |                    ^~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error:
> > > redefinition of 'rzg2l_du_vsp_disable'
> > >    61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
> > >       |      ^~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous
> > > definition of 'rzg2l_du_vsp_disable' with type 'void(struct
> > > rzg2l_du_crtc *)'
> > >    73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc
> > > *crtc) { };
> > >       |                    ^~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error:
> > > redefinition of 'rzg2l_du_vsp_atomic_flush'
> > >    66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> > >       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous
> > > definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct
> > > rzg2l_du_crtc *)'
> > >    74 | static inline void rzg2l_du_vsp_atomic_flush(struct
> > > rzg2l_du_crtc
> > > *crtc) { };
> > >       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error:
> > > redefinition of 'rzg2l_du_vsp_get_drm_plane'
> > >    76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct
> > > rzg2l_du_crtc *crtc,
> > >       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous
> > > definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct
> > > drm_plane *(struct rzg2l_du_crtc *, unsigned int)'
> > >    75 | static inline struct drm_plane
> > > *rzg2l_du_vsp_get_drm_plane(struct
> > > rzg2l_du_crtc *crtc,
> > >       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error:
> > > redefinition of 'rzg2l_du_vsp_init'
> > >   302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct
> > > device_node *np,
> > >       |     ^~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous
> > > definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp
> > > *, struct device_node *, unsigned int)'
> > >    66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp
> > > *vsp, struct device_node *np,
> > >       |                   ^~~~~~~~~~~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
> > >
> > > I have used the drm-misc tree from next-20240221 for today.
> >
> > I will send an incremental patch to fix this build error with x86 on
> drm-next.
>=20
> Any chance you can do it today? We need to send the drm-misc-next PR.

Yes I am on it.

Cheers,
Biju
