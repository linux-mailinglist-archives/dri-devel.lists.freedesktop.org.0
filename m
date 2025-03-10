Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E7A5A67C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 22:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC7110E324;
	Mon, 10 Mar 2025 21:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BNt2026T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD2D10E09E;
 Mon, 10 Mar 2025 21:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AJil93IzUDgCjnkwb1ftr6Wb6/uv7Kl9IDbIsPwiTyU=; b=BNt2026TUEPDGLMNJ0ytDE063W
 jUcm3LkUModbev+EpoXWlRy6WQA6CCzT80zjXe01ImWJMO49AaOoGNdjlH1JxbRGo4fBFzV6enNkP
 Wvd+wQbK0lllmR4M4D9mnyP1kN9HMVokIQ3w9ItKnfagr+e5ZbDWWmSMIR7S0nF2iF59mmPEroyzT
 IqKgkwtYgBwGV9l1poACmlYFDh1RaMFLJLe+FLbjgt1ZJ2unZ4kQqF4jqpjspYLzFDyBT84RlTSNT
 d9QL16BB2w2QWhSVJ9486VCBaQ9p4CHaUmB699JECD2CPV9/ARHHvkDtjYwh6rbDp+LPziVKQexoI
 iXBcdkxQ==;
Received: from [191.204.194.148] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1trl4F-006fjl-HO; Mon, 10 Mar 2025 22:53:53 +0100
Message-ID: <73602c9b-74f6-4b4a-82c6-918292b13cf7@igalia.com>
Date: Mon, 10 Mar 2025 18:53:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
To: Raag Jadav <raag.jadav@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@kde.org>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
 <Z8HO-s_otb2u44V7@black.fi.intel.com>
 <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
 <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
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

Em 01/03/2025 03:04, Raag Jadav escreveu:
> On Fri, Feb 28, 2025 at 06:49:43PM -0300, André Almeida wrote:
>> Hi Raag,
>>
>> On 2/28/25 11:58, Raag Jadav wrote:
>>> On Fri, Feb 28, 2025 at 09:13:53AM -0300, André Almeida wrote:
>>>> To notify userspace about which app (if any) made the device get in a
>>>> wedge state, make use of drm_wedge_app_info parameter, filling it with
>>>> the app PID and name.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
>>>>    2 files changed, 22 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 00b9b87dafd8..e06adf6f34fd 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>    	atomic_set(&adev->reset_domain->reset_res, r);
>>>> -	if (!r)
>>>> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>>>> +	if (!r) {
>>>> +		struct drm_wedge_app_info aux, *info = NULL;
>>>> +
>>>> +		if (job) {
>>>> +			struct amdgpu_task_info *ti;
>>>> +
>>>> +			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>>>> +			if (ti) {
>>>> +				aux.pid = ti->pid;
>>>> +				aux.comm = ti->process_name;
>>>> +				info = &aux;
>>>> +				amdgpu_vm_put_task_info(ti);
>>>> +			}
>>>> +		}
>>> Is this guaranteed to be guilty app and not some scheduled worker?
>>
>> This is how amdgpu decides which app is the guilty one earlier in the code
>> as in the print:
>>
>>      ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>>
>>      "Process information: process %s pid %d thread %s pid %d\n"
>>
>> So I think it's consistent with what the driver thinks it's the guilty
>> process.
> 
> Sure, but with something like app_info we're kind of hinting to userspace
> that an application was _indeed_ involved with reset. Is that also guaranteed?
> 
> Is it possible that an application needlessly suffers from a false positive
> scenario (reset due to other factors)?
> 

I asked Alex Deucher in IRC about that and yes, there's a chance that 
this is a false positive. However, for the majority of cases this is the 
right app that caused the hang. This is what amdgpu is doing for GL 
robustness as well and devcoredump, so it's very consistent with how 
amdgpu deals with this scenario even if the mechanism is still not perfect.
