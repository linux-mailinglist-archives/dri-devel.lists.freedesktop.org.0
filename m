Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADB211F726
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 11:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A26289DEC;
	Sun, 15 Dec 2019 10:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6579189DEC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 10:22:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3AD5520073;
 Sun, 15 Dec 2019 11:22:46 +0100 (CET)
Date: Sun, 15 Dec 2019 11:22:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 04/50] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20191215102244.GC27552@ravnborg.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210225750.15709-5-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=4J5Ll_7usMxEsU5R4UYA:9 a=VJCKV2MZaiit4vhI:21 a=sbkBHXUCj6R2Q028:21
 a=CjuIK1q_8ugA:10
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

Hi Laurent

Small nit below.

>  /**
>   * struct drm_bridge_funcs - drm_bridge control functions
> @@ -338,6 +343,119 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>  				    struct drm_atomic_state *old_state);
> +
> +	/**
> +	 * @detect:
> +	 *
> +	 * Check if anything is attached to the bridge output.
> +	 *
> +	 * This callback is optional, if not implemented the bridge will be
> +	 * considered as always having a component attached to its output.
> +	 * Bridges that implement this callback shall set the
> +	 * DRM_BRIDGE_OP_DETECT flag in their &drm_bridge->ops.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * drm_connector_status indicating the bridge output status.
> +	 */
> +	enum drm_connector_status (*detect)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @get_modes:
> +	 *
> +	 * Fill all modes currently valid for the sink into the &drm_connector
> +	 * with drm_mode_probed_add().
> +	 *
> +	 * The @get_modes callback is mostly intended to support non-probable
non-probeable?

> +	 * displays such as many fixed panels. Bridges that support reading
> +	 * EDID shall leave @get_modes unimplemented and implement the
> +	 * &drm_bridge_funcs->get_edid callback instead.
> +	 *
> +	 * This callback is optional. Bridges that implement it shall set the
> +	 * DRM_BRIDGE_OP_MODES flag in their &drm_bridge->ops.
> +	 *
> +	 * The connector parameter shall be used for the sole purpose of
> +	 * filling modes, and shall not be stored internally by bridge drivers
> +	 * for future usage.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * The number of modes added by calling drm_mode_probed_add().
> +	 */
> +	int (*get_modes)(struct drm_bridge *bridge,
> +			 struct drm_connector *connector);
> +
> +	/**
> +	 * @get_edid:
> +	 *
> +	 * Read and parse the EDID data of the connected display.
> +	 *
> +	 * The @get_edid callback is the preferred way of reporting mode
> +	 * information for a display connected to the bridge output. Bridges
> +	 * that support readind EDID shall implement this callback and leave
s/readind/probing/? - or fix the spelling mistake.

> +	 * the @get_modes callback unimplemented.
> +	 *
> +	 * The caller of this operation shall first verify the output
> +	 * connection status and refrain from reading EDID from a disconnected
> +	 * output.
> +	 *
> +	 * This callback is optional. Bridges that implement it shall set the
> +	 * DRM_BRIDGE_OP_EDID flag in their &drm_bridge->ops.
> +	 *
> +	 * The connector parameter shall be used for the sole purpose of EDID
> +	 * retrieval and parsing, and shall not be stored internally by bridge
> +	 * drivers for future usage.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * An edid structure newly allocated with kmalloc() (or similar) on
> +	 * success, or NULL otherwise. The caller is responsible for freeing
> +	 * the returned edid structure with kfree().
> +	 */
> +	struct edid *(*get_edid)(struct drm_bridge *bridge,
> +				 struct drm_connector *connector);
> +
> +	/**
> +	 * @hpd_notify:
> +	 *
> +	 * Notify the bridge of hot plug detection.
> +	 *
> +	 * This callback is optional, it may be implemented by bridges that
> +	 * need to be notified of display connection or disconnection for
> +	 * internal reasons. One use case is to reset the internal state of CEC
> +	 * controllers for HDMI bridges.
> +	 */
> +	void (*hpd_notify)(struct drm_bridge *bridge,
> +			   enum drm_connector_status status);
> +
> +	/**
> +	 * @hpd_enable:
> +	 *
> +	 * Enable hot plug detection. From now on the bridge shall call
> +	 * drm_bridge_hpd_notify() each time a change is detected in the output
> +	 * connection status, until hot plug detection gets disabled with
> +	 * @hpd_disable.
> +	 *
> +	 * This callback is optional and shall only be implemented by bridges
> +	 * that support hot-plug notification without polling. Bridges that
> +	 * implement it shall also implement the @hpd_disable callback and set
> +	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> +	 */
> +	void (*hpd_enable)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @hpd_disable:
> +	 *
> +	 * Disable hot plug detection. Once this function returns the bridge
> +	 * shall not call drm_bridge_hpd_notify() when a change in the output
> +	 * connection status occurs.
> +	 *
> +	 * This callback is optional and shall only be implemented by bridges
> +	 * that support hot-plug notification without polling. Bridges that
> +	 * implement it shall also implement the @hpd_enable callback and set
> +	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
> +	 */
> +	void (*hpd_disable)(struct drm_bridge *bridge);
>  };
>  
>  /**
> @@ -376,6 +494,39 @@ struct drm_bridge_timings {
>  	bool dual_link;
>  };
>  
> +/**
> + * enum drm_bridge_ops - Bitmask of operations supported by the bridge
> + */
> +enum drm_bridge_ops {
> +	/**
> +	 * @DRM_BRIDGE_OP_DETECT: The bridge can detect displays connected to
> +	 * its output. Bridges that set this flag shall implement the
> +	 * &drm_bridge_funcs->detect callback.
> +	 */
> +	DRM_BRIDGE_OP_DETECT = BIT(0),
> +	/**
> +	 * @DRM_BRIDGE_OP_EDID: The bridge can retrieve the EDID of the display
> +	 * connected to its output. Bridges that set this flag shall implement
> +	 * the &drm_bridge_funcs->get_edid callback.
> +	 */
> +	DRM_BRIDGE_OP_EDID = BIT(1),
> +	/**
> +	 * @DRM_BRIDGE_OP_HPD: The bridge can detect hot-plug and hot-unplug
> +	 * without requiring polling. Bridges that set this flag shall
> +	 * implement the &drm_bridge_funcs->hpd_enable and
> +	 * &drm_bridge_funcs->hpd_disable callbacks if they support enabling
> +	 * and disabling hot-plug detection dynamically.
> +	 */
> +	DRM_BRIDGE_OP_HPD = BIT(2),
> +	/**
> +	 * @DRM_BRIDGE_OP_MODES: The bridge can retrieving the modes supported
> +	 * by the display at its output. This does not include readind EDID
s/readind/probing/?
> +	 * which is separately covered by @DRM_BRIDGE_OP_EDID. Bridges that set
> +	 * this flag shall implement the &drm_bridge_funcs->get_modes callback.
> +	 */
> +	DRM_BRIDGE_OP_MODES = BIT(3),
> +};
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
