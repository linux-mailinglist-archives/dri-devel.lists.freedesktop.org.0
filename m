Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD46BEC68
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 16:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AFE10EF33;
	Fri, 17 Mar 2023 15:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0961F10E275
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679065659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZJU/fEEhuF9U7cN3pXMxhADcyk4jZbjIzMqrS3FEvI=;
 b=E5D+8RihUkEyViBUzQeL5QUyLjBkt8Zj7pdRq6FqpKPGYq57MXYTcosQNoQ+Jk9EaQRnlA
 YY+g5oQeTWNxgAE95sJ2XDbZqpchUUQP4E3wl0IXYKC21HlofMS1bvgs60os5ceq9Or3XV
 QmtRlQ4gcSNxtQH4b+X2nZl+LJ/vub0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-w25Gxa4KMcKCHiiCPN3p_A-1; Fri, 17 Mar 2023 11:07:37 -0400
X-MC-Unique: w25Gxa4KMcKCHiiCPN3p_A-1
Received: by mail-lf1-f69.google.com with SMTP id
 o17-20020a198c11000000b004e8706b0c72so2159758lfd.21
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679065656;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dZJU/fEEhuF9U7cN3pXMxhADcyk4jZbjIzMqrS3FEvI=;
 b=zOBUtVRz8AAz2J3h5oUw2d6Ypf9VAWkybrKkWVUcHeZfV1GCkMbui+Aaz3/WgqEg3l
 dG58sJns5RmMmBb7KfJRXkvr2s6aMtwSXy2UUfHHKLhYIOOpcMaQ9qUHeT5vXgWxCSjC
 oYMeR0O993kXnXP/qzk39OhHraPIDUsD059QzP2IolOGlkMdCBL+z4sy5owV/fzD5Ogb
 Ql2cLVmbS7q5jXZgITZMz86kky/3DU0ksXejpYiD/4xr88f5vKBD9enKWllhzRgbjfe5
 FwQubyGF95oAaYPr9InQ8/AsQfeocAjxi9TxWG3WbgIQKzcsH91qu3esubwelK4xmShX
 OO7Q==
X-Gm-Message-State: AO0yUKXup50wl/PNkXMSjc6odVm0w08siBKZseiZbq8apeBUA/QGv0Xr
 U/EKl8UmOJpMq0KLSTjMLtapIRDLsXVFA3i12pZYI0k5XZEyUlzkP/0NlfoWNb5iICxdAhr0tR7
 SAuzW/uCnZ5ZKuJfflAFd+98/dtGAtzC3GIC+sa5RXn/I
X-Received: by 2002:a19:7009:0:b0:4e8:6261:58c2 with SMTP id
 h9-20020a197009000000b004e8626158c2mr2512597lfc.7.1679065655840; 
 Fri, 17 Mar 2023 08:07:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set+POVytsQS+rqGfWtdW6NULVr/TzxdPfoGfV6mMYr/se72Yd56lLKlYCXbQVCqj+CxKQBv2WyI4dF0EWqFSczU=
X-Received: by 2002:a19:7009:0:b0:4e8:6261:58c2 with SMTP id
 h9-20020a197009000000b004e8626158c2mr2512585lfc.7.1679065655381; Fri, 17 Mar
 2023 08:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
 <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
 <CAF6AEGuSaNAQUfbkJf2bt+VMTxYWTf0j0jiJOS6Q-6HfCLnw6Q@mail.gmail.com>
In-Reply-To: <CAF6AEGuSaNAQUfbkJf2bt+VMTxYWTf0j0jiJOS6Q-6HfCLnw6Q@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 17 Mar 2023 16:07:24 +0100
Message-ID: <CA+hFU4xH7C9+KdusqydNF_YxUc8RpN1D_KBi_cD8mMjwpjBO5A@mail.gmail.com>
Subject: Re: [PATCH v10 01/15] dma-buf/dma-fence: Add deadline awareness
To: Rob Clark <robdclark@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Gustavo Padovan <gustavo@padovan.org>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 16, 2023 at 11:59=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Thu, Mar 16, 2023 at 3:22=E2=80=AFPM Sebastian Wick
> <sebastian.wick@redhat.com> wrote:
> >
> > On Thu, Mar 16, 2023 at 5:29=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Thu, Mar 16, 2023 at 2:26=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmai=
l.com> wrote:
> > > >
> > > > On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> > > > > On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadahl@=
gmail.com> wrote:
> > > > > >
> > > > > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > > > > > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <jad=
ahl@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > > > >
> > > > > > > > > Add a way to hint to the fence signaler of an upcoming de=
adline, such as
> > > > > > > > > vblank, which the fence waiter would prefer not to miss. =
 This is to aid
> > > > > > > > > the fence signaler in making power management decisions, =
like boosting
> > > > > > > > > frequency as the deadline approaches and awareness of mis=
sing deadlines
> > > > > > > > > so that can be factored in to the frequency scaling.
> > > > > > > > >
> > > > > > > > > v2: Drop dma_fence::deadline and related logic to filter =
duplicate
> > > > > > > > >     deadlines, to avoid increasing dma_fence size.  The f=
ence-context
> > > > > > > > >     implementation will need similar logic to track deadl=
ines of all
> > > > > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > > > > v6: More docs
> > > > > > > > > v7: Fix typo, clarify past deadlines
> > > > > > > > >
> > > > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.c=
om>
> > > > > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > > > > ---
> > > > > > > >
> > > > > > > > Hi Rob!
> > > > > > > >
> > > > > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++=
++++++++++++++
> > > > > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > > > > >  3 files changed, 87 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Docum=
entation/driver-api/dma-buf.rst
> > > > > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > >     :doc: fence signalling annotation
> > > > > > > > >
> > > > > > > > > +DMA Fence Deadline Hints
> > > > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > > +
> > > > > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > > > +   :doc: deadline hints
> > > > > > > > > +
> > > > > > > > >  DMA Fences Functions Reference
> > > > > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-bu=
f/dma-fence.c
> > > > > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dm=
a_fence **fences, uint32_t count,
> > > > > > > > >  }
> > > > > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > > > > >
> > > > > > > > > +/**
> > > > > > > > > + * DOC: deadline hints
> > > > > > > > > + *
> > > > > > > > > + * In an ideal world, it would be possible to pipeline a=
 workload sufficiently
> > > > > > > > > + * that a utilization based device frequency governor co=
uld arrive at a minimum
> > > > > > > > > + * frequency that meets the requirements of the use-case=
, in order to minimize
> > > > > > > > > + * power consumption.  But in the real world there are m=
any workloads which
> > > > > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > > > > + *
> > > > > > > > > + * * Workloads that ping-pong between device and CPU, wi=
th alternating periods
> > > > > > > > > + *   of CPU waiting for device, and device waiting on CP=
U.  This can result in
> > > > > > > > > + *   devfreq and cpufreq seeing idle time in their respe=
ctive domains and in
> > > > > > > > > + *   result reduce frequency.
> > > > > > > > > + *
> > > > > > > > > + * * Workloads that interact with a periodic time based =
deadline, such as double
> > > > > > > > > + *   buffered GPU rendering vs vblank sync'd page flippi=
ng.  In this scenario,
> > > > > > > > > + *   missing a vblank deadline results in an *increase* =
in idle time on the GPU
> > > > > > > > > + *   (since it has to wait an additional vblank period),=
 sending a signal to
> > > > > > > > > + *   the GPU's devfreq to reduce frequency, when in fact=
 the opposite is what is
> > > > > > > > > + *   needed.
> > > > > > > >
> > > > > > > > This is the use case I'd like to get some better understand=
ing about how
> > > > > > > > this series intends to work, as the problematic scheduling =
behavior
> > > > > > > > triggered by missed deadlines has plagued compositing displ=
ay servers
> > > > > > > > for a long time.
> > > > > > > >
> > > > > > > > I apologize, I'm not a GPU driver developer, nor an OpenGL =
driver
> > > > > > > > developer, so I will need some hand holding when it comes t=
o
> > > > > > > > understanding exactly what piece of software is responsible=
 for
> > > > > > > > communicating what piece of information.
> > > > > > > >
> > > > > > > > > + *
> > > > > > > > > + * To this end, deadline hint(s) can be set on a &dma_fe=
nce via &dma_fence_set_deadline.
> > > > > > > > > + * The deadline hint provides a way for the waiting driv=
er, or userspace, to
> > > > > > > > > + * convey an appropriate sense of urgency to the signali=
ng driver.
> > > > > > > > > + *
> > > > > > > > > + * A deadline hint is given in absolute ktime (CLOCK_MON=
OTONIC for userspace
> > > > > > > > > + * facing APIs).  The time could either be some point in=
 the future (such as
> > > > > > > > > + * the vblank based deadline for page-flipping, or the s=
tart of a compositor's
> > > > > > > > > + * composition cycle), or the current time to indicate a=
n immediate deadline
> > > > > > > > > + * hint (Ie. forward progress cannot be made until this =
fence is signaled).
> > > > > > > >
> > > > > > > > Is it guaranteed that a GPU driver will use the actual star=
t of the
> > > > > > > > vblank as the effective deadline? I have some memories of s=
eing
> > > > > > > > something about vblank evasion browsing driver code, which =
I might have
> > > > > > > > misunderstood, but I have yet to find whether this is somet=
hing
> > > > > > > > userspace can actually expect to be something it can rely o=
n.
> > > > > > >
> > > > > > > I guess you mean s/GPU driver/display driver/ ?  It makes thi=
ngs more
> > > > > > > clear if we talk about them separately even if they happen to=
 be the
> > > > > > > same device.
> > > > > >
> > > > > > Sure, sorry about being unclear about that.
> > > > > >
> > > > > > >
> > > > > > > Assuming that is what you mean, nothing strongly defines what=
 the
> > > > > > > deadline is.  In practice there is probably some buffering in=
 the
> > > > > > > display controller.  For ex, block based (including bandwidth
> > > > > > > compressed) formats, you need to buffer up a row of blocks to
> > > > > > > efficiently linearize for scanout.  So you probably need to l=
atch some
> > > > > > > time before you start sending pixel data to the display.  But=
 details
> > > > > > > like this are heavily implementation dependent.  I think the =
most
> > > > > > > reasonable thing to target is start of vblank.
> > > > > >
> > > > > > The driver exposing those details would be quite useful for use=
rspace
> > > > > > though, so that it can delay committing updates to late, but no=
t too
> > > > > > late. Setting a deadline to be the vblank seems easy enough, bu=
t it
> > > > > > isn't enough for scheduling the actual commit.
> > > > >
> > > > > I'm not entirely sure how that would even work.. but OTOH I think=
 you
> > > > > are talking about something on the order of 100us?  But that is a=
 bit
> > > > > of another topic.
> > > >
> > > > Yes, something like that. But yea, it's not really related. Schedul=
ing
> > > > commits closer to the deadline has more complex behavior than that =
too,
> > > > e.g. the need for real time scheduling, and knowing how long it usu=
ally
> > > > takes to create and commit and for the kernel to process.
> >
> > Vblank can be really long, especially with VRR where the additional
> > time you get to finish the frame comes from making vblank longer.
> > Using the start of vblank as a deadline makes VRR useless. It really
> > would be nice to have some feedback about the actual deadline from the
> > kernel, maybe in `struct drm_event_vblank`.
>
> note that here we are only talking about the difference between
> start/end of vblank and the deadline for the hw to latch a change for
> the next frame.  (Which I _expect_ generally amounts to however long
> it takes to slurp in a row of tiles)
>
> > But yes, sorry, off topic...
> >
> > > > >
> > > >
> > > > 8-< *snip* 8-<
> > > >
> > > > > > >
> > > > > > > You need a fence to set the deadline, and for that work needs=
 to be
> > > > > > > flushed.  But you can't associate a deadline with work that t=
he kernel
> > > > > > > is unaware of anyways.
> > > > > >
> > > > > > That makes sense, but it might also a bit inadequate to have it=
 as the
> > > > > > only way to tell the kernel it should speed things up. Even wit=
h the
> > > > > > trick i915 does, with GNOME Shell, we still end up with the fee=
dback
> > > > > > loop this series aims to mitigate. Doing triple buffering, i.e.=
 delaying
> > > > > > or dropping the first frame is so far the best work around that=
 works,
> > > > > > except doing other tricks that makes the kernel to ramp up its =
clock.
> > > > > > Having to rely on choosing between latency and frame drops shou=
ld
> > > > > > ideally not have to be made.
> > > > >
> > > > > Before you have a fence, the thing you want to be speeding up is =
the
> > > > > CPU, not the GPU.  There are existing mechanisms for that.
> > > >
> > > > Is there no benefit to let the GPU know earlier that it should spee=
d up,
> > > > so that when the job queue arrives, it's already up to speed?
> > >
> > > Downstream we have input notifier that resumes the GPU so we can
> > > pipeline the 1-2ms it takes to boot up the GPU with userspace.  But w=
e
> > > wait to boost freq until we have cmdstream to submit, since that
> > > doesn't take as long.  What needs help initially after input is all
> > > the stuff that happens on the CPU before the GPU can start to do
> > > anything ;-)
> > >
> > > Btw, I guess I haven't made this clear, dma-fence deadline is trying
> > > to help the steady-state situation, rather than the input-latency
> > > situation.  It might take a frame or two of missed deadlines for
> > > gpufreq to arrive at a good steady-state freq.
> >
> > The mutter issue also is about a suboptimal steady-state.
> >
> > Truth be told, I'm not sure if this fence deadline idea fixes the
> > issue we're seeing or at least helps sometimes. It might, it might
> > not. What annoys me is that the compositor *knows* before any work is
> > submitted that some work will be submitted and when it has to finish.
> > We could maximize the chances to get everything right but having to
> > wait for a fence to materialize in the compositor to do anything about
> > it is suboptimal.
>
> Why would the app not immediately send the fence+buf to the compositor
> as soon as it is submitted to the kernel on client process side?

Some apps just are not good at this. Reading back work from the GPU,
taking a lot of CPU time to create the GPU work, etc.

The other obvious offender: frame callbacks. Committing a buffer only
happens after receiving a frame callback in FIFO/vsync mode which we
try to schedule as close to the deadline as possible.

The idea that the clients are able to submit all GPU work some time
early, then immediately commit to show up in the compositor well
before the deadline is very idealized. We're trying to get there but
we also only have control over the WSI so bad apps will still be bad
apps.

> At any rate, it really doesn't matter how early the kernel finds out
> about the deadline, since the point is to let the kernel driver know
> if it is missing the deadline so that it doesn't mis-interpret stall
> time waiting for the _next_ vblank after the one we wanted.

That's a good point! Let's see how well this works in practice and how
we can improve on that in the future.

> > > > >
> > > > > TBF I'm of the belief that there is still a need for input based =
cpu
> > > > > boost (and early wake-up trigger for GPU).. we have something lik=
e
> > > > > this in CrOS kernel.  That is a bit of a different topic, but my =
point
> > > > > is that fence deadlines are just one of several things we need to
> > > > > optimize power/perf and responsiveness, rather than the single th=
ing
> > > > > that solves every problem under the sun ;-)
> > > >
> > > > Perhaps; but I believe it's a bit of a back channel of intent; the =
piece
> > > > of the puzzle that has the information to know whether there is nee=
d
> > > > actually speed up is the compositor, not the kernel.
> > > >
> > > > For example, pressing 'p' while a terminal is focused does not need=
 high
> > > > frequency clocks, it just needs the terminal emulator to draw a 'p'=
 and
> > > > the compositor to composite that update. Pressing <Super> may howev=
er
> > > > trigger a non-trivial animation moving a lot of stuff around on scr=
een,
> > > > maybe triggering Wayland clients to draw and what not, and should m=
ost
> > > > arguably have the ability to "warn" the kernel about the upcoming f=
lood
> > > > of work before it is already knocking on its door step.
> > >
> > > The super key is problematic, but not for the reason you think.  It i=
s
> > > because it is a case where we should boost on key-up instead of
> > > key-down.. and the second key-up event comes after the cpu-boost is
> > > already in it's cool-down period.  But even if suboptimal in cases
> > > like this, it is still useful for touch/stylus cases where the
> > > slightest of lag is much more perceptible.
> > >
> > > This is getting off topic but I kinda favor coming up with some sort
> > > of static definition that userspace could give the kernel to let the
> > > kernel know what input to boost on.  Or maybe something could be done
> > > with BPF?
> >
> > Why? Do you think user space is so slow that it can't process the
> > input events and then do a syscall? We need to have all input devices
> > open anyway that can affect the system and know more about how they
> > affect behavior than the kernel can ever know.
>
> Again this is getting off into a different topic.  But my gut feel is
> that the shorter the path to input cpu freq boost, the better.. since
> however many extra cycles you add, they will be cycles with cpu (and
> probably ddr) at lowest freq

On the one hand, sure, that makes sense in theory. On the other hand,
we won't know for sure until we try it and I suspect a RT thread in
user space will be fast enough.

> BR,
> -R
>
> > >
> > > > >
> > > >
> > > > 8-< *snip* 8-<
> > > >
> > > > > >
> > > > > > Is it expected that WSI's will set their own deadlines, or shou=
ld that
> > > > > > be the job of the compositor? For example by using compositors =
using
> > > > > > DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to =
set a
> > > > > > deadline matching the vsync it most ideally will be committed t=
o?
> > > > > >
> > > > >
> > > > > I'm kind of assuming compositors, but if the WSI somehow has more
> > > > > information about ideal presentation time, then I suppose it coul=
d be
> > > > > in the WSI?  I'll defer to folks who spend more time on WSI and
> > > > > compositors to hash out the details ;-)
> > > >
> > > > With my compositor developer hat on, it might be best to let it be =
up to
> > > > the compositor, it's the one that knows if a client's content will
> > > > actually end up anywhere visible.
> > > >
> > >
> > > wfm
> > >
> > > BR,
> > > -R
> > >
> > > >
> > > > Jonas
> > > >
> > > > >
> > > > > BR,
> > > > > -R
> > >
> >
>

