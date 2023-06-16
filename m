Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62B7338B4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75D710E67C;
	Fri, 16 Jun 2023 19:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47BE10E67C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=OITjJMM/YIrubD+VEy0joGuDfyuQ8uPlkEFPmiu0veE=;
 b=M11wGOaBtCqiMpBPTdSNzIvdGxIhj23P3o1Y6VWxK+J5z5jh7do9nxMMlwtcatwTtRE/FCSPPKKBN
 HO8+YEAr/NTAOHKHljS9/azSNWpJkElLLRf/B4lY4tjEg3UeGcWZiurZE2PewHSZW+HLUKDh61xsQI
 JnjglUn+sNcebdkQaHvlc3tR7ZcwQsPkS/3JC7U3Ne/4Q26zu2xOLgxEFu6BlSrMhxqCFpr+EgIKr6
 ladVmhoWIvG+ytnFtH84vV7RbhS2YDVWh9Vo5Ms+SkPTkAMXFRrHBdpIS1u90pMVm47REQovk0tE18
 b3t8MIHEuiNbbyRxNsvKfow3FUzNhHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=OITjJMM/YIrubD+VEy0joGuDfyuQ8uPlkEFPmiu0veE=;
 b=mCb6JNxxwwKh5NjctqEloDspwIaznKAgyKoBBDU4YhmZ1fuN9kw90lFsqWM81CzgXPQZFdh+dZrtl
 PIcRFaKAQ==
X-HalOne-ID: 46e5348d-0c78-11ee-a88a-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 46e5348d-0c78-11ee-a88a-6f01c1d0a443;
 Fri, 16 Jun 2023 19:02:04 +0000 (UTC)
Date: Fri, 16 Jun 2023 21:02:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/5] drm/bridge: tc358762: Split register programming
 from pre-enable to enable
Message-ID: <20230616190203.GF1697490@ravnborg.org>
References: <20230615201902.566182-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201902.566182-1-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Thu, Jun 15, 2023 at 10:18:58PM +0200, Marek Vasut wrote:
> Move the register programming part, which actually enables the bridge and
> makes it push data out of its DPI side, into the enable callback. The DSI
> host like DSIM may not be able to transmit commands in pre_enable, moving
> the register programming into enable assures it can transmit commands.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

I was about to complain that the use of .enable is deprecated, but the
following patch fixes this.
So:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/tc358762.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
> index 5641395fd310e..df9703eacab1f 100644
> --- a/drivers/gpu/drm/bridge/tc358762.c
> +++ b/drivers/gpu/drm/bridge/tc358762.c
> @@ -162,11 +162,17 @@ static void tc358762_pre_enable(struct drm_bridge *bridge)
>  		usleep_range(5000, 10000);
>  	}
>  
> +	ctx->pre_enabled = true;
> +}
> +
> +static void tc358762_enable(struct drm_bridge *bridge)
> +{
> +	struct tc358762 *ctx = bridge_to_tc358762(bridge);
> +	int ret;
> +
>  	ret = tc358762_init(ctx);
>  	if (ret < 0)
>  		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
> -
> -	ctx->pre_enabled = true;
>  }
>  
>  static int tc358762_attach(struct drm_bridge *bridge,
> @@ -181,6 +187,7 @@ static int tc358762_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs tc358762_bridge_funcs = {
>  	.post_disable = tc358762_post_disable,
>  	.pre_enable = tc358762_pre_enable,
> +	.enable = tc358762_enable,
>  	.attach = tc358762_attach,
>  };
>  
> -- 
> 2.39.2
