Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA01A59A0F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 16:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA2110E434;
	Mon, 10 Mar 2025 15:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="QAvzpGjK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553B910E434
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 15:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741620879; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DzrekeHXCnD07yLLuY9kF+sth2UjlCNk1s4871aVms+4GuRthn3JEvdxKgxfzhK86oZN9tYQfOOr1lctAG3C8BXNlGtD/0PXLonNfc5Re6jMkXHSZA5dfp1EK296TxYgR8SVRuzm2uTXGyD8M17dNwdLazp0DE4vUNn0vOE3ToM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741620879;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fKGYjqu4Ev4SqaAEdORO3V9LqmGHctq0CSPM/977IfQ=; 
 b=NmOrwpT6AAtoZP/TrXyYOBgChsgLjxIZSqYOTj2kLm8PrTfQoFNQMDecXKoKob5fLRfl//k6lsMrc7zwohpl7RrCCE6Spdbv/8RN32yI04udiOTGDWTNocaVnmOr4f1Cow9NajLBj2MGjtCHkkyrCrYzHRprOcleMUyJ8ecC9vA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741620879; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fKGYjqu4Ev4SqaAEdORO3V9LqmGHctq0CSPM/977IfQ=;
 b=QAvzpGjK9VnN7UqGBMBTo+N83eYP0pmKLVdfSpxGEldWGMlefXxFCAdtRaa/uv7j
 n/QO+HCaIe+qZhGDy/ljjHKyoVgrv0e9G47YaMSVGKg24OBWLRHicomssfyk9qT9+7T
 lHsYJ6dz1rt9hmjwuFZfgnPR2TGdg+m8JGmt9tSM=
Received: by mx.zohomail.com with SMTPS id 1741620876294195.17720317390024;
 Mon, 10 Mar 2025 08:34:36 -0700 (PDT)
Message-ID: <ec151d39-2cb2-4f67-a23a-dafc421fff75@collabora.com>
Date: Mon, 10 Mar 2025 12:34:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-4-ariel.dalessandro@collabora.com>
 <20250227155539.59944e18@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250227155539.59944e18@collabora.com>
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

Hi Boris,

On 2/27/25 11:55 AM, Boris Brezillon wrote:
> On Wed, 26 Feb 2025 15:30:42 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> @@ -642,8 +713,15 @@ struct panfrost_mmu *panfrost_mmu_ctx_create(struct panfrost_device *pfdev)
>>   		.iommu_dev	= pfdev->dev,
>>   	};
>>   
>> -	mmu->pgtbl_ops = alloc_io_pgtable_ops(ARM_MALI_LPAE, &mmu->pgtbl_cfg,
>> -					      mmu);
>> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_AARCH64_MMU)) {
>> +		fmt = ARM_64_LPAE_S1;
>> +		mmu->enable = mmu_lpae_s1_enable;
>> +	} else {
>> +		fmt = ARM_MALI_LPAE;
>> +		mmu->enable = mmu_mali_lpae_enable;
>> +	}
> 
> How about we stick to the legacy pgtable format for all currently
> supported GPUs, and make this an opt-in property attached to the
> compatible. This way, we can progressively move away from the legacy
> format once enough testing has been done, while allowing support for
> GPUs that can't use the old format because the cachability/shareability
> configuration is too limited.

Indeed, that's a better way to go.

Specifically, what you mean is: keep the same compatible string and add 
a new property to the `panfrost_compatible` private data for that 
specific variant? E.g.

In drivers/gpu/drm/panfrost/panfrost_drv.c:
```
struct panfrost_compatible mediatek_mt8188_data
[...]
{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
```

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

