Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0C668D76E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 13:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C135210E4D4;
	Tue,  7 Feb 2023 12:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552F10E1C7;
 Tue,  7 Feb 2023 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675774792; x=1707310792;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b/zS2z+oU7uGIJxYGzQqzvOunkWectcBBOnmqw3m0Zk=;
 b=QYHWa3G67LGVNdBvVqft2dklcEqLMqpZi2jYgreCykUeD8oEci5nbLtg
 5v9DI9WvkF4LsEXruOkx+y9UpmRB7NuQd6BMbIxbN91z5socCx45d9NCn
 7GdUoYl5/TMmzfEDh1r1Ws0wv1I7VyV0tKY/y8EQ2PTQMlQvpteB/pknK
 5bZPYW0aCYcAW+R7kQqTdXsM0VkZlTIWmlljNCACVa7bGyszWTzjw6Bt0
 UkRfnXDD1Kej3AiLIQFUBqjfOZhsp02W8zIKUL6ZVM/OfQAjABxNWTi9E
 a19wiKTB0IG5Z9/5Vt7EVDZfCrvgthW7qfhIWkBhqPUQRwGhSAmq7kWYj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356867599"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="356867599"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 04:59:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="730424307"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; d="scan'208";a="730424307"
Received: from ideak-desk.fi.intel.com ([10.237.72.58])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 04:59:48 -0800
Date: Tue, 7 Feb 2023 14:59:45 +0200
From: Imre Deak <imre.deak@intel.com>
To: Lyude Paul <lyude@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Intel-gfx] [CI 1/4] drm/i915/dp_mst: Add the MST topology state
 for modesetted CRTCs
Message-ID: <Y+JLQfuSAS6xLPIS@ideak-desk.fi.intel.com>
References: <20230206114856.2665066-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230206114856.2665066-1-imre.deak@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: Karol Herbst <kherbst@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Wayne Lin <Wayne.Lin@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Mon, Feb 06, 2023 at 01:48:53PM +0200, Imre Deak wrote:
> Add the MST topology for a CRTC to the atomic state if the driver
> needs to force a modeset on the CRTC after the encoder compute config
> functions are called.
> 
> Later the MST encoder's disable hook also adds the state, but that isn't
> guaranteed to work (since in that hook getting the state may fail, which
> can't be handled there). This should fix that, while a later patch fixes
> the use of the MST state in the disable hook.
> 
> v2: Add missing forward struct declartions, caught by hdrtest.
> v3: Factor out intel_dp_mst_add_topology_state_for_connector() used
>     later in the patchset.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: stable@vger.kernel.org # 6.1
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com> # v2
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Is it ok to merge these 4 patches (also at [1]), via the i915 tree?

If so could it be also acked from the AMD and Nouveau side?

[1] https://patchwork.freedesktop.org/series/113703/

> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  4 ++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 61 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.h  |  4 ++
>  3 files changed, 69 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 166662ade593c..38106cf63b3b9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5936,6 +5936,10 @@ int intel_modeset_all_pipes(struct intel_atomic_state *state,
>  		if (ret)
>  			return ret;
>  
> +		ret = intel_dp_mst_add_topology_state_for_crtc(state, crtc);
> +		if (ret)
> +			return ret;
> +
>  		ret = intel_atomic_add_affected_planes(state, crtc);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 8b0e4defa3f10..f3cb12dcfe0a7 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1223,3 +1223,64 @@ bool intel_dp_mst_is_slave_trans(const struct intel_crtc_state *crtc_state)
>  	return crtc_state->mst_master_transcoder != INVALID_TRANSCODER &&
>  	       crtc_state->mst_master_transcoder != crtc_state->cpu_transcoder;
>  }
> +
> +/**
> + * intel_dp_mst_add_topology_state_for_connector - add MST topology state for a connector
> + * @state: atomic state
> + * @connector: connector to add the state for
> + * @crtc: the CRTC @connector is attached to
> + *
> + * Add the MST topology state for @connector to @state.
> + *
> + * Returns 0 on success, negative error code on failure.
> + */
> +static int
> +intel_dp_mst_add_topology_state_for_connector(struct intel_atomic_state *state,
> +					      struct intel_connector *connector,
> +					      struct intel_crtc *crtc)
> +{
> +	struct drm_dp_mst_topology_state *mst_state;
> +
> +	if (!connector->mst_port)
> +		return 0;
> +
> +	mst_state = drm_atomic_get_mst_topology_state(&state->base,
> +						      &connector->mst_port->mst_mgr);
> +	if (IS_ERR(mst_state))
> +		return PTR_ERR(mst_state);
> +
> +	mst_state->pending_crtc_mask |= drm_crtc_mask(&crtc->base);
> +
> +	return 0;
> +}
> +
> +/**
> + * intel_dp_mst_add_topology_state_for_crtc - add MST topology state for a CRTC
> + * @state: atomic state
> + * @crtc: CRTC to add the state for
> + *
> + * Add the MST topology state for @crtc to @state.
> + *
> + * Returns 0 on success, negative error code on failure.
> + */
> +int intel_dp_mst_add_topology_state_for_crtc(struct intel_atomic_state *state,
> +					     struct intel_crtc *crtc)
> +{
> +	struct drm_connector *_connector;
> +	struct drm_connector_state *conn_state;
> +	int i;
> +
> +	for_each_new_connector_in_state(&state->base, _connector, conn_state, i) {
> +		struct intel_connector *connector = to_intel_connector(_connector);
> +		int ret;
> +
> +		if (conn_state->crtc != &crtc->base)
> +			continue;
> +
> +		ret = intel_dp_mst_add_topology_state_for_connector(state, connector, crtc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.h b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> index f7301de6cdfb3..f1815bb722672 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.h
> @@ -8,6 +8,8 @@
>  
>  #include <linux/types.h>
>  
> +struct intel_atomic_state;
> +struct intel_crtc;
>  struct intel_crtc_state;
>  struct intel_digital_port;
>  struct intel_dp;
> @@ -18,5 +20,7 @@ int intel_dp_mst_encoder_active_links(struct intel_digital_port *dig_port);
>  bool intel_dp_mst_is_master_trans(const struct intel_crtc_state *crtc_state);
>  bool intel_dp_mst_is_slave_trans(const struct intel_crtc_state *crtc_state);
>  bool intel_dp_mst_source_support(struct intel_dp *intel_dp);
> +int intel_dp_mst_add_topology_state_for_crtc(struct intel_atomic_state *state,
> +					     struct intel_crtc *crtc);
>  
>  #endif /* __INTEL_DP_MST_H__ */
> -- 
> 2.37.1
> 
