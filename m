Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE74AA71FE
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A63E10E902;
	Fri,  2 May 2025 12:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aS2SMur6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8AF10E8F6;
 Fri,  2 May 2025 12:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=90jkIdPO70IJf+D9KSKIqYihst8wc8T3tiBR7aSKP/g=; b=aS2SMur609aPRmcxVuQZxYPLbO
 1uy9ybsc/qTprNM0/Kf+sGZ4Qi+tbPLbc0g4rBtDUh2WUOPu+g1iXGpGt3Ap5zSSsG+tqRIdE1NDE
 KhpqPjzRbUVjLfSKb2GsXswilyWjIjFAEGc1qL5cjMiiGqX+zX3FiW6aziq/dcGHxhRqm9QrVX7TN
 lNvlUCAwWGycGE6sRi02wWPN3ir/zmSmcMFJhec9CTW7D++3+x1hxmFVSkdM82I0c+rRkqgWhGfLi
 rhgrKQSLvv7CooGN7oyu6FjjykdOe1mcZpSflAGWWQJHrYRZb2hKHtCMvAkcJefkfxGLVEXPZ2PQe
 ZvjuDz2Q==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uApYm-0025Fh-3P; Fri, 02 May 2025 14:33:59 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Leo Liu <Leo.Liu@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Rob Clark <robdclark@gmail.com>, Tejun Heo <tj@kernel.org>
Subject: [RFC v7 00/23] DRM scheduling cgroup controller
Date: Fri,  2 May 2025 13:32:33 +0100
Message-ID: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
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

Hi all,

This is another respin of this old work^1 but this version is a total rewrite
and completely changes how the control is done.

This time round the work builds upon the "fair" DRM scheduler work I have posted
recently^2. I am including those patches for completeness and because there were
some tweaks there.

-> It also means people only interested into the cgroup portion probably only
   need to look at the last seven patches.

   And of those seven the last one is an example how a DRM scheduler based DRM
   driver can be wired up with the cgroup controller. So it is quite simple.

To illustrate the runtime effects I ran the Unigine Heaven benchmark in
parallel with the deferredmultisampling Vulkan demo, each in its own cgroup.
First the scheduling weights were the default 100 and 100 respectively, and we
look at the GPU utilisation:

  https://people.igalia.com/tursulin/drmcgroup-100-100.png

It is about equal or therabout since it oscillates at runtime as the benchmark
scenes change.

Then we change drm.weight of the deferredmultisampling cgroup to 1:

  https://people.igalia.com/tursulin/drmcgroup-100-1.png

There we see around 75:25 in favour of Unigine Heaven. (Although it also
oscillates as explained above).

Important to note is that with GPUs the control is still not nowhere as precise
and accurate as with the CPU controller and that the fair scheduler is work in
progress. But it works and looks useful.

Going into the implementation, in this version it is much simpler than before
since the mechanism of time budgets and over-budget singalling is completely
gone and replaced with notifying clients directly about their assigned relative
scheduling weights.

This connects really nicely with the fair DRM scheduler RFC since we can simply
mix in the scheduling weight with the existing scheduling entity priority based
runtime to vruntime scaling factors.

It also means there is much less code in the controller itself.

Another advantage is that it is really easy to wire up individual drivers which
use the DRM scheduler in the hardware scheduling mode (ie. not 1:1 firmware
scheduling).

On the userspace interface side of things it is the same as before. We have
drm.weight as an interface, taking integers from 1 to 10000, the same as CPU and
IO cgroup controllers.

About the use cases, it is the same as before. With this we would be able to run
a workload in the background and make it compete less with the foreground load.
Be it explicitly or when integrating with Desktop Environments some of which
already have cgroup support for tracking foreground vs background windows or
similar.

I would be really interested if people would attempt to try this out, either
directly the amdgpu support as provided in the series, or by wiring up other
drivers.

P.S.
About the CC list. It's a large series so I will put most people on Cc only in
the cover letter as a ping of a sort. Whoever is interested can for now find the
series in the archives.

1)
https://lore.kernel.org/dri-devel/20231024160727.282960-1-tvrtko.ursulin@linux.intel.com/

2)
https://lore.kernel.org/dri-devel/20250425102034.85133-1-tvrtko.ursulin@igalia.com/

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
CC: Leo Liu <Leo.Liu@amd.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Koutný <mkoutny@suse.com>
Cc: Michel Dänzer <michel.daenzer@mailbox.org>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Tejun Heo <tj@kernel.org>

Tvrtko Ursulin (23):
  drm/sched: Add some scheduling quality unit tests
  drm/sched: Add some more scheduling quality unit tests
  drm/sched: De-clutter drm_sched_init
  drm/sched: Avoid double re-lock on the job free path
  drm/sched: Consolidate drm_sched_job_timedout
  drm/sched: Consolidate drm_sched_rq_select_entity_rr
  drm/sched: Implement RR via FIFO
  drm/sched: Consolidate entity run queue management
  drm/sched: Move run queue related code into a separate file
  drm/sched: Free all finished jobs at once
  drm/sched: Account entity GPU time
  drm/sched: Remove idle entity from tree
  drm/sched: Add fair scheduling policy
  drm/sched: Remove FIFO and RR and simplify to a single run queue
  drm/sched: Queue all free credits in one worker invocation
  drm/sched: Embed run queue singleton into the scheduler
  cgroup: Add the DRM cgroup controller
  cgroup/drm: Track DRM clients per cgroup
  cgroup/drm: Add scheduling weight callback
  cgroup/drm: Introduce weight based scheduling control
  drm/sched: Add helper for tracking entities per client
  drm/sched: Add helper for DRM cgroup controller weight notifications
  drm/amdgpu: Register with the DRM scheduling cgroup controller

 Documentation/admin-guide/cgroup-v2.rst       |  22 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       |  13 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |   9 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h       |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       |   8 +-
 drivers/gpu/drm/drm_file.c                    |  11 +
 drivers/gpu/drm/scheduler/Makefile            |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c      | 158 ++--
 drivers/gpu/drm/scheduler/sched_fence.c       |   2 +-
 drivers/gpu/drm/scheduler/sched_internal.h    | 126 ++-
 drivers/gpu/drm/scheduler/sched_main.c        | 570 +++---------
 drivers/gpu/drm/scheduler/sched_rq.c          | 214 +++++
 drivers/gpu/drm/scheduler/tests/Makefile      |   3 +-
 .../gpu/drm/scheduler/tests/tests_scheduler.c | 815 ++++++++++++++++++
 include/drm/drm_drv.h                         |  26 +
 include/drm/drm_file.h                        |  11 +
 include/drm/gpu_scheduler.h                   |  68 +-
 include/linux/cgroup_drm.h                    |  29 +
 include/linux/cgroup_subsys.h                 |   4 +
 init/Kconfig                                  |   5 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/drm.c                           | 446 ++++++++++
 27 files changed, 2024 insertions(+), 574 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.48.0

