Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A846985F29B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 09:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6E10E8A2;
	Thu, 22 Feb 2024 08:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qiBenFK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2087.outbound.protection.outlook.com [40.107.113.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C5C10E8A2;
 Thu, 22 Feb 2024 08:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPGosPlCj5t/JmsaSN8n1jRWfvTyrjQ2qEYfJzaiOOjlZVWXz8GGzCBsPhP9jSFrsZvpfYNUqeWmZZPG+i1kLHmXLfmcF8uXjqLkJ68lg5cbfSi/2yAnX6B8XmOQMKtIrleO500JxnezorTKPUyjDLwtWdmDqCC2mad8lO5ZyDLRfOkRqKFIfMRTDiK9iEDvvNpNw+YCZRawQnFb7t05YRTZhVJC0JKgX/fHM9RWTJH0ipaD6WXPQDEVaTaDcEZHDO8f8LOms0TcF/g5Vg7HVa4PsoXlDnHAkm229BOJJ7R7nq+LWtKT3wCut2YjBOA4z3YI76lGoIoslOMc8qsw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAuO+1BbdGlPpv1WKzQmP6RQwZHHjRoVYCz6Kn1t+OE=;
 b=gQ2cp7R360n8c6S8l5z+O6qkNgfZpGmdZJYw2Wy17pPc2ecOq94WbQR5/tVl2dDcxuonEOxoBziRqtXjkfmp2XpSgbXv6XIWgj5td+kzMIqiiWzgebcJRnfbHVEKGzvYFf/zDAFleG8Dnn8OIuPQDzfn5Bc5HMm45CscZMKBWDiijNpbCpmyxBW3M7tLShKH6Zb1++YFDwRs9JBHKEn4MptJZkPq+hvOCCeV+JZLNHbgqL2a3A1GABlrcRCxf2bqgBT0RqTmC5zzxuWLRs/W68wK2OMsifKzdV3k7qArNF2hDUriscBCfVEKkvOPzSVo6D0Lg5jAgX8y6zJkH/WZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAuO+1BbdGlPpv1WKzQmP6RQwZHHjRoVYCz6Kn1t+OE=;
 b=qiBenFK9/NbP2pK1pHvnVJCBu97Qk4hapu4049MNBOt2+G/AbqQpmqnb48o/1+HMDfVFoecycNlEmRNnfXt9alYFRIvUMel9Gj1/Qnernevsvdzr3gBDy4Z2b1CzvD5+SbpXmK4d+xwh4NDkagxiI9BCh3hqwuowsq8FbGpyFFs=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB10386.jpnprd01.prod.outlook.com
 (2603:1096:400:252::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 08:14:14 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 08:14:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
CC: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: linux-next: build failure after merge of the drm-misc tree
Thread-Topic: linux-next: build failure after merge of the drm-misc tree
Thread-Index: AQHaZTDuEl5j7jpCP0Wkfk+nxl48zbEV+sGw
Date: Thu, 22 Feb 2024 08:14:14 +0000
Message-ID: <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240222124610.383e1ce3@canb.auug.org.au>
In-Reply-To: <20240222124610.383e1ce3@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB10386:EE_
x-ms-office365-filtering-correlation-id: bfc4e12d-5758-48f0-d304-08dc337e4206
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VDColkxmJy8yaPLsSHW8EZ1mZKedPiSP8wg9EfVtyr+yAytiU9Xf2Odoe3lq9BC48lv4l3UCHkBU22wSxGKjyELSzWJrL36x9yH1sICHzQyTZMCICYGu9xIYjhA46jzRJL8tGDi8x54IS0O63jp7ZzHnb9xJ0xYvwx7HLkSak0LJMEfrUXlU+H3c7GQ3FNGTEKtnsV5zEs+EErOHPv8q9uSIoHVWDhMEBcOgTfknpB6QkPlXGi+qxRnOMLKasnPNTlnkwQcBjpuCOKKqdvvBns4SLwdUEPkuxDlDktaHt2l3LdqEbeaQc46wvqE/MXakEBY4Co79KDuRYiNbKFgdLnAvmtd8ngv2sjYrZQGQ+weSam32HcujllZStg81or2J37KFxEdVZdhkgAhKR+DsoyJONxRhqnBibsQwIl0TtxyhS2RVY2jK+kW+ho/yeWSwPoIjRD+oNUUrV5bgK91NcoD0qFMYjJ048wjE1WX5JenaCny3GvLNE/CFNmPeSO0PPYJU+jGskr+Q2qDSZ6/SmtsvmfWpTrhhvlG9sA+vI0J6lnw1XtaPjgHdbY79X4HtQfjMH2PQ6gfy6tJ5SQo2ZR303DhAVPEqpKLhoCzoHbr8k/9PCoKbkeWlDHXL70s2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DxFM5ujWlazQkUJcTyUPXqSD2ZvffN/o5zBDlG1b8R9mG5e45ksL0o6CvIfv?=
 =?us-ascii?Q?+1gksO47LN9zrKvqVtzJ/Auhj1g3UTde7CPtrCIKcxMnSX0ZTOGMkrrhsT0q?=
 =?us-ascii?Q?j81K8/klCfW7M4DO5tSVdWLqk9MPDIfaiT1XTFwjGwSKLX5+gy5qq1hUYBAk?=
 =?us-ascii?Q?tn5AYNnBsAYnsnUht9TWki59h/CTaYUbzklaZnrHZHRyKXsuNGiUBXZ6bZVz?=
 =?us-ascii?Q?VnJPz94ydbusR9XFBiNLO9E9U8QNE9bKer4tYOYEuYzavdAlBw01bCaeu+Yi?=
 =?us-ascii?Q?EYYyJLtuOx+ycUpZn22Y5ntlCHwulioalGcQ7igRDnDOcKTHLkn7GJE5a20C?=
 =?us-ascii?Q?gb4Xms/Rq2iJH0vaPtHFPvcYycCH7CE2k242c2pleQoppIeKY7Zqe0sYlOK9?=
 =?us-ascii?Q?QRWmTCkxNI/0HYr6whxZFpSFF+lJ/lZpOa4AFdkJCmgjTzQpw/2QrXnTkihU?=
 =?us-ascii?Q?lIDg/BDGfYpNmcroDtpsNsEIfCmBN3i748nkK6bsTzdplBa6H/J9gjgn7g8n?=
 =?us-ascii?Q?8XWmERVwXjwPhi+BMU8cKFvAeHCiuraVg+lGlxfMltqq4E1ZYKPznSPFg/rh?=
 =?us-ascii?Q?fy0OTVMFA+XZV12R/6wkHioBEMdGjetZlYm6VND6yoY012HnWlIin8rY5/SL?=
 =?us-ascii?Q?PqDpnxDFULFt5lAppHBQS4Hf6PU6xLF+LWpcyF8wXAdNxX2FOGBPz9x3HE74?=
 =?us-ascii?Q?rNOKrCN3h2cFwCdjntG9WF3hdS9bMlZZbqgMj5XiWhCxBPvj90+VQo87U1zO?=
 =?us-ascii?Q?1sOKfM+ZrLZ3fB70UTlTi58VJvjf//AHWWTWd4+QyFEcqMe1i3aa7afqx4lk?=
 =?us-ascii?Q?QVp/RLuXWHNirJz36xCWbiZqpK3BpekkwzzefECW6Hwp0OGR7PFf7tPO8Lh7?=
 =?us-ascii?Q?hbVPcQPN7I2iZTXBohH79U2V56L1HfKcYfc8UxpVWqLrATxEkTc55XIvSTYD?=
 =?us-ascii?Q?y4bP6PZYKIn28vYzdzVyFnsp6AsI2jUHuOllqfKY92OckxWc0dlBaUb31LNX?=
 =?us-ascii?Q?lZFTdF4BqPbz8rTnWFYBvGLTLPBUuMTaWQRTjUPWfApB4J+RXM/znEMUklMS?=
 =?us-ascii?Q?kdLemhPLnxvnyDM3il7IZt7yOqe+lQ3YGnLjnmGd3O2l0k2Esn9RyAHjYz1D?=
 =?us-ascii?Q?ifTptDNNKIzyjuQ6EVYr4ezbF+RE7XzJ/D/VeyXHROHuBQZMHf3pCkV0mTWf?=
 =?us-ascii?Q?7r/CZCvijf2Hv5FIlCinPtHkPnU18Ku074Yny44ouImRKd7DSQdfZkhOBH+I?=
 =?us-ascii?Q?QoVi+okZya3LIqjNqjQTPTr1mVVaAMfiWSPEsu7vD0xnLw2pSl+vRzziMLFU?=
 =?us-ascii?Q?Nub0Bq/ipzCrkJkKaIEjXGDdwJpu/vpd+LoC3diRrfvHeSe8MEN+Py8ylF0d?=
 =?us-ascii?Q?HJ+HDZgK9xbesyPeO/NMGmtmk0+2XXtypQxIK3uDbly2dKsitlsnLex6Vgib?=
 =?us-ascii?Q?7OQW5QRJe3u6MBb6466B9gm4LdAZ5Ejgl3od91ckX2xr9Z3O+WrENHC6EXhJ?=
 =?us-ascii?Q?BnQU/UP8f9Qf1qqznOidCg9TRbU3OD2YkYuPtyNnghw0fExPDsOjtZC3HwXf?=
 =?us-ascii?Q?/s96TIk8yeKY1ENOFj10G6j1F7qXmHwCcrISwDnQuTvUyFhXZJnS4+9sW++9?=
 =?us-ascii?Q?6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc4e12d-5758-48f0-d304-08dc337e4206
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 08:14:14.6168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrzaeC2V9m5HTZoMlaIPA3Glkm70aYA019n8a8mrGBk5uzSC4PhWVJ/zjU2OyRha9Xn8+jFwoZt1RPk/wJEI5FYeDpammhogxJHRYKT0l6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10386
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

Hi All,

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Thursday, February 22, 2024 1:46 AM
> Subject: linux-next: build failure after merge of the drm-misc tree
>=20
> Hi all,
>=20
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition of
> 'rzg2l_du_vsp_enable'
>    47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
>       |      ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
>                  from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous
> definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc
> *)'
>    72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc=
)
> { };
>       |                    ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition of
> 'rzg2l_du_vsp_disable'
>    61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
>       |      ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous
> definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc
> *)'
>    73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc
> *crtc) { };
>       |                    ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition of
> 'rzg2l_du_vsp_atomic_flush'
>    66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
>       |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous
> definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct
> rzg2l_du_crtc *)'
>    74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc
> *crtc) { };
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition o=
f
> 'rzg2l_du_vsp_get_drm_plane'
>    76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc
> *crtc,
>       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous
> definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane
> *(struct rzg2l_du_crtc *, unsigned int)'
>    75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct
> rzg2l_du_crtc *crtc,
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition o=
f
> 'rzg2l_du_vsp_init'
>   302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_nod=
e
> *np,
>       |     ^~~~~~~~~~~~~~~~~
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous
> definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *,
> struct device_node *, unsigned int)'
>    66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp,
> struct device_node *np,
>       |                   ^~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
>=20
> I have used the drm-misc tree from next-20240221 for today.

I will send an incremental patch to fix this build error with x86 on drm-ne=
xt.

I need to use the macro #if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
in drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h to fix this error.

Cheers,
Biju
