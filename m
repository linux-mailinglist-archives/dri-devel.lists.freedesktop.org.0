Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA2F3FFD26
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 11:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4706E861;
	Fri,  3 Sep 2021 09:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAF116E861
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 09:31:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1E5B1FB;
 Fri,  3 Sep 2021 02:31:09 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B18ED3F694;
 Fri,  3 Sep 2021 02:31:08 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Calculate lock region size correctly
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210902140038.221437-1-steven.price@arm.com>
 <20210903105122.76471f98@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3ba07c72-2ec8-1b2d-e089-3d8b0eb25d73@arm.com>
Date: Fri, 3 Sep 2021 10:31:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903105122.76471f98@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 03/09/2021 09:51, Boris Brezillon wrote:
> On Thu,  2 Sep 2021 15:00:38 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> It turns out that when locking a region, the region must be a naturally
>> aligned power of 2. The upshot of this is that if the desired region
>> crosses a 'large boundary' the region size must be increased
>> significantly to ensure that the locked region completely covers the
>> desired region. Previous calculations (including in kbase for the
>> proprietary driver) failed to take this into account.
>>
>> Since it's known that the lock region must be naturally aligned we can
>> compute the required size by looking at the highest bit position which
>> changes between the start/end of the lock region (subtracting 1 from the
>> end because the end address is exclusive). The start address is then
>> aligned based on the size (this is technically unnecessary as the
>> hardware will ignore these bits, but the spec advises to do this "to
>> avoid confusion").
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> See previous discussion[1] for more details. This bug also existed in
>> the 'kbase' driver, so it's unlikely to actually hit very often.
>>
>> This patch is based on drm-misc-next-fixes as it builds on top of
>> Alyssa's changes to lock_region.
>>
>> [1] https://lore.kernel.org/dri-devel/6fe675c4-d22b-22da-ba3c-f6d33419b9ed@arm.com/
>>
>>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 33 +++++++++++++++++++------
>>  1 file changed, 26 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index dfe5f1d29763..afec15bb3db5 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -58,17 +58,36 @@ static int write_cmd(struct panfrost_device *pfdev, u32 as_nr, u32 cmd)
>>  }
>>  
>>  static void lock_region(struct panfrost_device *pfdev, u32 as_nr,
>> -			u64 iova, u64 size)
>> +			u64 region_start, u64 size)
>>  {
>>  	u8 region_width;
>> -	u64 region = iova & PAGE_MASK;
>> +	u64 region;
>> +	u64 region_size;
>> +	u64 region_end = region_start + size;
>>  
>> -	/* The size is encoded as ceil(log2) minus(1), which may be calculated
>> -	 * with fls. The size must be clamped to hardware bounds.
>> +	if (!size)
>> +		return;
>> +
>> +	/*
>> +	 * The locked region is a naturally aligned power of 2 block encoded as
>> +	 * log2 minus(1).
>> +	 * Calculate the desired start/end and look for the highest bit which
>> +	 * differs. The smallest naturally aligned block must include this bit
>> +	 * change the desired region starts with this bit (and subsequent bits)
>> +	 * zeroed and ends with the bit (and subsequent bits) set to one.
>> +	 *
> 
> Nit: you can drop the empty comment line.

Whoops - I reordered this comment and didn't spot the blank line getting
left.

>>  	 */
>> -	size = max_t(u64, size, AS_LOCK_REGION_MIN_SIZE);
>> -	region_width = fls64(size - 1) - 1;
>> -	region |= region_width;
>> +	region_size = region_start ^ (region_end - 1);
> 
> Hm, is region_size really encoding the size of the region to lock? I
> mean, the logic seems correct but I wonder if it wouldn't be better to
> drop the region_size variable and inline
> 'region_start ^ (region_end - 1)' in the region_width calculation to
> avoid confusion.

Yeah I wasn't happy about the variable name either, but I couldn't think
of a better one. Inlining it into the following line nicely avoids the
problem ;)

> Looks good otherwise.
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Thanks, I'll post a v2 in case anyone else has other comments.

Steve

>> +	region_width = max(fls64(region_size),
>> +			   const_ilog2(AS_LOCK_REGION_MIN_SIZE)) - 1;
>> +
>> +	/*
>> +	 * Mask off the low bits of region_start (which would be ignored by
>> +	 * the hardware anyway)
>> +	 */
>> +	region_start &= GENMASK_ULL(63, region_width);
>> +
>> +	region = region_width | region_start;
>>  
>>  	/* Lock the region that needs to be updated */
>>  	mmu_write(pfdev, AS_LOCKADDR_LO(as_nr), region & 0xFFFFFFFFUL);
> 

