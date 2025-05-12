Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C9AB32BE
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 11:07:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BA110E33C;
	Mon, 12 May 2025 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="f3lJiyIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFC810E337;
 Mon, 12 May 2025 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mtDfODfKKqCTmiLAPWM7Z781dLVe98fzxXS0LXtBsLY=; b=f3lJiyINO+jsjxMX6iFd+vGtsh
 T7/uExi7FM6LgK60FCS8jWIGyaIkNRqgsO3iwDzoYw7+JD9e29vMAJu6TWRWyluzfn/XV7HQvQg/7
 E8u+YTMkrRKQEZoVLj4PtJyDmvid4bpsX6+i4e2nvR5fFAGmTbXxTQVlc9mpaCmOclf36hIoXfIx4
 S+P+u5tvhiKK0PUgg066z7S8/S80okyMRJGacluoFadYDR32k3fvNdIDZ13eTzhsmISM/UuL1wnBf
 TLj9PXh5qWM3ZaWW4TCU54wRcmwH1Shg5VI9a+b5zVwdQb1JBP7ZF1vLPixEmq7YYGTOgGgCRAiTH
 xIz7SKgQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uEP3I-006zPM-IK; Mon, 12 May 2025 11:07:42 +0200
Message-ID: <08e8f2fc-3878-445e-81dd-6f49fc008ee6@igalia.com>
Date: Mon, 12 May 2025 10:07:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 08/13] drm/amdgpu: Use dma-fence driver and timeline name
 helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-9-tvrtko.ursulin@igalia.com>
 <e4887f43-9eb2-47cd-91a9-080c3c646cb4@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e4887f43-9eb2-47cd-91a9-080c3c646cb4@amd.com>
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


On 12/05/2025 09:27, Christian König wrote:
> On 5/9/25 17:33, Tvrtko Ursulin wrote:
>> Access the dma-fence internals via the previously added helpers.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> index 11dd2e0f7979..8e5bf179a6c8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> @@ -33,7 +33,7 @@
>>   #define TRACE_INCLUDE_FILE amdgpu_trace
>>   
>>   #define AMDGPU_JOB_GET_TIMELINE_NAME(job) \
>> -	 job->base.s_fence->finished.ops->get_timeline_name(&job->base.s_fence->finished)
>> +	 dma_fence_timeline_name(&job->base.s_fence->finished)
> 
> I think you can nuke the macro now as well, the new function name is short enough.

Done.

Regards,

Tvrtko

