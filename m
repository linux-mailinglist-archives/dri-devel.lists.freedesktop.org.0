Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B245959549
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 09:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6D910E5A0;
	Wed, 21 Aug 2024 07:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="fzD0JyTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2FC10E366
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1724186540; x=1724445740;
 bh=8XGUYMGE1OFUymXrkgfLYCdVIVigLdfqa86an2wYvDU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=fzD0JyTnDwHZgwT1ljsi7cob08ou3MNybOYEorWDsGhFvtSQYHc4SydOvBPab2UWo
 v+bUSDUGuumR4DyaAmVuXDbRZKCyOVc++jvwdyU5xlbrixWIpFbJMHZQSqEsCm3f2Y
 EU1S9pWsmHAwFExUirWMs4Kzr+7WcAwMn/b1Q6ZFilB7v9SLk303KC5z4imjz3etUS
 J12fK9Y6Fe0eyBKedI69Wy35IXQNrFG1CJ2g0GsgAFDPOWI+acSLzsKu8cRdH90a4G
 /2w8vzM/bLqdiNuXoqX+KX2qNKyIChsLg6p8MNS7JD4W2XAO+mZ41xd7OxXpUntIRz
 XuocDGIoEbzeQ==
Date: Tue, 20 Aug 2024 20:42:15 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniel@fooishbar.org>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>
Subject: Re:[PATCH v4] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <acvk_AR9o8iB8dRnYZrKp6ylhzAjl5oZyE6oBIKWQttckNesM1-5k9b71jDIRhoYRwx75xe-6_mM8a0p4e15NMapX1GjdDLqPPoKZDN8U1A=@proton.me>
In-Reply-To: <22e2b803.cd8.1916d581b67.Coremail.andyshrk@163.com>
References: <20240815124306.189282-2-pZ010001011111@proton.me>
 <22e2b803.cd8.1916d581b67.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 7fe11dad4a52c85e539c6e124e57470cd51a72e2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 21 Aug 2024 07:04:47 +0000
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



On Tuesday, August 20th, 2024 at 3:12 AM, Andy Yan <andyshrk@163.com> wrote=
:

>=20
> Hi Piotr=EF=BC=8C

Hi Andy!

> > +static int vop2_crtc_atomic_check_gamma(struct vop2_video_port *vp,
> > + struct drm_crtc *crtc,
> > + struct drm_atomic_state *state,
> > + struct drm_crtc_state *crtc_state)
> > +{
> > + struct vop2 *vop2 =3D vp->vop2;
> > + unsigned int len;
> > +
> > + if (!vp->vop2->lut_regs || !crtc_state->color_mgmt_changed ||
> > + !crtc_state->gamma_lut)
> > + return 0;
> > +
> > + len =3D drm_color_lut_size(crtc_state->gamma_lut);
> > + if (len !=3D crtc->gamma_size) {
> > + DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> > + len, crtc->gamma_size);
> > + return -EINVAL;
> > + }
> > +
> > + // trigger full modeset only when SoC is 356x
> > + if (!crtc_state->mode_changed && (vop2->data->soc_id =3D=3D 3566 ||
> > + vop2->data->soc_id =3D=3D 3568)) {
> > + int ret;
> > +
> > + crtc_state->mode_changed =3D true;
> > + state->allow_modeset =3D true;
>=20
>=20
>=20
>=20
> We don't need to trigger a modeset here. We just need to disable dsp_lut =
befor we write gamma lut data for rk3566/8.

Formerly my patch didn't trigger a modeset. Though Daniel Stone in his=20
reply to v3[1] suggested it as the clean way to handle RK356x case[2],=20
quote, "it would probably be better to set mode_changed when the colour=20
management configuration changes". Let's wait for his reply to this=20
version of the patch, perhaps he meant something different or not exactly=
=20
what I did.

[1] https://lore.kernel.org/linux-rockchip/CAPj87rOM=3Dj0zmuWL9frGKV1xzPbJr=
k=3DQ9ip7F_HAPYnbCqPouw@mail.gmail.com/
[2] https://lore.kernel.org/linux-rockchip/TkgKVivuaLFLILPY-n3iZo_8KF-daKdq=
du-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=
=3D@proton.me/

Best Regards, Piotr Zalewski

