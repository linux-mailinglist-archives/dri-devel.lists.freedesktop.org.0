Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AAC14B533
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 14:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 812196EE33;
	Tue, 28 Jan 2020 13:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504736E061;
 Tue, 28 Jan 2020 13:38:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 05:38:40 -0800
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="217614514"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 05:38:38 -0800
Date: Tue, 28 Jan 2020 15:38:28 +0200
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Eric Engestrom <eric@engestrom.ch>,
 Emil Velikov <emil.velikov@collabora.com>,
 Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>
Subject: Re: [Intel-gfx] [PATCH libdrm v2] intel:
 drm_intel_bo_gem_create_from_* on platforms w/o HW tiling
Message-ID: <20200128133828.GA14403@ideak-desk.fi.intel.com>
References: <20200120164343.2262-1-imre.deak@intel.com>
 <20200122093122.15476-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122093122.15476-1-imre.deak@intel.com>
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
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 11:31:22AM +0200, Imre Deak wrote:
> Platforms without a HW detiler doesn't support the get_tiling IOCTL.
> Fix the drm_intel_bo_gem_create_from_* functions assuming the default
> no-tiling, no-swizzling setting for the GEM buffer in this case.
> 
> v2:
> - Add the missing gem handle IOCTL parameter. (Eric)
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> Reviewed-by: Eric Engestrom <eric@engestrom.ch>

Thanks for the reviewes, pushed to
gitlab.freedesktop.org:mesa/drm.git master

> ---
>  intel/intel_bufmgr_gem.c | 43 +++++++++++++++++++++++++---------------
>  1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/intel/intel_bufmgr_gem.c b/intel/intel_bufmgr_gem.c
> index fbf48730..ade13a4c 100644
> --- a/intel/intel_bufmgr_gem.c
> +++ b/intel/intel_bufmgr_gem.c
> @@ -1069,6 +1069,28 @@ check_bo_alloc_userptr(drm_intel_bufmgr *bufmgr,
>  					  tiling_mode, stride, size, flags);
>  }
>  
> +static int get_tiling_mode(drm_intel_bufmgr_gem *bufmgr_gem,
> +			   uint32_t gem_handle,
> +			   uint32_t *tiling_mode,
> +			   uint32_t *swizzle_mode)
> +{
> +	struct drm_i915_gem_get_tiling get_tiling = {
> +		.handle = gem_handle,
> +	};
> +	int ret;
> +
> +	ret = drmIoctl(bufmgr_gem->fd,
> +		       DRM_IOCTL_I915_GEM_GET_TILING,
> +		       &get_tiling);
> +	if (ret != 0 && errno != EOPNOTSUPP)
> +		return ret;
> +
> +	*tiling_mode = get_tiling.tiling_mode;
> +	*swizzle_mode = get_tiling.swizzle_mode;
> +
> +	return 0;
> +}
> +
>  /**
>   * Returns a drm_intel_bo wrapping the given buffer object handle.
>   *
> @@ -1084,7 +1106,6 @@ drm_intel_bo_gem_create_from_name(drm_intel_bufmgr *bufmgr,
>  	drm_intel_bo_gem *bo_gem;
>  	int ret;
>  	struct drm_gem_open open_arg;
> -	struct drm_i915_gem_get_tiling get_tiling;
>  
>  	/* At the moment most applications only have a few named bo.
>  	 * For instance, in a DRI client only the render buffers passed
> @@ -1146,16 +1167,11 @@ drm_intel_bo_gem_create_from_name(drm_intel_bufmgr *bufmgr,
>  	HASH_ADD(name_hh, bufmgr_gem->name_table,
>  		 global_name, sizeof(bo_gem->global_name), bo_gem);
>  
> -	memclear(get_tiling);
> -	get_tiling.handle = bo_gem->gem_handle;
> -	ret = drmIoctl(bufmgr_gem->fd,
> -		       DRM_IOCTL_I915_GEM_GET_TILING,
> -		       &get_tiling);
> +	ret = get_tiling_mode(bufmgr_gem, bo_gem->gem_handle,
> +			      &bo_gem->tiling_mode, &bo_gem->swizzle_mode);
>  	if (ret != 0)
>  		goto err_unref;
>  
> -	bo_gem->tiling_mode = get_tiling.tiling_mode;
> -	bo_gem->swizzle_mode = get_tiling.swizzle_mode;
>  	/* XXX stride is unknown */
>  	drm_intel_bo_gem_set_in_aperture_size(bufmgr_gem, bo_gem, 0);
>  	DBG("bo_create_from_handle: %d (%s)\n", handle, bo_gem->name);
> @@ -2634,7 +2650,6 @@ drm_intel_bo_gem_create_from_prime(drm_intel_bufmgr *bufmgr, int prime_fd, int s
>  	int ret;
>  	uint32_t handle;
>  	drm_intel_bo_gem *bo_gem;
> -	struct drm_i915_gem_get_tiling get_tiling;
>  
>  	pthread_mutex_lock(&bufmgr_gem->lock);
>  	ret = drmPrimeFDToHandle(bufmgr_gem->fd, prime_fd, &handle);
> @@ -2688,15 +2703,11 @@ drm_intel_bo_gem_create_from_prime(drm_intel_bufmgr *bufmgr, int prime_fd, int s
>  	bo_gem->has_error = false;
>  	bo_gem->reusable = false;
>  
> -	memclear(get_tiling);
> -	get_tiling.handle = bo_gem->gem_handle;
> -	if (drmIoctl(bufmgr_gem->fd,
> -		     DRM_IOCTL_I915_GEM_GET_TILING,
> -		     &get_tiling))
> +	ret = get_tiling_mode(bufmgr_gem, handle,
> +			      &bo_gem->tiling_mode, &bo_gem->swizzle_mode);
> +	if (ret)
>  		goto err;
>  
> -	bo_gem->tiling_mode = get_tiling.tiling_mode;
> -	bo_gem->swizzle_mode = get_tiling.swizzle_mode;
>  	/* XXX stride is unknown */
>  	drm_intel_bo_gem_set_in_aperture_size(bufmgr_gem, bo_gem, 0);
>  
> -- 
> 2.23.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
