Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77E1BDEB5A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 15:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E3A10E184;
	Wed, 15 Oct 2025 13:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DADEB10E184
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 13:18:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 955B3106F;
 Wed, 15 Oct 2025 06:18:26 -0700 (PDT)
Received: from [10.1.31.33] (e122027.cambridge.arm.com [10.1.31.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 965E13F6A8;
 Wed, 15 Oct 2025 06:18:31 -0700 (PDT)
Message-ID: <982d0fb9-a987-4b7f-ba9d-1a87b19e275f@arm.com>
Date: Wed, 15 Oct 2025 14:18:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] drm/panfrost: Expose the selected coherency
 protocol to the UMD
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, kernel@collabora.com
References: <20251010101147.3290604-1-boris.brezillon@collabora.com>
 <20251010101147.3290604-10-boris.brezillon@collabora.com>
 <2e85c917-4e49-4cb2-ba2c-edb35907860d@arm.com>
 <20251015134159.74b42ec4@fedora>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251015134159.74b42ec4@fedora>
Content-Type: text/plain; charset=UTF-8
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

On 15/10/2025 12:41, Boris Brezillon wrote:
> On Fri, 10 Oct 2025 15:50:58 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 10/10/2025 11:11, Boris Brezillon wrote:
>>> Will be needed if we want to skip CPU cache maintenance operations when
>>> the GPU can snoop CPU caches.
>>>
>>> v2:
>>> - New commit
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>>>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  1 +
>>>  drivers/gpu/drm/panfrost/panfrost_gpu.c    | 18 +++++++++++++++++-
>>>  drivers/gpu/drm/panfrost/panfrost_regs.h   |  2 ++
>>>  include/uapi/drm/panfrost_drm.h            |  7 +++++++
>>>  5 files changed, 28 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> index 1e73efad02a8..bd38b7ae169e 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> @@ -75,6 +75,7 @@ struct panfrost_features {
>>>  	u32 thread_max_workgroup_sz;
>>>  	u32 thread_max_barrier_sz;
>>>  	u32 coherency_features;
>>> +	u32 selected_coherency;
>>>  	u32 afbc_features;
>>>  	u32 texture_features[4];
>>>  	u32 js_features[16];
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> index 607a5b8448d0..3ffcd08f7745 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> @@ -94,6 +94,7 @@ static int panfrost_ioctl_get_param(struct drm_device *ddev, void *data, struct
>>>  		PANFROST_FEATURE_ARRAY(JS_FEATURES, js_features, 15);
>>>  		PANFROST_FEATURE(NR_CORE_GROUPS, nr_core_groups);
>>>  		PANFROST_FEATURE(THREAD_TLS_ALLOC, thread_tls_alloc);
>>> +		PANFROST_FEATURE(SELECTED_COHERENCY, selected_coherency);
>>>  
>>>  	case DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP:
>>>  		ret = panfrost_ioctl_query_timestamp(pfdev, &param->value);
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> index 174e190ba40f..fed323e6a307 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> @@ -260,7 +260,23 @@ static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>>>  	pfdev->features.max_threads = gpu_read(pfdev, GPU_THREAD_MAX_THREADS);
>>>  	pfdev->features.thread_max_workgroup_sz = gpu_read(pfdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
>>>  	pfdev->features.thread_max_barrier_sz = gpu_read(pfdev, GPU_THREAD_MAX_BARRIER_SIZE);
>>> -	pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
>>> +
>>> +	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_COHERENCY_REG))
>>> +		pfdev->features.coherency_features = gpu_read(pfdev, GPU_COHERENCY_FEATURES);
>>> +	else
>>> +		pfdev->features.coherency_features = COHERENCY_ACE_LITE;
>>> +
>>> +	if (!pfdev->coherent) {
>>> +		pfdev->features.selected_coherency = COHERENCY_NONE;
>>> +	} else if (pfdev->features.coherency_features & COHERENCY_ACE) {
>>> +		pfdev->features.selected_coherency = COHERENCY_ACE;
>>> +	} else if (pfdev->features.coherency_features & COHERENCY_ACE_LITE) {
>>> +		pfdev->features.selected_coherency = COHERENCY_ACE_LITE;
>>> +	} else {
>>> +		drm_WARN(pfdev->ddev, true, "No known coherency protocol supported");
>>> +		pfdev->features.selected_coherency = COHERENCY_NONE;
>>> +	}  
>>
>> Same comment as for panthor about not using bits when we can't have more
>> than one. But also here because selected_coherency is only a UAPI
>> concept, it would make sense to use the UAPI values, i.e.
>> DRM_PANFROST_GPU_COHERENCY_ACE_LITE etc rather than the private
>> COHERENCY_ACE_LITE defines.
> 
> For simplicity (we simply copy the coherency_features from the GPU reg
> at the moment), I want the HW/uAPI values to match, so I've added
> BUILD_BUG_ON()s. And I think I'd prefer to stick to the defs in
> panfrost_regs.h, such that if we ever end up writing that back to
> COHERENCY_ENABLE on newer HW, it's obvious we based the initialization
> on those HW values.

Yeah, BUILD_BUG_ON works as well. It just seemed a little fragile to be
using the 'wrong' symbol - and we're messed these symbols up before ;)

>>
>> Although there is actually a COHERENCY_ENABLE register on some GPUs
>> (BASE_HW_FEATURE_COHERENCY_REG in the kbase driver). Looks like it was
>> probably introduced for Bifrost. But AFAIK the above checks should be ok.
> 
> Yep. I didn't dare writing it back, because it's working as-is on all
> supported HW, and I don't want to regress things. Not that I've played
> with this COHERENCY_ENABLE reg on my amlogic board, which is coherent,
> to fake a non-coherent setup, and it works like a charm :-).
> 

Yeah, I don't know if it's actually useful beyond testing the
non-coherent mode, so probably not worth changing things.

Thanks,
Steve

