Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CF9A26DA1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:49:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082B410E5C5;
	Tue,  4 Feb 2025 08:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZDrvs5np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6F710E5BC;
 Tue,  4 Feb 2025 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658990; x=1770194990;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kZzqGc1LnY/fxdK3ACY+VCzeVwq5RP92/94FaxxX1sQ=;
 b=ZDrvs5npKLDcR+EywFq+xD6EXt8ajVsKfAwddMcQCIP2oAcCyL+IjxEp
 yrEqHK4reaYire1UltrEJA5eEObBrPv798b8CP/gOIMa/tQSAmCYRn0jD
 TEotjrI4xTlcTDaXFztSh3lLkFUcnsnGq8RiJ6g9Y6Z2MK/PULufYv6Or
 pD11am9euWsT3+sNTJfmqklcUv52HOw7jTwgiNj4kR/td6H/eK6MuAZo8
 4GitX4E8A0ywfAAuy3CF49uLGbw1JomD6pcst0z0DkeDOSUUN2gsB/Hiy
 0sdKj+NzdaI46+ty5Us0uriaXd2iJxy6kpHWryKRLBMmM+H/F4ArzaHK1 Q==;
X-CSE-ConnectionGUID: yBfrPAP+QWa7mtDMsPqp0Q==
X-CSE-MsgGUID: 674Yy+vrQUq3rOc6iCwVxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49787981"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="49787981"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:49:49 -0800
X-CSE-ConnectionGUID: C1KdddvKQEa+HFjGTL2QwQ==
X-CSE-MsgGUID: 48IWR3ocSAm0bO12+eOz6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110708011"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:49:47 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com, Suraj
 Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 5/7] drm/i915/backlight: Add function to change
 brightness in NITS for VESA
In-Reply-To: <20250124054631.1796456-6-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-6-suraj.kandpal@intel.com>
Date: Tue, 04 Feb 2025 10:49:44 +0200
Message-ID: <87bjvi6qmv.fsf@intel.com>
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

On Fri, 24 Jan 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Create a function that fills in the value for
> PANEL_TARGET_LUMINANCE_VALUE which helps in changing the brightness in
> NITS using VESA interface.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index ac9a69fe3f10..d794397656dd 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -474,6 +474,30 @@ static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector, en
>  	return connector->panel.backlight.level;
>  }
>  
> +static int
> +intel_dp_aux_vesa_set_nits_brightness(struct intel_connector *connector, u32 level)

_set_luminance()?

Troughout the series, I'd prefer "luminance" over "nits", i.e. measure
over unit.

> +{
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> +	u8 buf[3];
> +	int ret;
> +
> +	level = level * 1000;
> +	level &= 0xffffff;
> +	buf[0] = (level & 0x0000ff);
> +	buf[1] = (level & 0x00ff00) >> 8;
> +	buf[2] = (level & 0xff0000) >> 16;
> +
> +	ret = drm_dp_dpcd_write(&intel_dp->aux, DP_EDP_PANEL_TARGET_LUMINANCE_VALUE, buf, sizeof(buf));
> +	if (ret != sizeof(buf)) {
> +		drm_err(intel_dp->aux.drm_dev,
> +			"%s: Failed to VESA AUX Nits backlight level: %d\n",
> +			intel_dp->aux.name, ret);
> +		return -EINVAL;
> +	} else {
> +		return 0;
> +	}
> +}
> +
>  static void
>  intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u32 level)
>  {
> @@ -481,6 +505,11 @@ intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state, u3
>  	struct intel_panel *panel = &connector->panel;
>  	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  
> +	if (panel->backlight.edp.vesa.nits_support) {
> +		if (!intel_dp_aux_vesa_set_nits_brightness(connector, level))
> +			return;
> +	}
> +
>  	if (!panel->backlight.edp.vesa.info.aux_set) {
>  		const u32 pwm_level = intel_backlight_level_to_pwm(connector, level);

-- 
Jani Nikula, Intel
