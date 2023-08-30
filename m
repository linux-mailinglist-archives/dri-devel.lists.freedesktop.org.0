Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBD78D3BD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BE210E4CF;
	Wed, 30 Aug 2023 07:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7935610E4D0;
 Wed, 30 Aug 2023 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693381910; x=1724917910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0XT9n5Z4r6fOHqovX9YbXWebfSSo0VleXQh7sphfzI8=;
 b=n5YFtyL3feSAtyMva1+1NNKBC7aLBXXFdgKeWHDbikJAF56SPQd98X5q
 wL0creCqxU1fB1guXpPk2X1FY6hxiHY4yxo86bBgGEiO27ym3fv58KU6C
 7fB8dJJrtxReC2N27HRI4iHGP5LpGeMfsHpsDjDRV1m4kQHBUb+Rim5Id
 y4VzFJtQlSNsn4pcPO+5hW4ABpwhiCjZOnO8d6++Q58izAuHjDxAjh8gu
 tzTzbCNhuSzS+s4AXu7+gjDOCMv8SrpEBlYr9RQfsX8wyMXfMcOp6fS9n
 msbtRiLJv79mb85vgbyiQuqfXODWDvXFpUbWJhwkMO6sfAflrlFOapZkK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="355889255"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="355889255"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 00:51:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862534554"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; d="scan'208";a="862534554"
Received: from unknown (HELO intel.com) ([10.237.72.65])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 00:51:49 -0700
Date: Wed, 30 Aug 2023 10:51:41 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [1/2] drm/display/dp: Assume 8 bpc support when DSC is supported
Message-ID: <ZO71Dbu1NvY8qYup@intel.com>
References: <20230824125121.840298-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824125121.840298-2-ankit.k.nautiyal@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 06:21:20PM +0530, Ankit Nautiyal wrote:
> As per DP v1.4, a DP DSC Sink device shall support 8bpc in DPCD 6Ah.
> Apparently some panels that do support DSC, are not setting the bit for
> 8bpc.
> 
> So always assume 8bpc support by DSC decoder, when DSC is claimed to be
> supported.
> 
> v2: Use helper to get check dsc support. (Ankit)
> v3: Fix styling and other typos. (Jani)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e6a78fd32380..8a1b64c57dfd 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2449,12 +2449,16 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>  	int num_bpc = 0;
>  	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
>  
> +	if (!drm_dp_sink_supports_dsc(dsc_dpcd))
> +		return 0;
> +
>  	if (color_depth & DP_DSC_12_BPC)
>  		dsc_bpc[num_bpc++] = 12;
>  	if (color_depth & DP_DSC_10_BPC)
>  		dsc_bpc[num_bpc++] = 10;
> -	if (color_depth & DP_DSC_8_BPC)
> -		dsc_bpc[num_bpc++] = 8;
> +
> +	/* A DP DSC Sink device shall support 8 bpc. */
> +	dsc_bpc[num_bpc++] = 8;
>  
>  	return num_bpc;
>  }
