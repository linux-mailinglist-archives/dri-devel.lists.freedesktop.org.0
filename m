Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCD128395E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 17:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C935589D4A;
	Mon,  5 Oct 2020 15:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43D4289D4A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 15:16:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 644E5113E;
 Mon,  5 Oct 2020 08:16:35 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE1EA3F70D;
 Mon,  5 Oct 2020 08:16:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Support coherency for Mali
 LPAE
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <cover.1600780574.git.robin.murphy@arm.com>
 <8df778355378127ea7eccc9521d6427e3e48d4f2.1600780574.git.robin.murphy@arm.com>
 <20201005165008.1f3b4e89@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <07c4b74f-c87b-092c-3fc7-c005c8c65206@arm.com>
Date: Mon, 5 Oct 2020 16:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005165008.1f3b4e89@collabora.com>
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, narmstrong@baylibre.com, khilman@baylibre.com,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 alyssa.rosenzweig@collabora.com, linux-amlogic@lists.infradead.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/10/2020 15:50, Boris Brezillon wrote:
> On Tue, 22 Sep 2020 15:16:48 +0100
> Robin Murphy <robin.murphy@arm.com> wrote:
> 
>> Midgard GPUs have ACE-Lite master interfaces which allows systems to
>> integrate them in an I/O-coherent manner. It seems that from the GPU's
>> viewpoint, the rest of the system is its outer shareable domain, and so
>> even when snoop signals are wired up, they are only emitted for outer
>> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
>> indeed get coherent pagetable walks working nicely for the coherent
>> T620 in the Arm Juno SoC.
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
>> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/io-pgtable-arm.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
>> index dc7bcf858b6d..b4072a18e45d 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -440,7 +440,13 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>>   				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>>   	}
>>   
>> -	if (prot & IOMMU_CACHE)
>> +	/*
>> +	 * Also Mali has its own notions of shareability wherein its Inner
>> +	 * domain covers the cores within the GPU, and its Outer domain is
>> +	 * "outside the GPU" (i.e. either the Inner or System domain in CPU
>> +	 * terms, depending on coherency).
>> +	 */
>> +	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
>>   		pte |= ARM_LPAE_PTE_SH_IS;
>>   	else
>>   		pte |= ARM_LPAE_PTE_SH_OS;
> 
> Actually, it still doesn't work on s922x :-/. For it to work I
> correctly, I need to drop the outer shareable flag here.

The logic here does seem a bit odd. Originally it was:

IOMMU_CACHE -> Inner shared (value 3)
!IOMMU_CACHE -> Outer shared (value 2)

For Mali we're forcing everything to the second option. But Mali being 
Mali doesn't do things the same as LPAE, so for Mali we have:

0 - not shared
1 - reserved
2 - inner(*) and outer shareable
3 - inner shareable only

(*) where "inner" means internal to the GPU, and "outer" means shared 
with the CPU "inner". Very confusing!

So originally we had:
IOMMU_CACHE -> not shared with CPU (only internally in the GPU)
!IOMMU_CACHE -> shared with CPU

The change above gets us to "always shared", dropping the SH_OS bit 
would get us to not even shareable between cores (which doesn't sound 
like what we want).

It's not at all clear to me why the change helps, but I suspect we want 
at least "inner" shareable.

Steve

>> @@ -1049,6 +1055,9 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>>   	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
>>   					  ARM_MALI_LPAE_TTBR_READ_INNER |
>>   					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
>> +	if (cfg->coherent_walk)
>> +		cfg->arm_mali_lpae_cfg.transtab |= ARM_MALI_LPAE_TTBR_SHARE_OUTER;
>> +
>>   	return &data->iop;
>>   
>>   out_free_data:
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
