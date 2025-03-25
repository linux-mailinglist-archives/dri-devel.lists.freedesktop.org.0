Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27598A70532
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7DA10E5A8;
	Tue, 25 Mar 2025 15:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJeXcHSK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CDA10E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742917012; x=1774453012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JS0SR8Trh+aDlhaT2AVLuKOGAByjQ2+2JpvpmcOFVAs=;
 b=nJeXcHSKmLCUvga+Eke8qsfBDJmuDqg1dlEVN6y+tLOSxbNxS3llrLPB
 dJ9TnWrktSs+9/8kpR3GARipRCzY9k1e/bt4pOSSBOMHhNW2RVqgYy0b3
 R77hcNPJWxRDamDrSuGahnu9GMaJ2ZVspMgnFuKYvhHuFg3fEbYmPIvmx
 8kxD1+g8+ISOZbd537pgnmMMNucIWEiHHTzo9dM5wZ6UKvcLF/NtUTicy
 fis5daVjoCmlxBlLv5TcyFFKx0wGFq7wYLMJcwUC6gKKy1bjJe6B5JdcQ
 deNrubfEjCMZTDtMGbO/fqvYrpaRdl5o25eQnzukfwGoc8elE9cfWxhgH w==;
X-CSE-ConnectionGUID: Cv5hrfPJRwqCYkDDEzlssA==
X-CSE-MsgGUID: rb2lidc/S0+Bon8g+jaULw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46909076"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="46909076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:36:51 -0700
X-CSE-ConnectionGUID: gf+q5ttIQvy64tC+i3V3mA==
X-CSE-MsgGUID: g4mzlkYZShayM9aTzFewjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="155432372"
Received: from mturek.ger.corp.intel.com (HELO [10.245.253.104])
 ([10.245.253.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:36:49 -0700
Message-ID: <130fe44f-d1c2-4220-9ce0-281eba01b93e@linux.intel.com>
Date: Tue, 25 Mar 2025 16:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Optimize DMA mapping for exported buffers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, simona@ffwll.ch, airlied@gmail.com
References: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
 <92f87a44-931a-44af-9acc-65f0d062b611@amd.com>
 <afb06124-5e5b-4cf6-9e0c-c1740496c33d@suse.de>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <afb06124-5e5b-4cf6-9e0c-c1740496c33d@suse.de>
Content-Type: text/plain; charset=UTF-8
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

Hi,


On 3/25/2025 3:14 PM, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.03.25 um 14:53 schrieb Christian König:
>> Am 25.03.25 um 14:37 schrieb Jacek Lawrynowicz:
>>> Use DMA_ATTR_SKIP_CPU_SYNC flag for exported buffers during DMA mapping.
>>> The same flag is already used by drm_gem_map_dma_buf() for imported
>>> buffers.
>>>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/drm_gem_shmem_helper.c |  8 ++++++--
>>>   include/drm/drm_gem.h                  | 12 ++++++++++++
>>>   2 files changed, 18 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> index d99dee67353a1..8938d8e3de52f 100644
>>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>>> @@ -699,7 +699,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>>>   static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>>>   {
>>>       struct drm_gem_object *obj = &shmem->base;
>>> -    int ret;
>>> +    int ret, flags = 0;
>>>       struct sg_table *sgt;
>>>         if (shmem->sgt)
>>> @@ -716,8 +716,12 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>>>           ret = PTR_ERR(sgt);
>>>           goto err_put_pages;
>>>       }
>>> +
>>> +    if (drm_gem_is_exported())
>>> +        flags |= DMA_ATTR_SKIP_CPU_SYNC;
>> We should probably just unconditionally set this flag or not at all.
> 
> A question to both of you: does this have an effect on performance? I'm asking because i have a bug report where someone exports a buffer from gem-shmem with miserable performance. Would this flag make a difference?

On x86 this has no effect on performance. I'm not sure about other archs.

Regards,
Jacek

