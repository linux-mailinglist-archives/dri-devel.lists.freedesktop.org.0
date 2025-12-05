Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B17CA7513
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:10:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BDF10E049;
	Fri,  5 Dec 2025 11:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XToLJXpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5210E049
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 11:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764933051; x=1796469051;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pGopNyeHsvBW3go2mhsIpNS7bzOqTQ9RMlM6PkX0h+Y=;
 b=XToLJXpDmZNOcGHFjik3E3x8jXZJc5g4lxW27BXIIHpoUoPUPuVKfTU1
 96OM9WmcuqJul+Mm2UmB/i24vborKgu5EKZ93oV8F7cq/cqkX4+ey2G1f
 5tcNxS2qhVUiZfU8cn6trlBEGr69t1vAAghmgnls35zl7JRCk+XLHqwcP
 ULVCAeYMs4K7o3sIeGFm9RSg+AZCX/AcLqLgxbCFfgag1+TH+q/97N4NZ
 Iwrt21cl9mC5vcOp6KYoefP4CV2nxyy180FkR4zC5CmKfESKqAMXkC2fb
 0XNXVGwEMjtp1lh+o4d+TL/D5TB0c+95EKNraryHCgD0nK8BH/56O/OoC A==;
X-CSE-ConnectionGUID: reV3+1kSQ5e4z408KKTrzw==
X-CSE-MsgGUID: sLCJXrj5R4CI9qkCVrAJLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66689792"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="66689792"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:10:51 -0800
X-CSE-ConnectionGUID: cF6XzfUWQIilNYFQQ9wzQw==
X-CSE-MsgGUID: GbtHloDOSLy5SmLUPkF1Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195706412"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.110])
 ([10.245.244.110])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:10:50 -0800
Message-ID: <23d8391c-4568-4b31-acb3-9426b0bf085e@intel.com>
Date: Fri, 5 Dec 2025 11:10:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dma-buf: improve sg_table debugging hack v2
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 simona.vetter@ffwll.ch
References: <20251204145952.7052-1-christian.koenig@amd.com>
 <3e09719d-af1b-4c5d-83fb-6ef5f41739b5@intel.com>
 <e21cc071-0133-4b07-a52f-67ed4d80cbcd@gmail.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <e21cc071-0133-4b07-a52f-67ed4d80cbcd@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2025 10:41, Christian König wrote:
> On 12/4/25 16:51, Matthew Auld wrote:
>> On 04/12/2025 14:59, Christian König wrote:
>>> This debugging hack is important to enforce the rule that importers
>>> should *never* touch the underlying struct page of the exporter.
>>>
>>> Instead of just mangling the page link create a copy of the sg_table
>>> but only copy over the DMA addresses and not the pages.
>>>
>>> This will cause a NULL pointer de-reference if the importer tries to
>>> touch the struct page. Still quite a hack but this at least allows the
>>> exporter to properly keeps it's sg_table intact while allowing the
>>> DMA-buf maintainer to find and fix misbehaving importers and finally
>>> switch over to using a different data structure in the future.
>>>
>>> v2: improve the hack further by using a wrapper structure and explaining
>>> the background a bit more in the commit message.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> (v1)
>>> ---
>>>    drivers/dma-buf/dma-buf.c | 72 +++++++++++++++++++++++++++++++--------
>>>    1 file changed, 58 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 2305bb2cc1f1..8c4afd360b72 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -35,6 +35,12 @@
>>>      #include "dma-buf-sysfs-stats.h"
>>>    +/* Wrapper to hide the sg_table page link from the importer */
>>> +struct dma_buf_sg_table_wrapper {
>>> +    struct sg_table *original;
>>> +    struct sg_table wrapper;
>>> +};
>>> +
>>>    static inline int is_dma_buf_file(struct file *);
>>>      static DEFINE_MUTEX(dmabuf_list_mutex);
>>> @@ -828,21 +834,57 @@ void dma_buf_put(struct dma_buf *dmabuf)
>>>    }
>>>    EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>>>    -static void mangle_sg_table(struct sg_table *sg_table)
>>> +static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
>>>    {
>>> -#ifdef CONFIG_DMABUF_DEBUG
>>> -    int i;
>>> -    struct scatterlist *sg;
>>> -
>>> -    /* To catch abuse of the underlying struct page by importers mix
>>> -     * up the bits, but take care to preserve the low SG_ bits to
>>> -     * not corrupt the sgt. The mixing is undone on unmap
>>> -     * before passing the sgt back to the exporter.
>>> +    struct scatterlist *to_sg, *from_sg;
>>> +    struct sg_table *from = *sg_table;
>>> +    struct dma_buf_sg_table_wrapper *to;
>>> +    int i, ret;
>>> +
>>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>>> +        return 0;
>>> +
>>> +    /*
>>> +     * To catch abuse of the underlying struct page by importers copy the
>>> +     * sg_table without copying the page_link and give only the copy back to
>>> +     * the importer.
>>>         */
>>> -    for_each_sgtable_sg(sg_table, sg, i)
>>> -        sg->page_link ^= ~0xffUL;
>>> -#endif
>>> +    to = kzalloc(sizeof(*to), GFP_KERNEL);
>>> +    if (!to)
>>> +        return -ENOMEM;
>>> +
>>> +    ret = sg_alloc_table(&to->wrapper, from->nents, GFP_KERNEL);
>>> +    if (ret)
>>> +        goto free_to;
>>> +
>>> +    to_sg = to->wrapper.sgl;
>>> +    for_each_sgtable_dma_sg(from, from_sg, i) {
>>> +        sg_set_page(to_sg, NULL, 0, 0);
>>
>> Are we still allowed to pass NULL page here? There looks to be the recently added:
>>
>> VM_WARN_ON_ONCE(!page_range_contiguous(page, ALIGN(len + offset, PAGE_SIZE) / PAGE_SIZE));
>>
>> And if page_range_contiguous() does not just return true, it potentially wants to dereference the page, like with page_to_pfn()?
> 
> Good point.
> 
> It doesn't crash at the moment because page_to_pfn() also works with NULL as page, but it is clearly not the nicest thing to do.

There does look to be:

https://elixir.bootlin.com/linux/v6.18/source/include/asm-generic/memory_model.h#L56

So not completely sure it can't crash here?

> 
> I will switch over to using sg_assign_page() instead.
> 
>>
>>
>>> +                sg_dma_address(to_sg) = sg_dma_address(from_sg);
>>> +                sg_dma_len(to_sg) = sg_dma_len(from_sg);
>>
>> Nit: formatting looks off here.
> 
> Oh, indeed.
> 
> Thanks,
> Christian.
> 
>>
>>> +        to_sg = sg_next(to_sg);
>>> +    }
>>>    +    to->original = from;
>>> +    *sg_table = &to->wrapper;
>>> +    return 0;
>>> +
>>> +free_to:
>>> +    kfree(to);
>>> +    return ret;
>>> +}
>>> +
>>> +static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
>>> +{
>>> +    struct dma_buf_sg_table_wrapper *copy;
>>> +
>>> +    if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>>> +        return;
>>> +
>>> +    copy = container_of(*sg_table, typeof(*copy), wrapper);
>>> +    *sg_table = copy->original;
>>> +    sg_free_table(&copy->wrapper);
>>> +    kfree(copy);
>>>    }
>>>      static inline bool
>>> @@ -1139,7 +1181,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>>>            if (ret < 0)
>>>                goto error_unmap;
>>>        }
>>> -    mangle_sg_table(sg_table);
>>> +    ret = dma_buf_mangle_sg_table(&sg_table);
>>> +    if (ret)
>>> +        goto error_unmap;
>>>          if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>>>            struct scatterlist *sg;
>>> @@ -1220,7 +1264,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>>>          dma_resv_assert_held(attach->dmabuf->resv);
>>>    -    mangle_sg_table(sg_table);
>>> +    dma_buf_demangle_sg_table(&sg_table);
>>>        attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>>          if (dma_buf_pin_on_map(attach))
>>
> 

