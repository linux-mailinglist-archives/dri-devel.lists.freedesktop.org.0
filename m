Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E549D09F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 18:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71A410E43B;
	Wed, 26 Jan 2022 17:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC8610E43B;
 Wed, 26 Jan 2022 17:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 8A1A71F44B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643217773;
 bh=KRPjC0F//Rs7+XHQCvSSYdfp5fg6sMkAfNwgxe4p6qo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d5ECevzAgDFBVGTWmzfd0URx4elZ3RoL39HBbNFPwjtm9jCEG5/ywEJOn27gKFSLT
 xEQbTapy0hzenvYXZVkZVt8VQwC4AcNIuUs0CnwK4SluX3Ok8stN/Rh6qVpYOdvXIM
 dOjjC3F5CqhYZQAykMxy87gZGqMVwMBBl8x6LMtQKQA85NBVcZUFO2clMkWGIF6Jjv
 7oJCPLsqXBxnc+tMxHxq+8jKdCpgW+B7Gu6wu3anJvwWT0Q7gcuf+3ZvAa+vUAnrPq
 GDIY3Z/Y78noq24e6AhHN9FqQDrqtS8cArv8aQGybu0jSLTez0S5odTB6STKQcbB1s
 nolWZkIiRaCcw==
Message-ID: <60c29fb8-06a8-8daa-3cef-092d6b8d0323@collabora.com>
Date: Wed, 26 Jan 2022 17:22:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH v5 4/5] drm/i915: add gtt misalignment test
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220125193530.3272386-1-bob.beckett@collabora.com>
 <20220125193530.3272386-5-bob.beckett@collabora.com>
 <b6e9a900-435f-148c-826f-a8f6c188df94@shipmail.org>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <b6e9a900-435f-148c-826f-a8f6c188df94@shipmail.org>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/01/2022 14:05, Thomas Hellström (Intel) wrote:
> 
> On 1/25/22 20:35, Robert Beckett wrote:
>> add test to check handling of misaligned offsets and sizes
>>
>> v4:
>>     * remove spurious blank lines
>>     * explicitly cast intel_region_id to intel_memory_type in 
>> misaligned_pin
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
>> ---
>>   drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 128 ++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c 
>> b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> index b80788a2b7f9..f082b5ff3b5e 100644
>> --- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> +++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
>> @@ -22,10 +22,12 @@
>>    *
>>    */
>> +#include "gt/intel_gtt.h"
>>   #include <linux/list_sort.h>
>>   #include <linux/prime_numbers.h>
>>   #include "gem/i915_gem_context.h"
>> +#include "gem/i915_gem_region.h"
>>   #include "gem/selftests/mock_context.h"
>>   #include "gt/intel_context.h"
>>   #include "gt/intel_gpu_commands.h"
>> @@ -1067,6 +1069,120 @@ static int shrink_boom(struct 
>> i915_address_space *vm,
>>       return err;
>>   }
>> +static int misaligned_case(struct i915_address_space *vm, struct 
>> intel_memory_region *mr,
>> +               u64 addr, u64 size, unsigned long flags)
>> +{
>> +    struct drm_i915_gem_object *obj;
>> +    struct i915_vma *vma;
>> +    int err = 0;
>> +    u64 expected_vma_size, expected_node_size;
>> +
>> +    obj = i915_gem_object_create_region(mr, size, 0, 0);
>> +    if (IS_ERR(obj))
>> +        return PTR_ERR(obj);
>> +
>> +    vma = i915_vma_instance(obj, vm, NULL);
>> +    if (IS_ERR(vma)) {
>> +        err = PTR_ERR(vma);
>> +        goto err_put;
>> +    }
>> +
>> +    err = i915_vma_pin(vma, 0, 0, addr | flags);
>> +    if (err)
>> +        goto err_put;
>> +    i915_vma_unpin(vma);
>> +
>> +    if (!drm_mm_node_allocated(&vma->node)) {
>> +        err = -EINVAL;
>> +        goto err_put;
>> +    }
>> +
>> +    if (i915_vma_misplaced(vma, 0, 0, addr | flags)) {
>> +        err = -EINVAL;
>> +        goto err_put;
>> +    }
>> +
>> +    expected_vma_size = round_up(size, 1 << 
>> (ffs(vma->resource->page_sizes_gtt) - 1));
>> +    expected_node_size = expected_vma_size;
>> +
>> +    if (IS_DG2(vm->i915) && i915_gem_object_is_lmem(obj)) {
>> +        /* dg2 should expand lmem node to 2MB */
> 
> Should this test be NEEDS_COMPACT_PT()?
> 
> Otherwise LGTM. Reviewed-by: Thomas Hellström 
> <thomas.hellstrom@linux.intel.com>
Thanks. Good catch, forgot to retrofit the new macro here.
> 
> 
