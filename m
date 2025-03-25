Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E338A7051B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 16:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0B310E08F;
	Tue, 25 Mar 2025 15:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrPHHdOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40AE10E08F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742916823; x=1774452823;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VO/FeC/YUvCqnZVmykJy2Si80FcogB4gfXD7EsauNVY=;
 b=VrPHHdOIytOkxCIkmI+G6uFuw339SXgj9P+D2cwZzzyBjaNWcPWGinHW
 tTKVlGpgZE+NbOyHfdsQTKkTuxHhIBEzALmXeJQmIaEsAXNZpwxhuwyU2
 yLTX05csXi4a+cOF2WLJKaa7gz6c+2Lw5GF2lnK3vETKrGShvGoBRHZuq
 fCC4uPcnvf3oRE9icPgtgIR4gpfmxRiC2IeEQQbGMqL5Q8kfrofEFt3+8
 EcoWKzPyo+TdE7/RRT3cwMRodSvSt48U+vqCuuLsFIaXUO1stJOGphGRS
 4KPn014QYmuG8JDjhgL3jOr+Kz0zKb1B9GLw9O+VRmrE8vDETzHHIBfOp A==;
X-CSE-ConnectionGUID: OWKDPz8oQB2q9uclxwM/dg==
X-CSE-MsgGUID: wpIsbUhhTfKM3d1AFVqHXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48046656"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="48046656"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:33:42 -0700
X-CSE-ConnectionGUID: U63iFCtQS5C8lRpMQ5hNoA==
X-CSE-MsgGUID: 1hSIu9tKRamsF6YgAi+tDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124364100"
Received: from mturek.ger.corp.intel.com (HELO [10.245.253.104])
 ([10.245.253.104])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 08:33:40 -0700
Message-ID: <47542c02-4c83-435e-811a-904e202d3dfa@linux.intel.com>
Date: Tue, 25 Mar 2025 16:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem-shmem: Optimize DMA mapping for exported buffers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: sumit.semwal@linaro.org, simona@ffwll.ch, airlied@gmail.com,
 tzimmermann@suse.de
References: <20250325133744.23805-1-jacek.lawrynowicz@linux.intel.com>
 <92f87a44-931a-44af-9acc-65f0d062b611@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <92f87a44-931a-44af-9acc-65f0d062b611@amd.com>
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

On 3/25/2025 2:53 PM, Christian König wrote:
> Am 25.03.25 um 14:37 schrieb Jacek Lawrynowicz:
>> Use DMA_ATTR_SKIP_CPU_SYNC flag for exported buffers during DMA mapping.
>> The same flag is already used by drm_gem_map_dma_buf() for imported
>> buffers.
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>  drivers/gpu/drm/drm_gem_shmem_helper.c |  8 ++++++--
>>  include/drm/drm_gem.h                  | 12 ++++++++++++
>>  2 files changed, 18 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> index d99dee67353a1..8938d8e3de52f 100644
>> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
>> @@ -699,7 +699,7 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>>  static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_object *shmem)
>>  {
>>  	struct drm_gem_object *obj = &shmem->base;
>> -	int ret;
>> +	int ret, flags = 0;
>>  	struct sg_table *sgt;
>>  
>>  	if (shmem->sgt)
>> @@ -716,8 +716,12 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
>>  		ret = PTR_ERR(sgt);
>>  		goto err_put_pages;
>>  	}
>> +
>> +	if (drm_gem_is_exported())
>> +		flags |= DMA_ATTR_SKIP_CPU_SYNC;
> 
> We should probably just unconditionally set this flag or not at all.
> 
> Otherwise we could run into quite some surprises.

I see that this flag is usually set in drm_gem_map_dma_buf() and similar callbacks across drm drivers.
Shouldn't it be the default on x86?

Regards,
Jacek
