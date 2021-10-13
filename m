Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FDD42B64B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 08:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECD06E08A;
	Wed, 13 Oct 2021 06:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4360E6E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A9626FB03;
 Wed, 13 Oct 2021 08:02:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 66EE4GbhLCIQ; Wed, 13 Oct 2021 08:02:55 +0200 (CEST)
Date: Wed, 13 Oct 2021 08:02:54 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Ignore -EPROBE_DEFER when bridge attach fails
Message-ID: <YWZ2jppbbdKwI2AW@qwark.sigxcpu.org>
References: <00493cc61d1443dab1c131c46c5890f95f6f9b25.1634068657.git.agx@sigxcpu.org>
 <YWXtQ778N/rn+Jnu@pendragon.ideasonboard.com>
 <YWX0UPyw+5OBsBA6@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWX0UPyw+5OBsBA6@qwark.sigxcpu.org>
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

Hi,
On Tue, Oct 12, 2021 at 10:47:14PM +0200, Guido Günther wrote:
> Hi Laurent,
> On Tue, Oct 12, 2021 at 11:17:07PM +0300, Laurent Pinchart wrote:
> > Hi Guido,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Oct 12, 2021 at 09:58:58PM +0200, Guido Günther wrote:
> > > Otherwise logs are filled with
> > > 
> > >   [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/mipi-dsi@30a0 0000 to encoder None-34: -517
> > > 
> > > when the bridge isn't ready yet.
> > > 
> > > Fixes: fb8d617f8fd6 ("drm/bridge: Centralize error message when bridge attach fails")
> > > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index a8ed66751c2d..f0508e85ae98 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -227,14 +227,15 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> > >  	bridge->encoder = NULL;
> > >  	list_del(&bridge->chain_node);
> > >  
> > > +	if (ret != -EPROBE_DEFER) {
> > >  #ifdef CONFIG_OF
> > > -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > > -		  bridge->of_node, encoder->name, ret);
> > > +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > > +			  bridge->of_node, encoder->name, ret);
> > >  #else
> > > -	DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> > > -		  encoder->name, ret);
> > > +		DRM_ERROR("failed to attach bridge to encoder %s: %d\n",
> > > +			  encoder->name, ret);
> > >  #endif
> > > -
> > > +	}
> > 
> > This looks fine as such, but I'm concerned about the direction it's
> > taking. Ideally, probe deferral should happen at probe time, way before
> > the bridge is attached. Doing otherwise is a step in the wrong direction
> > in my opinion, and something we'll end up regretting when we'll feel the
> > pain it inflicts.
> 
> The particular case I'm seeing this is the nwl driver probe deferrals if
> the panel bridge isn't ready (which needs a bunch of components
> (dsi, panel, backlight wrapped led, ...) and it probes fine later on so I
> wonder where you see the actual error cause? That downstream of the
> bridge isn't ready or that the display controller is already attaching
> the bridge?

I should add that mxsfb does a `dev_err_probe()` already when checking
the return value of `drm_bridge_attach()` so the error printed is
triggered by the additional check added in the above function while the
code path already ignored -EPROBE_DEFER before. This looks sensible to
me since upper layers can't known when all the downstream bridges are
done probing or am I missing something?

Cheers,
 -- Guido

> 
> Cheers,
>  -- Guido
> 
> > 
> > >  	return ret;
> > >  }
> > >  EXPORT_SYMBOL(drm_bridge_attach);
> > 
> > -- 
> > Regards,
> > 
> > Laurent Pinchart
> > 
