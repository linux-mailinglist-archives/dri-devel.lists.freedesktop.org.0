Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC24E1D20C9
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630F56EA81;
	Wed, 13 May 2020 21:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 92472 seconds by postgrey-1.36 at gabe;
 Wed, 13 May 2020 21:18:59 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3CE6EA81
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:18:59 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id B3200600853CB;
 Wed, 13 May 2020 21:19:02 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Wed, 13 May 2020 23:18:12 +0200
Message-ID: <264902885.ydkeYsQTE4@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <c34fe43b-51c4-0231-7a41-77d5c703e9ba@baylibre.com>
References: <1940005.XIBaf5lNV5@jeremy>
 <c34fe43b-51c4-0231-7a41-77d5c703e9ba@baylibre.com>
MIME-Version: 1.0
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday 13. May 2020 09.37.49 Neil Armstrong wrote:
> Hi Paul,
> 
> I'm one of the drm/bridge maintainer and, with Jernel & Jonas, we did most
> of the changes on the dw-hdmi driver recently for the Amlogic, Rockchip &
> Allwinner platforms.

Thanks for following up to my message!

> On 12/05/2020 21:37, Paul Boddie wrote:
> > 
> > When powering up the system with the driver built into the kernel, the
> > driver is able to obtain mode information over DDC using the Synopsys
> > peripheral's own I2C support (which is more reliable than using the
> > JZ4780's I2C peripherals), and a viable list of modes is obtained.
> 
> Can you run the kernel with drm debug enabled ? drm.debug=0x3f for example
> you'll have all the modes checks & so on

I'll try and do this.

[...]

> Please use the "modetest" utility from the libdrm source package, it will
> list all the available mode and permit testing other modes.

I'll give this a try. The modetest program was suggested by someone else as 
well, so it seems to be the way to go.

> > At the moment, I and others who have tried to test this code have seen
> > that
> > the peripheral is not enabled (as confirmed by inspecting the appropriate
> > entry under /sys/devices/platform). It appears that one obstacle is that
> > the "bus format" is not set for the connector. Here, I noticed (and was
> > reminded again recently) that in the bridge driver, there is no call to
> > drm_display_info_set_bus_formats unlike in other bridge drivers.
> 
> This call is optional, if your video pipeline outputs RGB for the dw-hdmi,
> then you can leave the default for now and omit the bus format negotiation.
> When you'll push the driver, you'll have to implement it correctly like I
> did in the meson-dw-hdmi glue (and in RFC for rockchip driver).

I'll have a look at the meson code. Frustratingly, I am familiar with the LCD 
controller functionality on the SoC family concerned here, but how it 
interacts with the DRI/DRM functionality isn't particularly clear.

The Ingenic DRM driver seems to define support for a number of plane formats 
(XRGB1555, RGB565, XRGB8888) which correspond to output modes for the LCD 
controller set using its control register.

The driver also supports a number of bus formats (RGB565_1X16, RGB666_1X18, 
RGB888_1X24, RGB888_3X8) that correspond to panel configurations set using its 
configuration register.

However, nothing in the driver sets the bus format (or plane format), meaning 
that something else needs to do so. I see that the input bus format is set in 
the bind function in meson_dw_hdmi.c, and seems to be set in the attach 
function in other comparable drivers.

This is why I wondered whether the generic Synopsys driver might be missing 
such an operation, but it is also plausible that it could be performed in the 
specialised JZ4780 driver, although I currently provide few functions in that 
driver and maybe more customisation is needed.

[...]

> "Input not supported" means the timings/clk are incorrect.
> 
> Of you had an format issue, you'll have incorrect colors/garbled output.

Note that this is with a modification to set drm_display_info_set_bus_formats. 
Without it, initialisation fails to complete, as noted previously. With it, I 
imagine that the timings are indeed wrong.

[...]

> Please enable the dw-hdmi debug prints and enable the DRM debug prints to
> check if everything is negociated.

I will try and generate debugging information.

> But if you have "Input not supported" on your monitor, this means you have
> TMDS going out on your hardware, which is good, this means all the
> power/reset/system clocks are ok.
> This could mean you have a timing/clock issue, please check if something is
> not done on the pixel clock before going to the dw-hdmi block.

I think I may have overlooked timing details, so this will also be a focus of 
mine as I review what I have done so far.

Thanks once again for the advice!

Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
