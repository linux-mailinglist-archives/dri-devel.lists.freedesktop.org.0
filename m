Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167EFA106C9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 13:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F5710E100;
	Tue, 14 Jan 2025 12:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=marcan.st header.i=@marcan.st header.b="csH9S9x4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 352 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jan 2025 12:38:08 UTC
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6141110E100
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 12:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 661CD3FB5D;
 Tue, 14 Jan 2025 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
 t=1736857935; bh=MBaRwmy2V+eKGISjTuRyij6MDBcFzFVPGd7nNHXyEn0=;
 h=Date:From:To:Subject;
 b=csH9S9x4zc2ljEtzpJMGjLGqrg61MBcXDNlquNyPCvpUoJAHqriXGvqW7GGLfrcWJ
 Gj3GjqbuvFS5Wc3mIxthHTJ4v6BWP8iJm1czVWWkUbe+6yco6UmBTj0LjbbPM75rAe
 8Fo26SAILqFph8ZpKWCd9Cnsv+s8as0uxHLKxMnrTFV9NuMdN99pXgaCtpuQK17OgI
 R+nRJ+v1qFX2inkrkTiewWIoD4EQZOCQ3fLXEjBGzkTQIvsWbHaSTfC/Vi52x7RzJs
 i5QL405uK8/Y5l5N8aVpE3VmD/uCJUH/GkpajFKuEcWv9Se4Xc6ZyisQYFpdhRZg0w
 93PDDALHgU/PQ==
Message-ID: <fda8b831-1ffc-4087-8e7b-d97779b3ecc5@marcan.st>
Date: Tue, 14 Jan 2025 21:32:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
To: devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-embedded@vger.kernel.org,
 Asahi Linux <asahi@lists.linux.dev>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Unified Type C PHYs and top-level port management
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

We're implementing Type C port support for Apple systems and we're
running into impedance mismatches with the existing Linux subsystems. I
want to throw a quick overview of the problem here and see if we can
come up with solutions.

The short version is that Linux has a pile of (sub)subsystems that deal
with multiple aspects of coordinating Type C port behavior:

- USB role switch
- USB host
- USB gadget
- Type C mux
- Type C PD
- DRM/etc for DisplayPort
- USB4/Thunderbolt (not even going there yet)
- Individual PHYs for everything

This evolved from, and is largely designed for, systems built from
discrete components (separate USB3 controller, DP controller, external
mux, PD stuff, etc.)

What we actually on Apple systems is:

- An external I2C USB-PD controller that handles the entire PD protocol
and negotiation autonomously. We don't even get to pick the altmode, it
does all the policy on its own and there is no override (we looked).
- USB3/4/DP retimer and eUSB2 level shifter chips (not muxes) that are
managed by the external USB-PD controller over I2C, invisible to Linux.
- A single, unified, shared PHY (atcphy) that handles *everything*:
USB2, USB3, DP, USB4/TBT, depending on configuration. It presents
discrete interfaces to the DP, TBT, and USB controllers behind it.
- A dwc3 controller per unified PHY, with host and device modes. Its
USB3 PIPE interface can be switched (via registers in the PHY side, not
the dwc3 side) between a dummy PHY, the USB3 PHY, or a virtual PHY that
does USB4 tunneling.
- A set of display controllers that are separate from the ports/PHYs
- A DisplayPort router that can pair a display controller with a given
unified PHY's physical DisplayPort interface, or one of two tunnels over
TBT/USB4. The display controllers are n:m matched to the ports, they are
not 1:1 (there may be fewer display controllers than ports).
- The whole TBT/USB4 PCIe stuff which winds up in a PCIe root port
controller per port/PHY (not going to consider this for now, leaving
that for later).

The current approach we have is a mess. The tipd driver (which manages
the PD controller) directly does the role switching and mux calls. The
role switching triggers dwc3 to asynchronously switch modes. Meanwhile
the mux calls end up at our PHY driver which tries to reconfigure
everything for the given lane mode. But since PHY configuration also has
to negotiate with dwc3, it also acts as a PHY for that (two, actually,
USB2 and USB3). However, the callbacks from dwc3 are all over the place,
and we end up having to do things like handle USB3 configuration from
the USB2 PHY callbacks because that happens to be the correct timing to
make it work. Meanwhile DRM/DisplayPort is its own thing that is mostly
asynchronous to everything else, only reacting to HPD, and we haven't
even gotten to the dynamic assignment of display controllers to ports
yet (that's a story for another day).

To give an example of one of the quirks: Thanks to the USB-IF's
amazingly braindead stateful and non-self-synchronizing eUSB2 protocol,
we need to fully reset the dwc3 controller every time there is a hotplug
event on the port from the PD controller. Otherwise USB2 breaks, since
the PD controller will reset the eUSB2 level shifter on unplug and dwc3
and the paired eUSB2 PHY can't recover from that without a full reset.

A further complication is we do not have documentation for any of this.
The PHY setup is all reverse engineered. That means all we can do is
replicate the same register operations that macOS does, and then we have
to *guess* how to fit it into Linux, and what can be moved around or
reordered or not. There is no way to know if any given Linux
implementation is correct and reliably configures the PHY, other than
trial and error, unless we can exactly replicate what macOS does (which
is infeasible in Linux today because the cross-driver sync points aren't
in the same places, e.g. dwc3 and its phy callbacks do not match the
interleaving of PHY register writes and dwc3 register writes in macOS).

This is never going to be reliable, robust, or maintainable with the
current approach. Even just getting it to work at all is a frustrating
mess, where fixing one thing breaks another (e.g. if the dwc3 role
switch happens first, that runs in a workqueue, and ends up racing with
phy reconfig. We found out our current code was working by accident due
to some msleep() calls in dwc3. And of course, hotplug is all kinds of
racy and broken.). The sequencing requirements make this whole approach
using different subsystems for different things without central
coordination a nightmare, especially with hotplug involved and devices
that like to switch their altmode negotiation rapidly on connect cycles.
It all ends up depending of subtle implementation details of each part,
and if anything changes, everything breaks.

What we really want is a top-level, vendor-specific coordinator that
*synchronously* (in a single logical thread) handles all
hotplug/modeswitch operations for a single port, driving state
transitions for all the other drivers. I.e. something that can:

- Receive a data role/status change from tipd (this includes *all* port
mode including data role, altmode config, etc.). This can be
asynchronous/queued relative to tipd, but all config changes must be
processed in sequence as a single queue.
- Deconfigure the previous mode for consumers, e.g. shutting
down/resetting dwc3 if required, unsetting HPD for the DisplayPort side
so it knows to shut that side down, etc.
- Change the unified PHY configuration for the new mode (this may
require knowledge of everything about the port state including data
role, not just altmode/mux state)
- Start up the consumers again
- React to PHY callbacks from the consumers to further drive PHY state
changes (some things need to happen in a specific sequence or at request
from dwc3 or the display controller firmware, and we may have to add
extra callbacks for some points somehow, which doesn't fit well with the
current PHY subsystem which is more rigid about operations...)

Right now, I don't see any way this would fit into the existing
subsystems well. The closest thing I can come up with, and what I will
do to get by at least for the time being, is to:

- Get rid of the asynchronous dwc3 role switching, making it synchronous
(optionally if needed to not break other users)
- Add a queue to tipd so it can handle state changes asynchronously from
the actual PD protocol (and without blocking i2c bus interrupt handling
so other ports can operate in parallel), but all state changes are
handled sequentially without any overlap, and the ordering is carefully
controlled (Connect: mux call first, then USB role switch, then
DisplayPort HPD. Disconnect: DisplayPort HPD, then USB role switch, then
mux call. There may be other complex cases for mode changes while
already connected, this won't be fun.).
- Put most of the PHY policy in the atcphy driver (which is all of a
reset driver for dwc3, mux driver, and all the phys). This includes ugly
things like deferring state changes while dwc3 is active in some cases.
- On the DP/display side, we haven't implemented this yet, but in the
future the single "apple,display-subsystem" driver (which actually
provides the top-level DRM device for all the underlying discrete
display controllers, and is already its own virtual device in the DT)
will present virtual ports for the different PHYs, and handle the
muxing/assignment between them and the display controllers on its side
(there is potentially complex policy here too, since not all display
controllers are equal and there may be a need to reassign a display for
a lower-spec screen to a lower-spec display controller to free up a
higher-spec controller for a higher-spec screen, but we need a
controller assigned to a port to even read EDID to figure that out, so
it's going to be messy).

But I'm not happy at all with the weird, load-bearing intermingling of
tipd/atcphy/dwc3 there. There's bound to be places where the
abstractions leak and we end up with more and more horrible workarounds,
or layering violations.

A further question is how all this should be represented in the device
tree. That might drive the software architecture to a point, or vice versa.

Any ideas?

Some further reading here:
https://social.treehouse.systems/@marcan/113821266231103150

- Hector

