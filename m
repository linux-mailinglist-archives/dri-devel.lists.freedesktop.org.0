Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E0193352F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 03:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA2210E0A1;
	Wed, 17 Jul 2024 01:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="I0xvivch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE29410E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 01:46:18 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1999F886FD;
 Wed, 17 Jul 2024 03:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1721180777;
 bh=SIMwKRvV8YCOAI9dBJELEx8YYzsPGY4yUHHOm3Q7OHE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I0xvivchHBlIqyPGS5qlMXfOL4KrDxFVMU2lZ2v4e66kjNjlI+lvYAHw89zm9nm5D
 35xqUaSWBqPxJ9VkGNzDWfcwTKbIcT5joomCLMGXp3uvPxqfwg8WvHSWgBZ/asdCsb
 bHaQUBJnZDQpCe6RSFsET1soW7a4xU6fb83JmlNS9Yx7pFrfXD6agE6KZVdRCeiPw6
 1CCo3JeFged51bxmlhTBGm6h0lTWphvwIlhRIcXx2PgsPB8YS6e0KxGw8smKu8aIbU
 20u0ds/9XDM5HPGFo3HhpReRv0gpLyNcA0YJuhPxH/sntkdbdPzPoL44ZLPzx27ofK
 rFrDJklpR1Fdg==
Message-ID: <aa732a7e-6519-4ded-bc26-acf76304f6de@denx.de>
Date: Wed, 17 Jul 2024 03:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm: bridge: samsung-dsim: Initialize bridge on
 attach
To: Michael Walle <mwalle@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
References: <20240625122824.148163-1-marex@denx.de>
 <4603431.cEBGB3zze1@steina-w> <f90aa303-f18b-4cca-bb7a-f94f74dfee36@denx.de>
 <D29SIGP58O7E.3AJ5VRGQ4I1VN@kernel.org>
 <1867bfd6-ad00-46a7-8bad-4a4441d9854c@denx.de>
 <D2NDK85U87AZ.2IL0CPIN04OEL@kernel.org>
 <bb151c91-128a-4734-b1a5-a91a1dea5e30@denx.de>
 <D2R83VFPUWE3.3MBX3LQOCDFWA@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <D2R83VFPUWE3.3MBX3LQOCDFWA@kernel.org>
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

On 7/16/24 9:50 PM, Michael Walle wrote:
>>>>>> Thank you for testing and keeping up with this. I will wait for more
>>>>>> feedback if there is any (Frieder? Lucas? Michael?). If there are no
>>>>>> objections, then I can merge it in a week or two ?
>>>>>
>>>>> I'll try to use your approach on the tc358775. Hopefully, I'll find
>>>>> some time this week.
>>>>
>>>> So ... I wonder ... shall I apply these patches or not ?
>>>
>>> As mentioned on IRC, I tried it to port it for the mediatek DSI
>>> host, but I gave up and got doubts that this is the way to go. I
>>> think this is too invasive (in a sense that it changes behavior)
>>
>> I would argue it makes the behavior well defined. If that breaks some
>> drivers that depended on the undefined behavior before, those should be
>> fixed too.
> 
> Then this behavior should be documented (and accepted) in the
> corresponding section:
> https://docs.kernel.org/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation

I think so too.

> This will help DSI host driver developers and we can point all the
> host DSI driver maintainers to that document along with the proper
> implementation :)
> 
>>> and not that easy to implement on other drivers.
>>
>> How so ? At least the DSIM and STM32 DW DSI host can switch lanes to
>> LP11 state. Is the mediatek host not capable of that ?
> 
> The controller is certainly capable to do that. But the changes
> seems pretty invasive to me and I fear some fallout. Although it's
> basically just one line for the DSIM, you seem to be moving the init
> of the DSIM to an earlier point(?). I'm no expert with all the DRM
> stuff, so I might be wrong here.

I am moving some of the initialization to an earlier point, but only 
enough of it to configure the lanes to LP11 state before the next 
bridge(s) start to (pre)enable themselves. And the DSIM controller is 
RPM suspended again after the lanes are in LP11.

>>> Given that this requirement is far more common across DSI bridges,
>>> I'd favor a more general solution which isn't a workaround.
>>
>> I think we only had a look at the TI DSI83 / ICN6211 / Toshiba TC358767
>> bridges, but we did not look at many panels, did we ? Do panels require
>> lanes in non-LP11 state on start up ?
> 
> I'm not talking about panels, just bridges. It's not just one bridge
> with a weird behavior but most bridges.

What do you refer to by "weird behavior" ? It seems the DSI bridges we 
looked at all required data lanes in LP11 state on start up one way or 
the other, didn't they ?

>> Was there any progress on the generic LP11 solution, I think you did
>> mention something was in progress ? How would that even look like ?
> 
> I had a new callback implemented:
> https://lore.kernel.org/r/20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org/
> 
> Not sure if that's any better though.

Wouldn't that callback be called by various controllers at various 
stages of initialization , without consistency on when that callback 
will be called ? That would be my concern.

At least here, the expectation is that the controller would put data 
lanes into LP11 before the next bridge can even pre_enable itself , 
which is not perfect though, because if a bridge needs DSI clock to 
probe() itself and then data lanes in LP11 to probe itself, that is a 
really bad situation (and the TC358767 is capable of being used that 
way, although this is currently not supported by the kernel driver and 
there is no real interest in supporting it).
