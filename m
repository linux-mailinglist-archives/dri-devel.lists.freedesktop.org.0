Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3486BDB89
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 23:22:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4166A10E0B8;
	Thu, 16 Mar 2023 22:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2112F10E217
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 22:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679005362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FiNRrqqvSuubpSuuWdFDbGPDB+qkVipo+igQfKYRoHk=;
 b=VDQCbyNVDhvRcUAYFLUYHBn2g3FI+82D+HFa6HuoZHY8mqsqZuXQl2BJoTc1h7hHqatBnc
 5gzK0KF8pvAWyk/I6udsq9NI4uldhZ8UvNjt5+2jMFaEYNZtl23HGcVIk0x5XZAzU8U5VD
 ZRb6Wi/QTcNbTzHnhbuxc4zetcrDohg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-hbPxFLgyMVyb6el9E0FB4Q-1; Thu, 16 Mar 2023 18:22:38 -0400
X-MC-Unique: hbPxFLgyMVyb6el9E0FB4Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 cf37-20020a056512282500b004cfd8133992so1307437lfb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 15:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679005357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FiNRrqqvSuubpSuuWdFDbGPDB+qkVipo+igQfKYRoHk=;
 b=MG0P+xBT9vl1J5LsjfcqN3adZ6D7KOkme3XxFufykFDQ/+hGh9J8E+f1z05zb5aghX
 XdJwkPnQbi2IJ4SbjjCfT4gA0zHA7v6q19ELjjOo+ih89bCM8vRXVBYVMSaYwNVz5gPD
 CUon9LuCsDO/k5Be9yRSs8THlZuMUZex1vmPTochhicisPgC7A3xWDc07OZa+yhRbkDy
 fHrqlAdpVEgztcggcgKPm2XSGuVasLQy/KvfB23tG66lS+RdRsKOuM9S7KfjP8KDVLND
 EIRkqsH3G88gnH0ES1/hTCF2U5AYpQkAFNQ2xRg7ik24htosEUfv9m65S2PHF4YTU7JC
 s7yg==
X-Gm-Message-State: AO0yUKW25+AeMAvkOAWLCv0jKYakAV8GpjaoWqjnrfs3e4sXJIP5pkW9
 A3XoFdQfrzWhwhKMv+tSdRao07GUkBJkrYgPzz/BYGKf3G4RVNxm5e8dtDVvZC/4U1H7WoXXhwq
 DWM0IZ9G1HNRa0XAJ4KJBAZ22/W80Ny8c0y6wEnxgujyO
X-Received: by 2002:ac2:4857:0:b0:4e8:4117:67c8 with SMTP id
 23-20020ac24857000000b004e8411767c8mr3732220lfy.7.1679005356715; 
 Thu, 16 Mar 2023 15:22:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set8G08laVUog1RwsYZrLKcASLbIgQyaWUhPxFNOKZSNNfixtvrswrY1dJy7CT6DWclONJBFpHH/j6fESF/DrUps=
X-Received: by 2002:ac2:4857:0:b0:4e8:4117:67c8 with SMTP id
 23-20020ac24857000000b004e8411767c8mr3732197lfy.7.1679005356306; Thu, 16 Mar
 2023 15:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-2-robdclark@gmail.com>
 <ZAtQspuFjPtGy7ze@gmail.com>
 <CAF6AEGsGOr5+Q10wX=5ttrWCSUJfn7gzHW8QhxFC0GDLgagMHg@mail.gmail.com>
 <ZBHNvT3BLgS3qvV5@gmail.com>
 <CAF6AEGu1S2CXzRxV_c5tE_H+XUGiO=n0tXjLZ_u_tW-eMqMsQw@mail.gmail.com>
 <ZBLg0t0tTVvuPuiJ@gmail.com>
 <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
In-Reply-To: <CAF6AEGvV5arZThTyju_=xFFDWRbMaexgO_kkdKZuK-zeCxrN7Q@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Thu, 16 Mar 2023 23:22:24 +0100
Message-ID: <CA+hFU4xbssR+=Sf4ia5kPdsSb4y9SQUd4nx_2p1Szcbtna28CA@mail.gmail.com>
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

On Thu, Mar 16, 2023 at 5:29=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Thu, Mar 16, 2023 at 2:26=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmail.co=
m> wrote:
> >
> > On Wed, Mar 15, 2023 at 09:19:49AM -0700, Rob Clark wrote:
> > > On Wed, Mar 15, 2023 at 6:53=E2=80=AFAM Jonas =C3=85dahl <jadahl@gmai=
l.com> wrote:
> > > >
> > > > On Fri, Mar 10, 2023 at 09:38:18AM -0800, Rob Clark wrote:
> > > > > On Fri, Mar 10, 2023 at 7:45=E2=80=AFAM Jonas =C3=85dahl <jadahl@=
gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Mar 08, 2023 at 07:52:52AM -0800, Rob Clark wrote:
> > > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > > >
> > > > > > > Add a way to hint to the fence signaler of an upcoming deadli=
ne, such as
> > > > > > > vblank, which the fence waiter would prefer not to miss.  Thi=
s is to aid
> > > > > > > the fence signaler in making power management decisions, like=
 boosting
> > > > > > > frequency as the deadline approaches and awareness of missing=
 deadlines
> > > > > > > so that can be factored in to the frequency scaling.
> > > > > > >
> > > > > > > v2: Drop dma_fence::deadline and related logic to filter dupl=
icate
> > > > > > >     deadlines, to avoid increasing dma_fence size.  The fence=
-context
> > > > > > >     implementation will need similar logic to track deadlines=
 of all
> > > > > > >     the fences on the same timeline.  [ckoenig]
> > > > > > > v3: Clarify locking wrt. set_deadline callback
> > > > > > > v4: Clarify in docs comment that this is a hint
> > > > > > > v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> > > > > > > v6: More docs
> > > > > > > v7: Fix typo, clarify past deadlines
> > > > > > >
> > > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > > > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > > > > ---
> > > > > >
> > > > > > Hi Rob!
> > > > > >
> > > > > > >  Documentation/driver-api/dma-buf.rst |  6 +++
> > > > > > >  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++=
++++++++++
> > > > > > >  include/linux/dma-fence.h            | 22 +++++++++++
> > > > > > >  3 files changed, 87 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/driver-api/dma-buf.rst b/Documenta=
tion/driver-api/dma-buf.rst
> > > > > > > index 622b8156d212..183e480d8cea 100644
> > > > > > > --- a/Documentation/driver-api/dma-buf.rst
> > > > > > > +++ b/Documentation/driver-api/dma-buf.rst
> > > > > > > @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
> > > > > > >  .. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > >     :doc: fence signalling annotation
> > > > > > >
> > > > > > > +DMA Fence Deadline Hints
> > > > > > > +~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > > +
> > > > > > > +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> > > > > > > +   :doc: deadline hints
> > > > > > > +
> > > > > > >  DMA Fences Functions Reference
> > > > > > >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > > >
> > > > > > > diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dm=
a-fence.c
> > > > > > > index 0de0482cd36e..f177c56269bb 100644
> > > > > > > --- a/drivers/dma-buf/dma-fence.c
> > > > > > > +++ b/drivers/dma-buf/dma-fence.c
> > > > > > > @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fe=
nce **fences, uint32_t count,
> > > > > > >  }
> > > > > > >  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> > > > > > >
> > > > > > > +/**
> > > > > > > + * DOC: deadline hints
> > > > > > > + *
> > > > > > > + * In an ideal world, it would be possible to pipeline a wor=
kload sufficiently
> > > > > > > + * that a utilization based device frequency governor could =
arrive at a minimum
> > > > > > > + * frequency that meets the requirements of the use-case, in=
 order to minimize
> > > > > > > + * power consumption.  But in the real world there are many =
workloads which
> > > > > > > + * defy this ideal.  For example, but not limited to:
> > > > > > > + *
> > > > > > > + * * Workloads that ping-pong between device and CPU, with a=
lternating periods
> > > > > > > + *   of CPU waiting for device, and device waiting on CPU.  =
This can result in
> > > > > > > + *   devfreq and cpufreq seeing idle time in their respectiv=
e domains and in
> > > > > > > + *   result reduce frequency.
> > > > > > > + *
> > > > > > > + * * Workloads that interact with a periodic time based dead=
line, such as double
> > > > > > > + *   buffered GPU rendering vs vblank sync'd page flipping. =
 In this scenario,
> > > > > > > + *   missing a vblank deadline results in an *increase* in i=
dle time on the GPU
> > > > > > > + *   (since it has to wait an additional vblank period), sen=
ding a signal to
> > > > > > > + *   the GPU's devfreq to reduce frequency, when in fact the=
 opposite is what is
> > > > > > > + *   needed.
> > > > > >
> > > > > > This is the use case I'd like to get some better understanding =
about how
> > > > > > this series intends to work, as the problematic scheduling beha=
vior
> > > > > > triggered by missed deadlines has plagued compositing display s=
ervers
> > > > > > for a long time.
> > > > > >
> > > > > > I apologize, I'm not a GPU driver developer, nor an OpenGL driv=
er
> > > > > > developer, so I will need some hand holding when it comes to
> > > > > > understanding exactly what piece of software is responsible for
> > > > > > communicating what piece of information.
> > > > > >
> > > > > > > + *
> > > > > > > + * To this end, deadline hint(s) can be set on a &dma_fence =
via &dma_fence_set_deadline.
> > > > > > > + * The deadline hint provides a way for the waiting driver, =
or userspace, to
> > > > > > > + * convey an appropriate sense of urgency to the signaling d=
river.
> > > > > > > + *
> > > > > > > + * A deadline hint is given in absolute ktime (CLOCK_MONOTON=
IC for userspace
> > > > > > > + * facing APIs).  The time could either be some point in the=
 future (such as
> > > > > > > + * the vblank based deadline for page-flipping, or the start=
 of a compositor's
> > > > > > > + * composition cycle), or the current time to indicate an im=
mediate deadline
> > > > > > > + * hint (Ie. forward progress cannot be made until this fenc=
e is signaled).
> > > > > >
> > > > > > Is it guaranteed that a GPU driver will use the actual start of=
 the
> > > > > > vblank as the effective deadline? I have some memories of seing
> > > > > > something about vblank evasion browsing driver code, which I mi=
ght have
> > > > > > misunderstood, but I have yet to find whether this is something
> > > > > > userspace can actually expect to be something it can rely on.
> > > > >
> > > > > I guess you mean s/GPU driver/display driver/ ?  It makes things =
more
> > > > > clear if we talk about them separately even if they happen to be =
the
> > > > > same device.
> > > >
> > > > Sure, sorry about being unclear about that.
> > > >
> > > > >
> > > > > Assuming that is what you mean, nothing strongly defines what the
> > > > > deadline is.  In practice there is probably some buffering in the
> > > > > display controller.  For ex, block based (including bandwidth
> > > > > compressed) formats, you need to buffer up a row of blocks to
> > > > > efficiently linearize for scanout.  So you probably need to latch=
 some
> > > > > time before you start sending pixel data to the display.  But det=
ails
> > > > > like this are heavily implementation dependent.  I think the most
> > > > > reasonable thing to target is start of vblank.
> > > >
> > > > The driver exposing those details would be quite useful for userspa=
ce
> > > > though, so that it can delay committing updates to late, but not to=
o
> > > > late. Setting a deadline to be the vblank seems easy enough, but it
> > > > isn't enough for scheduling the actual commit.
> > >
> > > I'm not entirely sure how that would even work.. but OTOH I think you
> > > are talking about something on the order of 100us?  But that is a bit
> > > of another topic.
> >
> > Yes, something like that. But yea, it's not really related. Scheduling
> > commits closer to the deadline has more complex behavior than that too,
> > e.g. the need for real time scheduling, and knowing how long it usually
> > takes to create and commit and for the kernel to process.

Vblank can be really long, especially with VRR where the additional
time you get to finish the frame comes from making vblank longer.
Using the start of vblank as a deadline makes VRR useless. It really
would be nice to have some feedback about the actual deadline from the
kernel, maybe in `struct drm_event_vblank`.

But yes, sorry, off topic...

> > >
> >
> > 8-< *snip* 8-<
> >
> > > > >
> > > > > You need a fence to set the deadline, and for that work needs to =
be
> > > > > flushed.  But you can't associate a deadline with work that the k=
ernel
> > > > > is unaware of anyways.
> > > >
> > > > That makes sense, but it might also a bit inadequate to have it as =
the
> > > > only way to tell the kernel it should speed things up. Even with th=
e
> > > > trick i915 does, with GNOME Shell, we still end up with the feedbac=
k
> > > > loop this series aims to mitigate. Doing triple buffering, i.e. del=
aying
> > > > or dropping the first frame is so far the best work around that wor=
ks,
> > > > except doing other tricks that makes the kernel to ramp up its cloc=
k.
> > > > Having to rely on choosing between latency and frame drops should
> > > > ideally not have to be made.
> > >
> > > Before you have a fence, the thing you want to be speeding up is the
> > > CPU, not the GPU.  There are existing mechanisms for that.
> >
> > Is there no benefit to let the GPU know earlier that it should speed up=
,
> > so that when the job queue arrives, it's already up to speed?
>
> Downstream we have input notifier that resumes the GPU so we can
> pipeline the 1-2ms it takes to boot up the GPU with userspace.  But we
> wait to boost freq until we have cmdstream to submit, since that
> doesn't take as long.  What needs help initially after input is all
> the stuff that happens on the CPU before the GPU can start to do
> anything ;-)
>
> Btw, I guess I haven't made this clear, dma-fence deadline is trying
> to help the steady-state situation, rather than the input-latency
> situation.  It might take a frame or two of missed deadlines for
> gpufreq to arrive at a good steady-state freq.

The mutter issue also is about a suboptimal steady-state.

Truth be told, I'm not sure if this fence deadline idea fixes the
issue we're seeing or at least helps sometimes. It might, it might
not. What annoys me is that the compositor *knows* before any work is
submitted that some work will be submitted and when it has to finish.
We could maximize the chances to get everything right but having to
wait for a fence to materialize in the compositor to do anything about
it is suboptimal.

> > >
> > > TBF I'm of the belief that there is still a need for input based cpu
> > > boost (and early wake-up trigger for GPU).. we have something like
> > > this in CrOS kernel.  That is a bit of a different topic, but my poin=
t
> > > is that fence deadlines are just one of several things we need to
> > > optimize power/perf and responsiveness, rather than the single thing
> > > that solves every problem under the sun ;-)
> >
> > Perhaps; but I believe it's a bit of a back channel of intent; the piec=
e
> > of the puzzle that has the information to know whether there is need
> > actually speed up is the compositor, not the kernel.
> >
> > For example, pressing 'p' while a terminal is focused does not need hig=
h
> > frequency clocks, it just needs the terminal emulator to draw a 'p' and
> > the compositor to composite that update. Pressing <Super> may however
> > trigger a non-trivial animation moving a lot of stuff around on screen,
> > maybe triggering Wayland clients to draw and what not, and should most
> > arguably have the ability to "warn" the kernel about the upcoming flood
> > of work before it is already knocking on its door step.
>
> The super key is problematic, but not for the reason you think.  It is
> because it is a case where we should boost on key-up instead of
> key-down.. and the second key-up event comes after the cpu-boost is
> already in it's cool-down period.  But even if suboptimal in cases
> like this, it is still useful for touch/stylus cases where the
> slightest of lag is much more perceptible.
>
> This is getting off topic but I kinda favor coming up with some sort
> of static definition that userspace could give the kernel to let the
> kernel know what input to boost on.  Or maybe something could be done
> with BPF?

Why? Do you think user space is so slow that it can't process the
input events and then do a syscall? We need to have all input devices
open anyway that can affect the system and know more about how they
affect behavior than the kernel can ever know.

>
> > >
> >
> > 8-< *snip* 8-<
> >
> > > >
> > > > Is it expected that WSI's will set their own deadlines, or should t=
hat
> > > > be the job of the compositor? For example by using compositors usin=
g
> > > > DMA_BUF_IOCTL_EXPORT_SYNC_FILE that you mentioned, using it to set =
a
> > > > deadline matching the vsync it most ideally will be committed to?
> > > >
> > >
> > > I'm kind of assuming compositors, but if the WSI somehow has more
> > > information about ideal presentation time, then I suppose it could be
> > > in the WSI?  I'll defer to folks who spend more time on WSI and
> > > compositors to hash out the details ;-)
> >
> > With my compositor developer hat on, it might be best to let it be up t=
o
> > the compositor, it's the one that knows if a client's content will
> > actually end up anywhere visible.
> >
>
> wfm
>
> BR,
> -R
>
> >
> > Jonas
> >
> > >
> > > BR,
> > > -R
>

