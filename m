Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF8A213953
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 13:30:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C406EB5A;
	Fri,  3 Jul 2020 11:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411E46E087;
 Fri,  3 Jul 2020 11:30:01 +0000 (UTC)
IronPort-SDR: cEHXRuwE+4nX7lyBKo3ON/YBxZ7ttqFvQIeHQZTmgnGAQyhRiqUWvCaV61waj7pyUNne3MZ+kJ
 vLMyq6I4qo6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="146222355"
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="146222355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2020 04:30:00 -0700
IronPort-SDR: m6l2vT2STlfywZOkFZB1gRMZlS+EmAyaoWYqBhm16QdtPqYCSsvv/uPhj0FpwFkWFV2p0jQJPP
 WToSHvXpz8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,308,1589266800"; d="scan'208";a="314439011"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2020 04:29:58 -0700
Date: Fri, 3 Jul 2020 16:48:27 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH v7 17/17] drm/i915: Add HDCP 1.4 support for
 MST connectors
Message-ID: <20200703111827.GI15183@intel.com>
References: <20200623155907.22961-1-sean@poorly.run>
 <20200623155907.22961-18-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623155907.22961-18-sean@poorly.run>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-06-23 at 21:29:07 +0530, Sean Paul wrote:
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
> Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-17-sean@poorly.run #v6
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
> Changes in v7:
> -Remove hdcp2 shims for MST in favor of skipping hdcp2 init (Ramalingam)
> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 66 +++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c  | 18 ++++++
>  drivers/gpu/drm/i915/display/intel_hdcp.c    |  2 +-
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 43446a6cae8d..3f67bd27fc3c 100644
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
> @@ -618,6 +620,65 @@ static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
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
> +	if (ret)
> +		drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
> +			      enable ? "Enable" : "Disable", ret);
> +	return ret;
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
> +	.protocol = HDCP_PROTOCOL_DP,
> +};
> +
>  int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
>  		       struct intel_connector *intel_connector)
>  {
> @@ -630,7 +691,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
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
> index 0675825dcc20..abaaeeb963d2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -37,6 +37,7 @@
>  #include "intel_dp.h"
>  #include "intel_dp_mst.h"
>  #include "intel_dpio_phy.h"
> +#include "intel_hdcp.h"
>  
>  static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>  					    struct intel_crtc_state *crtc_state,
> @@ -352,6 +353,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
>  	drm_dbg_kms(&i915->drm, "active links %d\n",
>  		    intel_dp->active_mst_links);
>  
> +	intel_hdcp_disable(intel_mst->connector);
> +
>  	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
>  
>  	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
> @@ -548,6 +551,13 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
>  
>  	if (pipe_config->has_audio)
>  		intel_audio_codec_enable(encoder, pipe_config, conn_state);
> +
> +	/* Enable hdcp if it's desired */
> +	if (conn_state->content_protection ==
> +	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
> +		intel_hdcp_enable(to_intel_connector(conn_state->connector),
> +				  pipe_config->cpu_transcoder,
> +				  (u8)conn_state->hdcp_content_type);
I am not sure about that, do we need to enable HDCP for every
DP-MST connector here, it should be only immediate downstream connector
we should authenticate as repeater, after that it should be repeater
responsibility to authenticate further downstream connectors.

Tested this entire series on Gen12 H/W after removing the Gen12 restriction
condition with daisy-chain of two DP MST display.
Master DP MST connector has failed the repeater downstream authentication
due to error "KSV list failed to become ready" ETIMEDOUT.
Slave DP MST connector passes the authentication stage but failed to
enable the encryption.
Thanks,
Anshuman Gupta.
>  }
>  
>  static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
> @@ -770,6 +780,14 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
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
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 6bd0e4616ee1..ddc9db8de2bc 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -2060,7 +2060,7 @@ int intel_hdcp_init(struct intel_connector *connector,
>  	if (!shim)
>  		return -EINVAL;
>  
> -	if (is_hdcp2_supported(dev_priv))
> +	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
>  		intel_hdcp2_init(connector, port, shim);
>  
>  	ret =
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
