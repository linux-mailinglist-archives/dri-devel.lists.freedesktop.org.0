Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E16D77B9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C8C10E893;
	Wed,  5 Apr 2023 09:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C22F10E899
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 09:07:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5002f12ccfeso13951a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 02:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680685640; x=1683277640;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tzJnvhB1dv+h9nrdcDLBhEMjbpVXekolc3KXM5j5Z3o=;
 b=H3vo/YHXXKaVssvVV/d+sy1ZAb6q3yFGmA3BfDcxTO560tert9cT+HBcdwBD4j/KGx
 VWy5+wtM7LYuxWdthBqNf44biFG8N917Pais00S+FnNLmjFzXnThrhz7xPDNOYAOo0qr
 7zCe0g+abjaYRJrfzbD92xUKy0o6zfw8n4jdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680685640; x=1683277640;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzJnvhB1dv+h9nrdcDLBhEMjbpVXekolc3KXM5j5Z3o=;
 b=C+vmJRwTlfU1DUjPeUg2x8f8tvkwGI1J44qdwlVxZqnH8An+J247/wd+UjeHc4qIHf
 tKN0vBTeJLBjXyxxVibeJ1gVaKJc5mg/W4aohpjHJuvRiktNMtLsrG4HxfqY/N5j98ru
 edRK7uLu4rrEXTg+Dbtz090TjBKFW+wsOgUZrCP/oGxe0qgxNx9X03twXyLAiwbBk0H9
 Kitvl3mLbNq2KXJYlq1B+cDj/l4Z1bbAfH5Eu+jRIciVCUx0ghCSUoNgLAbhBPaqhy6H
 kCjCsHhSUXKaaqbWDf0BMXY6TmJQqN8FbfYPxetuvsErFWI4Z4IsZUUQWMd+2Vs5JYhT
 IaFw==
X-Gm-Message-State: AAQBX9cmJKkrlcGD5uTSa+Mv178T3FFo2I5m5ghs0SpRAYSQxNoYKKLV
 uUTqAdFN+pSyP3rmVBpDLc3SOA==
X-Google-Smtp-Source: AKy350Y3ygIrYkk2PoKlXTrQazPkQNCs/hM+0163LLWH20/+BpUmfEAdtlJwZt8NUA46TSe8Cf961w==
X-Received: by 2002:a17:906:7491:b0:949:148d:82c1 with SMTP id
 e17-20020a170906749100b00949148d82c1mr1190661ejl.0.1680685640490; 
 Wed, 05 Apr 2023 02:07:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 b12-20020a50cccc000000b004fc01b0aa55sm6982268edj.4.2023.04.05.02.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 02:07:20 -0700 (PDT)
Date: Wed, 5 Apr 2023 11:07:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Message-ID: <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 10:53:26AM +0200, Christian König wrote:
> Am 05.04.23 um 10:34 schrieb Daniel Vetter:
> > On Wed, Apr 05, 2023 at 09:41:23AM +0200, Christian König wrote:
> > > Am 04.04.23 um 15:37 schrieb Matthew Brost:
> > > > On Tue, Apr 04, 2023 at 11:13:28AM +0200, Christian König wrote:
> > > > > Hi,
> > > > > 
> > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > Hello,
> > > > > > 
> > > > > > As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> > > > > > have been asked to merge our common DRM scheduler patches first as well
> > > > > > as develop a common solution for long running workloads with the DRM
> > > > > > scheduler. This RFC series is our first attempt at doing this. We
> > > > > > welcome any and all feedback.
> > > > > > 
> > > > > > This can we thought of as 4 parts detailed below.
> > > > > > 
> > > > > > - DRM scheduler changes for 1 to 1 relationship between scheduler and
> > > > > > entity (patches 1-3)
> > > > > > 
> > > > > > In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> > > > > > GuC) which is a new paradigm WRT to the DRM scheduler and presents
> > > > > > severals problems as the DRM was originally designed to schedule jobs on
> > > > > > hardware queues. The main problem being that DRM scheduler expects the
> > > > > > submission order of jobs to be the completion order of jobs even across
> > > > > > multiple entities. This assumption falls apart with a firmware scheduler
> > > > > > as a firmware scheduler has no concept of jobs and jobs can complete out
> > > > > > of order. A novel solution for was originally thought of by Faith during
> > > > > > the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> > > > > > and entity. I believe the AGX driver [3] is using this approach and
> > > > > > Boris may use approach as well for the Mali driver [4].
> > > > > > 
> > > > > > To support a 1 to 1 relationship we move the main execution function
> > > > > > from a kthread to a work queue and add a new scheduling mode which
> > > > > > bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> > > > > > The new scheduling mode should unify all drivers usage with a 1 to 1
> > > > > > relationship and can be thought of as using scheduler as a dependency /
> > > > > > infligt job tracker rather than a true scheduler.
> > > > > > 
> > > > > > - Generic messaging interface for DRM scheduler
> > > > > > 
> > > > > > Idea is to be able to communicate to the submission backend with in band
> > > > > > (relative to main execution function) messages. Messages are backend
> > > > > > defined and flexable enough for any use case. In Xe we use these
> > > > > > messages to clean up entites, set properties for entites, and suspend /
> > > > > > resume execution of an entity [5]. I suspect other driver can leverage
> > > > > > this messaging concept too as it a convenient way to avoid races in the
> > > > > > backend.
> > > > > Oh, please absolutely *don't* do this.
> > > > > 
> > > > > This is basically the design which makes a bunch of stuff so horrible broken
> > > > > on Windows.
> > > > > 
> > > > > I can explain it in more detail if necessary, but I strongly recommend to
> > > > > not go down this path.
> > > > > 
> > > > I'm afraid we are going to have to discuss this further. Let me explain
> > > > my reasoning, basically the idea is to have a single main entry point to
> > > > backend - the work queue. This avoids the need for lock between run_job
> > > > and any message that changes an entites state, also it really helps
> > > > during the reset flows (either TDR or GT reset) as we can call
> > > > drm_sched_run_wq_stop can ensure that nothing else is in the backend
> > > > changing an entity state. It all works out really nicely actually, our
> > > > GuC backend is incredibly stable (hasn't really had a bug pop in about a
> > > > year) and way simpler than what we did in the i915. I think the simplity
> > > > to largely due to this design of limiting the entry points.
> > > > 
> > > > I personally don't see how this a poor design, limiting entry points
> > > > absolutely makes sense to me, if it didn't why not just call cleanup_job
> > > > bypassing the main execution thread (now worker), this is the exact same
> > > > concept.
> > > Well then I strongly suggest to read a few analyses on the failure of the
> > > message processing loop on Windows.
> > > 
> > > Have you ever wondered why classic Win32 applications sometimes seems to be
> > > stuck and don't do anything? This design pattern combine with timeouts to
> > > solve deadlocks is the reason for that.
> > > 
> > > The major problem with this approach is that analyzing tools like lockdep
> > > have a hard time grasping the dependencies.
> > wq is fully annotated and actually splats. Plain kthread doesn't, without
> > adding something like the dma_fence_signalling stuff.
> > 
> > But yeah if you block badly in the work items and stall the entire queue,
> > then things go sideways real bad. There's not really any tools we have in
> > the kernel to enforce this, since we still want to allow mutex and
> > sleeping and stuff like that.
> > 
> > > What you can do is to offload all your operations which are supposed to be
> > > run in the same thread as work items into a work queue. This is something
> > > lockdep understands and is able to scream out lout if someone messes up the
> > > deadlock dependencies.
> > I thought that's the plan here?
> 
> At least from my impression that didn't looked like what was implemented
> here.

Yup the current patches aren't what we want I think, at least not in these
details.

> 
> >   Or at least what I thought the plan was,
> > and why I really think we need a per engine worqqueue to make it work well
> > (and also why I suggested the refactoring to split up drm_scheduler into
> > the driver api struct, which stays per-engine, and the internal backend
> > which would be per drm_sched_entity for fw schedulers that round-robin gpu
> > ctx on their own).
> > 
> > Also maybe we need to allow drivers to pass in the workqueue like we allow
> > for the tdr handling already, since that simplifies the locking.
> > 
> > At least for intel gpu I think this message passing design makes some
> > sense because fundamentally the fw only has a single blocking message
> > queue. And so intel/xe fundamentally needs to deal with the "stupid code
> > might block forward progress for everyone" problem you're describing, not
> > matter whether it's done with the help of drm/sched infra or not.
> > 
> > I do agree though that we shouldn't encourage drivers to use this which
> > don't have that kind of fw command queue design. So maybe a huge comment
> > to explain when (and _only_ when) it's ok to use that message passing
> > would be needed, and explaining why in other cases it would make things a
> > lot worse?
> 
> I would approach it from the complete other side. This component here is a
> tool to decide what job should run next.
> 
> How that is then signaled and run should not be part of the scheduler, but
> another more higher level component.
> 
> This way you also don't have a problem with not using DMA-fences as
> dependencies as well as constrains for running more jobs.

I think we're talking about two things here and mixing them up.

For the dependencies I agree with you, and imo that higher level tool
should probably just be an on-demand submit thread in userspace for the
rare case where the kernel would need to sort out a dependency otherwise
(due to running out of ringspace in the per-ctx ringbuffer).

The other thing is the message passing stuff, and this is what I was
talking about above. This has nothing to do with handling dependencies,
but with talking to the gpu fw. Here the intel design issue is that the fw
only provides a single queue, and it's in-order. Which means it
fundamentally has the stalling issue you describe as a point against a
message passing design. And fundamentally we need to be able to talk to
the fw in the scheduler ->run_job callback.

The proposal here for the message passing part is that since it has the
stalling issue already anyway, and the scheduler needs to be involved
anyway, it makes sense to integrated this (as an optional thing, only for
drivers which have this kind of fw interface) into the scheduler.
Otherwise you just end up with two layers for no reason and more ping-pong
delay because the ->run_job needs to kick off the subordinate driver layer
first. Note that for this case the optional message passing support in the
drm/scheduler actually makes things better, because it allows you to cut
out one layer.

Of course if a driver with better fw interface uses this message passing
support, then that's bad. Hence the big warning in the kerneldoc.
-Daniel

> 
> Christian.
> 
> > -Daniel
> > 
> > > Regards,
> > > Christian.
> > > 
> > > > FWIW Asahi liked the idea as well and think it could be useful for AGX.
> > > > Matt
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > > - Support for using TDR for all error paths of a scheduler / entity
> > > > > > 
> > > > > > Fix a few races / bugs, add function to dynamically set the TDR timeout.
> > > > > > 
> > > > > > - Annotate dma-fences for long running workloads.
> > > > > > 
> > > > > > The idea here is to use dma-fences only as sync points within the
> > > > > > scheduler and never export them for long running workloads. By
> > > > > > annotating these fences as long running we ensure that these dma-fences
> > > > > > are never used in a way that breaks the dma-fence rules. A benefit of
> > > > > > thus approach is the scheduler can still safely flow control the
> > > > > > execution ring buffer via the job limit without breaking the dma-fence
> > > > > > rules.
> > > > > > 
> > > > > > Again this a first draft and looking forward to feedback.
> > > > > > 
> > > > > > Enjoy - Matt
> > > > > > 
> > > > > > [1] https://gitlab.freedesktop.org/drm/xe/kernel
> > > > > > [2] https://patchwork.freedesktop.org/series/112188/
> > > > > > [3] https://patchwork.freedesktop.org/series/114772/
> > > > > > [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> > > > > > [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
> > > > > > 
> > > > > > Matthew Brost (8):
> > > > > >      drm/sched: Convert drm scheduler to use a work queue rather than
> > > > > >        kthread
> > > > > >      drm/sched: Move schedule policy to scheduler / entity
> > > > > >      drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> > > > > >      drm/sched: Add generic scheduler message interface
> > > > > >      drm/sched: Start run wq before TDR in drm_sched_start
> > > > > >      drm/sched: Submit job before starting TDR
> > > > > >      drm/sched: Add helper to set TDR timeout
> > > > > >      drm/syncobj: Warn on long running dma-fences
> > > > > > 
> > > > > > Thomas Hellström (2):
> > > > > >      dma-buf/dma-fence: Introduce long-running completion fences
> > > > > >      drm/sched: Support long-running sched entities
> > > > > > 
> > > > > >     drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> > > > > >     drivers/dma-buf/dma-resv.c                  |   5 +
> > > > > >     drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> > > > > >     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> > > > > >     drivers/gpu/drm/drm_syncobj.c               |   5 +-
> > > > > >     drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> > > > > >     drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> > > > > >     drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> > > > > >     drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> > > > > >     drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> > > > > >     drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> > > > > >     drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> > > > > >     drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
> > > > > >     drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> > > > > >     include/drm/gpu_scheduler.h                 | 130 +++++++--
> > > > > >     include/linux/dma-fence.h                   |  60 ++++-
> > > > > >     16 files changed, 649 insertions(+), 184 deletions(-)
> > > > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
