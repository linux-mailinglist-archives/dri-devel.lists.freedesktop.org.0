Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201BB5BD4B0
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 20:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465AE10E0A6;
	Mon, 19 Sep 2022 18:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5188D10E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 18:19:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4118584C3A;
 Mon, 19 Sep 2022 20:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1663611557;
 bh=qaXJSHGzVra3uScTyl+1JMh853Am+d2RYo5LZJhEFMA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eN87FgasO8A3jTZ4KwlxlzA/vC5JiASuYgDxqONyhbit8d+vRexmrf//LsGfyn68s
 xeTQHyGAoZ6Cvz+JOepkzbdp8DE2DBy4mxQsLXoluLpPIe1LbjkBCsUj/Mf2HUL8pz
 0Sz4SWjsLYGzTcoMQKrnKOkCdIfE/Zi6IdeVZ0bNmrT5+3sFaakaZfsYFDu9SZ2BHB
 9PL1iuxajBV8wktdvJ8el3mh8eIpUEbk5HriMS7DPrWsO0tfBhlarGnjcl0Tfv3RTl
 bQLDcM84CNAC9mFpjztEjTkw16Bxz6U6onUPp/EtF8dnVvw9dRPSTdN/hf/k0QfnV7
 q73VPVImnqdhw==
Message-ID: <b585326b-190f-67f0-2631-412310b6d285@denx.de>
Date: Mon, 19 Sep 2022 20:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220801131113.182487-1-marex@denx.de>
 <41f661e5-adcd-3e42-df2f-5732b1e19125@denx.de>
 <20220919134329.nb75womf35jdae3h@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220919134329.nb75womf35jdae3h@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:43, Maxime Ripard wrote:
> Hi,

Hello Maxime,

> On Sun, Sep 18, 2022 at 02:56:00PM +0200, Marek Vasut wrote:
>> On 8/1/22 15:11, Marek Vasut wrote:
>>> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
>>> adjust DSI input frequency calculations such that they expect the DSI host
>>> to configure HS clock according to hs_rate.
>>>
>>> This is an optimization for the DSI burst mode case. In case the DSI device
>>> supports DSI burst mode, it is recommended to operate the DSI interface at
>>> the highest possible HS clock frequency which the DSI device supports. This
>>> permits the DSI host to send as short as possible bursts of data on the DSI
>>> link and keep the DSI data lanes in LP mode otherwise, which reduces power
>>> consumption.
>>
>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>> Cc: Robert Foss <robert.foss@linaro.org>
>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>> Cc: dri-devel@lists.freedesktop.org
>>> ---
>>>    drivers/gpu/drm/bridge/ti-sn65dsi83.c | 25 +++++++++++++------------
>>>    1 file changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>> index 14e7aa77e7584..b161f25c3a2f5 100644
>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>> @@ -286,8 +286,7 @@ static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
>>>    	return (mode_clock - 12500) / 25000;
>>>    }
>>> -static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
>>> -				  const struct drm_display_mode *mode)
>>> +static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx)
>>>    {
>>>    	/*
>>>    	 * The encoding of the CHA_DSI_CLK_RANGE is as follows:
>>> @@ -303,20 +302,20 @@ static u8 sn65dsi83_get_dsi_range(struct sn65dsi83 *ctx,
>>>    	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
>>>    	 * the 2 is there because the bus is DDR.
>>>    	 */
>>> -	return DIV_ROUND_UP(clamp((unsigned int)mode->clock *
>>> -			    mipi_dsi_pixel_format_to_bpp(ctx->dsi->format) /
>>> -			    ctx->dsi->lanes / 2, 40000U, 500000U), 5000U);
>>> +	return DIV_ROUND_UP(ctx->dsi->hs_rate, 5000000U);
>>>    }
>>> -static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
>>> +static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx,
>>> +				const struct drm_display_mode *mode)
>>>    {
>>>    	/* The divider is (DSI_CLK / LVDS_CLK) - 1, which really is: */
>>> -	unsigned int dsi_div = mipi_dsi_pixel_format_to_bpp(ctx->dsi->format);
>>> +	unsigned int dsi_div;
>>> +	int mode_clock = mode->clock;
>>> -	dsi_div /= ctx->dsi->lanes;
>>> +	if (ctx->lvds_dual_link)
>>> +		mode_clock /= 2;
>>> -	if (!ctx->lvds_dual_link)
>>> -		dsi_div /= 2;
>>> +	dsi_div = (ctx->dsi->hs_rate / mode_clock) / 1000;
>>>    	return dsi_div - 1;
>>>    }
>>> @@ -397,9 +396,9 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>>>    		     REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_range(ctx, mode)) |
>>>    		     REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
>>>    	regmap_write(ctx->regmap, REG_DSI_CLK,
>>> -		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx, mode)));
>>> +		     REG_DSI_CLK_CHA_DSI_CLK_RANGE(sn65dsi83_get_dsi_range(ctx)));
>>>    	regmap_write(ctx->regmap, REG_RC_DSI_CLK,
>>> -		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx)));
>>> +		     REG_RC_DSI_CLK_DSI_CLK_DIVIDER(sn65dsi83_get_dsi_div(ctx, mode)));
>>>    	/* Set number of DSI lanes and LVDS link config. */
>>>    	regmap_write(ctx->regmap, REG_DSI_LANE,
>>> @@ -643,6 +642,8 @@ static int sn65dsi83_host_attach(struct sn65dsi83 *ctx)
>>>    	dsi->lanes = dsi_lanes;
>>>    	dsi->format = MIPI_DSI_FMT_RGB888;
>>>    	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
>>> +	dsi->hs_rate = 500000000;
>>> +	dsi->lp_rate = 16000000;
> 
> Let's leave aside the comment from Dave that the host might choose a
> lower HS rate, we can indeed assume it's true for now.
> 
> However.. Is there any guarantee that the host can even reach that
> frequency in the first place? IIRC, the maximum rate a DSI host can
> reach is implementation specific. So I'm not sure this solution flies.
> 
> It's not clear to me from that patch what problem / issue it's supposed
> to solve in the first place, but it really looks similar to the
> discussion we had some time ago about that bridge that could only
> operate at a set of fixed frequencies.

The use of exact frequency on DSI HS clock for bridges which derive 
their PLL clock frequency from DSI HS clock discussion is separate a 
topic from this patch.

This patch is defining the maximum DSI HS clock frequency this bridge 
supports per datasheet (500 MHz) AND then assumes the DSI host would use 
that frequency on the DSI link (in burst mode, the highest frequency on 
the link permits the link to be in LP mode for longest time and thus be 
as power efficient as possible).

About the assumption -- currently the DSI HS clock frequency expected by 
the DSI bridge driver is calculated by its own driver-private formula ; 
the DSI HS clock frequency generated by the DSI host is calculated by 
the DSI host driver-private formula. Those two might not even match and 
thus each driver might come to different DSI HS clock they expect or 
generate. This cannot work reliably.

With this patch, it is at least possible for the DSI bridge driver to 
indicate what DSI HS clock it expects from the DSI host driver and what 
are its maximum DSI HS clock. The DSI host driver can check the nearest 
bridge flags (to verify the bridge uses burst mode) and hs_rate and 
configure itself accordingly. If the DSI host cannot generate suitable 
DSI HS clock which the bridge expects, it should likely refuse to bind 
with the bridge (also read on below how to deal with this). I consider 
this an improvement over current situation which is a total guesswork.

Regarding DSI hosts which cannot generate the specified hs_rate , they 
should likely just reject binding with the DSI bridge. However, there 
has been a valid point raised that the highest DSI HS clock supported by 
the DSI bridge might not always be the desired clock, e.g. in case EMI 
reduction is required by lowering the clock. I would propose to add a DT 
property which would allow limiting the maximum DSI HS clock frequency 
per DSI OF graph link in the DT, and a helper which would check the DT 
property, compare it with bridge limits, and set hs_rate accordingly.

This should work well for DSI burst mode links in general.

> You basically want to propagate the clock constraints along the bridge
> chain, and make sure every body is fine with that. The most reasonable
> would be to make it part of the bridge state, and possibly add a bunch
> of extra functions to query the upstream bridge clock output for a given
> state.

The bridge hardware constraints are static, just like the bridge 
hardware itself, so they shouldn't be part of the bridge state, should 
they ?

I agree we do need a way to implement frequency negotiation between DSI 
bridge and DSI host, but that's something which can be added on top of 
the actual bridge HW constraints, and yes, possibly by passing those 
dynamic constraints via bridge state.
