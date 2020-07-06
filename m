Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED31A216764
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DBF6E5BF;
	Tue,  7 Jul 2020 07:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 75505 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jul 2020 20:56:07 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C429B89DBF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 20:56:07 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 62E6C600166B0;
 Mon,  6 Jul 2020 20:56:03 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
Date: Mon, 06 Jul 2020 22:55:58 +0200
Message-ID: <3158508.CFMi0AOM4G@jason>
In-Reply-To: <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com>
References: <1940005.XIBaf5lNV5@jeremy> <7086465.UhkgK7rEtT@jason>
 <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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

On Monday, 6 July 2020 14:12:24 CEST Neil Armstrong wrote:
> 
> On 06/07/2020 01:57, Paul Boddie wrote:
> > 
> > It also seems to be appropriate to set the input_bus_format on the
> > platform- specific HDMI driver; otherwise, I doubt that appropriate bus
> > encodings will be chosen in the Synopsys driver.
> 
> It does but when not provided, it doesn't use it.
> 
> It's handled in drm_atomic_bridge_chain_select_bus_fmts() :
> 	if (conn->display_info.num_bus_formats &&
> 		    conn->display_info.bus_formats)
> 		out_bus_fmts[0] = conn->display_info.bus_formats[0];
> 	else
> 		out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;

OK. I thought I'd seen this somewhere, but I had started to think that 
input_bus_format would remain initialised (presumably to zero) and this would 
then cause the Synopsys driver to not change the bus format to the actual 
default.

[...]

> > Testing against 5.8-rc3 with the above changes seems to have moved the
> > needle slightly. Although I still get "Input not supported" from my
> > monitor, running modetest now gives a different error:
> > 
> > modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
> > 
> > ...now yields this:
> > 
> > setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
> > failed to set gamma: Invalid argument
> 
> This is because you don't provide the gamma setup ioctl, it's not a fatal
> error at all. It should be warning since it's optional.
> 
> Did you check all modes ?

I have checked a few more. Currently, testing them is awkward because it 
involves switching my monitor to DVI input, getting "Input Not Supported", 
unplugging the cable, and then the hotplug event has most likely caused a bad 
pointer dereference in ingenic_drm_crtc_atomic_flush and thus a kernel panic.

So, I'll try and fix this panic, which appears to be due to the DRM driver 
accessing a null framebuffer pointer (presumably having been invalidated 
elsewhere upon unplugging), and see if I can't get some more information about 
the state of the peripherals.

Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
