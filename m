Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68109D8F6C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 01:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5276810E14C;
	Tue, 26 Nov 2024 00:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="w/UQ0/QK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6C210E14C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 00:05:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9CCF489A09;
 Tue, 26 Nov 2024 01:05:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1732579518;
 bh=AsiU1qJ//SGgbWjdoDOk2xR3Bajycc2iQ+bASl7zVGs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=w/UQ0/QK2PKkDVuz7KhZ1QD8qJAQFLzT5uTqf2W/ZLvjzVKyu0lQj9DK4xiWPfCMG
 5/zJyFjj8+N5Jmu4cwdpdjU49jg3fSqWOyubtgzW95dKbiZpqJVcMmLutHEon2cDjY
 oJbGACYhlAEIKM20sy+uXRU4h7DvID9CejwusjRXaAHEJsxMN+e5PxmX6QcsFrdWw8
 hFiL4lZXTYmVUo8tIDNLrFZfMkItvLByLtzaqxp2CAMNnzLhQAQK3hQkqUN3PHZ2G3
 gaw/f0zSFn4W+fFTJ1X/lox68brOOnQj1C264CBHCD76MErrngNQ2jYegBNtxgfsp0
 HtZNuABHZs8sg==
Message-ID: <e0b71238-1cca-41e8-97a8-8587e3b424ea@denx.de>
Date: Tue, 26 Nov 2024 00:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
 <20241125-nondescript-grouse-of-joy-c22dbf@houat>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241125-nondescript-grouse-of-joy-c22dbf@houat>
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

On 11/25/24 2:17 PM, Maxime Ripard wrote:
> On Fri, Nov 22, 2024 at 03:32:57PM +0200, Dmitry Baryshkov wrote:
>> On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
>>> The Pixel PLL is not very capable and may come up with wildly inaccurate
>>> clock. Since DPI panels are often tolerant to slightly higher pixel clock
>>> without being operated outside of specification, calculate two Pixel PLL
>>> from either mode clock or display_timing .pixelclock.max , whichever is
>>> higher. Since the Pixel PLL output clock frequency calculation always
>>> returns lower frequency than the requested clock frequency, passing in
>>> the higher clock frequency should result in output clock frequency which
>>> is closer to the expected pixel clock.
>>>
>>> For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
>>> without this patch is 65 MHz which is out of the panel specification of
>>> 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
>>> the specification and far more accurate.
>>
>> Granted that most of the panel drivers do not implement get_timings()
>> and granted that there are no current users of that interface, I think
>> we should move away from it (and maybe even drop it completely from
>> drm_panel).
> 
> I think we should do the opposite :)
> 
> Panels usually have a pretty large operating window, and the current
> construct only works because nobody really uses the same panels (or
> we're hiding that behind different compatibles) across SoCs or
> generation. Or we're working around it.

I am using the same panels on NXP MX6/MX8 and STM32MP1 with wildly 
different pipeline setups too.

> It's kind of a mess, and it gets messy in encoders too: some will filter
> out panel modes, some won't. Some will adjust timings to fit their
> clocks, some won't. etc.
> 
> Going forward, switching everyone to a timing-like interface and
> providing a set of helpers to adjust timings within possible boundaries
> to fit a clock rate is doable and should be done imo.
Maybe it would be better to have multiple modes and mark them with 
MIN/TYP/MAX flag , so at least there wouldn't be two sets of structures 
describing the same thing, but only one structure (drm_display_mode) ?
