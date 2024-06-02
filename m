Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2CD8D7341
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 05:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939C110E11C;
	Sun,  2 Jun 2024 03:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=packett.cool header.i=@packett.cool header.b="REwyQdi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EA610E11C
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 03:36:01 +0000 (UTC)
X-Envelope-To: heiko@sntech.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
 s=key1; t=1717299358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4WnZLNXTxyDKxHBiNiWfRKN88LzF8Z4jtB2f1P6shSE=;
 b=REwyQdi8bfi4u4XEBzbddwpO0MQxQfI9ErTXsxtufVF9fIcdf6NS62jw1lycOEWsOrB+Ju
 GbI7Z85iRrcIVZZWL+MZnawhnmmEPmq/H6kwagha1ddxTkI3T78CuM81ffieSFZ4vKgAG3
 KS5IOylF+9a+kyXEq5VA9pea0auYbzv63Suyqgx0iiFBh+zwhA1zVr7xuac0PUa1UbFiAm
 IacXBPMpjGCXAEKzblB2h6LiBECq8s3INeyYTbisOIlICFVa4d+4YV6I1qxgSot231et1i
 LvQnvfIGsgY4kNiCaZaqwEBaLxsBSlNIzHSShbwRW52eLxdU/I3sOEa8mrWzWQ==
X-Envelope-To: stable@vger.kernel.org
X-Envelope-To: hjc@rock-chips.com
X-Envelope-To: andy.yan@rock-chips.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-rockchip@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Sun, 02 Jun 2024 00:35:36 -0300
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH v3 1/2] drm/rockchip: vop: clear DMA stop bit upon vblank
 on RK3066
To: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Cc: stable@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <CNOFES.QFA1L3UJ3SH82@packett.cool>
In-Reply-To: <20240527231202.23365-1-val@packett.cool>
References: <20240527231202.23365-1-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
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



On Mon, May 27 2024 at 20:11:49 -03:00:00, Val Packett=20
<val@packett.cool> wrote:
> The RK3066 VOP sets a dma_stop bit when it's done scanning out a frame
> and needs the driver to acknowledge that by clearing the bit.
>=20
> So unless we clear it "between" frames, the RGB output only shows=20
> noise
> instead of the picture. vblank seems to be the most appropriate place=20
> to
> do it, since it indicates exactly that: that the hardware is done
> with the frame.
>=20
> This seems to be a redundant synchronization mechanism that was=20
> removed
> in later iterations of the VOP hardware block.
>=20
> Fixes: f4a6de8 ("drm: rockchip: vop: add rk3066 vop definitions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 6 ++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 1 +
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
>  3 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c=20
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index a13473b2d..2731fe2b2 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1766,6 +1766,12 @@ static void vop_handle_vblank(struct vop *vop)
>  	}
>  	spin_unlock(&drm->event_lock);
>=20
> +	if (VOP_HAS_REG(vop, common, dma_stop)) {
> +		spin_lock(&vop->reg_lock);
> +		VOP_REG_SET(vop, common, dma_stop, 0);
> +		spin_unlock(&vop->reg_lock);
> +	}
> +

Oops=85 so doing it here actually causes deadlocks, unless we also=20
change all other reg_lock usages to be spin_lock_irq/spin_unlock_irq.

Not sure if doing that or going back to v1 would be better.


