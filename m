Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22903BACB6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 12:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B3A89DD2;
	Sun,  4 Jul 2021 10:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030889DD2
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 10:12:13 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CC557800AA;
 Sun,  4 Jul 2021 12:12:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625393532;
 bh=9kOrV/MIiWAgNo8HnvQ77rFtfOxRQq8J1tRX+hh9AQc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i7+UX4sDJfcfBSmGyoIww40PMcvrfTK3KVA5H5SufhcnnZbGffFHrPeYWIMJCm6dW
 4zDmTGx4PXI4qxHXLVXiqpuUT8+Z4UDn3qMQw+KMeoiXediKh5uGPftLJvpt4+A6eR
 y/rjare4f/kqu1+wnoqd+U/MQ+ZLHyQ240dsPY9T625cPquQ20p7SyCM44jbpb7tPQ
 JDbsrKN+ADrEWltaGnnoo/6ScS6deW9KFtm2SxDOaSFTGmsTVcKyPuaJtLWSUCNvLt
 tdrnjJq/Ddyie7jatOkgRM8RE9VSDI1BtI1+DMBIZ4p+RqDSA8nBazeValbnr1QJ9P
 moibnAWAn6GHg==
Subject: Re: [PATCH] drm: mxsfb: Support 24-bit SPWG, JEIDA bus formats
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20210704093857.27961-1-jagan@amarulasolutions.com>
 <bc7f2d6f-f47b-6099-b6d0-4bdd2728dc52@denx.de>
 <CAMty3ZB_XoRNXLJcjVYr9odNs5+tJFSpMAv2t6dmpeX2HjzqxA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <43244769-840f-1049-c9c4-821bb0ee5abe@denx.de>
Date: Sun, 4 Jul 2021 12:12:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZB_XoRNXLJcjVYr9odNs5+tJFSpMAv2t6dmpeX2HjzqxA@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/4/21 11:57 AM, Jagan Teki wrote:
> Hi Marek,
> 
> On Sun, Jul 4, 2021 at 3:23 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/4/21 11:38 AM, Jagan Teki wrote:
>>> 24-bit SPWG, JEIDA bus formats are considered as 24-bit
>>> bus widths for LCDC_CTRL register in mxsfb.
>>>
>>> Add support for it.
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>    drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> index 22cb749fc9bc..5657155f9633 100644
>>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>>> @@ -85,6 +85,8 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
>>>                ctrl |= CTRL_BUS_WIDTH_18;
>>>                break;
>>>        case MEDIA_BUS_FMT_RGB888_1X24:
>>> +     case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
>>> +     case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
>>
>> On MX8MM/MN, the bus between LCDIF and DSIM is plain parallel bus, so
>> this patch is wrong.
> 
> Unsure since these flags are setting from panel side.

On MX8MM/MN, the panel is NOT connected directly to the LCDIF. There is
LCDIF->(DPI bus)->DSIM bridge->(DSI bus)->DSI-to-LVDS-bridge->(LVDS 
bus)->LVDS panel
It is the DSI bus past DSIM that is coming out of the SoC.

>> You want to pick
>> drm: mxsfb: Use bus_format from the nearest bridge if present
>> and then implement .atomic_get_input_bus_fmts on all your bridges. And
>> only then you will get the correct MEDIA_BUS_FMT_RGB888_1X24 here.
> 
> I did pick this patch along with all your mxsfb recent changes, but
> issue still persist. It work only when I set the LCDC_CTRL explicitly
> like the patch does.

You must implement .atomic_get_input_bus_fmts on all your bridges .
Then the format gets propagated correctly.

Look at e.g.
drm/bridge: ti-sn65dsi83: Replace connector format patching with 
atomic_get_input_bus_fmts
same thing applies to the DSIM, and possibly whatever other bridge you 
might have in the LCDIF->...->LVDS panel path.
