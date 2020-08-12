Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8B2427B2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 11:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC6D6E2F9;
	Wed, 12 Aug 2020 09:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCAA6E2F9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:35:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF121595;
 Wed, 12 Aug 2020 11:26:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1597224417;
 bh=nd5A/NqoRz9D4axjoXf+5BPmPqiCH64mLqHlBQHchh4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhhRn0pDKz3bSWG2BnT8nNTJnN+GudPkL7FMrhlnR6+lR63Dis82E2gYeSOFBNUIO
 Wxb4wC+1NR7QG6lCsUVzRz7kVl8kvMHk+oCoqfzlexvQ6UKnHirkHkmn201FKqpYp8
 86TdYdvoLd08QDp1h4AndE5aCwImLoUEcQlke33I=
Date: Wed, 12 Aug 2020 12:26:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 1/6] drm: Add connector atomic_begin/atomic_flush
Message-ID: <20200812092644.GD6057@pendragon.ideasonboard.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
 <20200812083407.856-1-algea.cao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812083407.856-1-algea.cao@rock-chips.com>
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
Cc: jernej.skrabec@siol.net, laurent.pinchart+renesas@ideasonboard.com,
 jonas@kwiboo.se, airlied@linux.ie, kuankuan.y@gmail.com,
 narmstrong@baylibre.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com, tzimmermann@suse.de,
 jbrunet@baylibre.com, linux-rockchip@lists.infradead.org, darekm@google.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Algea,

Thank you for the patch.

On Wed, Aug 12, 2020 at 04:34:07PM +0800, Algea Cao wrote:
> In some situations, connector should get some work done
> when plane is updating. Such as when change output color
> format, hdmi should send AVMUTE to make screen black before
> crtc updating color format, or screen may flash. After color
> updating, hdmi should clear AVMUTE bring screen back to normal.
> 
> The process is as follows:
> AVMUTE -> Update CRTC -> Update HDMI -> Clear AVMUTE
> 
> So we introduce connector atomic_begin/atomic_flush.

Implementing this through .atomic_begin() and .atomic_flush() seems like
a pretty big hack to me. Furthermore, I think this should be implemented
as bridge operations, not at the connector level, as the HDMI encoder
may not be the component that implements the drm_connector.

> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> 
> ---
> 
>  drivers/gpu/drm/drm_atomic_helper.c      | 46 ++++++++++++++++++++++++
>  include/drm/drm_modeset_helper_vtables.h | 19 ++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index f68c69a45752..f4abd700d2c4 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2471,6 +2471,8 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
>  				     struct drm_atomic_state *old_state,
>  				     uint32_t flags)
>  {
> +	struct drm_connector *connector;
> +	struct drm_connector_state *old_connector_state, *new_connector_state;
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>  	struct drm_plane *plane;
> @@ -2479,6 +2481,28 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
>  	bool active_only = flags & DRM_PLANE_COMMIT_ACTIVE_ONLY;
>  	bool no_disable = flags & DRM_PLANE_COMMIT_NO_DISABLE_AFTER_MODESET;
>  
> +	for_each_oldnew_connector_in_state(old_state, connector,
> +					   old_connector_state,
> +					   new_connector_state, i) {
> +		const struct drm_connector_helper_funcs *funcs;
> +
> +		if (!connector->state->crtc)
> +			continue;
> +
> +		if (!connector->state->crtc->state->active)
> +			continue;
> +
> +		funcs = connector->helper_private;
> +
> +		if (!funcs || !funcs->atomic_begin)
> +			continue;
> +
> +		DRM_DEBUG_ATOMIC("flush beginning [CONNECTOR:%d:%s]\n",
> +				 connector->base.id, connector->name);
> +
> +		funcs->atomic_begin(connector, old_connector_state);
> +	}
> +
>  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
>  		const struct drm_crtc_helper_funcs *funcs;
>  
> @@ -2550,6 +2574,28 @@ void drm_atomic_helper_commit_planes(struct drm_device *dev,
>  
>  		funcs->atomic_flush(crtc, old_crtc_state);
>  	}
> +
> +	for_each_oldnew_connector_in_state(old_state, connector,
> +					   old_connector_state,
> +					   new_connector_state, i) {
> +		const struct drm_connector_helper_funcs *funcs;
> +
> +		if (!connector->state->crtc)
> +			continue;
> +
> +		if (!connector->state->crtc->state->active)
> +			continue;
> +
> +		funcs = connector->helper_private;
> +
> +		if (!funcs || !funcs->atomic_flush)
> +			continue;
> +
> +		DRM_DEBUG_ATOMIC("flushing [CONNECTOR:%d:%s]\n",
> +				 connector->base.id, connector->name);
> +
> +		funcs->atomic_flush(connector, old_connector_state);
> +	}
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
>  
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 421a30f08463..10f3f2e2fe28 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1075,6 +1075,25 @@ struct drm_connector_helper_funcs {
>  	void (*atomic_commit)(struct drm_connector *connector,
>  			      struct drm_connector_state *state);
>  
> +	/**
> +	 * @atomic_begin:
> +	 *
> +	 * flush atomic update
> +	 *
> +	 * This callback is used by the atomic modeset helpers but it is optional.
> +	 */
> +	void (*atomic_begin)(struct drm_connector *connector,
> +			     struct drm_connector_state *state);
> +
> +	/**
> +	 * @atomic_begin:
> +	 *
> +	 * begin atomic update
> +	 *
> +	 * This callback is used by the atomic modeset helpers but it is optional.
> +	 */
> +	void (*atomic_flush)(struct drm_connector *connector,
> +			     struct drm_connector_state *state);
>  	/**
>  	 * @prepare_writeback_job:
>  	 *

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
