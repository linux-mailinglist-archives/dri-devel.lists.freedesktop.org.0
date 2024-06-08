Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB3901226
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 16:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B346B10E00B;
	Sat,  8 Jun 2024 14:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA0A10E00B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 14:50:07 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sFxOB-0000AO-Bf; Sat, 08 Jun 2024 16:49:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: stable@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/rockchip: vop: clear DMA stop bit upon vblank
 on RK3066
Date: Sat, 08 Jun 2024 16:49:50 +0200
Message-ID: <4253237.VLH7GnMWUR@phil>
In-Reply-To: <CNOFES.QFA1L3UJ3SH82@packett.cool>
References: <20240527231202.23365-1-val@packett.cool>
 <CNOFES.QFA1L3UJ3SH82@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Am Sonntag, 2. Juni 2024, 05:35:36 CEST schrieb Val Packett:
>=20
> On Mon, May 27 2024 at 20:11:49 -03:00:00, Val Packett=20
> <val@packett.cool> wrote:
> > The RK3066 VOP sets a dma_stop bit when it's done scanning out a frame
> > and needs the driver to acknowledge that by clearing the bit.
> >=20
> > So unless we clear it "between" frames, the RGB output only shows=20
> > noise
> > instead of the picture. vblank seems to be the most appropriate place=20
> > to
> > do it, since it indicates exactly that: that the hardware is done
> > with the frame.
> >=20
> > This seems to be a redundant synchronization mechanism that was=20
> > removed
> > in later iterations of the VOP hardware block.
> >=20
> > Fixes: f4a6de8 ("drm: rockchip: vop: add rk3066 vop definitions")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Val Packett <val@packett.cool>
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 6 ++++++
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 1 +
> >  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
> >  3 files changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c=20
> > b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > index a13473b2d..2731fe2b2 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > @@ -1766,6 +1766,12 @@ static void vop_handle_vblank(struct vop *vop)
> >  	}
> >  	spin_unlock(&drm->event_lock);
> >=20
> > +	if (VOP_HAS_REG(vop, common, dma_stop)) {
> > +		spin_lock(&vop->reg_lock);
> > +		VOP_REG_SET(vop, common, dma_stop, 0);
> > +		spin_unlock(&vop->reg_lock);
> > +	}
> > +
>=20
> Oops=E2=80=A6 so doing it here actually causes deadlocks, unless we also=
=20
> change all other reg_lock usages to be spin_lock_irq/spin_unlock_irq.
>=20
> Not sure if doing that or going back to v1 would be better.

then please go back to v1 (as v4) :-) .

I.e. regular spinlock vs. spin_lock_irq will have performance
implications and this "feature" is a one-time only thing used
only on a more than 10 year old soc, so it really must not affect
stuff coming after it.


Heiko


