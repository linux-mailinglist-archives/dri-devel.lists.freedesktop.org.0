Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FF5AD5679
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 15:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930CC10E65D;
	Wed, 11 Jun 2025 13:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lin4t3r3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB3710E65C;
 Wed, 11 Jun 2025 13:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749647184; x=1781183184;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+3SsH5RlAXxF2ByurNd2y6VfoEUbQMA/ii+Zwls1D8g=;
 b=lin4t3r3YTiOaNTHPqdA8Hyl4IrVWlf+O+SbDuP87pDAbABMDyOsfWR9
 yeZpQFsQNoTqm6jsmpqaE0gxcO44WZj0977i0lIJ+GUqKerh7ovrCUsBu
 WRBVNHaeXepwK4tJ0S0oKrv4SrEvE1UNwHShLtVJZ+mfGseHI2UIWO9YZ
 7UDutjGaxNgQeXOZr3TTl8kMVN73kPtBoC9lN/eJM9Srvqy1y7YoW8awi
 MAeXiGCXddJSCufwzwFeyemONWhAl8YkS6Qz8Zm9UkUJhN4z0QFFVkgYB
 pvOjjZ2uQfVC40XO/VfJM2ySaB1jH5biWKJ5gRmkNWkHqS5Odb4r3UzTj Q==;
X-CSE-ConnectionGUID: YOTxJw6ER5q/DwJUSL2KgQ==
X-CSE-MsgGUID: WXMRl4s7Qr+Z79ScsSG39g==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51653456"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51653456"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 06:06:17 -0700
X-CSE-ConnectionGUID: bn+mofJ6REmpWpuKG8Swfg==
X-CSE-MsgGUID: eL25yZGJTRGd1pq2ArQhPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="151978345"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.209])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 06:06:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kahola, Mika" <mika.kahola@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v4 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
In-Reply-To: <IA4PR11MB92798E24D1D7C055690222B5EF6AA@IA4PR11MB9279.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250605082850.65136-6-imre.deak@intel.com>
 <20250609125556.109538-2-imre.deak@intel.com>
 <IA4PR11MB92798E24D1D7C055690222B5EF6AA@IA4PR11MB9279.namprd11.prod.outlook.com>
Date: Wed, 11 Jun 2025 16:06:11 +0300
Message-ID: <e3855aaacdea284b29e18396b7f056325ed52995@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 10 Jun 2025, "Kahola, Mika" <mika.kahola@intel.com> wrote:
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of I=
mre Deak
>> Sent: Monday, 9 June 2025 15.56
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri=
-devel@lists.freedesktop.org
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Jani Nikula=
 <jani.nikula@linux.intel.com>
>> Subject: [PATCH v4 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if=
 it's not required
>>=20
>> Reading DPCD registers has side-effects and some of these can cause a pr=
oblem for instance during link training. Based on this it's
>> better to avoid the probing quirk done before each DPCD register read, l=
imiting this to the monitor which requires it. The only
>> known problematic monitor is an external SST sink, so keep the quirk dis=
abled always for eDP and MST sinks. Reenable the quirk
>> after a hotplug event and after resuming from a power state without hotp=
lug support, until the subsequent EDID based detection.
>>=20
>> v2: Add a helper for determining the need/setting the probing. (Jani)
>>=20
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>
> Jani has already reviewed most of the patch and now that this check for d=
pcd probe requirement is in place, the patch looks ok to me.
>
> Reviewed-by: Mika Kahola <mika.kahola@intel.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dp.c      | 31 ++++++++++++++++++--
>>  drivers/gpu/drm/i915/display/intel_dp.h      |  1 +
>>  drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++  drivers/gpu/drm/i=
915/display/intel_hotplug.c |  6 ++++
>>  4 files changed, 38 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i=
915/display/intel_dp.c
>> index 208a953b04a2f..c089036a745fd 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -5791,6 +5791,28 @@ intel_dp_detect_sdp_caps(struct intel_dp *intel_d=
p)
>>  		drm_dp_as_sdp_supported(&intel_dp->aux, intel_dp->dpcd);  }
>>=20
>> +static bool intel_dp_needs_dpcd_probe(struct intel_dp *intel_dp, bool
>> +force_on_external) {
>> +	struct intel_connector *connector =3D intel_dp->attached_connector;
>> +
>> +	if (intel_dp_is_edp(intel_dp))
>> +		return false;
>> +
>> +	if (force_on_external)
>> +		return true;
>> +
>> +	if (intel_dp->is_mst)
>> +		return false;
>> +
>> +	return drm_edid_has_quirk(&connector->base,
>> +DRM_EDID_QUIRK_DP_DPCD_PROBE); }
>> +
>> +void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool
>> +force_on_external) {
>> +	drm_dp_dpcd_set_probe(&intel_dp->aux,
>> +			      intel_dp_needs_dpcd_probe(intel_dp, force_on_external)); }
>> +
>>  static int
>>  intel_dp_detect(struct drm_connector *_connector,
>>  		struct drm_modeset_acquire_ctx *ctx,
>> @@ -5919,6 +5941,8 @@ intel_dp_detect(struct drm_connector *_connector,
>>  	if (status !=3D connector_status_connected && !intel_dp->is_mst)
>>  		intel_dp_unset_edid(intel_dp);
>>=20
>> +	intel_dp_dpcd_set_probe(intel_dp, false);
>> +
>>  	if (!intel_dp_is_edp(intel_dp))
>>  		drm_dp_set_subconnector_property(&connector->base,
>>  						 status,
>> @@ -5949,6 +5973,8 @@ intel_dp_force(struct drm_connector *_connector)
>>  		return;
>>=20
>>  	intel_dp_set_edid(intel_dp);
>> +
>> +	intel_dp_dpcd_set_probe(intel_dp, false);
>>  }
>>=20
>>  static int intel_dp_get_modes(struct drm_connector *_connector) @@ -632=
1,10 +6347,11 @@ intel_dp_hpd_pulse(struct
>> intel_digital_port *dig_port, bool long_hpd)
>>  	 * complete the DP tunnel BW request for the latter connector/encoder
>>  	 * waiting for this encoder's DPRX read, perform a dummy read here.
>>  	 */
>> -	if (long_hpd)
>> +	if (long_hpd) {
>> +		intel_dp_dpcd_set_probe(intel_dp, true);
>> +
>>  		intel_dp_read_dprx_caps(intel_dp, dpcd);
>>=20
>> -	if (long_hpd) {
>>  		intel_dp->reset_link_params =3D true;
>>  		intel_dp_invalidate_source_oui(intel_dp);
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i=
915/display/intel_dp.h
>> index eff3414c05dbf..0657f56811966 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
>> @@ -213,5 +213,6 @@ int intel_dp_compute_min_hblank(struct intel_crtc_st=
ate *crtc_state,
>>  				const struct drm_connector_state *conn_state);
>>=20
>>  int intel_dp_dsc_bpp_step_x16(const struct intel_connector *connector);
>> +void intel_dp_dpcd_set_probe(struct intel_dp *intel_dp, bool
>> +force_on_external);
>>=20
>>  #endif /* __INTEL_DP_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/d=
rm/i915/display/intel_dp_aux.c
>> index bf8e8e0cc19c9..7bec964c0496f 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
>> @@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
>>=20
>>  	intel_dp->aux.transfer =3D intel_dp_aux_transfer;
>>  	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
>> +
>> +	intel_dp_dpcd_set_probe(intel_dp, true);
>>  }
>>=20
>>  static enum aux_ch default_aux_ch(struct intel_encoder *encoder) diff -=
-git a/drivers/gpu/drm/i915/display/intel_hotplug.c
>> b/drivers/gpu/drm/i915/display/intel_hotplug.c
>> index 74fe398663d63..901fda434af12 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
>> @@ -33,6 +33,7 @@
>>  #include "intel_display_core.h"
>>  #include "intel_display_rpm.h"
>>  #include "intel_display_types.h"
>> +#include "intel_dp.h"
>>  #include "intel_hdcp.h"
>>  #include "intel_hotplug.h"
>>  #include "intel_hotplug_irq.h"
>> @@ -906,9 +907,14 @@ void intel_hpd_poll_enable(struct intel_display *di=
splay)
>>   */
>>  void intel_hpd_poll_disable(struct intel_display *display)  {
>> +	struct intel_encoder *encoder;
>> +
>>  	if (!HAS_DISPLAY(display))
>>  		return;
>>=20
>> +	for_each_intel_dp(display->drm, encoder)
>> +		intel_dp_dpcd_set_probe(enc_to_intel_dp(encoder), true);
>> +
>>  	WRITE_ONCE(display->hotplug.poll_enabled, false);
>>=20
>>  	spin_lock_irq(&display->irq.lock);
>> --
>> 2.44.2
>

--=20
Jani Nikula, Intel
