Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5523400A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7A46E9EC;
	Fri, 31 Jul 2020 07:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C676E956
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 19:37:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BHgg247Bxz1rwbX;
 Thu, 30 Jul 2020 21:37:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BHgg22p5pz1qxnL;
 Thu, 30 Jul 2020 21:37:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id qN7xWSpyjaYq; Thu, 30 Jul 2020 21:37:49 +0200 (CEST)
X-Auth-Info: 5qJRtwiXFw4qe9sJGcJeVrTbHbUfgVxhwNSX9d6eXI4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 30 Jul 2020 21:37:49 +0200 (CEST)
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight driver
 for RPi panel
To: Mark Brown <broonie@kernel.org>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
 <20200730191300.GJ5055@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
Message-ID: <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
Date: Thu, 30 Jul 2020 21:37:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730191300.GJ5055@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/30/20 9:13 PM, Mark Brown wrote:
> On Thu, Jul 30, 2020 at 06:28:07PM +0200, Marek Vasut wrote:
>> On 7/30/20 5:59 PM, Sam Ravnborg wrote:
>>> On Wed, Jul 29, 2020 at 11:46:45PM +0200, Marek Vasut wrote:
> 
>>>> This regulator/backlight driver handles the ATTINY88 present on the
>>>> RPi 7" touchscreen panel and exposes the power/backlight interfaces.
> 
>>> It looks strange that the regulator and the backligth are defined in the
>>> same module like this.
> 
>> It's one chip, attiny with custom firmware, what do you want me to do
>> about it ? I can over-complicate this and split it into multiple
>> drivers, but I don't think it's worth the complexity, considering that
>> this is likely a one-off device which will never be re-used elsewhere,
>> except on this one particular display module for RPi.
> 
> Now you've written that you've pretty much guaranteed someone's going to
> use the same component elsewhere :)

How? The firmware is closed and not available, neither is documentation
for it, sadly.

> I think my main question would be that if this is going to be written
> like this shouldn't it be a backlight driver rather than a regulator
> driver?

Well no, because it enables power to the display backlight and TC358762
DSI-to-DPI bridge first, and then also controls some PWM implementation
in the attiny firmware later on. So I think it has to be regulator, as
that is the primary function. The backlight is somewhat secondary.

> I don't 100% follow how this would actually get used in a
> system (perhaps the binding would help) but for these things if there's
> only one tightly coupled user that's possible it's sometimes simpler to
> just skip APIs and do things directly.

That's what I'm trying to replace by this patch and tc358762 bridge
driver and panel driver, the combined version is already in tree:
drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
but the tc358762 is clearly a generic bridge and the panel is generic
too, so combining it into one panel driver doesn't seem right.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
