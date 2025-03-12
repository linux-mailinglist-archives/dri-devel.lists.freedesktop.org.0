Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EDA5E3A1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 19:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A3B10E0CC;
	Wed, 12 Mar 2025 18:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="S0ktZkoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4922A10E0CC
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 18:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741804103; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AuTl1uQ1Lgw0UYkKaUhCzMG5g/ayLnb1NnDhMnl4VY7GzGvAfDqWhUfEKGxhpbnPq3kVsMFuCT1Ab94ugojneIxMujXfCj0XtFTZcu0Y6Swcpc9zXbRbWHSQCL5qfecC9c97+WXQ/U1bzhEnJNJBox33cE3S8EFQm2KKcyLwgN4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741804103;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=So2DwX+qeOx/ayzmUN8pjesq547zGA2gdrPnOyqFs1I=; 
 b=nq6SPOwFZk/fAB2TwrZ/iWsnbMXqKQlgynsUY8FKKVcdUPnRhwgPlibU5rfSVHKOjJw6yGUpu1eBbtmrzAwDzGdv+VWgydHZFlsovhocRGKyJUm4BAeSYeziS0pxwdjoqhUvcNwRNnsYe2z6V9ZRHofgOHs9NdjC7Vq02cQKpks=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741804103; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=So2DwX+qeOx/ayzmUN8pjesq547zGA2gdrPnOyqFs1I=;
 b=S0ktZkoZPBXkSycwes9V0xyCbmuK9LmlX+KEo4s+v8UkhqGeohyiWJQJCj1A1/sp
 5wwb3018w3YioS6iDpvnwXDdXsGNah+nJvSoc5dhNn4tWDfjViztgLGorLgMHT7ltAO
 74pdwclJTmwlVaU6AzU5UT33KeLGmaYkrKX2OWc4=
Received: by mx.zohomail.com with SMTPS id 174180410138425.066715854452468;
 Wed, 12 Mar 2025 11:28:21 -0700 (PDT)
Message-ID: <2a6eb940-95b3-4105-8998-5ec190ddaca3@collabora.com>
Date: Wed, 12 Mar 2025 15:28:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Boris Brezillon <boris.brezillon@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-5-ariel.dalessandro@collabora.com>
 <20250311090545.3b941567@collabora.com>
 <16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
 <20250311110520.6b79e090@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250311110520.6b79e090@collabora.com>
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

Boris, Angelo,

On 3/11/25 7:05 AM, Boris Brezillon wrote:
> On Tue, 11 Mar 2025 10:14:44 +0100
> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> wrote:
> 
>> Il 11/03/25 09:05, Boris Brezillon ha scritto:
>>> On Mon, 10 Mar 2025 16:59:19 -0300
>>> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
>>>    
>>>> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
>>>> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
>>>> Address Extension", which in Linux we've called "mali_lpae".
>>>>
>>>> This commit adds support for conditionally enabling AARCH64_4K page
>>>> table format. To achieve that, a "GPU optional configurations" field was
>>>> added to `struct panfrost_features` with the related flag.
>>>>
>>>> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
>>>> the HW_FEATURE_AARCH64_MMU feature flag present.
>>>>
>>>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>>> ---
>>>>    drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>>>    drivers/gpu/drm/panfrost/panfrost_mmu.c    | 132 +++++++++++++++++++--
>>>>    drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
>>>>    3 files changed, 169 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>>>> index cffcb0ac7c111..0385702aa43c7 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>>> @@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
>>>>    	GPU_PM_VREG_OFF,
>>>>    };
>>>>    
>>>> +/**
>>>> + * enum panfrost_gpu_config - GPU optional configurations
>>>> + * @GPU_CONFIG_AARCH64_4K: Use AARCH64_4K page table format
>>>> + */
>>>> +enum panfrost_gpu_config {
>>>> +	GPU_CONFIG_AARCH64_4K,
>>>> +};
>>>> +
>>>>    struct panfrost_features {
>>>>    	u16 id;
>>>>    	u16 revision;
>>>> @@ -95,6 +103,9 @@ struct panfrost_compatible {
>>>>    
>>>>    	/* Allowed PM features */
>>>>    	u8 pm_features;
>>>> +
>>>> +	/* GPU features */
>>>> +	u8 gpu_configs;
>>>
>>> I would probably name this gpu_quirks, with the GPU_CONFIG_AARCH64_4K
>>> flag renamed GPU_QUIRK_FORCE_AARCH64_PAGE_TABLE.
>>>    
>>
>> Boris, at this point the quirk should be LPAE, not AARCH64_4K, because the
>> former is legacy...
> 
> It's legacy, but it's also the default in this driver. And just because
> it's legacy doesn't mean it's broken :P. As Steve mentioned, there are
> perf considerations to take into account, and on some platforms (most?),
> it's preferable to use the legacy format because of that.
> 
>>
>> I think that Ariel is right in this, as in, that's a capability of the GPU
>> MMU, so if anything I would rather rename it to gpu_capabilities,
> 
> No, GPU capabilities are extracted from he GPU ID, and all Bifrost GPUs
> support the aarch64 page table format. But what matters here is GPUs
> that can't use the legacy page table format because it's to limited to
> express the cacheability/shareability properties.
> 
>> but then
>> that'd be confusing for other stuff - which means that gpu_configs is most
>> probably the least confusing and/or most appropriate name for this.
> 
> Again, it's not a random configuration decision, it's something we do
> because the default (legacy page table format) doesn't work, so I keep
> thinking quirk is an appropriate name in this context.

Adding my humble bits here :)

I'm not sure if it's preferable to use legacy mode, but can't prove the 
opposite without a proper profiling. As legacy is the default at the 
moment in panfrost, I think it makes sense to explicitly add _FORCE_ to 
the flag name.

Agreed that it's not a capability/feature, rather a config/quirk. Don't 
really have a strong opinion here, so I'll just stick to Boris criteria 
here, and name it as quirks. Will change it in v2.

Just a side note, in the context of panfrost we already have a 
`vendor_quirk` function. Alhough I understand it's vendor-specific, to 
avoid confusions, would it be okay to add another quirk related field as 
we're proposing here?

     struct panfrost_compatible {
         [...]
         /* Vendor implementation quirks callback */
         void (*vendor_quirk)(struct panfrost_device *pfdev);
         [...]
         u8 gpu_quirks;

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

