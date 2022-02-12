Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040414B382D
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 22:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC4910E33E;
	Sat, 12 Feb 2022 21:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CF210E33E
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Feb 2022 21:15:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f4f3cc90-8c48-11ec-b2df-0050568cd888;
 Sat, 12 Feb 2022 21:15:51 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B8055194B37;
 Sat, 12 Feb 2022 22:15:35 +0100 (CET)
Date: Sat, 12 Feb 2022 22:15:32 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/9] drm/bridge: add DRM_BRIDGE_STATE_OPS macro
Message-ID: <YggjdD3O4oaJbfPa@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-2-sam@ravnborg.org>
 <YgG5snx6y69SKU6w@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgG5snx6y69SKU6w@pendragon.ideasonboard.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Tue, Feb 08, 2022 at 02:30:42AM +0200, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Sun, Feb 06, 2022 at 04:43:57PM +0100, Sam Ravnborg wrote:
> > The DRM_BRIDGE_STATE_OPS can be used as shortcut for bridge drivers that
> > do not subclass drm_bridge_state to assign the default operations for
> > reset, duplicate and destroy of the state.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > ---
> >  include/drm/drm_bridge.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 061d87313fac..fc00304be643 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -935,4 +935,16 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> >  }
> >  #endif
> >  
> > +/**
> > + * DRM_BRIDGE_STATE_OPS - Default drm_bridge state funcs
> 
> I'd name the macro DRM_BRIDGE_STATE_DEFAULT_OPS.
OK, done.

> 
> > + *
> > + * Bridge driver that do not subclass &drm_bridge_state can use the helpers
> > + * for reset, duplicate, and destroy. This macro provides a shortcut for
> > + * setting the helpers in the &drm_bridge_funcs structure.
> > + */
> > +#define DRM_BRIDGE_STATE_OPS \
> > +	.atomic_reset = drm_atomic_helper_bridge_reset,				\
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,	\
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state
> 
> I'm not a big fan of such macros for a small number of operations, as I
> find that it obfuscates the code a bit, but that could change once I get
> used to the new macro :-)
The use of the macro is a nice signal that all the relevant default
operations are specified - no need to look up if all are included.

I have on my TODO to update all relevant bridge drivers to use it.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> >  #endif
> 
> -- 
> Regards,
> 
> Laurent Pinchart
