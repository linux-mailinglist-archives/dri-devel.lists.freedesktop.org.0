Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA43FC4C2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 11:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8B589A92;
	Tue, 31 Aug 2021 09:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9223989A08;
 Tue, 31 Aug 2021 09:38:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="240690631"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="240690631"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 02:38:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="531027886"
Received: from wenqitan-mobl1.ger.corp.intel.com (HELO [10.252.59.180])
 ([10.252.59.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 02:38:10 -0700
Subject: Re: [PATCH] drm/i915: Release i915_gem_context from a worker
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
References: <20210813203033.3179400-1-daniel.vetter@ffwll.ch>
 <20210814104319.3226156-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <b872283f-5d31-0a6e-7b02-83c665ec6981@linux.intel.com>
Date: Tue, 31 Aug 2021 11:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210814104319.3226156-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Op 14-08-2021 om 12:43 schreef Daniel Vetter:
> The only reason for this really is the i915_gem_engines->fence
> callback engines_notify(), which exists purely as a fairly funky
> reference counting scheme for that. Otherwise all other callers are
> from process context, and generally fairly benign locking context.
>
> Unfortunately untangling that requires some major surgery, and we have
> a few i915_gem_context reference counting bugs that need fixing, and
> they blow in the current hardirq calling context, so we need a
> stop-gap measure.
>
> Put a FIXME comment in when this should be removable again.
>
> v2: Fix mock_context(), noticed by intel-gfx-ci.
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
>  drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 +++++++++++--
>  drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 12 ++++++++++++
>  drivers/gpu/drm/i915/gem/selftests/mock_context.c |  1 +
>  3 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index fd169cf2f75a..051bc357ff65 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -986,9 +986,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>  	return err;
>  }
>  
> -void i915_gem_context_release(struct kref *ref)
> +static void i915_gem_context_release_work(struct work_struct *work)
>  {
> -	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
> +	struct i915_gem_context *ctx = container_of(work, typeof(*ctx),
> +						    release_work);
>  
>  	trace_i915_context_free(ctx);
>  	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
> @@ -1002,6 +1003,13 @@ void i915_gem_context_release(struct kref *ref)
>  	kfree_rcu(ctx, rcu);
>  }
>  
> +void i915_gem_context_release(struct kref *ref)
> +{
> +	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
> +
> +	queue_work(ctx->i915->wq, &ctx->release_work);
> +}
> +
>  static inline struct i915_gem_engines *
>  __context_engines_static(const struct i915_gem_context *ctx)
>  {
> @@ -1303,6 +1311,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
>  	ctx->sched = pc->sched;
>  	mutex_init(&ctx->mutex);
>  	INIT_LIST_HEAD(&ctx->link);
> +	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
>  
>  	spin_lock_init(&ctx->stale.lock);
>  	INIT_LIST_HEAD(&ctx->stale.engines);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> index 94c03a97cb77..0c38789bd4a8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
> @@ -288,6 +288,18 @@ struct i915_gem_context {
>  	 */
>  	struct kref ref;
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
>  	/**
>  	 * @rcu: rcu_head for deferred freeing.
>  	 */
> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> index fee070df1c97..067d68a6fe4c 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
> @@ -23,6 +23,7 @@ mock_context(struct drm_i915_private *i915,
>  	kref_init(&ctx->ref);
>  	INIT_LIST_HEAD(&ctx->link);
>  	ctx->i915 = i915;
> +	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
>  
>  	mutex_init(&ctx->mutex);
>  

----
Is the workqueue really needed? I'm not sure you could still race in drm_syncobj_free when refcount is zero, so in that case removing locking from _release would work as well as a workqueue.

Something like below would keep the drm_sync_obj_put hardirq safe.

I assume when freeing, the  cb list is supposed to be empty, so I added a WARN_ON just to be sure, otherwise we should just tear down the list without locking too.

This should be a better alternative for patch 1.
----8<-------
diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index c9a9d74f338c..9d561decd97e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -462,7 +462,13 @@ void drm_syncobj_free(struct kref *kref)
 	struct drm_syncobj *syncobj = container_of(kref,
 						   struct drm_syncobj,
 						   refcount);
-	drm_syncobj_replace_fence(syncobj, NULL);
+	struct dma_fence *old_fence;
+
+	old_fence = rcu_dereference_protected(syncobj->fence, !kref_read(&syncobj->refcount));
+	dma_fence_put(old_fence);
+
+	WARN_ON(!list_empty(&syncobj->cb_list));
+
 	kfree(syncobj);
 }
 EXPORT_SYMBOL(drm_syncobj_free);


