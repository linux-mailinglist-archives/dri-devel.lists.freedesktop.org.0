Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 862CA61FA7C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE5B10E4A7;
	Mon,  7 Nov 2022 16:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5561210E43E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:50:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5A371FB;
 Mon,  7 Nov 2022 08:50:50 -0800 (PST)
Received: from [10.57.36.87] (unknown [10.57.36.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 723293F534;
 Mon,  7 Nov 2022 08:50:43 -0800 (PST)
Message-ID: <26572537-a41f-6a95-1700-3643636f02a0@arm.com>
Date: Mon, 7 Nov 2022 16:50:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/panfrost: Update io-pgtable API
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com
References: <daef7f8c134d989c55636a5790d8c0fcaca1bae3.1661205687.git.robin.murphy@arm.com>
 <d2b1b693-7569-7f02-243f-570bf6790e4f@collabora.com>
 <37f1afec-628b-927f-006e-7dc11c0afd35@arm.com>
 <df8a6d56-823d-936a-1ce8-faed48c0e338@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <df8a6d56-823d-936a-1ce8-faed48c0e338@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 linux-arm-kernel@lists.infradead.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-11-04 20:48, Dmitry Osipenko wrote:
> On 11/4/22 23:37, Robin Murphy wrote:
>> On 2022-11-04 20:11, Dmitry Osipenko wrote:
>>> On 8/23/22 01:01, Robin Murphy wrote:
>>>> Convert to io-pgtable's bulk {map,unmap}_pages() APIs, to help the old
>>>> single-page interfaces eventually go away. Unmapping heap BOs still
>>>> wants to be done a page at a time, but everything else can get the full
>>>> benefit of the more efficient interface.
>>>>
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>> ---
>>>>    drivers/gpu/drm/panfrost/panfrost_mmu.c | 40 +++++++++++++++----------
>>>>    1 file changed, 25 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>>> b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>>> index b285a8001b1d..e246d914e7f6 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>>>> @@ -248,11 +248,15 @@ void panfrost_mmu_reset(struct panfrost_device
>>>> *pfdev)
>>>>        mmu_write(pfdev, MMU_INT_MASK, ~0);
>>>>    }
>>>>    -static size_t get_pgsize(u64 addr, size_t size)
>>>> +static size_t get_pgsize(u64 addr, size_t size, size_t *count)
>>>>    {
>>>> -    if (addr & (SZ_2M - 1) || size < SZ_2M)
>>>> -        return SZ_4K;
>>>> +    size_t blk_offset = -addr % SZ_2M;
>>>>    +    if (blk_offset || size < SZ_2M) {
>>>> +        *count = min_not_zero(blk_offset, size) / SZ_4K;
>>>> +        return SZ_4K;
>>>> +    }
>>>> +    *count = size / SZ_2M;
>>>>        return SZ_2M;
>>>>    }
>>>>    @@ -287,12 +291,16 @@ static int mmu_map_sg(struct panfrost_device
>>>> *pfdev, struct panfrost_mmu *mmu,
>>>>            dev_dbg(pfdev->dev, "map: as=%d, iova=%llx, paddr=%lx,
>>>> len=%zx", mmu->as, iova, paddr, len);
>>>>              while (len) {
>>>> -            size_t pgsize = get_pgsize(iova | paddr, len);
>>>> +            size_t pgcount, mapped = 0;
>>>> +            size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
>>>>    -            ops->map(ops, iova, paddr, pgsize, prot, GFP_KERNEL);
>>>> -            iova += pgsize;
>>>> -            paddr += pgsize;
>>>> -            len -= pgsize;
>>>> +            ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
>>>> +                       GFP_KERNEL, &mapped);
>>>> +            /* Don't get stuck if things have gone wrong */
>>>> +            mapped = max(mapped, pgsize);
>>>> +            iova += mapped;
>>>> +            paddr += mapped;
>>>> +            len -= mapped;
>>>>            }
>>>>        }
>>>>    @@ -344,15 +352,17 @@ void panfrost_mmu_unmap(struct
>>>> panfrost_gem_mapping *mapping)
>>>>            mapping->mmu->as, iova, len);
>>>>          while (unmapped_len < len) {
>>>> -        size_t unmapped_page;
>>>> -        size_t pgsize = get_pgsize(iova, len - unmapped_len);
>>>> +        size_t unmapped_page, pgcount;
>>>> +        size_t pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
>>>>    -        if (ops->iova_to_phys(ops, iova)) {
>>>> -            unmapped_page = ops->unmap(ops, iova, pgsize, NULL);
>>>> -            WARN_ON(unmapped_page != pgsize);
>>>> +        if (bo->is_heap)
>>>> +            pgcount = 1;
>>>> +        if (!bo->is_heap || ops->iova_to_phys(ops, iova)) {
>>>> +            unmapped_page = ops->unmap_pages(ops, iova, pgsize,
>>>> pgcount, NULL);
>>>> +            WARN_ON(unmapped_page != pgsize * pgcount);
>>>
>>> This patch causes this WARN_ON to trigger. It doesn't happen all the
>>> time, I see that the whole unmapped area is mapped. Initially, I thought
>>> that this happens because it tries to unmap a partially mapped range,
>>> but I checked that ops->iova_to_phys() returns address for all 4k chunks.
>>>
>>> For example the pgsize * pgcount = 0x8000000, while returned
>>> unmapped_page = 0x6000000.
>>>
>>> I don't see this problem with this patch reverted. This is using today's
>>> linux-next. Any ideas?
>>
>> What's the base IOVA in such a case? I'm wondering if the truncated size
>> lines up to any interesting boundary. Presumably you're not seeing any
>> additional warnings from io-pgtable itself?
> 
> No warnings from io-pgtable. It succeeds for 0x32000000 and fails for
> 0x3a000000 using same size 0x8000000. It actually fails only for the
> 0x3a000000 as far as I see from my logs. Perhaps it indeed has to do
> something with the boundary.

Bleh, indeed even though we don't use 1GB block mappings, we still need 
to split at 1GB boundaries to match what the IOMMU API will do, and thus 
what io-pgtable expects. I guess I hadn't really considered that we 
might ever have that much graphics memory in play at once...

The fix probably looks like this:

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c 
b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e246d914e7f6..6abc7d3726dd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -256,7 +256,9 @@ static size_t get_pgsize(u64 addr, size_t size, 
size_t *count)
  		*count = min_not_zero(blk_offset, size) / SZ_4K;
  		return SZ_4K;
  	}
-	*count = size / SZ_2M;
+
+	blk_offset = -addr % SZ_1G;
+	*count = min_not_zero(blk_offset, size) / SZ_2M;
  	return SZ_2M;
  }


Thanks,
Robin.
