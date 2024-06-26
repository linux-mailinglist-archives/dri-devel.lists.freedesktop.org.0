Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C14791778B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 06:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED71D10E2DF;
	Wed, 26 Jun 2024 04:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="bHmy4ck3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627DF10E308
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:43:55 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E2C6588216;
 Wed, 26 Jun 2024 06:43:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719377033;
 bh=wHsCJ7cXXMGa53gYSWW0zqOnC+G2BYCtot9U3pF7cT8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bHmy4ck3zc/2UlTKIGzenh88GD81bpiDUp4bFkMUGQK9Vgdt1M0IEb0mPSQtQNPxn
 qIDt5Cxgpqi8yMZJI9mcgBAMN7PK/9/JRQlGcULqDkNuyeLQHHoKhtw6ctDMvsbBIX
 bvTeAFkkdVOz4hAUawo/86tGQTpUaI/Ideo0icTsLgAEVNQc65t5CKHf2dGx1CF9aH
 H1XZF6C9Vj011I4I8ia39TxF/YNcHQXpkTE38jcfs4InGMg8NePzQ4fe3PBv6Z4Fni
 zAteAzxCjE1/sMmUp35A2FYEYm8V4/os1tEHaHQjcxA8ek33etgcywCJ4HLn6QgfdM
 lmu3yHgFkgLFA==
Message-ID: <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
Date: Wed, 26 Jun 2024 05:21:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4603431.cEBGB3zze1@steina-w>
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

On 6/25/24 4:37 PM, Alexander Stein wrote:
> Hi Marek,

Hi,

> Am Dienstag, 25. Juni 2024, 14:26:10 CEST schrieb Marek Vasut:
>> Initialize the bridge on attach already, to force lanes into LP11
>> state, since attach does trigger attach of downstream bridges which
>> may trigger (e)DP AUX channel mode read.
>>
>> This fixes a corner case where DSIM with TC9595 attached to it fails
>> to operate the DP AUX channel, because the TC9595 enters some debug
>> mode when it is released from reset without lanes in LP11 mode. By
>> ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
>> can be reset in its attach callback called from DSIM attach callback,
>> and recovered out of the debug mode just before TC9595 performs first
>> AUX channel access later in its attach callback.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Adam Ford <aford173@gmail.com>
>> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Cc: Inki Dae <inki.dae@samsung.com>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
>> Cc: Lucas Stach <l.stach@pengutronix.de>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Robert Foss <rfoss@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: kernel@dh-electronics.com
>> ---
>> V2: Handle case where mode is not set yet
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 32 ++++++++++++++++++++-------
>>   1 file changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index e7e53a9e42afb..22d3bbd866d97 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -699,20 +699,24 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>>   
>>   static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
>>   {
>> -	unsigned long hs_clk, byte_clk, esc_clk, pix_clk;
>> +	unsigned long hs_clk, byte_clk, esc_clk;
>>   	unsigned long esc_div;
>>   	u32 reg;
>>   	struct drm_display_mode *m = &dsi->mode;
>>   	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
>>   
>> -	/* m->clock is in KHz */
>> -	pix_clk = m->clock * 1000;
>> -
>> -	/* Use burst_clk_rate if available, otherwise use the pix_clk */
>> +	/*
>> +	 * Use burst_clk_rate if available, otherwise use the mode clock
>> +	 * if mode is already set and available, otherwise fall back to
>> +	 * PLL input clock and operate in 1:1 lowest frequency mode until
>> +	 * a mode is set.
>> +	 */
>>   	if (dsi->burst_clk_rate)
>>   		hs_clk = samsung_dsim_set_pll(dsi, dsi->burst_clk_rate);
>> +	else if (m)	/* m->clock is in KHz */
>> +		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(m->clock * 1000 * bpp, dsi->lanes));
>>   	else
>> -		hs_clk = samsung_dsim_set_pll(dsi, DIV_ROUND_UP(pix_clk * bpp, dsi->lanes));
>> +		hs_clk = dsi->pll_clk_rate;
>>   
> 
> I can't reproduce that mentioned corner case and presumably this problem
> does not exist otherwise. If samsung,burst-clock-frequency is unset I get
> a sluggish image on the monitor.
> 
> It seems the calculation is using a adjusted clock frequency:
> samsung-dsim 32e60000.dsi: Using pixel clock for HS clock frequency
> samsung-dsim 32e60000.dsi: [drm:samsung_dsim_host_attach [samsung_dsim]] Attached tc358767 device (lanes:4 bpp:24 mode-flags:0xc03)
> samsung-dsim 32e60000.dsi: PLL ref clock freq 24000000
> samsung-dsim 32e60000.dsi: failed to find PLL PMS for requested frequency
> samsung-dsim 32e60000.dsi: failed to configure DSI PLL
> samsung-dsim 32e60000.dsi: PLL ref clock freq 24000000
> samsung-dsim 32e60000.dsi: PLL freq 883636363, (p 11, m 810, s 1)
> samsung-dsim 32e60000.dsi: hs_clk = 883636363, byte_clk = 110454545, esc_clk = 9204545
> samsung-dsim 32e60000.dsi: calculated hfp: 60, hbp: 105, hsa: 27
> samsung-dsim 32e60000.dsi: LCD size = 1920x1080
> 
> 891 MHz is the nominal one for 148.5 MHz pixelclock. But even setting
> samsung,burst-clock-frequency to 891 MHz results in a sluggish image.
> Maybe this usecase is nothing I need to consider while using DSI-DP
> with EDID timings available.
> 
> As the burst clock needs to provide more bandwidth than actually needed,
> I consider this a different usecase not providing
> samsung,burst-clock-frequency for DSI->DP usage.
> 
> But the initialization upon attach is working intended, so:
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thank you for testing and keeping up with this. I will wait for more 
feedback if there is any (Frieder? Lucas? Michael?). If there are no 
objections, then I can merge it in a week or two ?
