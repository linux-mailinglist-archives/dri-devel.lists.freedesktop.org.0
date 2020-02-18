Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301C161E78
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 02:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF106E11A;
	Tue, 18 Feb 2020 01:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1049B6E119
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 01:21:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD0D42F9;
 Tue, 18 Feb 2020 02:21:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581988906;
 bh=L0xnJauqW/Ec7/5gJpQE9gBpVwt4m/WB/3QihSd1YI8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bn8tm+pAIcBd7TCiVAtEC5zJodP/WLvBKo16/V2XMfuJpMmLm9l38fMZVpLldjSGp
 gG0lt/IuuhxB1i09OxS4HKOuurgr1KcqkPg60VUcF9i6kpx2Xla2X74rHi7xlPSbiJ
 jRxUYOLTf+dw6t0CvCnWzpqw4YPLz/TIa0SIko8A=
Date: Tue, 18 Feb 2020 03:21:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v6 04/51] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20200218012127.GR4830@pendragon.ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-5-laurent.pinchart@ideasonboard.com>
 <20200217095308.GK2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217095308.GK2363188@phenom.ffwll.local>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Mon, Feb 17, 2020 at 10:53:08AM +0100, Daniel Vetter wrote:
> On Sun, Feb 16, 2020 at 11:02:21PM +0200, Laurent Pinchart wrote:
> > To support implementation of DRM connectors on top of DRM bridges
> > instead of by bridges, the drm_bridge needs to expose new operations and
> > data:
> > 
> > - Output detection, hot-plug notification, mode retrieval and EDID
> >   retrieval operations
> > - Bitmask of supported operations
> > - Bridge output type
> > - I2C adapter for DDC access
> > 
> > Add and document these.
> > 
> > Three new bridge helper functions are also added to handle hot plug
> > notification in a way that is as transparent as possible for the
> > bridges.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> > Changes since v3:
> > 
> > - Fix typos
> > 
> > Changes since v2:
> > 
> > - Add wrappers around the .detect(), .get_modes() and .get_edid()
> >   operations
> > - Warn bridge drivers about valid usage of the connector argument to
> >   .get_modes() and .get_edid()
> > 
> > Changes since v1:
> > 
> > - Make .hpd_enable() and .hpd_disable() optional
> > - Rename .lost_hotplug() to .hpd_notify()
> > - Add ddc field to drm_bridge
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 162 +++++++++++++++++++++++++++++
> >  include/drm/drm_bridge.h     | 192 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 353 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 68ab933ee430..78d26a9a3ee6 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -71,6 +71,8 @@ static LIST_HEAD(bridge_list);
> >   */
> >  void drm_bridge_add(struct drm_bridge *bridge)
> >  {
> > +	mutex_init(&bridge->hpd_mutex);
> > +
> >  	mutex_lock(&bridge_lock);
> >  	list_add_tail(&bridge->list, &bridge_list);
> >  	mutex_unlock(&bridge_lock);
> > @@ -87,6 +89,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
> >  	mutex_lock(&bridge_lock);
> >  	list_del_init(&bridge->list);
> >  	mutex_unlock(&bridge_lock);
> > +
> > +	mutex_destroy(&bridge->hpd_mutex);
> >  }
> >  EXPORT_SYMBOL(drm_bridge_remove);
> >  
> > @@ -919,6 +923,164 @@ int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
> >  
> > +/**
> > + * drm_bridge_detect - check if anything is attached to the bridge output
> > + * @bridge: bridge control structure
> > + *
> > + * If the bridge supports output detection, as reported by the
> > + * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect for the
> > + * bridge and return the connection status. Otherwise return
> > + * connector_status_unknown.
> > + *
> > + * RETURNS:
> > + * The detection status on success, or connector_status_unknown if the bridge
> > + * doesn't support output detection.
> > + */
> > +enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge)
> > +{
> > +	if (!(bridge->ops & DRM_BRIDGE_OP_DETECT))
> > +		return connector_status_unknown;
> > +
> > +	return bridge->funcs->detect(bridge);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_detect);
> > +
> > +/**
> > + * drm_bridge_get_modes - fill all modes currently valid for the sink into the
> > + * @connector
> > + * @bridge: bridge control structure
> > + * @connector: the connector to fill with modes
> > + *
> > + * If the bridge supports output modes retrieval, as reported by the
> > + * DRM_BRIDGE_OP_MODES bridge ops flag, call &drm_bridge_funcs.get_modes to
> > + * fill the connector with all valid modes and return the number of modes
> > + * added. Otherwise return 0.
> > + *
> > + * RETURNS:
> > + * The number of modes added to the connector.
> > + */
> > +int drm_bridge_get_modes(struct drm_bridge *bridge,
> > +			 struct drm_connector *connector)
> > +{
> > +	if (!(bridge->ops & DRM_BRIDGE_OP_MODES))
> > +		return 0;
> > +
> > +	return bridge->funcs->get_modes(bridge, connector);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
> > +
> > +/**
> > + * drm_bridge_get_edid - get the EDID data of the connected display
> > + * @bridge: bridge control structure
> > + * @connector: the connector to read EDID for
> > + *
> > + * If the bridge supports output EDID retrieval, as reported by the
> > + * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
> > + * get the EDID and return it. Otherwise return ERR_PTR(-ENOTSUPP).
> > + *
> > + * RETURNS:
> > + * The retrieved EDID on success, or an error pointer otherwise.
> > + */
> > +struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
> > +				 struct drm_connector *connector)
> > +{
> > +	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
> > +		return ERR_PTR(-ENOTSUPP);
> > +
> > +	return bridge->funcs->get_edid(bridge, connector);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_get_edid);
> > +
> > +/**
> > + * drm_bridge_hpd_enable - enable hot plug detection for the bridge
> > + * @bridge: bridge control structure
> > + * @cb: hot-plug detection callback
> > + * @data: data to be passed to the hot-plug detection callback
> > + *
> > + * Call &drm_bridge_funcs.hpd_enable if implemented and register the given @cb
> > + * and @data as hot plug notification callback. From now on the @cb will be
> > + * called with @data when an output status change is detected by the bridge,
> > + * until hot plug notification gets disabled with drm_bridge_hpd_disable().
> > + *
> > + * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
> > + * bridge->ops. This function shall not be called when the flag is not set.
> > + *
> > + * Only one hot plug detection callback can be registered at a time, it is an
> > + * error to call this function when hot plug detection is already enabled for
> > + * the bridge.
> > + */
> > +void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> > +			   void (*cb)(void *data,
> > +				      enum drm_connector_status status),
> > +			   void *data)
> > +{
> > +	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
> 
> Supplying a NULL bridge is a caller bug imo, and you're inconsistent in
> handling this. Imo just drop.

Sounds good to me, I'll drop it.

> > +		return;
> > +
> > +	mutex_lock(&bridge->hpd_mutex);
> > +
> > +	if (WARN(bridge->hpd_cb, "Hot plug detection already enabled\n"))
> > +		goto unlock;
> > +
> > +	bridge->hpd_cb = cb;
> > +	bridge->hpd_data = data;
> > +
> > +	if (bridge->funcs->hpd_enable)
> > +		bridge->funcs->hpd_enable(bridge);
> > +
> > +unlock:
> > +	mutex_unlock(&bridge->hpd_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_hpd_enable);
> > +
> > +/**
> > + * drm_bridge_hpd_disable - disable hot plug detection for the bridge
> > + * @bridge: bridge control structure
> > + *
> > + * Call &drm_bridge_funcs.hpd_disable if implemented and unregister the hot
> > + * plug detection callback previously registered with drm_bridge_hpd_enable().
> > + * Once this function returns the callback will not be called by the bridge
> > + * when an output status change occurs.
> > + *
> > + * Hot plug detection is supported only if the DRM_BRIDGE_OP_HPD flag is set in
> > + * bridge->ops. This function shall not be called when the flag is not set.
> > + */
> > +void drm_bridge_hpd_disable(struct drm_bridge *bridge)
> > +{
> > +	if (!bridge || !(bridge->ops & DRM_BRIDGE_OP_HPD))
> > +		return;
> > +
> > +	mutex_lock(&bridge->hpd_mutex);
> > +	if (bridge->funcs->hpd_disable)
> > +		bridge->funcs->hpd_disable(bridge);
> > +
> > +	bridge->hpd_cb = NULL;
> > +	bridge->hpd_data = NULL;
> > +	mutex_unlock(&bridge->hpd_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_hpd_disable);
> > +
> > +/**
> > + * drm_bridge_hpd_notify - notify hot plug detection events
> > + * @bridge: bridge control structure
> > + * @status: output connection status
> > + *
> > + * Bridge drivers shall call this function to report hot plug events when they
> > + * detect a change in the output status, when hot plug detection has been
> > + * enabled by drm_bridge_hpd_enable().
> > + *
> > + * This function shall be called in a context that can sleep.
> > + */
> > +void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> > +			   enum drm_connector_status status)
> > +{
> > +	mutex_lock(&bridge->hpd_mutex);
> > +	if (bridge->hpd_cb)
> > +		bridge->hpd_cb(bridge->hpd_data, status);
> > +	mutex_unlock(&bridge->hpd_mutex);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> > +
> >  #ifdef CONFIG_OF
> >  /**
> >   * of_drm_find_bridge - find the bridge corresponding to the device node in
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 45626ecf20f8..ba9b7c84f11e 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -23,8 +23,9 @@
> >  #ifndef __DRM_BRIDGE_H__
> >  #define __DRM_BRIDGE_H__
> >  
> > -#include <linux/list.h>
> >  #include <linux/ctype.h>
> > +#include <linux/list.h>
> > +#include <linux/mutex.h>
> >  
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_encoder.h>
> > @@ -33,7 +34,10 @@
> >  
> >  struct drm_bridge;
> >  struct drm_bridge_timings;
> > +struct drm_connector;
> >  struct drm_panel;
> > +struct edid;
> > +struct i2c_adapter;
> >  
> >  /**
> >   * struct drm_bridge_funcs - drm_bridge control functions
> > @@ -488,6 +492,119 @@ struct drm_bridge_funcs {
> >  	 * giving the reason of the failure otherwise.
> >  	 */
> >  	struct drm_bridge_state *(*atomic_reset)(struct drm_bridge *bridge);
> > +
> > +	/**
> > +	 * @detect:
> > +	 *
> > +	 * Check if anything is attached to the bridge output.
> > +	 *
> > +	 * This callback is optional, if not implemented the bridge will be
> > +	 * considered as always having a component attached to its output.
> > +	 * Bridges that implement this callback shall set the
> > +	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * drm_connector_status indicating the bridge output status.
> > +	 */
> > +	enum drm_connector_status (*detect)(struct drm_bridge *bridge);
> > +
> > +	/**
> > +	 * @get_modes:
> > +	 *
> > +	 * Fill all modes currently valid for the sink into the &drm_connector
> > +	 * with drm_mode_probed_add().
> > +	 *
> > +	 * The @get_modes callback is mostly intended to support non-probeable
> > +	 * displays such as many fixed panels. Bridges that support reading
> > +	 * EDID shall leave @get_modes unimplemented and implement the
> > +	 * &drm_bridge_funcs->get_edid callback instead.
> > +	 *
> > +	 * This callback is optional. Bridges that implement it shall set the
> > +	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
> > +	 *
> > +	 * The connector parameter shall be used for the sole purpose of
> > +	 * filling modes, and shall not be stored internally by bridge drivers
> > +	 * for future usage.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * The number of modes added by calling drm_mode_probed_add().
> > +	 */
> > +	int (*get_modes)(struct drm_bridge *bridge,
> > +			 struct drm_connector *connector);
> > +
> > +	/**
> > +	 * @get_edid:
> > +	 *
> > +	 * Read and parse the EDID data of the connected display.
> > +	 *
> > +	 * The @get_edid callback is the preferred way of reporting mode
> > +	 * information for a display connected to the bridge output. Bridges
> > +	 * that support reading EDID shall implement this callback and leave
> > +	 * the @get_modes callback unimplemented.
> > +	 *
> > +	 * The caller of this operation shall first verify the output
> > +	 * connection status and refrain from reading EDID from a disconnected
> > +	 * output.
> > +	 *
> > +	 * This callback is optional. Bridges that implement it shall set the
> > +	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
> > +	 *
> > +	 * The connector parameter shall be used for the sole purpose of EDID
> > +	 * retrieval and parsing, and shall not be stored internally by bridge
> > +	 * drivers for future usage.
> > +	 *
> > +	 * RETURNS:
> > +	 *
> > +	 * An edid structure newly allocated with kmalloc() (or similar) on
> > +	 * success, or NULL otherwise. The caller is responsible for freeing
> > +	 * the returned edid structure with kfree().
> > +	 */
> > +	struct edid *(*get_edid)(struct drm_bridge *bridge,
> > +				 struct drm_connector *connector);
> > +
> > +	/**
> > +	 * @hpd_notify:
> > +	 *
> > +	 * Notify the bridge of hot plug detection.
> > +	 *
> > +	 * This callback is optional, it may be implemented by bridges that
> > +	 * need to be notified of display connection or disconnection for
> > +	 * internal reasons. One use case is to reset the internal state of CEC
> > +	 * controllers for HDMI bridges.
> > +	 */
> > +	void (*hpd_notify)(struct drm_bridge *bridge,
> > +			   enum drm_connector_status status);
> > +
> > +	/**
> > +	 * @hpd_enable:
> > +	 *
> > +	 * Enable hot plug detection. From now on the bridge shall call
> > +	 * drm_bridge_hpd_notify() each time a change is detected in the output
> > +	 * connection status, until hot plug detection gets disabled with
> > +	 * @hpd_disable.
> > +	 *
> > +	 * This callback is optional and shall only be implemented by bridges
> > +	 * that support hot-plug notification without polling. Bridges that
> > +	 * implement it shall also implement the @hpd_disable callback and set
> > +	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> > +	 */
> > +	void (*hpd_enable)(struct drm_bridge *bridge);
> > +
> > +	/**
> > +	 * @hpd_disable:
> > +	 *
> > +	 * Disable hot plug detection. Once this function returns the bridge
> > +	 * shall not call drm_bridge_hpd_notify() when a change in the output
> > +	 * connection status occurs.
> > +	 *
> > +	 * This callback is optional and shall only be implemented by bridges
> > +	 * that support hot-plug notification without polling. Bridges that
> > +	 * implement it shall also implement the @hpd_enable callback and set
> > +	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> > +	 */
> > +	void (*hpd_disable)(struct drm_bridge *bridge);
> >  };
> >  
> >  /**
> > @@ -526,6 +643,39 @@ struct drm_bridge_timings {
> >  	bool dual_link;
> >  };
> >  
> > +/**
> > + * enum drm_bridge_ops - Bitmask of operations supported by the bridge
> > + */
> > +enum drm_bridge_ops {
> > +	/**
> > +	 * @DRM_BRIDGE_OP_DETECT: The bridge can detect displays connected to
> > +	 * its output. Bridges that set this flag shall implement the
> > +	 * &drm_bridge_funcs->detect callback.
> > +	 */
> > +	DRM_BRIDGE_OP_DETECT = BIT(0),
> > +	/**
> > +	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
> > +	 * connected to its output. Bridges that set this flag shall implement
> > +	 * the &drm_bridge_funcs->get_edid callback.
> > +	 */
> > +	DRM_BRIDGE_OP_EDID = BIT(1),
> > +	/**
> > +	 * @DRM_BRIDGE_OP_HPD: The bridge can detect hot-plug and hot-unplug
> > +	 * without requiring polling. Bridges that set this flag shall
> > +	 * implement the &drm_bridge_funcs->hpd_enable and
> > +	 * &drm_bridge_funcs->hpd_disable callbacks if they support enabling
> > +	 * and disabling hot-plug detection dynamically.
> > +	 */
> > +	DRM_BRIDGE_OP_HPD = BIT(2),
> > +	/**
> > +	 * @DRM_BRIDGE_OP_MODES: The bridge can retrieve the modes supported
> > +	 * by the display at its output. This does not include reading EDID
> > +	 * which is separately covered by @DRM_BRIDGE_OP_EDID. Bridges that set
> > +	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> > +	 */
> > +	DRM_BRIDGE_OP_MODES = BIT(3),
> > +};
> 
> I still don't like this one here, since most of them are tracking
> redundant information. If you don't like just checking for the hook
> directly wrap it in a helper, e.g.
> 
> bool drm_bridge_supports_detect(bridge)
> {
> 	return bridge->ops->detect;
> }

It seems I've done a really bad job explaining why the flags are
required, so let me try again :-)

There's a difference between supporting an operation in a driver, and
supporting it in a given system. When a bridge hardware supports reading
EDID, or detecting hotplug, the driver will implement this and expose
the corresponding operation in drm_bridge_funcs by setting the function
pointers appropriately.

However, this doesn't mean that the DDC lines are wired to the bridge on
a particular board, they could be connected to an I2C controller of the
SoC. Same for the HPD line, it could be connected to a GPIO instead of a
dedicated pin of the bridge. This board-specific information is reported
by the firmware (ACPI or DT), parsed by the bridge driver, and reflected
in the drm_bridge_ops flags.

drm_bridge_funcs and drm_bridge_ops are thus different, the latter
supplements the former. We could merge the two by setting the
corresponding function pointer in drm_bridge_funcs to NULL when the
drm_bridge_ops flag isn't set. This would however require allocating
drm_bridge_funcs dynamically (either by embedding it into a
driver-specific structure, or allocating it dynamically directly)
instead of using a global static const struct, and this is considered to
be a security issue as it allows a potential attacker to overwrite
function pointers (there have been quite a lot of security patches
merged that move function pointers to .rodata or otherwise const
memory).

> hpd seems to be special, since a bridge can support hotplug but not have
> the enable_hpd/disable_hpd hooks. Which smells somewhat fishy, since if
> you have multiple bridges with hpd, how do you make sure you get hpd
> events only from the right one?

On a given board HPD should only be generated by one bridge in practice.
If we ever encounter systems where multiple bridges can generate HPD for
the same external HPD event, I think we can deal with them at that time.

> Aside from that just having a
> 
> 	bool supports_hpd;
> 
> seems a lot simpler.

If we only needed DRM_BRIDGE_OP_HPD, I agree that a bool would be
simpler, but as explained above we need the other ones too :-)

> Yes I know that the drm DRIVER_FOO flags don't work like that, and I'm
> kinda unhappy about them since forever. Managed to delete most of them
> even :-)
> 
> > +
> >  /**
> >   * struct drm_bridge - central DRM bridge control structure
> >   */
> > @@ -554,6 +704,33 @@ struct drm_bridge {
> >  	const struct drm_bridge_funcs *funcs;
> >  	/** @driver_private: pointer to the bridge driver's internal context */
> >  	void *driver_private;
> > +	/** @ops: bitmask of operations supported by the bridge */
> > +	enum drm_bridge_ops ops;
> > +	/**
> > +	 * @type: Type of the connection at the bridge output
> > +	 * (DRM_MODE_CONNECTOR_*). For bridges at the end of this chain this
> > +	 * identifies the type of connected display.
> > +	 */
> > +	int type;
> > +	/**
> > +	 * @ddc: Associated I2C adapter for DDC access, if any.
> > +	 */
> > +	struct i2c_adapter *ddc;
> > +	/** private: */
> > +	/**
> > +	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
> > +	 */
> > +	struct mutex hpd_mutex;
> > +	/**
> > +	 * @hpd_cb: Hot plug detection callback, registered with
> > +	 * drm_bridge_hpd_enable().
> > +	 */
> > +	void (*hpd_cb)(void *data, enum drm_connector_status status);
> > +	/**
> > +	 * @hpd_data: Private data passed to the Hot plug detection callback
> > +	 * @hpd_cb.
> > +	 */
> > +	void *hpd_data;
> >  };
> >  
> >  static inline struct drm_bridge *
> > @@ -660,6 +837,19 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
> >  					u32 output_fmt,
> >  					unsigned int *num_input_fmts);
> >  
> > +enum drm_connector_status drm_bridge_detect(struct drm_bridge *bridge);
> > +int drm_bridge_get_modes(struct drm_bridge *bridge,
> > +			 struct drm_connector *connector);
> > +struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
> > +				 struct drm_connector *connector);
> > +void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> > +			   void (*cb)(void *data,
> > +				      enum drm_connector_status status),
> > +			   void *data);
> > +void drm_bridge_hpd_disable(struct drm_bridge *bridge);
> > +void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> > +			   enum drm_connector_status status);
> > +
> >  #ifdef CONFIG_DRM_PANEL_BRIDGE
> >  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel);
> >  struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
