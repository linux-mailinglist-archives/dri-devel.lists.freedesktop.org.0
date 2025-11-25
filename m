Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D30C86708
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 19:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032AA10E408;
	Tue, 25 Nov 2025 18:06:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ih7RWBER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F1410E408;
 Tue, 25 Nov 2025 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764093998; x=1795629998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e6gOZivKWucoCj4SX5VPtfDdPYEAoM9J/B4ywwRF/fs=;
 b=ih7RWBER3O85DSXQ1KiQE0SACvyEdAP2V7ZbvmTqcctTJLWa6BzqrAYU
 zNkMFoiG7z/cHxNtqCpUFd9eisjEl2gVV0F6aLFb/0PrQmQ6c3/XvDDoq
 V/bcdj3ogMMwaQ6YfEGe5zM4XBte99tjEFy1T80TKUQ3ACzTTsH0I/nA2
 uHvub/ZhHnvBYTJGVXxHB0K7yZ4CC1RsHCsRJFA+TgsbKQeqh9vil1cvh
 NRrAlGS8l0GGd5xR3C80Rr/KphJWApTRt0ws7eojwDj+JxSrI6FwrakZ8
 cltIFmvwccm5be1NvPv6mLCnz5LhX6K6YLJwMwz8vf0PXfrJZ5zL1+8y0 Q==;
X-CSE-ConnectionGUID: MPGM5fQhT1WqhzgO63k71A==
X-CSE-MsgGUID: Xnx3mZK1QFa9EDQEWihEcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69982997"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="69982997"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:06:38 -0800
X-CSE-ConnectionGUID: 0IAr0RdlSAeCXu18E32uLQ==
X-CSE-MsgGUID: VwRigk5CS0SKMoPFEeXEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="223672756"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.217])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:06:34 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: stable@vger.kernel.org, =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Date: Tue, 25 Nov 2025 19:06:32 +0100
Message-ID: <4423188.Fh7cpCN91P@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Re-sending because of my response unintentionally HTML formatted, with correct 
email address of Tvrtko by the way.


Hi Krzysztof,

On Tuesday, 25 November 2025 14:33:38 CET Krzysztof Niemiec wrote:
> Initialize eb->vma[].vma pointers to NULL when the eb structure is first
> set up.
> 
> During the execution of eb_lookup_vmas(), the eb->vma array is
> successively filled up with struct eb_vma objects. This process includes
> calling eb_add_vma(), which might fail; however, even in the event of
> failure, eb->vma[i].vma is set for the currently processed buffer.
> 
> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> prompts a call to eb_release_vmas() to clean up the mess. Since
> eb_lookup_vmas() might fail during processing any (possibly not first)
> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> at what point did the lookup function fail.
> 
> In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
> function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
> set to NULL in case i915_gem_object_userptr_submit_init() fails; the
> current one needs to be cleaned up by eb_release_vmas() at this point,
> so the next one is set. If eb_add_vma() fails, neither the current nor
> the next vma is nullified, which is a source of a NULL deref bug
> described in [1].
> 
> When entering eb_lookup_vmas(), the vma pointers are set to the slab
> poison value, instead of NULL. 


Your commit description still doesn't answer my question why the whole memory 
area allocated to the table of VMAs is not initialized to 0 on allocation, 
only left populated with poison values.

Thanks,
Janusz

> This doesn't matter for the actual
> lookup, since it gets overwritten anyway, however the eb_release_vmas()
> function only recognizes NULL as the stopping value, hence the pointers
> are being nullified as they go in case of intermediate failure. This
> patch changes the approach to filling them all with NULL at the start
> instead, rather than handling that manually during failure.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Reported-by: Gangmin Kim <km.kim1503@gmail.com>
> Cc: <stable@vger.kernel.org> # 5.16.x
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 27 ++++++-------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b057c2fa03a4..02120203af55 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -951,13 +951,13 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  		vma = eb_lookup_vma(eb, eb->exec[i].handle);
>  		if (IS_ERR(vma)) {
>  			err = PTR_ERR(vma);
> -			goto err;
> +			return err;
>  		}
>  
>  		err = eb_validate_vma(eb, &eb->exec[i], vma);
>  		if (unlikely(err)) {
>  			i915_vma_put(vma);
> -			goto err;
> +			return err;
>  		}
>  
>  		err = eb_add_vma(eb, &current_batch, i, vma);
> @@ -966,19 +966,8 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  
>  		if (i915_gem_object_is_userptr(vma->obj)) {
>  			err = i915_gem_object_userptr_submit_init(vma->obj);
> -			if (err) {
> -				if (i + 1 < eb->buffer_count) {
> -					/*
> -					 * Execbuffer code expects last vma entry to be NULL,
> -					 * since we already initialized this entry,
> -					 * set the next value to NULL or we mess up
> -					 * cleanup handling.
> -					 */
> -					eb->vma[i + 1].vma = NULL;
> -				}
> -
> +			if (err)
>  				return err;
> -			}
>  
>  			eb->vma[i].flags |= __EXEC_OBJECT_USERPTR_INIT;
>  			eb->args->flags |= __EXEC_USERPTR_USED;
> @@ -986,10 +975,6 @@ static int eb_lookup_vmas(struct i915_execbuffer *eb)
>  	}
>  
>  	return 0;
> -
> -err:
> -	eb->vma[i].vma = NULL;
> -	return err;
>  }
>  
>  static int eb_lock_vmas(struct i915_execbuffer *eb)
> @@ -3362,6 +3347,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  	struct sync_file *out_fence = NULL;
>  	int out_fence_fd = -1;
>  	int err;
> +	int i;
>  
>  	BUILD_BUG_ON(__EXEC_INTERNAL_FLAGS & ~__I915_EXEC_ILLEGAL_FLAGS);
>  	BUILD_BUG_ON(__EXEC_OBJECT_INTERNAL_FLAGS &
> @@ -3375,7 +3361,10 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>  
>  	eb.exec = exec;
>  	eb.vma = (struct eb_vma *)(exec + args->buffer_count + 1);
> -	eb.vma[0].vma = NULL;
> +
> +	for (i = 0; i < args->buffer_count; i++)
> +		eb.vma[i].vma = NULL;
> +
>  	eb.batch_pool = NULL;
>  
>  	eb.invalid_flags = __EXEC_OBJECT_UNKNOWN_FLAGS;
> 




