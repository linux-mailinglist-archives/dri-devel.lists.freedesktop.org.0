Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A1949F844
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 12:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7310E6C7;
	Fri, 28 Jan 2022 11:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589510E486;
 Fri, 28 Jan 2022 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643369154; x=1674905154;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z1CljGSEZAk9uJh9gobflrUm66wbWDe9rmC+H+y8SmY=;
 b=P1jydJUkEUmDqoh/B5Hq0IZwIXaRgS69N+fVSzrC1n05XuVWo6LKJzjj
 WO7++6AOS1+ais6ZVjJCCiZUBqKQ5C4v1uGFfe+PxiPdEhhPtQ2NBgfIK
 3HlDxGPj7+NNI9r9iR4GugwyIFtNwAvxfpSNR4dffZD2bwb5GpzPkYBQu
 dWIjd6E+tDJBbM2jeytPXZyOH1+PKXq3SfAvHdNhw+m7AkWYUlNBLYW0Z
 v0U45LfsDJuM8AGLiPFDfiTstB+8JFZvFffVsuayXdD82Fmvj8q12GRA0
 bj5r+13Fp5BDUYG0hlEYEYYkYxuJk2SklLrJJqQh1g//FzDDykxjYPJHX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="333455452"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="333455452"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 03:25:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="697063951"
Received: from rbresug-mobl.ger.corp.intel.com (HELO [10.252.55.61])
 ([10.252.55.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 03:25:52 -0800
Message-ID: <56c544bc-411e-7fb1-0edf-e4d119f616e4@linux.intel.com>
Date: Fri, 28 Jan 2022 12:25:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Allow dead vm to unbind vma's
 without lock.
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 intel-gfx@lists.freedesktop.org
References: <20220128085739.1464568-1-maarten.lankhorst@linux.intel.com>
 <a5ee6bb7-f0ad-b3db-da7f-b912f5242297@shipmail.org>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <a5ee6bb7-f0ad-b3db-da7f-b912f5242297@shipmail.org>
Content-Type: text/plain; charset=UTF-8
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

Op 28-01-2022 om 12:02 schreef Thomas Hellström (Intel):
>
> On 1/28/22 09:57, Maarten Lankhorst wrote:
>> i915_gem_vm_close may take the lock, and we currently have no better way
>> of handling this. At least for now, allow a path in which holding vm->mutex
>> is sufficient. This is the case, because the object destroy path will
>> forcefully take vm->mutex now.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
>
>
>> ---
>>   drivers/gpu/drm/i915/i915_vma.c | 15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>> index b959e904c4d3..14a301c4069f 100644
>> --- a/drivers/gpu/drm/i915/i915_vma.c
>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>> @@ -40,6 +40,17 @@
>>   #include "i915_vma.h"
>>   #include "i915_vma_resource.h"
>>   +static inline void assert_vma_held_evict(const struct i915_vma *vma)
>> +{
>> +    /*
>> +     * We may be forced to unbind when the vm is dead, to clean it up.
>> +     * This is the only exception to the requirement of the object lock
>> +     * being held.
>> +     */
>> +    if (atomic_read(&vma->vm->open))
>> +        assert_object_held_shared(vma->obj);
>> +}
>> +
>>   static struct kmem_cache *slab_vmas;
>>     static struct i915_vma *i915_vma_alloc(void)
>> @@ -1779,7 +1790,7 @@ struct dma_fence *__i915_vma_evict(struct i915_vma *vma, bool async)
>>       struct dma_fence *unbind_fence;
>>         GEM_BUG_ON(i915_vma_is_pinned(vma));
>> -    assert_object_held_shared(vma->obj);
>> +    assert_vma_held_evict(vma);
>>         if (i915_vma_is_map_and_fenceable(vma)) {
>>           /* Force a pagefault for domain tracking on next user access */
>> @@ -1846,7 +1857,7 @@ int __i915_vma_unbind(struct i915_vma *vma)
>>       int ret;
>>         lockdep_assert_held(&vma->vm->mutex);
>> -    assert_object_held_shared(vma->obj);
>> +    assert_vma_held_evict(vma);
>>         if (!drm_mm_node_allocated(&vma->node))
>>           return 0;

Thanks, pushed. Should fix alderlake DPT.

