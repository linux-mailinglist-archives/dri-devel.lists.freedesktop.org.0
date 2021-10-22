Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AF4375D1
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 13:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663836ED05;
	Fri, 22 Oct 2021 11:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61206ED05;
 Fri, 22 Oct 2021 11:03:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="209385327"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="209385327"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 04:03:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="484642229"
Received: from dkarner-mobl.ger.corp.intel.com (HELO [10.252.48.154])
 ([10.252.48.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 04:03:28 -0700
Subject: Re: [PATCH 08/28] drm/i915: Create a full object for mock_ring, v2.
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-8-maarten.lankhorst@linux.intel.com>
 <CAM0jSHN7htNjZORSqA=YDRP3TuWq6Xs+su8wF_hBqcu0qukvpA@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <15e82490-c797-0c76-473d-abb00b53f854@linux.intel.com>
Date: Fri, 22 Oct 2021 13:03:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHN7htNjZORSqA=YDRP3TuWq6Xs+su8wF_hBqcu0qukvpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

Op 21-10-2021 om 17:57 schreef Matthew Auld:
> On Thu, 21 Oct 2021 at 11:36, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> This allows us to finally get rid of all the assumptions that vma->obj is NULL.
>>
>> Changes since v1:
>> - Ensure the mock_ring vma is pinned to prevent a fault.
>> - Pin it high to avoid failure in evict_for_vma selftest.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/mock_engine.c | 38 ++++++++++++++++++++-------
>>  1 file changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/mock_engine.c b/drivers/gpu/drm/i915/gt/mock_engine.c
>> index 8b89215afe46..bb99fc03f503 100644
>> --- a/drivers/gpu/drm/i915/gt/mock_engine.c
>> +++ b/drivers/gpu/drm/i915/gt/mock_engine.c
>> @@ -35,9 +35,31 @@ static void mock_timeline_unpin(struct intel_timeline *tl)
>>         atomic_dec(&tl->pin_count);
>>  }
>>
>> +static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
>> +{
>> +       struct i915_address_space *vm = &ggtt->vm;
>> +       struct drm_i915_private *i915 = vm->i915;
>> +       struct drm_i915_gem_object *obj;
>> +       struct i915_vma *vma;
>> +
>> +       obj = i915_gem_object_create_internal(i915, size);
>> +       if (IS_ERR(obj))
>> +               return ERR_CAST(obj);
> We didn't want to use the dummy object here also? I guess meh?
>
>> +
>> +       vma = i915_vma_instance(obj, vm, NULL);
>> +       if (IS_ERR(vma))
>> +               goto err;
>> +
>> +       return vma;
>> +
>> +err:
>> +       i915_gem_object_put(obj);
>> +       return vma;
>> +}
>> +
>>  static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
>>  {
>> -       const unsigned long sz = PAGE_SIZE / 2;
>> +       const unsigned long sz = PAGE_SIZE;
> Is that significant?
>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

vma->node.size has to be page aligned, since we create an actual vma, it was required to bump the size.

~Maarten

>>         struct intel_ring *ring;
>>
>>         ring = kzalloc(sizeof(*ring) + sz, GFP_KERNEL);
>> @@ -50,15 +72,11 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
>>         ring->vaddr = (void *)(ring + 1);
>>         atomic_set(&ring->pin_count, 1);
>>
>> -       ring->vma = i915_vma_alloc();
>> -       if (!ring->vma) {
>> +       ring->vma = create_ring_vma(engine->gt->ggtt, PAGE_SIZE);
>> +       if (IS_ERR(ring->vma)) {
>>                 kfree(ring);
>>                 return NULL;
>>         }
>> -       i915_active_init(&ring->vma->active, NULL, NULL, 0);
>> -       __set_bit(I915_VMA_GGTT_BIT, __i915_vma_flags(ring->vma));
>> -       __set_bit(DRM_MM_NODE_ALLOCATED_BIT, &ring->vma->node.flags);
>> -       ring->vma->node.size = sz;
>>
>>         intel_ring_update_space(ring);
>>
>> @@ -67,8 +85,7 @@ static struct intel_ring *mock_ring(struct intel_engine_cs *engine)
>>
>>  static void mock_ring_free(struct intel_ring *ring)
>>  {
>> -       i915_active_fini(&ring->vma->active);
>> -       i915_vma_free(ring->vma);
>> +       i915_vma_put(ring->vma);
>>
>>         kfree(ring);
>>  }
>> @@ -125,6 +142,7 @@ static void mock_context_unpin(struct intel_context *ce)
>>
>>  static void mock_context_post_unpin(struct intel_context *ce)
>>  {
>> +       i915_vma_unpin(ce->ring->vma);
>>  }
>>
>>  static void mock_context_destroy(struct kref *ref)
>> @@ -169,7 +187,7 @@ static int mock_context_alloc(struct intel_context *ce)
>>  static int mock_context_pre_pin(struct intel_context *ce,
>>                                 struct i915_gem_ww_ctx *ww, void **unused)
>>  {
>> -       return 0;
>> +       return i915_vma_pin_ww(ce->ring->vma, ww, 0, 0, PIN_GLOBAL | PIN_HIGH);
>>  }
>>
>>  static int mock_context_pin(struct intel_context *ce, void *unused)
>> --
>> 2.33.0
>>

