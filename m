Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436418ACA0F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 11:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424B710ED21;
	Mon, 22 Apr 2024 09:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mXEcuQhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F110ED21
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bu+0NKuRp9uzW+qnrJdS1u2QBDEd8WKVp7NMnJWojrc=; b=mXEcuQhl8EvKUUNESPQdE5fj7b
 ZaEAAHVGUG2+twN7+oc6j6lektamT5wfzABhq9LVkcvcgPDQIU4yJerPeScLEnn2V9MIh6TmNihkj
 1rtIuRQkr2vynCgscQfE0x6PfiBHxsygw7+uDN4bc0zvvCBMYMiuRE2O46QAMcWmcCFiGffFe9zQs
 VSljh5dpTI+bNPPwD7wzGD9QXnC0/HTr/UbcU+Zo0tf6/fFrQIF37XuFKenA3fqpcb3q1ZA64yUXd
 dw3tfghhmTbf/ElEiHveU88RQySq730yge1HI0bINeE1+hS/cgGZAACAxWZP+2mOGoL3448bKvldx
 OQCFm6Yw==;
Received: from [84.65.0.132] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ryqSR-007ClM-5r; Mon, 22 Apr 2024 11:59:31 +0200
Message-ID: <c98ce0d7-fc3a-45d8-a085-05c5ab2a1997@igalia.com>
Date: Mon, 22 Apr 2024 10:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] drm/v3d: Support Big/Super Pages when writing out
 PTEs
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240421215309.660018-1-mcanal@igalia.com>
 <20240421215309.660018-7-mcanal@igalia.com>
 <9f8b9441-4486-4676-b409-e756e3fd7c93@igalia.com>
In-Reply-To: <9f8b9441-4486-4676-b409-e756e3fd7c93@igalia.com>
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


On 22/04/2024 10:57, Tvrtko Ursulin wrote:
> 
> On 21/04/2024 22:44, Maíra Canal wrote:
>> The V3D MMU also supports 64KB and 1MB pages, called big and super pages,
>> respectively. In order to set a 64KB page or 1MB page in the MMU, we need
>> to make sure that page table entries for all 4KB pages within a big/super
>> page must be correctly configured.
>>
>> In order to create a big/super page, we need a contiguous memory region.
>> That's why we use a separate mountpoint with THP enabled. In order to
>> place the page table entries in the MMU, we iterate over the 16 4KB pages
>> (for big pages) or 256 4KB pages (for super pages) and insert the PTE.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.h |  1 +
>>   drivers/gpu/drm/v3d/v3d_mmu.c | 52 ++++++++++++++++++++++++++---------
>>   2 files changed, 40 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h 
>> b/drivers/gpu/drm/v3d/v3d_drv.h
>> index 17236ee23490..79d8a1a059aa 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -18,6 +18,7 @@ struct platform_device;
>>   struct reset_control;
>>   #define V3D_MMU_PAGE_SHIFT 12
>> +#define V3D_PAGE_FACTOR (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT)
>>   #define V3D_MAX_QUEUES (V3D_CPU + 1)
>> diff --git a/drivers/gpu/drm/v3d/v3d_mmu.c 
>> b/drivers/gpu/drm/v3d/v3d_mmu.c
>> index 14f3af40d6f6..2e0b31e373b2 100644
>> --- a/drivers/gpu/drm/v3d/v3d_mmu.c
>> +++ b/drivers/gpu/drm/v3d/v3d_mmu.c
>> @@ -25,9 +25,16 @@
>>    * superpage bit set.
>>    */
>>   #define V3D_PTE_SUPERPAGE BIT(31)
>> +#define V3D_PTE_BIGPAGE BIT(30)
>>   #define V3D_PTE_WRITEABLE BIT(29)
>>   #define V3D_PTE_VALID BIT(28)
>> +static bool v3d_mmu_is_aligned(u32 page, u32 page_address, size_t 
>> alignment)
>> +{
>> +    return IS_ALIGNED(page, alignment >> V3D_MMU_PAGE_SHIFT) &&
>> +        IS_ALIGNED(page_address, alignment >> V3D_MMU_PAGE_SHIFT);
>> +}
>> +
>>   static int v3d_mmu_flush_all(struct v3d_dev *v3d)
>>   {
>>       int ret;
>> @@ -87,19 +94,38 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo)
>>       struct drm_gem_shmem_object *shmem_obj = &bo->base;
>>       struct v3d_dev *v3d = to_v3d_dev(shmem_obj->base.dev);
>>       u32 page = bo->node.start;
>> -    u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
>> -    struct sg_dma_page_iter dma_iter;
>> -
>> -    for_each_sgtable_dma_page(shmem_obj->sgt, &dma_iter, 0) {
>> -        dma_addr_t dma_addr = sg_page_iter_dma_address(&dma_iter);
>> -        u32 page_address = dma_addr >> V3D_MMU_PAGE_SHIFT;
>> -        u32 pte = page_prot | page_address;
>> -        u32 i;
>> -
>> -        BUG_ON(page_address + (PAGE_SIZE >> V3D_MMU_PAGE_SHIFT) >=
>> -               BIT(24));
>> -        for (i = 0; i < PAGE_SIZE >> V3D_MMU_PAGE_SHIFT; i++)
>> -            v3d->pt[page++] = pte + i;
>> +    struct scatterlist *sgl;
>> +    unsigned int count;
>> +
>> +    for_each_sgtable_dma_sg(shmem_obj->sgt, sgl, count) {
>> +        dma_addr_t dma_addr = sg_dma_address(sgl);
>> +        u32 pfn = dma_addr >> V3D_MMU_PAGE_SHIFT;
>> +        unsigned int len = sg_dma_len(sgl);
>> +
>> +        while (len > 0) {
>> +            u32 page_prot = V3D_PTE_WRITEABLE | V3D_PTE_VALID;
>> +            u32 page_address = page_prot | pfn;
>> +            unsigned int i, page_size;
>> +
>> +            BUG_ON(pfn + V3D_PAGE_FACTOR >= BIT(24));
>> +
>> +            if (len >= SZ_1M && v3d_mmu_is_aligned(page, 
>> page_address, SZ_1M)) {
>> +                page_size = SZ_1M;
>> +                page_address |= V3D_PTE_SUPERPAGE;
>> +            } else if (len >= SZ_64K && v3d_mmu_is_aligned(page, 
>> page_address, SZ_64K)) {
>> +                page_size = SZ_64K;
>> +                page_address |= V3D_PTE_BIGPAGE;
>> +            } else {
>> +                page_size = SZ_4K;
>> +            }
>> +
>> +            for (i = 0; i < page_size >> V3D_MMU_PAGE_SHIFT; i++) {
>> +                v3d->pt[page++] = page_address + i;
>> +                pfn++;
>> +            }
>> +
>> +            len -= page_size;
>> +        }
>>       }
>>       WARN_ON_ONCE(page - bo->node.start !=
> 
> It looks correct to me.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Ooops muscle memory strikes again! I guess reviewing patches for 10+ 
years can do that.. :)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
