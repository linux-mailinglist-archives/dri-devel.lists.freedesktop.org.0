Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 894859D0FF4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 12:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424310E193;
	Mon, 18 Nov 2024 11:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRLKwEvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2E810E193;
 Mon, 18 Nov 2024 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731930313; x=1763466313;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=WHnvn6U6QGYnQpC2tu2f7Zlp6UgrR3aNeDN12KB1cK8=;
 b=PRLKwEvE+tBZisk424JDOQGTYe0LpoKuUk4CR0jnV4VgdfXV5jeEjtwm
 EsEyCgHVeD1JuYsj8k5gxPd+gnO1EUH94mLa5Yn3BcYWdnLfQY0dFIZIy
 ZMPIf0u24dfh+iTmDQe1WLcb/W2cpw80SNdhm0Ns14Aiv3j3JYrBvhn5z
 DiCZjurhIPd/zxG02JI/GuWDPdIWa+t7aGQaQAUoYTHW3TeYt5PsnF7Mx
 SnpmioyeLKCIQAnUdUcN5xXEv9FC6oqGIdU0KCcxnYiyKQBTjIsVyTVQX
 9RY3g7oc2BTn6y86UTwo0N0QDeRciAfLsir0GHpL0bC1rjSCxxc1k0ajh Q==;
X-CSE-ConnectionGUID: WRmkZwueS66FHxFKnFbUzA==
X-CSE-MsgGUID: hHgaGAVKQoqRudYz4yCmrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31287870"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="31287870"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:45:12 -0800
X-CSE-ConnectionGUID: 3i510Gq9THK7D8zmyyxKfQ==
X-CSE-MsgGUID: 5ocyj2ktSSiEXH8KeG9M9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89117551"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 03:45:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/i915/dp_mst: Fix connector initialization in
 intel_dp_add_mst_connector()
In-Reply-To: <20241115164159.1081675-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115164159.1081675-1-imre.deak@intel.com>
Date: Mon, 18 Nov 2024 13:45:07 +0200
Message-ID: <87frno4vgc.fsf@intel.com>
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

On Fri, 15 Nov 2024, Imre Deak <imre.deak@intel.com> wrote:
> The connector initialization in intel_dp_add_mst_connector() depends on
> the device pointer in connector to be valid, at least by connector
> debug printing. The device pointer is initialized by drm_connector_init(),
> however that function also exposes the connector to in-kernel users,
> which can't be done before the connector is fully initialized. For now
> make sure the device pointer is valid before it's used, until a
> follow-up change moving this to DRM core.
>
> This issue was revealed by the commit in the Fixes: line below, before
> which the above debug printing checked and handled a NULL device pointer
> gracefully in DRM core.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799
> Signed-off-by: Imre Deak <imre.deak@intel.com>

I think you should send this patch alone to intel-gfx and intel-xe to
address the regression.

The others can follow later, and likely be merged via drm-misc. I have
some comments about them, but I don't want to block fixing the issue.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index df7edcfe885b6..f058360a26413 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1727,6 +1727,16 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  
>  	intel_dp_init_modeset_retry_work(intel_connector);
>  
> +	/*
> +	 * TODO: The following drm_connector specific initialization belongs
> +	 * to DRM core, however it happens atm too late in
> +	 * drm_connector_init(). That function will also expose the connector
> +	 * to in-kernel users, so it can't be called until the connector is
> +	 * sufficiently initialized; init the device pointer used by the
> +	 * following DSC setup, until a fix moving this to DRM core.
> +	 */
> +	intel_connector->base.dev = mgr->dev;
> +
>  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
>  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
>  	intel_connector->dp.dsc_hblank_expansion_quirk =

-- 
Jani Nikula, Intel
