Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBCE3FEDEA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 14:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E611F6E51C;
	Thu,  2 Sep 2021 12:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4096E51C;
 Thu,  2 Sep 2021 12:42:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="215961113"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="215961113"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 05:42:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="461639444"
Received: from rlsmith2-mobl1.amr.corp.intel.com (HELO [10.213.229.210])
 ([10.213.229.210])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 05:42:52 -0700
Subject: Re: [Intel-gfx] [PATCH 01/11] drm/i915: Release i915_gem_context from
 a worker
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <9d8cba62-e1e1-a62c-1482-89d2db49d5af@linux.intel.com>
Date: Thu, 2 Sep 2021 13:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
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


On 13/08/2021 21:30, Daniel Vetter wrote:
> The only reason for this really is the i915_gem_engines->fence
> callback engines_notify(), which exists purely as a fairly funky
> reference counting scheme for that. Otherwise all other callers are
> from process context, and generally fairly benign locking context.

There is reset which definitely isn't process context.

Otherwise I did not really get from the commit message is this patch 
fixing an existing problem or preparing something for the future. If the 
former then as I wrote above - I am pretty sure there are call sites 
from the tasklet already.

Regards,

Tvrtko

> Unfortunately untangling that requires some major surgery, and we have
> a few i915_gem_context reference counting bugs that need fixing, and
> they blow in the current hardirq calling context, so we need a
> stop-gap measure.
> 
> Put a FIXME comment in when this should be removable again.
> 
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
>   drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 +++++++++++--
>   drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 12 ++++++++++++
>   2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fd169cf2f75a..051bc357ff65 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -986,9 +986,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>   	return err;
>   }
>   
> -void i915_gem_context_release(struct kref *ref)
> +static void i915_gem_context_release_work(struct work_struct *work)
>   {
> -	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
> +	struct i915_gem_context *ctx = container_of(work, typeof(*ctx),
> +						    release_work);
>   
>   	trace_i915_context_free(ctx);
>   	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
> @@ -1002,6 +1003,13 @@ void i915_gem_context_release(struct kref *ref)
>   	kfree_rcu(ctx, rcu);
>   }
>   
> +void i915_gem_context_release(struct kref *ref)
> +{
> +	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
> +
> +	queue_work(ctx->i915->wq, &ctx->release_work);
> +}
> +
>   static inline struct i915_gem_engines *
>   __context_engines_static(const struct i915_gem_context *ctx)
>   {
> @@ -1303,6 +1311,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
>   	ctx->sched = pc->sched;
>   	mutex_init(&ctx->mutex);
>   	INIT_LIST_HEAD(&ctx->link);
> +	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
>   
>   	spin_lock_init(&ctx->stale.lock);
>   	INIT_LIST_HEAD(&ctx->stale.engines);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 94c03a97cb77..0c38789bd4a8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -288,6 +288,18 @@ struct i915_gem_context {
>   	 */
>   	struct kref ref;
>   
> +	/**
> +	 * @release_work:
> +	 *
> +	 * Work item for deferred cleanup, since i915_gem_context_put() tends to
> +	 * be called from hardirq context.
> +	 *
> +	 * FIXME: The only real reason for this is &i915_gem_engines.fence, all
> +	 * other callers are from process context and need at most some mild
> +	 * shuffling to pull the i915_gem_context_put() call out of a spinlock.
> +	 */
> +	struct work_struct release_work;
> +
>   	/**
>   	 * @rcu: rcu_head for deferred freeing.
>   	 */
> 
