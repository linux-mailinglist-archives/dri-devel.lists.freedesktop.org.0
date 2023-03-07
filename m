Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E9E6AEBA5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 18:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D7D10E244;
	Tue,  7 Mar 2023 17:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580EC10E244;
 Tue,  7 Mar 2023 17:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678211224; x=1709747224;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VTdJ1Cp+B7PAYrF0xhhQyKtNPUtYt67rPYuWEClwc9M=;
 b=ktzh8sCbUHmqw6e20UzePb1aTP+G4kqRWFjyRJX/xPpJXCcwduIxBruC
 emqIJMUzxStIcOgYjzxCaYkL/qKPiaoVyRSZvbZeyBEHxX7fSTltsbltL
 e8f1gq09l32V2ORqYQ8x0DEoawooD24+7s68EBL3TrW+bNT66n3Hbapo2
 juKLYX7E8eUCmzEvhpaI48j/GrSkvumrdsK4Xjb9mJOQv+VMQ6970nei2
 DBiA/lF40GGZBM9LCz467Ssl7wU+m3aIFfcSCzsjD8J8+/lGHrFBjQ/q3
 IkQzz7u7y9sZXD/hE7PdAPY1tl9PHrL7fTnDNQRsfohVq7uDDVxcGoy4a A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333391637"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="333391637"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 09:47:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="626624449"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="626624449"
Received: from peiwangc-mobl1.ccr.corp.intel.com (HELO [10.249.254.10])
 ([10.249.254.10])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 09:46:58 -0800
Message-ID: <efc256f9-d0ea-fbae-c1c8-5dce778cf37b@linux.intel.com>
Date: Tue, 7 Mar 2023 18:46:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/7] drm/ttm: Fix a NULL pointer dereference
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-2-thomas.hellstrom@linux.intel.com>
 <9383eed5-d3ad-d61f-9fce-6a543890ee83@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <9383eed5-d3ad-d61f-9fce-6a543890ee83@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Qiang Yu <qiang.yu@amd.com>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/7/23 17:55, Christian König wrote:
> Am 07.03.23 um 15:46 schrieb Thomas Hellström:
>> The LRU mechanism may look up a resource in the process of being removed
>> from an object. The locking rules here are a bit unclear but it looks
>> currently like res->bo assignment is protected by the LRU lock, whereas
>> bo->resource is protected by the object lock, while *clearing* of
>> bo->resource is also protected by the LRU lock. This means that if
>> we check that bo->resource points to the LRU resource under the LRU
>> lock we should be safe.
>> So perform that check before deciding to swap out a bo. That avoids
>> dereferencing a NULL bo->resource in ttm_bo_swapout().
>
> Please make sure that this is pushed to drm-misc-fixes ASAP.
>
> I've getting complains for this from different sides.
>
> Thanks,
> Christian.

Done.

/Thomas


>
>>
>> Fixes: 6a9b02899402 ("drm/ttm: move the LRU into resource handling v4")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Huang Rui <ray.huang@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
>> Cc: Philip Yang <Philip.Yang@amd.com>
>> Cc: Qiang Yu <qiang.yu@amd.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index c7a1862f322a..ae2f19dc9f81 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -158,7 +158,7 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>> struct ttm_operation_ctx *ctx,
>>               struct ttm_buffer_object *bo = res->bo;
>>               uint32_t num_pages;
>>   -            if (!bo)
>> +            if (!bo || bo->resource != res)
>>                   continue;
>>                 num_pages = PFN_UP(bo->base.size);
>
