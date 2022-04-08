Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5D74F91F7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0100810E159;
	Fri,  8 Apr 2022 09:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A6510E119;
 Fri,  8 Apr 2022 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649409811; x=1680945811;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5rDcw5X+IfQLSzKEZfNzAlgVsA7V0hrrfTGtgrFXGHI=;
 b=fjV26o3dVIODhuro2bXPGXNmbxulYs4NBDOw/wID3B4UT5l5ngx6fTdM
 lzaa742ayg+mM4dUOS6GyXQEJhXDIIgClx4tq1x1eJ6VA2FWI+uhBDxJj
 sIPnm8zakGrrEzio4WKhZ6NdCYBVHdMURQPTZqAm+Z5E9pGW0m6o3s9dD
 MjTZaWLEdwpJyEBYMYmxBnGO+k6+ulmLZodqk/13f0Sbti32V0VN93HdS
 8FAy25hEd9kdJffTguZuYdD2dl80mktWBWklRRL4AA7xv/o7CRkt5Nzoh
 ODfs06xL5vUscMWByRc3TZicOMEjcz6Bw0/IJAHbwZxhWFmi4DGPfS41J w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="286541660"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="286541660"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:23:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="525309295"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.90])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 02:23:29 -0700
Received: from platvala by thrakatuluk with local (Exim 4.94.2)
 (envelope-from <petri.latvala@intel.com>)
 id 1nckpr-0007Zo-GZ; Fri, 08 Apr 2022 12:23:19 +0300
Date: Fri, 8 Apr 2022 12:23:19 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915: fix
 i915_gem_object_wait_moving_fence
Message-ID: <Yk//B5SgSinx743I@platvala-desk.ger.corp.intel.com>
References: <20220408084205.1353427-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220408084205.1353427-1-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 08, 2022 at 09:42:05AM +0100, Matthew Auld wrote:
> All of CI is just failing with the following, which prevents loading of
> the module:
> 
>     i915 0000:03:00.0: [drm] *ERROR* Scratch setup failed
> 
> Best guess is that this comes from the pin_map() for the scratch page,
> which does an i915_gem_object_wait_moving_fence() somewhere. It looks
> like this now calls into dma_resv_wait_timeout() which can return the
> remaining timeout, leading to the caller thinking this is an error.
> 
> v2(Lucas): handle ret == 0
> 
> Fixes: 1d7f5e6c5240 ("drm/i915: drop bo->moving dependency")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Christian König <christian.koenig@amd.com> #v1


For the record, patchwork is disabled at this time. Trybot is still up
if you want CI to verify this.



-- 
Petri Latvala


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_object.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 2998d895a6b3..747ac65e060f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -772,9 +772,16 @@ int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>  int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>  				      bool intr)
>  {
> +	long ret;
> +
>  	assert_object_held(obj);
> -	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> -				     intr, MAX_SCHEDULE_TIMEOUT);
> +
> +	ret = dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
> +				    intr, MAX_SCHEDULE_TIMEOUT);
> +	if (!ret)
> +		ret = -ETIME;
> +
> +	return ret < 0 ? ret : 0;
>  }
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> -- 
> 2.34.1
> 
