Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81E21BC59
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 19:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0A6E422;
	Fri, 10 Jul 2020 17:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A6F6E422
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:35:36 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A9B5E20021;
 Fri, 10 Jul 2020 19:35:34 +0200 (CEST)
Date: Fri, 10 Jul 2020 19:35:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: BACKLIGHT
 CLASS/SUBSYSTEM
Message-ID: <20200710173533.GD17565@ravnborg.org>
References: <20200708163847.15250-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708163847.15250-1-grandmaster@al2klimov.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8 a=sozttTNsAAAA:8 a=977SQLHdAAAA:8
 a=5_BfxKqGAAAA:8 a=e5mUnYsNAAAA:8 a=KDW8W4m8GVoiedxZWeEA:9
 a=tJonOg-6uS59dqR-:21 a=N2so1Rmw42j4sEnq:21 a=CjuIK1q_8ugA:10
 a=W4TVW4IDbPiebHqcZpNg:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=X9mgP9w9NIdro0Z1KHhB:22 a=zA12qxjMqGZfkbtkWw8c:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander.

On Wed, Jul 08, 2020 at 06:38:47PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.
> 
> 
>  drivers/video/backlight/led_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 3f66549997c8..2c48957e9b60 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
> + * Copyright (C) 2015-2019 Texas Instruments Incorporated -  https://www.ti.com/
>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>   *
>   * Based on pwm_bl.c

$grep http drivers/video/backlight/*
drivers/video/backlight/cr_bllcd.c: * Intel funded Tungsten Graphics (http://www.tungstengraphics.com) to
drivers/video/backlight/ili9320.c: *	http://armlinux.simtec.co.uk/
drivers/video/backlight/ili9320.h: * http://armlinux.simtec.co.uk/
drivers/video/backlight/led_bl.c: * Copyright (C) 2015-2019 Texas Instruments Incorporated -  http://www.ti.com/
drivers/video/backlight/vgg2432a4.c: *	http://armlinux.simtec.co.uk/

Why are they not covered?

	Sam


> -- 
> 2.27.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
