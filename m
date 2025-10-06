Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE2BBE517
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 16:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0379C10E0E8;
	Mon,  6 Oct 2025 14:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHnPCNuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7A910E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759760476; x=1791296476;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Fp376nVq+wIQoJGkMhuZJoRqEDA/Rk+mt3rzGpm7YSA=;
 b=gHnPCNuJ5JO7iakp69Ndd3IACnu8faXMwrMFtUaLt+OTn0gYWfNApBaJ
 Mh6Uv4m+Mq/b94fZkZ2X6OrBdvg0x5md3iqYtFh564TIOJUOG8FkDLmdm
 Wwg3kztvd/c74nm1q0JIty7kk9DiIfZUJtBpU37J4LK2os+3bZlutU3Us
 zlD6+XFMJM3Wf9Cz0ZiKcSjdR0vjLqDAJoqrMYPz5CHBb5UEqzspCd8Hy
 /7nnA/n9mV1wCjkBku1NyAk5KC58kx1gqb62z+lmeF8sRxmBg/jZ4LmPs
 g8vYLkAx5Zv6FzIUsXvgt+4MwFNvHWCVR58bzR/Uq5KFmP6ePS3/wgGw3 w==;
X-CSE-ConnectionGUID: ++65te5MQ4uc2cgNNwpVdg==
X-CSE-MsgGUID: MCqXc2a3T16JiW9eW743ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72186230"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72186230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:21:16 -0700
X-CSE-ConnectionGUID: z1RxdS1TRNOHN0ICA0hcnQ==
X-CSE-MsgGUID: gS3MNeTPTsmsQ5v4jixy4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="180322397"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.93])
 ([10.245.245.93])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 07:21:13 -0700
Message-ID: <cf6e96ae-746c-43c6-a761-a3304745cf0c@linux.intel.com>
Date: Mon, 6 Oct 2025 16:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vgem-fence: Fix potential deadlock on release
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 dri-devel@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250926152628.2165080-2-janusz.krzysztofik@linux.intel.com>
 <2b562fa8-6312-4464-8c8d-26d13fbad673@amd.com>
 <4655664.8F6SAcFxjW@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <4655664.8F6SAcFxjW@jkrzyszt-mobl2.ger.corp.intel.com>
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

Hey,

Den 2025-09-29 kl. 14:42, skrev Janusz Krzysztofik:
> Hi Christian,
> 
> Thank you for looking at it and providing your R-b.
> 
> On Sunday, 28 September 2025 16:00:57 CEST Christian König wrote:
>> On 26.09.25 17:26, Janusz Krzysztofik wrote:
>>> A timer that expires a vgem fence automatically in 10 seconds is now
>>> released with timer_delete_sync() from fence->ops.release() called on last
>>> dma_fence_put().  In some scenarios, it can run in IRQ context, which is
>>> not safe unless TIMER_IRQSAFE is used.  One potentially risky scenario was
>>> demonstrated in Intel DRM CI trybot, BAT run on machine bat-adlp-6, while
>>> working on new IGT subtests syncobj_timeline@stress-* as user space
>>> replacements of some problematic test cases of a dma-fence-chain selftest
> ...
>>> Make the timer IRQ safe.
>>>
>>> [1] https://patchwork.freedesktop.org/series/154987/#rev2
>>>
>>> Fixes: 4077798484459 ("drm/vgem: Attach sw fences to exported vGEM dma-buf (ioctl)")
>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> We should also consider to lower the timeout massively. This needs to be in the range of 100m-1s to not cause the same trouble as the sw_sync framework.
> 
> Assuming you are referring to potential hard lockups observed in sw_sync based 
> version of the exercise, which piece of kernel code you would expect to loop 
> for too long with interrupts disabled due to the vgem fences auto expiry 
> timeout of 10s?
> 
>>
>> 10seconds is just way to long for that.
> 
> Do you think DRM objects can't be busy for that long in real life?  What about 
> long running GPU compute tasks?
> 
> Thanks,
> Janusz
> 
> 
>>
>> Regards,
>> Christian.
>>
>>> ---
>>>  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
>>> index fd76730fd38c0..07db319c3d7f9 100644
>>> --- a/drivers/gpu/drm/vgem/vgem_fence.c
>>> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
>>> @@ -79,7 +79,7 @@ static struct dma_fence *vgem_fence_create(struct vgem_file *vfile,
>>>  	dma_fence_init(&fence->base, &vgem_fence_ops, &fence->lock,
>>>  		       dma_fence_context_alloc(1), 1);
>>>  
>>> -	timer_setup(&fence->timer, vgem_fence_timeout, 0);
>>> +	timer_setup(&fence->timer, vgem_fence_timeout, TIMER_IRQSAFE);
>>>  
>>>  	/* We force the fence to expire within 10s to prevent driver hangs */
>>>  	mod_timer(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);
>>
>>
> 
> 
> 
> 
Pushed the ptach, thanks.

I'm imagining it's mostly because of potential chaining of multiple fences, which can worsen the worst-case timeout easily.

Kind regards,
~Maarten
