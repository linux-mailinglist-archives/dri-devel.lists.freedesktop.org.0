Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEAF3FEBD2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 12:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA82D6E4C4;
	Thu,  2 Sep 2021 10:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932286E4C1;
 Thu,  2 Sep 2021 10:04:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10094"; a="219117518"
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="219117518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 03:04:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,372,1620716400"; d="scan'208";a="499675488"
Received: from amildner-mobl1.ger.corp.intel.com (HELO [10.252.43.18])
 ([10.252.43.18])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 03:04:39 -0700
Subject: Re: [PATCH] drm/i915: Release i915_gem_context from a worker
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
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
 <b872283f-5d31-0a6e-7b02-83c665ec6981@linux.intel.com>
 <YS4duGerKwxk2dh5@phenom.ffwll.local> <YS5HPvXAaynR0KWC@phenom.ffwll.local>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <fba1f499-c448-72c7-a185-75bcf83de4e0@linux.intel.com>
Date: Thu, 2 Sep 2021 12:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS5HPvXAaynR0KWC@phenom.ffwll.local>
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

Op 31-08-2021 om 17:14 schreef Daniel Vetter:
> On Tue, Aug 31, 2021 at 02:16:56PM +0200, Daniel Vetter wrote:
>> On Tue, Aug 31, 2021 at 11:38:27AM +0200, Maarten Lankhorst wrote:
>>> Op 14-08-2021 om 12:43 schreef Daniel Vetter:
>>>> The only reason for this really is the i915_gem_engines->fence
>>>> callback engines_notify(), which exists purely as a fairly funky
>>>> reference counting scheme for that. Otherwise all other callers are
>>>> from process context, and generally fairly benign locking context.
>>>>
>>>> Unfortunately untangling that requires some major surgery, and we have
>>>> a few i915_gem_context reference counting bugs that need fixing, and
>>>> they blow in the current hardirq calling context, so we need a
>>>> stop-gap measure.
>>>>
>>>> Put a FIXME comment in when this should be removable again.
>>>>
>>>> v2: Fix mock_context(), noticed by intel-gfx-ci.
>>>>
>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
>>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>>>> ---
>>>>  drivers/gpu/drm/i915/gem/i915_gem_context.c       | 13 +++++++++++--
>>>>  drivers/gpu/drm/i915/gem/i915_gem_context_types.h | 12 ++++++++++++
>>>>  drivers/gpu/drm/i915/gem/selftests/mock_context.c |  1 +
>>>>  3 files changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> index fd169cf2f75a..051bc357ff65 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>> @@ -986,9 +986,10 @@ static struct i915_gem_engines *user_engines(struct i915_gem_context *ctx,
>>>>  	return err;
>>>>  }
>>>>  
>>>> -void i915_gem_context_release(struct kref *ref)
>>>> +static void i915_gem_context_release_work(struct work_struct *work)
>>>>  {
>>>> -	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
>>>> +	struct i915_gem_context *ctx = container_of(work, typeof(*ctx),
>>>> +						    release_work);
>>>>  
>>>>  	trace_i915_context_free(ctx);
>>>>  	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
>>>> @@ -1002,6 +1003,13 @@ void i915_gem_context_release(struct kref *ref)
>>>>  	kfree_rcu(ctx, rcu);
>>>>  }
>>>>  
>>>> +void i915_gem_context_release(struct kref *ref)
>>>> +{
>>>> +	struct i915_gem_context *ctx = container_of(ref, typeof(*ctx), ref);
>>>> +
>>>> +	queue_work(ctx->i915->wq, &ctx->release_work);
>>>> +}
>>>> +
>>>>  static inline struct i915_gem_engines *
>>>>  __context_engines_static(const struct i915_gem_context *ctx)
>>>>  {
>>>> @@ -1303,6 +1311,7 @@ i915_gem_create_context(struct drm_i915_private *i915,
>>>>  	ctx->sched = pc->sched;
>>>>  	mutex_init(&ctx->mutex);
>>>>  	INIT_LIST_HEAD(&ctx->link);
>>>> +	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
>>>>  
>>>>  	spin_lock_init(&ctx->stale.lock);
>>>>  	INIT_LIST_HEAD(&ctx->stale.engines);
>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> index 94c03a97cb77..0c38789bd4a8 100644
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context_types.h
>>>> @@ -288,6 +288,18 @@ struct i915_gem_context {
>>>>  	 */
>>>>  	struct kref ref;
>>>>  
>>>> +	/**
>>>> +	 * @release_work:
>>>> +	 *
>>>> +	 * Work item for deferred cleanup, since i915_gem_context_put() tends to
>>>> +	 * be called from hardirq context.
>>>> +	 *
>>>> +	 * FIXME: The only real reason for this is &i915_gem_engines.fence, all
>>>> +	 * other callers are from process context and need at most some mild
>>>> +	 * shuffling to pull the i915_gem_context_put() call out of a spinlock.
>>>> +	 */
>>>> +	struct work_struct release_work;
>>>> +
>>>>  	/**
>>>>  	 * @rcu: rcu_head for deferred freeing.
>>>>  	 */
>>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/mock_context.c b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
>>>> index fee070df1c97..067d68a6fe4c 100644
>>>> --- a/drivers/gpu/drm/i915/gem/selftests/mock_context.c
>>>> +++ b/drivers/gpu/drm/i915/gem/selftests/mock_context.c
>>>> @@ -23,6 +23,7 @@ mock_context(struct drm_i915_private *i915,
>>>>  	kref_init(&ctx->ref);
>>>>  	INIT_LIST_HEAD(&ctx->link);
>>>>  	ctx->i915 = i915;
>>>> +	INIT_WORK(&ctx->release_work, i915_gem_context_release_work);
>>>>  
>>>>  	mutex_init(&ctx->mutex);
>>>>  
>>> ----
>>> Is the workqueue really needed? I'm not sure you could still race in
>>> drm_syncobj_free when refcount is zero, so in that case removing locking
>>> from _release would work as well as a workqueue.
>>>
>>> Something like below would keep the drm_sync_obj_put hardirq safe.
>>>
>>> I assume when freeing, the  cb list is supposed to be empty, so I added a WARN_ON just to be sure, otherwise we should just tear down the list without locking too.
>>>
>>> This should be a better alternative for patch 1.
>> This isn't enough, because the problem isn't just the syncobj put. It's
>> also the i915_vm_put, and if we dercuify the intel_context stuff too, then
>> there will be more intel_context_put on top.
>>
>> So we really need the worker here I think. Trying to make every _unpin() and
>> _put() work from hardirq context with clever locking tricks is why the
>> current code is so incomprehensible.
>>
>> Also vms are rare enough that we really don't care about some
>> overhead/delay here.
> Other reason is the one I explained in the commit message: Aside from the
> engines i915_active there's no reason why anyone should call
> i915_gem_context_put outside of process context. And I plan to fix that as
> the next step. Or at least I'll try to untangle the context/engine
> lifetime rules a bit.
> -Daniel


That would definitely help me a lot too, so Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com> for patch 1.

