Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 689344DBBA8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 01:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F8010EABA;
	Thu, 17 Mar 2022 00:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27A410EABA;
 Thu, 17 Mar 2022 00:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647476810; x=1679012810;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mu+/zQqsXTdOSblF1nO8MHIoGvuEvZTJASHiyEa2wU4=;
 b=E9KVNgwqnqCHnLHSXHsqVYd4OgCREJ7CoDdwQ9IDlOux6ctsfWKU+ttq
 WtP6XBN5X8AZkoyjRgCeX6v688l/MC0Lj0iJ6x8pdt3E4TvqUSBJoPVFH
 QmyLOFilQttVvb8C7v9/rvDofY15e5CR+Lh+8gktH5bAnkpZpjJAudac7
 k3LvMgfWm+imlS+AOp0qhxu26KzefMj6/Q4xrURU7vXwD0m+L1GYokfw2
 fIHnf6+cH+uhr3DRUAPcyDs7veWuUMO1aURkSsq0fhl5Xmcm0zEcNb8Q+
 06u2WiI2MDN+Gwi+JvXV0hj4HUFjLoX11XpkymfpJ5UjFpNhaBJQAuuiF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="244199883"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="244199883"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 17:26:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="557694628"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 17:26:50 -0700
Date: Wed, 16 Mar 2022 17:20:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/i915: Add logical mapping for video decode engines
Message-ID: <20220317002044.GA13917@jons-linux-dev-box>
References: <20220316234538.434357-1-lucas.demarchi@intel.com>
 <20220316234538.434357-2-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316234538.434357-2-lucas.demarchi@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 04:45:38PM -0700, Lucas De Marchi wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Add logical mapping for VDBOXs. This mapping is required for
> split-frame workloads, which otherwise fail with
> 
> 	00000000-F8C53528: [GUC] 0441-INVALID_ENGINE_SUBMIT_MASK
> 
> ... if the application is using the logical id to reorder the engines and
> then using it for the batch buffer submission. It's not a big problem on
> media version 11 and 12 as they have only 2 instances of VCS and the
> logical to physical mapping is monotonically increasing - if the
> application is not using the logical id.
> 
> Changing it for the previous platforms allows the media driver
> implementation for the next ones (12.50 and above) to be the same,
> checking the logical id. It should also not introduce any bug for the
> old versions of userspace not checking the id.
> 
> The mapping added here is the complete map needed by XEHPSDV. Previous
> platforms with only 2 instances will just use a partial map and should
> still work.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> [ Extend the mapping to media versions 11 and 12 and give proper
>   justification in the commit message why ]
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

For the changes to the patch / commit message:

Acked-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> index 8080479f27aa..afa2e61cf729 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
> @@ -731,12 +731,24 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
>  
>  static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
>  {
> -	int i;
> -	u8 map[MAX_ENGINE_INSTANCE + 1];
> +	/*
> +	 * Logical to physical mapping is needed for proper support
> +	 * to split-frame feature.
> +	 */
> +	if (MEDIA_VER(gt->i915) >= 11 && class == VIDEO_DECODE_CLASS) {
> +		static const u8 map[] = { 0, 2, 4, 6, 1, 3, 5, 7 };
>  
> -	for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
> -		map[i] = i;
> -	populate_logical_ids(gt, logical_ids, class, map, ARRAY_SIZE(map));
> +		populate_logical_ids(gt, logical_ids, class,
> +				     map, ARRAY_SIZE(map));
> +	} else {
> +		int i;
> +		u8 map[MAX_ENGINE_INSTANCE + 1];
> +
> +		for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
> +			map[i] = i;
> +		populate_logical_ids(gt, logical_ids, class,
> +				     map, ARRAY_SIZE(map));
> +	}
>  }
>  
>  /**
> -- 
> 2.35.1
> 
