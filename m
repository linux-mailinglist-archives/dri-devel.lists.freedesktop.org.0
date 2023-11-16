Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386F7EE8B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 22:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2A110E2CE;
	Thu, 16 Nov 2023 21:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763610E2CE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 21:15:27 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6EA258272A;
 Thu, 16 Nov 2023 22:15:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1700169321;
 bh=TvvkMBMlyUY0SY5KpfYFhTGR1XRZC3i/XR/JXDfax08=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lEPxXG0c1t1ZrLKpRttXddgjEzFgh/UK7wFcbOpKrTNsclC2Oddwj9flBtibYFmpZ
 sckPCzzV9vCPt4Rpt5YcbKgNGkO35knYmmBIwPo3eS8M6FvTTV7B40TNb9qYoK9ASc
 PJ1aqFeJHAI2lezi3hmU27hmLfeLNYVmVpvxBA6GU7QD2GMMffdnt5SaesqgwxLdbZ
 g6yqpnstDMX32LEpkbEVswnWGV7D6Q7y1VpWwZDjsMTcmo2T3uAA9+IiZcu4R7upzN
 sgNTqZ8L2jQugEx8u4IOl5KMvQUFI9cRXzEAioj5s69+IS6MkbMoUy6hxmEm1dT3Or
 0bkciFIvuJi7Q==
Message-ID: <c8c0d672-a26b-49fc-9cad-4b16e19dd947@denx.de>
Date: Thu, 16 Nov 2023 22:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: simple: Fix Innolux G101ICE-L01 timings
To: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org
References: <20231008223256.279196-1-marex@denx.de>
 <8137a960-bb6d-4520-88d8-03ee701a0138@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <8137a960-bb6d-4520-88d8-03ee701a0138@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/9/23 11:01, Neil Armstrong wrote:
> Hi,
> 
> On 09/10/2023 00:32, Marek Vasut wrote:
>> The Innolux G101ICE-L01 datasheet [1] page 17 table
>> 6.1 INPUT SIGNAL TIMING SPECIFICATIONS
>> indicates that maximum vertical blanking time is 40 lines.
>> Currently the driver uses 29 lines.
>>
>> Fix it, and since this panel is a DE panel, adjust the timings
>> to make them less hostile to controllers which cannot do 1 px
>> HSA/VSA, distribute the delays evenly between all three parts.
>>
>> [1] 
>> https://www.data-modul.com/sites/default/files/products/G101ICE-L01-C2-specification-12042389.pdf
>>
>> Fixes: 1e29b840af9f ("drm/panel: simple: Add Innolux G101ICE-L01 panel")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/panel/panel-simple.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-simple.c 
>> b/drivers/gpu/drm/panel/panel-simple.c
>> index 7ce51ad616296..44c11c418cd56 100644
>> --- a/drivers/gpu/drm/panel/panel-simple.c
>> +++ b/drivers/gpu/drm/panel/panel-simple.c
>> @@ -2295,13 +2295,13 @@ static const struct panel_desc 
>> innolux_g070y2_t02 = {
>>   static const struct display_timing innolux_g101ice_l01_timing = {
>>       .pixelclock = { 60400000, 71100000, 74700000 },
>>       .hactive = { 1280, 1280, 1280 },
>> -    .hfront_porch = { 41, 80, 100 },
>> -    .hback_porch = { 40, 79, 99 },
>> -    .hsync_len = { 1, 1, 1 },
>> +    .hfront_porch = { 30, 60, 70 },
>> +    .hback_porch = { 30, 60, 70 },
>> +    .hsync_len = { 22, 40, 60 },
>>       .vactive = { 800, 800, 800 },
>> -    .vfront_porch = { 5, 11, 14 },
>> -    .vback_porch = { 4, 11, 14 },
>> -    .vsync_len = { 1, 1, 1 },
>> +    .vfront_porch = { 3, 8, 14 },
>> +    .vback_porch = { 3, 8, 14 },
>> +    .vsync_len = { 4, 7, 12 },
>>       .flags = DISPLAY_FLAGS_DE_HIGH,
>>   };
> 
> Looks ok, I'll wait for a few days before applying if someone wants to 
> test it.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Maybe it is time to apply ?
