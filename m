Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3C9331BC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C432010E88B;
	Tue, 16 Jul 2024 19:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="q0USMCT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9930810E887
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 19:14:21 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0F4F2889A2;
 Tue, 16 Jul 2024 21:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1721157260;
 bh=mmOoNtMifyNh3gwO5Bznyup9l2PSjadJctOxhDaDhcI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=q0USMCT1ZQREO8WlmiJyWbXusvRtYVXPjAelMm0gGSMhbQbeIpYMx7S2zXgo4uABz
 iLgzY0noc+6WxtDPyHm31n3P0YJ9Pd75ZOVsv5OXWS85TB7lvMyZayYs5ffPqnbd9l
 akEytdfMouAFb1D7UITOEhWJAAOFOrLSPjblgA2n8f3uvRTnyYyaVwWjERIGvgAFKw
 IubO/3I4+9qgE96QTf2JRNtuqzvC7AswWnnbeL4TL1XXCoXgNxY/emB6liUHxVafSt
 sGKoCQZL4jf9K3vwXlAzw1QXZftGX2rzqXXeS4IZF9d9pJE2wdGsnnJSfgQ02e47ey
 imMiz3JOX03mA==
Message-ID: <bb151c91-128a-4734-b1a5-a91a1dea5e30@denx.de>
Date: Tue, 16 Jul 2024 20:47:27 +0200
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <D2NDK85U87AZ.2IL0CPIN04OEL@kernel.org>
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

On 7/12/24 9:16 AM, Michael Walle wrote:
> Hi Marek,

Hi,

>>>> Thank you for testing and keeping up with this. I will wait for more
>>>> feedback if there is any (Frieder? Lucas? Michael?). If there are no
>>>> objections, then I can merge it in a week or two ?
>>>
>>> I'll try to use your approach on the tc358775. Hopefully, I'll find
>>> some time this week.
>>
>> So ... I wonder ... shall I apply these patches or not ?
> 
> As mentioned on IRC, I tried it to port it for the mediatek DSI
> host, but I gave up and got doubts that this is the way to go. I
> think this is too invasive (in a sense that it changes behavior)

I would argue it makes the behavior well defined. If that breaks some 
drivers that depended on the undefined behavior before, those should be 
fixed too.

> and not that easy to implement on other drivers.

How so ? At least the DSIM and STM32 DW DSI host can switch lanes to 
LP11 state. Is the mediatek host not capable of that ?

> Given that this requirement is far more common across DSI bridges,
> I'd favor a more general solution which isn't a workaround.

I think we only had a look at the TI DSI83 / ICN6211 / Toshiba TC358767 
bridges, but we did not look at many panels, did we ? Do panels require 
lanes in non-LP11 state on start up ?

Was there any progress on the generic LP11 solution, I think you did 
mention something was in progress ? How would that even look like ?
