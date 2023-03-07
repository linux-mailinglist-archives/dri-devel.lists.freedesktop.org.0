Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7D26AF876
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 23:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB0410E528;
	Tue,  7 Mar 2023 22:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29A210E528
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 22:21:13 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pZfgC-0001g0-HR; Tue, 07 Mar 2023 23:21:08 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 1/4] drm/rockchip: vop: limit maximium resolution to
 hardware capabilities
Date: Tue, 07 Mar 2023 23:21:16 +0100
Message-ID: <839117967.0ifERbkFSE@diego>
In-Reply-To: <20230216102447.582905-2-s.hauer@pengutronix.de>
References: <20230216102447.582905-1-s.hauer@pengutronix.de>
 <20230216102447.582905-2-s.hauer@pengutronix.de>
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
Cc: Dan Johansen <strit@manjaro.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

Am Donnerstag, 16. Februar 2023, 11:24:44 CET schrieb Sascha Hauer:
> The different VOP variants support different maximum resolutions. Reject
> resolutions that are not supported by a specific variant.
> 
> This hasn't been a problem in the upstream driver so far as 1920x1080
> has been the maximum resolution supported by the HDMI driver and that
> resolution is supported by all VOP variants. Now with higher resolutions
> supported in the HDMI driver we have to limit the resolutions to the
> ones supported by the VOP.
> 
> The actual maximum resolutions are taken from the Rockchip downstream
> Kernel.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v5:
>     - fix wrong check height vs. width
>     
>     Changes since v4:
>     - Use struct vop_rect for storing resolution
>     
>     Changes since v3:
>     - new patch
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 ++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 -----
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 ++++++++++++++++++
>  4 files changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index fa1f4ee6d1950..40c688529d44e 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1174,6 +1174,20 @@ static void vop_crtc_disable_vblank(struct drm_crtc *crtc)
>  	spin_unlock_irqrestore(&vop->irq_lock, flags);
>  }
>  
> +static enum drm_mode_status vop_crtc_mode_valid(struct drm_crtc *crtc,
> +						const struct drm_display_mode *mode)
> +{
> +	struct vop *vop = to_vop(crtc);
> +
> +	if (vop->data->max_output.width && mode->hdisplay > vop->data->max_output.width)
> +		return MODE_BAD_HVALUE;
> +
> +	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_output.height)
> +		return MODE_BAD_VVALUE;
> +
> +	return MODE_OK;
> +}

I'm very much in favor of codifying the possible resolutions. Hopefully
this will also enable better vop-selection down the road.

But ...

The above does break the px30-minievb display.
While the px30 TRM does say it supports a 1920x1080 resolution only, the
px30-minievb comes with a 720x1280 DSI display and normally runs just
fine with it.

Looking at the vendor-code [0], it seems they only seem to check for the
hvalue. Looking deeper, the height-check was present in the beginning [1],
but then was removed later on.

Looking a bit more, I find [2] which says that
	"Actually vop hardware has no output height limit"

I re-checked this on both px30+dsi and rock64+1080p-hdmi and with
> +	if (vop->data->max_output.height && mode->vdisplay > vop->data->max_output.height)
> +		return MODE_BAD_VVALUE;
line gone, rock64 is still happy and the px30 works correctly again.

So, do you see an issue with removing the output-height check?


Heiko


[0] https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/gpu/drm/rockchip/rockchip_drm_vop.c#L2446
[1] https://github.com/rockchip-linux/kernel/commit/7e3e0c5e2eb16901ab5dce1cb981e1ac58fe42c6
[2] https://github.com/rockchip-linux/kernel/commit/28c41da2693fe448aeda7c03070c376290b93805


