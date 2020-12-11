Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1F72D75EA
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 13:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A96EDD6;
	Fri, 11 Dec 2020 12:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486606EDD6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 12:45:58 +0000 (UTC)
IronPort-SDR: kQB1OFZQLTzzkvc/pvpXh/sS4/69BwMwjkfGt+3h4uCzSHQqUX263o5covYtaAvL7nDt5dKu++
 RZBlrFIBnvhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="173659683"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="173659683"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 04:45:57 -0800
IronPort-SDR: 9hhA5GIELBIYudeTO/0294Is+9P4uwcPAnN/FoT1UW9X/Ypv0TjVNlZxKqMm8zMV47S51TTV9R
 0MJwHzD4eqwg==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="365397976"
Received: from dkreft-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.158.206])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 04:45:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm: require each CRTC to have a unique primary
 plane
In-Reply-To: <y6eB32gmEqaxWjTJ5Xeb33BRE6M67fCwhmj06MMh6o@cp3-web-021.plabs.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <y6eB32gmEqaxWjTJ5Xeb33BRE6M67fCwhmj06MMh6o@cp3-web-021.plabs.ch>
Date: Fri, 11 Dec 2020 14:45:52 +0200
Message-ID: <87pn3g7bpb.fsf@intel.com>
MIME-Version: 1.0
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
Cc: daniel.vetter@ffwll.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 11 Dec 2020, Simon Ser <contact@emersion.fr> wrote:
> User-space expects to be able to pick a primary plane for each CRTC
> exposed by the driver. Make sure this assumption holds in
> drm_mode_config_validate.
>
> Use the legacy drm_crtc.primary field to check this, because it's
> simpler and we require drivers to set it anyways. Accumulate a set of
> primary planes which are already used for a CRTC in a bitmask. Error out
> if a primary plane is re-used.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c       |  6 ++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index fbe680035129..f143f56f0820 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -626,6 +626,9 @@ void drm_mode_config_validate(struct drm_device *dev)
>  {
>  	struct drm_encoder *encoder;
>  	struct drm_crtc *crtc;
> +	struct drm_plane *plane;
> +	__u64 primary_with_crtc = 0, cursor_with_crtc = 0;

Why __u64 and not u64?

> +	unsigned num_primary = 0;

I think the preference is to spell out the full type instead of using
just "unsigned".

BR,
Jani.

>  
>  	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>  		return;
> @@ -647,12 +650,30 @@ void drm_mode_config_validate(struct drm_device *dev)
>  			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
>  			     crtc->primary->base.id, crtc->primary->name,
>  			     crtc->base.id, crtc->name);
> +			WARN(primary_with_crtc & BIT(crtc->primary->index),
> +			     "Primary plane [PLANE:%d:%s] used for two CRTCs",
> +			     crtc->primary->base.id, crtc->primary->name);
> +			primary_with_crtc |= BIT(crtc->primary->index);
>  		}
>  		if (crtc->cursor) {
>  			WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
>  			     "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
>  			     crtc->cursor->base.id, crtc->cursor->name,
>  			     crtc->base.id, crtc->name);
> +			WARN(cursor_with_crtc & BIT(crtc->cursor->index),
> +			     "Primary plane [PLANE:%d:%s] used for two CRTCs",
> +			     crtc->cursor->base.id, crtc->cursor->name);
> +			cursor_with_crtc |= BIT(crtc->cursor->index);
>  		}
>  	}
> +
> +	drm_for_each_plane(plane, dev) {
> +		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +			num_primary++;
> +		}
> +	}
> +
> +	WARN(num_primary != dev->mode_config.num_crtc,
> +	     "Must have as many primary planes as there are CRTCs, but have %u primary planes and %u CRTCs",
> +	     num_primary, dev->mode_config.num_crtc);
>  }
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 49b0a8b9ac02..a1f4510efa83 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -54,6 +54,12 @@
>   * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
>   * &drm_plane.possible_crtcs.
>   *
> + * Each CRTC must have a unique primary plane userspace can attach to enable
> + * the CRTC. In other words, userspace must be able to attach a different
> + * primary plane to each CRTC at the same time. Primary planes can still be
> + * compatible with multiple CRTCs. There must be exactly as many primary planes
> + * as there are CRTCs.
> + *
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
>   * relies on the driver to set the primary and optionally the cursor plane used
>   * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
