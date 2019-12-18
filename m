Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C579123C4A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8FBE6E209;
	Wed, 18 Dec 2019 01:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BB56E209
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:16:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBB3733B;
 Wed, 18 Dec 2019 02:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576631810;
 bh=IXBrIoA1Wx4QEg2t1+xgTI3HvTcJg6dMhtoBlf9I8YM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JjvyDKV0OCPY99Jtxle/wqjzCevR/gcWHDxbsW6kbg1AYitEiVftoKFaBp6QbBG6g
 xFYqNManEMpAXbhBlpSsyREZwHoFQoOmV4S0xIoz9ZSoLaYrdxxW3ADYj8AqDfcNdH
 7GmP0RBWs38QbSYHRDf874LhpKwsHw/KQLD4SSNU=
Date: Wed, 18 Dec 2019 03:16:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 04/50] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20191218011639.GI4874@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-5-laurent.pinchart@ideasonboard.com>
 <20191215102244.GC27552@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215102244.GC27552@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the review.

On Sun, Dec 15, 2019 at 11:22:44AM +0100, Sam Ravnborg wrote:
> >  /**
> >   * struct drm_bridge_funcs - drm_bridge control functions
> > @@ -338,6 +343,119 @@ struct drm_bridge_funcs {
> >  	 */
> >  	void (*atomic_post_disable)(struct drm_bridge *bridge,
> >  				    struct drm_atomic_state *old_state);
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
> > +	 * The @get_modes callback is mostly intended to support non-probable
>
> non-probeable?

It will be interested to see how we'll support improbable displays, but
for now I indeed want to focus on the non-probeable ones :-)

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
> > +	 * that support readind EDID shall implement this callback and leave
>
> s/readind/probing/? - or fix the spelling mistake.

I think I prefer reading as the operation is documented as "read and
parse the EDID".

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
> > @@ -376,6 +494,39 @@ struct drm_bridge_timings {
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
> > +	 * @DRM_BRIDGE_OP_MODES: The bridge can retrieving the modes supported
> > +	 * by the display at its output. This does not include readind EDID
>
> s/readind/probing/?
>
> > +	 * which is separately covered by @DRM_BRIDGE_OP_EDID. Bridges that set
> > +	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> > +	 */
> > +	DRM_BRIDGE_OP_MODES = BIT(3),
> > +};
> > +

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
