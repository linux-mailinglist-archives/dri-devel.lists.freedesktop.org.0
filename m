Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7975B5A55
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 14:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0529B10E458;
	Mon, 12 Sep 2022 12:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FF310E455;
 Mon, 12 Sep 2022 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662986607; x=1694522607;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zBQkrbU/WKYww0ndIPxRIqTJdUr+reMWsL9rMale6sc=;
 b=jKHIRXv+439P6xiG0kOrQUclKZSt7RbqWygEsUJKHti5kJqRcc9zIMXR
 xBRmgEdlvyvPiIWaKSrYQMnVmu80G/xpxp//5RZf8SaEkBLW+49JWoMsO
 ksdXw16c8u67w3OqT1jemlwRMX+zUsSKLQzp0MUxogEqUeac2J/gvER/V
 YM7yhnqxQK/RspILfMHTLmO7zAwJ/55xRVh1xjoUKSKFYYhCZSjRFjmlU
 S4EUZWablBDEIalMh94kWMLa/F8mU3VGEm0oGLQdszHP9OjhGV47UYrdZ
 UZ/gr/OQIJct+rk6SdRnmaLomPGG1pB3r1LNaZ1IPqWZl8ZMGNGcZGOEg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="280872091"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="280872091"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 05:43:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="646442687"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga008.jf.intel.com with SMTP; 12 Sep 2022 05:43:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 15:43:23 +0300
Date: Mon, 12 Sep 2022 15:43:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix display problems after resume
Message-ID: <Yx8pa+cZ6BIdCZA5@intel.com>
References: <20220912121957.31310-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220912121957.31310-1-thomas.hellstrom@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 12, 2022 at 02:19:57PM +0200, Thomas Hellström wrote:
> Commit 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt
> binding / unbinding") introduced a regression that due to the vma resource
> tracking of the binding state, dpt ptes were not correctly repopulated.

Doesn't this mean all ggtt ptes weren't repopulated? So I'm
wondering how anything at all has been working?

> Fix this by clearing the vma resource state before repopulating.
> The state will subsequently be restored by the bind_vma operation.
> 
> Fixes: 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt binding / unbinding")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index 30cf5c3369d9..2049a00417af 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -1275,10 +1275,16 @@ bool i915_ggtt_resume_vm(struct i915_address_space *vm)
>  			atomic_read(&vma->flags) & I915_VMA_BIND_MASK;
>  
>  		GEM_BUG_ON(!was_bound);
> -		if (!retained_ptes)
> +		if (!retained_ptes) {
> +			/*
> +			 * Clear the bound flags of the vma resource to allow
> +			 * ptes to be repopulated.
> +			 */
> +			vma->resource->bound_flags = 0;
>  			vma->ops->bind_vma(vm, NULL, vma->resource,
>  					   obj ? obj->cache_level : 0,
>  					   was_bound);
> +		}
>  		if (obj) { /* only used during resume => exclusive access */
>  			write_domain_objs |= fetch_and_zero(&obj->write_domain);
>  			obj->read_domains |= I915_GEM_DOMAIN_GTT;
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
