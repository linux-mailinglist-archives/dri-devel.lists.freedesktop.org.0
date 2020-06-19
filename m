Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF90200262
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 09:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E456EC21;
	Fri, 19 Jun 2020 07:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673F56EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 07:02:29 +0000 (UTC)
Received: from p5b127c2f.dip0.t-ipconnect.de ([91.18.124.47]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1jmB2d-00087c-5B; Fri, 19 Jun 2020 09:02:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: vop: fix vop full rgb24 r/b color error
Date: Fri, 19 Jun 2020 09:02:22 +0200
Message-ID: <2786595.VspqIdsi2r@phil>
In-Reply-To: <20200619021251.22991-1-hjc@rock-chips.com>
References: <20200619021251.22991-1-hjc@rock-chips.com>
MIME-Version: 1.0
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
Cc: huangtao@rock-chips.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sandy,

Am Freitag, 19. Juni 2020, 04:12:51 CEST schrieb Sandy Huang:
> RGB888 format msb is red component and the lsb is blue component,
> at vop full platform this is swapped, and this is different from vop
> lite and vop next, so add this patch to fix it.

just me struggling with color formats ... and wondering why this never
came up so far - with Version 3 being all major SoCs of the last years.

So I guess the reason that nobody noticed so far is, that most things
will use ARGB888 instead of RGB888?

One implementation nit below as well.

> Signed-off-by: Sandy Huang <hjc@rock-chips.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index c80f7d9fd13f..1c17048ad737 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -132,6 +132,7 @@ struct vop_win {
>  
>  struct rockchip_rgb;
>  struct vop {
> +	uint32_t version;
>  	struct drm_crtc crtc;
>  	struct device *dev;
>  	struct drm_device *drm_dev;
> @@ -989,6 +990,12 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
>  	VOP_WIN_SET(vop, win, dsp_st, dsp_st);
>  
>  	rb_swap = has_rb_swapped(fb->format->format);
> +	/*
> +	 * VOP full need to do rb swap to show rgb888/bgr888 format color correctly
> +	 */

one-line-comment?
	/* VOP-full needs rb_swap for correctly showing rgb888/bgr888 */

> +	if ((fb->format->format == DRM_FORMAT_RGB888 || fb->format->format == DRM_FORMAT_BGR888) &&
> +	    VOP_MAJOR(vop->version) == 3)
> +		rb_swap = !rb_swap;

can we move this into the existing has_rb_swapped() function?
Like doing
	rb_swap = has_rb_swapped(vop, fb->format->format)
and adding your conditional to the end there?


Thanks
Heiko


>  	VOP_WIN_SET(vop, win, rb_swap, rb_swap);
>  
>  	/*
> @@ -2091,6 +2098,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
>  	vop->dev = dev;
>  	vop->data = vop_data;
>  	vop->drm_dev = drm_dev;
> +	vop->version = vop_data->version;
>  	dev_set_drvdata(dev, vop);
>  
>  	vop_win_init(vop);
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
