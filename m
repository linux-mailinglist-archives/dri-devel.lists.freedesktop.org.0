Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035E532C90
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 16:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7F110F208;
	Tue, 24 May 2022 14:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316210F2D8;
 Tue, 24 May 2022 14:50:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z15so2232699wrg.11;
 Tue, 24 May 2022 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kIY8SwXkyQHVWu+ZYCWYINzybbhqc/eSn/MnJ0CVSeg=;
 b=fpXZ2z7K+jtT26hMRH7ShiF9SE+89YRbSVhNSdIqKjGOqiWi3ZN1HcRb+3yGjBHq47
 Z5UL7WefFLba4BOX225Ci6oPRtxOay2CG3ceJfuf8MU1JMSJoWdNz4WUZ5nKXdfFobo3
 wiOryevVFsgkf4aBkhsvjGt3HzwnlF7L/1OzQ3ZIwGQksnPt+Pgx3M+hMEiQDtsi6TxG
 3OqCpKmO/scCjBezH+NCrUfunVOs6K7XRD1JGjA8uu8Gs7p3/Q4wm13Lpg+0LXQnghg5
 wSjvTCdXujqJacZ/ObJtL+4RsvsOF5fiVCeDmdLFw16K+C/c+A5boWTCSbol7H1rNHut
 HPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kIY8SwXkyQHVWu+ZYCWYINzybbhqc/eSn/MnJ0CVSeg=;
 b=d5hZ64DY54VHzbI1E5q2Z0jQhcec35SFf+OvaT632zUJUEaKhez//rfwx3WteaTgqD
 ooAb2VnJSVb7OpAzD8LFsD6Ga8rrODZiyoddtP4eUc4oAtaGwLuNZjKO9GmyljZX+3Ll
 QdqXAMBpTd2QsxtUn0sMLVNG+/AuPQOuLgkCsBJzqJkHVfqCZFHiubsjqdo7qH3DmG3N
 HMdydB4ajQo2dRNXARGk5FndIlLMNdPJncsxXBUGqFoSpJbNNltbhCJnFHdeZfCDI1G4
 pbnvSojqu/Eo5B4hAHnuPv7qf4K9TUILqNEP3bel70uhM9r4RsQOlHG11F8TcqLDhud/
 Z5FQ==
X-Gm-Message-State: AOAM532enfAH6Q/9D+643jGIJs4H+knX4R6u4lJ/H6lWsgi5Lz+ynM9W
 8l0G+czaTe0k+bY85QO9mx6wjmHG5SNpeltShTYFCQhBOOY=
X-Google-Smtp-Source: ABdhPJyJPJGQNdXm00PRx0f7dWblPP276+2SaSmi1JmN/5N63sEYUqWW6/NHnpdDgiFyIEizNKaZz3jGLZmJpVQ3yqg=
X-Received: by 2002:adf:f645:0:b0:20e:652d:2a4e with SMTP id
 x5-20020adff645000000b0020e652d2a4emr24054581wrp.344.1653403812398; Tue, 24
 May 2022 07:50:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
In-Reply-To: <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 May 2022 07:50:00 -0700
Message-ID: <CAF6AEGsH=K1Hut7QBmF1kX40xS+9px=BrtZecAXVQopNs67Feg@mail.gmail.com>
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 23/05/2022 23:53, Rob Clark wrote:
> > On Mon, May 23, 2022 at 7:45 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> Hi Rob,
> >>
> >> On 28/07/2021 02:06, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> The drm/scheduler provides additional prioritization on top of that
> >>> provided by however many number of ringbuffers (each with their own
> >>> priority level) is supported on a given generation.  Expose the
> >>> additional levels of priority to userspace and map the userspace
> >>> priority back to ring (first level of priority) and schedular priorit=
y
> >>> (additional priority levels within the ring).
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +-
> >>>    drivers/gpu/drm/msm/msm_gem_submit.c    |  4 +-
> >>>    drivers/gpu/drm/msm/msm_gpu.h           | 58 +++++++++++++++++++++=
+++-
> >>>    drivers/gpu/drm/msm/msm_submitqueue.c   | 35 +++++++--------
> >>>    include/uapi/drm/msm_drm.h              | 14 +++++-
> >>>    5 files changed, 88 insertions(+), 27 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/dr=
m/msm/adreno/adreno_gpu.c
> >>> index bad4809b68ef..748665232d29 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >>> @@ -261,8 +261,8 @@ int adreno_get_param(struct msm_gpu *gpu, uint32_=
t param, uint64_t *value)
> >>>                        return ret;
> >>>                }
> >>>                return -EINVAL;
> >>> -     case MSM_PARAM_NR_RINGS:
> >>> -             *value =3D gpu->nr_rings;
> >>> +     case MSM_PARAM_PRIORITIES:
> >>> +             *value =3D gpu->nr_rings * NR_SCHED_PRIORITIES;
> >>>                return 0;
> >>>        case MSM_PARAM_PP_PGTABLE:
> >>>                *value =3D 0;
> >>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/m=
sm/msm_gem_submit.c
> >>> index 450efe59abb5..c2ecec5b11c4 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> >>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> >>> @@ -59,7 +59,7 @@ static struct msm_gem_submit *submit_create(struct =
drm_device *dev,
> >>>        submit->gpu =3D gpu;
> >>>        submit->cmd =3D (void *)&submit->bos[nr_bos];
> >>>        submit->queue =3D queue;
> >>> -     submit->ring =3D gpu->rb[queue->prio];
> >>> +     submit->ring =3D gpu->rb[queue->ring_nr];
> >>>        submit->fault_dumped =3D false;
> >>>
> >>>        INIT_LIST_HEAD(&submit->node);
> >>> @@ -749,7 +749,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, =
void *data,
> >>>        /* Get a unique identifier for the submission for logging purp=
oses */
> >>>        submitid =3D atomic_inc_return(&ident) - 1;
> >>>
> >>> -     ring =3D gpu->rb[queue->prio];
> >>> +     ring =3D gpu->rb[queue->ring_nr];
> >>>        trace_msm_gpu_submit(pid_nr(pid), ring->id, submitid,
> >>>                args->nr_bos, args->nr_cmds);
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_=
gpu.h
> >>> index b912cacaecc0..0e4b45bff2e6 100644
> >>> --- a/drivers/gpu/drm/msm/msm_gpu.h
> >>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> >>> @@ -250,6 +250,59 @@ struct msm_gpu_perfcntr {
> >>>        const char *name;
> >>>    };
> >>>
> >>> +/*
> >>> + * The number of priority levels provided by drm gpu scheduler.  The
> >>> + * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in =
some
> >>> + * cases, so we don't use it (no need for kernel generated jobs).
> >>> + */
> >>> +#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED=
_PRIORITY_MIN)
> >>> +
> >>> +/**
> >>> + * msm_gpu_convert_priority - Map userspace priority to ring # and s=
ched priority
> >>> + *
> >>> + * @gpu:        the gpu instance
> >>> + * @prio:       the userspace priority level
> >>> + * @ring_nr:    [out] the ringbuffer the userspace priority maps to
> >>> + * @sched_prio: [out] the gpu scheduler priority level which the use=
rspace
> >>> + *              priority maps to
> >>> + *
> >>> + * With drm/scheduler providing it's own level of prioritization, ou=
r total
> >>> + * number of available priority levels is (nr_rings * NR_SCHED_PRIOR=
ITIES).
> >>> + * Each ring is associated with it's own scheduler instance.  Howeve=
r, our
> >>> + * UABI is that lower numerical values are higher priority.  So mapp=
ing the
> >>> + * single userspace priority level into ring_nr and sched_prio takes=
 some
> >>> + * care.  The userspace provided priority (when a submitqueue is cre=
ated)
> >>> + * is mapped to ring nr and scheduler priority as such:
> >>> + *
> >>> + *   ring_nr    =3D userspace_prio / NR_SCHED_PRIORITIES
> >>> + *   sched_prio =3D NR_SCHED_PRIORITIES -
> >>> + *                (userspace_prio % NR_SCHED_PRIORITIES) - 1
> >>> + *
> >>> + * This allows generations without preemption (nr_rings=3D=3D1) to h=
ave some
> >>> + * amount of prioritization, and provides more priority levels for g=
ens
> >>> + * that do have preemption.
> >>
> >> I am exploring how different drivers handle priority levels and this
> >> caught my eye.
> >>
> >> Is the implication of the last paragraphs that on hw with nr_rings > 1=
,
> >> ring + 1 preempts ring?
> >
> > Other way around, at least from the uabi standpoint.  Ie. ring[0]
> > preempts ring[1]
>
> Ah yes, I figure it out from the comments but then confused myself when
> writing the email.
>
> >> If so I am wondering does the "spreading" of
> >> user visible priorities by NR_SCHED_PRIORITIES creates a non-preemptab=
le
> >> levels within every "bucket" or how does that work?
> >
> > So, preemption is possible between any priority level before run_job()
> > gets called, which writes the job into the ringbuffer.  After that
>
> Hmm how? Before run_job() the jobs are not runnable, sitting in the
> scheduler queues, right?

I mean, if prio[0]+prio[1]+prio[2] map to a single ring, submit A on
prio[1] could be executed after submit B on prio[2] provided that
run_job(submitA) hasn't happened yet.  So I guess it isn't "really"
preemption because the submit hasn't started running on the GPU yet.
But rather just scheduling according to priority.

> > point, you only have "bucket" level preemption, because
> > NR_SCHED_PRIORITIES levels of priority get mapped to a single FIFO
> > ringbuffer.
>
> Right, and you have one GPU with four rings, which means you expose 12
> priority levels to userspace, did I get that right?

Correct

> If so how do you convey in the ABI that not all there priority levels
> are equal? Like userspace can submit at prio 4 and expect prio 3 to
> preempt, as would prio 2 preempt prio 3. While actual behaviour will not
> match - 3 will not preempt 4.

It isn't really exposed to userspace, but perhaps it should be..
Userspace just knows that, to the extent possible, the kernel will try
to execute prio 3 before prio 4.

> Also, does your userspace stack (EGL/Vulkan) use the priorities? I had a
> quick peek in Mesa but did not spot it - although I am not really at
> home there yet so maybe I missed it.

Yes, there is an EGL extension:

https://www.khronos.org/registry/EGL/extensions/IMG/EGL_IMG_context_priorit=
y.txt

It is pretty limited, it only exposes three priority levels.

BR,
-R

> > -----
> >
> > btw, one fun (but unrelated) issue I'm hitting with scheduler... I'm
> > trying to add an igt test to stress shrinker/eviction, similar to the
> > existing tests/i915/gem_shrink.c.  But we hit an unfortunate
> > combination of circumstances:
> > 1. Pinning memory happens in the synchronous part of the submit ioctl,
> > before enqueuing the job for the kthread to handle.
> > 2. The first run_job() callback incurs a slight delay (~1.5ms) while
> > resuming the GPU
> > 3. Because of that delay, userspace has a chance to queue up enough
> > more jobs to require locking/pinning more than the available system
> > RAM..
>
> Is that one or multiple threads submitting jobs?
>
> > I'm not sure if we want a way to prevent userspace from getting *too*
> > far ahead of the kthread.  Or maybe at some point the shrinker should
> > sleep on non-idle buffers?
>
> On the direct reclaim path when invoked from the submit ioctl? In i915
> we only shrink idle objects on direct reclaim and leave active ones for
> the swapper. It depends on how your locking looks like whether you could
> do them, whether there would be coupling of locks and fs-reclaim context.
>
> Regards,
>
> Tvrtko
>
> > BR,
> > -R
> >
> >>
> >> Regards,
> >>
> >> Tvrtko
> >>
> >>> + */
> >>> +static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int =
prio,
> >>> +             unsigned *ring_nr, enum drm_sched_priority *sched_prio)
> >>> +{
> >>> +     unsigned rn, sp;
> >>> +
> >>> +     rn =3D div_u64_rem(prio, NR_SCHED_PRIORITIES, &sp);
> >>> +
> >>> +     /* invert sched priority to map to higher-numeric-is-higher-
> >>> +      * priority convention
> >>> +      */
> >>> +     sp =3D NR_SCHED_PRIORITIES - sp - 1;
> >>> +
> >>> +     if (rn >=3D gpu->nr_rings)
> >>> +             return -EINVAL;
> >>> +
> >>> +     *ring_nr =3D rn;
> >>> +     *sched_prio =3D sp;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>>    /**
> >>>     * A submitqueue is associated with a gl context or vk queue (or e=
quiv)
> >>>     * in userspace.
> >>> @@ -257,7 +310,8 @@ struct msm_gpu_perfcntr {
> >>>     * @id:        userspace id for the submitqueue, unique within the=
 drm_file
> >>>     * @flags:     userspace flags for the submitqueue, specified at c=
reation
> >>>     *             (currently unusued)
> >>> - * @prio:      the submitqueue priority
> >>> + * @ring_nr:   the ringbuffer used by this submitqueue, which is det=
ermined
> >>> + *             by the submitqueue's priority
> >>>     * @faults:    the number of GPU hangs associated with this submit=
queue
> >>>     * @ctx:       the per-drm_file context associated with the submit=
queue (ie.
> >>>     *             which set of pgtables do submits jobs associated wi=
th the
> >>> @@ -272,7 +326,7 @@ struct msm_gpu_perfcntr {
> >>>    struct msm_gpu_submitqueue {
> >>>        int id;
> >>>        u32 flags;
> >>> -     u32 prio;
> >>> +     u32 ring_nr;
> >>>        int faults;
> >>>        struct msm_file_private *ctx;
> >>>        struct list_head node;
> >>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/=
msm/msm_submitqueue.c
> >>> index 682ba2a7c0ec..32a55d81b58b 100644
> >>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> >>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> >>> @@ -68,6 +68,8 @@ int msm_submitqueue_create(struct drm_device *drm, =
struct msm_file_private *ctx,
> >>>        struct msm_gpu_submitqueue *queue;
> >>>        struct msm_ringbuffer *ring;
> >>>        struct drm_gpu_scheduler *sched;
> >>> +     enum drm_sched_priority sched_prio;
> >>> +     unsigned ring_nr;
> >>>        int ret;
> >>>
> >>>        if (!ctx)
> >>> @@ -76,8 +78,9 @@ int msm_submitqueue_create(struct drm_device *drm, =
struct msm_file_private *ctx,
> >>>        if (!priv->gpu)
> >>>                return -ENODEV;
> >>>
> >>> -     if (prio >=3D priv->gpu->nr_rings)
> >>> -             return -EINVAL;
> >>> +     ret =3D msm_gpu_convert_priority(priv->gpu, prio, &ring_nr, &sc=
hed_prio);
> >>> +     if (ret)
> >>> +             return ret;
> >>>
> >>>        queue =3D kzalloc(sizeof(*queue), GFP_KERNEL);
> >>>
> >>> @@ -86,24 +89,13 @@ int msm_submitqueue_create(struct drm_device *drm=
, struct msm_file_private *ctx,
> >>>
> >>>        kref_init(&queue->ref);
> >>>        queue->flags =3D flags;
> >>> -     queue->prio =3D prio;
> >>> +     queue->ring_nr =3D ring_nr;
> >>>
> >>> -     ring =3D priv->gpu->rb[prio];
> >>> +     ring =3D priv->gpu->rb[ring_nr];
> >>>        sched =3D &ring->sched;
> >>>
> >>> -     /*
> >>> -      * TODO we can allow more priorities than we have ringbuffers b=
y
> >>> -      * mapping:
> >>> -      *
> >>> -      *    ring =3D prio / 3;
> >>> -      *    ent_prio =3D DRM_SCHED_PRIORITY_MIN + (prio % 3);
> >>> -      *
> >>> -      * Probably avoid using DRM_SCHED_PRIORITY_KERNEL as that is
> >>> -      * treated specially in places.
> >>> -      */
> >>>        ret =3D drm_sched_entity_init(&queue->entity,
> >>> -                     DRM_SCHED_PRIORITY_NORMAL,
> >>> -                     &sched, 1, NULL);
> >>> +                     sched_prio, &sched, 1, NULL);
> >>>        if (ret) {
> >>>                kfree(queue);
> >>>                return ret;
> >>> @@ -134,16 +126,19 @@ int msm_submitqueue_create(struct drm_device *d=
rm, struct msm_file_private *ctx,
> >>>    int msm_submitqueue_init(struct drm_device *drm, struct msm_file_p=
rivate *ctx)
> >>>    {
> >>>        struct msm_drm_private *priv =3D drm->dev_private;
> >>> -     int default_prio;
> >>> +     int default_prio, max_priority;
> >>>
> >>>        if (!priv->gpu)
> >>>                return -ENODEV;
> >>>
> >>> +     max_priority =3D (priv->gpu->nr_rings * NR_SCHED_PRIORITIES) - =
1;
> >>> +
> >>>        /*
> >>> -      * Select priority 2 as the "default priority" unless nr_rings =
is less
> >>> -      * than 2 and then pick the lowest priority
> >>> +      * Pick a medium priority level as default.  Lower numeric valu=
e is
> >>> +      * higher priority, so round-up to pick a priority that is not =
higher
> >>> +      * than the middle priority level.
> >>>         */
> >>> -     default_prio =3D clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - =
1);
> >>> +     default_prio =3D DIV_ROUND_UP(max_priority, 2);
> >>>
> >>>        INIT_LIST_HEAD(&ctx->submitqueues);
> >>>
> >>> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> >>> index f075851021c3..6b8fffc28a50 100644
> >>> --- a/include/uapi/drm/msm_drm.h
> >>> +++ b/include/uapi/drm/msm_drm.h
> >>> @@ -73,11 +73,19 @@ struct drm_msm_timespec {
> >>>    #define MSM_PARAM_MAX_FREQ   0x04
> >>>    #define MSM_PARAM_TIMESTAMP  0x05
> >>>    #define MSM_PARAM_GMEM_BASE  0x06
> >>> -#define MSM_PARAM_NR_RINGS   0x07
> >>> +#define MSM_PARAM_PRIORITIES 0x07  /* The # of priority levels */
> >>>    #define MSM_PARAM_PP_PGTABLE 0x08  /* =3D> 1 for per-process paget=
ables, else 0 */
> >>>    #define MSM_PARAM_FAULTS     0x09
> >>>    #define MSM_PARAM_SUSPENDS   0x0a
> >>>
> >>> +/* For backwards compat.  The original support for preemption was ba=
sed on
> >>> + * a single ring per priority level so # of priority levels equals t=
he #
> >>> + * of rings.  With drm/scheduler providing additional levels of prio=
rity,
> >>> + * the number of priorities is greater than the # of rings.  The par=
am is
> >>> + * renamed to better reflect this.
> >>> + */
> >>> +#define MSM_PARAM_NR_RINGS   MSM_PARAM_PRIORITIES
> >>> +
> >>>    struct drm_msm_param {
> >>>        __u32 pipe;           /* in, MSM_PIPE_x */
> >>>        __u32 param;          /* in, MSM_PARAM_x */
> >>> @@ -304,6 +312,10 @@ struct drm_msm_gem_madvise {
> >>>
> >>>    #define MSM_SUBMITQUEUE_FLAGS (0)
> >>>
> >>> +/*
> >>> + * The submitqueue priority should be between 0 and MSM_PARAM_PRIORI=
TIES-1,
> >>> + * a lower numeric value is higher priority.
> >>> + */
> >>>    struct drm_msm_submitqueue {
> >>>        __u32 flags;   /* in, MSM_SUBMITQUEUE_x */
> >>>        __u32 prio;    /* in, Priority level */
