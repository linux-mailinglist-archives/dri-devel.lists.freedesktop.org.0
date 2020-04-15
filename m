Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E181AB064
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 20:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4D8916A;
	Wed, 15 Apr 2020 18:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E018916A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 18:12:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B81A2D1;
 Wed, 15 Apr 2020 20:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586974357;
 bh=Dap3YfL37otGvAkUdRZ/+gsy5KBCCN0SCqw8sMkaAxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QfxwrcBfx69+YxIIAAmmR3Jqz0p4S8a1uYnt9am/A2s4bJfyRDC0Y8fKtAosrl3pE
 jWxLaJhWkVEQP2Pqh9FTBgLI4I3YNKT+IDgjrg5v6eEPZc8k1lGnnb2UzanJBAPJ+1
 /OvnM2Lw4ZkAkS7yrS+FlPcLyUb1O/3atrO0qBoo=
Date: Wed, 15 Apr 2020 21:12:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/bridge: Move mhl.h into driver directory
Message-ID: <20200415181223.GN4758@pendragon.ideasonboard.com>
References: <20200415173833.312706-1-daniel.vetter@ffwll.ch>
 <20200415174806.GL4758@pendragon.ideasonboard.com>
 <20200415180620.GK3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415180620.GK3456981@phenom.ffwll.local>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Apr 15, 2020 at 08:06:20PM +0200, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 08:48:06PM +0300, Laurent Pinchart wrote:
> > On Wed, Apr 15, 2020 at 07:38:33PM +0200, Daniel Vetter wrote:
> > > include/drm/bridge is a bit a mistake, drivers are supposed to find
> > > their bridges using one of the standard of_* functions the drm_bridge
> > > core provides.
> > 
> > I'm confused, I don't really see how that's related to mhl.h. The header
> > defines constants and structures related to the MHL (Mobile
> > High-Definition Link) protocol, which is an industry standard. If you
> > want to move it out of include/drm/bridge/ to eventually remove that
> > directory, I think it should be renamted to include/drm/drm_mhl.h.
> 
> It looked misplaced at least ... I guess moving this out of drm/bridge
> makes more sense.
> 
> > > dw-hdmi and analogix-dp are the only, historically
> > > grown exception that we haven't managed to get rid of yet.
> > 
> > The reason why we have shared headers for those is because they're IP
> > cores integrated with different glue layers in different SoCs. There's
> > one driver for the IP core itself, and SoC-specific glue drivers that
> > need to provide the IP core drivers with data and callbacks, defined in
> > shared headers. Granted, there's also data in those headers that are
> > only internal to the IP core drivers, and that should be moved out, but
> > for the interface header, include/drm/bridge/ doesn't seem to be a bad
> > location to me.
> 
> The thing that irks me on them is that they kinda implement bridges, but
> they don't load like bridges. That's the part I think should get changed,
> or we need to finally figure out what exactly isn't good with the current
> drm_bridge handling and get that fixed (the relevant patches seem forever
> stuck in limbo, hence why I'm kicking).

dw-hdmi certainly loads like a bridge when used with R-Car DU :-) Are
you referring to the component-based probe mode for that driver ?

> If that's not possible because these things just dont fit as drm_bridge,
> then maybe they shouldn't be a bridge, but something else. But looking at
> both dw-hdmi and analogix-dp these things look a lot like midlayers that
> get fed huge structures. Instead of more bare-bones toolboxes to build a
> set of similar drm_bridge drivers, which drivers then bind into using dt.
> 
> So all a bit fishy imo.
> 
> I guess step 1 at least would be to throw the connector and encoder code
> out of all these drivers, that would be at least a first step.

Oh yes!! DRM_BRIDGE_ATTACH_NO_CONNECTOR for everybody :-) It's a
step-by-step process though:

1. Convert bridge drivers to support both modes (adding support for
   DRM_BRIDGE_ATTACH_NO_CONNECTOR).
2. Convert display drivers to make use of DRM_BRIDGE_ATTACH_NO_CONNECTOR
   (with the DRM bridge connector helper, or custom code if really
   needed).
3. Remove support for the !DRM_BRIDGE_ATTACH_NO_CONNECTOR mode in bridge
   drivers.
4. Drop the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag itself.

Sam and I are working on the first step (I'll convert the dw-hdmi driver
soon), and we're passing the message around that new bridge drivers
must support DRM_BRIDGE_ATTACH_NO_CONNECTOR and new display controller
drivers must use it.

> Next one maybe push the per-variant bind code into drm/bridge and out of
> drivers, and use more standard of_ functions to find the bridges and tie
> them into the drm_device.
> 
> Then 3rd round, some refactoring to demidlayer these libraries and make
> them real toolboxes.
> 
> > > Make sure that at least no new ones grow by moving hardware header
> > > files into the correct driver directory.
> > > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Kate Stewart <kstewart@linuxfoundation.org>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Allison Randal <allison@lohutok.net>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > > ---
> > >  {include => drivers/gpu}/drm/bridge/mhl.h | 0
> > >  drivers/gpu/drm/bridge/sii9234.c          | 3 ++-
> > >  drivers/gpu/drm/bridge/sil-sii8620.c      | 2 +-
> > >  3 files changed, 3 insertions(+), 2 deletions(-)
> > >  rename {include => drivers/gpu}/drm/bridge/mhl.h (100%)
> > > 
> > > diff --git a/include/drm/bridge/mhl.h b/drivers/gpu/drm/bridge/mhl.h
> > > similarity index 100%
> > > rename from include/drm/bridge/mhl.h
> > > rename to drivers/gpu/drm/bridge/mhl.h
> > > diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> > > index b1258f0ed205..4c862c3af038 100644
> > > --- a/drivers/gpu/drm/bridge/sii9234.c
> > > +++ b/drivers/gpu/drm/bridge/sii9234.c
> > > @@ -12,7 +12,6 @@
> > >   *    Shankar Bandal <shankar.b@samsung.com>
> > >   *    Dharam Kumar <dharam.kr@samsung.com>
> > >   */
> > > -#include <drm/bridge/mhl.h>
> > >  #include <drm/drm_bridge.h>
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_edid.h>
> > > @@ -29,6 +28,8 @@
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/slab.h>
> > >  
> > > +#include "mhl.h"
> > > +
> > >  #define CBUS_DEVCAP_OFFSET		0x80
> > >  
> > >  #define SII9234_MHL_VERSION		0x11
> > > diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
> > > index 92acd336aa89..017dbb67404e 100644
> > > --- a/drivers/gpu/drm/bridge/sil-sii8620.c
> > > +++ b/drivers/gpu/drm/bridge/sil-sii8620.c
> > > @@ -8,7 +8,6 @@
> > >  
> > >  #include <asm/unaligned.h>
> > >  
> > > -#include <drm/bridge/mhl.h>
> > >  #include <drm/drm_bridge.h>
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_edid.h>
> > > @@ -31,6 +30,7 @@
> > >  
> > >  #include <media/rc-core.h>
> > >  
> > > +#include "mhl.h"
> > >  #include "sil-sii8620.h"
> > >  
> > >  #define SII8620_BURST_BUF_LEN 288

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
