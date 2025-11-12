Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0000FC50DE7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 08:11:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFA510E6AC;
	Wed, 12 Nov 2025 07:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="f4vbFE/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3438C10E682
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 03:03:18 +0000 (UTC)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251112030316epoutp011fb5f93561256e681b231f59d1613528~3I03IQ8q01194811948epoutp01I
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 03:03:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251112030316epoutp011fb5f93561256e681b231f59d1613528~3I03IQ8q01194811948epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1762916596;
 bh=wZWws+fIBp+8PUP6tmrutIa0sWhFQjnrwwm6369ndT4=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=f4vbFE/fEybqSTzTEG/CwpBGc8s78tHf/tyiCXT8RV932R+byWDmew2gIFUJmPuFV
 s+7FkhnZSRewt/qK15fjDgaWZEN2Ox5It922ujCiDwmAhOCFUBKlxoNQXNnkLs8U8t
 IdrwAaLTxOLNmU8tKsEED8ynMv3IFn/hGhzFCZjE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
 20251112030315epcas2p1982cfce34da8bf2aca9203fdfbe5dbbc~3I02yJO4E2083120831epcas2p1Q;
 Wed, 12 Nov 2025 03:03:15 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.203]) by
 epsnrtp03.localdomain (Postfix) with ESMTP id 4d5pBC2vPKz3hhTC; Wed, 12 Nov
 2025 03:03:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
 20251112030314epcas2p1310eb02cf25788eafc5165541ed77063~3I017jHwb2083120831epcas2p1J;
 Wed, 12 Nov 2025 03:03:14 +0000 (GMT)
Received: from KORCO180968 (unknown [12.80.207.170]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20251112030314epsmtip2252084f69954c4044b7444d64956a445~3I011vSbr0649406494epsmtip2E;
 Wed, 12 Nov 2025 03:03:14 +0000 (GMT)
From: <hy_fifty.lee@samsung.com>
To: "'Inki Dae'" <daeinki@gmail.com>
Cc: "'Seung-Woo Kim'" <sw0312.kim@samsung.com>, "'Kyungmin Park'"
 <kyungmin.park@samsung.com>, "'David Airlie'" <airlied@gmail.com>, "'Simona
 Vetter'" <simona@ffwll.ch>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
 "'Alim	Akhtar'" <alim.akhtar@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com>
Subject: RE: [PATCH 2/3] drm/exynos: Convert to drmm_mode_config_init() and
 drop manual cleanup
Date: Wed, 12 Nov 2025 12:03:14 +0900
Message-ID: <000101dc5380$e33e1c10$a9ba5430$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQISjSe4EPKM2z52xGofwApISJwl9QDk05gtAfIIk1QBrzY+fbRa/MNw
Content-Language: ko
X-CMS-MailID: 20251112030314epcas2p1310eb02cf25788eafc5165541ed77063
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7
References: <CGME20250929042917epcas2p2569e213500997dfa6ba43c8f361f50f7@epcas2p2.samsung.com>
 <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
 <20250929043110.3631025-3-hy_fifty.lee@samsung.com>
 <CAAQKjZNCpK4rq6DFUtiQ2rxCeb_34Mp54quVto+9LRJMH3=ZhQ@mail.gmail.com>
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
> Sent: Monday, November 10, 2025 2:22 PM
> To: Hoyoung Lee <hy_fifty.lee=40samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim=40samsung.com>; Kyungmin Park
> <kyungmin.park=40samsung.com>; David Airlie <airlied=40gmail.com>; Simona
> Vetter <simona=40ffwll.ch>; Krzysztof Kozlowski <krzk=40kernel.org>; Alim
> Akhtar <alim.akhtar=40samsung.com>; dri-devel=40lists.freedesktop.org; li=
nux-
> arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kernel.org; li=
nux-
> kernel=40vger.kernel.org
> Subject: Re: =5BPATCH 2/3=5D drm/exynos: Convert to drmm_mode_config_init=
()
> and drop manual cleanup
>=20
> 2025=EB=85=84=209=EC=9B=94=2029=EC=9D=BC=20(=EC=9B=94)=20=EC=98=A4=ED=9B=
=84=201:54,=20Hoyoung=20Lee=20<hy_fifty.lee=40samsung.com>=EB=8B=98=EC=9D=
=B4=20=EC=9E=91=0D=0A>=20=EC=84=B1:=0D=0A>=20>=0D=0A>=20>=20Switch=20mode-c=
onfig=20initialization=20to=20drmm_mode_config_init()=20so=20that=0D=0A>=20=
>=20the=20lifetime=20is=20tied=20to=20drm_device.=20Remove=20explicit=0D=0A=
>=20>=20drm_mode_config_cleanup()=20from=20error=20and=20unbind=20paths=20s=
ince=20cleanup=20is=0D=0A>=20now=20managed=20by=20DRM.=0D=0A>=20>=0D=0A>=20=
>=20No=20functional=20change=20intended.=0D=0A>=20>=0D=0A>=20>=20Signed-off=
-by:=20Hoyoung=20Lee=20<hy_fifty.lee=40samsung.com>=0D=0A>=20>=20---=0D=0A>=
=20>=20=20drivers/gpu/drm/exynos/exynos_drm_drv.c=20=7C=204=20+---=0D=0A>=
=20>=20=201=20file=20changed,=201=20insertion(+),=203=20deletions(-)=0D=0A>=
=20>=0D=0A>=20>=20diff=20--git=20a/drivers/gpu/drm/exynos/exynos_drm_drv.c=
=0D=0A>=20>=20b/drivers/gpu/drm/exynos/exynos_drm_drv.c=0D=0A>=20>=20index=
=206cc7bf77bcac..1aea71778ab1=20100644=0D=0A>=20>=20---=20a/drivers/gpu/drm=
/exynos/exynos_drm_drv.c=0D=0A>=20>=20+++=20b/drivers/gpu/drm/exynos/exynos=
_drm_drv.c=0D=0A>=20>=20=40=40=20-257,7=20+257,7=20=40=40=20static=20int=20=
exynos_drm_bind(struct=20device=20*dev)=0D=0A>=20>=20=20=20=20=20=20=20=20=
=20dev_set_drvdata(dev,=20drm);=0D=0A>=20>=20=20=20=20=20=20=20=20=20drm->d=
ev_private=20=3D=20(void=20*)private;=0D=0A>=20>=0D=0A>=20>=20-=20=20=20=20=
=20=20=20drm_mode_config_init(drm);=0D=0A>=20>=20+=20=20=20=20=20=20=20drmm=
_mode_config_init(drm);=0D=0A>=20>=0D=0A>=20>=20=20=20=20=20=20=20=20=20exy=
nos_drm_mode_config_init(drm);=0D=0A>=20>=0D=0A>=20>=20=40=40=20-297,7=20+2=
97,6=20=40=40=20static=20int=20exynos_drm_bind(struct=20device=20*dev)=0D=
=0A>=20>=20=20err_unbind_all:=0D=0A>=20>=20=20=20=20=20=20=20=20=20componen=
t_unbind_all(drm->dev,=20drm);=0D=0A>=20>=20=20err_mode_config_cleanup:=0D=
=0A>=20>=20-=20=20=20=20=20=20=20drm_mode_config_cleanup(drm);=0D=0A>=20=0D=
=0A>=20In=20the=20current=20implementation,=20there=20is=20a=20potential=20=
dereference=20issue=0D=0A>=20because=20the=20private=20object=20may=20be=20=
freed=20before=20to_dma_dev(dev)=20is=20called.=0D=0A>=20When=20drmm_mode_c=
onfig_init()=20is=20invoked,=20it=20registers=0D=0A>=20drm_mode_config_clea=
nup()=20as=20a=20managed=20action.=20This=20means=20that=20the=20cleanup=0D=
=0A>=20function=20will=20be=20automatically=20executed=20later=20when=0D=0A=
>=20drm_dev_put()=20is=20called.=0D=0A>=20=0D=0A>=20The=20problem=20arises=
=20when=20drm_dev_put()=20is=20called=20without=20explicitly=0D=0A>=20invok=
ing=20drm_mode_config_cleanup()=20first,=20as=20in=20the=20original=20code.=
=20In=20that=0D=0A>=20case,=20the=20managed=20cleanup=20is=20performed=20la=
ter,=20which=20allows=0D=0A>=20to_dma_dev(dev)=20to=20be=20called=20after=
=20the=20private=20object=20has=20already=20been=0D=0A>=20released.=0D=0A>=
=20=0D=0A>=20For=20reference,=20the=20following=20sequence=20may=20occur=20=
internally=20when=0D=0A>=20drm_mode_config_cleanup()=20is=20executed:=0D=0A=
>=201.=20drm_mode_config_cleanup()=20is=20called.=0D=0A>=202.=20During=20th=
e=20cleanup=20of=20FBs,=20planes,=20CRTCs,=20encoders,=20and=20connectors,=
=0D=0A>=20framebuffers=20or=20GEM=20objects=20may=20be=20released.=0D=0A>=
=203.=20At=20this=20point,=20Exynos-specific=20code=20could=20invoke=20to_d=
ma_dev(dev).=0D=0A>=20=0D=0A>=20Therefore,=20the=20private=20object=20must=
=20remain=20valid=20until=0D=0A>=20drm_mode_config_cleanup()=20completes.=
=0D=0A>=20It=20would=20be=20safer=20to=20adjust=20the=20code=20so=20that=20=
kfree(private)=20is=20performed=0D=0A>=20after=20drm_dev_put(drm)=20to=20en=
sure=20the=20private=20data=20remains=20available=20during=0D=0A>=20cleanup=
.=0D=0A>=20=0D=0A>=20Thanks,=0D=0A>=20Inki=20Dae=0D=0A>=20=0D=0A>=20>=20=20=
=20=20=20=20=20=20=20exynos_drm_cleanup_dma(drm);=0D=0A>=20>=20=20=20=20=20=
=20=20=20=20kfree(private);=0D=0A>=20>=20=20=20=20=20=20=20=20=20dev_set_dr=
vdata(dev,=20NULL);=0D=0A>=20>=20=40=40=20-317,7=20+316,6=20=40=40=20static=
=20void=20exynos_drm_unbind(struct=20device=20*dev)=0D=0A>=20>=20=20=20=20=
=20=20=20=20=20drm_atomic_helper_shutdown(drm);=0D=0A>=20>=0D=0A>=20>=20=20=
=20=20=20=20=20=20=20component_unbind_all(drm->dev,=20drm);=0D=0A>=20>=20-=
=20=20=20=20=20=20=20drm_mode_config_cleanup(drm);=0D=0A>=20=0D=0A>=20Ditto=
.=0D=0A>=20=0D=0A>=20>=20=20=20=20=20=20=20=20=20exynos_drm_cleanup_dma(drm=
);=0D=0A>=20>=0D=0A>=20>=20=20=20=20=20=20=20=20=20kfree(drm->dev_private);=
=0D=0A>=20>=20--=0D=0A>=20>=202.34.1=0D=0A>=20>=0D=0A>=20>=0D=0A=0D=0AHi,=
=20Inki=0D=0AThanks=20for=20the=20review=20and=20for=20pointing=20out=20the=
=20to_dma_dev()=20path=0D=0A=0D=0AIf=20I=20understand=20you=20correctly,=20=
fine=20with=20using=20DRMM,=20but=20kfree(priv)=20should=20occur=20after=20=
drm_dev_put(drm)=0D=0AThat=20would=20mean=20releasing=20the=20drm_device=20=
first=20and=20freeing=20dev_private=20afterwards.=0D=0AOf=20course,=20we=20=
will=20also=20need=20to=20adjust=20the=20probe()=20error-unwind=20(err_free=
)=20order=20accordingly.=0D=0ADo=20you=20anticipate=20any=20side=20effects=
=20from=20this=20ordering=20change?=20I=E2=80=99d=20appreciate=20your=20tho=
ughts.=0D=0A=0D=0ABRs,=0D=0AHoyoung=20Lee=0D=0A=0D=0A
