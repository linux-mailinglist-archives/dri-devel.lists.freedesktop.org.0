Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF93148386
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 12:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AF06E328;
	Fri, 24 Jan 2020 11:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA96E328;
 Fri, 24 Jan 2020 11:36:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 03:36:56 -0800
X-IronPort-AV: E=Sophos;i="5.70,357,1574150400"; d="scan'208";a="220996786"
Received: from omarkovx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.37.60])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 03:36:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajat Jain <rajatja@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Chris
 Wilson <chris@chris-wilson.co.uk>, Imre Deak <imre.deak@intel.com>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 mathewk@google.com, Daniel Thompson <daniel.thompson@linaro.org>, Jonathan
 Corbet <corbet@lwn.net>, Pavel Machek <pavel@denx.de>,
 seanpaul@google.com, Duncan Laurie <dlaurie@google.com>,
 jsbarnes@google.com, Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 2/3] drm/i915: Lookup and attach ACPI device node for
 connectors
In-Reply-To: <20191220200353.252399-2-rajatja@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191220200353.252399-1-rajatja@google.com>
 <20191220200353.252399-2-rajatja@google.com>
Date: Fri, 24 Jan 2020 13:37:48 +0200
Message-ID: <87v9p1gk4z.fsf@intel.com>
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
Cc: Rajat Jain <rajatja@google.com>, rajatxjain@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 20 Dec 2019, Rajat Jain <rajatja@google.com> wrote:
> Lookup and attach ACPI nodes for intel connectors. The lookup is done
> in compliance with ACPI Spec 6.3
> https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> (Ref: Pages 1119 - 1123).
>
> This can be useful for any connector specific platform properties. (This
> will be used for privacy screen in next patch).
>
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v5: same as v4
> v4: Same as v3
> v3: fold the code into existing acpi_device_id_update() function
> v2: formed by splitting the original patch into ACPI lookup, and privacy
>     screen property. Also move it into i915 now that I found existing code
>     in i915 that can be re-used.
>
>  drivers/gpu/drm/i915/display/intel_acpi.c     | 24 +++++++++++++++++++
>  .../drm/i915/display/intel_display_types.h    |  3 +++
>  drivers/gpu/drm/i915/display/intel_dp.c       |  3 +++
>  3 files changed, 30 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index e21fb14d5e07..101a56c08996 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -222,11 +222,23 @@ static u32 acpi_display_type(struct intel_connector *connector)
>  	return display_type;
>  }
>  
> +/*
> + * Ref: ACPI Spec 6.3
> + * https://uefi.org/sites/default/files/resources/ACPI_6_3_final_Jan30.pdf
> + * Pages 1119 - 1123 describe, what I believe, a standard way of
> + * identifying / addressing "display panels" in the ACPI. It provides
> + * a way for the ACPI to define devices for the display panels attached
> + * to the system. It thus provides a way for the BIOS to export any panel
> + * specific properties to the system via ACPI (like device trees).
> + */
>  void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>  {
>  	struct drm_device *drm_dev = &dev_priv->drm;
>  	struct intel_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
> +	struct device *dev = &drm_dev->pdev->dev;

Hmm, already pushed patch 1 with the unfortunate "drm_dev" local. We use
"dev" for struct drm_device * and almost never use struct device.

> +	struct acpi_device *conn_dev;
> +	u64 conn_addr;
>  	u8 display_index[16] = {};
>  
>  	/* Populate the ACPI IDs for all connectors for a given drm_device */
> @@ -242,6 +254,18 @@ void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
>  		device_id |= display_index[type]++ << ACPI_DISPLAY_INDEX_SHIFT;
>  
>  		connector->acpi_device_id = device_id;
> +
> +		/* Build the _ADR to look for */
> +		conn_addr = device_id | ACPI_DEVICE_ID_SCHEME |
> +				ACPI_BIOS_CAN_DETECT;
> +
> +		DRM_DEV_INFO(dev, "Checking connector ACPI node at _ADR=%llX\n",
> +			     conn_addr);

This is more than a little verbose. One line of INFO level dmesg for
every connector at boot and at resume.

Please use the new drm_dbg_kms() macro for this.

> +
> +		/* Look up the connector device, under the PCI device */
> +		conn_dev = acpi_find_child_device(ACPI_COMPANION(dev),
> +						  conn_addr, false);
> +		connector->acpi_handle = conn_dev ? conn_dev->handle : NULL;

acpi_device_handle(conn_dev)

>  	}
>  	drm_connector_list_iter_end(&conn_iter);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 1a7334dbe802..0a4a04116091 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -407,6 +407,9 @@ struct intel_connector {
>  	/* ACPI device id for ACPI and driver cooperation */
>  	u32 acpi_device_id;
>  
> +	/* ACPI handle corresponding to this connector display, if found */
> +	void *acpi_handle;
> +

The type is acpi_handle. It's none of our business to know what the
underlying type is.

>  	/* Reads out the current hw, returning true if the connector is enabled
>  	 * and active (i.e. dpms ON state). */
>  	bool (*get_hw_state)(struct intel_connector *);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index b05b2191b919..93cece8e2516 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -45,6 +45,7 @@
>  #include "i915_debugfs.h"
>  #include "i915_drv.h"
>  #include "i915_trace.h"
> +#include "intel_acpi.h"
>  #include "intel_atomic.h"
>  #include "intel_audio.h"
>  #include "intel_connector.h"
> @@ -6623,6 +6624,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *connect
>  
>  		connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
>  
> +		/* Lookup the ACPI node corresponding to the connector */
> +		intel_acpi_device_id_update(dev_priv);

Auch, this is problematic. It iterates all connectors, for every DP
connector being added. In the middle of registering all connectors.

From the POV of this patch alone, this is also unnecessary. This gets
called via intel_opregion_register() after all connectors have been
registered.

I am aware it's not enough for your next patch, because it will need the
acpi handle right here.

I'm wondering if we need to maintain display_index[] in struct
drm_i915_private, and update that as connectors get added instead of all
at once in the end. connector->acpi_device_id never changes, does it,
even though we keep updating it?

BR,
Jani.


>  	}
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
