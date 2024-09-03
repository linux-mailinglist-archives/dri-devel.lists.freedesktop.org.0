Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF13969D87
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404FF10E57E;
	Tue,  3 Sep 2024 12:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B07110E57E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:27:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F71CFEC;
 Tue,  3 Sep 2024 05:28:25 -0700 (PDT)
Received: from [10.40.16.110] (e120398-lin.trondheim.arm.com [10.40.16.110])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B73E3F73B;
 Tue,  3 Sep 2024 05:27:55 -0700 (PDT)
Message-ID: <6216c60b-99c0-47fd-b7e8-b6c104139a45@arm.com>
Date: Tue, 3 Sep 2024 14:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon
 <boris.brezillon@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
Content-Language: en-US
From: Ketil Johnsen <ketil.johnsen@arm.com>
In-Reply-To: <20240828172605.19176-1-mihail.atanassov@arm.com>
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

On 28.08.2024 19:25, Mihail Atanassov wrote:
> Hello all,
> 
> This series implements a mechanism to expose Mali CSF GPUs' queue
> ringbuffers directly to userspace, along with paraphernalia to allow
> userspace to control job synchronisation between the CPU and GPU.
> 
> The goal of these changes is to allow userspace to control work
> submission to the FW/HW directly without kernel intervention in the
> common case, thereby reducing context switching overhead. It also allows
> for greater flexibility in the way work is enqueued in the ringbufs.
> For example, the current kernel submit path only supports indirect
> calls, which is inefficient for small command buffers. Userspace can
> also skip unnecessary sync operations.
> 
> This is still a work-in-progress, there's an outstanding issue with
> multiple processes using different submission flows triggering
> scheduling bugs (e.g. the same group getting scheduled twice), but we'd
> love to gather some feedback on the suitability of the approach in
> general and see if there's a clear path to merging something like this
> eventually.
> 
> I've also CCd AMD maintainers because they have in the past done
> something similar[1], in case they want to chime in.
> 
> There are two uses of this new uAPI in Mesa, one in gallium/panfrost
> (link TBD), and one in panvk [2].

Gallium/Panfrost changes to make use of this new user submission API can 
now be found here:
https://gitlab.freedesktop.org/ketil.johnsen/mesa/-/commits/panthor_usersubmit/?ref_type=heads

It is worth repeating, this is just a dumb switch from kernel submission 
to user submission for the Panfrost Gallium driver, no optimizations 
attempted. We have no concrete plans to pursue upstreaming of this for 
the time being. Panvk is our focus in that regard.

--
Regards,
Ketil Johnsen

> The Gallium implementation is a naïve change just to switch the
> submission model and exercise the new kernel code, and we don't plan
> on pursuing this at this time.
> 
> The panvk driver changes are, however, a better representation of the
> intent behind this new uAPI, so please consider that as the reference
> userspace. It is still very much also a work in progress.
> 
>   * patch 1 adds all the uAPI changes;
>   * patch 2 implements the GROUP_CREATE ioctl changes necessary to expose
>     the required objects to userspace;
>   * patch 3 maps the doorbell pages, similarly to how the user I/O page is
>     mapped;
>   * patch 4 implements GROUP_KICK, which lets userspace request an
>     inactive group to be scheduled on the GPU;
>   * patches 5 & 6 implement XGS queues, a way for userspace to
>     synchronise GPU queue progress with DRM syncobjs;
>   * patches 7 & 8 add notification mechanisms for user & kernel to signal
>     changes to native GPU syncobjs.
> 
> [1] https://lore.kernel.org/amd-gfx/CADnq5_N61q_o+5WYUZsZ=qu7VmeXTFHQSxLwTco05gLzHaiswA@mail.gmail.com/t/#m116a36a598d8fad1329e053974ad37a4dc0f28ed
> [2] https://gitlab.freedesktop.org/larsivsi/mesa/-/commits/panvk-v10-usersubmit?ref_type=heads
> 
> Ketil Johnsen (7):
>    drm/panthor: Add uAPI to submit from user space
>    drm/panthor: Extend GROUP_CREATE for user submission
>    drm/panthor: Map doorbell pages
>    drm/panthor: Add GROUP_KICK ioctl
>    drm/panthor: Factor out syncobj handling
>    drm/panthor: Implement XGS queues
>    drm/panthor: Add SYNC_UPDATE ioctl
> 
> Mihail Atanassov (1):
>    drm/panthor: Add sync_update eventfd handling
> 
>   drivers/gpu/drm/panthor/Makefile          |   4 +-
>   drivers/gpu/drm/panthor/panthor_device.c  |  66 ++-
>   drivers/gpu/drm/panthor/panthor_device.h  |  35 +-
>   drivers/gpu/drm/panthor/panthor_drv.c     | 233 +++++++-
>   drivers/gpu/drm/panthor/panthor_fw.c      |   2 +-
>   drivers/gpu/drm/panthor/panthor_sched.c   | 408 +++++++++-----
>   drivers/gpu/drm/panthor/panthor_sched.h   |   8 +-
>   drivers/gpu/drm/panthor/panthor_syncobj.c | 167 ++++++
>   drivers/gpu/drm/panthor/panthor_syncobj.h |  27 +
>   drivers/gpu/drm/panthor/panthor_xgs.c     | 638 ++++++++++++++++++++++
>   drivers/gpu/drm/panthor/panthor_xgs.h     |  42 ++
>   include/uapi/drm/panthor_drm.h            | 243 +++++++-
>   12 files changed, 1696 insertions(+), 177 deletions(-)
>   create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.c
>   create mode 100644 drivers/gpu/drm/panthor/panthor_syncobj.h
>   create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.c
>   create mode 100644 drivers/gpu/drm/panthor/panthor_xgs.h
> 

