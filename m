Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9AA56AB5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 15:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B069110E059;
	Fri,  7 Mar 2025 14:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="H5qbbPjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD710E059
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 14:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1741358583; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H2fVjMOkffjiXvmG9xCg+vJ5+D2gXdLKyb+3nVIx0w7Y8oc/NQA+Npd4YdcAU2cjvYW9oayBTFAzGg6zemDQU+AbbTVcJM5UIGt/LwDUTVBifVBC08l3do0L9gw6S9P/Op5wFeiCpQvcsCOA3yZdjOXaRlpxqMmAaJMxHrrJcIw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1741358583;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CdJvEDvfRKKZ2s8djvWjkSeJlfVd33yZekSI5wpoUVk=; 
 b=Dz090sNog6EqHV8IaoNTUYJKv0JBoUOGmWYUmzITILdLgQLtzf4dbVz6hnrBnuzfZePfFWi+Uv/cDKvL7APjWgB5Egx7eb+Ck7rgZXu01yCBZnV/i9rdXOPZ7BBxm/zQGgudDy9uhMnMsGZScrckNFGm0RH5SeerOgewitqRuUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741358583; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CdJvEDvfRKKZ2s8djvWjkSeJlfVd33yZekSI5wpoUVk=;
 b=H5qbbPjtjkWxP1tT0TTm2M2feba/uGdT1fZWNQK3uC1iJMkfsdR3R3R6dY24QyF2
 vl5lPEZiHaum/w20nvD7KzwRC2aFM0WJOueqKR+hhdp9IMIw+S8FNxSOm9zOU1KxkXe
 4Tc7WB4wPQn483lML/NIH98xhfcmeBWwnsk0ILcU=
Received: by mx.zohomail.com with SMTPS id 1741358581890942.2723624374091;
 Fri, 7 Mar 2025 06:43:01 -0800 (PST)
Message-ID: <46456505-0267-4274-a8e4-35c6ece420e5@collabora.com>
Date: Fri, 7 Mar 2025 11:42:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] drm/panfrost: Support ARM_64_LPAE_S1 page table
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250226183043.140773-1-ariel.dalessandro@collabora.com>
 <20250226183043.140773-4-ariel.dalessandro@collabora.com>
 <20250227093030.1a45b4b7@collabora.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250227093030.1a45b4b7@collabora.com>
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

On 2/27/25 5:30 AM, Boris Brezillon wrote:
> On Wed, 26 Feb 2025 15:30:42 -0300
> Ariel D'Alessandro <ariel.dalessandro@collabora.com> wrote:
> 
>> Bifrost MMUs support AArch64 4kB granule specification. However,
>> panfrost only enables MMU in legacy mode, despite the presence of the
>> HW_FEATURE_AARCH64_MMU feature flag.
>>
>> This commit adds support to use page tables according to AArch64 4kB
>> granule specification. This feature is enabled conditionally based on
>> the GPU model's HW_FEATURE_AARCH64_MMU feature flag.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h |   1 +
>>   drivers/gpu/drm/panfrost/panfrost_mmu.c    | 118 +++++++++++++++++----
>>   drivers/gpu/drm/panfrost/panfrost_regs.h   |  29 +++++
>>   3 files changed, 128 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index cffcb0ac7c11..dea252f43c58 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -153,6 +153,7 @@ struct panfrost_device {
>>   };
>>   
>>   struct panfrost_mmu {
>> +	void (*enable)(struct panfrost_device *pfdev, struct panfrost_mmu *mmu);
> 
> The enable sequence is the same, it's just the transtab, memattr and
> transcfg values that differ depending on the format, so let's prepare
> them at panfrost_mmu init time, and cache them here.

Agreed. AFAICS, this would be:

Add the following to struct panfrost_mmu:

struct {
	u64 transtab;
	u64 memattr;
	u64 transcfg;
} cfg;

and have it initialized in panfrost_mmu_ctx_create().

For consistency, we should do this for both modes MALI_LPAE and 
AARCH64_4K. As for the MALI_LPAE case, I'd move out the initialization 
done in drivers/iommu/io-pgtable-arm.c for:

struct {
	u64     transtab;
	u64     memattr;
} arm_mali_lpae_cfg;

I'll send a proposal for this in the next patchset v1.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

