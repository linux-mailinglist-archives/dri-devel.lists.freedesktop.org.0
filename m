Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D5D21533A
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631A66E30F;
	Mon,  6 Jul 2020 07:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 327 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jul 2020 00:03:14 UTC
Received: from mailrelay3.webfaction.com (mailrelay3.webfaction.com
 [207.38.93.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E6989FF7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 00:03:14 +0000 (UTC)
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by mailrelay3.webfaction.com (Postfix) with ESMTPS id 39D942A50EF
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jul 2020 23:57:43 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 304026005B36D;
 Sun,  5 Jul 2020 23:57:37 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Mon, 06 Jul 2020 01:57:32 +0200
Message-ID: <7086465.UhkgK7rEtT@jason>
In-Reply-To: <1689d947-b2e1-c023-b2ed-1e9d23c075f3@baylibre.com>
References: <1940005.XIBaf5lNV5@jeremy> <1660901.RzKB6nuZHq@jeremy>
 <1689d947-b2e1-c023-b2ed-1e9d23c075f3@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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

Hello,

On Friday, 15 May 2020 09:43:54 CEST Neil Armstrong wrote:
> 
> On 15/05/2020 00:04, Paul Boddie wrote:
> > 
> > Well, I've done this but I probably need to know what to look for. One
> > thing that appears regardless of this debugging output being enabled is a
> > problem with the vertical blanking functionality:
> > 
> > WARNING: CPU: 1 PID: 396 at drivers/gpu/drm/drm_atomic_helper.c:1457
> > drm_atomic_helper_wait_for_vblanks+0x1ec/0x25c
> > [CRTC:32:crtc-0] vblank wait timed out
> 
> This means the CRTC didn't start, usually because the Pixel clock didn't go
> through the pipeline to the pixel generator, thus not generating
> vblank/vsync interrupts.
> 
> You may check if there is not muxes to select the clock source/pixel
> destination.

It has obviously been a while since I asked about the DW-HDMI functionality. 
Since then, I have verified the initialisation of the Ingenic JZ4780 LCD 
controller and the Synopsys HDMI peripheral in the L4 Runtime Environment 
(running on the Fiasco.OC microkernel), producing a picture and handling 
display interrupts.

Having brought the necessary changes back to the Ingenic DRM driver, I can 
make the driver activate the LCD controller and produce vertical blank 
interrupts, and these are handled and counted in /proc/interrupts. The 
previous errors about timeouts are now gone.

However, the DRM driver can only be made to start if I set the bus format in 
dw_hdmi_bridge_attach:

  u32 bus_format[] = { MEDIA_BUS_FMT_RGB888_1X24 };
  ...
  drm_display_info_set_bus_formats(&connector->display_info,
                                   bus_format, ARRAY_SIZE(bus_format));

Without this, the DRM driver will test for a bus format on the connector's 
display_info structure in ingenic_drm_encoder_atomic_check and return EINVAL. 
There have previously been indications that this should not need to be done, 
but I see that other drivers do similar things (for example, ti-tfp410.c).

It also seems to be appropriate to set the input_bus_format on the platform-
specific HDMI driver; otherwise, I doubt that appropriate bus encodings will 
be chosen in the Synopsys driver.

[...]

> > Attempting to set a mode using...
> > 
> > modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
> > 
> > ...yields the following:
> > 
> > failed to set mode: Permission denied
> > setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
> 
> This is weird, the command line is ok, is it the same for all modes ?

Testing against 5.8-rc3 with the above changes seems to have moved the needle 
slightly. Although I still get "Input not supported" from my monitor, running 
modetest now gives a different error:

modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02

...now yields this:

setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
failed to set gamma: Invalid argument

There also seems to be a card1, but I get the same result with that, and they 
both seem to produce similar output with modetest without the -s option.

Anyway, progress is rather slow trying to figure out the obstruction here, so 
any advice would still be appreciated.

Thanks in advance,

Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
