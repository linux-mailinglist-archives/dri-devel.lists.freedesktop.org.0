Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3732F48BA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 11:34:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862616E44B;
	Wed, 13 Jan 2021 10:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0698B6E44B;
 Wed, 13 Jan 2021 10:34:25 +0000 (UTC)
IronPort-SDR: qyaXFNgrJJA6BrLmdst1bMIbtdNVQrFslEJ0v0hPE/3FyPNJ+ZxSuwxwnv+VL22HsvE29GPzkj
 q5SlrxZkHD9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="262970888"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="262970888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 02:34:17 -0800
IronPort-SDR: VoDVJ2Kl4wmP9IJ/eHm59zPfEa6T+PlTGS0FAH1DZwVOVqS7lf3Mr4+iwsufjxiquhtlXJxgbq
 MJjwNiy1QbUA==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="567812370"
Received: from unknown (HELO intel.com) ([10.223.74.179])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 02:34:14 -0800
Date: Wed, 13 Jan 2021 15:49:43 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/hdcp: Disable the QSES check for
 HDCP 1.4 over MST
Message-ID: <20210113101942.GK11717@intel.com>
References: <20210106223909.34476-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106223909.34476-1-sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-01-07 at 04:08:58 +0530, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> The HDCP 1.4 spec does not require the QUERY_STREAM_ENCRYPTION_STATUS
IMHO DP 1.4 vesa specs I.3.5 mark QSES as desirale for both HDCP 1.4 and HDCP 2.2.
"The MST Source device may use a QUERY_STREAM_ENCRYPTION_STATUS message
transaction to query the downstream status for a particular stream."

I feel it useful for scenario in which a non hdcp supported monitor
is hot plugged to MST branch. Source really doesn't know about the hdcp
capable device on MST branch, it just know the capability of immediate 
downstream device. QSES can fetch the HDCP capability from MST topology. 
We don't require to enable stream encryption for such streams. 
> check, it was always a nice-to-have. After deploying this across various
> devices, we've determined that some MST bridge chips do not properly
> support this call for HDCP 1.4 (namely Synaptics and Realtek).
> 
> I had considered creating a quirk for this, but I think it's more
> prudent to just disable the check entirely since I don't have an idea
> how widespread support is.
May be we can remove it from the link check and can retain as utility ?
Thanks,
Anshuman Gupta.
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
