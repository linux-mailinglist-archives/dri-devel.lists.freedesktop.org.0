Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA4586E3F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 18:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8503C9370E;
	Mon,  1 Aug 2022 16:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328838B2B0
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 16:04:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 19AD780CF3;
 Mon,  1 Aug 2022 18:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659369894;
 bh=2vuaz6TtAMRZ+lCHQF9fQ+7LuYkGeNO+Ge3sIy9ibfI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WkacSSj4YAMS6krdfuL18BiFyxj3/E8y2vj62NXCzubBB/gVO+zW5mOovLW9L4UMA
 MR6K03mlJlzeoeOWU4ceQyIcNzVr5jmz/oCKY6cEFfMDAWacKtPXqBcW4DLRwgWt8H
 qB04H1L5T8ZJleVUoHgVwQrlvTcr8+KoTrBZhxLj/BKlu9HUtljIfv5A2C28ZGGWAe
 +SGQbHeqLOQbLfWQmFdIwABIZVLG3iMulN0rBieaYRFj5+H9hmQ949A+U0R0SRTpyv
 81DRNtNmZT6w+P4Jne4Xf4HyzEjHM4eRUFyaNT0kFO9k6uArZNplSA2wmAjMiY2fMD
 2Xp6DFFrng+lg==
Message-ID: <f1edd1a3-05d3-2476-f678-298aa145b71e@denx.de>
Date: Mon, 1 Aug 2022 18:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20220801131113.182487-1-marex@denx.de>
 <CAPY8ntCowWODtQtSHoPkjL2_XjVQCW8Fduutt3rYAZ=e9MZT_A@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAPY8ntCowWODtQtSHoPkjL2_XjVQCW8Fduutt3rYAZ=e9MZT_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/22 16:55, Dave Stevenson wrote:
> Hi Marek

Hi,

> On Mon, 1 Aug 2022 at 14:12, Marek Vasut <marex@denx.de> wrote:
>>
>> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
>> adjust DSI input frequency calculations such that they expect the DSI host
>> to configure HS clock according to hs_rate.
> 
> I think this falls into another of the areas that is lacking in the DSI support.
> hs_rate is defined as the *maximum* lane frequency in high speed
> mode[1]. As documented there is no obligation on the DSI host to
> choose this specific rate, just some frequency below it and above or
> equal to that required by the pixel clock. At a system level, the link
> frequency is often prescribed for EMC purposes.

The reduced upper limit could likely be defined by a DT property, but 
that's not hard to add.

> The issue is then that the SN65DSI83 is configured to use the DSI
> clock lane as the source for the PLL generating the LVDS clock,
> therefore with no route for the DSI peripheral to query the link
> frequency chosen by the host, you're stuck.

At least making the host pick the highest supported frequency means we 
have a well defined link frequency which either is accepted by both ends 
or not at all, instead of the current guesswork on both ends, bridge and 
host.

Regarding reduction of the maximum hs_rate, see above, probably use a DT 
property. Regarding check for hs_rate below minimum possible rate, 
likely something the DSI host should do based on desired mode .

If you are looking for some frequency negotiation starter, look at:
[RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS clock 
from DSI bridge

> SN65DSI83 also supports non-burst mode (as currently), so how would
> this be configured now?
> Does MIPI_DSI_MODE_VIDEO_BURST [2] oblige the DSI host to run in burst
> mode, or say that burst mode is supported by the peripheral?

My understanding is that it is the former -- if the flag is set, the DSI 
host must operate the device in burst mode.

> What if
> your DSI host doesn't support burst mode and it is optional on your
> peripheral?

The limit still applies. In the sync pulses mode, you can still run the 
link at high frequency, it's just that the DSI data lanes won't go into 
LP mode between bursts of data, they would stuff the link with NOPs 
instead, as far as I can tell.

> I raised these questions and others at [3], but largely got no real answers.
> 
> 
> The patch does exactly what you describe and has value, but without
> definition in the frameworks of exactly how burst mode must be
> implemented by the DSI host, I would say that it's going to cause
> issues.
> I am aware of users of your driver with the Raspberry Pi, but your
> expectation isn't currently valid on the Pi as there is no definition
> of the correct thing for the host to do.

This patch actually helped me deal with stability issues on MX8M . Of 
course, the DSIM driver has to handle the case where bridge provides 
hs_rate and configure its PLL accordingly. That's a two-liner patch.
