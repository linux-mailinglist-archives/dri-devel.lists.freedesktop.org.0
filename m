Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169F7395B15
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 15:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D5C6E4A5;
	Mon, 31 May 2021 13:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B68A6E4A5;
 Mon, 31 May 2021 13:08:47 +0000 (UTC)
IronPort-SDR: aI7x+BjxHJm/COTvhiMe4oRelM8vfRDnxT3qUyiw7Ggi0ArMYCmMWIgjvg17FsQNnl+g6Xe2tj
 yumA77tnABSg==
X-IronPort-AV: E=McAfee;i="6200,9189,10000"; a="183712700"
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="183712700"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 06:08:13 -0700
IronPort-SDR: KfxgsW4nPh9EaThoSK/+Wl1o992BMajCelKM54sJiC+nJAD+aNwG/yL+HsfmSqsLCoZCPU7fnl
 GXnfyDBuAEtA==
X-IronPort-AV: E=Sophos;i="5.83,237,1616482800"; d="scan'208";a="437722703"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO [10.249.254.133])
 ([10.249.254.133])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2021 06:08:11 -0700
Subject: Re: [PATCH v7 06/15] drm/ttm: Add a generic TTM memcpy move for
 page-based iomem
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
 <20210531121940.267032-7-thomas.hellstrom@linux.intel.com>
 <853edbe3-29c8-6178-af17-8d4c250e78e8@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0f9e66ba-cadd-c501-88f5-ba83f65c7416@linux.intel.com>
Date: Mon, 31 May 2021 15:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <853edbe3-29c8-6178-af17-8d4c250e78e8@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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


On 5/31/21 2:36 PM, Christian König wrote:
> Am 31.05.21 um 14:19 schrieb Thomas Hellström:
>> The internal ttm_bo_util memcpy uses ioremap functionality, and while it
>> probably might be possible to use it for copying in- and out of
>> sglist represented io memory, using io_mem_reserve() / io_mem_free()
>> callbacks, that would cause problems with fault().
>> Instead, implement a method mapping page-by-page using kmap_local()
>> semantics. As an additional benefit we then avoid the occasional global
>> TLB flushes of ioremap() and consuming ioremap space, elimination of a
>> critical point of failure and with a slight change of semantics we could
>> also push the memcpy out async for testing and async driver development
>> purposes.
>>
>> A special linear iomem iterator is introduced internally to mimic the
>> old ioremap behaviour for code-paths that can't immediately be ported
>> over. This adds to the code size and should be considered a temporary
>> solution.
>>
>> Looking at the code we have a lot of checks for iomap tagged pointers.
>> Ideally we should extend the core memremap functions to also accept
>> uncached memory and kmap_local functionality. Then we could strip a
>> lot of code.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> v3:
>> - Split up in various TTM files and addressed review comments by
>>    Christian König. Tested and fixed legacy iomap memcpy path on i915.
>> v4:
>> - Fix an uninitialized variable
>>    Reported by: kernel test robot <lkp@intel.com>
>>    Reported by: Dan Carpenter <dan.carpenter@oracle.com>
>> - Minor change to the ttm_move_memcpy() interface.
>> - Gracefully handle lack of memremap() support on memcpy
>>    (Reported by Matthew Auld)
>> - Minor style fix (Reported by Matthew Auld)
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo_util.c  | 280 ++++++++++-------------------
>>   drivers/gpu/drm/ttm/ttm_module.c   |  35 ++++
>>   drivers/gpu/drm/ttm/ttm_resource.c | 193 ++++++++++++++++++++
>>   drivers/gpu/drm/ttm/ttm_tt.c       |  42 +++++
>>   include/drm/ttm/ttm_bo_driver.h    |  28 +++
>>   include/drm/ttm/ttm_caching.h      |   2 +
>>   include/drm/ttm/ttm_kmap_iter.h    |  61 +++++++
>>   include/drm/ttm/ttm_resource.h     |  61 +++++++
>>   include/drm/ttm/ttm_tt.h           |  16 ++
>>   9 files changed, 536 insertions(+), 182 deletions(-)
>>   create mode 100644 include/drm/ttm/ttm_kmap_iter.h
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index ae8b61460724..6ac7744a1a5c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -72,190 +72,126 @@ void ttm_mem_io_free(struct ttm_device *bdev,
>>       mem->bus.addr = NULL;
>>   }
>>   -static int ttm_resource_ioremap(struct ttm_device *bdev,
>> -                   struct ttm_resource *mem,
>> -                   void **virtual)
>> +/**
>> + * ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
>> + * @bo: The struct ttm_buffer_object.
>> + * @new_mem: The struct ttm_resource we're moving to (copy 
>> destination).
>> + * @new_iter: A struct ttm_kmap_iter representing the destination 
>> resource.
>> + * @src_iter: A struct ttm_kmap_iter representing the source resource.
>> + *
>> + * This function is intended to be able to move out async under a
>> + * dma-fence if desired.
>> + */
>> +void ttm_move_memcpy(struct ttm_buffer_object *bo,
>> +             pgoff_t num_pages,
>
> Can we switch to uint32_t for num_pages for TTM in general?
>
> That allows to copy 16TiB when you have 4KiB pages which should be 
> enough for quite a while and I had some really bad bugs because people 
> tend to do << PAGE_SHIFT and forget that it is only 32bit sometimes.

I can do that, although IIRC we've had some discussions internally that 
16TiB isn't enough for our bos in general, so at some point a request 
from us might to be to see what we can do to bump that across TTM for 
64-bit?

Matthew, you looked at this a couple of weeks ago?


>
> Apart from that feel free to stick my rb on the patch.

Thanks!

/Thomas


>
> Christian.
>
