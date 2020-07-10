Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FC21E8E8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA106E904;
	Tue, 14 Jul 2020 07:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.al2klimov.de (smtp.al2klimov.de
 [IPv6:2a01:4f8:c0c:1465::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D579B6ECCA
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 18:15:42 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id E2427BC0CB;
 Fri, 10 Jul 2020 18:15:38 +0000 (UTC)
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: BACKLIGHT
 CLASS/SUBSYSTEM
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200708163847.15250-1-grandmaster@al2klimov.de>
 <20200710173533.GD17565@ravnborg.org>
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <71396370-b68d-1409-fa08-0020c6417f34@al2klimov.de>
Date: Fri, 10 Jul 2020 20:15:38 +0200
MIME-Version: 1.0
In-Reply-To: <20200710173533.GD17565@ravnborg.org>
Content-Language: en-US
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
Cc: daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lee.jones@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.07.20 um 19:35 schrieb Sam Ravnborg:
> Hi Alexander.
Hi,

> 
> On Wed, Jul 08, 2020 at 06:38:47PM +0200, Alexander A. Klimov wrote:
>> Rationale:
>> Reduces attack surface on kernel devs opening the links for MITM
>> as HTTPS traffic is much harder to manipulate.
>>
>> Deterministic algorithm:
>> For each file:
>>    If not .svg:
>>      For each line:
>>        If doesn't contain `\bxmlns\b`:
>>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>>              If both the HTTP and HTTPS versions
>>              return 200 OK and serve the same content:
>>                Replace HTTP with HTTPS.
>>
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>> ---
>>   Continuing my work started at 93431e0607e5.
>>   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>>   (Actually letting a shell for loop submit all this stuff for me.)
>>
>>   If there are any URLs to be removed completely or at least not HTTPSified:
>>   Just clearly say so and I'll *undo my change*.
>>   See also: https://lkml.org/lkml/2020/6/27/64
>>
>>   If there are any valid, but yet not changed URLs:
>>   See: https://lkml.org/lkml/2020/6/26/837
>>
>>   If you apply the patch, please let me know.
>>
>>
>>   drivers/video/backlight/led_bl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
>> index 3f66549997c8..2c48957e9b60 100644
>> --- a/drivers/video/backlight/led_bl.c
>> +++ b/drivers/video/backlight/led_bl.c
>> @@ -1,6 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
>> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  https://www.ti.com/
>>    * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>    *
>>    * Based on pwm_bl.c
> 
> $grep http drivers/video/backlight/*
> drivers/video/backlight/cr_bllcd.c: * Intel funded Tungsten Graphics (http://www.tungstengraphics.com) to
> drivers/video/backlight/ili9320.c: *	http://armlinux.simtec.co.uk/
> drivers/video/backlight/ili9320.h: * http://armlinux.simtec.co.uk/
> drivers/video/backlight/led_bl.c: * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
> drivers/video/backlight/vgg2432a4.c: *	http://armlinux.simtec.co.uk/
> 
> Why are they not covered?
Didn't check them, but likely because they're new.

Don't worry, I'll do a second scan once the results of this one get into 
master.

> 
> 	Sam
> 
> 
>> -- 
>> 2.27.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
