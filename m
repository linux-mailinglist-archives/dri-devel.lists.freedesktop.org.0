Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72A53757D5
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E96E1EC;
	Thu,  6 May 2021 15:46:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544A66E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 15:46:47 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4D05582D1B;
 Thu,  6 May 2021 17:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1620316005;
 bh=obwxuuGWXxyHjyila9pa6NPBO86RVoz8FIBy7tWioBU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UjZTPFNYTHMrtN6mgDVAEYrWkzGfvRKYgajiBxRc3VODo31jjnQhaQrqRW3Sn3//s
 ydjcq1d1gjQjpYjDBxuT309pQnTpM4lEiT0T6qOmdZCRM9Sm+6n0qn3fmzUawAjpBv
 YvOvfPplNnyoX+78fbNlLZ9GlPdOOua1lPFWFDFvwv9fbWMAocM5rjIruek3w2qRxo
 vIhSuz+6o+LSdfuGc4sfigHPaSxebJZ5kFwjqZ7tuafzzIosjSbFMRTIy6IIEDegOn
 vC4yw6RJxfS1SrFohLdEonsfOl8TZUHcdDPsnx1/TWxIEnA741H4Y+fhE8JjIt9Yh2
 GBJJyiHoGvTqg==
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 dri-devel@lists.freedesktop.org
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <2655a86a-d371-6a5a-715a-53b73a696d28@kontron.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <7da2c2d2-fb02-0a1b-d853-bfd756a0cd9b@denx.de>
Date: Thu, 6 May 2021 17:46:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <2655a86a-d371-6a5a-715a-53b73a696d28@kontron.de>
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

On 5/6/21 5:38 PM, Frieder Schrempf wrote:
[...]
> Works on i.MX8MM with SN65DSI84 and a single link LVDS display (1024x600) and from my perspective everything else also looks good. Thanks for your work!
> 
> I have two remarks:
> 
> 1. In my test I couldn't get it to work with four DSI lanes enabled (only with two) but I'm quite sure that the DSIM driver is to blame as everything on the bridge level looks good (also setting the DSI EQ register didn't help as you suggested, Marek).

I suspect there is indeed something with the DSIM going on, I'll keep 
you posted if I find something out.

> 2. When I set MEDIA_BUS_FMT_RGB888_1X7X4_SPWG in the panel driver I get distorted colors. I need to use MEDIA_BUS_FMT_RGB888_1X24 to make it work, but this is not valid for LVDS. Again I don't think this driver is to blame as I can't see where it does anything wrong, but my experience here is very limited so I still want to mention it.

Hmm, in that conversion supposed to happen in this bridge driver or 
should MXSFB handle the SPWG pixel format ? Or should the DSIM bridge do 
something about that ?
