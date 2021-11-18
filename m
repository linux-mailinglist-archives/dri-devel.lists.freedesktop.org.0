Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB74455BF9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 13:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74006EA18;
	Thu, 18 Nov 2021 12:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5F6EA18
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 12:53:21 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E0B9482982;
 Thu, 18 Nov 2021 13:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637239999;
 bh=GhTn6ImZXrj8lYcgaYAGRkVx/7Bnm3VwQmY/VykctI4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QKtt/rWlAi10Jo65VBjNHlDOeofo/nOnXny5FMbeLLmWgFcQUGzt1RYffPgoxZ0+/
 aBmFc6uAZENZkBMGItcsRooXqTkxTRZt2I0hq0lIqbIlZMEj3Br63rg/kTEbCSL0J2
 Xo0UZzIUNsQcZXVSKxDwAcW718aj2TifxjmaNlchgOKHs0MRG2NBVZRvmuyn9jekg1
 ndc0FsBtAwTnwAKgUQOrzOwZ2b9A1MvHptLAGGHH137V5+yZnN0w+S7z2qyqo0SpSO
 Bfs0JA+LgslofYhCkl0CCtd6xCuqYcx3xjmB6DINDexNC4U6nAZG3Ch1Kpv3dhMLcy
 l/4uSGxJNt+Tw==
Subject: Re: RPI 7" display touch controller
To: Tim Harvey <tharvey@gateworks.com>, Eric Anholt <eric@anholt.net>
References: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <e927cb88-3c93-b6df-19f5-b60100fbaea7@denx.de>
Date: Thu, 18 Nov 2021 13:53:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU2A8J_72UgdoBw0Z0T0p1GzwWs-OK3UP14Y7KcoDjFOaQ@mail.gmail.com>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/21 2:25 AM, Tim Harvey wrote:
> Greetings,
> 
> I'm trying to get a RPI 7" touchscreen display working on an IMX8MM
> board and while I've been able to get the MIPI DSI display and
> backlight working I still can't seem to figure out the touch
> controller.
> 
> It's supposed to have an FT5406 controller on it without an interrupt
> so I added polling support drivers/input/touchscreen/edt-ft5x06.c
> which I was able to verify using another touchscreen with that
> controller but when reading data from the FT5406 on the RPI controller
> the data does not make sense.
> 
> These panels appear to route the I2C from the FT5406 to a STM32F103
> MPU that then provides a different I2C slave interface to the 15pin
> connector that I'm connected to. On that I2C interface I see an i2c
> slave at 0x45 which is managed by the regulator driver Marek wrote
> (drivers/regulator/rpi-panel-attiny-regulator.c) and there is also an
> i2c slave at 0x38 which I assumed was the FT5406 but I believe the MPU
> is perhaps obfuscating that touch data.
> 
> Anyone have any ideas on how to make that touch controller useful?

Look around:
https://github.com/dh-electronics/meta-dhsom-stm32-bsp/blob/dunfell-3.1/recipes-kernel/linux/linux-stable/5.10/dh-stm32mp1-dhsom/0038-ARM-dts-stm32-Add-AV96-DTO-for-DH-644-100-DSI-mezzan.patch
