Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2019D8F6B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 01:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5BB10E050;
	Tue, 26 Nov 2024 00:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="AAFuHeFB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F30C10E050
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 00:05:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3CDEE89A0B;
 Tue, 26 Nov 2024 01:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732579517;
 bh=iXEvEq6TE6wGikpGyU2LyhflPbJSbD9Cr1drzON7Bg0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AAFuHeFBQZMbvD3d0TLIFLVax0pz2+0YaLXW4T1BhY1XjnIrtU8stYh0mQAqvpAKG
 a6F50FQR/+Llun0fEhLc6k8ILKcl4O/DTYyvFS2tvcNW06F6PUqg6QE3JCg0LCQDVN
 RLX/F+gOh3yq4azBwX9yByAp57xWlZHIDj5IIpu7XbFF/FcRIwELUDmYK6wp0Nir41
 0PyOL0OWIZBTNZBckOSujrO5e7P/FWr83rMJB875GbzCuRZFoP2O3Ii06TH/Sc43L7
 23Polkn3SWYI0UqkUJ5w68JhQ1TeMZBZaN0sE3cKawMt4qiF8lklpjG6l58FNA1/rd
 iO1BVPQatxo/g==
Message-ID: <a17f2bf7-1ea3-4ba3-80a8-338623d9d888@denx.de>
Date: Tue, 26 Nov 2024 00:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
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

On 11/22/24 2:32 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
>> The Pixel PLL is not very capable and may come up with wildly inaccurate
>> clock. Since DPI panels are often tolerant to slightly higher pixel clock
>> without being operated outside of specification, calculate two Pixel PLL
>> from either mode clock or display_timing .pixelclock.max , whichever is
>> higher. Since the Pixel PLL output clock frequency calculation always
>> returns lower frequency than the requested clock frequency, passing in
>> the higher clock frequency should result in output clock frequency which
>> is closer to the expected pixel clock.
>>
>> For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
>> without this patch is 65 MHz which is out of the panel specification of
>> 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
>> the specification and far more accurate.
> 
> Granted that most of the panel drivers do not implement get_timings()
> and granted that there are no current users of that interface, I think
> we should move away from it (and maybe even drop it completely from
> drm_panel).

It does fit DPI and LVDS panels and their descriptions in datasheets the 
best.

> What about achieving the same via slightly different approach: register
> a non-preferred mode with the clock equal to the max clock allowed. The
> bridge driver can then use the default and the "max" mode to select PLL
> clock.
> 
> I understand that this suggestion doesn't follow the DPI panel
> specifics, which are closer to the continuous timings rather than fixed
> set of modes, however I really don't think that it's worth keeping the
> interface for the sake of a single driver. Original commit 2938931f3732
> ("drm/panel: Add display timing support") from 2014 mentions using those
> timings for .mode_fixup(), but I couldn't find a trace of the
> corresponding implementation.
> 
> Another possible option might be to impletent adjusting modes in
> .atomic_check() / .mode_fixup().
Something like this ?

static const struct display_timing chefree_ch101olhlwh_002_timing = {
   .pixelclock = { 68900000, 71100000, 73400000 },
   ...
};

static const struct panel_desc chefree_ch101olhlwh_002 = {
   .timings = &chefree_ch101olhlwh_002_timing,
   .num_timings = 1,
   ...
};

... would turn into ...

static const struct drm_display_mode chefree_ch101olhlwh_002_mode[3] = {
   {
     .clock = 68900000,
     ...
   }, {
     .clock = 71100000,
     ...
   }, {
     .clock = 73400000,
     ...
   }
};

static const struct panel_desc chefree_ch101olhlwh_002 = {
   .modes = &chefree_ch101olhlwh_002_mode,
   .num_timings = 3,
   ...
};

?

Maybe some mode flag to specify which mode is MIN/TYP/MAX would be 
useful with that change too ?

Finally, the TC358767 driver would test all modes and find the most 
accurate one ?
