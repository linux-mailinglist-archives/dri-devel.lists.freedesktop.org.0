Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8909646D3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 15:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377F210E6AB;
	Thu, 29 Aug 2024 13:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0B8B10E6AB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 13:37:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77938DA7;
 Thu, 29 Aug 2024 06:37:35 -0700 (PDT)
Received: from [10.1.25.33] (e122027.cambridge.arm.com [10.1.25.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F04A03F762;
 Thu, 29 Aug 2024 06:37:05 -0700 (PDT)
Message-ID: <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
Date: Thu, 29 Aug 2024 14:37:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
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

Hi Christian,

Mihail should be able to give more definitive answers, but I think I can
answer your questions.

On 29/08/2024 10:40, Christian König wrote:
> Am 28.08.24 um 19:25 schrieb Mihail Atanassov:
>> Hello all,
>>
>> This series implements a mechanism to expose Mali CSF GPUs' queue
>> ringbuffers directly to userspace, along with paraphernalia to allow
>> userspace to control job synchronisation between the CPU and GPU.
>>
>> The goal of these changes is to allow userspace to control work
>> submission to the FW/HW directly without kernel intervention in the
>> common case, thereby reducing context switching overhead. It also allows
>> for greater flexibility in the way work is enqueued in the ringbufs.
>> For example, the current kernel submit path only supports indirect
>> calls, which is inefficient for small command buffers. Userspace can
>> also skip unnecessary sync operations.

> Question is how do you guarantee forward progress for fence signaling?

A timeout. Although looking at it I think it's probably set too high
currently:

> +#define JOB_TIMEOUT_MS				5000

But basically the XGS queue is a DRM scheduler just like a normal GPU
queue and the jobs have a timeout. If the timeout is hit then any fences
will be signalled (with an error).

> E.g. when are fences created and published? How do they signal?
> 
> How are dependencies handled? How can the kernel suspend an userspace
> queue?

The actual userspace queue can be suspended. This is actually a
combination of firmware and kernel driver, and this functionality is
already present without the user submission. The firmware will multiplex
multiple 'groups' onto the hardware, and if there are too many for the
firmware then the kernel multiplexes the extra groups onto the ones the
firmware supports.

I haven't studied Mihail's series in detail yet, but if I understand
correctly, the XGS queues are handled separately and are not suspended
when the hardware queues are suspended. I guess this might be an area
for improvement and might explain the currently very high timeout (to
deal with the case where the actual GPU work has been suspended).

> How does memory management work in this case?

I'm not entirely sure what you mean here. If you are referring to the
potential memory issues with signalling path then this should be handled
by the timeout - although I haven't studied the code to check for bugs here.

The actual new XGS queues don't allocate/free memory during the queue
execution - so it's just the memory usage related to fences (and the
other work which could be blocked on the fence).

In terms of memory management for the GPU work itself, this is handled
the same as before. The VM_BIND mechanism allows dependencies to be
created between syncobjs and VM operations, with XGS these can then be
tied to GPU HW events.


Fundamentally (modulo bugs) there is little change compared to kernel
submission - it's already fairly trivial to write GPU job which will
make no forward progress (a 'while (1)' equivalent job). The only
difference here is that XGS makes this 'easy' and doesn't involve the
GPU spinning. Either way we rely on a timeout to recover from these
situations.

Thanks,
Steve

> Regards,
> Christian.
> 
>>
>> This is still a work-in-progress, there's an outstanding issue with
>> multiple processes using different submission flows triggering
>> scheduling bugs (e.g. the same group getting scheduled twice), but we'd
>> love to gather some feedback on the suitability of the approach in
>> general and see if there's a clear path to merging something like this
>> eventually.
>>
>> I've also CCd AMD maintainers because they have in the past done
>> something similar[1], in case they want to chime in.
>>
>> There are two uses of this new uAPI in Mesa, one in gallium/panfrost
>> (link TBD), and one in panvk [2].
>>
>> The Gallium implementation is a naïve change just to switch the
>> submission model and exercise the new kernel code, and we don't plan
>> on pursuing this at this time.
>>
>> The panvk driver changes are, however, a better representation of the
>> intent behind this new uAPI, so please consider that as the reference
>> userspace. It is still very much also a work in progress.
>>
>>   * patch 1 adds all the uAPI changes;
>>   * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
>>     the required objects to userspace;
>>   * patch 3 maps the doorbell pages, similarly to how the user I/O
>> page is
>>     mapped;
>>   * patch 4 implements GROUP_KICK, which lets userspace request an
>>     inactive group to be scheduled on the GPU;
>>   * patches 5 & 6 implement XGS queues, a way for userspace to
>>     synchronise GPU queue progress with DRM syncobjs;
>>   * patches 7 & 8 add notification mechanisms for user & kernel to signal
>>     changes to native GPU syncobjs.
>>
>> [1]
>> https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
>> [2]
>> https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads
>>
>> Ketil Johnsen (7):
>>    drm/panthor: Add uAPI to submit from user space
>>    drm/panthor: Extend GROUP_CREATE for user submission
>>    drm/panthor: Map doorbell pages
>>    drm/panthor: Add GROUP_KICK ioctl
>>    drm/panthor: Factor out syncobj handling
>>    drm/panthor: Implement XGS queues
>>    drm/panthor: Add SYNC_UPDATE ioctl
>>
>> Mihail Atanassov (1):
>>    drm/panthor: Add sync_update eventfd handling
>>
>>   drivers/gpu/drm/panthor/Makefile          |   4 +-
>>   drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
>>   drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
>>   drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
>>   drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
>>   drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
>>   drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
>>   drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
>>   drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
>>   drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
>>   drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
>>   include/uapi/drm/panthor_drm.h            | 243 +++++++-
>>   12 files changed, 1696 insertions(+), 177 deletions(-)
>>   create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
>>   create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
>>   create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
>>   create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h
>>
> 

