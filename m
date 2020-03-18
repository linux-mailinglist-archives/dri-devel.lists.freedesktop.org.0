Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7699189D29
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 14:39:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F596E8EB;
	Wed, 18 Mar 2020 13:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D0B6E8EB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:39:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26605F9;
 Wed, 18 Mar 2020 14:39:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584538785;
 bh=1mey4/lLxrVlDKhHyd+6IVjoYMJqNqnVpppasLTMnhA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tjsxKfHidPxRlvxnauGHVk0B4XbIWGDDGVxVcxi8Zek7LMaeNI7BIiCrBjmsP4fUb
 +pyoP0qOXDmajEavJKDu8QvVqKs9tHhTJzDAg1iKfkqo713Gt3W1HIAEGCzck6mLiJ
 uZCMY6Mo1uCoI8FvPgSQUd/3jSF76/BX8Pyt21EY=
Date: Wed, 18 Mar 2020 15:39:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/hisilicon: Drop unused #include
Message-ID: <20200318133940.GM4733@pendragon.ideasonboard.com>
References: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
 <20200318110937.GA4733@pendragon.ideasonboard.com>
 <20200318133024.GT2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318133024.GT2363188@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 02:30:24PM +0100, Daniel Vetter wrote:
> On Wed, Mar 18, 2020 at 01:09:37PM +0200, Laurent Pinchart wrote:
> > Hi Daniel,
> > 
> > On Wed, Mar 18, 2020 at 08:31:22AM +0100, Daniel Vetter wrote:
> > > drm_encoder_slave is really not something anyone should be using,
> > > the last real user is only nouveau.
> > 
> > Fully agreed.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Is there any plan to convert nouveau to drm_bridge ?
> 
> Apparently the only user in nouveau is for nv17 cards - after that the tv
> encoder is integrated. This is so old and cards rare (quick irc chat among
> the usual suspects suggested there might be none available anymore) that a
> quick rm might be the better solution than trying to convert this over to
> drm_bridge :-)
> 
> We should definitely look into pushing the drm_encoder_slave into
> drm/nouveau, and maybe delete drm/i2c. The other two things in there kinda
> don't belong - one isn't even a drm driver!

I was going to mention that :-) Pushing the last slave encoder driver
into its only user would be a good way to ensure nobody will take the
slave encoder path ever again.

> > > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Cc: Allison Randal <allison@lohutok.net>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> > > index f31068d74b18..d399c1077242 100644
> > > --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> > > +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> > > @@ -20,7 +20,6 @@
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_bridge.h>
> > >  #include <drm/drm_device.h>
> > > -#include <drm/drm_encoder_slave.h>
> > >  #include <drm/drm_mipi_dsi.h>
> > >  #include <drm/drm_of.h>
> > >  #include <drm/drm_print.h>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
