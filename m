Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8074CC50DEA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5656410E6AD;
	Wed, 12 Nov 2025 07:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="LRSaTTSR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 521 seconds by postgrey-1.36 at gabe;
 Wed, 12 Nov 2025 02:53:11 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7C510E174
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:53:11 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20251112024427epoutp02d79d938c592a450148fe99d348c520fb~3IkcT_R3c2645726457epoutp02V
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 02:44:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20251112024427epoutp02d79d938c592a450148fe99d348c520fb~3IkcT_R3c2645726457epoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762915467;
 bh=yOWODANQDIHMfLu0rwnPfEXOOr2ZhK5K8qrgiyRk9cg=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=LRSaTTSRrmj6wG8naMR2N/py93mKLQp4hlsnLNeqSxmLzihpzMWPRjV5XpZ81AzdO
 sYWjgNMT17IiEQ1+sY+ANhz26ZlgOzDcNLGudEMdp4GQrqBL90w2v5O8aqsJOkrtiS
 89fnjjKaJ+YO0CLIKLq4F4OTRcYs7C4P0dMYbWLk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
 20251112024427epcas2p170cb0b4b978d81daff8bc7c88295d370~3IkcB9zdH1160111601epcas2p1q;
 Wed, 12 Nov 2025 02:44:27 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4d5nmW0sB7z3hhT7; Wed, 12 Nov
 2025 02:44:27 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20251112024426epcas2p2aca7746bef270abaec0ae578405f48a7~3IkbGjLlV2914629146epcas2p2Q;
 Wed, 12 Nov 2025 02:44:26 +0000 (GMT)
Received: from KORCO180968 (unknown [12.80.207.170]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20251112024426epsmtip1b3344ef6680e6abf662312475b3240e3~3IkbBjKhd2474724747epsmtip1j;
 Wed, 12 Nov 2025 02:44:26 +0000 (GMT)
From: <hy_fifty.lee@samsung.com>
To: "'Inki Dae'" <daeinki@gmail.com>
Cc: "'Seung-Woo Kim'" <sw0312.kim@samsung.com>, "'Kyungmin Park'"
 <kyungmin.park@samsung.com>, "'David Airlie'" <airlied@gmail.com>, "'Simona
 Vetter'" <simona@ffwll.ch>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
 "'Alim	Akhtar'" <alim.akhtar@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com>
Subject: RE: [PATCH 1/3] drm/exynos: plane: Disable fully off-screen planes
 instead of zero-sized update
Date: Wed, 12 Nov 2025 11:44:26 +0900
Message-ID: <000001dc537e$42b8bc20$c82a3460$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKrEiEoxOdjyVP8b+iXtap5zLOX/ADk05gtAXiteQICvjd5q7MlRQUg
Content-Language: ko
X-CMS-MailID: 20251112024426epcas2p2aca7746bef270abaec0ae578405f48a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4
References: <CGME20250929042917epcas2p4c8f375cc2355b3a48141cdddb04a01c4@epcas2p4.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-2-hy_fifty.lee@samsung.com>
 <CAAQKjZM3qgQO=FaAuc4d1aUT1fCT6Vfo0X7Y7B=NwRNM=B34wA@mail.gmail.com>
X-Mailman-Approved-At: Wed, 12 Nov 2025 07:11:22 +0000
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

> -----Original Message-----
> From: Inki Dae <daeinki=40gmail.com>
> Sent: Monday, November 10, 2025 11:24 AM
> To: Hoyoung Lee <hy_fifty.lee=40samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim=40samsung.com>; Kyungmin Park
> <kyungmin.park=40samsung.com>; David Airlie <airlied=40gmail.com>; Simona
> Vetter <simona=40ffwll.ch>; Krzysztof Kozlowski <krzk=40kernel.org>; Alim
> Akhtar <alim.akhtar=40samsung.com>; dri-devel=40lists.freedesktop.org; li=
nux-
> arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; li=
nux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 1/3=5D drm/exynos: plane: Disable fully off-screen
> planes instead of zero-sized update
>=20
> Thanks for contribution,
>=20
> 2025=EB=85=84=209=EC=9B=94=2029=EC=9D=BC=20(=EC=9B=94)=20=EC=98=A4=ED=9B=
=84=201:29,=20Hoyoung=20Lee=20<hy_fifty.lee=40samsung.com>=EB=8B=98=EC=9D=
=B4=20=EC=9E=91=0D=0A>=20=EC=84=B1:=0D=0A>=20>=0D=0A>=20>=20Some=20configur=
ations=20require=20additional=20actions=20when=20all=20windows=20are=0D=0A>=
=20>=20disabled=20to=20keep=20DECON=20operating=20correctly.=20Programming=
=20a=20zero-sized=0D=0A>=20>=20window=20in=20->atomic_update()=20leaves=20t=
he=20plane=20logically=20enabled=20and=20can=0D=0A>=20>=20bypass=20those=20=
disable=20semantics.=0D=0A>=20>=0D=0A>=20>=20Treat=20a=20fully=20off-screen=
=20plane=20as=20not=20visible=20and=20take=20the=20explicit=0D=0A>=20>=20di=
sable=20path.=0D=0A>=20>=0D=0A>=20>=20Implementation=20details:=0D=0A>=20>=
=20-=20exynos_plane_mode_set():=20if=20computed=20actual_w/actual_h=20is=20=
zero,=20mark=0D=0A>=20>=20=20=20state->visible=20=3D=20false=20and=20return=
=20early.=0D=0A>=20>=20-=20exynos_plane_atomic_check():=20if=20=21visible,=
=20skip=20further=20checks=20and=0D=0A>=20>=20=20=20return=200.=0D=0A>=20>=
=20-=20exynos_plane_atomic_update():=20if=20=21visible,=20call=20->disable_=
plane();=0D=0A>=20>=20=20=20otherwise=20call=20->update_plane().=0D=0A>=20>=
=0D=0A>=20>=20No=20functional=20change=20for=20visible=20planes;=20off-scre=
en=20planes=20are=20now=0D=0A>=20>=20cleanly=20disabled,=20ensuring=20the=
=20disable=20hooks=20run=20consistently.=0D=0A>=20>=0D=0A>=20>=20Signed-off=
-by:=20Hoyoung=20Lee=20<hy_fifty.lee=40samsung.com>=0D=0A>=20>=20---=0D=0A>=
=20>=20=20drivers/gpu/drm/exynos/exynos_drm_plane.c=20=7C=2012=20++++++++++=
+-=0D=0A>=20>=20=201=20file=20changed,=2011=20insertions(+),=201=20deletion=
(-)=0D=0A>=20>=0D=0A>=20>=20diff=20--git=20a/drivers/gpu/drm/exynos/exynos_=
drm_plane.c=0D=0A>=20>=20b/drivers/gpu/drm/exynos/exynos_drm_plane.c=0D=0A>=
=20>=20index=207c3aa77186d3..842974154d79=20100644=0D=0A>=20>=20---=20a/dri=
vers/gpu/drm/exynos/exynos_drm_plane.c=0D=0A>=20>=20+++=20b/drivers/gpu/drm=
/exynos/exynos_drm_plane.c=0D=0A>=20>=20=40=40=20-91,6=20+91,11=20=40=40=20=
static=20void=20exynos_plane_mode_set(struct=0D=0A>=20exynos_drm_plane_stat=
e=20*exynos_state)=0D=0A>=20>=20=20=20=20=20=20=20=20=20actual_w=20=3D=20ex=
ynos_plane_get_size(crtc_x,=20crtc_w,=20mode->hdisplay);=0D=0A>=20>=20=20=
=20=20=20=20=20=20=20actual_h=20=3D=20exynos_plane_get_size(crtc_y,=20crtc_=
h,=0D=0A>=20>=20mode->vdisplay);=0D=0A>=20>=0D=0A>=20>=20+=20=20=20=20=20=
=20=20if=20(=21actual_w=20=7C=7C=20=21actual_h)=20=7B=0D=0A>=20>=20+=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20state->visible=20=3D=20false;=0D=0A>=
=20=0D=0A>=20The=20state->visible=20field=20in=20the=20DRM=20atomic=20frame=
work=20is=20set=20to=20true=20only=0D=0A>=20when=20the=20following=20condit=
ions=20are=20met:=0D=0A>=20-=20Both=20state->crtc=20and=20state->fb=20are=
=20present=20(having=20only=20one=20of=20them=0D=0A>=20results=20in=20an=20=
error).=0D=0A>=20-=20src_w/src_h=20and=20crtc_w/crtc_h=20are=20non-zero.=0D=
=0A>=20-=20The=20source=20rectangle=20does=20not=20exceed=20the=20framebuff=
er=20bounds=20(e.g.,=20src_x=0D=0A>=20+=20src_w=20<=3D=20fb->width).=0D=0A>=
=20-=20Rotation=20and=20clipping=20checks=20pass=20successfully.=0D=0A>=20=
=0D=0A>=20However,=20this=20patch=20modifies=20the=20state->visible=20value=
=20within=20vendor-=0D=0A>=20specific=20code.=20Doing=20so=20can=20be=20pro=
blematic=20because=20it=20overrides=20a=20field=0D=0A>=20that=20is=20manage=
d=20by=20the=20DRM=20atomic=20framework.=20Even=20if=20it=20currently=20wor=
ks,=0D=0A>=20it=20may=20lead=20to=20unexpected=20behavior=20in=20the=20futu=
re.=0D=0A>=20=0D=0A>=20For=20example,=20if=20the=20DRM=20atomic=20framework=
=20sets=20visible=20=3D=20true=20after=0D=0A>=20validating=20the=20above=20=
conditions=20and=20begins=20processing=20certain=20logic,=20but=0D=0A>=20th=
e=20vendor=20driver=20later=20changes=20it=20to=20false,=20the=20framework=
=20may=20still=0D=0A>=20assume=20the=20variable=20remains=20true,=20resulti=
ng=20in=20inconsistent=20states.=0D=0A>=20=0D=0A>=20Turning=20off=20a=20pla=
ne=20when=20it=20doesn=E2=80=99t=20need=20to=20be=20displayed=20is=20a=20go=
od=20idea=20I=0D=0A>=20think.=20You=20might=20consider=20contributing=20thi=
s=20behavior=20upstream=20so=20it=20can=20be=0D=0A>=20properly=20handled=20=
within=20the=20DRM=20atomic=20framework=20itself.=0D=0A>=20=0D=0A>=20Thanks=
,=0D=0A>=20Inki=20Dae=0D=0A>=20=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20return;=0D=0A>=20>=20+=20=20=20=20=20=20=20=7D=0D=0A>=20>=
=20+=0D=0A>=20>=20=20=20=20=20=20=20=20=20if=20(crtc_x=20<=200)=20=7B=0D=0A=
>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20if=20(actual_w)=0D=
=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20src_x=20+=3D=20((-crtc_x)=20*=20exynos_state->h_ratio)=0D=0A>=20>=
=20>>=2016;=20=40=40=20-244,6=20+249,9=20=40=40=20static=20int=20exynos_pla=
ne_atomic_check(struct=0D=0A>=20drm_plane=20*plane,=0D=0A>=20>=20=20=20=20=
=20=20=20=20=20/*=20translate=20state=20into=20exynos_state=20*/=0D=0A>=20>=
=20=20=20=20=20=20=20=20=20exynos_plane_mode_set(exynos_state);=0D=0A>=20>=
=0D=0A>=20>=20+=20=20=20=20=20=20=20if=20(=21new_plane_state->visible)=0D=
=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20return=200;=0D=0A>=
=20>=20+=0D=0A>=20>=20=20=20=20=20=20=20=20=20ret=20=3D=20exynos_drm_plane_=
check_format(exynos_plane->config,=0D=0A>=20exynos_state);=0D=0A>=20>=20=20=
=20=20=20=20=20=20=20if=20(ret)=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20return=20ret;=0D=0A>=20>=20=40=40=20-263,8=20+271,10=20=
=40=40=20static=20void=20exynos_plane_atomic_update(struct=0D=0A>=20drm_pla=
ne=20*plane,=0D=0A>=20>=20=20=20=20=20=20=20=20=20if=20(=21new_state->crtc)=
=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20return;=0D=0A=
>=20>=0D=0A>=20>=20-=20=20=20=20=20=20=20if=20(exynos_crtc->ops->update_pla=
ne)=0D=0A>=20>=20+=20=20=20=20=20=20=20if=20(new_state->visible=20&&=20exyn=
os_crtc->ops->update_plane)=0D=0A>=20>=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20exynos_crtc->ops->update_plane(exynos_crtc,=0D=0A>=20>=20exy=
nos_plane);=0D=0A>=20>=20+=20=20=20=20=20=20=20else=20if=20(exynos_crtc->op=
s->disable_plane)=0D=0A>=20>=20+=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20exynos_crtc->ops->disable_plane(exynos_crtc,=0D=0A>=20>=20+=20exynos_pla=
ne);=0D=0A>=20>=20=20=7D=0D=0A>=20>=0D=0A>=20>=20=20static=20void=20exynos_=
plane_atomic_disable(struct=20drm_plane=20*plane,=0D=0A>=20>=20--=0D=0A>=20=
>=202.34.1=0D=0A>=20>=0D=0A>=20>=0D=0A=0D=0AHi=20Inki,=0D=0AThanks=20for=20=
the=20review.=0D=0A=0D=0AI=20agree=20that=20mutating=20state->visible=20val=
ue=20in=20vendor=20code=20is=20risky.=0D=0ARather=20than=20touching=20the=
=20DRM=20atomic=20framework=20or=20that=20field,=20how=20about=20we=20add=
=20a=20driver-private=20flag=20in=20Exynos(e.g.=20exynos_drm_plane_state->v=
isible)=20and=20use=20that=20instead?=0D=0AIf=20this=20approach=20sounds=20=
reasonable=20to=20you,=20I=E2=80=99ll=20spin=20a=20v2=20along=20these=20lin=
es.=0D=0A=0D=0ABRs,=0D=0AHoyoung=20Lee=0D=0A=0D=0A=0D=0A
