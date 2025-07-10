Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D7B00085
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 13:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C566410E20B;
	Thu, 10 Jul 2025 11:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="m/JdMX7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64D110E0C5;
 Thu, 10 Jul 2025 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cvw1nJdAfF7H3f7I54xwe7lK9u6FonXqJsYN7tHHtLY=; b=m/JdMX7Jf1H0/PNWEhZ468nY1S
 Trmpvt/wwC9V5+u/Na+rpR4nStF6TCDHZta+Iqc/aMUCTE9+agnArA7P+mhoFz1FHcDb+66F9U8h1
 GxFu6nZSBUbuzFhigdpdtfN0IByg80ILQZmYXVm+Nl/2e/ugqXbQIQW4+dSrdUc+UcL3WGXVTLDva
 d4MfBvOceFGA5Gh3BS5poZOlA2g8dl/tQ9ewBak+UbNhOXFrV7F2QPZfK1C+gu64RDb6OA8nTsQIy
 L8E43SQWcwnI1notfjf8wmjbfCd+Gxb/MmSUjR03rZtjXgqkoaS7w/mklYgAIroao2mj6mC/KN8/5
 Ye+pcBXA==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZpQn-00EuAe-6j; Thu, 10 Jul 2025 13:27:13 +0200
Message-ID: <8a3e0926-0a01-4a09-bb7e-1bd928e2f311@igalia.com>
Date: Thu, 10 Jul 2025 08:27:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/8] drm/sched: Allow drivers to skip the reset with
 DRM_GPU_SCHED_STAT_NO_HANG
To: phasta@kernel.org, Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Qiang Yu <yuq825@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <71d67f799ccadb2858747cac516e04cff53e9234.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <71d67f799ccadb2858747cac516e04cff53e9234.camel@mailbox.org>
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

+cc Maxime, Thomas

Hi Philipp,

On 09/07/25 10:14, Philipp Stanner wrote:
> On Tue, 2025-07-08 at 10:25 -0300, Maíra Canal wrote:
>> TL;DR: The only two patches that are lacking R-b's are:
>>
>> [PATCH 2/8] drm/sched: Allow drivers to skip the reset and keep on running
>> [PATCH 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
>>    -> If Intel CI succeeds, it's Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>
>> For those two patches, it would be great to gather feedback and/or R-b's,
>> particularly from the Intel folks.
>>
>> Thanks for all the reviews so far!
>>
>> ---

[...]

>>        drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET
>>        drm/sched: Allow drivers to skip the reset and keep on running
>>        drm/sched: Make timeout KUnit tests faster
>>        drm/sched: Add new test for DRM_GPU_SCHED_STAT_NO_HANG
>>        drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
>>        drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
>>        drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
>>        drm/panfrost: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the reset
>>
>>   drivers/accel/amdxdna/aie2_ctx.c                 |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c          |  2 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c          | 16 +++----
>>   drivers/gpu/drm/imagination/pvr_queue.c          |  4 +-
>>   drivers/gpu/drm/lima/lima_sched.c                |  6 +--
>>   drivers/gpu/drm/nouveau/nouveau_exec.c           |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_sched.c          |  2 +-
>>   drivers/gpu/drm/panfrost/panfrost_job.c          | 10 ++---
>>   drivers/gpu/drm/panthor/panthor_mmu.c            |  2 +-
>>   drivers/gpu/drm/panthor/panthor_sched.c          |  2 +-
>>   drivers/gpu/drm/scheduler/sched_main.c           | 48 +++++++++++++++++++--
>>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  7 ++-
>>   drivers/gpu/drm/scheduler/tests/sched_tests.h    |  1 +
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c    | 55 ++++++++++++++++++++++--
>>   drivers/gpu/drm/v3d/v3d_sched.c                  | 18 ++------
>>   drivers/gpu/drm/xe/xe_guc_submit.c               | 14 ++----
>>   include/drm/gpu_scheduler.h                      |  7 ++-
>>   17 files changed, 137 insertions(+), 61 deletions(-)
> 
> Does not apply to drm-misc-next:
> 
> Applying: drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET
> error: patch failed: drivers/gpu/drm/etnaviv/etnaviv_sched.c:87
> error: drivers/gpu/drm/etnaviv/etnaviv_sched.c: patch does not apply
> Patch failed at 0001 drm/sched: Rename DRM_GPU_SCHED_STAT_NOMINAL to DRM_GPU_SCHED_STAT_RESET
> 
> Awkward. That file has last been touched months ago. On what branch is
> your series based?

It's based on drm-tip, otherwise, Intel CI wouldn't be able to apply the
series. drm-tip has that Etnaviv fix (commit 61ee19dedb8d "drm/etnaviv:
Protect the scheduler's pending list with its lock"), which drm-misc-
next doesn't have yet.

> 
> Can you rebase?
> 
>  From my POV you could also apply it yourself. Looks all good.

I believe I can apply the series to drm-misc-next and solve the
conflicts in drm-tip with `dim rebuild-tip`.

@drm-misc maintainers, would it be an issue if I apply this series to
drm-misc-next and solve the conflicts?

Best Regards,
- Maíra

> 
> P.
> 
> 
> 
>> ---
>> base-commit: 8b32b5509128873da8ecfc06beefcb58927eb50b
>> change-id: 20250502-sched-skip-reset-bf7c163233da
>>
> 

