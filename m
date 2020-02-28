Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE682173209
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 08:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9A6EE10;
	Fri, 28 Feb 2020 07:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A416EE10;
 Fri, 28 Feb 2020 07:47:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 23:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,495,1574150400"; d="scan'208";a="232460848"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2020 23:47:43 -0800
Date: Fri, 28 Feb 2020 13:17:42 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4 13.5/14] drm/i915: Print HDCP version info for all
 connectors
Message-ID: <20200228074741.GA10548@intel.com>
References: <5bfd0d1e266b00029ee98e505fe4d3318a4787ea.camel@intel.com>
 <20200227185714.171466-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227185714.171466-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Juston Li <juston.li@intel.com>, rodrigo.vivi@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-27 at 13:56:58 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> De-duplicate the HDCP version code and print it for all connectors.
> 
> Cc: Juston Li <juston.li@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v4:
> - Added to the set
> ---
>  .../drm/i915/display/intel_display_debugfs.c    | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 46954cc7b6c01..eb948a14cfd61 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -597,6 +597,11 @@ static void intel_hdcp_info(struct seq_file *m,
>  {
>  	bool hdcp_cap, hdcp2_cap;
>  
> +	if (!intel_connector->hdcp.shim) {
> +		seq_puts(m, "No Connector Support");
> +		goto out;
> +	}
With shim check moved inside the hdcp_info, we could remove it from
i915_hdcp_sink_capability_show. Let us return "No connector support" for
that debugfs too.

With that addressed.
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> +
>  	hdcp_cap = intel_hdcp_capable(intel_connector);
>  	hdcp2_cap = intel_hdcp2_capable(intel_connector);
>  
> @@ -608,6 +613,7 @@ static void intel_hdcp_info(struct seq_file *m,
>  	if (!hdcp_cap && !hdcp2_cap)
>  		seq_puts(m, "None");
>  
> +out:
>  	seq_puts(m, "\n");
>  }
>  
> @@ -624,10 +630,6 @@ static void intel_dp_info(struct seq_file *m,
>  
>  	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp->downstream_ports,
>  				&intel_dp->aux);
> -	if (intel_connector->hdcp.shim) {
> -		seq_puts(m, "\tHDCP version: ");
> -		intel_hdcp_info(m, intel_connector);
> -	}
>  }
>  
>  static void intel_dp_mst_info(struct seq_file *m,
> @@ -651,10 +653,6 @@ static void intel_hdmi_info(struct seq_file *m,
>  	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(intel_encoder);
>  
>  	seq_printf(m, "\taudio support: %s\n", yesno(intel_hdmi->has_audio));
> -	if (intel_connector->hdcp.shim) {
> -		seq_puts(m, "\tHDCP version: ");
> -		intel_hdcp_info(m, intel_connector);
> -	}
>  }
>  
>  static void intel_lvds_info(struct seq_file *m,
> @@ -710,6 +708,9 @@ static void intel_connector_info(struct seq_file *m,
>  		break;
>  	}
>  
> +	seq_puts(m, "\tHDCP version: ");
> +	intel_hdcp_info(m, intel_connector);
> +
>  	seq_printf(m, "\tmodes:\n");
>  	list_for_each_entry(mode, &connector->modes, head)
>  		intel_seq_print_mode(m, 2, mode);
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
