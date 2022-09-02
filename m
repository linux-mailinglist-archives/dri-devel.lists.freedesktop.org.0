Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB35AB151
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 15:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2A510E83E;
	Fri,  2 Sep 2022 13:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E2F10E83B;
 Fri,  2 Sep 2022 13:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662124840; x=1693660840;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/NRcLs2FH7Yj/TRPNvW19fp4y9VVTFA7hNnEtx6+aXw=;
 b=CDIZFaQnDR8iY4WNVng2uF87OcVcLCiilr2XMzxnivar5v8zSw6VuxoR
 +DJFOC0LW0cZxvYdGKXF1EsbfNn1UxFN3ABZ16PgQPKXlfVd0B573XPxk
 5ajTRqqShZxYkRmxzmr5PiNMpA0bOnjjlfHuJfeBidGC182rKoqJH5naD
 fgQ5rhCwC1vWLm186xQH9XrPEdhh49Jfzlhe+yG72NCu7kE9LW9vVd2up
 jxT+XPnoJTkBuTzDtk4GrDChyUll5ltzWLc8vXHSEqO4GW1lWY564FyiH
 Fm2M6RzfXGuN6N5WyO1ccYOUfVbUI6qq9i7O2s20tNewlk8QP21QWH+9t g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="322137241"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="322137241"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:20:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="674351857"
Received: from svandene-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.245])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 06:20:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Lukas Wunner
 <lukas@wunner.de>, Mark Gross <markgross@kernel.org>, Andy Shevchenko
 <andy@kernel.org>
Subject: Re: [PATCH v5 11/31] drm/i915: Call acpi_video_register_backlight()
 (v3)
In-Reply-To: <20220825143726.269890-12-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-12-hdegoede@redhat.com>
Date: Fri, 02 Sep 2022 16:20:21 +0300
Message-ID: <87k06lewve.fsf@intel.com>
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
Cc: linux-acpi@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 25 Aug 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> On machins without an i915 opregion the acpi_video driver immediately
> probes the ACPI video bus and used to also immediately register
> acpi_video# backlight devices when supported.
>
> Once the drm/kms driver then loaded later and possibly registered
> a native backlight device then the drivers/acpi/video_detect.c code
> unregistered the acpi_video0 device to avoid there being 2 backlight
> devices (when acpi_video_get_backlight_type()==native).
>
> This means that userspace used to briefly see 2 devices and the
> disappearing of acpi_video0 after a brief time confuses the systemd
> backlight level save/restore code, see e.g.:
> https://bbs.archlinux.org/viewtopic.php?id=269920
>
> To fix this the ACPI video code has been modified to make backlight class
> device registration a separate step, relying on the drm/kms driver to
> ask for the acpi_video backlight registration after it is done setting up
> its native backlight device.
>
> Add a call to the new acpi_video_register_backlight() after the i915 calls
> acpi_video_register() (after setting up the i915 opregion) so that the
> acpi_video backlight devices get registered on systems where the i915
> native backlight device is not registered.
>
> Changes in v2:
> -Only call acpi_video_register_backlight() when a panel is detected
>
> Changes in v3:
> -Add a new intel_acpi_video_register() helper which checks if a panel
>  is present and then calls acpi_video_register_backlight()
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Apologies for the delay. I truly appreciate the effort you've put into
this series, and I'm looking forward to seeing the next steps in drm!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And ack for merging via whichever tree you think best.


> ---
>  drivers/gpu/drm/i915/display/intel_acpi.c    | 27 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_acpi.h    |  3 +++
>  drivers/gpu/drm/i915/display/intel_display.c |  2 +-
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
> index e78430001f07..9df78e7caa2b 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/pci.h>
>  #include <linux/acpi.h>
> +#include <acpi/video.h>
>  
>  #include "i915_drv.h"
>  #include "intel_acpi.h"
> @@ -331,3 +332,29 @@ void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915)
>  	 */
>  	fwnode_handle_put(fwnode);
>  }
> +
> +void intel_acpi_video_register(struct drm_i915_private *i915)
> +{
> +	struct drm_connector_list_iter conn_iter;
> +	struct drm_connector *connector;
> +
> +	acpi_video_register();
> +
> +	/*
> +	 * If i915 is driving an internal panel without registering its native
> +	 * backlight handler try to register the acpi_video backlight.
> +	 * For panels not driven by i915 another GPU driver may still register
> +	 * a native backlight later and acpi_video_register_backlight() should
> +	 * only be called after any native backlights have been registered.
> +	 */
> +	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		struct intel_panel *panel = &to_intel_connector(connector)->panel;
> +
> +		if (panel->backlight.funcs && !panel->backlight.device) {
> +			acpi_video_register_backlight();
> +			break;
> +		}
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.h b/drivers/gpu/drm/i915/display/intel_acpi.h
> index 4a760a2baed9..6a0007452f95 100644
> --- a/drivers/gpu/drm/i915/display/intel_acpi.h
> +++ b/drivers/gpu/drm/i915/display/intel_acpi.h
> @@ -14,6 +14,7 @@ void intel_unregister_dsm_handler(void);
>  void intel_dsm_get_bios_data_funcs_supported(struct drm_i915_private *i915);
>  void intel_acpi_device_id_update(struct drm_i915_private *i915);
>  void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915);
> +void intel_acpi_video_register(struct drm_i915_private *i915);
>  #else
>  static inline void intel_register_dsm_handler(void) { return; }
>  static inline void intel_unregister_dsm_handler(void) { return; }
> @@ -23,6 +24,8 @@ static inline
>  void intel_acpi_device_id_update(struct drm_i915_private *i915) { return; }
>  static inline
>  void intel_acpi_assign_connector_fwnodes(struct drm_i915_private *i915) { return; }
> +static inline
> +void intel_acpi_video_register(struct drm_i915_private *i915) { return; }
>  #endif /* CONFIG_ACPI */
>  
>  #endif /* __INTEL_ACPI_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 6103b02c081f..129a13375101 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -9087,7 +9087,7 @@ void intel_display_driver_register(struct drm_i915_private *i915)
>  
>  	/* Must be done after probing outputs */
>  	intel_opregion_register(i915);
> -	acpi_video_register();
> +	intel_acpi_video_register(i915);
>  
>  	intel_audio_init(i915);

-- 
Jani Nikula, Intel Open Source Graphics Center
