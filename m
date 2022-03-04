Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 302114CDD57
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 20:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5818211340A;
	Fri,  4 Mar 2022 19:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6207C11340A;
 Fri,  4 Mar 2022 19:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646422423; x=1677958423;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XIbyo0fmgYRuIIghL8IvXkaGeIZeZOyEEYxiM4DdLUA=;
 b=fwRmzK9qZwhO6YhewEaN0VRxmOwWr2rXBgrHHMxc2CrvFCVy81aj1KC1
 MXGVaNdeLXspp5B5tWqG1DOqtUDhf0setHI+BqKLR7GOmaipOmewx//3Z
 OYhxKSdTdGzuicZZKRZ91VsvDRXxXHyHa1dtJBaYjztqtFuA+WhCdNYxz
 l7+9YSz0ESje7AuWqGTzxzd4JdXV56EfbhOyLwdluSQYm2L4G0MqL13/B
 qFbumUoGpzH2ee1c/mh3mLrnpSrBgLAKyVXCIxTdAwFyC9sahc1qVBzVS
 Jlwmp5kYQTR3xmxB8kHQKycBAXBPLiFerq6TTdUiekKe2ePcWCVSUVwxv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="251621705"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="251621705"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 11:33:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="640678340"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga002.fm.intel.com with SMTP; 04 Mar 2022 11:33:40 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Mar 2022 21:33:39 +0200
Date: Fri, 4 Mar 2022 21:33:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 7/8] drm/i915: fixup the initial fb base on DG1
Message-ID: <YiJpkwFRUHIAoh0F@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
 <20220304172333.991778-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220304172333.991778-8-matthew.auld@intel.com>
X-Patchwork-Hint: comment
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 04, 2022 at 05:23:32PM +0000, Matthew Auld wrote:
> The offset we get looks to be the exact start of DSM, but the
> inital_plane_vma expects the address to be relative.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  .../drm/i915/display/intel_plane_initial.c    | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> index f797fcef18fc..b39d3a8dfe45 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> @@ -56,10 +56,24 @@ initial_plane_vma(struct drm_i915_private *i915,
>  	if (!mem || plane_config->size == 0)
>  		return NULL;
>  
> -	base = round_down(plane_config->base,
> -			  I915_GTT_MIN_ALIGNMENT);
> -	size = round_up(plane_config->base + plane_config->size,
> -			mem->min_page_size);
> +	base = plane_config->base;
> +	if (IS_DGFX(i915)) {
> +		/*
> +		 * On discrete the base address should be somewhere in LMEM, but
> +		 * depending on the size of LMEM the base address might
> +		 * intersect with the start of DSM, like on DG1, in which case
> +		 * we need the relative address. In such cases we might also
> +		 * need to choose between inital fb vs fbc, if space is limited.
> +		 *
> +		 * On future discrete HW, like DG2, we should be able to just
> +		 * allocate directly from LMEM, due to larger LMEM size.
> +		 */
> +		if (base >= i915->dsm.start)
> +			base -= i915->dsm.start;

Subsequent code expects the object to actually be inside stolen.
If that is not the case we should just give up.

The fact that we fail to confirm any of that on integrated
parts has always bugged me, but not enough to actually do
anything about it. Such a check would be somewhat more involved
since we'd have to look at the PTEs. But on discrete sounds like
we can get away with a trivial check.

> +	}
> +
> +	size = roundup(base + plane_config->size, mem->min_page_size);
> +	base = round_down(base, I915_GTT_MIN_ALIGNMENT);
>  	size -= base;
>  
>  	/*
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
