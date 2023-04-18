Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A89906E598C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 08:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3EA10E67D;
	Tue, 18 Apr 2023 06:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1598910E67D;
 Tue, 18 Apr 2023 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681800193; x=1713336193;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OV99Aaw4PAuMFFTVPFSyVFAq2bS/27X0vVBClMwmqC0=;
 b=M3wf9X6ZzG2DDHMsqG+rILRnRFIlHv2+TPtPbWHbBRNxM3kYvVFAG47X
 dyGT/SKqZVbmMGd5IY5ysYJ/EKUGUsjX3LhUCZDMUeykqLqQ/gvEPqsvU
 gDwMdiJ36MP9KXAgCBfsLETZ0xdwdOujErjRcdr3pQZOydH1/qyF95Zd8
 e0M7D9vf5XyrpVDf2KIieLfuNpQplRLYDh5PnvvGEkEcY93Gcx5dpNJnE
 q9+WMrbko+omEpGmUZ3ogNCL+t/QX4KHFbmJNaPEIsaMXDKrkSf9BJj95
 VA7QfLLIHieWBmDhWrl7eRez6tsFYBM/qcaQ28U3CYYkhsK6eAvvPK7ck A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347840432"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="347840432"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 23:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="755602511"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="755602511"
Received: from rmenchon-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.143])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 23:43:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, Mark Yacoub
 <markyacoub@chromium.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: RE: [PATCH v9 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
In-Reply-To: <SN7PR11MB6750FAC866C29F298B1690F6E39D9@SN7PR11MB6750.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230411192134.508113-1-markyacoub@google.com>
 <20230411192134.508113-2-markyacoub@google.com>
 <SN7PR11MB6750FAC866C29F298B1690F6E39D9@SN7PR11MB6750.namprd11.prod.outlook.com>
Date: Tue, 18 Apr 2023 09:43:05 +0300
Message-ID: <875y9telmu.fsf@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Apr 2023, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> Yacoub
>> <markyacoub@chromium.org>; linux-kernel@vger.kernel.org
>> Subject: [PATCH v9 01/10] drm/hdcp: Add drm_hdcp_atomic_check()
>>
>> From: Sean Paul <seanpaul@chromium.org>
>>
>> Move the hdcp atomic check from i915 to drm_hdcp so other drivers can use
>> it. No functional changes, just cleaned up some of the code when moving it
>> over.
>>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>>
>> ---
>> Changes in v2:
>> -None
>> Changes in v3:
>> -None
>> Changes in v4:
>> -None
>> Changes in v5:
>> -None
>> Changes in v6:
>> -Rebase: move helper from drm_hdcp.c to drm_hdcp_helper.c Changes in
>> v7:
>> -Removed links to patch from commit msg (Dmitry Baryshkov)
>>
>>  drivers/gpu/drm/display/drm_hdcp_helper.c   | 64
>> +++++++++++++++++++++
>>  drivers/gpu/drm/i915/display/intel_atomic.c |  4 +-
>>  drivers/gpu/drm/i915/display/intel_hdcp.c   | 47 ---------------
>>  drivers/gpu/drm/i915/display/intel_hdcp.h   |  3 -
>>  include/drm/display/drm_hdcp_helper.h       |  3 +
>>  5 files changed, 69 insertions(+), 52 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdcp_helper.c
>> b/drivers/gpu/drm/display/drm_hdcp_helper.c
>> index e78999c72bd77..7ca390b3ea106 100644
>> --- a/drivers/gpu/drm/display/drm_hdcp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
>> @@ -20,6 +20,7 @@
>>  #include <drm/drm_property.h>
>>  #include <drm/drm_mode_object.h>
>>  #include <drm/drm_connector.h>
>> +#include <drm/drm_atomic.h>
>>
>>  static inline void drm_hdcp_print_ksv(const u8 *ksv)  { @@ -419,3 +420,66
>> @@ void drm_hdcp_update_content_protection(struct drm_connector
>> *connector,
>>                                dev-
>> >mode_config.content_protection_property);
>>  }
>>  EXPORT_SYMBOL(drm_hdcp_update_content_protection);
>> +
>> +/**
>> + * drm_hdcp_atomic_check - Helper for drivers to call during
>> +connector->atomic_check
>> + *
>> + * @state: pointer to the atomic state being checked
>> + * @connector: drm_connector on which content protection state needs an
>> +update
>> + *
>> + * This function can be used by display drivers to perform an atomic
>> +check on the
>> + * hdcp state elements. If hdcp state has changed, this function will
>> +set
>> + * mode_changed on the crtc driving the connector so it can update its
>> +hardware
>> + * to match the hdcp state.
>> + */
>> +void drm_hdcp_atomic_check(struct drm_connector *connector,
>> +                        struct drm_atomic_state *state)
>> +{
>> +     struct drm_connector_state *new_conn_state, *old_conn_state;
>> +     struct drm_crtc_state *new_crtc_state;
>> +     u64 old_hdcp, new_hdcp;
>> +
>> +     old_conn_state = drm_atomic_get_old_connector_state(state,
>> connector);
>> +     old_hdcp = old_conn_state->content_protection;
>> +
>> +     new_conn_state = drm_atomic_get_new_connector_state(state,
>> connector);
>> +     new_hdcp = new_conn_state->content_protection;
>> +
>
> Nit: Why not assign these as right when they are declared we would end up using less lines

The rule of thumb is to only initialize trivial stuff at declaration.

BR,
Jani.

>
>> +     if (!new_conn_state->crtc) {
>> +             /*
>> +              * If the connector is being disabled with CP enabled, mark it
>> +              * desired so it's re-enabled when the connector is brought
>> back
>> +              */
>> +             if (old_hdcp ==
>> DRM_MODE_CONTENT_PROTECTION_ENABLED)
>> +                     new_conn_state->content_protection =
>> +
>>       DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> +             return;
>> +     }
>> +
>> +     new_crtc_state =
>> +             drm_atomic_get_new_crtc_state(state, new_conn_state-
>> >crtc);
>> +     if (drm_atomic_crtc_needs_modeset(new_crtc_state) &&
>> +         (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
>> +          new_hdcp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
>> +             new_conn_state->content_protection =
>> +                     DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> +
>> +     /*
>> +      * Nothing to do if content type is unchanged and one of:
>> +      *  - state didn't change
>> +      *  - HDCP was activated since the last commit
>> +      *  - attempting to set to desired while already enabled
>> +      */
>> +     if (old_hdcp == new_hdcp ||
>> +         (old_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
>> +          new_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED) ||
>> +         (old_hdcp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
>> +          new_hdcp == DRM_MODE_CONTENT_PROTECTION_DESIRED)) {
>> +             if (old_conn_state->hdcp_content_type ==
>> +                 new_conn_state->hdcp_content_type)
>> +                     return;
>> +     }
>> +
>> +     new_crtc_state->mode_changed = true;
>> +}
>> +EXPORT_SYMBOL(drm_hdcp_atomic_check);
>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c
>> b/drivers/gpu/drm/i915/display/intel_atomic.c
>> index a9a3f3715279d..e9d00b6a63d39 100644
>> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
>> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
>> @@ -32,6 +32,7 @@
>>  #include <drm/drm_atomic.h>
>>  #include <drm/drm_atomic_helper.h>
>>  #include <drm/drm_fourcc.h>
>> +#include <drm/display/drm_hdcp_helper.h>
>>
>>  #include "i915_drv.h"
>>  #include "i915_reg.h"
>> @@ -39,7 +40,6 @@
>>  #include "intel_cdclk.h"
>>  #include "intel_display_types.h"
>>  #include "intel_global_state.h"
>> -#include "intel_hdcp.h"
>>  #include "intel_psr.h"
>>  #include "intel_fb.h"
>>  #include "skl_universal_plane.h"
>> @@ -124,7 +124,7 @@ int intel_digital_connector_atomic_check(struct
>> drm_connector *conn,
>>               to_intel_digital_connector_state(old_state);
>>       struct drm_crtc_state *crtc_state;
>>
>> -     intel_hdcp_atomic_check(conn, old_state, new_state);
>> +     drm_hdcp_atomic_check(conn, state);
>>
>>       if (!new_state->crtc)
>>               return 0;
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
>> b/drivers/gpu/drm/i915/display/intel_hdcp.c
>> index 6406fd487ee52..396d2cef000aa 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
>> @@ -2524,53 +2524,6 @@ void intel_hdcp_cleanup(struct intel_connector
>> *connector)
>>       mutex_unlock(&hdcp->mutex);
>>  }
>>
>> -void intel_hdcp_atomic_check(struct drm_connector *connector,
>> -                          struct drm_connector_state *old_state,
>> -                          struct drm_connector_state *new_state)
>> -{
>> -     u64 old_cp = old_state->content_protection;
>> -     u64 new_cp = new_state->content_protection;
>> -     struct drm_crtc_state *crtc_state;
>> -
>> -     if (!new_state->crtc) {
>> -             /*
>> -              * If the connector is being disabled with CP enabled, mark it
>> -              * desired so it's re-enabled when the connector is brought
>> back
>> -              */
>> -             if (old_cp ==
>> DRM_MODE_CONTENT_PROTECTION_ENABLED)
>> -                     new_state->content_protection =
>> -
>>       DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> -             return;
>> -     }
>> -
>> -     crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
>> -                                                new_state->crtc);
>> -     /*
>> -      * Fix the HDCP uapi content protection state in case of modeset.
>> -      * FIXME: As per HDCP content protection property uapi doc, an
>> uevent()
>> -      * need to be sent if there is transition from ENABLED->DESIRED.
>> -      */
>> -     if (drm_atomic_crtc_needs_modeset(crtc_state) &&
>> -         (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED &&
>> -         new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED))
>> -             new_state->content_protection =
>> -                     DRM_MODE_CONTENT_PROTECTION_DESIRED;
>> -
>> -     /*
>> -      * Nothing to do if the state didn't change, or HDCP was activated
>> since
>> -      * the last commit. And also no change in hdcp content type.
>> -      */
>> -     if (old_cp == new_cp ||
>> -         (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
>> -          new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)) {
>> -             if (old_state->hdcp_content_type ==
>> -                             new_state->hdcp_content_type)
>> -                     return;
>> -     }
>> -
>> -     crtc_state->mode_changed = true;
>> -}
>> -
>>  /* Handles the CP_IRQ raised from the DP HDCP sink */  void
>> intel_hdcp_handle_cp_irq(struct intel_connector *connector)  { diff --git
>> a/drivers/gpu/drm/i915/display/intel_hdcp.h
>> b/drivers/gpu/drm/i915/display/intel_hdcp.h
>> index 8f53b0c7fe5cf..7c5fd84a7b65a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdcp.h
>> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
>> @@ -22,9 +22,6 @@ struct intel_digital_port;  enum port;  enum transcoder;
>>
>> -void intel_hdcp_atomic_check(struct drm_connector *connector,
>> -                          struct drm_connector_state *old_state,
>> -                          struct drm_connector_state *new_state);
>>  int intel_hdcp_init(struct intel_connector *connector,
>>                   struct intel_digital_port *dig_port,
>>                   const struct intel_hdcp_shim *hdcp_shim); diff --git
>> a/include/drm/display/drm_hdcp_helper.h
>> b/include/drm/display/drm_hdcp_helper.h
>> index 8aaf87bf27351..dd02b2e72a502 100644
>> --- a/include/drm/display/drm_hdcp_helper.h
>> +++ b/include/drm/display/drm_hdcp_helper.h
>> @@ -11,6 +11,7 @@
>>
>>  #include <drm/display/drm_hdcp.h>
>>
>> +struct drm_atomic_state;
>>  struct drm_device;
>>  struct drm_connector;
>>
>> @@ -18,5 +19,7 @@ int drm_hdcp_check_ksvs_revoked(struct drm_device
>> *dev, u8 *ksvs, u32 ksv_count)  int
>> drm_connector_attach_content_protection_property(struct drm_connector
>> *connector,
>>                                                    bool hdcp_content_type);
>>  void drm_hdcp_update_content_protection(struct drm_connector
>> *connector, u64 val);
>> +void drm_hdcp_atomic_check(struct drm_connector *connector,
>> +                        struct drm_atomic_state *state);
>>
>>  #endif
>> --
>> 2.40.0.577.gac1e443424-goog
>

-- 
Jani Nikula, Intel Open Source Graphics Center
