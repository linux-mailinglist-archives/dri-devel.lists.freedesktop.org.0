Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1E81E8C8C
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 02:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9586E98E;
	Sat, 30 May 2020 00:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236BD6E98E
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 00:33:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A2D02A5;
 Sat, 30 May 2020 02:33:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590798820;
 bh=wzw8V5ZWsuApgSk9geW9Dr6AolgvJX74ZawxAbR0A+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmhyE4Se+LVeskixRyeklzNy0B4pjddnlU9EoTyNJYKhuuskfj083sSRX0C2lr4mQ
 IJlO1kabsBMXOBQvRAWWhcRRk4H53UTRb3SOKOMbVzAGvafO0b71I1ivy4HU/2zXA2
 oVddOVtTe8i6m7T9bEgj9eCJhGyhA8nev+3PzMWo=
Date: Sat, 30 May 2020 03:33:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 09/21] drm: mxsfb: Remove unneeded includes
Message-ID: <20200530003326.GB5961@pendragon.ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-10-laurent.pinchart@ideasonboard.com>
 <a681c7b8f663ac32b5504aaed3eec429@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a681c7b8f663ac32b5504aaed3eec429@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Mon, Mar 23, 2020 at 10:53:50PM +0100, Stefan Agner wrote:
> On 2020-03-09 20:52, Laurent Pinchart wrote:
> > A fair number of includes are not needed. Drop them, and add a couple of
> > required includes that were included indirectly.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Out of curiosity, do you have some kind of tool helping with this?

No, that was manual.

> Reviewed-by: Stefan Agner <stefan@agner.ch>
> 
> > ---
> >  drivers/gpu/drm/mxsfb/mxsfb_crtc.c | 12 +++---------
> >  drivers/gpu/drm/mxsfb/mxsfb_drv.c  |  5 -----
> >  2 files changed, 3 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > index aef72adabf41..c4f1575b4210 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_crtc.c
> > @@ -10,19 +10,13 @@
> >  
> >  #include <linux/clk.h>
> >  #include <linux/iopoll.h>
> > -#include <linux/of_graph.h>
> > -#include <linux/platform_data/simplefb.h>
> > +#include <linux/spinlock.h>
> >  
> > -#include <video/videomode.h>
> > -
> > -#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_bridge.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_fb_cma_helper.h>
> > -#include <drm/drm_fb_helper.h>
> > +#include <drm/drm_fourcc.h>
> >  #include <drm/drm_gem_cma_helper.h>
> > -#include <drm/drm_of.h>
> > -#include <drm/drm_plane_helper.h>
> > -#include <drm/drm_probe_helper.h>
> >  #include <drm/drm_simple_kms_helper.h>
> >  #include <drm/drm_vblank.h>
> >  
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > index cffc70257bd3..204c1e52e9aa 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> > @@ -9,15 +9,10 @@
> >   */
> >  
> >  #include <linux/clk.h>
> > -#include <linux/component.h>
> >  #include <linux/dma-mapping.h>
> > -#include <linux/list.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > -#include <linux/of_graph.h>
> > -#include <linux/of_reserved_mem.h>
> >  #include <linux/pm_runtime.h>
> > -#include <linux/dma-resv.h>
> >  #include <linux/spinlock.h>
> >  
> >  #include <drm/drm_atomic.h>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
