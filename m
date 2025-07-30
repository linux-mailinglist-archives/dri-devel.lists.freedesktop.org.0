Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48729B15693
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 02:34:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111710E34A;
	Wed, 30 Jul 2025 00:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PdriTaZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F5710E354
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 00:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oI1HU+X2QvkDN0X8D2sP6JUwO9r6yHAwSbZ+2hPxM+4=; b=PdriTaZxIYLp8N+JmOkJIyZ8uY
 CkZ37+ffpV6jmPXbEdlI+eP9zSei+Y1gWM5+FdVUAF5qQBJ+bSXB0Nx1LLHcfQeeCbJjB7rFn9rYg
 OoKjUvFJLXs2GQf7zl1qD0Ats7iaetNko37mLQPolyAEc8C0kzCfx0yO6xRIMNT1lm/X8p9J0ahlM
 ejKy5O13L+9maPJ0cfs+ffoSgafq7+jxftN6rHV8nGsZR9u1wwWIjcUi0tAoKLd/jboQje2Q5qyAz
 auzdMXeBeot60SrHm2RAUF8G+FFJhXoP7q1NKNpdk2AYD1t/dp3w1HPQ+J19Kdn1Gr3DandlS6PR3
 /K2iymHw==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ugulb-005gEJ-Qz; Wed, 30 Jul 2025 02:34:00 +0200
Message-ID: <38d12f53-8c8a-4713-b1f9-0e8ffdf71f98@igalia.com>
Date: Tue, 29 Jul 2025 21:33:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
 <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
 <20250729-tall-fluffy-grouse-f5deec@houat>
 <1bc23ad0-7273-4ddf-a0ef-4a80186f2581@igalia.com>
 <20250729-whispering-accelerated-raptor-134e8a@houat>
 <b8c0f9be-a57e-49b3-8113-cbb9307facd9@igalia.com>
Content-Language: en-US
In-Reply-To: <b8c0f9be-a57e-49b3-8113-cbb9307facd9@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 29/07/25 13:19, Maíra Canal wrote:
> Hi Maxime,
> 
> On 29/07/25 09:14, Maxime Ripard wrote:
>> On Tue, Jul 29, 2025 at 08:53:51AM -0300, Maíra Canal wrote:
>>> Hi Maxime,
>>>
>>> On 29/07/25 04:27, Maxime Ripard wrote:
>>>> Hi Maíra,
>>>>
>>>> On Mon, Jul 28, 2025 at 09:35:38AM -0300, Maíra Canal wrote:
>>>>> Currently, when we prepare or unprepare RPi's clocks, we don't 
>>>>> actually
>>>>> enable/disable the firmware clock. This means that
>>>>> `clk_disable_unprepare()` doesn't actually change the clock state at
>>>>> all, nor does it lowers the clock rate.
>>>>>
>>>>>   From the Mailbox Property Interface documentation [1], we can see 
>>>>> that
>>>>> we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
>>>>> off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
>>>>> prepare and an unprepare hook for RPi's firmware clock.
>>>>>
>>>>> As now the clocks are actually turned off, some of them are now marked
>>>>> with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
>>>>> early boot or are required during reboot.
>>>>
>>>> What difference is there between the CLK_IGNORE_UNUSED and
>>>> CLK_IS_CRITICAL clocks?
>>>
>>>  From my understanding, CLK_IGNORE_UNUSED will prevent the clock to be
>>> gated during boot (on "clk: Disabling unused clocks"), but after it, the
>>> clock can be gated.
>>>
>>> With CLK_IS_CRITICAL, the clock will never be disabled.
>>
>> Yeah, that's correct.
>>
>>> For example, RPI_FIRMWARE_M2MC_CLK_ID is used by vc4. It needs to be
>>> enabled at boot (I tested; if not enabled, it won't boot). However,
>>> after vc4 is probed, we would like vc4 to have control of it and be able
>>> to unprepare it in `vc4_hdmi_runtime_suspend()`. If I set it as
>>> CLK_IS_CRITICAL, vc4 won't be able to unprepare it.
>>
>> If the clock can be disabled by Linux, but it breaks some drivers if
>> it's not enabled during their probe, something is fishy somewhere, and
>> it's likely it would be just as broken if you compiled the driver as a
>> module.
>>
>> Even then, some of the other clocks should probably never be disabled,
>> like the CPU clock.
> 
> I'll mark RPI_FIRMWARE_ARM_CLK_ID and RPI_FIRMWARE_CORE_CLK_ID as
> critical. Are there any other clocks you think should never be disabled?
> 
>>
>>> I only set RPI_FIRMWARE_PIXEL_BVB_CLK_ID as critical, as, otherwise, the
>>> RPi won't reboot.
>>
>> Why?
> 
> I'll have to dig a bit into vc4 HDMI code and to investigate the reason
> (and maybe fix the issue there).

After some investigation, I believe that those display-related should be
set to CLK_IGNORE_UNUSED. It's not that it breaks some drivers if not
enabled, but it breaks hardware functionality and the device won't boot.
See, for example, clk-bcm2835 in which all PLL and PLL dividers clocks
are marked with CLK_IGNORE_UNUSED and some with CLK_IS_CRITICAL.

Maybe Dave has some input about the topic?

So far, I'm planing to keep CLK_IGNORE_UNUSED to the display-related
clocks and remove CLK_IS_CRITICAL from RPI_FIRMWARE_PIXEL_BVB_CLK_ID. If
you have any objections about it, let me know.

Best Regards,
- Maíra

> 
> Best Regards,
> - Maíra
> 

