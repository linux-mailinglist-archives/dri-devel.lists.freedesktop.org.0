Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6479C6E4582
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 12:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D221D10E3F0;
	Mon, 17 Apr 2023 10:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A850710E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 10:46:07 +0000 (UTC)
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1poMN3-0002dr-Ug; Mon, 17 Apr 2023 12:46:05 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] drm/rockchip: vop2: fix suspend/resume
Date: Mon, 17 Apr 2023 12:46:05 +0200
Message-ID: <7404631.18pcnM708K@diego>
In-Reply-To: <20230417094215.2049231-1-s.hauer@pengutronix.de>
References: <20230417094215.2049231-1-s.hauer@pengutronix.de>
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
Cc: =?ISO-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sandy Huang <hjc@rock-chips.com>,
 stable@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sascha,

Am Montag, 17. April 2023, 11:42:15 CEST schrieb Sascha Hauer:
> During a suspend/resume cycle the VO power domain will be disabled and
> the VOP2 registers will reset to their default values. After that the
> cached register values will be out of sync and the read/modify/write
> operations we do on the window registers will result in bogus values
> written. Fix this by marking the regcache as dirty each time we disable
> the VOP2 and call regcache_sync() each time we enable it again. With
> this the VOP2 will show a picture after a suspend/resume cycle whereas
> without this the screen stays dark.
> 
> Fixes: 604be85547ce4 ("drm/rockchip: Add VOP2 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

somehow we overlapped with this v2 and me applying the original one [0]
to drm-misc. With drm-misc being a shared tree there is also no way back.

So if this v2 is better suited, could do a follow-up patch instead - on
top of your original one?

Thanks
Heiko



[0] https://cgit.freedesktop.org/drm/drm-misc/commit/?h=drm-misc-fixes&id=afa965a45e01e541cdbe5c8018226eff117610f0

> ---
> 
> Changes since v1:
> - Use regcache_mark_dirty()/regcache_sync() instead of regmap_reinit_cache()
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index ba3b817895091..293c228a83f90 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -839,6 +839,8 @@ static void vop2_enable(struct vop2 *vop2)
>  		return;
>  	}
>  
> +	regcache_sync(vop2->map);
> +
>  	if (vop2->data->soc_id == 3566)
>  		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
>  
> @@ -867,6 +869,8 @@ static void vop2_disable(struct vop2 *vop2)
>  
>  	pm_runtime_put_sync(vop2->dev);
>  
> +	regcache_mark_dirty(vop2->map);
> +
>  	clk_disable_unprepare(vop2->aclk);
>  	clk_disable_unprepare(vop2->hclk);
>  }
> 




