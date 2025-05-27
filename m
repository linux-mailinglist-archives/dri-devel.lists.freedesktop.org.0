Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E1AC4EB7
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 14:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BA510E4A2;
	Tue, 27 May 2025 12:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JSEP8Qb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6039710E4A2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 12:34:01 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B51C12B3;
 Tue, 27 May 2025 14:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748349214;
 bh=n/7tgbnh1HYj1q4YPqzXdhqksDqU4MF2zBC9n53t8vE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JSEP8Qb/el8lj2iXAckQZs2X51X9/XhmOUt9ADvIRfZXqlu9QdpZbZZPE5K/VilK6
 Np8eZjDei/IfUayQ/aL/ESVFrUl5ACU3ZsXPjBsgKoShfwX7zMp3qYohp/yMbfhYBt
 F3Lx47cyq2QA9Hy4tB9V33wxNuzBqECiq/R6+i90=
Message-ID: <8fc0c880-0809-43d6-b03a-1a5728f5d0d4@ideasonboard.com>
Date: Tue, 27 May 2025 15:33:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/18] drm/tidss: Adjust the pclk based on the HW
 capabilities
To: Michael Walle <mwalle@kernel.org>, Devarsh Thakkar <devarsht@ti.com>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20250402-cdns-dsi-impro-v2-0-4a093eaa5e27@ideasonboard.com>
 <20250402-cdns-dsi-impro-v2-3-4a093eaa5e27@ideasonboard.com>
 <DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <DA6TT575Z82D.3MPK8HG5GRL8U@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Michael (and Aradhya, Devarsh),

On 27/05/2025 12:13, Michael Walle wrote:
> Hi Tomi,
> 
> While testing Aardhya's OLDI support patches [1], I've noticed that
> the resulting LVDS clock is wrong if this patch is applied.
> 
>> In practice, with the current K3 SoCs, the display PLL is capable of
>> producing very exact clocks, so most likely the rounded rate is the same
>> as the original one.
> 
> This is now what I'm seeing. Most SoCs have that fixed clock thingy
> for (some?) VPs, e.g. [2]. And clk_round_rate() will return the
> fixed clock rate for this clock, which will then result in an LVDS
> clock which is way off.
> 
> I'm testing on an AM67A (J722S) and I've backported some of the
> patches as well as dtsi fragmets from downstream. Thus, it might be
> as well the case that the fixed-factor-clock node is wrong here.
> OTOH other K3 SoCs do this in mainline as well.

Thanks for findings this (It's not a fixed clock, but a (fixed)
divider). I can reproduce on my AM62 SK's OLDI output.

I didn't see AM625 TRM explaining the DSS + OLDI clocking. I remember it
was a bit "interesting". Afaics from testing, the VP clock is derived
from the OLDI serial clock divided by 7. To change the VP clock, we need
to set the OLDI clock's rate. But the code we have at the moment is
using clk_round_rate/set_rate to the VP clock.

And we get the crtc atomic_check called before setting the OLDI clock
rate, so it doesn't even work by luck (i.e. if the OLDI clock was set
earlier, the VP clock would already have the right rate, and it would
seem that everything is ok). In the atomic_check we see the OLDI bypass
clock (25 MHz), which results in 3571428 Hz VP clock.

And with this patch, the code then decides that 3571428 Hz is what the
HW can do, and uses it as the pixel clock.

Aradhya, Devarsh, do you remember how the clocking goes here? Or if it's
in the TRM, please point me to it...

 Tomi

>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/tidss/tidss_crtc.c  | 23 +++++++++++++++++++----
>>  drivers/gpu/drm/tidss/tidss_dispc.c |  6 ++++++
>>  drivers/gpu/drm/tidss/tidss_dispc.h |  2 ++
>>  3 files changed, 27 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
>> index 1604eca265ef..6c3967f70510 100644
>> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
>> @@ -91,7 +91,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
>>  	struct dispc_device *dispc = tidss->dispc;
>>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>>  	u32 hw_videoport = tcrtc->hw_videoport;
>> -	const struct drm_display_mode *mode;
>> +	struct drm_display_mode *adjusted_mode;
>>  	enum drm_mode_status ok;
>>  
>>  	dev_dbg(ddev->dev, "%s\n", __func__);
>> @@ -99,12 +99,27 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
>>  	if (!crtc_state->enable)
>>  		return 0;
>>  
>> -	mode = &crtc_state->adjusted_mode;
>> +	adjusted_mode = &crtc_state->adjusted_mode;
> 
> Here, adjusted_mode->clock is still the correct pixel clock.
> 
>> -	ok = dispc_vp_mode_valid(dispc, hw_videoport, mode);
>> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>> +		long rate;
>> +
>> +		rate = dispc_vp_round_clk_rate(tidss->dispc,
>> +					       tcrtc->hw_videoport,
>> +					       adjusted_mode->clock * 1000);
>> +		if (rate < 0)
>> +			return -EINVAL;
>> +
>> +		adjusted_mode->clock = rate / 1000;
> 
> While after this statement, adjusted_mode->clock is 300MHz in my
> case (the VP1 clock seems to be 2.1GHz, divided by 7).
> 
> -michael
> 
> [1] https://lore.kernel.org/all/20250525151721.567042-1-aradhya.bhatia@linux.dev/
> [2] https://elixir.bootlin.com/linux/v6.15/source/arch/arm64/boot/dts/ti/k3-am62.dtsi#L110
> 
>> +
>> +		drm_mode_set_crtcinfo(adjusted_mode, 0);
>> +	}
>> +
>> +	ok = dispc_vp_mode_valid(dispc, hw_videoport, adjusted_mode);
>>  	if (ok != MODE_OK) {
>>  		dev_dbg(ddev->dev, "%s: bad mode: %ux%u pclk %u kHz\n",
>> -			__func__, mode->hdisplay, mode->vdisplay, mode->clock);
>> +			__func__, adjusted_mode->hdisplay,
>> +			adjusted_mode->vdisplay, adjusted_mode->clock); >  		return -EINVAL;
>>  	}
>>  
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
>> index a5107f2732b1..3930fb7f03c2 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>> @@ -1318,6 +1318,12 @@ unsigned int dispc_pclk_diff(unsigned long rate, unsigned long real_rate)
>>  	return (unsigned int)(abs(((rr - r) * 100) / r));
>>  }
>>  
>> +long dispc_vp_round_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>> +			     unsigned long rate)
>> +{
>> +	return clk_round_rate(dispc->vp_clk[hw_videoport], rate);
>> +}
>> +
>>  int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>>  			  unsigned long rate)
>>  {
>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.h b/drivers/gpu/drm/tidss/tidss_dispc.h
>> index c31b477a18b0..d4c335e918fb 100644
>> --- a/drivers/gpu/drm/tidss/tidss_dispc.h
>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.h
>> @@ -120,6 +120,8 @@ enum drm_mode_status dispc_vp_mode_valid(struct dispc_device *dispc,
>>  					 const struct drm_display_mode *mode);
>>  int dispc_vp_enable_clk(struct dispc_device *dispc, u32 hw_videoport);
>>  void dispc_vp_disable_clk(struct dispc_device *dispc, u32 hw_videoport);
>> +long dispc_vp_round_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>> +			     unsigned long rate);
>>  int dispc_vp_set_clk_rate(struct dispc_device *dispc, u32 hw_videoport,
>>  			  unsigned long rate);
>>  void dispc_vp_setup(struct dispc_device *dispc, u32 hw_videoport,
> 

