Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04B0587000
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 20:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504439790F;
	Mon,  1 Aug 2022 18:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2332F97416
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 18:00:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6D0B983F8E;
 Mon,  1 Aug 2022 20:00:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1659376828;
 bh=EPj1QILCayNQZNDOCe76WCgsnaQo4Vs6xBhkeQeqnxM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MhPY2ayYfAQ4Rc1knotX2zsImJX7SRAAvlP1Kw0VD+Ai7mZ/p8rm85Kv4ROZnmYk6
 B+b2gCERqmG7/bcM401TaqxiW0jINokXcZAhXmR9MwPZG7auRVN0TZZSP2Vt4aMNiK
 x+Kz8o5IBimzDLDrEnB1vqxuLiO0VaPHvh1cXtnt/9mRcc/yZMrKfov9RkMU+Jrthk
 lvmSyRdkPB+GRIl6eQEnF3gh6NlkWeKxRzbeC7H0MZaM/18Ht3tvzmExoJYuJcd9ZM
 es0y4/IEO20ZTHrS9pvmvxIWTNwv+8Rlamv1SSrUt3Yzs1EcLnTf0z8n+/znGeIFMa
 WuWHLpe2NJRRw==
Message-ID: <ab159c20-1b68-4349-3c0f-0812089953ef@denx.de>
Date: Mon, 1 Aug 2022 20:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Add and use hs_rate and lp_rate
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
References: <20220801131113.182487-1-marex@denx.de>
 <CAPY8ntCowWODtQtSHoPkjL2_XjVQCW8Fduutt3rYAZ=e9MZT_A@mail.gmail.com>
 <f1edd1a3-05d3-2476-f678-298aa145b71e@denx.de>
 <CAHCN7x+_f4SpXZfdEbdb=v8bYmwHtZU1R1MH7TjAfbky=+qWfw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7x+_f4SpXZfdEbdb=v8bYmwHtZU1R1MH7TjAfbky=+qWfw@mail.gmail.com>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/1/22 18:38, Adam Ford wrote:
> On Mon, Aug 1, 2022 at 11:05 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 8/1/22 16:55, Dave Stevenson wrote:
>>> Hi Marek
>>
>> Hi,
>>
>>> On Mon, 1 Aug 2022 at 14:12, Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
>>>> adjust DSI input frequency calculations such that they expect the DSI host
>>>> to configure HS clock according to hs_rate.
>>>
>>> I think this falls into another of the areas that is lacking in the DSI support.
>>> hs_rate is defined as the *maximum* lane frequency in high speed
>>> mode[1]. As documented there is no obligation on the DSI host to
>>> choose this specific rate, just some frequency below it and above or
>>> equal to that required by the pixel clock. At a system level, the link
>>> frequency is often prescribed for EMC purposes.
>>
>> The reduced upper limit could likely be defined by a DT property, but
>> that's not hard to add.
>>
>>> The issue is then that the SN65DSI83 is configured to use the DSI
>>> clock lane as the source for the PLL generating the LVDS clock,
>>> therefore with no route for the DSI peripheral to query the link
>>> frequency chosen by the host, you're stuck.
>>
>> At least making the host pick the highest supported frequency means we
>> have a well defined link frequency which either is accepted by both ends
>> or not at all, instead of the current guesswork on both ends, bridge and
>> host.
>>
>> Regarding reduction of the maximum hs_rate, see above, probably use a DT
>> property. Regarding check for hs_rate below minimum possible rate,
>> likely something the DSI host should do based on desired mode .
>>
>> If you are looking for some frequency negotiation starter, look at:
>> [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host HS clock
>> from DSI bridge
>>
>>> SN65DSI83 also supports non-burst mode (as currently), so how would
>>> this be configured now?
>>> Does MIPI_DSI_MODE_VIDEO_BURST [2] oblige the DSI host to run in burst
>>> mode, or say that burst mode is supported by the peripheral?
>>
>> My understanding is that it is the former -- if the flag is set, the DSI
>> host must operate the device in burst mode.
>>
>>> What if
>>> your DSI host doesn't support burst mode and it is optional on your
>>> peripheral?
>>
>> The limit still applies. In the sync pulses mode, you can still run the
>> link at high frequency, it's just that the DSI data lanes won't go into
>> LP mode between bursts of data, they would stuff the link with NOPs
>> instead, as far as I can tell.
>>
>>> I raised these questions and others at [3], but largely got no real answers.
>>>
>>>
>>> The patch does exactly what you describe and has value, but without
>>> definition in the frameworks of exactly how burst mode must be
>>> implemented by the DSI host, I would say that it's going to cause
>>> issues.
>>> I am aware of users of your driver with the Raspberry Pi, but your
>>> expectation isn't currently valid on the Pi as there is no definition
>>> of the correct thing for the host to do.
>>
>> This patch actually helped me deal with stability issues on MX8M . Of
> 
> I have a board with the SN65DSI83 and I have been testing Jagan's DSIM
> patch series and I noticed the SN65DSI83  throws a PLL timeout error.
> What kind of stability issues were you seeing?   I'll try to pull in
> this patch, and I'm happy to test and reply with 'Tested-by' if it
> works.

You need to make sure the DSIM generates these 500 MHz HS clock (PLL at 
1 GHz, P/M/S 3/125/0 I think). I still use the older DSIM driver with 
this kind of patch:

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index ddadce208d38b..11f6aaf741466 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1593,6 +1593,19 @@ static int samsung_dsim_host_attach(struct 
mipi_dsi_host *host,
         dsi->format = device->format;
         dsi->mode_flags = device->mode_flags;

+       /*
+        * In case the nearest bridge specifies DSI HS clock rate and 
supports
+        * DSI burst mode, run the DSI link at highest supported DSI HS 
clock
+        * frequency to achieve the shortest transfer bursts, longest 
time in
+        * LP mode between bursts, and thus most power efficient transfer.
+        *
+        * Note that the DSIM PLL runs at 2x HS clock rate.
+        */
+       if (device->hs_rate && (device->mode_flags & 
MIPI_DSI_MODE_VIDEO_BURST))
+               dsi->burst_clk_rate = 2 * device->hs_rate;
+       if (device->lp_rate)
+               dsi->esc_clk_rate = device->lp_rate;
+
