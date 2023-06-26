Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A273DEF3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF7A10E1E3;
	Mon, 26 Jun 2023 12:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB33310E04B;
 Mon, 26 Jun 2023 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687782193; x=1719318193;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QAtvPIkccnlu6Ank7qJ23cw0df5MPmI943wyhruOK7I=;
 b=iffn1ogjyP2EIv9pBoMUAeJwJFfw0z2VhdKqnvD8mpKSSwbDlrbtayoV
 IBrUdzuvGGwfxzG2woBWaMou0KRcDyEAesmvSIVxo2Fv3gIp02IizLL3A
 WbkHM1xCU2FnGGt/NsnK4RM1fCj3X1TapyZDvsuJWVlrRa2aU5Kk8nP6/
 EpoxS4oyLFopXTGTS+XG8MEtwxENuXwIpvMMPwYQfMqKjkFWmLmqlNVsq
 d8h4SK/V5ygfBb6L/jB+Y2rz6TPu4Q+xBxNuT2ZmzfZV107soKwfP6kBm
 9WDpuULkxZTGhoshWKbcre+2naMKS4PdWWVeqPjrxeV4La1FSN24yfK+J Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="424921618"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="424921618"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 05:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="1046490771"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1046490771"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.105])
 ([10.249.254.105])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 05:23:09 -0700
Message-ID: <e7098908-811b-3d26-5b72-b57afd8a1fdd@linux.intel.com>
Date: Mon, 26 Jun 2023 14:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v2 4/4] drm/ttm: Don't leak a resource on swapout move
 error
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-xe@lists.freedesktop.org
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
 <20230626091450.14757-5-thomas.hellstrom@linux.intel.com>
 <f63137cd-2032-1598-a1d7-484248ef1d02@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <f63137cd-2032-1598-a1d7-484248ef1d02@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Christian,

Will you take a look at 2/4 as well? Will you merge these?

Thanks,

Thomas


On 6/26/23 13:33, Christian König wrote:
> Am 26.06.23 um 11:14 schrieb Thomas Hellström:
>> If moving the bo to system for swapout failed, we were leaking
>> a resource. Fix.
>>
>> Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of 
>> embedding it v2")
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.14+
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index c0e3bbd21d3d..d9a8f227f310 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -1166,6 +1166,7 @@ int ttm_bo_swapout(struct ttm_buffer_object 
>> *bo, struct ttm_operation_ctx *ctx,
>>           ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>>           if (unlikely(ret != 0)) {
>>               WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput 
>> - likely driver bug.\n");
>> +            ttm_resource_free(bo, &evict_mem);
>>               goto out;
>>           }
>>       }
>
