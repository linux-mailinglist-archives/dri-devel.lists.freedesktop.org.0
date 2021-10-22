Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BDD4379F2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 17:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4256ED99;
	Fri, 22 Oct 2021 15:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FB56EA40;
 Fri, 22 Oct 2021 15:31:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="292785644"
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="292785644"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 08:30:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,173,1631602800"; d="scan'208";a="495721735"
Received: from pbabu-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.213.192])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 08:30:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 19/30] drm/i915: Add an i915_gem_vm_lookup helper
In-Reply-To: <20210708154835.528166-20-jason@jlekstrand.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210708154835.528166-1-jason@jlekstrand.net>
 <20210708154835.528166-20-jason@jlekstrand.net>
Date: Fri, 22 Oct 2021 18:30:53 +0300
Message-ID: <87ilxpkrf6.fsf@intel.com>
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

On Thu, 08 Jul 2021, Jason Ekstrand <jason@jlekstrand.net> wrote:
> This is the VM equivalent of i915_gem_context_lookup.  It's only used
> once in this patch but future patches will need to duplicate this lookup
> code so it's better to have it in a helper.
>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm looking at i915_drv.h.... and really, i915_drv.h is not your dumping
ground. None of this belongs in i915_drv.h.

BR,
Jani.


> ---
>  drivers/gpu/drm/i915/gem/i915_gem_context.c |  6 +-----
>  drivers/gpu/drm/i915/i915_drv.h             | 14 ++++++++++++++
>  2 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 206721dccd24e..3c59d1e4080c4 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1311,11 +1311,7 @@ static int set_ppgtt(struct drm_i915_file_private *file_priv,
>  	if (upper_32_bits(args->value))
>  		return -ENOENT;
>  
> -	rcu_read_lock();
> -	vm = xa_load(&file_priv->vm_xa, args->value);
> -	if (vm && !kref_get_unless_zero(&vm->ref))
> -		vm = NULL;
> -	rcu_read_unlock();
> +	vm = i915_gem_vm_lookup(file_priv, args->value);
>  	if (!vm)
>  		return -ENOENT;
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index ae45ea7b26997..8c1994c16b920 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1867,6 +1867,20 @@ i915_gem_context_lookup(struct drm_i915_file_private *file_priv, u32 id)
>  	return ctx;
>  }
>  
> +static inline struct i915_address_space *
> +i915_gem_vm_lookup(struct drm_i915_file_private *file_priv, u32 id)
> +{
> +	struct i915_address_space *vm;
> +
> +	rcu_read_lock();
> +	vm = xa_load(&file_priv->vm_xa, id);
> +	if (vm && !kref_get_unless_zero(&vm->ref))
> +		vm = NULL;
> +	rcu_read_unlock();
> +
> +	return vm;
> +}
> +
>  /* i915_gem_evict.c */
>  int __must_check i915_gem_evict_something(struct i915_address_space *vm,
>  					  u64 min_size, u64 alignment,

-- 
Jani Nikula, Intel Open Source Graphics Center
