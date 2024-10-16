Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B849A158A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 00:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A1510E038;
	Wed, 16 Oct 2024 22:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="YZNJi6NI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1610E038
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1729116291; x=1729375491;
 bh=otJbHyZujNBalaTmidGF7B0oyofrDrA0kk+tMXiuG/s=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YZNJi6NI5uCjD1Kuu2PpS3Ieh1Zh06zEO3pEMXQfwiMmQ2rsIZQ6p7qO8nvrmfL89
 gu2Wvgmyg34MyeWwuq6CBcJcC08bxC6J7ONvmjPq3LiYmq5M3aqw2IXgB4Sp4XRdqp
 Vj6YeH60MTXk4pTyv7SUhxPdoErnwttSJm/FyPSNs4tM94SFKUt9q2ZngbFL8T9gt4
 VUTZG8bdKCGY06yI7t2xQhz3I7+S5pkhd617unvm0hZoF6nWGaHpmYgR3HOctqLJLU
 rB1eSaSWjLtjojHXuOoRRCcdZIq2oAlfPV0983dje0NqIn+0deFw2Go5wejuADSXsH
 UwF0LeKUpu3lg==
Date: Wed, 16 Oct 2024 22:04:47 +0000
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
Message-ID: <qQ8K1eMN92mXXKiHVEiv4sUKmuXirPwokVQJRMsoMu4SmeW5OksIhhsx7P2MCymkWJeyAqX_YSvg-iUbP3Njt7XHHDXAqIRxtKmwoBkfRYA=@proton.me>
In-Reply-To: <bDA4Uh6mp04Po1miJIueRsMNZ9W09DHEnRjG4CzWBn243gI_ExYhjwC9j-KMgOvUS5ofKsAa926IGfVGz4fNt9P_kOBpTyIOakgbB9Sqc-4=@proton.me>
References: <20241014222022.571819-4-pZ010001011111@proton.me>
 <13fc0084.1321.19292eec34e.Coremail.andyshrk@163.com>
 <bDA4Uh6mp04Po1miJIueRsMNZ9W09DHEnRjG4CzWBn243gI_ExYhjwC9j-KMgOvUS5ofKsAa926IGfVGz4fNt9P_kOBpTyIOakgbB9Sqc-4=@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 9bf1c476827f42656380d0b9b801739f99b648d3
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

Hi Andy

On Wednesday, October 16th, 2024 at 11:23 AM, Piotr Zalewski <pZ01000101111=
1@proton.me> wrote:

> > > static void vop2_crtc_atomic_flush(struct drm_crtc *crtc,
> > > @@ -2790,7 +2945,13 @@ static int vop2_create_crtcs(struct vop2 *vop2=
)
> > > }
> > >=20
> > > drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
> > > + if (vop2->lut_regs && vp->crtc.dev !=3D NULL) {
> >=20
> > There is no need to check vp->crtc.dev here, set has been set in drm_cr=
tc_init_with_planes .
>=20
>=20
> I tested it and this check must be here because trying to enable color mg=
mt
> on CRTC with no associated device, causes null ptr dereference later on i=
n
> drm_crtc_enable_color_mgmt (unless something changed in recent kernel
> versions, last time I tested was 6.10? or even 6.8).

Just tested it without the null check and it works. Next version will be wi=
thout it.

Best regards, Piotr Zalewski
