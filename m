Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127535045E4
	for <lists+dri-devel@lfdr.de>; Sun, 17 Apr 2022 03:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD6610E651;
	Sun, 17 Apr 2022 01:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D18F10E64F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Apr 2022 01:05:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 45DBC83DB7;
 Sun, 17 Apr 2022 03:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1650157529;
 bh=Zw8uyHpdBvyNe/4pjFZsuknKBS9rcElGtu6vHQwHthE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xmIDyyFLz8JUUxwPqo8QhurWFRb8EmW5wJqR/r3Gf2R2hZAN9z7hscJc8i7t+xWzI
 HHxHEie3T7LSfrYMtYbPj7MAQ6KhtDkNEbEJm5uLM3pTTH8KRIxq9ELKPqm7Hxxn/u
 Vs1RrkIf6sE+MxJYZ9yV8HMBXuYQDPvmca8rCdyDzH4pBZcS1CVMs9KfYN+StgPew+
 Y/fyKd4tvwP5A1bQazacJ8F37Fjk0OYG4G6S/RZhAGqSQRhHHSHh/zh2D/KuL16q1k
 wM3Tdz5QRV9IKrJBiNSgFj+4sX5LOrWi7bmFIOPXRoqnguT4cYMHqONSCaob4Y2IBP
 0MNdV8sEZGrHQ==
Message-ID: <d6ec333b-8be0-84ad-ee33-faedae624a24@denx.de>
Date: Sun, 17 Apr 2022 03:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/7] drm: mxsfb: Simplify LCDIF clock handling
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220311170601.50995-1-marex@denx.de>
 <fe732f785a4c58f6225f72f5c420d4abc611553c.camel@pengutronix.de>
 <893aa689-d6f3-234f-693d-d31872697d92@denx.de>
 <2d0493d54f629608f014f6ffed4428fccde7a6a5.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2d0493d54f629608f014f6ffed4428fccde7a6a5.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/7/22 09:57, Lucas Stach wrote:
> Am Mittwoch, dem 06.04.2022 um 23:45 +0200 schrieb Marek Vasut:
>> On 4/6/22 21:32, Lucas Stach wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> Am Freitag, dem 11.03.2022 um 18:05 +0100 schrieb Marek Vasut:
>>>> The current clock handling in the LCDIF driver is a convoluted mess.
>>>
>>> Here we agree...
>>>
>>>> Implement runtime PM ops which turn the clock ON and OFF and let the
>>>> pm_runtime_get_sync()/pm_runtime_put_sync() calls in .atomic_enable
>>>> and .atomic_disable callbacks turn the clock ON and OFF at the right
>>>> time.
>>>>
>>>> This requires slight reordering in mxsfb_crtc_atomic_enable() and
>>>> mxsfb_crtc_atomic_disable(), since all the register accesses must
>>>> happen only with clock enabled and clock frequency configuration
>>>> must happen with clock disabled.
>>>>
>>> ... on that one I don't. Please don't move the pixel clock into the RPM
>>> calls. We have a very well defined point between atomic enable/disable
>>> where the pixel clock is actually needed. All the other configuration
>>> accesses don't need the pixel clock to be active.
>>
>> On the other hand, "all the other" configuration happens during probe,
>> at which point all the clock are enabled anyway. And then during
>> runtime, the pixel clock of this IP are either enabled or this IP is
>> completely shut down.
>>
>> So, where exactly does this patch make the clock handling any worse than
>> it currently is ?
>>
> There is an even stronger argument: runtime PM does not guarantee that
> the runtime_suspend is actually called after you put your last
> reference. A simple "echo on > /sys/your-device/power/control" will
> prevent the device from ever entering runtime suspend. So if you have a
> clock like the pixel clock that _needs_ to be disabled for
> configuration purposes you _must_ not handle this clock via RPM, but
> via explicit clock handling in the driver.

OK, patch discarded.
