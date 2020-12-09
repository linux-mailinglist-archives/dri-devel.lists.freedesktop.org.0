Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5D2D4F1F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 00:56:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497226E3D2;
	Wed,  9 Dec 2020 23:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957CF6E301;
 Wed,  9 Dec 2020 23:56:16 +0000 (UTC)
IronPort-SDR: GYRF5oNvGwUMfxjQP6GuqmGkTuwHFPgwi5NhHeoghj5YhVinpnxXgmxuYf7KGXLvW1fXNEfAZq
 TFdITYgY8O7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161928036"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="161928036"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 15:56:15 -0800
IronPort-SDR: YFbs6hlI8KMSgq8hsw74iX0qG1la7x2UcV8T6RGL5cIpA4+MLPqvzO/sZ6WdDnYzf8o6IkVvCN
 3T765zQ+6Z4w==
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; d="scan'208";a="348555846"
Received: from dannie-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.209.50.82])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 15:56:15 -0800
Date: Wed, 9 Dec 2020 15:56:15 -0800
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm/i915/display/tc: Only WARN once for bogus tc port flag
Message-ID: <20201209235615.GA3636@intel.com>
References: <20201209211828.53193-1-sean@poorly.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209211828.53193-1-sean@poorly.run>
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 09, 2020 at 04:16:36PM -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> No need to spam syslog/console when we can ignore/fix the flag.

besides that we are calling from multiple places anyway..

> 
> Signed-off-by: Sean Paul <seanpaul@chromium.org>


Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
>  drivers/gpu/drm/i915/display/intel_tc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_tc.c b/drivers/gpu/drm/i915/display/intel_tc.c
> index 4346bc1a747a..27dc2dad6809 100644
> --- a/drivers/gpu/drm/i915/display/intel_tc.c
> +++ b/drivers/gpu/drm/i915/display/intel_tc.c
> @@ -262,7 +262,7 @@ static u32 tc_port_live_status_mask(struct intel_digital_port *dig_port)
>  		mask |= BIT(TC_PORT_LEGACY);
>  
>  	/* The sink can be connected only in a single mode. */
> -	if (!drm_WARN_ON(&i915->drm, hweight32(mask) > 1))
> +	if (!drm_WARN_ON_ONCE(&i915->drm, hweight32(mask) > 1))
>  		tc_port_fixup_legacy_flag(dig_port, mask);
>  
>  	return mask;
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
