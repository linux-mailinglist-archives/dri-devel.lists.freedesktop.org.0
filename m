Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0907D7FA1F0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 15:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D543B10E2A8;
	Mon, 27 Nov 2023 14:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8921310E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 14:04:14 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cDc-0006Xd-V7; Mon, 27 Nov 2023 15:04:12 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cDc-00BxOJ-Gd; Mon, 27 Nov 2023 15:04:12 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1r7cDc-0046wB-Dz; Mon, 27 Nov 2023 15:04:12 +0100
Date: Mon, 27 Nov 2023 15:04:12 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2 02/12] Revert "drm/rockchip: vop2: Use regcache_sync()
 to fix suspend/resume"
Message-ID: <20231127140412.GC977968@pengutronix.de>
References: <20231122125316.3454268-1-andyshrk@163.com>
 <20231122125400.3454430-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122125400.3454430-1-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 08:54:00PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> This reverts commit b63a553e8f5aa6574eeb535a551817a93c426d8c.
> 
> regcache_sync will try to reload the configuration in regcache to
> hardware, but the registers of 4 Cluster windows and Esmart1/2/3 on
> the upcoming rk3588 can not be set successfully before internal PD
> power on.
> 
> Also it's better to keep the hardware register as it is before we really
> enable it.
> 
> So let's revert this version, and keep the first version:
> commit afa965a45e01 ("drm/rockchip: vop2: fix suspend/resume")
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 312da5783362..57784d0a22a6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -217,6 +217,8 @@ struct vop2 {
>  	struct vop2_win win[];
>  };
>  
> +static const struct regmap_config vop2_regmap_config;
> +
>  static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
>  {
>  	return container_of(crtc, struct vop2_video_port, crtc);
> @@ -883,7 +885,11 @@ static void vop2_enable(struct vop2 *vop2)
>  		return;
>  	}
>  
> -	regcache_sync(vop2->map);
> +	ret = regmap_reinit_cache(vop2->map, &vop2_regmap_config);
> +	if (ret) {
> +		drm_err(vop2->drm, "failed to reinit cache: %d\n", ret);
> +		return;
> +	}
>  
>  	if (vop2->data->soc_id == 3566)
>  		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
> @@ -913,8 +919,6 @@ static void vop2_disable(struct vop2 *vop2)
>  
>  	pm_runtime_put_sync(vop2->dev);
>  
> -	regcache_mark_dirty(vop2->map);
> -
>  	clk_disable_unprepare(vop2->aclk);
>  	clk_disable_unprepare(vop2->hclk);
>  }
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
