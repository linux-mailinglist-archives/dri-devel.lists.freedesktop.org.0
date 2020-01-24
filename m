Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A07147F62
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 12:03:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5181B72A23;
	Fri, 24 Jan 2020 11:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC69D72A23;
 Fri, 24 Jan 2020 11:03:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 03:03:02 -0800
X-IronPort-AV: E=Sophos;i="5.70,357,1574150400"; d="scan'208";a="220989031"
Received: from omarkovx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.37.60])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 03:02:55 -0800
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
Subject: Re: [PATCH v5 1/3] drm/i915: Move the code to populate ACPI device ID
 into intel_acpi
In-Reply-To: <20191220200353.252399-1-rajatja@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191220200353.252399-1-rajatja@google.com>
Date: Fri, 24 Jan 2020 13:03:54 +0200
Message-ID: <87y2txglph.fsf@intel.com>
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
> Move the code that populates the ACPI device ID for devices, into
> more appripriate intel_acpi.c. This is done in preparation for more
> users of this code (in next patch).

Sorry for the delay, thanks for the patch, pushed to
drm-intel-next-queued.

BR,
Jani.

>
> Signed-off-by: Rajat Jain <rajatja@google.com>
> ---
> v5: same as v4
> v4: Same as v3
> v3: * Renamed the function to intel_acpi_*
>     * Used forward declaration for structure instead of header file inclusion.
>     * Fix a typo
> v2: v1 doesn't exist. Found existing code in i915 driver to assign the ACPI ID
>     which is what I plan to re-use.
>
>  drivers/gpu/drm/i915/display/intel_acpi.c     | 89 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h     |  5 ++
>  drivers/gpu/drm/i915/display/intel_opregion.c | 80 +----------------
>  3 files changed, 98 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index 3456d33feb46..e21fb14d5e07 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -10,6 +10,7 @@
>  
>  #include "i915_drv.h"
>  #include "intel_acpi.h"
> +#include "intel_display_types.h"
>  
>  #define INTEL_DSM_REVISION_ID 1 /* For Calpella anyway... */
>  #define INTEL_DSM_FN_PLATFORM_MUX_INFO 1 /* No args */
> @@ -156,3 +157,91 @@ void intel_register_dsm_handler(void)
>  void intel_unregister_dsm_handler(void)
>  {
>  }
> +
> +/*
> + * ACPI Specification, Revision 5.0, Appendix B.3.2 _DOD (Enumerate All Devices
> + * Attached to the Display Adapter).
> + */
> +#define ACPI_DISPLAY_INDEX_SHIFT		0
> +#define ACPI_DISPLAY_INDEX_MASK			(0xf << 0)
> +#define ACPI_DISPLAY_PORT_ATTACHMENT_SHIFT	4
> +#define ACPI_DISPLAY_PORT_ATTACHMENT_MASK	(0xf << 4)
> +#define ACPI_DISPLAY_TYPE_SHIFT			8
> +#define ACPI_DISPLAY_TYPE_MASK			(0xf << 8)
> +#define ACPI_DISPLAY_TYPE_OTHER			(0 << 8)
> +#define ACPI_DISPLAY_TYPE_VGA			(1 << 8)
> +#define ACPI_DISPLAY_TYPE_TV			(2 << 8)
> +#define ACPI_DISPLAY_TYPE_EXTERNAL_DIGITAL	(3 << 8)
> +#define ACPI_DISPLAY_TYPE_INTERNAL_DIGITAL	(4 << 8)
> +#define ACPI_VENDOR_SPECIFIC_SHIFT		12
> +#define ACPI_VENDOR_SPECIFIC_MASK		(0xf << 12)
> +#define ACPI_BIOS_CAN_DETECT			(1 << 16)
> +#define ACPI_DEPENDS_ON_VGA			(1 << 17)
> +#define ACPI_PIPE_ID_SHIFT			18
> +#define ACPI_PIPE_ID_MASK			(7 << 18)
> +#define ACPI_DEVICE_ID_SCHEME			(1ULL << 31)
> +
> +static u32 acpi_display_type(struct intel_connector *connector)
> +{
> +	u32 display_type;
> +
> +	switch (connector->base.connector_type) {
> +	case DRM_MODE_CONNECTOR_VGA:
> +	case DRM_MODE_CONNECTOR_DVIA:
> +		display_type = ACPI_DISPLAY_TYPE_VGA;
> +		break;
> +	case DRM_MODE_CONNECTOR_Composite:
> +	case DRM_MODE_CONNECTOR_SVIDEO:
> +	case DRM_MODE_CONNECTOR_Component:
> +	case DRM_MODE_CONNECTOR_9PinDIN:
> +	case DRM_MODE_CONNECTOR_TV:
> +		display_type = ACPI_DISPLAY_TYPE_TV;
> +		break;
> +	case DRM_MODE_CONNECTOR_DVII:
> +	case DRM_MODE_CONNECTOR_DVID:
> +	case DRM_MODE_CONNECTOR_DisplayPort:
> +	case DRM_MODE_CONNECTOR_HDMIA:
> +	case DRM_MODE_CONNECTOR_HDMIB:
> +		display_type = ACPI_DISPLAY_TYPE_EXTERNAL_DIGITAL;
> +		break;
> +	case DRM_MODE_CONNECTOR_LVDS:
> +	case DRM_MODE_CONNECTOR_eDP:
> +	case DRM_MODE_CONNECTOR_DSI:
> +		display_type = ACPI_DISPLAY_TYPE_INTERNAL_DIGITAL;
> +		break;
> +	case DRM_MODE_CONNECTOR_Unknown:
> +	case DRM_MODE_CONNECTOR_VIRTUAL:
> +		display_type = ACPI_DISPLAY_TYPE_OTHER;
> +		break;
> +	default:
> +		MISSING_CASE(connector->base.connector_type);
> +		display_type = ACPI_DISPLAY_TYPE_OTHER;
> +		break;
> +	}
> +
> +	return display_type;
> +}
> +
> +void intel_acpi_device_id_update(struct drm_i915_private *dev_priv)
> +{
> +	struct drm_device *drm_dev = &dev_priv->drm;
> +	struct intel_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +	u8 display_index[16] = {};
> +
> +	/* Populate the ACPI IDs for all connectors for a given drm_device */
> +	drm_connector_list_iter_begin(drm_dev, &conn_iter);
> +	for_each_intel_connector_iter(connector, &conn_iter) {
> +		u32 device_id, type;
> +
> +		device_id = acpi_display_type(connector);
> +
> +		/* Use display type specific display index. */
> +		type = (device_id & ACPI_DISPLAY_TYPE_MASK)
> +			>> ACPI_DISPLAY_TYPE_SHIFT;
> +		device_id |= display_index[type]++ << ACPI_DISPLAY_INDEX_SHIFT;
> +
> +		connector->acpi_device_id = device_id;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
> index 1c576b3fb712..e8b068661d22 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.h
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
> @@ -6,12 +6,17 @@
>  #ifndef __INTEL_ACPI_H__
>  #define __INTEL_ACPI_H__
>  
> +struct drm_i915_private;
> +
>  #ifdef CONFIG_ACPI
>  void intel_register_dsm_handler(void);
>  void intel_unregister_dsm_handler(void);
> +void intel_acpi_device_id_update(struct drm_i915_private *i915);
>  #else
>  static inline void intel_register_dsm_handler(void) { return; }
>  static inline void intel_unregister_dsm_handler(void) { return; }
> +static inline
> +void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>  #endif /* CONFIG_ACPI */
>  
>  #endif /* __INTEL_ACPI_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
> index 969ade623691..6422384f199e 100644
> --- a/drivers/gpu/drm/i915/display/intel_opregion.c
> +++ b/drivers/gpu/drm/i915/display/intel_opregion.c
> @@ -35,6 +35,7 @@
>  #include "display/intel_panel.h"
>  
>  #include "i915_drv.h"
> +#include "intel_acpi.h"
>  #include "intel_display_types.h"
>  #include "intel_opregion.h"
>  
> @@ -242,29 +243,6 @@ struct opregion_asle_ext {
>  #define SWSCI_SBCB_POST_VBE_PM		SWSCI_FUNCTION_CODE(SWSCI_SBCB, 19)
>  #define SWSCI_SBCB_ENABLE_DISABLE_AUDIO	SWSCI_FUNCTION_CODE(SWSCI_SBCB, 21)
>  
> -/*
> - * ACPI Specification, Revision 5.0, Appendix B.3.2 _DOD (Enumerate All Devices
> - * Attached to the Display Adapter).
> - */
> -#define ACPI_DISPLAY_INDEX_SHIFT		0
> -#define ACPI_DISPLAY_INDEX_MASK			(0xf << 0)
> -#define ACPI_DISPLAY_PORT_ATTACHMENT_SHIFT	4
> -#define ACPI_DISPLAY_PORT_ATTACHMENT_MASK	(0xf << 4)
> -#define ACPI_DISPLAY_TYPE_SHIFT			8
> -#define ACPI_DISPLAY_TYPE_MASK			(0xf << 8)
> -#define ACPI_DISPLAY_TYPE_OTHER			(0 << 8)
> -#define ACPI_DISPLAY_TYPE_VGA			(1 << 8)
> -#define ACPI_DISPLAY_TYPE_TV			(2 << 8)
> -#define ACPI_DISPLAY_TYPE_EXTERNAL_DIGITAL	(3 << 8)
> -#define ACPI_DISPLAY_TYPE_INTERNAL_DIGITAL	(4 << 8)
> -#define ACPI_VENDOR_SPECIFIC_SHIFT		12
> -#define ACPI_VENDOR_SPECIFIC_MASK		(0xf << 12)
> -#define ACPI_BIOS_CAN_DETECT			(1 << 16)
> -#define ACPI_DEPENDS_ON_VGA			(1 << 17)
> -#define ACPI_PIPE_ID_SHIFT			18
> -#define ACPI_PIPE_ID_MASK			(7 << 18)
> -#define ACPI_DEVICE_ID_SCHEME			(1 << 31)
> -
>  #define MAX_DSLP	1500
>  
>  static int swsci(struct drm_i915_private *dev_priv,
> @@ -662,54 +640,12 @@ static void set_did(struct intel_opregion *opregion, int i, u32 val)
>  	}
>  }
>  
> -static u32 acpi_display_type(struct intel_connector *connector)
> -{
> -	u32 display_type;
> -
> -	switch (connector->base.connector_type) {
> -	case DRM_MODE_CONNECTOR_VGA:
> -	case DRM_MODE_CONNECTOR_DVIA:
> -		display_type = ACPI_DISPLAY_TYPE_VGA;
> -		break;
> -	case DRM_MODE_CONNECTOR_Composite:
> -	case DRM_MODE_CONNECTOR_SVIDEO:
> -	case DRM_MODE_CONNECTOR_Component:
> -	case DRM_MODE_CONNECTOR_9PinDIN:
> -	case DRM_MODE_CONNECTOR_TV:
> -		display_type = ACPI_DISPLAY_TYPE_TV;
> -		break;
> -	case DRM_MODE_CONNECTOR_DVII:
> -	case DRM_MODE_CONNECTOR_DVID:
> -	case DRM_MODE_CONNECTOR_DisplayPort:
> -	case DRM_MODE_CONNECTOR_HDMIA:
> -	case DRM_MODE_CONNECTOR_HDMIB:
> -		display_type = ACPI_DISPLAY_TYPE_EXTERNAL_DIGITAL;
> -		break;
> -	case DRM_MODE_CONNECTOR_LVDS:
> -	case DRM_MODE_CONNECTOR_eDP:
> -	case DRM_MODE_CONNECTOR_DSI:
> -		display_type = ACPI_DISPLAY_TYPE_INTERNAL_DIGITAL;
> -		break;
> -	case DRM_MODE_CONNECTOR_Unknown:
> -	case DRM_MODE_CONNECTOR_VIRTUAL:
> -		display_type = ACPI_DISPLAY_TYPE_OTHER;
> -		break;
> -	default:
> -		MISSING_CASE(connector->base.connector_type);
> -		display_type = ACPI_DISPLAY_TYPE_OTHER;
> -		break;
> -	}
> -
> -	return display_type;
> -}
> -
>  static void intel_didl_outputs(struct drm_i915_private *dev_priv)
>  {
>  	struct intel_opregion *opregion = &dev_priv->opregion;
>  	struct intel_connector *connector;
>  	struct drm_connector_list_iter conn_iter;
>  	int i = 0, max_outputs;
> -	int display_index[16] = {};
>  
>  	/*
>  	 * In theory, did2, the extended didl, gets added at opregion version
> @@ -721,20 +657,12 @@ static void intel_didl_outputs(struct drm_i915_private *dev_priv)
>  	max_outputs = ARRAY_SIZE(opregion->acpi->didl) +
>  		ARRAY_SIZE(opregion->acpi->did2);
>  
> +	intel_acpi_device_id_update(dev_priv);
> +
>  	drm_connector_list_iter_begin(&dev_priv->drm, &conn_iter);
>  	for_each_intel_connector_iter(connector, &conn_iter) {
> -		u32 device_id, type;
> -
> -		device_id = acpi_display_type(connector);
> -
> -		/* Use display type specific display index. */
> -		type = (device_id & ACPI_DISPLAY_TYPE_MASK)
> -			>> ACPI_DISPLAY_TYPE_SHIFT;
> -		device_id |= display_index[type]++ << ACPI_DISPLAY_INDEX_SHIFT;
> -
> -		connector->acpi_device_id = device_id;
>  		if (i < max_outputs)
> -			set_did(opregion, i, device_id);
> +			set_did(opregion, i, connector->acpi_device_id);
>  		i++;
>  	}
>  	drm_connector_list_iter_end(&conn_iter);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
