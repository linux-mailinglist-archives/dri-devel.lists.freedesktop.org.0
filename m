Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C919C063
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 13:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ACB89B00;
	Thu,  2 Apr 2020 11:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Thu, 02 Apr 2020 11:47:35 UTC
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1781A89B00
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 11:47:35 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id 213B1100B54D2;
 Thu,  2 Apr 2020 13:39:26 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id AC71044DF93; Thu,  2 Apr 2020 13:39:25 +0200 (CEST)
Date: Thu, 2 Apr 2020 13:39:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
Message-ID: <20200402113925.2zvatduiyqld7pj2@wunner.de>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 04:25:19PM -0500, Daniel Dadap wrote:
> A number of hybrid GPU notebook computer designs with dual (integrated plus
> discrete) GPUs are equipped with multiplexers (muxes) that allow display
> panels to be driven by either the integrated GPU or the discrete GPU.
> Typically, this is a selection that can be made at boot time as a menu
> option in the system firmware's setup screen, and the mux selection stays
> fixed for as long as the system is running and persists across reboots until
> it is explicitly changed. However, some muxed hybrid GPU systems have
> dynamically switchable muxes which can be switched while the system is
> running.

As you may be aware, there's drivers/gpu/vga/vga_switcheroo.c (of which
I'm listed as a reviewer in MAINTAINERS) to support such hardware.

It also supports muxed configurations, including those that support
switching at runtime (and not only at boot) such as the MacBook Pro,
which uses drivers/platform/x86/apple-gmux.c to interface between
vga_switcheroo and the hardware mux.

However, so far switching only actually works on LVDS-based MacBook Pros,
i.e. all pre-retina machines introduced between Late 2008 and Mid 2012,
because that hardware is capable of switching the DDC pins separately
from the display, so we lock and switch them when probing the EDID.

The retina machines introduced from Mid 2012 onward use eDP and run
into the issues you're describing:  The AUX channel cannot be switched
separately from the display, so link training fails unless the entire
display is switched.  Nevertheless macOS can switch the panel seamlessly.
So how are they doing it?

Well, I don't own a retina MacBook Pro, hence never got very far with
supporting them, but I did some research and experiments in the 2015/2016
time frame which a colleague, Bruno Bierbaumer, tested on his machine:

First of all, there's DPCD byte 3 bit 6 (NO_AUX_HANDSHAKE_LINK_TRAINING)
which is documented as follows:

    Does not require AUX CH handshake when the link configuration is
    already known. [...] The known-good drive current and pre-emphasis
    level (or those used in the last "full" link training with AUX CH
    handshake) must be used when the link training is performed without
    AUX CH handshake.

That bit is set on the MacBook Pros in question.

So I think what we should be doing here is that the DRM driver which
happens to be muxed to the panel on boot performs link training and
informs vga_switcheroo of the drive current, pre-emph level, etc.
The other DRM driver is notified when that information is available
and uses it to set up its eDP output, skipping an actual AUX CH
handshake.

At least i915 probes various capabilities in the DPCD without any
consideration that the AUX channel may currently not be available.
Back in the day I experimented with a read-only proxy mechanism
to make that work, whereby the inactive DRM driver uses the active
DRM driver to access the DPCD:

https://patchwork.kernel.org/patch/7000591/

An alternative would be to have the active DRM driver cache the
required portions of the DPCD for use by the inactive DRM driver.

Note that vga_switcheroo is currently controlled via debugfs.
That is a historic artefact.  The kernel has since gained a
mux subsystem in drivers/mux/ which could be used to represent
the display mux in a standardized way in regular sysfs.

Thanks,

Lukas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
