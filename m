Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F776E67D4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 17:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1270D10E15F;
	Tue, 18 Apr 2023 15:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5BF4D10E1E7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 15:10:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DBA51691
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:11:15 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 175A43F5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 08:10:30 -0700 (PDT)
Date: Tue, 18 Apr 2023 16:10:29 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZD6y5V1mOPQso_jX@e110455-lin.cambridge.arm.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 ketil.johnsen@arm.com, john.reitan@arm.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 05:22:01PM -0700, Matthew Brost wrote:
> Hello,

Hello,

Jumping a bit late on this thread as I was waiting on some approvals and then
holidays kicked in, but I would like to (re)introduce myself and the people
I work with and to let you know that we are interested in the changes proposed
here and we would like to help if we can.

I currently maintain a number of Arm Mali Display drivers but in recent times
I have moved to the Mali GPU team and now we've got approval to start making
contributions to the upstream driver(s). We're planning to collaborate on
Boris' new Mali driver and make it work well on Mali GPUs. One of the first
things to look at (besides bringing the driver up on internal dev platforms)
are the scheduler changes proposed here.

As such, I would like to ask that people start including John Reitan,
Ketil Johnsen and me on patches. As soon as we have something working and we
can make comments on, we will do so.

Best regards,
Liviu


> 
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first as well
> as develop a common solution for long running workloads with the DRM
> scheduler. This RFC series is our first attempt at doing this. We
> welcome any and all feedback.
> 
> This can we thought of as 4 parts detailed below.
> 
> - DRM scheduler changes for 1 to 1 relationship between scheduler and
> entity (patches 1-3)
> 
> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> GuC) which is a new paradigm WRT to the DRM scheduler and presents
> severals problems as the DRM was originally designed to schedule jobs on
> hardware queues. The main problem being that DRM scheduler expects the
> submission order of jobs to be the completion order of jobs even across
> multiple entities. This assumption falls apart with a firmware scheduler
> as a firmware scheduler has no concept of jobs and jobs can complete out
> of order. A novel solution for was originally thought of by Faith during
> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> and entity. I believe the AGX driver [3] is using this approach and
> Boris may use approach as well for the Mali driver [4].
> 
> To support a 1 to 1 relationship we move the main execution function
> from a kthread to a work queue and add a new scheduling mode which
> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> The new scheduling mode should unify all drivers usage with a 1 to 1
> relationship and can be thought of as using scheduler as a dependency /
> infligt job tracker rather than a true scheduler.
> 
> - Generic messaging interface for DRM scheduler
> 
> Idea is to be able to communicate to the submission backend with in band
> (relative to main execution function) messages. Messages are backend
> defined and flexable enough for any use case. In Xe we use these
> messages to clean up entites, set properties for entites, and suspend /
> resume execution of an entity [5]. I suspect other driver can leverage
> this messaging concept too as it a convenient way to avoid races in the
> backend.
> 
> - Support for using TDR for all error paths of a scheduler / entity
> 
> Fix a few races / bugs, add function to dynamically set the TDR timeout.
> 
> - Annotate dma-fences for long running workloads.
> 
> The idea here is to use dma-fences only as sync points within the
> scheduler and never export them for long running workloads. By
> annotating these fences as long running we ensure that these dma-fences
> are never used in a way that breaks the dma-fence rules. A benefit of
> thus approach is the scheduler can still safely flow control the
> execution ring buffer via the job limit without breaking the dma-fence
> rules.
> 
> Again this a first draft and looking forward to feedback.
> 
> Enjoy - Matt
> 
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/ 
> [3] https://patchwork.freedesktop.org/series/114772/
> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> 
> Matthew Brost (8):
>   drm/sched: Convert drm scheduler to use a work queue rather than
>     kthread
>   drm/sched: Move schedule policy to scheduler / entity
>   drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>   drm/sched: Add generic scheduler message interface
>   drm/sched: Start run wq before TDR in drm_sched_start
>   drm/sched: Submit job before starting TDR
>   drm/sched: Add helper to set TDR timeout
>   drm/syncobj: Warn on long running dma-fences
> 
> Thomas Hellström (2):
>   dma-buf/dma-fence: Introduce long-running completion fences
>   drm/sched: Support long-running sched entities
> 
>  drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>  drivers/dma-buf/dma-resv.c                  |   5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>  drivers/gpu/drm/drm_syncobj.c               |   5 +-
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>  drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>  drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>  drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>  drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>  drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>  drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>  include/drm/gpu_scheduler.h                 | 130 +++++++--
>  include/linux/dma-fence.h                   |  60 ++++-
>  16 files changed, 649 insertions(+), 184 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
