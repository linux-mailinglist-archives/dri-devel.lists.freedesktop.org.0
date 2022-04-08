Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8944F92AC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EFD410EFD2;
	Fri,  8 Apr 2022 10:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77E910E148;
 Fri,  8 Apr 2022 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649412928; x=1680948928;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=AE6RC8EG+Hd7geescp2zPSNunjGGgYbaGkWQI8nsPIA=;
 b=Aw3rWLIwsT3vaFxtbW3El2Cc3EAonqRV56CAgpzQpJXdYzVPxXDCs31o
 KJjTzLaQvlGTSElPvvpKP1GSKuH5MC4Hpy0behdfMndP2njttEoTOOgxV
 TPyk9v/YVR+lfMQnYbztBcwga02i+qtanP02zuD1SB+x3uy80ewUiVzeN
 6SW273+scMwHUM1z7/sRXVWGwMIVZ1eSdEvkucLNGuBDho3Igb5bC1h1F
 ljd38tdNBVBTJYQ9RNkYa2mHVK9QcpMfS2verG6/zdMNaEHgpGc3FTJwf
 XFD7dj8TMPzT7T7/XL7cCuYGBC1xynHxtENpZtg4afAdd9pEWQvwwZiLD g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="322248467"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="322248467"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:15:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; d="scan'208";a="571438969"
Received: from dmunisam-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.141.69])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 03:15:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 12/15] drm/i915: drop bo->moving dependency
In-Reply-To: <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-13-christian.koenig@amd.com>
 <87y20ghrmy.fsf@intel.com> <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
Date: Fri, 08 Apr 2022 13:15:21 +0300
Message-ID: <87v8vjj2yu.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Apr 2022, Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> Am 08.04.22 um 11:05 schrieb Jani Nikula:
>> On Thu, 07 Apr 2022, "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmai=
l.com> wrote:
>>> That should now be handled by the common dma_resv framework.
>>>
>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: intel-gfx@lists.freedesktop.org
>> So, where are the i915 maintainer acks for merging this (and the other
>> patches in the series touching i915) via drm-misc-next?
>>
>> Daniel's Reviewed-by is not an ack to merge outside drm-intel-next.
>
> I had the impression that it would be sufficient.

Please don't assume. Please always ask for explicit acks from the
maintainers before merging, and record the acks in the commit
message. This has been standard policy for as long as I remember.

Contrast with us merging non-trivial dma-buf changes via drm-intel-next
with a Reviewed-by from someone who isn't a dma-buf maintainer, and not
even bothering to Cc the maintainers.

>> We don't merge i915 stuff without passing CI results. Apparently this
>> one failed enough machines that the CI had to be stopped entirely.
>
> That was unfortunately partially expected and pointed out by Matthew and=
=20
> Daniel before the push.
>
> i915 for some reason extended the usage of the bo->moving fence despite=20
> the fact we had patches on the mailing list to entirely remove this featu=
re.
>
> I couldn't get any sane CI results for weeks because of this and at some=
=20
> point we just had to go ahead and fix the clash in drm-tip.

Did you talk to the maintainers about it?


BR,
Jani.

>
> Sorry for any inconvenience cause by that. I hoped that we fixed all=20
> cases, but looks like we still missed some.
>
> Regards,
> Christian.
>
>>
>>
>> BR,
>> Jani.
>>
>>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++---------------
>>>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
>>>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
>>>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
>>>   drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
>>>   6 files changed, 21 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_object.c
>>> index 372bc220faeb..ffde7bc0a95d 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>> @@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_gem=
_object_funcs =3D {
>>>   /**
>>>    * i915_gem_object_get_moving_fence - Get the object's moving fence i=
f any
>>>    * @obj: The object whose moving fence to get.
>>> + * @fence: The resulting fence
>>>    *
>>>    * A non-signaled moving fence means that there is an async operation
>>>    * pending on the object that needs to be waited on before setting up
>>>    * any GPU- or CPU PTEs to the object's pages.
>>>    *
>>> - * Return: A refcounted pointer to the object's moving fence if any,
>>> - * NULL otherwise.
>>> + * Return: Negative error code or 0 for success.
>>>    */
>>> -struct dma_fence *
>>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
>>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>>> +				     struct dma_fence **fence)
>>>   {
>>> -	return dma_fence_get(i915_gem_to_ttm(obj)->moving);
>>> -}
>>> -
>>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>> -				      struct dma_fence *fence)
>>> -{
>>> -	struct dma_fence **moving =3D &i915_gem_to_ttm(obj)->moving;
>>> -
>>> -	if (*moving =3D=3D fence)
>>> -		return;
>>> -
>>> -	dma_fence_put(*moving);
>>> -	*moving =3D dma_fence_get(fence);
>>> +	return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERNEL,
>>> +				      fence);
>>>   }
>>>=20=20=20
>>>   /**
>>> @@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_i=
915_gem_object *obj,
>>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>   				      bool intr)
>>>   {
>>> -	struct dma_fence *fence =3D i915_gem_to_ttm(obj)->moving;
>>> -	int ret;
>>> -
>>>   	assert_object_held(obj);
>>> -	if (!fence)
>>> -		return 0;
>>> -
>>> -	ret =3D dma_fence_wait(fence, intr);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>> -	if (fence->error)
>>> -		return fence->error;
>>> -
>>> -	i915_gem_to_ttm(obj)->moving =3D NULL;
>>> -	dma_fence_put(fence);
>>> -	return 0;
>>> +	return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERNEL,
>>> +				     intr, MAX_SCHEDULE_TIMEOUT);
>>>   }
>>>=20=20=20
>>>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/d=
rm/i915/gem/i915_gem_object.h
>>> index 02c37fe4a535..e11d82a9f7c3 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>> @@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem_=
object *obj)
>>>   	i915_gem_object_unpin_pages(obj);
>>>   }
>>>=20=20=20
>>> -struct dma_fence *
>>> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
>>> -
>>> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj,
>>> -				      struct dma_fence *fence);
>>> -
>>> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
>>> +				     struct dma_fence **fence);
>>>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *obj,
>>>   				      bool intr);
>>>=20=20=20
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu=
/drm/i915/gem/i915_gem_ttm_move.c
>>> index 438b8a95b3d1..a10716f4e717 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> @@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
>>>   	return fence;
>>>   }
>>>=20=20=20
>>> -static int
>>> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>> -	  struct i915_deps *deps)
>>> -{
>>> -	int ret;
>>> -
>>> -	ret =3D i915_deps_add_dependency(deps, bo->moving, ctx);
>>> -	if (!ret)
>>> -		ret =3D i915_deps_add_resv(deps, bo->base.resv, ctx);
>>> -
>>> -	return ret;
>>> -}
>>> -
>>>   /**
>>>    * i915_ttm_move - The TTM move callback used by i915.
>>>    * @bo: The buffer object.
>>> @@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, boo=
l evict,
>>>   		struct i915_deps deps;
>>>=20=20=20
>>>   		i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
>>> -		ret =3D prev_deps(bo, ctx, &deps);
>>> +		ret =3D i915_deps_add_resv(&deps, bo->base.resv, ctx);
>>>   		if (ret) {
>>>   			i915_refct_sgt_put(dst_rsgt);
>>>   			return ret;
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/dr=
ivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> index 4997ed18b6e4..0ad443a90c8b 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
>>> @@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_gt=
 *gt,
>>>   			err =3D dma_resv_reserve_fences(obj->base.resv, 1);
>>>   			if (!err)
>>>   				dma_resv_add_fence(obj->base.resv, &rq->fence,
>>> -						   DMA_RESV_USAGE_WRITE);
>>> -			i915_gem_object_set_moving_fence(obj, &rq->fence);
>>> +						   DMA_RESV_USAGE_KERNEL);
>>>   			i915_request_put(rq);
>>>   		}
>>>   		if (err)
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drive=
rs/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> index 3a6e3f6d239f..dfc34cc2ef8c 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
>>> @@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memory=
_region **placements,
>>>   	i915_gem_object_unpin_pages(obj);
>>>   	if (rq) {
>>>   		dma_resv_add_fence(obj->base.resv, &rq->fence,
>>> -				   DMA_RESV_USAGE_WRITE);
>>> -		i915_gem_object_set_moving_fence(obj, &rq->fence);
>>> +				   DMA_RESV_USAGE_KERNEL);
>>>   		i915_request_put(rq);
>>>   	}
>>>   	i915_gem_object_unlock(obj);
>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i91=
5_vma.c
>>> index 524477d8939e..d077f7b9eaad 100644
>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>> @@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, struc=
t i915_gem_ww_ctx *ww,
>>>   	if (err)
>>>   		return err;
>>>=20=20=20
>>> +	if (vma->obj) {
>>> +		err =3D i915_gem_object_get_moving_fence(vma->obj, &moving);
>>> +		if (err)
>>> +			return err;
>>> +	} else {
>>> +		moving =3D NULL;
>>> +	}
>>> +
>>>   	if (flags & PIN_GLOBAL)
>>>   		wakeref =3D intel_runtime_pm_get(&vma->vm->i915->runtime_pm);
>>>=20=20=20
>>> -	moving =3D vma->obj ? i915_gem_object_get_moving_fence(vma->obj) : NU=
LL;
>>>   	if (flags & vma->vm->bind_async_flags || moving) {
>>>   		/* lock VM */
>>>   		err =3D i915_vm_lock_objects(vma->vm, ww);
>

--=20
Jani Nikula, Intel Open Source Graphics Center
