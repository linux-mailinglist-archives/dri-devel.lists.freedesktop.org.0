Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98912F37A4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 18:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480589B97;
	Tue, 12 Jan 2021 17:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B18789B97;
 Tue, 12 Jan 2021 17:51:49 +0000 (UTC)
IronPort-SDR: E4lrsPt2tRtrCdg708BLXkwtTUnu9ZCAIXBM+MALAd4Uqicx7be+ae51XjFKdoyQ6NRJWnMSsP
 xVFX/H9mSsLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="242152447"
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="242152447"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 09:51:47 -0800
IronPort-SDR: wzOWCNLxNuV6DkQgDKdVA2QSjfaVIm4iTPqbNI4skbeyopQhPCz8bmF8jjCh6Pf//AK5eFieoO
 UTa5H3pfE8RA==
X-IronPort-AV: E=Sophos;i="5.79,342,1602572400"; d="scan'208";a="381510580"
Received: from vbucoci-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.39.237])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 09:51:43 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/i915/hdcp: Disable the QSES check for HDCP 1.4 over
 MST
In-Reply-To: <20210106223909.34476-1-sean@poorly.run>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210106223909.34476-1-sean@poorly.run>
Date: Tue, 12 Jan 2021 19:51:39 +0200
Message-ID: <87czyat55g.fsf@intel.com>
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
Cc: , David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Anshuman, please review.

BR,
Jani.

On Wed, 06 Jan 2021, Sean Paul <sean@poorly.run> wrote:
> From: Sean Paul <seanpaul@chromium.org>
>
> The HDCP 1.4 spec does not require the QUERY_STREAM_ENCRYPTION_STATUS
> check, it was always a nice-to-have. After deploying this across various
> devices, we've determined that some MST bridge chips do not properly
> support this call for HDCP 1.4 (namely Synaptics and Realtek).
>
> I had considered creating a quirk for this, but I think it's more
> prudent to just disable the check entirely since I don't have an idea
> how widespread support is.
>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 26 +-------------------
>  1 file changed, 1 insertion(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> index 03424d20e9f7..b6a9606bf09a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> @@ -640,30 +640,6 @@ intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *dig_port,
>  	return ret;
>  }
>  
> -static
> -bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
> -				  struct intel_connector *connector)
> -{
> -	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
> -	struct intel_dp *intel_dp = &dig_port->dp;
> -	struct drm_dp_query_stream_enc_status_ack_reply reply;
> -	int ret;
> -
> -	if (!intel_dp_hdcp_check_link(dig_port, connector))
> -		return false;
> -
> -	ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
> -						  connector->port, &reply);
> -	if (ret) {
> -		drm_dbg_kms(&i915->drm,
> -			    "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
> -			    connector->base.base.id, connector->base.name, ret);
> -		return false;
> -	}
> -
> -	return reply.auth_completed && reply.encryption_enabled;
> -}
> -
>  static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
>  	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
>  	.read_bksv = intel_dp_hdcp_read_bksv,
> @@ -674,7 +650,7 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
>  	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
>  	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
>  	.toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
> -	.check_link = intel_dp_mst_hdcp_check_link,
> +	.check_link = intel_dp_hdcp_check_link,
>  	.hdcp_capable = intel_dp_hdcp_capable,
>  
>  	.protocol = HDCP_PROTOCOL_DP,

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
