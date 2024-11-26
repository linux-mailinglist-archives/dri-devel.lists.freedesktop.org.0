Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B17CB9D9BA4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 17:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5155110E94D;
	Tue, 26 Nov 2024 16:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="EcLeM63V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EE110E94D
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 16:40:16 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D4FF8893A0;
 Tue, 26 Nov 2024 17:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732639214;
 bh=H/v4yAWQmJK84WcaX+V5Mgf8+PtcDdVCQ1VTXTwzh1o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EcLeM63VsovAPzD49zaNl9CFGxBYuMXM9Np9FglzJaoKLMk0NzX+4M1+DOIIVFkN2
 /C1YzyVxWuTCRV58efwbNrGLhzy7GEV79cHG3CNkefoV7LcFsj+A6Ju+ZaApReiTkH
 ukrWXiFahikM4kjeKZcTxGrN/l/FtH5m0Jnrs2A3y29h7Zr8+5uMiK7FAYoWTJLQ5j
 jPMfzqAViE2W96kwAPiAzpv+p4RnbupRNIi8QkBhElEbVKOVVeF6zhXEvz6aXxYeYu
 ZOUbiol+3iuCBBacrLk2jUK4UtPFbT/iN5UVtDfOEm0ncD6EyYcARn3IWpqRYJf97w
 t7q9x+ElNwKgA==
Message-ID: <1573c5d5-e52b-4954-8ca8-5594c266e4a4@denx.de>
Date: Tue, 26 Nov 2024 17:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
 <a17f2bf7-1ea3-4ba3-80a8-338623d9d888@denx.de>
 <20241126-splendid-amber-bobcat-164efa@houat>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241126-splendid-amber-bobcat-164efa@houat>
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

On 11/26/24 4:56 PM, Maxime Ripard wrote:
> On Tue, Nov 26, 2024 at 12:48:20AM +0100, Marek Vasut wrote:
>> On 11/22/24 2:32 PM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
>>>> The Pixel PLL is not very capable and may come up with wildly inaccurate
>>>> clock. Since DPI panels are often tolerant to slightly higher pixel clock
>>>> without being operated outside of specification, calculate two Pixel PLL
>>>> from either mode clock or display_timing .pixelclock.max , whichever is
>>>> higher. Since the Pixel PLL output clock frequency calculation always
>>>> returns lower frequency than the requested clock frequency, passing in
>>>> the higher clock frequency should result in output clock frequency which
>>>> is closer to the expected pixel clock.
>>>>
>>>> For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
>>>> without this patch is 65 MHz which is out of the panel specification of
>>>> 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
>>>> the specification and far more accurate.
>>>
>>> Granted that most of the panel drivers do not implement get_timings()
>>> and granted that there are no current users of that interface, I think
>>> we should move away from it (and maybe even drop it completely from
>>> drm_panel).
>>
>> It does fit DPI and LVDS panels and their descriptions in datasheets the
>> best.
>>
>>> What about achieving the same via slightly different approach: register
>>> a non-preferred mode with the clock equal to the max clock allowed. The
>>> bridge driver can then use the default and the "max" mode to select PLL
>>> clock.
>>>
>>> I understand that this suggestion doesn't follow the DPI panel
>>> specifics, which are closer to the continuous timings rather than fixed
>>> set of modes, however I really don't think that it's worth keeping the
>>> interface for the sake of a single driver. Original commit 2938931f3732
>>> ("drm/panel: Add display timing support") from 2014 mentions using those
>>> timings for .mode_fixup(), but I couldn't find a trace of the
>>> corresponding implementation.
>>>
>>> Another possible option might be to impletent adjusting modes in
>>> .atomic_check() / .mode_fixup().
>> Something like this ?
>>
>> static const struct display_timing chefree_ch101olhlwh_002_timing = {
>>    .pixelclock = { 68900000, 71100000, 73400000 },
>>    ...
>> };
>>
>> static const struct panel_desc chefree_ch101olhlwh_002 = {
>>    .timings = &chefree_ch101olhlwh_002_timing,
>>    .num_timings = 1,
>>    ...
>> };
>>
>> ... would turn into ...
>>
>> static const struct drm_display_mode chefree_ch101olhlwh_002_mode[3] = {
>>    {
>>      .clock = 68900000,
>>      ...
>>    }, {
>>      .clock = 71100000,
>>      ...
>>    }, {
>>      .clock = 73400000,
>>      ...
>>    }
>> };
>>
>> static const struct panel_desc chefree_ch101olhlwh_002 = {
>>    .modes = &chefree_ch101olhlwh_002_mode,
>>    .num_timings = 3,
>>    ...
>> };
>>
>> ?
> 
> Except that doesn't work if you want to keep your driver at the expected
> framerate. To reduce the pixel clock, you also need to reduce the
> blanking period within the acceptable boundaries if you want to keep the
> same framerate.
Each mode entry would have to have its own full set of timings of 
course, not just .clock . Those can be converted from display_timing 
just like clock.
