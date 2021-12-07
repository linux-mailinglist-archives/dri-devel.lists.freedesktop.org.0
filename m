Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062E246C0E3
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 17:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8CAEB339;
	Tue,  7 Dec 2021 16:43:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D71EB337
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 16:43:35 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B9D3080F81;
 Tue,  7 Dec 2021 17:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1638895413;
 bh=rVIe4eDSNI1gIN6twXwrpD8lCxjRwQkBIGKM/DhrxoM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EN24eBBkTEs5MRTXdHw4/oU39OvqI20DsXsVAuBa2yobtxVnU1HDizX1bXTp9Kjuq
 tjfGKT1rHztKMjdG04Z6WchWLOEZZJDtc0sAdZWmYzeHwe/ATcLnAHNEZ1y8lNkHFx
 p25n0fWlPxhFjMwt/c51sMfHvA/FbGPUmaLgYU/mTKkEmMD0ciuf0fRnE8YEsEkQkS
 RWcmuLss+YNH6aPMACZjUGe3Zb8rUgj3S4FKUZ7l3Z6r96S43CqWXzf/I3oUDraBY1
 uWrZd8BwuJYgCGFjBlcHV89PqsR5gOCPOVWdjMjFbmc9Z+FYlh+Fq2dcYMzt6/zSLz
 0D3x/hS58oHXA==
Message-ID: <a1bafca8-5b77-f106-5c70-80b1ae548fd6@denx.de>
Date: Tue, 7 Dec 2021 17:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/4] drm/bridge: tc358767: Move hardware init to enable
 callback
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-2-marex@denx.de>
 <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
 <77d26622-843b-1009-b331-5834d2d195d6@denx.de>
 <CAPY8ntBd1o-OpXAUf3s-OHCHrJ2VOt0HVn9sGOcXRd_2kUYG3g@mail.gmail.com>
 <4ed56b2f-7d00-60bf-180b-fcf13b0ec107@denx.de>
 <CAPY8ntAknr+8STQj8C7uP2+X_FRNGAhUbZw9jT5vmMVh62rfRw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntAknr+8STQj8C7uP2+X_FRNGAhUbZw9jT5vmMVh62rfRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/7/21 17:28, Dave Stevenson wrote:

Hi,

[...]

>>>>> Secondly the datasheet states that the DSI Reference Clock Source
>>>>> Division Selection is done by the MODE1 pin, and switches between
>>>>> HSCKBY2 divided by 7 and HSCKBY2 divided by 9. There is a stated
>>>>> assumption that HSCK is either 364MHz or 468MHz, thereby ending up
>>>>> with 26MHz. To do this we have to be running DSI in burst mode, but
>>>>> the support for that in DRM is near zero.
>>>>
>>>> Yes, you have to run the DSI clock lane at either of the two clock
>>>> frequencies, that is rather limiting. The DSI has to be running in
>>>> continuous clock mode, this has nothing to do with burst mode, the burst
>>>> mode is a DSI host setting which is supported by most DSI hosts.
>>>
>>> OK burst mode is technically dropping the lane to LP mode, and you
>>> don't need that state transition.
>>>
>>> To quote the Toshiba datasheet:
>>> "As the clock derived from the
>>> DSICLK has to be fixed at 13, 26, 19.2 or 38.4 MHz, the DSI Host may
>>> need to run DSI clock lane at
>>> higher frequency than needed by frame rate and may have to send the
>>> DSI video mode transmissions in
>>> burst mode (explained in DSI section of this specification) "
>>>
>>> So where are you configuring the DSI clock lane to be running at one
>>> of those frequencies? Or are you requiring your panel to be running
>>> with a matching pixel clock?
>>
>> This is a preparatory patch, so nowhere yet. I forced the clock lane to
>> the required clock frequency on the DSI host side thus far. You can
>> still configure the chip to derive clock from Xtal, even with DSI as
>> data input.
> 
> Ah, I'd read too much into the commit text and read it as already
> fully implemented with a DSI derived clock instead of refclk. Sorry.
> 
> Are you already working on the infrastructure changes, or are they
> just vaguely planned?

I plan to implement those changes, when I have time to do that.
