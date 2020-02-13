Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAAD15BD09
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 11:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B516E1D6;
	Thu, 13 Feb 2020 10:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8B46E1CE;
 Thu, 13 Feb 2020 10:46:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 02:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; d="scan'208";a="313694063"
Received: from unknown (HELO intel.com) ([10.223.74.178])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2020 02:46:19 -0800
Date: Thu, 13 Feb 2020 16:07:46 +0530
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 4/5] drm/i915: dont retry stream
 management at seq_num_m roll over
Message-ID: <20200213103746.GB11041@intel.com>
References: <20200212102942.26568-1-ramalingam.c@intel.com>
 <20200212102942.26568-5-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212102942.26568-5-ramalingam.c@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-12 at 15:59:41 +0530, Ramalingam C wrote:
> When roll over detected for seq_num_m, we shouldn't continue with stream
> management with rolled over value.
> 
> So we are terminating the stream management retry, on roll over of the
> seq_num_m.
> 
> v2:
>   using drm_dbg_kms instead of DRM_DEBUG_KMS [Anshuman]
> v3:
>   dev_priv is used as i915 [JaniN]
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index b24d12efae0a..b35f50d4a0e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -1419,11 +1419,6 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  
>  err_exit:
>  	hdcp->seq_num_m++;
> -	if (hdcp->seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
> -		DRM_DEBUG_KMS("seq_num_m roll over.\n");
> -		ret = -1;
> -	}
> -
>  	return ret;
>  }
>  
> @@ -1618,8 +1613,11 @@ hdcp2_propagate_stream_management_info(struct intel_connector *connector)
>  
>  	for (i = 0; i < tries; i++) {
>  		ret = _hdcp2_propagate_stream_management_info(connector);
> -		if (!ret)
> +		if (!ret || connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
> +			if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
> +				drm_dbg_kms(&i915->drm, "seq_num_m roll over.\n");
>  			break;
> +		}
Tested this with HDCP Comp tool.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Tested-by: Anshuman Gupta <anshuman.gupta@intel.com>
>  
>  		drm_dbg_kms(&i915->drm,
>  			    "HDCP2 stream management %d of %d Failed.(%d)\n",
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
