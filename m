Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E563FEFBD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 16:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FD06E59D;
	Thu,  2 Sep 2021 14:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BC96E598;
 Thu,  2 Sep 2021 14:54:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="218847652"
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="218847652"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 07:54:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,262,1624345200"; d="scan'208";a="461695549"
Received: from rlsmith2-mobl1.amr.corp.intel.com (HELO [10.213.229.210])
 ([10.213.229.210])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 07:54:37 -0700
Subject: Re: [Intel-gfx] [PATCH 07/11] drm/i915: Add
 i915_gem_context_is_full_ppgtt
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210902142057.929669-1-daniel.vetter@ffwll.ch>
 <20210902142057.929669-7-daniel.vetter@ffwll.ch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1cb4b910-ad02-ff02-46ef-7b3b4f393eb3@linux.intel.com>
Date: Thu, 2 Sep 2021 15:54:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210902142057.929669-7-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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


On 02/09/2021 15:20, Daniel Vetter wrote:
> And use it anywhere we have open-coded checks for ctx->vm that really
> only check for full ppgtt.
> 
> Plus for paranoia add a GEM_BUG_ON that checks it's really only set
> when we have full ppgtt, just in case. gem_context->vm is different
> since it's NULL in ggtt mode, unlike intel_context->vm or gt->vm,
> which is always set.
> 
> v2: 0day found a testcase that I missed.
> 
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c           | 2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_context.h           | 7 +++++++
>   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c        | 2 +-
>   drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 6 +++---
>   4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 7a566fb7cca4..1eec85944c1f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -1566,7 +1566,7 @@ static int get_ppgtt(struct drm_i915_file_private *file_priv,
>   	int err;
>   	u32 id;
>   
> -	if (!rcu_access_pointer(ctx->vm))
> +	if (!i915_gem_context_is_full_ppgtt(ctx))

It reads a bit wrong because GEM context cannot *be* full ppggt. It can 
be associated with a VM which is or isn't full ppgtt. So a test on a VM 
retrieved from a context is semnntically more correct. Perhaps you want 
to consider adding a helper to that effect instead? It could mean 
splitting into two helpers (getter + test) or maybe just renaming would 
work. Like i915_gem_context_has_full_ppgtt_vm(ctx)?

Regards,

Tvrtko

>   		return -ENODEV;
>   
>   	rcu_read_lock();
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> index da6e8b506d96..37536a260e6e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
> @@ -154,6 +154,13 @@ i915_gem_context_vm(struct i915_gem_context *ctx)
>   	return rcu_dereference_protected(ctx->vm, lockdep_is_held(&ctx->mutex));
>   }
>   
> +static inline bool i915_gem_context_is_full_ppgtt(struct i915_gem_context *ctx)
> +{
> +	GEM_BUG_ON(!!rcu_access_pointer(ctx->vm) != HAS_FULL_PPGTT(ctx->i915));
> +
> +	return !!rcu_access_pointer(ctx->vm);
> +}
> +
>   static inline struct i915_address_space *
>   i915_gem_context_get_eb_vm(struct i915_gem_context *ctx)
>   {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 905b1cbd22d5..40f08948f0b2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -749,7 +749,7 @@ static int eb_select_context(struct i915_execbuffer *eb)
>   		return PTR_ERR(ctx);
>   
>   	eb->gem_context = ctx;
> -	if (rcu_access_pointer(ctx->vm))
> +	if (i915_gem_context_is_full_ppgtt(ctx))
>   		eb->invalid_flags |= EXEC_OBJECT_NEEDS_GTT;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index fc7fb33a3a52..947154e445a7 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -704,7 +704,7 @@ static int igt_ctx_exec(void *arg)
>   				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
>   				       ndwords, dw, max_dwords(obj),
>   				       engine->name,
> -				       yesno(!!rcu_access_pointer(ctx->vm)),
> +				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
>   				       err);
>   				intel_context_put(ce);
>   				kernel_context_close(ctx);
> @@ -838,7 +838,7 @@ static int igt_shared_ctx_exec(void *arg)
>   				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
>   				       ndwords, dw, max_dwords(obj),
>   				       engine->name,
> -				       yesno(!!rcu_access_pointer(ctx->vm)),
> +				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
>   				       err);
>   				intel_context_put(ce);
>   				kernel_context_close(ctx);
> @@ -1417,7 +1417,7 @@ static int igt_ctx_readonly(void *arg)
>   				pr_err("Failed to fill dword %lu [%lu/%lu] with gpu (%s) [full-ppgtt? %s], err=%d\n",
>   				       ndwords, dw, max_dwords(obj),
>   				       ce->engine->name,
> -				       yesno(!!ctx_vm(ctx)),
> +				       yesno(i915_gem_context_is_full_ppgtt(ctx)),
>   				       err);
>   				i915_gem_context_unlock_engines(ctx);
>   				goto out_file;
> 
