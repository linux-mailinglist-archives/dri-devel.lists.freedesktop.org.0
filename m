Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FE64ADBED
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 16:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DA310E496;
	Tue,  8 Feb 2022 15:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCB610E44C;
 Tue,  8 Feb 2022 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644332601; x=1675868601;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gDmKKu33rwc/c6RjYbjBogHrNoIgn+cXND+Nl0W0OZ4=;
 b=cjz+pYhctrkZSbJ0X5egcXjH0d4JJkkpLhag76rxqShNP6wQ0V6hsSO7
 CczGwhkC9bB0ZIQmQpEy2J++P8Qlr3yRAjRgWG/K6srNVjCOKPeCSNxy2
 fR5YtxVSPx7VTsRelwVMhW2MJJp1EFRO4GGgFQhZ+ogJm0mraOxPxrAdo
 llIbX9OM/GExZCvvf7rcWhUEMxmG+rB6cgG7KdD7VVjfo2Rzqw1UE29cR
 FemdlS1G2v7W9eGCU8IALIXOKO/wwtYJiPSNzL7Nr/G0sLx3BTwkOuZYR
 33FJSiwvf0/T4YWN5MBwpmNKNDq6Fq4EvvU3KEPpwCtYNHkG/e21xhhF5 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="236369971"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="236369971"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 07:02:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="567877795"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga001.jf.intel.com with SMTP; 08 Feb 2022 07:02:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Feb 2022 17:02:53 +0200
Date: Tue, 8 Feb 2022 17:02:53 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 7/8] drm/i915/mst: update slot information for 128b/132b
Message-ID: <YgKGHb2Gfg8hI8XQ@intel.com>
References: <cover.1643878928.git.jani.nikula@intel.com>
 <fecbe3e9c93e33a16b24481432de5a524821677d.1643878928.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fecbe3e9c93e33a16b24481432de5a524821677d.1643878928.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 11:03:56AM +0200, Jani Nikula wrote:
> 128b/132b supports using 64 slots starting from 0, while 8b/10b reserves
> slot 0 for metadata.
> 
> Commit d6c6a76f80a1 ("drm: Update MST First Link Slot Information Based
> on Encoding Format") added support for updating the topology state
> accordingly, and commit 41724ea273cd ("drm/amd/display: Add DP 2.0 MST
> DM Support") started using it in the amd driver.
> 
> This feels more than a little cumbersome, especially updating the
> information in atomic check. For i915, add the update to MST connector
> .compute_config hook rather than iterating over all MST managers and
> connectors in global mode config .atomic_check. Fingers crossed.
> 
> v2:
> - Update in .compute_config() not .atomic_check (Ville)
> 
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 29 +++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 6b6eab507d30..2959e2c3930b 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -99,6 +99,27 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>  	return 0;
>  }
>  
> +static void intel_dp_mst_update_slots(struct intel_encoder *encoder,
> +				      struct intel_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct drm_i915_private *i915 = to_i915(encoder->base.dev);
> +	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(encoder);
> +	struct intel_dp *intel_dp = &intel_mst->primary->dp;
> +	struct drm_dp_mst_topology_mgr *mgr = &intel_dp->mst_mgr;
> +	struct drm_dp_mst_topology_state *topology_state;
> +	u8 link_coding_cap = intel_dp_is_uhbr(crtc_state) ?
> +		DP_CAP_ANSI_128B132B : DP_CAP_ANSI_8B10B;
> +
> +	topology_state = drm_atomic_get_mst_topology_state(conn_state->state, mgr);
> +	if (IS_ERR(topology_state)) {
> +		drm_dbg_kms(&i915->drm, "slot update failed\n");
> +		return;

We need to propagate the error upwards. Other than that seems about
as as reasonable as it can be given the current state of things.

So with that fixed
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +	}
> +
> +	drm_dp_mst_update_slots(topology_state, link_coding_cap);
> +}
> +
>  static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  				       struct intel_crtc_state *pipe_config,
>  				       struct drm_connector_state *conn_state)
> @@ -155,6 +176,8 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  	if (ret)
>  		return ret;
>  
> +	intel_dp_mst_update_slots(encoder, pipe_config, conn_state);
> +
>  	pipe_config->limited_color_range =
>  		intel_dp_limited_color_range(pipe_config, conn_state);
>  
> @@ -357,6 +380,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
>  	struct intel_connector *connector =
>  		to_intel_connector(old_conn_state->connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> +	int start_slot = intel_dp_is_uhbr(old_crtc_state) ? 0 : 1;
>  	int ret;
>  
>  	drm_dbg_kms(&i915->drm, "active links %d\n",
> @@ -366,7 +390,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
>  
>  	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
>  
> -	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
> +	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
>  	if (ret) {
>  		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
>  	}
> @@ -475,6 +499,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
>  	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
>  	struct intel_connector *connector =
>  		to_intel_connector(conn_state->connector);
> +	int start_slot = intel_dp_is_uhbr(pipe_config) ? 0 : 1;
>  	int ret;
>  	bool first_mst_stream;
>  
> @@ -509,7 +534,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
>  
>  	intel_dp->active_mst_links++;
>  
> -	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
> +	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, start_slot);
>  
>  	/*
>  	 * Before Gen 12 this is not done as part of
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
