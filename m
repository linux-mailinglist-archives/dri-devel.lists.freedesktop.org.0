Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A689D4FDA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 16:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48DC10E9A4;
	Thu, 21 Nov 2024 15:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="mHLh1lZu";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="Gfzsa8sQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6642410E9B0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 15:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732203228;
 bh=JUs9JXydlh1n899x79+5eCB
 TG58r9BPfGxeERsB4cnQ=; b=mHLh1lZu586+j55uCZOYnES1HsbKhCEsOt3XsxqtzOIdLF7C4P
 pavoj4dpmqKtKVRHe0qcCx1FYxY+nsdfWl+J2mUx0QYA4Dbit2GNenSfn2ITSBRkqmg2Yg3mEEh
 0+5wmHQ5+v6hu1AWXnkcRTbJPJbkBRFIjiIN6O1eRj350CT8FgeMrCOnkEUK1OOcS+1EJYfPTXp
 AtJi7gJBOFxFfi0OpKFYOEvTmf+6uVZEMKmtGekv2BuGy/9obVDU9ffUwWiXQfPpAgvxcxI5JYL
 CdlsQATjagxDNFvnxPLN3tZUSz+g9I4OPIzga1JNKPcHrfr2kBtduEnEqnuZEe51juQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1732203228; bh=JUs9JXydlh1n899x79+5eCB
 TG58r9BPfGxeERsB4cnQ=; b=Gfzsa8sQiqzKTBKzlFdzNHlXTZs9KYGoTJSDO7+gqjN8MRKtmS
 YnRfUQFdImPewVZieR8h7OLes/J3DyNLuKBg==;
Message-ID: <9990a170-0c47-4a52-ad56-e93939739f41@damsy.net>
Date: Thu, 21 Nov 2024 16:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Improve gpu_scheduler trace events + uAPI
To: Philipp Stanner <pstanner@redhat.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 rostedt@goodmis.org, l.stach@pengutronix.de, matt.coster@imgtec.com,
 frank.binns@imgtec.com, yuq825@gmail.com, robdclark@gmail.com,
 kherbst@redhat.com, lyude@redhat.com, boris.brezillon@collabora.com,
 steven.price@arm.com, mwen@igalia.com, mcanal@igalia.com,
 thomas.hellstrom@linux.intel.com, tvrtko.ursulin@igalia.com
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <83e76cb6b546fad48809f36373b3c78c9f855bff.camel@redhat.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <83e76cb6b546fad48809f36373b3c78c9f855bff.camel@redhat.com>
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



Le 15/11/2024 à 11:46, Philipp Stanner a écrit :
> On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
>> Hi,
>>
> 
> Hi,
> 
> I have only just discovered this thread; Danilo and I (we're
> maintainers of the scheduler since early October) seem to miss on CC.
> Do you use scripts/get_maintainer?

I've used the get_maintainer script initially, but then I've kept sending to the same list and I've 
missed the early October update. Sorry about that.

> 
> I'll look into this series soonish.

Thanks a lot!

Pierre-Eric

> 
> Regards,
> P.
> 
>> The initial goal of this series was to improve the drm and amdgpu
>> trace events to be able to expose more of the inner workings of
>> the scheduler and drivers to developers via tools.
>>
>> Then, the series evolved to become focused only on gpu_scheduler.
>> The changes around vblank events will be part of a different
>> series, as well as the amdgpu ones.
>>
>> Moreover Sima suggested to make some trace events stable uAPI,
>> so tools can rely on them long term.
>>
>> The first patches extend and cleanup the gpu scheduler events.
>>
>> The last one adds a documentation entry in drm-uapi.rst.
>>
>> Changes since v5:
>> * Addressed Christian, Maíra and Lucas' comments.
>> * Added patch 1, 2, 6 to include drm_client_id to the events. This
>>    is required when a single app uses multiple fds for the same
>> device.
>> * Validated that the patches don't break gpuvis
>>
>> Useful links:
>> - userspace tool using the updated events:
>> https://gitlab.freedesktop.org/tomstdenis/umr/-/merge_requests/37
>> - v5:
>> https://lists.freedesktop.org/archives/dri-devel/2024-June/457827.html
>>
>>
>> Pierre-Eric Pelloux-Prayer (7):
>>    drm/debugfs: output client_id in in drm_clients_info
>>    drm/sched: store the drm client_id in drm_sched_fence
>>    drm/sched: add device name to the drm_sched_process_job event
>>    drm/sched: cleanup gpu_scheduler trace events
>>    drm/sched: trace dependencies for gpu jobs
>>    drm/sched: add the drm_client_id to the drm_sched_run/exec_job
>> events
>>    drm/doc: document some tracepoints as uAPI
>>
>>   Documentation/gpu/drm-uapi.rst                |  19 +++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   3 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   8 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   3 +-
>>   drivers/gpu/drm/drm_debugfs.c                 |  10 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c  |   2 +-
>>   drivers/gpu/drm/imagination/pvr_job.c         |   2 +-
>>   drivers/gpu/drm/imagination/pvr_queue.c       |   5 +-
>>   drivers/gpu/drm/imagination/pvr_queue.h       |   2 +-
>>   drivers/gpu/drm/lima/lima_gem.c               |   2 +-
>>   drivers/gpu/drm/lima/lima_sched.c             |   6 +-
>>   drivers/gpu/drm/lima/lima_sched.h             |   3 +-
>>   drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
>>   drivers/gpu/drm/nouveau/nouveau_sched.c       |   3 +-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   2 +-
>>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 121 ++++++++++++++--
>> --
>>   drivers/gpu/drm/scheduler/sched_entity.c      |   8 +-
>>   drivers/gpu/drm/scheduler/sched_fence.c       |   4 +-
>>   drivers/gpu/drm/scheduler/sched_main.c        |   8 +-
>>   drivers/gpu/drm/v3d/v3d_submit.c              |   2 +-
>>   drivers/gpu/drm/xe/xe_sched_job.c             |   3 +-
>>   include/drm/gpu_scheduler.h                   |  12 +-
>>   23 files changed, 181 insertions(+), 57 deletions(-)
>>
