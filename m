Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E01A64EFC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 13:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70B810E10D;
	Mon, 17 Mar 2025 12:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Uz/UiIyv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0FD10E10D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 12:34:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742214850; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=I9pUAZdiFLI//cH52Kqfo4rvkjMEg30CtBXrYGx4wuc1IFEvEPlTwnjbPJ6fXHSfsIpoZkYbUk9LtXDdxMnGOdosi7BhaD84CuzfSmYu591x20rbmpt4s/MOrmQuFsvBCmlN9t7bwZJOf/pyxqiDq+bTXIn90V4XaM4uUqkipFI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742214850;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RuuepCErqz74J7Vm8iCfe3Wt490fynlSOHzqHACM1Y8=; 
 b=oFtwzOs6mhMZ7S/APOHrYtIzMZL4zclTAxBRnjuRXOAVNGtR0STk4npAuO8vjH9rMScCHoQiusErzEx19JMvHKdGC+wW7DqGif9HaKVMFDKyzMIQ9PfnTf1/fM1L+b7EwrKvTMxxPiXnTttFil2ehrbdI9oCI+VjJYIKIdka6C0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742214850; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=RuuepCErqz74J7Vm8iCfe3Wt490fynlSOHzqHACM1Y8=;
 b=Uz/UiIyv6UOLXZg+DdwwlT3M5ft8aH3HVKKtiUZsVSSwMuBu1ddFlfAlGPBn4B5u
 amuPqY0eRs/yhJNGMLTGi7Wy34Wbfyzj8qPh0Qj7eyUDuF8uRoEqqrjcFR7hW5gf3Qj
 VueQ/9UXKoCAgd1d4Dg+U2Mzph0ToyvHIOO8tMng=
Received: by mx.zohomail.com with SMTPS id 1742214847997718.7652866374787;
 Mon, 17 Mar 2025 05:34:07 -0700 (PDT)
Message-ID: <eabb2f2c-b193-4ddf-8a50-27952f37393d@collabora.com>
Date: Mon, 17 Mar 2025 09:34:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com,
 angelogioacchino.delregno@collabora.com
References: <20250314173858.212264-1-ariel.dalessandro@collabora.com>
 <20250314173858.212264-5-ariel.dalessandro@collabora.com>
 <20250315094338.5f402426@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250315094338.5f402426@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Boris,

On 3/15/25 5:43 AM, Boris Brezillon wrote:
> On Fri, 14 Mar 2025 14:38:56 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
>> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
>> Address Extension", which in Linux we've called "mali_lpae".
>>
>> This commit adds support for conditionally enabling AARCH64_4K page
>> table format. To achieve that, a "GPU optional quirks" field was added
>> to `struct panfrost_features` with the related flag.
>>
>> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
>> the HW_FEATURE_AARCH64_MMU feature flag present.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 136 +++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
>>   3 files changed, 177 insertions(+), 9 deletions(-)
[snip]
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> index 294f86b3c25e7..f24c23e1f67b8 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
>> @@ -26,6 +26,48 @@
>>   #define mmu_write(dev, reg, data) writel(data, dev->iomem + reg)
>>   #define mmu_read(dev, reg) readl(dev->iomem + reg)
>>   
[snip]
>>   u32 panfrost_mmu_as_get(struct panfrost_device *pfdev, struct panfrost_mmu *mmu)
>>   {
>>   	int as;
>> @@ -618,6 +720,18 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>>   	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(pfdev->features.mmu_features);
>>   	u32 pa_bits = GPU_MMU_FEATURES_PA_BITS(pfdev->features.mmu_features);
>>   	struct panfrost_mmu *mmu;
>> +	enum io_pgtable_fmt fmt;
>> +
>> +	if (pfdev->comp->gpu_quirks & BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE)) {
>> +		if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
>> +			dev_err_once(pfdev->dev,
>> +				     "AARCH64_4K page table not supported\n");
>> +			return ERR_PTR(-EINVAL);
>> +		}
>> +		fmt = ARM_64_LPAE_S1;
>> +	} else {
>> +		fmt = ARM_MALI_LPAE;
>> +	}
>>   
>>   	mmu = kzalloc(sizeof(*mmu), GFP_KERNEL);
>>   	if (!mmu)
>> @@ -642,16 +756,20 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>>   		.iommu_dev	= pfdev->dev,
>>   	};
>>   
>> -	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
>> -					      mmu);
>> -	if (!mmu->pgtbl_ops) {
>> -		kfree(mmu);
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> +	mmu->pgtbl_ops = alloc_io_pgtable_ops(fmt, &mmu->pgtbl_cfg, mmu);
>> +	if (!mmu->pgtbl_ops)
>> +		goto err_free_mmu;
>> +
>> +	if (panfrost_mmu_cfg_init(mmu, fmt))
>> +		goto err_free_mmu;
> 
> How about propagating the error returned by panfrost_mmu_cfg_init()
> instead of assuming it's always -EINVAL on failure? Oh, and you need to
> call free_io_pgtable_ops(), not just kfree().

Ah, totally, thanks for the heads up. Will fix in v3 right away.

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

