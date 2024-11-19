Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EDB9D2510
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 12:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C8210E630;
	Tue, 19 Nov 2024 11:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gDvhGgul";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C267610E62B;
 Tue, 19 Nov 2024 11:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732016488; x=1763552488;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9EblcBFbPrTpotpYAEFl7wQaTjBHWy6v/n6xQBDmnCk=;
 b=gDvhGgultq+hWrcFFMKTfus4kvjnxRuVWKy3RRh85TGmhpAoaXV572VA
 hM5nO8nZHIhcT7od845LqSdvqGNXbge6ebW45QX0xZHNkK1hcFh5Sn86m
 TtuQCnI8TTX9vlxS4q3cRiUBWkqK0pYOzZbudBojIGKyMjk/iMknTCfBb
 y9wK44LpsgaZjZ4A1jtGm1aASnmq9GXOoXF8IiH9TBe2ja6HPxxYQaaiy
 ylqL4OFiSSWco8jIl0Lr0QcctAtW7FDWzPBr+9TO7rpQAEV/dZ0+ZUkRW
 E+CCrzQmEnAqeU7IDzWX+tt1JBapWJOZTTQ2F8dtearKrbIANkaR7uvx/ A==;
X-CSE-ConnectionGUID: FUavzSi4RGu4T379pHt0vA==
X-CSE-MsgGUID: Lm/BYdXoRmmRXcqIVpIiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32157307"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32157307"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:41:27 -0800
X-CSE-ConnectionGUID: JEeNkOqIRnumUgKWydBNwg==
X-CSE-MsgGUID: dQCkOSkrQiGm0xrwo5mLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89329185"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:41:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCHv5 5/8] drm/i915/histogram: Add crtc properties for
 global histogram
In-Reply-To: <20241119104521.575377-6-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-6-arun.r.murthy@intel.com>
Date: Tue, 19 Nov 2024 13:41:21 +0200
Message-ID: <87ldxf30ym.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 19 Nov 2024, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> CRTC properties have been added for enable/disable histogram, reading
> the histogram data and writing the IET data.
> "HISTOGRAM_EN" is the crtc property to enable/disable the global
> histogram and takes a value 0/1 accordingly.
> "Histogram" is a crtc property to read the binary histogram data.
> "Global IET" is a crtc property to write the IET binary LUT data.
>
> v2: Read the histogram blob data before sending uevent (Jani)
> v3: use drm_property_replace_blob_from_id (Vandita)
>     Add substruct for histogram in intel_crtc_state (Jani)
> v4:  Rebased after addressing comments on patch 1
> v5: histogram check with old/new crtc_state (Suraj)
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
>  drivers/gpu/drm/i915/display/intel_crtc.c     | 168 +++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
>  drivers/gpu/drm/i915/display/intel_display.c  |  18 ++
>  .../drm/i915/display/intel_display_types.h    |  13 ++
>  .../gpu/drm/i915/display/intel_histogram.c    |   6 +
>  6 files changed, 214 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index 03dc54c802d3..a0d64a20b01e 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -246,6 +246,8 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  
>  	__drm_atomic_helper_crtc_duplicate_state(crtc, &crtc_state->uapi);
>  
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_get(crtc_state->histogram.global_iet);
>  	/* copy color blobs */
>  	if (crtc_state->hw.degamma_lut)
>  		drm_property_blob_get(crtc_state->hw.degamma_lut);
> @@ -278,6 +280,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
>  	crtc_state->dsb_color_vblank = NULL;
>  	crtc_state->dsb_commit = NULL;
>  	crtc_state->use_dsb = false;
> +	crtc_state->histogram.histogram_enable_changed = false;
>  
>  	return &crtc_state->uapi;
>  }
> @@ -314,6 +317,8 @@ intel_crtc_destroy_state(struct drm_crtc *crtc,
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_color_vblank);
>  	drm_WARN_ON(crtc->dev, crtc_state->dsb_commit);
>  
> +	if (crtc_state->histogram.global_iet)
> +		drm_property_blob_put(crtc_state->histogram.global_iet);
>  	__drm_atomic_helper_crtc_destroy_state(&crtc_state->uapi);
>  	intel_crtc_free_hw_state(crtc_state);
>  	if (crtc_state->dp_tunnel_ref.tunnel)
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
> index a2c528d707f4..3be81a5a789b 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_vblank_work.h>
> +#include <drm/drm_atomic_uapi.h>
>  
>  #include "i915_vgpu.h"
>  #include "i9xx_plane.h"
> @@ -27,6 +28,7 @@
>  #include "intel_drrs.h"
>  #include "intel_dsi.h"
>  #include "intel_fifo_underrun.h"
> +#include "intel_histogram.h"
>  #include "intel_pipe_crc.h"
>  #include "intel_psr.h"
>  #include "intel_sprite.h"
> @@ -210,6 +212,7 @@ static struct intel_crtc *intel_crtc_alloc(void)
>  static void intel_crtc_free(struct intel_crtc *crtc)
>  {
>  	intel_crtc_destroy_state(&crtc->base, crtc->base.state);
> +	intel_histogram_finish(crtc);
>  	kfree(crtc);
>  }
>  
> @@ -229,6 +232,66 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
>  	return 0;
>  }
>  
> +static int intel_crtc_get_property(struct drm_crtc *crtc,
> +				   const struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   uint64_t *val)
> +{
> +	struct drm_i915_private *i915 = to_i915(crtc->dev);

Please use intel_display, you don't need i915 for anything.

> +	const struct intel_crtc_state *intel_crtc_state =
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
> +
> +	if (property == intel_crtc->histogram_en_property) {
> +		*val = intel_crtc_state->histogram.histogram_enable;
> +	} else if (property == intel_crtc->global_iet_property) {
> +		*val = (intel_crtc_state->histogram.global_iet) ?
> +			intel_crtc_state->histogram.global_iet->base.id : 0;
> +	} else if (property == intel_crtc->histogram_property) {
> +		*val = (intel_crtc_state->histogram.histogram) ?
> +			intel_crtc_state->histogram.histogram->base.id : 0;
> +	} else {
> +		drm_err(&i915->drm,
> +			"Unknown property [PROP:%d:%s]\n",
> +			property->base.id, property->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int intel_crtc_set_property(struct drm_crtc *crtc,
> +				   struct drm_crtc_state *state,
> +				   struct drm_property *property,
> +				   u64 val)
> +{
> +	struct drm_i915_private *i915 = to_i915(crtc->dev);

Ditto.

> +	struct intel_crtc_state *intel_crtc_state =
> +		to_intel_crtc_state(state);
> +	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
> +	bool replaced = false;
> +
> +	if (property == intel_crtc->histogram_en_property) {
> +		intel_crtc_state->histogram.histogram_enable = val;
> +		return 0;
> +	}
> +
> +	if (property == intel_crtc->global_iet_property) {
> +		drm_property_replace_blob_from_id(crtc->dev,
> +						  &intel_crtc_state->histogram.global_iet,
> +						  val,
> +						  sizeof(uint32_t) * HISTOGRAM_IET_LENGTH,
> +						  -1, &replaced);
> +		if (replaced)
> +			intel_crtc_state->histogram.global_iet_changed = true;
> +		return 0;
> +	}
> +
> +	drm_dbg_atomic(&i915->drm, "Unknown property [PROP:%d:%s]\n",
> +		       property->base.id, property->name);
> +	return -EINVAL;
> +}
> +
>  #define INTEL_CRTC_FUNCS \
>  	.set_config = drm_atomic_helper_set_config, \
>  	.destroy = intel_crtc_destroy, \
> @@ -238,7 +301,9 @@ static int intel_crtc_late_register(struct drm_crtc *crtc)
>  	.set_crc_source = intel_crtc_set_crc_source, \
>  	.verify_crc_source = intel_crtc_verify_crc_source, \
>  	.get_crc_sources = intel_crtc_get_crc_sources, \
> -	.late_register = intel_crtc_late_register
> +	.late_register = intel_crtc_late_register, \
> +	.atomic_set_property = intel_crtc_set_property, \
> +	.atomic_get_property = intel_crtc_get_property
>  
>  static const struct drm_crtc_funcs bdw_crtc_funcs = {
>  	INTEL_CRTC_FUNCS,
> @@ -383,6 +448,10 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
>  	intel_color_crtc_init(crtc);
>  	intel_drrs_crtc_init(crtc);
>  	intel_crtc_crc_init(crtc);
> +	intel_histogram_init(crtc);
> +
> +	/* Initialize crtc properties */
> +	intel_crtc_add_property(crtc);
>  
>  	cpu_latency_qos_add_request(&crtc->vblank_pm_qos, PM_QOS_DEFAULT_VALUE);
>  
> @@ -737,3 +806,100 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
>  out:
>  	intel_psr_unlock(new_crtc_state);
>  }
> +
> +static const struct drm_prop_enum_list histogram_enable_names[] = {
> +	{ INTEL_HISTOGRAM_DISABLE, "Disable" },
> +	{ INTEL_HISTOGRAM_ENABLE, "Enable" },
> +};
> +
> +/**
> + * intel_attach_histogram_en_property() - add property to enable/disable histogram
> + * @intel_crtc: pointer to the struct intel_crtc on which the global histogram is to
> + *		be enabled/disabled
> + *
> + * "HISTOGRAM_EN" is the crtc propety to enable/disable global histogram

The old saying goes, if the code and comments disagree, both are wrong.

> + */
> +void intel_attach_histogram_en_property(struct intel_crtc *intel_crtc)
> +{
> +	struct drm_crtc *crtc = &intel_crtc->base;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop = intel_crtc->histogram_en_property;
> +	if (!prop) {
> +		prop = drm_property_create_enum(dev, 0,
> +						"Histogram_Enable",
> +						histogram_enable_names,
> +						ARRAY_SIZE(histogram_enable_names));
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_en_property = prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +}
> +
> +/**
> + * intel_attach_global_iet_property() - add property to write Image Enhancement data
> + * @intel_crtc: pointer to the struct intel_crtc on which global histogram is enabled
> + *
> + * "Global IET" is the crtc property to write the Image Enhancement LUT binary data
> + */
> +void intel_attach_global_iet_property(struct intel_crtc *intel_crtc)
> +{
> +	struct drm_crtc *crtc = &intel_crtc->base;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop;
> +
> +	prop = intel_crtc->global_iet_property;
> +	if (!prop) {
> +		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB | DRM_MODE_PROP_ATOMIC,
> +					   "Global IET", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->global_iet_property = prop;
> +	}
> +
> +	drm_object_attach_property(&crtc->base, prop, 0);
> +}
> +
> +/**
> + * intel_attach_histogram_property() - crtc property to read the histogram.
> + * @intel_crtc: pointer to the struct intel_crtc on which the global histogram
> + *		was enabled.
> + * "Global Histogram" is the crtc property to read the binary histogram data.
> + */
> +void intel_attach_histogram_property(struct intel_crtc *intel_crtc)
> +{
> +	struct drm_crtc *crtc = &intel_crtc->base;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_property *prop;
> +	struct drm_property_blob *blob;
> +
> +	prop = intel_crtc->histogram_property;
> +	if (!prop) {
> +		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
> +					   DRM_MODE_PROP_ATOMIC |
> +					   DRM_MODE_PROP_IMMUTABLE,
> +					   "Global Histogram", 0);
> +		if (!prop)
> +			return;
> +
> +		intel_crtc->histogram_property = prop;
> +	}
> +	blob = drm_property_create_blob(dev, sizeof(uint32_t) * HISTOGRAM_BIN_COUNT, NULL);
> +	intel_crtc->config->histogram.histogram = blob;
> +
> +	drm_object_attach_property(&crtc->base, prop, blob->base.id);
> +}
> +
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc)
> +{
> +	intel_attach_histogram_en_property(intel_crtc);
> +	intel_attach_histogram_property(intel_crtc);
> +	intel_attach_global_iet_property(intel_crtc);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc.h b/drivers/gpu/drm/i915/display/intel_crtc.h
> index de54ae1deedf..4e0a3c43d4f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc.h
> +++ b/drivers/gpu/drm/i915/display/intel_crtc.h
> @@ -7,6 +7,7 @@
>  #define _INTEL_CRTC_H_
>  
>  #include <linux/types.h>
> +#include <drm/drm_crtc.h>

Do not include anything in headers unless you absolutely have to.

>  
>  enum i9xx_plane_id;
>  enum pipe;
> @@ -59,4 +60,8 @@ void intel_wait_for_vblank_if_active(struct drm_i915_private *i915,
>  				     enum pipe pipe);
>  void intel_crtc_wait_for_next_vblank(struct intel_crtc *crtc);
>  
> +int intel_crtc_add_property(struct intel_crtc *intel_crtc);
> +void intel_attach_histogram_en_property(struct intel_crtc *intel_crtc);
> +void intel_attach_global_iet_property(struct intel_crtc *intel_crtc);
> +void intel_attach_histogram_property(struct intel_crtc *intel_crtc);

Blank line missing here.

>  #endif
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index e790a2de5b3d..0c3008a2d774 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -93,6 +93,7 @@
>  #include "intel_fifo_underrun.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_hdmi.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug.h"
>  #include "intel_link_bw.h"
>  #include "intel_lvds.h"
> @@ -4607,6 +4608,10 @@ static int intel_crtc_atomic_check(struct intel_atomic_state *state,
>  	if (ret)
>  		return ret;
>  
> +	/* HISTOGRAM changed */
> +	if (crtc_state->histogram.histogram_enable_changed)
> +		return intel_histogram_atomic_check(crtc);
> +
>  	return 0;
>  }
>  
> @@ -6826,6 +6831,11 @@ int intel_atomic_check(struct drm_device *dev,
>  		if (new_crtc_state->uapi.scaling_filter !=
>  		    old_crtc_state->uapi.scaling_filter)
>  			new_crtc_state->uapi.mode_changed = true;
> +
> +		/* Histogram updates */
> +		if (old_crtc_state->histogram.histogram_enable !=
> +		    new_crtc_state->histogram.histogram_enable)
> +			new_crtc_state->histogram.histogram_enable_changed = true;
>  	}
>  
>  	intel_vrr_check_modeset(state);
> @@ -7892,6 +7902,14 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>  		 */
>  		old_crtc_state->dsb_color_vblank = fetch_and_zero(&new_crtc_state->dsb_color_vblank);
>  		old_crtc_state->dsb_commit = fetch_and_zero(&new_crtc_state->dsb_commit);
> +
> +		/* Re-Visit: HISTOGRAM related stuff */

What? Why?

> +		if (new_crtc_state->histogram.histogram_enable_changed)
> +			intel_histogram_update(crtc,
> +					       new_crtc_state->histogram.histogram_enable);
> +		if (new_crtc_state->histogram.global_iet_changed)
> +			intel_histogram_set_iet_lut(crtc,
> +						    (u32 *)new_crtc_state->histogram.global_iet->data);
>  	}
>  
>  	/* Underruns don't always raise interrupts, so check manually */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 351441efd10a..300e90998463 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1306,6 +1306,15 @@ struct intel_crtc_state {
>  
>  	/* LOBF flag */
>  	bool has_lobf;
> +
> +	/* Histogram data */
> +	struct {
> +		int histogram_enable;
> +		struct drm_property_blob *global_iet;
> +		struct drm_property_blob *histogram;
> +		bool global_iet_changed;
> +		bool histogram_enable_changed;
> +	} histogram;
>  };
>  
>  enum intel_pipe_crc_source {
> @@ -1415,6 +1424,10 @@ struct intel_crtc {
>  	struct pm_qos_request vblank_pm_qos;
>  
>  	struct intel_histogram *histogram;
> +	/* HISTOGRAM properties */
> +	struct drm_property *histogram_en_property;
> +	struct drm_property *global_iet_property;
> +	struct drm_property *histogram_property;
>  
>  #ifdef CONFIG_DEBUG_FS
>  	struct intel_pipe_crc pipe_crc;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 16f29923ef10..cba65f4260cd 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -82,6 +82,11 @@ static void intel_histogram_handle_int_work(struct work_struct *work)
>  	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
>  		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
>  	if (intel_histogram_get_data(intel_crtc)) {
> +		drm_property_replace_global_blob(display->drm,
> +				&intel_crtc->config->histogram.histogram,
> +				sizeof(histogram->bin_data),
> +				histogram->bin_data, &intel_crtc->base.base,
> +				intel_crtc->histogram_property);
>  		/* Notify user for Histogram rediness */
>  		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
>  				       KOBJ_CHANGE, histogram_event))
> @@ -203,6 +208,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_crtc)
>  
>  	cancel_delayed_work(&histogram->work);
>  	histogram->enable = false;
> +	intel_crtc->config->histogram.histogram_enable = false;
>  }
>  
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable)

-- 
Jani Nikula, Intel
