Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDEA786C3B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5746010E51E;
	Thu, 24 Aug 2023 09:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F7C10E51D;
 Thu, 24 Aug 2023 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692870366; x=1724406366;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=9EHU9YybOEdKc0AyKFyh5bPOsUOiowlUmHJWuaoZYas=;
 b=AklFwQkk3g3kI4grB2c4PF70XwFJFOeBpmmj6aJMWyxu9XygVmAAib8Q
 kLKlqX/evMHdowsbD3RuliSFkLiUJBpJj4F74HYO2AOc9MRcE7IyvMC+A
 mnAHscvz1nseFgDK/BhB/R3ScnMIJg9hWwisJVr+obp+dk9InvkLnQ4Qp
 G3boWdLfesfswXiiY9dlN6HIt+H3cm4j/jjhKqZ4xEHnDvhLzs92IokHt
 EJLMoNYBea4qEg/NsQYja1jfCaDe/WiNp4R6Za7sHSq8fZXoh1Xj4Y1f/
 0bhztJTBEkY/m1tIkxG/VVHGwfj9J1ulOWoia849WCOVviFEtHn4wHSuH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440741826"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="440741826"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="802484082"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="802484082"
Received: from andrzejk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.90])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:45:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is
 supported
In-Reply-To: <20230824034705.755243-1-ankit.k.nautiyal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
 <20230824034705.755243-1-ankit.k.nautiyal@intel.com>
Date: Thu, 24 Aug 2023 12:45:44 +0300
Message-ID: <87lee04vuf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Ankit Nautiyal <ankit.k.nautiyal@intel.com> wrote:
> As per DP v1.4, a DP DSC Sink device shall support 8bpc in DPCD 6Ah.
> Apparently some panels that do support DSC, are not setting the bit for
> 8bpc.
>
> So always assume 8bpc support by DSC decoder, when DSC is claimed to be
> supported.
>
> v2: Use helper to check dsc support. (Ankit)
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e6a78fd32380..309fc10cde78 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2447,14 +2447,19 @@ int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_S
>  					 u8 dsc_bpc[3])
>  {
>  	int num_bpc = 0;
> +
> +     if(!drm_dp_sink_supports_dsc(dsc_dpcd))
          ^

Missing space.

> +		return 0;
> +
>  	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];

All declarations should be before code.

>  
>  	if (color_depth & DP_DSC_12_BPC)
>  		dsc_bpc[num_bpc++] = 12;
>  	if (color_depth & DP_DSC_10_BPC)
>  		dsc_bpc[num_bpc++] = 10;
> -	if (color_depth & DP_DSC_8_BPC)
> -		dsc_bpc[num_bpc++] = 8;
> +
> +	/* A DP DSC Sink devices shall support 8 bpc. */

Mixed singular and plural, a ... devices.

> +	dsc_bpc[num_bpc++] = 8;
>  
>  	return num_bpc;
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
