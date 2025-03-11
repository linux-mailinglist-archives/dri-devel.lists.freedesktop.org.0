Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB87DA5BBD0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB3210E13A;
	Tue, 11 Mar 2025 09:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="M/re1CNF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F9A10E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741684485;
 bh=krh3Xo5+e4+66cDwA1x9mFLk+qlGz6xj0D6Py+bTdGM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M/re1CNFx5F+jw5e7H70TQm+ufe0OmJINW10yJMxMNdQd6dei7Wi3SIjNXfFULUHE
 NmrQ/FsZDckcUX5QOMTs7NrkQpqnj9eMvf+7EReGAe23ywcw0imqF4Yyfu6+6r397I
 vAPDO15efrbNI5y9CeSzoTOH6uJ0X6lEOHZXs4QyP/6o0AnfbOfGrz8OozhjbJAEHg
 zyqPmX8vPPf0JIWiUejsZ6MCR1MjJkn75+AB9ziSX/VXe822CHdSJcVvoU/e6LzCHm
 tdsBSLjxPLHv5RsbL/RIMNBzaHIyAAJDZpvmWpic1fH4ECcYZY5nHB4eViVua5/5zg
 RSzx2HorV+WuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id ABF4017E0B25;
 Tue, 11 Mar 2025 10:14:44 +0100 (CET)
Message-ID: <16f6a6e2-4dce-4af9-bc0a-61c4d6213f02@collabora.com>
Date: Tue, 11 Mar 2025 10:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] drm/panfrost: Add support for AARCH64_4K page
 table format
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sjoerd@collabora.com
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
 <20250310195921.157511-5-ariel.dalessandro@collabora.com>
 <20250311090545.3b941567@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250311090545.3b941567@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Il 11/03/25 09:05, Boris Brezillon ha scritto:
> On Mon, 10 Mar 2025 16:59:19 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Currently, Panfrost only supports MMU configuration in "LEGACY" (as
>> Bifrost calls it) mode, a (modified) version of LPAE "Large Physical
>> Address Extension", which in Linux we've called "mali_lpae".
>>
>> This commit adds support for conditionally enabling AARCH64_4K page
>> table format. To achieve that, a "GPU optional configurations" field was
>> added to `struct panfrost_features` with the related flag.
>>
>> Note that, in order to enable AARCH64_4K mode, the GPU variant must have
>> the HW_FEATURE_AARCH64_MMU feature flag present.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |  16 +++
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 132 +++++++++++++++++++--
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  34 ++++++
>>   3 files changed, 169 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index cffcb0ac7c111..0385702aa43c7 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -42,6 +42,14 @@ enum panfrost_gpu_pm {
>>   	GPU_PM_VREG_OFF,
>>   };
>>   
>> +/**
>> + * enum panfrost_gpu_config - GPU optional configurations
>> + * @GPU_CONFIG_AARCH64_4K: Use AARCH64_4K page table format
>> + */
>> +enum panfrost_gpu_config {
>> +	GPU_CONFIG_AARCH64_4K,
>> +};
>> +
>>   struct panfrost_features {
>>   	u16 id;
>>   	u16 revision;
>> @@ -95,6 +103,9 @@ struct panfrost_compatible {
>>   
>>   	/* Allowed PM features */
>>   	u8 pm_features;
>> +
>> +	/* GPU features */
>> +	u8 gpu_configs;
> 
> I would probably name this gpu_quirks, with the GPU_CONFIG_AARCH64_4K
> flag renamed GPU_QUIRK_FORCE_AARCH64_PAGE_TABLE.
> 

Boris, at this point the quirk should be LPAE, not AARCH64_4K, because the
former is legacy...

I think that Ariel is right in this, as in, that's a capability of the GPU
MMU, so if anything I would rather rename it to gpu_capabilities, but then
that'd be confusing for other stuff - which means that gpu_configs is most
probably the least confusing and/or most appropriate name for this.

Of course, just IMO.

Cheers,
Angelo

>>   };
>>   

