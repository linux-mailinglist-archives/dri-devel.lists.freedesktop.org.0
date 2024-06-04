Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB18FBA47
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64A010E2B2;
	Tue,  4 Jun 2024 17:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="DvaKjhSa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0210E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:27:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8D08F88481;
 Tue,  4 Jun 2024 19:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717522021;
 bh=Du1VJbeHNByHSbpM85SdRQBh4PelkBqyr9WXfxkVX10=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DvaKjhSaW67Fb0xhOJ7PG13HHTm/7wmYkwUZ4j9bsXMSbqvCXj3AUVP6BWMM42OBu
 zKH2uM5o53VzBWTjQgF1tQgbjOGtXzQNbrS50kOiSkM+lSlPjsZfU7v2Dnp5nT3y7z
 Hh1Uddqu0DsJadMDRg8CVlO6aoDYQWadeIYZYsORptwAYcYCdEwRbL8lWwVf93vZmj
 7N4ZG+gsv5DvZx0YBZDbipCesivdjQgyXe9XYPvZl3TN7ev69Zj74wMeeh5uLNa9Sk
 wA5T7ixIkTYx5TcMYP03mOBM0doSHS3cAwvKrcHzU+LUDQckriqSaiBy6eMzq/aWAu
 hWn90qduRxu6A==
Message-ID: <c0199d62-1b0d-488b-a54e-0b3512be1c9d@denx.de>
Date: Tue, 4 Jun 2024 18:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: tc358767: Use tc_pxl_pll_calc() to
 correct adjusted_mode clock
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240531204130.277800-1-marex@denx.de>
 <1891607.tdWV9SEqCh@steina-w> <7989cb19-7735-4e38-8187-68a31fff7a5b@denx.de>
 <3228734.5fSG56mABF@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3228734.5fSG56mABF@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/4/24 1:35 PM, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Montag, 3. Juni 2024, 23:27:34 CEST schrieb Marek Vasut:
>> On 6/3/24 2:45 PM, Alexander Stein wrote:
>>
>> Hi,
>>
>>>> @@ -1631,6 +1643,18 @@ static int tc_edp_atomic_check(struct drm_bridge *bridge,
>>>>    			       struct drm_crtc_state *crtc_state,
>>>>    			       struct drm_connector_state *conn_state)
>>>>    {
>>>> +	struct tc_data *tc = bridge_to_tc(bridge);
>>>> +	int adjusted_clock = 0;
>>>> +	int ret;
>>>> +
>>>> +	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
>>>> +			      crtc_state->adjusted_mode.clock * 1000,
>>>> +			      &adjusted_clock, NULL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	crtc_state->adjusted_mode.clock = adjusted_clock / 1000;
>>>
>>> This is prone to rounding errors. Debug output in my case:
>>>> [   16.007127] tc358767 1-000f: enable video stream
>>>> [   16.007148] tc358767 1-000f: PLL: requested 148500000 pixelclock, ref 26000000
>>>> [   16.007163] tc358767 1-000f: PLL: got 147333333, delta -1166667
>>>> [   16.007169] tc358767 1-000f: PLL: 26000000 / 1 / 1 * 17 / 3
>>>> [   16.027112] tc358767 1-000f: set mode 1920x1080
>>>> [   16.027138] tc358767 1-000f: H margin 148,88 sync 44
>>>> [   16.027144] tc358767 1-000f: V margin 36,4 sync 5
>>>> [   16.027150] tc358767 1-000f: total: 2200x1125
>>>> [   16.059426] tc358767 1-000f: PLL: requested 147333000 pixelclock, ref 26000000
>>>> [   16.059455] tc358767 1-000f: PLL: got 146250000, delta -1083000
>>>> [   16.059461] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
>>>> [   16.095724] tc358767 1-000f: PLL: requested 146250000 pixelclock, ref 26000000
>>>> [   16.095739] tc358767 1-000f: PLL: got 146250000, delta 0
>>>> [   16.095745] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
>>>
>>> The accuracy degrades with each call, until a full kHz frequency is reached,
>>> because drm_display_mode.clock only accounts for kHz, but the PLL
>>> calculation takes Hz into account.
>>
>> Hmmmmm, I need to take a closer look at this one.
>>
>> Do you have any quick hints ?

So the fix is real simple, try this extra diff:

diff --git a/drivers/gpu/drm/bridge/tc358767.c 
b/drivers/gpu/drm/bridge/tc358767.c
index 32639865fea07..5d76285dcf245 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1629,7 +1629,7 @@ static int tc_dpi_atomic_check(struct drm_bridge 
*bridge,
         int ret;

         ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
-                             crtc_state->adjusted_mode.clock * 1000,
+                             crtc_state->mode.clock * 1000,
                               &adjusted_clock, NULL);
         if (ret)
                 return ret;
@@ -1653,7 +1653,7 @@ static int tc_edp_atomic_check(struct drm_bridge 
*bridge,
         int ret;

         ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
-                             crtc_state->adjusted_mode.clock * 1000,
+                             crtc_state->mode.clock * 1000,
                               &adjusted_clock, NULL);
         if (ret)
                 return ret;

> No, sorry. I'm not sure about those VFIFO overruns/underruns you mentioned
> in the commit message. Does this maybe only apply to DPI input?

No, this actually happens with DSI input in both DPI and (e)DP output 
modes, it is only really well visible in some resolutions it seems.

> At least for 148.5MHz (1080p) apparently it is not possible to that
> exact clock anyway.

Right, which sucks, but the TC9595 datasheet explicitly states that the 
FRMSYNC mode should always be enabled (and is apparently force-enabled 
on newer bridge chips with no option to disable it) unless the Pixel 
clock are sourced from DSI clock (which is never the case with this 
driver). That's what the [1] patch does.

But messing with the HFP isn't really working for all resolutions, so 
this patch instead adjusts the input pixel clock to fit the Pixel PLL 
limits, which avoids the VFIFO issues altogether. And that makes the 
FRMSYNC mode work for all kinds of resolutions.

You might be wondering why not source pixel clock from DSI HS clock and 
disable FRMSYNC. For one thing, this would limit the ability to pick 
faster DSI HS clock and make good use of the DSI burst mode (the DSI 
link can go into LP state after transmitting entire line of pixel data 
for longer with faster DSI HS clock). The other thing is, to drive the 
Pixel PLL (not to be confused with pixel clock) from DSI HS clock, the 
DSI HS clock have to be set to specific clock rates (13*4*7=364 MHz and 
13*4*9=468 MHz), which is really limiting.

>>> BTW: Which platform are you testing on?
>>
>> MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.
>>
>> The TC9595 is 2nd generation (automotive?) replacement for TC358767 (1st
>> generation replacement is TC358867) .
> 
> Same here. But fail to get output on a DP monitor if I'm running from
> external refclk. Using DSICLK/4 seems necessary for some reason, but it
> is very unreliable to get a proper image.

Do you have all the patches in place ? This is what you should have:

drm/bridge: tc358767: Enable FRMSYNC timing generator
drm: bridge: samsung-dsim: Initialize bridge on attach
drm/bridge: tc358767: Reset chip again on attach
clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate
drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
drm/bridge: tc358767: Fix comment in tc_edp_mode_valid
drm/bridge: tc358767: Check if fully initialized before signalling HPD 
event via IRQ
drm/bridge: tc358767: Split tc_pxl_pll_en() into parameter calculation 
and enablement
drm/bridge: tc358767: Use tc_pxl_pll_calc() to correct adjusted_mode clock
drm/bridge: tc358767: Drop line_pixel_subtract
drm/bridge: tc358767: Disable MIPI_DSI_CLOCK_NON_CONTINUOUS
drm/bridge: tc358767: Set LSCLK divider for SYSCLK to 1
Revert "drm/bridge: tc358767: Set default CLRSIPO count"
drm/bridge: tc358767: Add configurable default preemphasis

I only use external refclk, at 26 MHz.

> Which display are you using? Do you mind sharing your DT?

HP LA2405wg , ancient 1920x1200 one.

Relevant parts are below:

// This is in I2C controller node, it actually is modified
// arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
tc_bridge: bridge@f {
         compatible = "toshiba,tc9595", "toshiba,tc358767";
         pinctrl-names = "default";
         pinctrl-0 = <&pinctrl_tc9595>;
         reg = <0xf>;
         clock-names = "ref";
         clocks = <&clk IMX8MP_CLK_CLKOUT2>;
         assigned-clocks = <&clk IMX8MP_CLK_CLKOUT2_SEL>,
                           <&clk IMX8MP_CLK_CLKOUT2>,
                           <&clk IMX8MP_AUDIO_PLL2_OUT>;
         assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
         assigned-clock-rates = <26000000>, <26000000>, <416000000>;
         reset-gpios = <&gpio4 1 GPIO_ACTIVE_HIGH>;
         status = "okay";

         ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 port@0 {
                         reg = <0>;

                         tc_bridge_in: endpoint {
                                 data-lanes = <1 2 3 4>;
                                 remote-endpoint = <&dsi_out>;
                         };
                 };

                 port@2 { // This is optional
                         reg = <2>;
                         toshiba,pre-emphasis = /bits/ 8 <1 1>;
                 };
         };
};

// 1 GHz burst clock is the maximum the bridge can do
&mipi_dsi {
         samsung,burst-clock-frequency = <1000000000>;
         samsung,esc-clock-frequency = <10000000>;
         status = "okay";

         ports {
                 port@1 {
                         reg = <1>;

                         dsi_out: endpoint {
                                 data-lanes = <1 2 3 4>;
                                 remote-endpoint = <&tc_bridge_in>;
                         };
                 };
         };
};

// This is to let LCDIF configure the pixel clock,
// it removes the fixed Video PLL configuration from DT
&media_blk_ctrl {
        assigned-clocks = <&clk IMX8MP_CLK_MEDIA_AXI>,
                          <&clk IMX8MP_CLK_MEDIA_APB>,
                          <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
                          <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>;
        assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
                                 <&clk IMX8MP_SYS_PLL1_800M>,
                                 <&clk IMX8MP_VIDEO_PLL1_OUT>,
                                 <&clk IMX8MP_SYS_PLL3_OUT>;
        assigned-clock-rates = <500000000>, <200000000>,
                               <0>, <0>;
};
