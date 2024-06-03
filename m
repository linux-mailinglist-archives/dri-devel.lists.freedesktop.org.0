Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7DE8E4ADE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 23:32:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2410E046;
	Mon,  3 Jun 2024 21:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="eQ70awgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A2E10E046
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 21:32:06 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 24ECE87873;
 Mon,  3 Jun 2024 23:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717450325;
 bh=wY93f3WmoYLgYjSRqsrwaQHNMpesQYqf/ddMznFgv4c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eQ70awgb/bAcon7kmEBWiEi2O+MEVqFMvhuV1vqp0QCXZQtNVJKvH7vFH95oHqxci
 6uW/rGoW63fVDJAbfEcaGF8wCUttL1AylncCP07rznB4kMeKJ4qLfrvdE6gO+AQdMJ
 d4wkrP1fOU529Enc7eCOE9w4a6ZtF9HjHfIYvRFfduWgj1eEZlfStYyHKrUZjEwrNA
 H6pCjkqejnFU+rVLwVC1/QBt6PMZU5OmfQbrTeNVDUP6S51Bj+SfELhYazzJaudeIL
 PftnWOiLf/cS1CWWw5FOaFxkFPrLwpy45kzci4DHyE+DWZ2prjc67DloPc6QwmrXAS
 23O3KG+gqCoBg==
Message-ID: <7989cb19-7735-4e38-8187-68a31fff7a5b@denx.de>
Date: Mon, 3 Jun 2024 23:27:34 +0200
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
 <20240531204130.277800-2-marex@denx.de> <1891607.tdWV9SEqCh@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1891607.tdWV9SEqCh@steina-w>
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

On 6/3/24 2:45 PM, Alexander Stein wrote:

Hi,

>> @@ -1631,6 +1643,18 @@ static int tc_edp_atomic_check(struct drm_bridge *bridge,
>>   			       struct drm_crtc_state *crtc_state,
>>   			       struct drm_connector_state *conn_state)
>>   {
>> +	struct tc_data *tc = bridge_to_tc(bridge);
>> +	int adjusted_clock = 0;
>> +	int ret;
>> +
>> +	ret = tc_pxl_pll_calc(tc, clk_get_rate(tc->refclk),
>> +			      crtc_state->adjusted_mode.clock * 1000,
>> +			      &adjusted_clock, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	crtc_state->adjusted_mode.clock = adjusted_clock / 1000;
> 
> This is prone to rounding errors. Debug output in my case:
>> [   16.007127] tc358767 1-000f: enable video stream
>> [   16.007148] tc358767 1-000f: PLL: requested 148500000 pixelclock, ref 26000000
>> [   16.007163] tc358767 1-000f: PLL: got 147333333, delta -1166667
>> [   16.007169] tc358767 1-000f: PLL: 26000000 / 1 / 1 * 17 / 3
>> [   16.027112] tc358767 1-000f: set mode 1920x1080
>> [   16.027138] tc358767 1-000f: H margin 148,88 sync 44
>> [   16.027144] tc358767 1-000f: V margin 36,4 sync 5
>> [   16.027150] tc358767 1-000f: total: 2200x1125
>> [   16.059426] tc358767 1-000f: PLL: requested 147333000 pixelclock, ref 26000000
>> [   16.059455] tc358767 1-000f: PLL: got 146250000, delta -1083000
>> [   16.059461] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
>> [   16.095724] tc358767 1-000f: PLL: requested 146250000 pixelclock, ref 26000000
>> [   16.095739] tc358767 1-000f: PLL: got 146250000, delta 0
>> [   16.095745] tc358767 1-000f: PLL: 26000000 / 1 / 4 * 45 / 2
> 
> The accuracy degrades with each call, until a full kHz frequency is reached,
> because drm_display_mode.clock only accounts for kHz, but the PLL
> calculation takes Hz into account.

Hmmmmm, I need to take a closer look at this one.

Do you have any quick hints ?

> BTW: Which platform are you testing on?

MX8MP with LCDIFv3 -> DSIM -> TC9595 -> DP output.

The TC9595 is 2nd generation (automotive?) replacement for TC358767 (1st 
generation replacement is TC358867) .
