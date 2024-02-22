Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992485F9AC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 14:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A8710E926;
	Thu, 22 Feb 2024 13:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aWMtngO5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2076.outbound.protection.outlook.com [40.107.114.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACC910E926
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:25:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqR257C90NC+eTUvBfC+9vIwnt6juS/n8vR5ubsvNyAuRzCVARdBfeYCgIWd+/qsZ2i7N5LuwUmxqrR1OwK2kMmpE628inFRdAA9Hvq+kWyqjvpADz/qXgjPJCw0nmnjJVWyNIk75SutnGgYAwhltz7+XekrBBRF91yl/lSsOYPNcpdPPSrMjo1uEeUWk1h1fD9pSS7DncgBvCwQGTrp1uLG2g7fltJi6HuLauYhdZloq783cNZjz2Uk6hS6afS5xAS90fjSqP/ZpQDqynn3dGyUmIFmjwQVRFP0vk4QviopOmQZ6bdiFh+9X4X/YdaHWNRy1mzNu5zaXQq8xZTVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoZpIPUTS5Fk0Hc73vKQSLTkD4A4zkGSydTsIPKQxls=;
 b=ntfSL0DJl0mwtOTjONo5ma995I4ljbloXlyRMDC7GiOvqPAQmKy3ni2O2jceHxKXZk4LZ9IlSBvm69ZZ9Qe/LtwO7nYK9Y9BoPSehT3hiYuzj1HsaBcI8wnTT2KcVgmiPAs9Ko1Bh3fcLUjm7gKXCA1lzMqgkPXk64TKuuvrWSMfDT0acRREhxtta+X+jpvPJxc5B544MAo1UkDvYSbf8t2oouFbt8k6F3BVRwkHFYGZv8hkbk3qGnPOQFSsgTxFWXP4AV03IGzq35r6l1eg6rMnuRL6G2b+Zfxzj1ITCarb8+fxPGKtxkZHmmjRstfM2dTZg3L6XhHLKPf8DoC+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoZpIPUTS5Fk0Hc73vKQSLTkD4A4zkGSydTsIPKQxls=;
 b=aWMtngO5bPydx+D491dee9FAoYj1+npgDam7s+qz6AKu3NgMV0qff8pGSi2Rzogao2vuS03gLECxo2k80Lg1a7GNq5LMXMaE4hDkyHgqbVGMerMLVgSzGKjZrNaGQs6YWQbkSNLhFm+bAEjxWE5nKdPyqH2kFIG1LwnxbjVOolA=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by OSYPR01MB5352.jpnprd01.prod.outlook.com
 (2603:1096:604:84::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 13:25:02 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::30fc:68c0:95df:41e9]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::30fc:68c0:95df:41e9%3]) with mapi id 15.20.7292.029; Thu, 22 Feb 2024
 13:25:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>
Subject: RE: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors related
 to rzg2l_du_vsp_*()
Thread-Topic: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors related
 to rzg2l_du_vsp_*()
Thread-Index: AQHaZYII6uWh0xZDm0OCPFO0JlBu47EWWQuAgAAAOVA=
Date: Thu, 22 Feb 2024 13:25:02 +0000
Message-ID: <TYVPR01MB112791662AF3FA77FF547CEE386562@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20240222112643.110326-1-biju.das.jz@bp.renesas.com>
 <76661c31-1b89-4a6a-8dea-376e817de315@suse.de>
In-Reply-To: <76661c31-1b89-4a6a-8dea-376e817de315@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|OSYPR01MB5352:EE_
x-ms-office365-filtering-correlation-id: df195c5d-6ddc-4cd0-27c7-08dc33a9ad08
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E4HQepLWKoj9uQQlWsqKimUAkX08ik2cZFovoWh6kOQcNOstc0QzLh37m+ziOQMIL7GL6KtWsLthx3BNgglw8n/GfqpOnajTKmLb0d9ZnA3T5TLLLJJm4brKzm9uwHJl92K1z0o0fXPwkeJo4tcErB8DOlBDj61B0M9/9anTShBN+Mb5r1pnLq3cbQ08c8qrsOmj46xM11lwIH7sX7bSYgh7iMDKYs9JLx7HWuh2vshioJMaKS02KtCUiuSqa3WefMeVFF8ZD8kdlDj7BtiJzSaKmoUBnJnT+/7d+cTbz+G4X/IRO1wObhgCYYLK5EM4Hi9CtAPU4LWAokQEf0MAw3I7jpsxgJMBPc9GLFD4IV9GNsycGPNhcXKK8Sc3SEFoBIN5AzyMeMJlbTZiZn1XZXG2fpM0rxdxqv4azSywjxPxppsimVBQgy6+MR2j02IaVdoaKjK47KecwllbrWvHA6kkBzFGuvIB34rmSNKXEsSZdZafKdb2zOKnpjk7sH5qSW77qPpkgV4aA5rCY1dwDk4IfrkDTDXn3DbM0ZjZmam5hY7Ndu0HBaCDJ9MTx+XBwF0BCqNMZKdgp3kGeUhZPUvhRRqsIArJ0WlmF+ptjsmFcZ4DvUADQbeFFxvDmwNP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYVPR01MB11279.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7UvFDQwgfKUutty8A/5UIppOXb0YM/G4LB/WN/juauah1p54F9cmtQOLU1Q+?=
 =?us-ascii?Q?4QLx+YygGWNwt1ja4lznrWqRHs22rsMS+OQj72oEbjUxZ34FtiyG1LUtMKrA?=
 =?us-ascii?Q?c/mUJuhmVi0pFesRIDV+XHd5IB3AxLATXeuEccb5C6KhgIPiXqX00YQuGFf0?=
 =?us-ascii?Q?/xV6LtQpfS2gtJZrFq2AubrV2t7tUNlxkDaiel8pyEQ/T18E0lgDyOWhf5c9?=
 =?us-ascii?Q?hBS+j+YF1zdhwXWRozo/Wr+wdZSmbN2troupewVByLYmedwswLpyiPWCx477?=
 =?us-ascii?Q?dUngEaTA+6MfCwyDM6sJVQmMeFb8iSgFbslwZcDWS9SjD9+epSv4YtHlHUIw?=
 =?us-ascii?Q?kgCWGDp73KcrmPpw7Vhd0IU4SzTVCi6eN5JfPAezJsno7bXXC9pwpAim97wb?=
 =?us-ascii?Q?v9xR9WuyORZSUTQnz6jmkWNtfPFgD1a2QIhYombxFTkheacoVhcKvbrPuhqX?=
 =?us-ascii?Q?NKqVA3wFgaS9toRZ7uTRsnY3812uvqbsNFRwM63XAH7VDJv15DZjrf0oC32l?=
 =?us-ascii?Q?UQ3AI/gY5lbyWZgF7SH25OUTzmsiUBIRSOqYlJurzximOnTXSV6QpMjYhzL0?=
 =?us-ascii?Q?PpXJ8sZlbCdFvFAmLS2V0nCLCfiIUvYSeGpiIiaHqcr3BersZoz/ERMKYHci?=
 =?us-ascii?Q?QwZsiVHMmQKq8C6+e4vtHZhQN/vTiHJf7qPk4jlfaMiSxme6kFQvTYlcOkLH?=
 =?us-ascii?Q?fTaPF+iji/4BVgsEvvWDy5DQ0yX/HpDPS8Ic5Fq0U+BdJjJsgsu8JYUTF68C?=
 =?us-ascii?Q?JDuyjHEUUqqfCegddP46WKpJCObvPmEjRM+6aeRjKQA7TNY+BcuHzFkkYNtu?=
 =?us-ascii?Q?1lAtuQQ55cRCdsLDJnkW4UTq/GmJ5qG4KNI+kYg5AHv0CMpEfSq4BLu0G8TN?=
 =?us-ascii?Q?VdMTRhLcFvRJcZwI+qYUjSoEBm/k8uvKGpDcY0OWLizeVrcXHV30WMDOGNvL?=
 =?us-ascii?Q?fvepAhSx08I+A/AflOOSQ5gfw+uHv2ju+cwPdisjpy/SMOo9hl4ozfslbfS7?=
 =?us-ascii?Q?vGEFcERpTJ77lwRv2usBmNONuy435zie0Xg0+amo3/eGWn8XEk1Ri0pKHbC/?=
 =?us-ascii?Q?79M03LM5sBuLKvTj6F1x6vA8IbT1P2i0Oc1PiBIePc/nX0Casrv7nMEZom2l?=
 =?us-ascii?Q?P4CLdscBPgPAi7e75Q9dhgZ/e7XrISfWNVaSHXekwlQnD9wQEM1j18LyHZOb?=
 =?us-ascii?Q?ihLCVmSKDg2CB8Hps2/p1w6NzIFfQS+bKKTH54Lw7B1vaVeZsGRAFru5EJhw?=
 =?us-ascii?Q?Z7cUiCfIpmjafS8m9m7XHLSIUJbUxnpuWCAwskWSFfapNM2nkJ11SIZuhp4C?=
 =?us-ascii?Q?T60uDZF/RqztnSMX9If70s3xcKxkk2Ub4hPr7d+jLBOgl/hEdl2Ynf4Kpvks?=
 =?us-ascii?Q?m41/cWeF5AvC+Y9dtSdj994COnIOCEIwBz+6nmHXS1hRRrKF5mKy8fcA+Vjd?=
 =?us-ascii?Q?9f9TMmpxWN++bAUQg0OyDMRNK9IYZ5o9vvqtOKpxZPWV2/EYRZaM9uYDc1Ot?=
 =?us-ascii?Q?MboaT653DZQuJxMBeX2nq7KW4FF2mZy4MQoANhpU7T4I6plWmz/NW0aFUyYD?=
 =?us-ascii?Q?8z6I5LJu0CDajz+dvsqRmKFTKB4rR89ofxFA18XbtISKRYcec8NiMRNM2xwq?=
 =?us-ascii?Q?ag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df195c5d-6ddc-4cd0-27c7-08dc33a9ad08
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 13:25:02.5111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aVeHH7DCLQImY4RETyXr/CWH8ZaUZklPYLKmpMRGYB16NqudTRZWGsExfBZvlL82T/LsLyg6B38vC7URmC2+HY7wfwOMmmaaDUpzDgePeQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5352
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

Hi Thomas Zimmermann,

> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: Thursday, February 22, 2024 1:21 PM
> Subject: Re: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors
> related to rzg2l_du_vsp_*()
>=20
> Hi
>=20
> Am 22.02.24 um 12:26 schrieb Biju Das:
> > CONFIG_DRM_RCAR_VSP is related to R-Car and not related to RZ/G2L
> > specific. This caused the below build issue. Fix this errors by
> > replacing CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1. While at it,
> > use
> > IS_ENABLED() macro.
> >
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition
> of 'rzg2l_du_vsp_enable'
> >     47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
> >        |      ^~~~~~~~~~~~~~~~~~~
> > In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
> >                   from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous
> definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc
> *)'
> >     72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc
> *crtc) { };
> >        |                    ^~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition
> of 'rzg2l_du_vsp_disable'
> >     61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
> >        |      ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous
> definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc
> *)'
> >     73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc
> *crtc) { };
> >        |                    ^~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition
> of 'rzg2l_du_vsp_atomic_flush'
> >     66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
> >        |      ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous
> definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct
> rzg2l_du_crtc *)'
> >     74 | static inline void rzg2l_du_vsp_atomic_flush(struct
> rzg2l_du_crtc *crtc) { };
> >        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition
> of 'rzg2l_du_vsp_get_drm_plane'
> >     76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct
> rzg2l_du_crtc *crtc,
> >        |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous
> definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane
> *(struct rzg2l_du_crtc *, unsigned int)'
> >     75 | static inline struct drm_plane
> *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
> >        |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition
> of 'rzg2l_du_vsp_init'
> >    302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct
> device_node *np,
> >        |     ^~~~~~~~~~~~~~~~~
> > drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous
> definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *,
> struct device_node *, unsigned int)'
> >     66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp,
> struct device_node *np,
> >        |                   ^~~~~~~~~~~~~~~~~
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes:
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I'm going to add
>=20
> Fixes: 768e9e61b3b9 ("drm: renesas: Add RZ/G2L DU Support")
>=20
> as well before merging the patch.

OK to me. I thought since it is landing on next, fixes tag is not
required. Fixes tag is required only when the patch is in a -rc series.

Maybe I am wrong here??

Cheers,
Biju

>=20
> Best regards
> Thomas
>=20
> > ---
> > v1->v2:
> >   * Dropped EXPORT symbol as both *_crtc.o and *_vsp.o are within the
> single module.
> >   * Updated the commit description.
> > ---
> >   drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > index 12d98f04bf89..322eb80dcbaf 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
> > @@ -54,7 +54,7 @@ to_rzg2l_vsp_plane_state(struct drm_plane_state
> *state)
> >   	return container_of(state, struct rzg2l_du_vsp_plane_state, state);
> >   }
> >
> > -#ifdef CONFIG_DRM_RCAR_VSP
> > +#if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
> >   int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node
> *np,
> >   		      unsigned int crtcs);
> >   void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman HRB 36809
> (AG Nuernberg)

