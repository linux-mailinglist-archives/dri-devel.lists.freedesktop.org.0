Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4E234026
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DA86EA01;
	Fri, 31 Jul 2020 07:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 159318 seconds by postgrey-1.36 at gabe;
 Thu, 30 Jul 2020 16:28:10 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40036E920
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 16:28:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BHbS9292bz1rsXc;
 Thu, 30 Jul 2020 18:28:09 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BHbS90wMTz1qspJ;
 Thu, 30 Jul 2020 18:28:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id uUNSfkwkvont; Thu, 30 Jul 2020 18:28:08 +0200 (CEST)
X-Auth-Info: ifWBBodGONwSplkvX+4rvwmmHS9lEFcwfU9O6WpLOuU=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 30 Jul 2020 18:28:07 +0200 (CEST)
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight driver
 for RPi panel
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
Date: Thu, 30 Jul 2020 18:28:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730155944.GA1477410@ravnborg.org>
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
Cc: Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/30/20 5:59 PM, Sam Ravnborg wrote:
> Hi Marek

Hi,

> On Wed, Jul 29, 2020 at 11:46:45PM +0200, Marek Vasut wrote:
>> This regulator/backlight driver handles the ATTINY88 present on the
>> RPi 7" touchscreen panel and exposes the power/backlight interfaces.
[...]
> It looks strange that the regulator and the backligth are defined in the
> same module like this.

It's one chip, attiny with custom firmware, what do you want me to do
about it ? I can over-complicate this and split it into multiple
drivers, but I don't think it's worth the complexity, considering that
this is likely a one-off device which will never be re-used elsewhere,
except on this one particular display module for RPi.

> The usual approach is to have an independent regulator and an
> independent backlight. Each are represented by their own node in the DT.
> 
> Also the compatible "raspberrypi,7inch-touchscreen-panel-regulator",
> is unknown. We need a binding for the compatible.

I submitted the patch as RFC to get feedback on how to handle this, so
yes, there are no DT bindings, that's on the todo.

> For backlight drivers, and modules that includes backlight support it
> would be good to include the backlight gang in cc:
> Jingoo, Lee, Daniel.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
