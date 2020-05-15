Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AEE1D520E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC4B6ECCE;
	Fri, 15 May 2020 14:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3A06ECCB;
 Fri, 15 May 2020 14:43:03 +0000 (UTC)
IronPort-SDR: n/5GC68LsdHV2Wv63Yj23js9sTLqHrU0mndC8Atwf1oE0jkBRs4obL7rk4OjFQIbBBdc8BDUbq
 pg/BMFTHTPXw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:43:02 -0700
IronPort-SDR: 2B/UzCOtUmmJUQ2pwtqt27+txwpREcJ4c1kXnKsUbxbZaBb7/29IkQ6ywyjOs2JTXe9kV4Svvg
 nZTb6vXXJB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="307439322"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by FMSMGA003.fm.intel.com with ESMTP; 15 May 2020 07:42:59 -0700
Date: Fri, 15 May 2020 20:12:56 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 16/16] drm/i915: Add HDCP 1.4 support for MST connectors
Message-ID: <20200515144255.GA11877@intel.com>
References: <20200429195502.39919-1-sean@poorly.run>
 <20200429195502.39919-17-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429195502.39919-17-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-29 at 15:55:02 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Now that all the groundwork has been laid, we can turn on HDCP 1.4 over
> MST. Everything except for toggling the HDCP signalling and HDCP 2.2
> support is the same as the DP case, so we'll re-use those callbacks
> 
> Cc: Juston Li <juston.li@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-12-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-13-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-13-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-15-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-17-sean@poorly.run #v5
> 
> Changes in v2:
> -Toggle HDCP from encoder disable/enable
> -Don't disable HDCP on MST connector destroy, leave that for encoder
>  disable, just ensure the check_work routine isn't running any longer
> Changes in v3:
> -Place the shim in the new intel_dp_hdcp.c file (Ville)
> Changes in v4:
> -Actually use the mst shim for mst connections (Juston)
> -Use QUERY_STREAM_ENC_STATUS MST message to verify channel is encrypted
> Changes in v5:
> -Add sleep on disable signalling to match hdmi delay
> Changes in v6:
> -Disable HDCP over MST on GEN12+ since I'm unsure how it should work and I
>  don't have hardware to test it
> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 107 ++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  |  18 ++++
>  2 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 4e3dafbea1f9..331fdb312e05 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -7,10 +7,12 @@
>   */
>  
>  #include <drm/drm_dp_helper.h>
> +#include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_hdcp.h>
>  #include <drm/drm_print.h>
>  
>  #include "intel_display_types.h"
> +#include "intel_ddi.h"
>  #include "intel_dp.h"
>  #include "intel_hdcp.h"
>  
> @@ -618,6 +620,106 @@ static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
>  	.protocol = HDCP_PROTOCOL_DP,
>  };
>  
> +static int
> +intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
> +				    enum transcoder cpu_transcoder,
> +				    bool enable)
> +{
> +	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> +	int ret;
> +
> +	if (!enable)
> +		usleep_range(6, 60); /* Bspec says >= 6us */
> +
> +	ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base,
> +					       cpu_transcoder, enable);
Sean,

The bit configured here is meant for HDMI and DVI only. Ignore for DP.
Thanks anshuman for pointing that out.
> +	if (ret)
> +		drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
> +			      enable ? "Enable" : "Disable", ret);
> +	return ret;
> +}
> +
> +static
> +int intel_dp_mst_hdcp2_write_msg(struct intel_digital_port *intel_dig_port,
> +				 void *buf, size_t size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static
> +int intel_dp_mst_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
> +				u8 msg_id, void *buf, size_t size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int
> +intel_dp_mst_hdcp2_config_stream_type(struct intel_digital_port *intel_dig_port,
> +				      bool is_repeater, u8 content_type)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static
> +int intel_dp_mst_hdcp2_check_link(struct intel_digital_port *intel_dig_port)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static
> +int intel_dp_mst_hdcp2_capable(struct intel_digital_port *intel_dig_port,
> +			       bool *capable)
> +{
> +	*capable = false;
> +	return 0;
> +}
> +
> +static
> +bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *intel_dig_port,
> +				  struct intel_connector *connector)
> +{
> +	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
> +	struct intel_dp *intel_dp = &intel_dig_port->dp;
> +	struct drm_dp_query_stream_enc_status_ack_reply reply;
> +	int ret;
> +
> +	if (!intel_dp_hdcp_check_link(intel_dig_port, connector))
> +		return false;
> +
> +	ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> +						  connector->port, &reply);
> +	if (ret) {
> +		drm_dbg_kms(&i915->drm,
> +			    "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> +			    connector->base.base.id, connector->base.name, ret);
> +		return false;
> +	}
> +
> +	return reply.auth_completed && reply.encryption_enabled;
> +}
> +
> +static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
> +	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
> +	.read_bksv = intel_dp_hdcp_read_bksv,
> +	.read_bstatus = intel_dp_hdcp_read_bstatus,
> +	.repeater_present = intel_dp_hdcp_repeater_present,
> +	.read_ri_prime = intel_dp_hdcp_read_ri_prime,
> +	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
> +	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
> +	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
> +	.toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> +	.check_link = intel_dp_mst_hdcp_check_link,
> +	.hdcp_capable = intel_dp_hdcp_capable,
> +
> +	.write_2_2_msg = intel_dp_mst_hdcp2_write_msg,
> +	.read_2_2_msg = intel_dp_mst_hdcp2_read_msg,
> +	.config_stream_type = intel_dp_mst_hdcp2_config_stream_type,
> +	.check_2_2_link = intel_dp_mst_hdcp2_check_link,
> +	.hdcp_2_2_capable = intel_dp_mst_hdcp2_capable,
IMO, we dont need to introduce dummy functions for HDCP2.2 on MST shim,
when we are not enabling HDCP2.2 on it.

At is_hdcp2_supported() just add
if (connector->mst_port)
	return false;
> +
> +	.protocol = HDCP_PROTOCOL_DP,
> +};
> +
>  int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
>  		       struct intel_connector *intel_connector)
>  {
> @@ -630,7 +732,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
>  	if (!is_hdcp_supported(dev_priv, port))
>  		return 0;
>  
> -	if (!intel_dp_is_edp(intel_dp))
> +	if (intel_connector->mst_port)
> +		return intel_hdcp_init(intel_connector, port,
> +				       &intel_dp_mst_hdcp_shim);
> +	else if (!intel_dp_is_edp(intel_dp))
>  		return intel_hdcp_init(intel_connector, port,
>  				       &intel_dp_hdcp_shim);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index d9dc4dc6ea92..ab24e5057c60 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -36,6 +36,7 @@
>  #include "intel_dp.h"
>  #include "intel_dp_mst.h"
>  #include "intel_dpio_phy.h"
> +#include "intel_hdcp.h"
>  
>  static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>  					    struct intel_crtc_state *crtc_state,
> @@ -332,6 +333,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
>  	drm_dbg_kms(&i915->drm, "active links %d\n",
>  		    intel_dp->active_mst_links);
>  
> +	intel_hdcp_disable(intel_mst->connector);
> +
>  	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
>  
>  	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> @@ -526,6 +529,13 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>  	drm_dp_update_payload_part2(&intel_dp->mst_mgr);
>  	if (pipe_config->has_audio)
>  		intel_audio_codec_enable(encoder, pipe_config, conn_state);
> +
> +	/* Enable hdcp if it's desired */
> +	if (conn_state->content_protection ==
> +	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
> +		intel_hdcp_enable(to_intel_connector(conn_state->connector),
> +				  pipe_config->cpu_transcoder,
> +				  (u8)conn_state->hdcp_content_type);

I am afraid I am not seeing the stream level HDCP encryption set
anywhere. How the userspace will indicate the streams that needs to be
hdcp encrypted?

Thanks,
-Ram
>  }
>  
>  static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
> @@ -748,6 +758,14 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  	intel_attach_force_audio_property(connector);
>  	intel_attach_broadcast_rgb_property(connector);
>  
> +
> +	/* TODO: Figure out how to make HDCP work on GEN12+ */
> +	if (INTEL_GEN(dev_priv) < 12) {
> +		ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
> +		if (ret)
> +			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
> +	}
> +
>  	/*
>  	 * Reuse the prop from the SST connector because we're
>  	 * not allowed to create new props after device registration.
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
