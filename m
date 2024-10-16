Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B689A055A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3114410E6DB;
	Wed, 16 Oct 2024 09:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="BkQ5/39T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCC310E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=ekwlenqgozbevlhzioimqt252m.protonmail; t=1729070611; x=1729329811;
 bh=qIx8iugOIUWLMHfINQK2rHyqZiPqD+qIYHJtrMpJ0AY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=BkQ5/39Tv+FZxVf8VlKSrWEl6fBQyFVYozY/gfIMWYYSwtNeJ6ykroT33nTXBGi/S
 NazhFU1StdZo3ibic2l2OSF7pmvMH2gN0HTVhFi0wctl0QY19Z6baD4MDNvy2nbZnn
 tp0u17XAr+wwLT62n8zzDSMMYzSF9LbNu9BJUgpds77t04fqj633Pc/yeUOvkUeVRp
 4HBWbbPOJW9QlN7u9g/Uxt6YPX+7PYBv1b3fcPWGzeSNIHs33IgxdSXt6FiAULo2jc
 5hV3B6pkQ4Dp4KwryrTJm5gxq/RyrXQEtvGtLEejtYXQGA0gQjeMMHKr0b286BLNZN
 6dBvj3BcVlvYQ==
Date: Wed, 16 Oct 2024 09:23:27 +0000
To: Andy Yan <andyshrk@163.com>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 Daniel Stone <daniel@fooishbar.org>, Dragan Simic <dsimic@manjaro.org>,
 Diederik de Haas <didi.debian@cknow.org>
Subject: Re:[PATCH v5] rockchip/drm: vop2: add support for gamma LUT
Message-ID: <bDA4Uh6mp04Po1miJIueRsMNZ9W09DHEnRjG4CzWBn243gI_ExYhjwC9j-KMgOvUS5ofKsAa926IGfVGz4fNt9P_kOBpTyIOakgbB9Sqc-4=@proton.me>
In-Reply-To: <13fc0084.1321.19292eec34e.Coremail.andyshrk@163.com>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <13fc0084.1321.19292eec34e.Coremail.andyshrk@163.com>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 74bd86e8529d5379f9ae4a2020a10169c9e66dec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Andy,=20

> >=20
> > static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> > @@ -2790,7 +2945,13 @@ static int vop2_create_crtcs(struct vop2 *vop2)
> > }
> >=20
> > drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> > + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
>=20
>=20
>=20
> There is no need to check vp->crtc.dev here, set has been set in drm_crtc=
_init_with_planes .

I tested it and this check must be here because trying to enable color mgmt=
=20
on CRTC with no associated device, causes null ptr dereference later on in=
=20
drm_crtc_enable_color_mgmt (unless something changed in recent kernel=20
versions, last time I tested was 6.10? or even 6.8).

Best regards, Piotr Zalewski
