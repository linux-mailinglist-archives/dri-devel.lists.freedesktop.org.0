Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9012C24B000
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D3BE6E8F4;
	Thu, 20 Aug 2020 07:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 505 seconds by postgrey-1.36 at gabe;
 Wed, 19 Aug 2020 16:31:38 UTC
Received: from mailrelay4.webfaction.com (mailrelay4.webfaction.com
 [185.20.51.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C34389F8B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 16:31:38 +0000 (UTC)
Received: from mailrelay3.webfaction.com (mailrelay3.webfaction.com
 [207.38.93.110])
 by mailrelay4.webfaction.com (Postfix) with ESMTPS id BE12FA543B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 16:23:08 +0000 (UTC)
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by mailrelay3.webfaction.com (Postfix) with ESMTPS id 4C8452A3A0D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 16:23:06 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 6698F6004DFAB;
 Wed, 19 Aug 2020 16:22:50 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Wed, 19 Aug 2020 18:22:57 +0200
Message-ID: <3438194.ulOPQ7trSx@jason>
In-Reply-To: <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
References: <1940005.XIBaf5lNV5@jeremy> <3158508.CFMi0AOM4G@jason>
 <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 hns@goldelico.com, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 19 August 2020 12:21:17 CEST Ezequiel Garcia wrote:
> Hello,
> 
> First of all, I'd like to thank everyone for the great work
> on ingenic-drm. The driver is in very good shape
> and a pleasure to work with.

Thanks must go to Paul Cercueil for keeping up with all the framework 
evolution that goes on and for keeping the driver working.

> Yesterday, I checked out branch "paulb-jz4780-ci20-hdmi-5.8-rc5",
> from git.goldelico.com/letux-kernel.git, rebased it on v5.9-rc1,
> and then run weston over HDMI (how often
> weston runs on mips, uh? :)

I'm amazed that it works. I tried repeatedly and never got a picture, even 
though (as I wrote previously), I have extracted the necessary logic and got 
the LCD controller and HDMI peripheral to work in a different environment.

> The edid of my monitor is properly read
> and modetest reports all modes.

This was already something we were very confident about. You cannot really 
rely on the Ingenic I2C support, but the Synopsys peripheral does I2C 
reliably.

> I've only tested the primary plane, for some reason
> the overlay is not working as expected, but it must
> be probably some minor thing.

If planes correspond to aspects of the OSD (on-screen display) support then 
there may be a need to review the configuration. On the JZ4780, the OSD 
support is involved in getting the LCD controller to produce output.

> As for the bus format, I have just added a skip
> for CONNECTOR_HDMIA types in the encoder
> atomic check. And then MEDIA_BUS_FMT_RGB888_1X24
> is hardcoded if there are no bus formats negotiated.

This is the part that baffles me. And I am currently looking at other Ingenic 
devices and trying to figure out how I define their panels and whether the 
driver will be able to deduce a bus format, so advice is also welcome on this 
topic.

> Paul et al, if you guys can rebase your work on v5.9-rc1
> and Cc I will be happy to review and test the patches.

Nikolaus did rebase on the latest release candidate, and I made a branch 
available as the expected paulb-jz4780-ci20-hdmi-5.9-rc1 which can be browsed 
here:

https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/paulb-jz4780-ci20-hdmi-5.9-rc1

I imagine that you made a similar fix to the one I did, but that is probably 
the only thing not already in the branch you reviewed.

> Cheers & thanks again,
> Eze

Thanks for looking at the code, and congratulations on being the first to get 
it working!

Paul

> On Tue, 7 Jul 2020 at 04:27, Paul Boddie <paul@boddie.org.uk> wrote:
> > On Monday, 6 July 2020 14:12:24 CEST Neil Armstrong wrote:
> > > On 06/07/2020 01:57, Paul Boddie wrote:
> > > > It also seems to be appropriate to set the input_bus_format on the
> > > > platform- specific HDMI driver; otherwise, I doubt that appropriate
> > > > bus
> > > > encodings will be chosen in the Synopsys driver.
> > > 
> > > It does but when not provided, it doesn't use it.
> > > 
> > > It's handled in drm_atomic_bridge_chain_select_bus_fmts() :
> > >       if (conn->display_info.num_bus_formats &&
> > >       
> > >                   conn->display_info.bus_formats)
> > >               
> > >               out_bus_fmts[0] = conn->display_info.bus_formats[0];
> > >       
> > >       else
> > >       
> > >               out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> > 
> > OK. I thought I'd seen this somewhere, but I had started to think that
> > input_bus_format would remain initialised (presumably to zero) and this
> > would then cause the Synopsys driver to not change the bus format to the
> > actual default.
> > 
> > [...]
> > 
> > > > Testing against 5.8-rc3 with the above changes seems to have moved the
> > > > needle slightly. Although I still get "Input not supported" from my
> > > > monitor, running modetest now gives a different error:
> > > > 
> > > > modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
> > > > 
> > > > ...now yields this:
> > > > 
> > > > setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
> > > > failed to set gamma: Invalid argument
> > > 
> > > This is because you don't provide the gamma setup ioctl, it's not a
> > > fatal
> > > error at all. It should be warning since it's optional.
> > > 
> > > Did you check all modes ?
> > 
> > I have checked a few more. Currently, testing them is awkward because it
> > involves switching my monitor to DVI input, getting "Input Not Supported",
> > unplugging the cable, and then the hotplug event has most likely caused a
> > bad pointer dereference in ingenic_drm_crtc_atomic_flush and thus a
> > kernel panic.
> > 
> > So, I'll try and fix this panic, which appears to be due to the DRM driver
> > accessing a null framebuffer pointer (presumably having been invalidated
> > elsewhere upon unplugging), and see if I can't get some more information
> > about the state of the peripherals.
> > 
> > Paul
> > 
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
