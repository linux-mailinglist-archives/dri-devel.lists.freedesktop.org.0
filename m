Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359264561B7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 18:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32526EA9A;
	Thu, 18 Nov 2021 17:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFBB26EA9A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 17:44:41 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 768EE82982;
 Thu, 18 Nov 2021 18:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637257479;
 bh=QIYkDXA4yBwSB+FUfRNs7Ct5WjMFulavy1LRwuhgb+0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=z36BMBR8gYP8raRQEtFILxiFBXXdCnyBepJC3SfM/Wm+PgdncpT/4ixgLavDwisFA
 iQdX3MoDQRa5yj553keabtz/EL/2kYiliUuXvypCkwRggl9xrEK2c2fvHagOUKB0Qa
 v8fxtwrne4HjmNl9BWgY9PUcyGXibhRrFrL7jdrD8AVtACQq6D0WoCWLzcxo3JSaBn
 xLBYNI3dZXCb9mybkJH2FRNxZKHnlIjqiLhFR3lzTyA7hXjp2ErDTAEm6igs2WMcJI
 F7tGm3E72/ZMSo25Ph5gC+VBOYXy0RJPydsVrCiJLtGi4ObalaZyQEhXSLqWakxknC
 aG2BrRNkh9i3w==
Subject: Re: RPI 7" display touch controller
To: Tim Harvey <tharvey@gateworks.com>
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
 <e927cb88-3c93-b6df-19f5-b60100fbaea7@denx.de>
 <CAJ+vNU3BwYmXHJfoH9OfcN=_4vNzpL6uLVhDqjQsTZCNd75qfg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <5c3e738d-22ee-42c2-8fb5-0c2da83c566b@denx.de>
Date: Thu, 18 Nov 2021 18:44:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU3BwYmXHJfoH9OfcN=_4vNzpL6uLVhDqjQsTZCNd75qfg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Eric Anholt <eric@anholt.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/21 6:02 PM, Tim Harvey wrote:
> On Thu, Nov 18, 2021 at 4:53 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 11/18/21 2:25 AM, Tim Harvey wrote:
>>> Greetings,
>>>
>>> I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
>>> board and while I've been able to get the MIPI DSI display and
>>> backlight working I still can't seem to figure out the touch
>>> controller.
>>>
>>> It's supposed to have an FT5406 controller on it without an interrupt
>>> so I added polling support drivers/input/touchscreen/edt-ft5x06.c
>>> which I was able to verify using another touchscreen with that
>>> controller but when reading data from the FT5406 on the RPI controller
>>> the data does not make sense.
>>>
>>> These panels appear to route the I2C from the FT5406 to a STM32F103
>>> MPU that then provides a different I2C slave interface to the 15pin
>>> connector that I'm connected to. On that I2C interface I see an i2c
>>> slave at 0x45 which is managed by the regulator driver Marek wrote
>>> (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
>>> i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
>>> is perhaps obfuscating that touch data.
>>>
>>> Anyone have any ideas on how to make that touch controller useful?
>>
>> Look around:
>> https://github.com/dh-electronics/meta-dhsom-stm32-bsp/blob/dunfell-3.1/recipes-kernel/linux/linux-stable/5.10/dh-stm32mp1-dhsom/0038-ARM-dts-stm32-Add-AV96-DTO-for-DH-644-100-DSI-mezzan.patch
> 
> Marek,
> 
> Thanks. This dt overlay actually disables the touchscreen controller
> with a note that the IRQ must be hooked up to work. Did you actually
> wire up an IRQ and get it to work? I implemented polling mode for the
> controller but the data did not make sense.

The touchscreen IRQ line is accessible on some pin header on the 7" 
display control board I think, so you can attach it manually to your 
development board that way. I have a new version of that AV96 adapter 
board here now, I just didn't get to assembling it yet ... so, feel free 
to add that one IRQ patchwire and try it.

> This dt overlay also interests me as I am also wanting to get some
> overlays in the kernel tree [1]. I'm curious if you have any thoughts
> on why there are currently no overlays in the mainline tree.
> 
> 1 - https://lore.kernel.org/linux-arm-kernel/20211115202426.16114-1-tharvey@gateworks.com/T/

It would be nice to upstream the DTOs, I think the reason why they're 
not upstream is because the DTO support is still incomplete, but I might 
be wrong. Thanks for pointing this patch out, I'll keep an eye on it.
