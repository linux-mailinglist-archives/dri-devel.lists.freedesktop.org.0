Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE976D6CF5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C1910E760;
	Tue,  4 Apr 2023 19:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01CC10E760
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 19:07:32 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 j4-20020a4adf44000000b0053e8b5524abso2588485oou.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 12:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680635251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62vr+7Eg/ixiMFtXaEtpf4K9Oy7P4lkrrtVb8zcajok=;
 b=O1ROaVl6uWqiqh85hToYWRnTL9SQZLlQJn/rYBvfmMLWinBz9XFF0LVKJS8RNfwOB9
 UF2tV7FQgWQFhy+kjA7MJO+yNhSV65/uLwmJ+3jBi8/PWx4Qyq1QvprROBqF0Wf9ma8G
 i0MMgGW5M2EG4QaAzIVMpsUwXpVAAyA/0E+dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680635251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=62vr+7Eg/ixiMFtXaEtpf4K9Oy7P4lkrrtVb8zcajok=;
 b=dPEcQFuT4ey4a3mvEIWIPWnef9/t4nbPprPbya30h5k9DKDffjJdJDAvcL4riaF4lR
 ke7EWqekRCLR/RS2vwhoyuBoleHbXPmRGEyCaTeyNcSEmvOEiozI7SjvFfqGxH5qkAZW
 yC3RflhLxnvFvyaZ2+A3OVZErsLu/myjMMnOiTQcIJIYdS6rXiQormeKBNr8s21VKRYv
 aUdFuB/gYNIz4d+1Vq8vd0+PBDUGEBFRm7GMtL8p1hKgM04IbhVzfqWTdkR3LTs6xMSd
 2C5DAZOFVxXae86C2HToR9eIXN5+M0pphUjXjwUUzqU8whNSAvFHEhyHx7gDH9C/PNlD
 axJA==
X-Gm-Message-State: AAQBX9enuNrrTcHPzCD3VY6VXKw3s8wAngVd/aIwid+qsRFX52WIeNpL
 cwG4YWgBaaUKZgRkQ+A0B9/CiXk5eJwmFVH8IvASgQ==
X-Google-Smtp-Source: AKy350aXPTcszMT5KClhJ90PGc6cP4BWMBvzwti2ugWK67ArFC4/gL5EuBzGeFAk1g/o28GyD5gyNuYIhNCHCI0QmpA=
X-Received: by 2002:a4a:c318:0:b0:53b:4e0a:6714 with SMTP id
 c24-20020a4ac318000000b0053b4e0a6714mr1585951ooq.0.1680635251725; Tue, 04 Apr
 2023 12:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
 <ZCwrgvAHGvdTCe7K@DUT025-TGLU.fm.intel.com>
 <da288e41-6c5d-0595-e659-5746bfc0ee87@linux.intel.com>
In-Reply-To: <da288e41-6c5d-0595-e659-5746bfc0ee87@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Apr 2023 21:07:20 +0200
Message-ID: <CAKMK7uHq-s+EPR6fJVpb-Q49Ad6H2zYt7JVCQTubBCPSej4JKA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Apr 2023 at 19:29, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 04/04/2023 14:52, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 10:43:03AM +0100, Tvrtko Ursulin wrote:
> >>
> >> On 04/04/2023 01:22, Matthew Brost wrote:
> >>> Hello,
> >>>
> >>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> >>> have been asked to merge our common DRM scheduler patches first as we=
ll
> >>> as develop a common solution for long running workloads with the DRM
> >>> scheduler. This RFC series is our first attempt at doing this. We
> >>> welcome any and all feedback.
> >>>
> >>> This can we thought of as 4 parts detailed below.
> >>>
> >>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
> >>> entity (patches 1-3)
> >>>
> >>> In Xe all of the scheduling of jobs is done by a firmware scheduler (=
the
> >>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
> >>> severals problems as the DRM was originally designed to schedule jobs=
 on
> >>> hardware queues. The main problem being that DRM scheduler expects th=
e
> >>> submission order of jobs to be the completion order of jobs even acro=
ss
> >>> multiple entities. This assumption falls apart with a firmware schedu=
ler
> >>> as a firmware scheduler has no concept of jobs and jobs can complete =
out
> >>> of order. A novel solution for was originally thought of by Faith dur=
ing
> >>> the initial prototype of Xe, create a 1 to 1 relationship between sch=
eduler
> >>> and entity. I believe the AGX driver [3] is using this approach and
> >>> Boris may use approach as well for the Mali driver [4].
> >>>
> >>> To support a 1 to 1 relationship we move the main execution function
> >>> from a kthread to a work queue and add a new scheduling mode which
> >>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> >>> The new scheduling mode should unify all drivers usage with a 1 to 1
> >>> relationship and can be thought of as using scheduler as a dependency=
 /
> >>> infligt job tracker rather than a true scheduler.
> >>
> >> Once you add capability for a more proper 1:1 via
> >> DRM_SCHED_POLICY_SINGLE_ENTITY, do you still have further need to repl=
ace
> >> kthreads with a wq?
> >>
> >> Or in other words, what purpose does the offloading of a job picking c=
ode to
> >> a separate execution context serve? Could it be done directly in the 1=
:1
> >> mode and leave kthread setup for N:M?
> >>
> >
> > Addressed the other two on my reply to Christian...
> >
> > For this one basically the concept of a single entity point IMO is a
> > very good concept which I'd like to keep. But most important reason
> > being the main execution thread (now worker) is kicked when a dependenc=
y
> > for a job is resolved, dependencies are dma-fences signaled via a
> > callback, and these call backs can be signaled in IRQ contexts. We
> > absolutely do not want to enter the backend in an IRQ context for a
> > variety of reasons.
>
> Sounds like a fair enough requirement but if drivers will not be
> comfortable with the wq conversion, it is probably possible to introduce
> some vfuncs for the 1:1 case which would allow scheduler users override
> the scheduler wakeup and select a special "pick one job" path. That
> could allow 1:1 users do their thing, leaving rest as is. I mean you
> already have the special single entity scheduler, you'd just need to add
> some more specialization on the init, wake up, etc paths.
>
> And I will mention once more that I find a wq item with a loop such as:
>
>         while (!READ_ONCE(sched->pause_run_wq)) {
>         ...
>
> A bit dodgy. If you piggy back on any system_wq it smells of system wide
> starvation so for me any proposal with an option to use a system shared
> wq is a no go.

Yeah I think the argument for wq based scheduler would need a
per-drm_scheduler wq, like we currently have a per-scheduler kthread.
It might still need some serious work to replace the
kthread_stop/start() with a wq-native equivalent (because really this
is the tricky stuff we shouldn't hand-roll unless someone is willing
to write a few papers on the lockless design that's done), but would
look a bunch more reasonable. Having a per-sched workqueue might also
help with the big sched_stop/start/fini state transitions, which I
really think should still go over all the per-entity schedulers even
in the 1:1 case (because otherwise you get some funky code in drivers
that do the iterations needed, which probably tosses the fairly nice
design the current scheduler has by relying on the kthread_stop/start
primitives for this.
-Daniel

>
> Regards,
>
> Tvrtko
>
>
> >> Apart from those design level questions, low level open IMO still is t=
hat
> >> default fallback of using the system_wq has the potential to affect la=
tency
> >> for other drivers. But that's for those driver owners to approve.
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>> - Generic messaging interface for DRM scheduler
> >>>
> >>> Idea is to be able to communicate to the submission backend with in b=
and
> >>> (relative to main execution function) messages. Messages are backend
> >>> defined and flexable enough for any use case. In Xe we use these
> >>> messages to clean up entites, set properties for entites, and suspend=
 /
> >>> resume execution of an entity [5]. I suspect other driver can leverag=
e
> >>> this messaging concept too as it a convenient way to avoid races in t=
he
> >>> backend.
> >>>
> >>> - Support for using TDR for all error paths of a scheduler / entity
> >>>
> >>> Fix a few races / bugs, add function to dynamically set the TDR timeo=
ut.
> >>>
> >>> - Annotate dma-fences for long running workloads.
> >>>
> >>> The idea here is to use dma-fences only as sync points within the
> >>> scheduler and never export them for long running workloads. By
> >>> annotating these fences as long running we ensure that these dma-fenc=
es
> >>> are never used in a way that breaks the dma-fence rules. A benefit of
> >>> thus approach is the scheduler can still safely flow control the
> >>> execution ring buffer via the job limit without breaking the dma-fenc=
e
> >>> rules.
> >>>
> >>> Again this a first draft and looking forward to feedback.
> >>>
> >>> Enjoy - Matt
> >>>
> >>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> >>> [2] https://patchwork.freedesktop.org/series/112188/
> >>> [3] https://patchwork.freedesktop.org/series/114772/
> >>> [4] https://patchwork.freedesktop.org/patch/515854/?series=3D112188&r=
ev=3D1
> >>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/d=
rivers/gpu/drm/xe/xe_guc_submit.c#L1031
> >>>
> >>> Matthew Brost (8):
> >>>     drm/sched: Convert drm scheduler to use a work queue rather than
> >>>       kthread
> >>>     drm/sched: Move schedule policy to scheduler / entity
> >>>     drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
> >>>     drm/sched: Add generic scheduler message interface
> >>>     drm/sched: Start run wq before TDR in drm_sched_start
> >>>     drm/sched: Submit job before starting TDR
> >>>     drm/sched: Add helper to set TDR timeout
> >>>     drm/syncobj: Warn on long running dma-fences
> >>>
> >>> Thomas Hellstr=C3=B6m (2):
> >>>     dma-buf/dma-fence: Introduce long-running completion fences
> >>>     drm/sched: Support long-running sched entities
> >>>
> >>>    drivers/dma-buf/dma-fence.c                 | 142 +++++++---
> >>>    drivers/dma-buf/dma-resv.c                  |   5 +
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
> >>>    drivers/gpu/drm/drm_syncobj.c               |   5 +-
> >>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
> >>>    drivers/gpu/drm/lima/lima_sched.c           |   5 +-
> >>>    drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
> >>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
> >>>    drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
> >>>    drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
> >>>    drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
> >>>    drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-=
----
> >>>    drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
> >>>    include/drm/gpu_scheduler.h                 | 130 +++++++--
> >>>    include/linux/dma-fence.h                   |  60 ++++-
> >>>    16 files changed, 649 insertions(+), 184 deletions(-)
> >>>



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
