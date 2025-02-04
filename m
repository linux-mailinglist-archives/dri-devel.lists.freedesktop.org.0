Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD58A26D78
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285F510E2DD;
	Tue,  4 Feb 2025 08:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zi/fzNey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA310E29D;
 Tue,  4 Feb 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658718; x=1770194718;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XunkhshntLObEzCqkEQaRoXxr84bWr52C4uo1cKb18A=;
 b=Zi/fzNeyg4ZMg60XuDDPqLOjYfRNXllLGuJCmTRUiOath2hcKP332T7+
 EVt2znA9PHWMYeGN4q+vVs2BlL6EzGLczfP3Re3umZskdz0bOkol7do1n
 ySN4tIFwBv3zj1V0CvBfZ3meOKxRQtZOO3OhrtvKlklXdJHoKdArNnVz4
 Z5NX6s4wpfsnYj6zTDnBxla145Ahj6hE72+nJDP5Y68af8MjgbSemolxj
 Y0hdHAR0dU264SN6C5IW/zgqt5TlWCzoKK3qVhNHHeDK6lCwv8ZvklyAz
 AA4CgFw4SN43e+EHq1dXXt4nQ/J4BdlzfWayKPhdPUqK7Asen7l4qZiwK g==;
X-CSE-ConnectionGUID: lzEfyQUzRdGW9QxJDis6sQ==
X-CSE-MsgGUID: ae/XGmZBR+iR+36yN1UNVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39054313"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39054313"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:45:18 -0800
X-CSE-ConnectionGUID: BueRl4tfRkCO+Spjeg80yw==
X-CSE-MsgGUID: ihxabrj+SD61BjUzAeWvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="110375788"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:45:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com, Suraj
 Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 3/7] drm/i915/backlight: Check Nits based brightness
 control for VESA
In-Reply-To: <20250124054631.1796456-4-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-4-suraj.kandpal@intel.com>
Date: Tue, 04 Feb 2025 10:45:12 +0200
Message-ID: <87ed0e6quf.fsf@intel.com>
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
> Check if we are capable of controlling brightness via Nits which
> is dependant on PANEL_LUMINANCE_OVERRIDE and SMOOTH_BRIGHTNESS
> capablility being set.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 083eb86f0904..f900e1f2d93e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -412,6 +412,7 @@ struct intel_panel {
>  		union {
>  			struct {
>  				struct drm_edp_backlight_info info;
> +				bool nits_support;
>  			} vesa;
>  			struct {
>  				bool sdr_uses_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 09e82f24d030..c5ff6e044866 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>  {
>  	struct intel_display *display = to_intel_display(connector);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	if ((intel_dp->edp_dpcd[2] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] AUX Nits Based Backlight Control Supported!\n",
> +			    connector->base.base.id, connector->base.name);
> +		panel->backlight.edp.vesa.nits_support = true;

Should we refer to luminance rather than nits here?

BR,
Jani.


> +		return true;
> +	}
>  
>  	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
>  		drm_dbg_kms(display->drm,

-- 
Jani Nikula, Intel
