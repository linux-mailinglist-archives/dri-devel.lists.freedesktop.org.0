Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5628D0EBD
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 22:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1AE10E216;
	Mon, 27 May 2024 20:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A9110E216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 20:43:59 +0000 (UTC)
Received: from i5e86193d.versanet.de ([94.134.25.61] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sBhBf-0004Tg-UH; Mon, 27 May 2024 22:43:19 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: Val Packett <val@packett.cool>, stable@vger.kernel.org,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/rockchip: vop: clear DMA stop bit upon vblank
 on RK3066
Date: Mon, 27 May 2024 22:43:18 +0200
Message-ID: <1817371.3VsfAaAtOV@diego>
In-Reply-To: <20240527071736.21784-1-val@packett.cool>
References: <2024051930-canteen-produce-1ba7@gregkh>
 <20240527071736.21784-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Val,

Am Montag, 27. Mai 2024, 09:16:33 CEST schrieb Val Packett:
> On the RK3066, there is a bit that must be cleared, otherwise
> the picture does not show up on the display (at least for RGB).
> 
> Fixes: f4a6de8 ("drm: rockchip: vop: add rk3066 vop definitions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Val Packett <val@packett.cool>
> ---
> v2: doing this on vblank makes more sense; added fixes tag

can you give a rationale for this please?

I.e. does this dma-stop bit need to be set on each vblank that happens
to push this frame to the display somehow?

Because at least in theory atomic_flush where this was living in in v1,
might happen at a slower interval?


Thanks
Heiko

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 6 ++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h | 1 +
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 1 +
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index a13473b2d..2731fe2b2 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1766,6 +1766,12 @@ static void vop_handle_vblank(struct vop *vop)
>  	}
>  	spin_unlock(&drm->event_lock);
>  
> +	if (VOP_HAS_REG(vop, common, dma_stop)) {
> +		spin_lock(&vop->reg_lock);
> +		VOP_REG_SET(vop, common, dma_stop, 0);
> +		spin_unlock(&vop->reg_lock);
> +	}
> +
>  	if (test_and_clear_bit(VOP_PENDING_FB_UNREF, &vop->pending))
>  		drm_flip_work_commit(&vop->fb_unref_work, system_unbound_wq);
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> index b33e5bdc2..0cf512cc1 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.h
> @@ -122,6 +122,7 @@ struct vop_common {
>  	struct vop_reg lut_buffer_index;
>  	struct vop_reg gate_en;
>  	struct vop_reg mmu_en;
> +	struct vop_reg dma_stop;
>  	struct vop_reg out_mode;
>  	struct vop_reg standby;
>  };
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> index b9ee02061..9bcb40a64 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
> @@ -466,6 +466,7 @@ static const struct vop_output rk3066_output = {
>  };
>  
>  static const struct vop_common rk3066_common = {
> +	.dma_stop = VOP_REG(RK3066_SYS_CTRL0, 0x1, 0),
>  	.standby = VOP_REG(RK3066_SYS_CTRL0, 0x1, 1),
>  	.out_mode = VOP_REG(RK3066_DSP_CTRL0, 0xf, 0),
>  	.cfg_done = VOP_REG(RK3066_REG_CFG_DONE, 0x1, 0),
> 




