Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E13BB1D62DA
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 19:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927F36E03B;
	Sat, 16 May 2020 17:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702066E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 May 2020 17:02:09 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 9410C60036F02;
 Sat, 16 May 2020 17:02:17 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Sat, 16 May 2020 19:01:49 +0200
Message-ID: <1684182.mmkAs6cchh@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <1689d947-b2e1-c023-b2ed-1e9d23c075f3@baylibre.com>
References: <1940005.XIBaf5lNV5@jeremy> <1660901.RzKB6nuZHq@jeremy>
 <1689d947-b2e1-c023-b2ed-1e9d23c075f3@baylibre.com>
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

On Friday 15. May 2020 09.43.54 Neil Armstrong wrote:
> 
> On 15/05/2020 00:04, Paul Boddie wrote:
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

I have taken a look at the clocks to see what they get initialised to. Here 
are the details of the LCD controller clocks from this experiment as reported 
by /sys/kernel/debug/clk/clk_summary:

    lcd                               1        1        0    48000000
       tve                            1        1        0    48000000
    vpll                              2        2        2   888000000
       hdmi                           1        1        0    26909090
       lcd1pixclk                     0        0        0   888000000
       lcd0pixclk                     1        1        0    98666666

From the 3.18 vendor kernel:

    lcd                                   1            1    48000000
       tve                                1            1    48000000
    vpll                                  2            2   888000000
       hdmi                               1            1    26909090
       lcd1pixclk                         0            0   888000000
       lcd0pixclk                         1            1   111000000

(The 3.18 output lacks the "protect count" value.)

Here, the only obvious difference is a slower pixel clock in the experimental 
system: 98.7MHz versus 111MHz.

[...]

> Perfect, EDID reading works fine.

We're fairly confident about this now, at least. ;-) For the record, the 
Synopsys peripheral's own I2C support seems far preferable to Ingenic's own 
I2C peripherals and was a nice discovery amongst the bridge driver's 
capabilities.

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

Yes. Permission denied for all that I have tried.

[...]

> >>> But if you have "Input not supported" on your monitor, this means you
> >>> have TMDS going out on your hardware, which is good, this means all the
> >>> power/reset/system clocks are ok.
> >>> This could mean you have a timing/clock issue, please check if something
> >>> is not done on the pixel clock before going to the dw-hdmi block.
> 
> Replying to your previous email concerning the bus formats, yeah should
> probably look at the bus format configured, because if you have a DDR bus
> format, the clock will be half and thus won't work.

I can easily imagine that I am missing something with regard to bus formats 
and flags. However, I reviewed differences between drivers and found a few 
more things that are not done in the ingenic-drm driver, mostly because they 
won't be needed by other SoCs or aren't even supported by them. Some of these 
things are not so easy to explain, but maybe they sound familiar to someone.

The 3.18 kernel driver sets up two DMA descriptors, rather than the usual one 
that would be sufficient, and it enables 8-word descriptors that seem to use 
on-screen display functionality in their additional 4 words. The programming 
manual doesn't say anything obvious about this, but it did make me wonder 
whether this extra functionality might need to be enabled in order to activate 
the HDMI output. All it seems to do is to make a foreground layer equivalent 
to the size of the framebuffer.

(With the above noted, the 3.18 kernel doesn't obviously activate the on-
screen display support using the "OSD configure" register, although the vendor 
3.0.8 kernel does, alongside much else.)

There are some registers used that are probably not available on other SoCs in 
the family. An RGB control register sets up RGB output and odd/even line 
formats. A "priority level threshold configure" register seems to be used for 
some kind of bus arbitration. Again, I can imagine that the pipeline to the 
HDMI peripheral may need a specific configuration, but I haven't found an 
explanation yet.

I have tried to introduce these extra measures in a fairly sensible way to the 
ingenic-drm driver, but no further progress has been made so far.

Thanks once again for comments and suggestions!

Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
