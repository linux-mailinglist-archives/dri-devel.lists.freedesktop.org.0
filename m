Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD043DE3E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 11:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004486E944;
	Thu, 28 Oct 2021 09:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90006E947;
 Thu, 28 Oct 2021 09:58:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="217279217"
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="217279217"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:58:29 -0700
X-IronPort-AV: E=Sophos;i="5.87,189,1631602800"; d="scan'208";a="487068705"
Received: from malloyd-mobl.ger.corp.intel.com (HELO [10.252.16.73])
 ([10.252.16.73])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 02:58:27 -0700
Subject: Re: [PATCH v2 1/3] drm/i915: Introduce refcounted sg-tables
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20211027105211.485125-1-thomas.hellstrom@linux.intel.com>
 <20211027105211.485125-2-thomas.hellstrom@linux.intel.com>
 <0f548cca-214f-26c2-1628-35e6fa0d7c95@intel.com>
 <1d2f46030369b17405550b5ea42d0326199ad4bf.camel@linux.intel.com>
 <e2b4f1d3-3ade-92d9-5216-77d4619e408e@intel.com>
 <467c16ed-5efd-ed33-1e4b-18b0f447af9e@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <81061bce-c651-70f0-3f3a-6d307754cb92@intel.com>
Date: Thu, 28 Oct 2021 10:58:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <467c16ed-5efd-ed33-1e4b-18b0f447af9e@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 28/10/2021 10:35, Thomas Hellström wrote:
> 
> On 10/28/21 10:47, Matthew Auld wrote:
>> On 28/10/2021 08:04, Thomas Hellström wrote:
>>> On Wed, 2021-10-27 at 19:03 +0100, Matthew Auld wrote:
>>>> On 27/10/2021 11:52, Thomas Hellström wrote:
>>>>> As we start to introduce asynchronous failsafe object migration,
>>>>> where we update the object state and then submit asynchronous
>>>>> commands we need to record what memory resources are actually used
>>>>> by various part of the command stream. Initially for three
>>>>> purposes:
>>>>>
>>>>> 1) Error capture.
>>>>> 2) Asynchronous migration error recovery.
>>>>> 3) Asynchronous vma bind.
>>>>>
>>>>> At the time where these happens, the object state may have been
>>>>> updated
>>>>> to be several migrations ahead and object sg-tables discarded.
>>>>>
>>>>> In order to make it possible to keep sg-tables with memory resource
>>>>> information for these operations, introduce refcounted sg-tables
>>>>> that
>>>>> aren't freed until the last user is done with them.
>>>>>
>>>>> The alternative would be to reference information sitting on the
>>>>> corresponding ttm_resources which typically have the same lifetime
>>>>> as
>>>>> these refcountes sg_tables, but that leads to other awkward
>>>>> constructs:
>>>>> Due to the design direction chosen for ttm resource managers that
>>>>> would
>>>>> lead to diamond-style inheritance, the LMEM resources may sometimes
>>>>> be
>>>>> prematurely freed, and finally the subclassed struct ttm_resource
>>>>> would
>>>>> have to bleed into the asynchronous vma bind code.
>>>>>
>>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/i915/gem/i915_gem_object.h    |   4 +-
>>>>>    .../gpu/drm/i915/gem/i915_gem_object_types.h  |   3 +-
>>>>>    drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  16 +-
>>>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c       | 188 +++++++++++--
>>>>> -----
>>>>>    drivers/gpu/drm/i915/i915_scatterlist.c       |  62 ++++--
>>>>>    drivers/gpu/drm/i915/i915_scatterlist.h       |  76 ++++++-
>>>>>    drivers/gpu/drm/i915/intel_region_ttm.c       |  15 +-
>>>>>    drivers/gpu/drm/i915/intel_region_ttm.h       |   5 +-
>>>>>    drivers/gpu/drm/i915/selftests/mock_region.c  |  12 +-
>>>>>    9 files changed, 262 insertions(+), 119 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>> index a5479ac7a4ad..c5ab364d4311 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>> @@ -624,8 +624,8 @@ struct sg_table *shmem_alloc_st(struct
>>>>> drm_i915_private *i915,
>>>>>                                  size_t size, struct
>>>>> intel_memory_region *mr,
>>>>>                                  struct address_space *mapping,
>>>>>                                  unsigned int max_segment);
>>>>> -void shmem_free_st(struct sg_table *st, struct address_space
>>>>> *mapping,
>>>>> -                  bool dirty, bool backup);
>>>>> +void shmem_free_st_table(struct sg_table *st, struct address_space
>>>>> *mapping,
>>>>> +                        bool dirty, bool backup);
>>>>
>>>> s/st_table/sg_table/?
>>>>
>>>> I thought st was shorthand for sg_table? Maybe shmem_sg_free_table?
>>>
>>> Yes the naming is indeed a bit unfortunate here. To be consistent with
>>> the core's sg_free_table(), I changed to
>>> shmem_sg_free_table() / shmem_sg_alloc_table.
>>>
>>>>
>>>>
>>>>>    void __shmem_writeback(size_t size, struct address_space
>>>>> *mapping);
>>>>>       #ifdef CONFIG_MMU_NOTIFIER
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> index a4b69a43b898..604ed5ad77f5 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>>> @@ -544,6 +544,7 @@ struct drm_i915_gem_object {
>>>>>                   */
>>>>>                  struct list_head region_link;
>>>>>    +               struct i915_refct_sgt *rsgt;
>>>>>                  struct sg_table *pages;
>>>>>                  void *mapping;
>>>>>    @@ -597,7 +598,7 @@ struct drm_i915_gem_object {
>>>>>          } mm;
>>>>>             struct {
>>>>> -               struct sg_table *cached_io_st;
>>>>> +               struct i915_refct_sgt *cached_io_rsgt;
>>>>>                  struct i915_gem_object_page_iter get_io_page;
>>>>>                  struct drm_i915_gem_object *backup;
>>>>>                  bool created:1;
>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>>>>> index 01f332d8dbde..67c6bee695c7 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>>>>> @@ -25,8 +25,8 @@ static void check_release_pagevec(struct pagevec
>>>>> *pvec)
>>>>>          cond_resched();
>>>>>    }
>>>>>    -void shmem_free_st(struct sg_table *st, struct address_space
>>>>> *mapping,
>>>>> -                  bool dirty, bool backup)
>>>>> +void shmem_free_st_table(struct sg_table *st, struct address_space
>>>>> *mapping,
>>>>> +                        bool dirty, bool backup)
>>>>>    {
>>>>>          struct sgt_iter sgt_iter;
>>>>>          struct pagevec pvec;
>>>>> @@ -49,7 +49,6 @@ void shmem_free_st(struct sg_table *st, struct
>>>>> address_space *mapping,
>>>>>                  check_release_pagevec(&pvec);
>>>>>             sg_free_table(st);
>>>>> -       kfree(st);
>>>>>    }
>>>>>       struct sg_table *shmem_alloc_st(struct drm_i915_private *i915,
>>>>> @@ -171,7 +170,8 @@ struct sg_table *shmem_alloc_st(struct
>>>>> drm_i915_private *i915,
>>>>>    err_sg:
>>>>>          sg_mark_end(sg);
>>>>>          if (sg != st->sgl) {
>>>>> -               shmem_free_st(st, mapping, false, false);
>>>>> +               shmem_free_st_table(st, mapping, false, false);
>>>>> +               kfree(st);
>>>>>          } else {
>>>>>                  mapping_clear_unevictable(mapping);
>>>>>                  sg_free_table(st);
>>>>> @@ -254,7 +254,8 @@ static int shmem_get_pages(struct
>>>>> drm_i915_gem_object *obj)
>>>>>          return 0;
>>>>>       err_pages:
>>>>> -       shmem_free_st(st, mapping, false, false);
>>>>> +       shmem_free_st_table(st, mapping, false, false);
>>>>> +       kfree(st);
>>>>>          /*
>>>>>           * shmemfs first checks if there is enough memory to
>>>>> allocate the page
>>>>>           * and reports ENOSPC should there be insufficient, along
>>>>> with the usual
>>>>> @@ -374,8 +375,9 @@ void i915_gem_object_put_pages_shmem(struct
>>>>> drm_i915_gem_object *obj, struct sg_
>>>>>          if (i915_gem_object_needs_bit17_swizzle(obj))
>>>>>                  i915_gem_object_save_bit_17_swizzle(obj, pages);
>>>>>    -       shmem_free_st(pages, file_inode(obj->base.filp)->i_mapping,
>>>>> -                     obj->mm.dirty, obj->mm.madv ==
>>>>> I915_MADV_WILLNEED);
>>>>> +       shmem_free_st_table(pages, file_inode(obj->base.filp)-
>>>>>> i_mapping,
>>>>> +                           obj->mm.dirty, obj->mm.madv ==
>>>>> I915_MADV_WILLNEED);
>>>>> +       kfree(pages);
>>>>>          obj->mm.dirty = false;
>>>>>    }
>>>>>    diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> index 4fd2edb20dd9..6826e3859e18 100644
>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>>> @@ -34,7 +34,7 @@
>>>>>     * struct i915_ttm_tt - TTM page vector with additional private
>>>>> information
>>>>>     * @ttm: The base TTM page vector.
>>>>>     * @dev: The struct device used for dma mapping and unmapping.
>>>>> - * @cached_st: The cached scatter-gather table.
>>>>> + * @cached_rsgt: The cached scatter-gather table.
>>>>>     * @is_shmem: Set if using shmem.
>>>>>     * @filp: The shmem file, if using shmem backend.
>>>>>     *
>>>>> @@ -47,7 +47,7 @@
>>>>>    struct i915_ttm_tt {
>>>>>          struct ttm_tt ttm;
>>>>>          struct device *dev;
>>>>> -       struct sg_table *cached_st;
>>>>> +       struct i915_refct_sgt cached_rsgt;
>>>>>             bool is_shmem;
>>>>>          struct file *filp;
>>>>> @@ -221,14 +221,10 @@ static int i915_ttm_tt_shmem_populate(struct
>>>>> ttm_device *bdev,
>>>>>          if (IS_ERR(st))
>>>>>                  return PTR_ERR(st);
>>>>>    -       err = dma_map_sg_attrs(i915_tt->dev,
>>>>> -                              st->sgl, st->nents,
>>>>> -                              DMA_BIDIRECTIONAL,
>>>>> -                              DMA_ATTR_SKIP_CPU_SYNC);
>>>>> -       if (err <= 0) {
>>>>> -               err = -EINVAL;
>>>>> +       err = dma_map_sgtable(i915_tt->dev, st, DMA_BIDIRECTIONAL,
>>>>> +                             DMA_ATTR_SKIP_CPU_SYNC);
>>>>> +       if (err)
>>>>>                  goto err_free_st;
>>>>> -       }
>>>>>             i = 0;
>>>>>          for_each_sgt_page(page, sgt_iter, st)
>>>>> @@ -237,11 +233,15 @@ static int i915_ttm_tt_shmem_populate(struct
>>>>> ttm_device *bdev,
>>>>>          if (ttm->page_flags & TTM_TT_FLAG_SWAPPED)
>>>>>                  ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
>>>>>    -       i915_tt->cached_st = st;
>>>>> +       i915_tt->cached_rsgt.table = *st;
>>>>> +       kfree(st);
>>>>
>>>> Will it work if the above just operates on the rsgt.table?
>>>
>>> I'll change the shmem utility here to not allocate the struct sg_table
>>> and then we can operate on it directly.
>>>
>>>>
>>>>> +
>>>>>          return 0;
>>>>>       err_free_st:
>>>>> -       shmem_free_st(st, filp->f_mapping, false, false);
>>>>> +       shmem_free_st_table(st, filp->f_mapping, false, false);
>>>>> +       kfree(st);
>>>>> +
>>>>>          return err;
>>>>>    }
>>>>>    @@ -249,16 +249,29 @@ static void
>>>>> i915_ttm_tt_shmem_unpopulate(struct ttm_tt *ttm)
>>>>>    {
>>>>>          struct i915_ttm_tt *i915_tt = container_of(ttm,
>>>>> typeof(*i915_tt), ttm);
>>>>>          bool backup = ttm->page_flags & TTM_TT_FLAG_SWAPPED;
>>>>> +       struct sg_table *st = &i915_tt->cached_rsgt.table;
>>>>>    -       dma_unmap_sg(i915_tt->dev, i915_tt->cached_st->sgl,
>>>>> -                    i915_tt->cached_st->nents,
>>>>> -                    DMA_BIDIRECTIONAL);
>>>>> +       if (st->sgl)
>>>>
>>>> Can we ever hit this? I would have presumed not? Below also.
>>>
>>> Yes, here's where we typically free the scatterlist.
>>
>> What I meant to say: can the above ever not be true? i.e sgl == NULL
> 
> Hm, Yes I think it can. If we're populating a non-shmem ttm tt, that 
> sg-list is, IIRC allocated lazily on first use. Although I haven't 
> analyzed in detail whether it can actually be populated and then not 
> lazily allocated under the same lock.

Oh right. I guess we could maybe drop the check in the shmem part?

> 
> 
