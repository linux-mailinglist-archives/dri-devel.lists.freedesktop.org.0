Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC2C433584
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2DD06EBA1;
	Tue, 19 Oct 2021 12:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7E56EBA0;
 Tue, 19 Oct 2021 12:11:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="289341254"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="289341254"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 05:11:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="494067173"
Received: from jsanz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.211.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 05:10:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/locking: fix __stack_depot_* name conflict
In-Reply-To: <20211018085113.27033-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211018085113.27033-1-jani.nikula@intel.com>
Date: Tue, 19 Oct 2021 15:10:55 +0300
Message-ID: <878rypqkog.fsf@intel.com>
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

On Mon, 18 Oct 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> From: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Commit cd06ab2fd48f ("drm/locking: add backtrace for locking contended
> locks without backoff") added functions named __stack_depot_* in drm
> which conflict with stack depot. Rename to __drm_stack_depot_*.
>
> v2 by Jani:
> - Also rename __stack_depot_print
>
> References: https://lore.kernel.org/r/20211015202648.258445ef@canb.auug.org.au
> Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contended locks without backoff")
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-misc-next with Daniel's IRC r-b. Thanks for the original
patch and review.

BR,
Jani.

> ---
>  drivers/gpu/drm/drm_modeset_lock.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
> index 4d32b61fa1fd..c97323365675 100644
> --- a/drivers/gpu/drm/drm_modeset_lock.c
> +++ b/drivers/gpu/drm/drm_modeset_lock.c
> @@ -79,7 +79,7 @@
>  static DEFINE_WW_CLASS(crtc_ww_class);
>  
>  #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
> -static noinline depot_stack_handle_t __stack_depot_save(void)
> +static noinline depot_stack_handle_t __drm_stack_depot_save(void)
>  {
>  	unsigned long entries[8];
>  	unsigned int n;
> @@ -89,7 +89,7 @@ static noinline depot_stack_handle_t __stack_depot_save(void)
>  	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
>  }
>  
> -static void __stack_depot_print(depot_stack_handle_t stack_depot)
> +static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
>  {
>  	struct drm_printer p = drm_debug_printer("drm_modeset_lock");
>  	unsigned long *entries;
> @@ -108,11 +108,11 @@ static void __stack_depot_print(depot_stack_handle_t stack_depot)
>  	kfree(buf);
>  }
>  #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
> -static depot_stack_handle_t __stack_depot_save(void)
> +static depot_stack_handle_t __drm_stack_depot_save(void)
>  {
>  	return 0;
>  }
> -static void __stack_depot_print(depot_stack_handle_t stack_depot)
> +static void __drm_stack_depot_print(depot_stack_handle_t stack_depot)
>  {
>  }
>  #endif /* CONFIG_DRM_DEBUG_MODESET_LOCK */
> @@ -266,7 +266,7 @@ EXPORT_SYMBOL(drm_modeset_acquire_fini);
>  void drm_modeset_drop_locks(struct drm_modeset_acquire_ctx *ctx)
>  {
>  	if (WARN_ON(ctx->contended))
> -		__stack_depot_print(ctx->stack_depot);
> +		__drm_stack_depot_print(ctx->stack_depot);
>  
>  	while (!list_empty(&ctx->locked)) {
>  		struct drm_modeset_lock *lock;
> @@ -286,7 +286,7 @@ static inline int modeset_lock(struct drm_modeset_lock *lock,
>  	int ret;
>  
>  	if (WARN_ON(ctx->contended))
> -		__stack_depot_print(ctx->stack_depot);
> +		__drm_stack_depot_print(ctx->stack_depot);
>  
>  	if (ctx->trylock_only) {
>  		lockdep_assert_held(&ctx->ww_ctx);
> @@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modeset_lock *lock,
>  		ret = 0;
>  	} else if (ret == -EDEADLK) {
>  		ctx->contended = lock;
> -		ctx->stack_depot = __stack_depot_save();
> +		ctx->stack_depot = __drm_stack_depot_save();
>  	}
>  
>  	return ret;

-- 
Jani Nikula, Intel Open Source Graphics Center
