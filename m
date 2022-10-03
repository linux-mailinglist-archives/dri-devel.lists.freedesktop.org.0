Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A855F2C8C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 10:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BB310E284;
	Mon,  3 Oct 2022 08:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FD510E284;
 Mon,  3 Oct 2022 08:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664787382; x=1696323382;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FCfCOgGOUY/byRRJnzIPIiAOslhp+jV3cccXOb1XhrU=;
 b=NsbG1kx49rYNRcory2vbABDs5quNWxBlEkftT0Cp3o3RIUykjGgbGxDy
 DTtr5tcuuu8Sa7gANY6at8tujS5EItEC0EPtO/EcD+o914XwsudzFXkNo
 pd9zQh0yA4n6iWNsVgCf5UXdVKW0/x5OW4lkVXI84KXL8dLiu5Dk4Elos
 covG1NSDab5O8E9LEcOjJxN1MoObXClXytN4MNEueD3JYRwonCiynPvba
 IyJwwS9oQSM0j0vJRp8JQ1NLsZLq8oJ5dksxWDkhvbiuMy+VKbrwssRKx
 GyE+/el7y9PVvFMHxrDILj1hxIPivKnVZTyCQpga5wNFc9fImSdAqT1KW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="366627751"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="366627751"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 01:56:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10488"; a="574557250"
X-IronPort-AV: E=Sophos;i="5.93,365,1654585200"; d="scan'208";a="574557250"
Received: from praffert-mobl.ger.corp.intel.com (HELO [10.213.196.20])
 ([10.213.196.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2022 01:56:20 -0700
Message-ID: <406ebfa6-b00c-b2ba-fd27-04e46de7ffc1@linux.intel.com>
Date: Mon, 3 Oct 2022 09:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [Intel-gfx] [PATCH v2 14/14] drm/i915/mtl: Add multicast steering
 for media GT
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-15-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221001004550.3031431-15-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: ravi.kumar.vodapalli@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Matt,

On 01/10/2022 01:45, Matt Roper wrote:
> MTL's media GT only has a single type of steering ("OAADDRM") which
> selects between media slice 0 and media slice 1.  We'll always steer to
> media slice 0 unless it is fused off (which is the case when VD0, VE0,
> and SFC0 are all reported as unavailable).
> 
> Bspec: 67789
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 19 +++++++++++++++++--
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 18 +++++++++++++++++-
>   3 files changed, 35 insertions(+), 3 deletions(-)

[snip]

> +static void
> +mtl_media_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	/*
> +	 * Unlike older platforms, we no longer setup implicit steering here;
> +	 * all MCR accesses are explicitly steered.
> +	 */
> +	if (drm_debug_enabled(DRM_UT_DRIVER)) {
> +		struct drm_printer p = drm_debug_printer("MCR Steering:");
> +
> +		intel_gt_mcr_report_steering(&p, gt, false);
> +	}
> +}
> +
>   static void
>   gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
>   
> -	if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
> +	if (IS_METEORLAKE(i915) && gt->type == GT_MEDIA)
> +		mtl_media_gt_workarounds_init(gt, wal);
> +	else if (IS_METEORLAKE(i915) && gt->type == GT_PRIMARY)
>   		mtl_3d_gt_workarounds_init(gt, wal);
>   	else if (IS_PONTEVECCHIO(i915))
>   		pvc_gt_workarounds_init(gt, wal);

Casually reading only - wouldn't it be nicer if the if-ladder in here 
(gt_init_workarounds) would have a single case per platform, and then 
you'd fork further (3d vs media) in MTL specific function?

Also, series ends up with mtl_media_gt_workarounds_init and 
mtl_3d_gt_workarounds_init apparently 100% identical. You will need two 
copies in the future?

Regards,

Tvrtko
