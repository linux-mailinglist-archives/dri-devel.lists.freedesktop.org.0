Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0A24F3554
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 15:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5934F10E11A;
	Tue,  5 Apr 2022 13:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BECE10E11A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 13:49:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8EF9383B53;
 Tue,  5 Apr 2022 15:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1649166591;
 bh=ZKpAN8TrJ5z3CFgGFOLfxrTIAxYGAJYuVT8dVZVJHdc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lgh+AtvoZQgvSPUTTsEvkXfwWmQEagJC75GlR0SvHoQVwF458iUZUb2c2ITc+ZyWO
 pkix29ZMa6/6zYnN64qP8p2geP9Ve32yZQ9IKJhjwAnx+eYDKRKmfH/DKI1TVEfhXN
 fM7gf/qIc3DtBV4DWX/GE6udqUPgoNviPN8uZRkM4qvfylZGRn5SQlXEnwS9P98Iuk
 3QCC3JoKqEV37XC8VOQiVBIOOkR1wmm8jOrX+4Aar7nX/0JpBBXR+taiH2Mhq88xph
 Q/6BF2HAQ2mi5wBUP/7fFittt99sUKDiHQoHqZn4TYx1a5UQc0bOnTMwDegGPJpUTv
 YsUsJZo0WX/uA==
Message-ID: <2b6df0ac-d429-7d49-60e8-727f8c135671@denx.de>
Date: Tue, 5 Apr 2022 15:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
 <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
 <Ykw/NEI03rXJ+C9Y@pendragon.ideasonboard.com>
 <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntC5RQ4pq=Bf5Z+Vi-NhD6boGnEixjporJSKgR=AaUrEpw@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/5/22 15:25, Dave Stevenson wrote:
> On Tue, 5 Apr 2022 at 14:08, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> Hi Dave,
>>
>> On Tue, Apr 05, 2022 at 01:00:28PM +0100, Dave Stevenson wrote:
>>> On Tue, 5 Apr 2022 at 12:42, Laurent Pinchart wrote:
>>>> On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
>>>>> In rare cases, the bridge may not start up correctly, which usually
>>>>> leads to no display output. In case this happens, warn about it in
>>>>> the kernel log.
>>>>
>>>> Do you know what this is caused by ? It's a bit annoying to add a 10+ms
>>>> delay at start time just to be notified of rare cases.
>>>
>>> The datasheet [1] section 7.4.2 Initialization Sequence states in step 2
>>> "After power is applied and stable, the DSI CLK lanes MUST be in HS
>>> state and the DSI data lanes MUST be driven
>>> to LP11 state"
>>> Data lanes shouldn't go to HS until step 8 after the DSI83 has been configured.
>>>
>>> Configuration from the driver is being done from atomic_enable,
>>> therefore the data lanes are likely in HS mode and sending video, not
>>> LP11.
>>>
>>> Deviate from the specified initialisation sequence at your peril!
>>>
>>> The SN65DSI8[3|4|5] is one of the DSI devices that I'd been looking at
>>> with the DSI ordering patches [2] so that we could initialise it in
>>> the way specified in the datasheet. I've had no responses to v2 of
>>> those patches though.
>>
>> Sounds like I need to review that :-) It's still in my queue, I'll try
>> to push it to the top.
>>
>> Do you think this patch could then be reverted ?
> 
> If we can initialise the DSI host before the bridge for the
> pre_enable, then all the configuration moves to the atomic_pre_enable
> and there should be no need to have the delay.
> 
> I can't 100% guarantee that, but one of the folks on the Pi forums is
> using [1] which does that, and is reporting it working well. (He's
> also using the DSI85 to take 2 DSI links and drive 2 LVDS single link
> panels)

It seems to me that checking whether the bridge got correctly 
initialized is orthogonal to the aforementioned patchset though ?
