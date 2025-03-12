Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B451A5D901
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3E110E340;
	Wed, 12 Mar 2025 09:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ubx5NJVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C514010E744;
 Wed, 12 Mar 2025 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741770845; x=1773306845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dx7/YOg9MPlzfoNLAMhyKFjqJ0u98yPZNBqi1qTZamc=;
 b=Ubx5NJVIXAWPXau7gVHlhZSQH3h6isHnCDQAr1rF4J4CD+KbKKoJcK34
 n0gM1zWRuahv5JiGN5AXcov4gW1Rsh9PuBNgdDCgAMT2YL+PIKM5BR/cI
 9LP98A6aSm2VedPVFBg6aE4dkgg4WFM3XJQhz/jI42UAwbuQPp+TS2JB+
 VZ3cnV9Bi4Lhcn1u35ORY4QkmT3SbmrSiYTsdh/xpi/WrReeRZo1pRxLg
 jxix2z4ADJ8dMpqutO77Jg6SRJxtWOpiQmQ5JeAcNaca04wa8vZ3Q+h3L
 WSY4zjW+3yT2HXcWqxY2AJmMCPfSkWEObwN0gUnwsPuLpHAOindI6zFor Q==;
X-CSE-ConnectionGUID: BpKaLYXiQaaNjyzrk2wPUg==
X-CSE-MsgGUID: y4J54vKLQeqZI+Ruf4hufg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42947926"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42947926"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:14:05 -0700
X-CSE-ConnectionGUID: CwolEVmeTxWSaGGdsfMEFQ==
X-CSE-MsgGUID: SyJctsnwSoGOJcJTZZtGjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120526988"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:14:01 -0700
Date: Wed, 12 Mar 2025 11:13:58 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, Xaver Hugl <xaver.hugl@kde.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
Message-ID: <Z9FQVpRF8-d7OPnV@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
 <Z8HO-s_otb2u44V7@black.fi.intel.com>
 <38b9cc8b-2a55-4815-a19f-f5bdf0f7687c@igalia.com>
 <Z8KjZfLYjH6ehYwy@black.fi.intel.com>
 <73602c9b-74f6-4b4a-82c6-918292b13cf7@igalia.com>
 <CADnq5_PbZUoyxyqweqa=kUNsSXanjY=5mUJrn03aY3je6rER+w@mail.gmail.com>
 <Z9BvK55_Nim54eOu@black.fi.intel.com>
 <2c99f7a8-7f72-4959-88b5-d3137575640e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c99f7a8-7f72-4959-88b5-d3137575640e@amd.com>
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

On Wed, Mar 12, 2025 at 09:25:08AM +0100, Christian König wrote:
>Am 11.03.25 um 18:13 schrieb Raag Jadav:
>> On Mon, Mar 10, 2025 at 06:03:27PM -0400, Alex Deucher wrote:
>>> On Mon, Mar 10, 2025 at 5:54 PM André Almeida <andrealmeid@igalia.com> wrote:
>>>> Em 01/03/2025 03:04, Raag Jadav escreveu:
>>>>> On Fri, Feb 28, 2025 at 06:49:43PM -0300, André Almeida wrote:
>>>>>> Hi Raag,
>>>>>>
>>>>>> On 2/28/25 11:58, Raag Jadav wrote:
>>>>>>> On Fri, Feb 28, 2025 at 09:13:53AM -0300, André Almeida wrote:
>>>>>>>> To notify userspace about which app (if any) made the device get in a
>>>>>>>> wedge state, make use of drm_wedge_app_info parameter, filling it with
>>>>>>>> the app PID and name.
>>>>>>>>
>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
>>>>>>>>    2 files changed, 22 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> index 00b9b87dafd8..e06adf6f34fd 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>>>>>>>            atomic_set(&adev->reset_domain->reset_res, r);
>>>>>>>> -  if (!r)
>>>>>>>> -          drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
>>>>>>>> +  if (!r) {
>>>>>>>> +          struct drm_wedge_app_info aux, *info = NULL;
>>>>>>>> +
>>>>>>>> +          if (job) {
>>>>>>>> +                  struct amdgpu_task_info *ti;
>>>>>>>> +
>>>>>>>> +                  ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
>>>>>>>> +                  if (ti) {
>>>>>>>> +                          aux.pid = ti->pid;
>>>>>>>> +                          aux.comm = ti->process_name;
>>>>>>>> +                          info = &aux;
>>>>>>>> +                          amdgpu_vm_put_task_info(ti);
>>>>>>>> +                  }
>>>>>>>> +          }
>>>>>>> Is this guaranteed to be guilty app and not some scheduled worker?
>>>>>> This is how amdgpu decides which app is the guilty one earlier in the code
>>>>>> as in the print:
>>>>>>
>>>>>>      ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>>>>>>
>>>>>>      "Process information: process %s pid %d thread %s pid %d\n"
>>>>>>
>>>>>> So I think it's consistent with what the driver thinks it's the guilty
>>>>>> process.
>>>>> Sure, but with something like app_info we're kind of hinting to userspace
>>>>> that an application was _indeed_ involved with reset. Is that also guaranteed?
>>>>>
>>>>> Is it possible that an application needlessly suffers from a false positive
>>>>> scenario (reset due to other factors)?
>>>>>
>>>> I asked Alex Deucher in IRC about that and yes, there's a chance that
>>>> this is a false positive. However, for the majority of cases this is the
>>>> right app that caused the hang. This is what amdgpu is doing for GL
>>>> robustness as well and devcoredump, so it's very consistent with how
>>>> amdgpu deals with this scenario even if the mechanism is still not perfect.
>>> It's usually the guilty one, but it's not guaranteed.  For example,
>>> say you have a ROCm user queue and a gfx job submitted to a kernel
>>> queue.  The actual guilty job may be the ROCm user queue, but the
>>> driver may not detect that the ROCm queue was hung until some other
>>> event (e.g., memory pressure).  However, the timer for the gfx job may
>>> timeout before that happens on the ROCm queue so in that case the gfx
>>> job would be incorrectly considered guilty.
>> So it boils down to what are the chances of that happening and whether
>> it's significant enough to open the door for API abuse.
> 
> We are also working on an enforce_isolation parameter for amdgpu which only allows one application at a time to use the hardware for the cost of performance.
> 
> The problem is simply that when you don't allow multiple applications to use the HW at the same time you also don't get full utilization of the different HW blocks.
> 
> It can also be that a crash only happens because two applications do something at the same time which is not supposed to happen at the same time. Those issue are then usually fixed by firmware updates, but are really really hard to debug.
> 
> I don't see much potential for abuse here since you can't easily control from userspace when a lockup happens. And the AMD Linux team has made quite a bunch of requirements to the HW/FW engineers recently which should improve the situation on future HW generations.
> 
> So I think we should probably just document that reliability of this information is driver and hardware specific and should be taken with a grain of salt and call it a day.

Sounds reasonable. The new event string will need its own chapter anyway.

Raag
