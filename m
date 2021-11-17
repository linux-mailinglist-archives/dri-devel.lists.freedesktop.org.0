Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1116D454D69
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 19:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B909D6E7DA;
	Wed, 17 Nov 2021 18:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EAC6E7DA;
 Wed, 17 Nov 2021 18:49:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="320246545"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="320246545"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:49:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="646128551"
Received: from rstock-mobl.ger.corp.intel.com (HELO [10.249.254.164])
 ([10.249.254.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 10:49:46 -0800
Message-ID: <9ea7ae8e-c9c4-8b1e-2057-5be69eb35555@linux.intel.com>
Date: Wed, 17 Nov 2021 19:49:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/6] drm/i915: move the pre_pin earlier
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211117142024.1043017-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211117142024.1043017-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/17/21 15:20, Matthew Auld wrote:
> In intel_context_do_pin_ww, when calling into the pre_pin hook(which is
> passed the ww context) it could in theory return -EDEADLK(which is very
> likely with debug kernels), once we start adding more ww locking in there,
> like in the next patch. If so then we need to be mindful of having to
> restart the do_pin at this point.
>
> If this is the kernel_context, or some other early in-kernel context
> where we have yet to setup the default_state, then we always inhibit the
> context restore, and instead rely on the delayed active_release to set
> the CONTEXT_VALID_BIT for us(if we even care), which should indicate
> that we have context switched away, and that our newly saved context
> state should now be valid. However, since we currently grab the active
> reference before the potential ww dance, we can end up setting the
> CONTEXT_VALID_BIT much too early, if we need to backoff, and then upon
> re-trying the do_pin, we could potentially cause the hardware to
> incorrectly load some garbage context state when later context switching
> to that context, but at the very least this will trigger the
> GEM_BUG_ON() in __engine_unpark. For now let's just move any ww dance
> stuff prior to arming the active reference.
>
> For normal user contexts this shouldn't be a concern, since we should
> already have the default_state ready when initialising the lrc state,
> and so there should be no concern with active_release somehow
> prematurely setting the CONTEXT_VALID_BIT.
>
> v2(Thomas):
>    - Also re-order the union unwind
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gt/intel_context.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 5634d14052bc..4c296de1d67d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -228,17 +228,17 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>   	if (err)
>   		return err;
>   
> -	err = i915_active_acquire(&ce->active);
> +	err = ce->ops->pre_pin(ce, ww, &vaddr);
>   	if (err)
>   		goto err_ctx_unpin;
>   
> -	err = ce->ops->pre_pin(ce, ww, &vaddr);
> +	err = i915_active_acquire(&ce->active);
>   	if (err)
> -		goto err_release;
> +		goto err_post_unpin;
>   
>   	err = mutex_lock_interruptible(&ce->pin_mutex);
>   	if (err)
> -		goto err_post_unpin;
> +		goto err_release;
>   
>   	intel_engine_pm_might_get(ce->engine);
>   
> @@ -273,11 +273,11 @@ int __intel_context_do_pin_ww(struct intel_context *ce,
>   
>   err_unlock:
>   	mutex_unlock(&ce->pin_mutex);
> +err_release:
> +	i915_active_release(&ce->active);
>   err_post_unpin:
>   	if (!handoff)
>   		ce->ops->post_unpin(ce);
> -err_release:
> -	i915_active_release(&ce->active);
>   err_ctx_unpin:
>   	intel_context_post_unpin(ce);
>   
