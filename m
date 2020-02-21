Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12420168494
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241216F4DD;
	Fri, 21 Feb 2020 17:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123346F4DD
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:13:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 06ABD68BFE; Fri, 21 Feb 2020 18:13:29 +0100 (CET)
Date: Fri, 21 Feb 2020 18:13:28 +0100
From: Torsten Duwe <duwe@lst.de>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH] drm/bridge: analogix-anx6345: fix set of link bandwidth
Message-ID: <20200221171328.GC6928@lst.de>
References: <20200221165127.813325-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221165127.813325-1-icenowy@aosc.io>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 12:51:27AM +0800, Icenowy Zheng wrote:
> Current code tries to store the link rate (in bps, which is a big
> number) in a u8, which surely overflow. Then it's converted back to
> bandwidth code (which is thus 0) and written to the chip.
> 
> The code sometimes works because the chip will automatically fallback to
> the lowest possible DP link rate (1.62Gbps) when get the invalid value.
> However, on the eDP panel of Olimex TERES-I, which wants 2.7Gbps link,
> it failed.
> 
> As we had already read the link bandwidth as bandwidth code in earlier
> code (to check whether it is supported), use it when setting bandwidth,
> instead of converting it to link rate and then converting back.
> 
> Fixes: e1cff82c1097 ("drm/bridge: fix anx6345 compilation for v5.5")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> index 56f55c53abfd..2dfa2fd2a23b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -210,8 +210,7 @@ static int anx6345_dp_link_training(struct anx6345 *anx6345)
>  	if (err)
>  		return err;
>  
> -	dpcd[0] = drm_dp_max_link_rate(anx6345->dpcd);
> -	dpcd[0] = drm_dp_link_rate_to_bw_code(dpcd[0]);
> +	dpcd[0] = dp_bw;

Why do you make this assignment and not use dp_bw directly in the call?

>  	err = regmap_write(anx6345->map[I2C_IDX_DPTX],
>  			   SP_DP_MAIN_LINK_BW_SET_REG, dpcd[0]);
                                                       ^^^^^^
>  	if (err)
> -- 
> 2.24.1

BTW, my version is only a bit more verbose:

https://patchwork.freedesktop.org/patch/354344/

	Torsten

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
