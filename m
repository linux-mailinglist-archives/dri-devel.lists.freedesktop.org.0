Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994866BB986
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 17:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D44510EB4F;
	Wed, 15 Mar 2023 16:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655FF10EB27;
 Wed, 15 Mar 2023 16:20:03 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id bk32so14533942oib.10;
 Wed, 15 Mar 2023 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678897202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YHm8aqZXbOB1dA6dvL7Y2xb5VTwjaZrSc/p9oBx6dEA=;
 b=N1zVk2hvrNavXuOp0eZ0S4QTNcjyoK6izz5OUnEZk+5s+0TkciqgNkLnRBqoarIbX6
 SjjexBoVyhEIdOhye2JxUIf0Mo+o5kKesS35vENEbwVrqP1Xy/L90MQF+qh1FkFR4abX
 rNpEXXTNdmuLdlOMqNxRXn2/86iVspJ5+AZzfD631Zqp69XWWUV4dKmVSLiBywNyesv3
 kU3Y2Z0F7sairDCIBO59D5dxzMX6Fmz3l5UM7IWncS3muFlT118Y7oX8XF92Mp686n7/
 L5hNSiDUWL76PtdwgnKigbR6CIkiH5ygY+dzJ0Ak/2W1PgON3FSeGR1CDMJri3Vjpwtp
 uyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678897202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YHm8aqZXbOB1dA6dvL7Y2xb5VTwjaZrSc/p9oBx6dEA=;
 b=g2dgX3xwvkhqP0BqzjfpeXTSIVit0EQOy/oMAJOZwnY2PoUfcW9CyM7PG/2ixPJN0P
 EdcXwHVDNDpJHpt3AZkzWmPk9xKujFrs2nnGXDbJ3+WcIjKirahVieRIIL6nJf9KqIYO
 BXmVfo7TyOgCcNdIi+tuU0QMkPS3JeqnsfjiWtWRyPJeLR77cfF1PUg7DOT1IsfGw7hK
 U03Zyu2qr4EpVyoYdr3oNZF9tOUkY83leC8RQDPRDZfcjnidOJEcbXoIX8fU93rn+V7x
 SdLAv3DA30Pt7QWwR0ObNJvfxGSkQcdGfkt4cSw2+dvY2ss4cOUE/dhECrPOzKxIvBsN
 UA5Q==
X-Gm-Message-State: AO0yUKUkA0rnFfYxfPZDSiQfurs7n7M8yM1ewxUIHNm6p1zjHiBKTIni
 D4Eyw5IByvnGx3uvcrs3P5CaJAkTfCAwTFHrLik=
X-Google-Smtp-Source: AK7set/to1bUzC/px7kYh7s+6isGsQUlr2afjdXliyX/Wzg0C7yiYiykegtboodu2VHL6L5D5MlRKKSUEmHzJDeR9eY=
X-Received: by 2002:aca:654b:0:b0:384:1cf9:912e with SMTP id
 j11-20020aca654b000000b003841cf9912emr1028109oiw.5.1678897202265; Wed, 15 Mar
 2023 09:20:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
In-Reply-To: <ZBHNvT3BLgS3qvV5@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 15 Mar 2023 09:19:49 -0700
Message-ID: <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
To: =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@gmail.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Gustavo Padovan <gustavo@padovan.org>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.com>=
 wrote:
>
> On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.=
com> wrote:
> > >
> > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > Add a way to hint to the fence signaler of an upcoming deadline, su=
ch as
> > > > vblank, which the fence waiter would prefer not to miss.  This is t=
o aid
> > > > the fence signaler in making power management decisions, like boost=
ing
> > > > frequency as the deadline approaches and awareness of missing deadl=
ines
> > > > so that can be factored in to the frequency scaling.
> > > >
> > > > v2: Drop dma_fence::deadline and related logic to filter duplicate
> > > >     deadlines, to avoid increasing dma_fence size.  The fence-conte=
xt
> > > >     implementation will need similar logic to track deadlines of al=
l
> > > >     the fences on the same timeline.  [ckoenig]
> > > > v3: Clarify locking wrt. set_deadline callback
> > > > v4: Clarify in docs comment that this is a hint
> > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > v6: More docs
> > > > v7: Fix typo, clarify past deadlines
> > > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > ---
> > >
> > > Hi Rob!
> > >
> > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++++++=
++++
> > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > >  3 files changed, 87 insertions(+)
> > > >
> > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/d=
river-api/dma-buf.rst
> > > > index 622b8156d212..183e480d8cea 100644
> > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > >     :doc: fence signalling annotation
> > > >
> > > > +DMA Fence Deadline Hints
> > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > +
> > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > +   :doc: deadline hints
> > > > +
> > > >  DMA Fences Functions Reference
> > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fenc=
e.c
> > > > index 0de0482cd36e..f177c56269bb 100644
> > > > --- a/drivers/dma-buf/dma-fence.c
> > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fence **=
fences, uint32_t count,
> > > >  }
> > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > >
> > > > +/**
> > > > + * DOC: deadline hints
> > > > + *
> > > > + * In an ideal world, it would be possible to pipeline a workload =
sufficiently
> > > > + * that a utilization based device frequency governor could arrive=
 at a minimum
> > > > + * frequency that meets the requirements of the use-case, in order=
 to minimize
> > > > + * power consumption.  But in the real world there are many worklo=
ads which
> > > > + * defy this ideal.  For example, but not limited to:
> > > > + *
> > > > + * * Workloads that ping-pong between device and CPU, with alterna=
ting periods
> > > > + *   of CPU waiting for device, and device waiting on CPU.  This c=
an result in
> > > > + *   devfreq and cpufreq seeing idle time in their respective doma=
ins and in
> > > > + *   result reduce frequency.
> > > > + *
> > > > + * * Workloads that interact with a periodic time based deadline, =
such as double
> > > > + *   buffered GPU rendering vs vblank sync'd page flipping.  In th=
is scenario,
> > > > + *   missing a vblank deadline results in an *increase* in idle ti=
me on the GPU
> > > > + *   (since it has to wait an additional vblank period), sending a=
 signal to
> > > > + *   the GPU's devfreq to reduce frequency, when in fact the oppos=
ite is what is
> > > > + *   needed.
> > >
> > > This is the use case I'd like to get some better understanding about =
how
> > > this series intends to work, as the problematic scheduling behavior
> > > triggered by missed deadlines has plagued compositing display servers
> > > for a long time.
> > >
> > > I apologize, I'm not a GPU driver developer, nor an OpenGL driver
> > > developer, so I will need some hand holding when it comes to
> > > understanding exactly what piece of software is responsible for
> > > communicating what piece of information.
> > >
> > > > + *
> > > > + * To this end, deadline hint(s) can be set on a &dma_fence via &d=
ma_fence_set_deadline.
> > > > + * The deadline hint provides a way for the waiting driver, or use=
rspace, to
> > > > + * convey an appropriate sense of urgency to the signaling driver.
> > > > + *
> > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for=
 userspace
> > > > + * facing APIs).  The time could either be some point in the futur=
e (such as
> > > > + * the vblank based deadline for page-flipping, or the start of a =
compositor's
> > > > + * composition cycle), or the current time to indicate an immediat=
e deadline
> > > > + * hint (Ie. forward progress cannot be made until this fence is s=
ignaled).
> > >
> > > Is it guaranteed that a GPU driver will use the actual start of the
> > > vblank as the effective deadline? I have some memories of seing
> > > something about vblank evasion browsing driver code, which I might ha=
ve
> > > misunderstood, but I have yet to find whether this is something
> > > userspace can actually expect to be something it can rely on.
> >
> > I guess you mean s/GPU driver/display driver/ ?  It makes things more
> > clear if we talk about them separately even if they happen to be the
> > same device.
>
> Sure, sorry about being unclear about that.
>
> >
> > Assuming that is what you mean, nothing strongly defines what the
> > deadline is.  In practice there is probably some buffering in the
> > display controller.  For ex, block based (including bandwidth
> > compressed) formats, you need to buffer up a row of blocks to
> > efficiently linearize for scanout.  So you probably need to latch some
> > time before you start sending pixel data to the display.  But details
> > like this are heavily implementation dependent.  I think the most
> > reasonable thing to target is start of vblank.
>
> The driver exposing those details would be quite useful for userspace
> though, so that it can delay committing updates to late, but not too
> late. Setting a deadline to be the vblank seems easy enough, but it
> isn't enough for scheduling the actual commit.

I'm not entirely sure how that would even work.. but OTOH I think you
are talking about something on the order of 100us?  But that is a bit
of another topic.

> >
> > Also, keep in mind the deadline hint is just that.  It won't magically
> > make the GPU finish by that deadline, but it gives the GPU driver
> > information about lateness so it can realize if it needs to clock up.
>
> Sure, even if the GPU ramped up clocks to the max, if the job queue is
> too large, it won't magically invent more cycles to squeeze in.
>
> >
> > > Can userspace set a deadline that targets the next vblank deadline
> > > before GPU work has been flushed e.g. at the start of a paint cycle, =
and
> > > still be sure that the kernel has the information it needs to know it=
 should
> > > make its clocks increase their speed in time for when the actual work
> > > has been actually flushed? Or is it needed that the this deadline is =
set
> > > at the end?
> >
> > You need a fence to set the deadline, and for that work needs to be
> > flushed.  But you can't associate a deadline with work that the kernel
> > is unaware of anyways.
>
> That makes sense, but it might also a bit inadequate to have it as the
> only way to tell the kernel it should speed things up. Even with the
> trick i915 does, with GNOME Shell, we still end up with the feedback
> loop this series aims to mitigate. Doing triple buffering, i.e. delaying
> or dropping the first frame is so far the best work around that works,
> except doing other tricks that makes the kernel to ramp up its clock.
> Having to rely on choosing between latency and frame drops should
> ideally not have to be made.

Before you have a fence, the thing you want to be speeding up is the
CPU, not the GPU.  There are existing mechanisms for that.

TBF I'm of the belief that there is still a need for input based cpu
boost (and early wake-up trigger for GPU).. we have something like
this in CrOS kernel.  That is a bit of a different topic, but my point
is that fence deadlines are just one of several things we need to
optimize power/perf and responsiveness, rather than the single thing
that solves every problem under the sun ;-)

> >
> > > What I'm more or less trying to ask is, will a mode setting composito=
r
> > > be able to tell the kernel to boost its clocks at the time it knows i=
s
> > > best, and how will it in practice achieve this?
> >
> > The anticipated usage for a compositor is that, when you receive a
> > <buf, fence> pair from an app, you immediately set a deadline for
> > upcoming start-of-vblank on the fence fd passed from the app.  (Or for
> > implicit sync you can use DMA_BUF_IOCTL_EXPORT_SYNC_FILE).  For the
> > composite step, no need to set a deadline as this is already done on
> > the kernel side in drm_atomic_helper_wait_for_fences().
>
> So it sounds like the new uapi will help compositors that do not draw
> with the intention of page flipping anything, and compositors that
> deliberately delay the commit. I suppose with proper target presentation
> time integration EGL/Vulkan WSI can set deadlines them as well. All that
> sounds like a welcomed improvement, but I'm not convinced it's enough to
> solve the problems we currently face.

Yeah, like I mentioned this addresses one issue, giving the GPU kernel
driver better information for freq mgmt.  But there probably isn't one
single solution for everything.

> >
> > > For example relying on the atomic mode setting commit setting the
> > > deadline is fundamentally flawed, since user space will at times want=
 to
> > > purposefully delay committing until as late as possible, without doin=
g
> > > so causing an increased risk of missing the deadline due to the kerne=
l
> > > not speeding up clocks at the right time for GPU work that has alread=
y
> > > been flushed long ago.
> >
> > Right, this is the point for exposing the ioctl to userspace.
> >
> > > Relying on commits also has no effect on GPU work queued by
> > > a compositor drawing only to dma-bufs that are never intended to be
> > > presented using mode setting. How can we make sure a compositor can
> > > provide hints that the kernel will know to respect despite the
> > > compositor not being drm master?
> >
> > It doesn't matter if there are indirect dependencies.  Even if the
> > compositor completely ignores deadline hints and fancy tricks like
> > delaying composite decisions, the indirect dependency (app rendering)
> > will delay the direct dependency (compositor rendering) of the page
> > flip.  So the driver will still see whether it is late or early
> > compared to the deadline, allowing it to adjust freq in the
> > appropriate direction for the next frame.
>
> Is it expected that WSI's will set their own deadlines, or should that
> be the job of the compositor? For example by using compositors using
> DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to set a
> deadline matching the vsync it most ideally will be committed to?
>

I'm kind of assuming compositors, but if the WSI somehow has more
information about ideal presentation time, then I suppose it could be
in the WSI?  I'll defer to folks who spend more time on WSI and
compositors to hash out the details ;-)

BR,
-R

>
> Jonas
>
> >
> > BR,
> > -R
> >
> > >
> > > Jonas
> > >
> > > > + *
> > > > + * Multiple deadlines may be set on a given fence, even in paralle=
l.  See the
> > > > + * documentation for &dma_fence_ops.set_deadline.
> > > > + *
> > > > + * The deadline hint is just that, a hint.  The driver that create=
d the fence
> > > > + * may react by increasing frequency, making different scheduling =
choices, etc.
> > > > + * Or doing nothing at all.
> > > > + */
> > > > +
> > > > +/**
> > > > + * dma_fence_set_deadline - set desired fence-wait deadline hint
> > > > + * @fence:    the fence that is to be waited on
> > > > + * @deadline: the time by which the waiter hopes for the fence to =
be
> > > > + *            signaled
> > > > + *
> > > > + * Give the fence signaler a hint about an upcoming deadline, such=
 as
> > > > + * vblank, by which point the waiter would prefer the fence to be
> > > > + * signaled by.  This is intended to give feedback to the fence si=
gnaler
> > > > + * to aid in power management decisions, such as boosting GPU freq=
uency
> > > > + * if a periodic vblank deadline is approaching but the fence is n=
ot
> > > > + * yet signaled..
> > > > + */
> > > > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadl=
ine)
> > > > +{
> > > > +     if (fence->ops->set_deadline && !dma_fence_is_signaled(fence)=
)
> > > > +             fence->ops->set_deadline(fence, deadline);
> > > > +}
> > > > +EXPORT_SYMBOL(dma_fence_set_deadline);
> > > > +
> > > >  /**
> > > >   * dma_fence_describe - Dump fence describtion into seq_file
> > > >   * @fence: the 6fence to describe
> > > > diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> > > > index 775cdc0b4f24..d54b595a0fe0 100644
> > > > --- a/include/linux/dma-fence.h
> > > > +++ b/include/linux/dma-fence.h
> > > > @@ -257,6 +257,26 @@ struct dma_fence_ops {
> > > >        */
> > > >       void (*timeline_value_str)(struct dma_fence *fence,
> > > >                                  char *str, int size);
> > > > +
> > > > +     /**
> > > > +      * @set_deadline:
> > > > +      *
> > > > +      * Callback to allow a fence waiter to inform the fence signa=
ler of
> > > > +      * an upcoming deadline, such as vblank, by which point the w=
aiter
> > > > +      * would prefer the fence to be signaled by.  This is intende=
d to
> > > > +      * give feedback to the fence signaler to aid in power manage=
ment
> > > > +      * decisions, such as boosting GPU frequency.
> > > > +      *
> > > > +      * This is called without &dma_fence.lock held, it can be cal=
led
> > > > +      * multiple times and from any context.  Locking is up to the=
 callee
> > > > +      * if it has some state to manage.  If multiple deadlines are=
 set,
> > > > +      * the expectation is to track the soonest one.  If the deadl=
ine is
> > > > +      * before the current time, it should be interpreted as an im=
mediate
> > > > +      * deadline.
> > > > +      *
> > > > +      * This callback is optional.
> > > > +      */
> > > > +     void (*set_deadline)(struct dma_fence *fence, ktime_t deadlin=
e);
> > > >  };
> > > >
> > > >  void dma_fence_init(struct dma_fence *fence, const struct dma_fenc=
e_ops *ops,
> > > > @@ -583,6 +603,8 @@ static inline signed long dma_fence_wait(struct=
 dma_fence *fence, bool intr)
> > > >       return ret < 0 ? ret : 0;
> > > >  }
> > > >
> > > > +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadl=
ine);
> > > > +
> > > >  struct dma_fence *dma_fence_get_stub(void);
> > > >  struct dma_fence *dma_fence_allocate_private_stub(void);
> > > >  u64 dma_fence_context_alloc(unsigned num);
> > > > --
> > > > 2.39.2
> > > >
