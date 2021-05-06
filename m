Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11864375C6F
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 22:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659D46EDBF;
	Thu,  6 May 2021 20:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5EF6EDBF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 20:51:34 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D87DA82CF3;
 Thu,  6 May 2021 22:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620334292;
 bh=Qlgw/zJ1mlSvjCPgpk6zmUAsbVyye0JiIHR3CntzYPw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FNKYcod6syJhoZZ+hUGQhrD0BdEWkERTYi8amXjjE45kSRDdQ7kxaMwdDp2NCrgzS
 M47AYQ6faTzVIYTWKIN+wIVLbIwqFIMPxNz391iCDxsJFkB/66KaEnQLQTlew2M/RZ
 7U7RySYL9WS9vAFAd0Upg4Enlr91O/WNwrxlQHGsYLpndnoB6s/ofwehVYjbKMEGq/
 0J+o3OaaCPSCwlG/o9THl9n0gkLoEkM7vN+MfAoDoYKz2+xczFWReCMF9uzAhaGAxF
 lG1VVldE65sIwqV4MLgK8NTc1ll57HgIZ+SNQrl1g43aWn1QeQz0fSYd8I6IIGiVIn
 tK5iAqFDzt5cA==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <2655a86a-d371-6a5a-715a-53b73a696d28@kontron.de>
 <7da2c2d2-fb02-0a1b-d853-bfd756a0cd9b@denx.de>
 <61e269b7-870a-01a8-722b-15c9aecf9bf9@kontron.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <8985230f-cb0a-43ca-f8f7-66898f85dc2b@denx.de>
Date: Thu, 6 May 2021 22:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <61e269b7-870a-01a8-722b-15c9aecf9bf9@kontron.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/21 6:03 PM, Frieder Schrempf wrote:
> On 06.05.21 17:46, Marek Vasut wrote:
>> On 5/6/21 5:38 PM, Frieder Schrempf wrote:
>> [...]
>>> Works on i.MX8MM with SN65DSI84 and a single link LVDS display (1024x600) and from my perspective everything else also looks good. Thanks for your work!
>>>
>>> I have two remarks:
>>>
>>> 1. In my test I couldn't get it to work with four DSI lanes enabled (only with two) but I'm quite sure that the DSIM driver is to blame as everything on the bridge level looks good (also setting the DSI EQ register didn't help as you suggested, Marek).
>>
>> I suspect there is indeed something with the DSIM going on, I'll keep you posted if I find something out.
>>
>>> 2. When I set MEDIA_BUS_FMT_RGB888_1X7X4_SPWG in the panel driver I get distorted colors. I need to use MEDIA_BUS_FMT_RGB888_1X24 to make it work, but this is not valid for LVDS. Again I don't think this driver is to blame as I can't see where it does anything wrong, but my experience here is very limited so I still want to mention it.
>>
>> Hmm, in that conversion supposed to happen in this bridge driver or should MXSFB handle the SPWG pixel format ? Or should the DSIM bridge do something about that ?
> 
> As far as I understand it the conversion is already done by the DSI84 without any extra configuration necessary. The only thing that needs to be done is selecting the LVDS output format via CHx_24BPP_MODE and CHx_24BPP_FORMAT1 which the driver currently hardcodes to 24bpp aka MEDIA_BUS_FMT_RGB888_1X7X4_SPWG. I think the DSI input format is always 24bpp aka MEDIA_BUS_FMT_RGB888_1X24.

The DSI is MEDIA_BUS_FMT_RGB888_1X24, yes.

So maybe this bridge driver has to somehow deal with 
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ? Except I haven't seen such a thing 
implemented in other bridge drivers, so input would be welcome on this.

> So I wonder where the format actually is evaluated. Could it be that it is passed down to the LCDIF and changes its output format which causes the data passed by DSIM to the DSI84 to already be in the SPWG format? If that's the case we maybe need a way to specify MEDIA_BUS_FMT_RGB888_1X24 as input bus format for the DSI84 so it doesn't pass on the panel's format? Only a wild guess, no idea if it really works like that.

I _think_ the bridge must somehow handle the 
MEDIA_BUS_FMT_RGB888_1X7X4_SPWG <-> MEDIA_BUS_FMT_RGB888_1X24 conversion.
