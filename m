Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B88811D9F3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 00:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F489C59;
	Thu, 12 Dec 2019 23:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAC289C59
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 23:24:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4CC6A2B;
 Fri, 13 Dec 2019 00:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576193062;
 bh=MVMWJHZvXF98KpU2UnVJPgKwy4rbbbArisF+sPKNpik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXSNapbtS+LpSL05+tJiBQhItss65UVk13JfSv6fYg+uf9omnH7fwW4HgqeetDMoD
 fjv7bqLQGYdcOFf0qhKnkrSnwW0u7P0Y8uWkzmceI7B1xM5A7gLZP1UZsF94PjcETN
 yr/kkpkPIgyq58O3BlKso71bYVaWbMzCrYNTAGvs=
Date: Fri, 13 Dec 2019 01:24:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v3 04/50] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20191212232412.GD4892@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-5-laurent.pinchart@ideasonboard.com>
 <17760433.LU8cBYXBuO@e123338-lin>
 <20191212231512.GC4892@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212231512.GC4892@pendragon.ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, nd <nd@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mihail,

On Fri, Dec 13, 2019 at 01:15:12AM +0200, Laurent Pinchart wrote:
> On Wed, Dec 11, 2019 at 11:01:37AM +0000, Mihail Atanassov wrote:
> > On Tuesday, 10 December 2019 22:57:04 GMT Laurent Pinchart wrote:
> > > To support implementation of DRM connectors on top of DRM bridges
> > > instead of by bridges, the drm_bridge needs to expose new operations and
> > > data:
> > > 
> > > - Output detection, hot-plug notification, mode retrieval and EDID
> > >   retrieval operations
> > > - Bitmask of supported operations
> > > - Bridge output type
> > > - I2C adapter for DDC access
> > > 
> > > Add and document these.
> > > 
> > > Three new bridge helper functions are also added to handle hot plug
> > > notification in a way that is as transparent as possible for the
> > > bridges.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > > Changes since v2:
> > > 
> > > - Add wrappers around the .detect(), .get_modes() and .get_edid()
> > >   operations
> > > - Warn bridge drivers about valid usage of the connector argument to
> > >   .get_modes() and .get_edid()
> > > 
> > > Changes since v1:
> > > 
> > > - Make .hpd_enable() and .hpd_disable() optional
> > > - Rename .lost_hotplug() to .hpd_notify()
> > > - Add ddc field to drm_bridge
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 162 +++++++++++++++++++++++++++++
> > >  include/drm/drm_bridge.h     | 193 ++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 354 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index c2cf0c90fa26..473353bd762f 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -70,6 +70,8 @@ static LIST_HEAD(bridge_list);

[snip]

> > > +/**
> > > + * drm_bridge_hpd_enable - enable hot plug detection for the bridge
> > > + * @bridge: bridge control structure
> > > + * @cb: hot-plug detection callback
> > > + * @data: data to be passed to the hot-plug detection callback
> > > + *
> > > + * Call &drm_bridge_funcs.hpd_enable if implemented and register the given @cb
> > > + * and @data as hot plug notification callback. From now on the @cb will be
> > > + * called with @data when an output status change is detected by the bridge,
> > > + * until hot plug notification gets disabled with drm_bridge_hpd_disable().
> > > + *
> > > + * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
> > > + * bridge->ops. This function shall not be called when the flag is not set.
> > > + *
> > > + * Only one hot plug detection callback can be registered at a time, it is an
> > > + * error to call this function when hot plug detection is already enabled for
> > > + * the bridge.
> > > + */
> > > +void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> > > +			   void (*cb)(void *data,
> > > +				      enum drm_connector_status status),
> > > +			   void *data)
> > > +{
> > > +	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
> > > +		return;
> > > +
> > > +	mutex_lock(&bridge->hpd_mutex);
> > > +
> > > +	if (WARN(bridge->hpd_cb, "Hot plug detection already enabled\n"))
> > > +		goto unlock;
> > > +
> > > +	bridge->hpd_cb = cb;
> > > +	bridge->hpd_data = data;
> > > +
> > > +	if (bridge->funcs->hpd_enable)
> > 
> > Is this check necessary given the DRM_BRIDGE_OP_HPD check? Would a
> > 
> > if (WARN_ON(!bridge->funcs->hpd_enable))
> > 	return;
> > 
> > suffice? Similarly for the check in _disable below.
> 
> You're right. I'll do so and move it out of the hpd_mutex-protected
> section.

Actually the operations are not mandatory even if DRM_BRIDGE_OP_HPD is
set, they only have to be implemented if the bridge is capable of
enabling and disabling HPD detection dynamically. If it can't, it can
always generate HPD events and they will be blocked by
drm_bridge_hpd_notify().

> > > +		bridge->funcs->hpd_enable(bridge);
> > > +
> > > +unlock:
> > > +	mutex_unlock(&bridge->hpd_mutex);
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_bridge_hpd_enable);
> > > +
> > > +/**
> > > + * drm_bridge_hpd_disable - disable hot plug detection for the bridge
> > > + * @bridge: bridge control structure
> > > + *
> > > + * Call &drm_bridge_funcs.hpd_disable if implemented and unregister the hot
> > > + * plug detection callback previously registered with drm_bridge_hpd_enable().
> > > + * Once this function returns the callback will not be called by the bridge
> > > + * when an output status change occurs.
> > > + *
> > > + * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
> > > + * bridge->ops. This function shall not be called when the flag is not set.
> > > + */
> > > +void drm_bridge_hpd_disable(struct drm_bridge *bridge)
> > > +{
> > > +	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
> > > +		return;
> > > +
> > > +	mutex_lock(&bridge->hpd_mutex);
> > > +	if (bridge->funcs->hpd_disable)
> > > +		bridge->funcs->hpd_disable(bridge);
> > > +
> > > +	bridge->hpd_cb = NULL;
> > > +	bridge->hpd_data = NULL;
> > > +	mutex_unlock(&bridge->hpd_mutex);
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
> > > +
> > > +/**
> > > + * drm_bridge_hpd_notify - notify hot plug detection events
> > > + * @bridge: bridge control structure
> > > + * @status: output connection status
> > > + *
> > > + * Bridge drivers shall call this function to report hot plug events when they
> > > + * detect a change in the output status, when hot plug detection has been
> > > + * enabled by drm_bridge_hpd_enable().
> > > + *
> > > + * This function shall be called in a context that can sleep.
> > > + */
> > > +void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> > > +			   enum drm_connector_status status)
> > > +{
> > > +	mutex_lock(&bridge->hpd_mutex);
> > > +	if (bridge->hpd_cb)
> > > +		bridge->hpd_cb(bridge->hpd_data, status);
> > > +	mutex_unlock(&bridge->hpd_mutex);
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);

[snip]

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
