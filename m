Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6B3AD692B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 09:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E30B10E783;
	Thu, 12 Jun 2025 07:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="YtJi7zzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2819010E783
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 07:35:05 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C7YotS2803952;
 Thu, 12 Jun 2025 02:34:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1749713690;
 bh=y+SxmXMBIixJUqhr8/6PjgF8JavGa38wPXzRB7ZzE+4=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=YtJi7zztG8qGrLoiEpIHXrR7NNwIW74ihmj+1Ln0ANs3v0Ctz7EyOwlio7GUUXLLg
 us6sf76kipjOu7Xwg5+EQ652EJv/G/xFfsrQrHTwSTqcDQLoEVG/JGG2fnsfjHAmv+
 /PNcNqJme7i3Fo/tsGCtX/7Wd2+gKxQqFtH0h0/g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C7YnZv2392385
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 12 Jun 2025 02:34:49 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Jun 2025 02:34:49 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 12
 Jun 2025 02:34:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Jun 2025 02:34:49 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.14])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C7YibL1802508;
 Thu, 12 Jun 2025 02:34:45 -0500
Message-ID: <affbef6e-f253-4dbb-bf64-3cc7d244acbb@ti.com>
Date: Thu, 12 Jun 2025 13:04:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: fix REFCLK setting
To: Michael Walle <mwalle@kernel.org>, Doug Anderson <dianders@chromium.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250528132148.1087890-1-mwalle@kernel.org>
 <CAD=FV=WfV1Kr5hFSqf=t0OS3qFSGfQ3_+LQ-57nMKHXRSYvZ-w@mail.gmail.com>
 <9272e36e-e764-4007-9d9e-8e09b9c08d34@ti.com>
 <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <c0027ff0e63bcc0fd21aab37af991baf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hello Michael,

On 10/06/25 12:45, Michael Walle wrote:
> Hi Jayesh,
> 
>>>> +       /*
>>>> +        * After EN is deasserted and an external clock is detected, 
>>>> the bridge
>>>> +        * will sample GPIO3:1 to determine its frequency. The 
>>>> driver will
>>>> +        * overwrite this setting. But this is racy. Thus we have to 
>>>> wait a
>>>> +        * couple of us. According to the datasheet the GPIO lines 
>>>> has to be
>>>> +        * stable at least 5 us (td5) but it seems that is not 
>>>> enough and the
>>>> +        * refclk frequency value is lost/overwritten by the bridge 
>>>> itself.
>>>> +        * Waiting for 20us seems to work.
>>>> +        */
>>>> +       usleep_range(20, 30);
>>>
>>> It might be worth pointing at _where_ the driver overwrites this
>>> setting, or maybe at least pointing to something that makes it easy to
>>> find which exact bits you're talking about.
> 
> Yeah, Jayesh just pointed that out below. I'll add add it to the comment.
> 
>>> This looks reasonable to me, though.
>>
>> I think we are talking about SN_DPPLL_SRC_REG[3:1] bits?
> 
> Yes.
> 
>> What exact mismatch are you observing in register value?
> 
> The one set by the chip itself vs the one from the driver, see below.
> 
>> I am assuming that you have a clock at REFCLK pin. For that:
> 
> Yes, I'm using an external clock.
> 
>> If refclk is described in devicetree node, then I see that
>> the driver modifies it in every resume call based solely on the
>> clock value in dts.
> 
> Exactly. But that is racy with what the chip itself is doing. I.e.
> if you don't have that usleep() above, the chip will win the race
> and the refclk frequency setting will be set according to the
> external GPIOs (which is poorly described in the datasheet, btw),
> regardless what the linux driver is setting (because that I2C write
> happens too early).

I am a little confused here.
Won't it be opposite?
If we have this delay here, GPIO will stabilize and set the register
accordingly?

In the driver, I came across the case when we do not have refclk.
(My platform does have a refclk, I am just removing the property from
the dts node to check the affect of GPIO[3:1] in question because clock
is not a required property for the bridge as per the bindings)

In the ti_sn65dsi86_probe(), before we read SN_DEVICE_ID_REGS,
when we go to resume(), we do not do enable_comms() that calls
ti_sn_bridge_set_refclk_freq() to set SN_DPPLL_SRC_REG.
I see that register read for SN_DEVICE_ID_REGS fails in that case.

Adding this delay fixes that issue. This made me think that we need
the delay for GPIO to stabilize and set the refclk.

Is my understanding incorrect?

I am totally on board with your change especially after observing the
above but is my understanding incorrect somewhere?

Warm Regards,
Jayesh

> 
>> If refclk is not described in dts, then this register is modified by the
>> driver only when pre_enable() calls enable_comms(). Here also, the
>> value depends on crtc_mode and the refclk_rate often would not be equal
>> to the values in "ti_sn_bridge_dsiclk_lut" (supported frequencies), and
>> you would fallback to "001" register value.
> 
>> Rest of time, I guess it depends on reading the status from GPIO and
>> changing the register.
> 
> Not "rest of the time", the reading of the strapping option from the
> GPIO always happens if an external refclk is detected. It's part of
> the chip after all. It will just sometimes be overwritten by the
> linux driver.
> 
>> Is the latter one your usecase?
> 
> My use case is that the GPIO setting is wrong on my board (it's really
> non-existent) and I'm relying on the linux driver to set the correct
> frequency.
> 
> HTH,
> -michael
