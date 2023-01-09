Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8659B662A5D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 16:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618A10E43B;
	Mon,  9 Jan 2023 15:45:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751E510E214
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 15:45:23 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id v30so13101775edb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 07:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bl7sQYUrFkifeTop4KvcfAF8ATybfwOhc/9EE69qj0s=;
 b=s7PQ1iDJ1DftvUgG1ed9b+YvcB2xQh+dJg9vXNM8vDejHBMOGctjpe5GFok1Yeb9TZ
 hThLF4L3o21+oXqgPPx28YL8AoS7k72lkOkz0mNi+c2hWehKTS53xvh6yyOqrm5NZS5x
 F9JuJPQ7qGBlQUJNvLzTHLWrDHhOckQsrM/PBd+loMmUIGlXupmOQfy1cdy4syqqMrYU
 cRwmX7r7xoEiI52wEnZLQwaMwBslGLnhia/qbAenh/JNs68CEWGSsYbDtSRxlW8bBXYE
 Rf0uhZUz+06lAdhC6H/xMC4tb+qdfYpzAxn0HISSZo4i1dqNGN6+e808TqGOjmNj53dJ
 sxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bl7sQYUrFkifeTop4KvcfAF8ATybfwOhc/9EE69qj0s=;
 b=vzq/q1AsBjKVqjNaFw3/+EWVbvurAtNvnaU9KXyYQFgfXceQyC+amKXIE/AOmgwpVt
 LHrO7pbMCnEVCLxoOeGEWdi5V8VeMoiqgqbghyA/lrIxgwQ8zehV9ySyarB/xVUJPL5i
 SagEf6LrJ0BwKuIbLPQgVCpa5gHub4xf0HLq1L/UsT9Z/QjsrvFoUsXXu07yjjwhEAZO
 ELwo5sKrgQ6IkEr1xY7FU8phQtfWDiHWltnza77z22xXDiR6zqfOOf+T3VLtH4BQETnH
 r33veHvzUdatg3ZdZ/8Jw2mm1FzE6+GTfPsLyc/uIMWyyJRcgHUuvPiTe5XvBfJ6JfCi
 LqGg==
X-Gm-Message-State: AFqh2koU/0N8t0YQ6SvR73vfvSpgGDF2Mkqo++gDMbNOEE8B0KbBqemG
 UXCOaxegNBL4uXmmrO6al7rlrsgTGuo9XqkApyGcDw==
X-Google-Smtp-Source: AMrXdXs4+U9Hcvd8zBYJnL1G4rL/2cLKMeoqsXhz0EBSiN2WGh7FWOFcjuBtIfAgJ/HQas0rPNfhzvClzvoxIjyoKEo=
X-Received: by 2002:aa7:c41a:0:b0:485:832:1e39 with SMTP id
 j26-20020aa7c41a000000b0048508321e39mr4818565edq.248.1673279121737; Mon, 09
 Jan 2023 07:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <Y7cns9bpfIslkCPu@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Y7cns9bpfIslkCPu@DUT025-TGLU.fm.intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 9 Jan 2023 09:45:09 -0600
Message-ID: <CAOFGe978gae1mN2W_rrgXQm4ioQm73Bkpr-ex2Oa4gtkNzDpcg@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a9762005f1d6a73b"
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
Cc: intel-gfx@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a9762005f1d6a73b
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 1:40 PM Matthew Brost <matthew.brost@intel.com>
wrote:

> On Mon, Jan 02, 2023 at 08:30:19AM +0100, Boris Brezillon wrote:
> > On Fri, 30 Dec 2022 12:55:08 +0100
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >
> > > On Fri, 30 Dec 2022 11:20:42 +0100
> > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >
> > > > Hello Matthew,
> > > >
> > > > On Thu, 22 Dec 2022 14:21:11 -0800
> > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > >
> > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first
> this
> > > > > seems a bit odd but let us explain the reasoning below.
> > > > >
> > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > guaranteed to be the same completion even if targeting the same
> hardware
> > > > > engine. This is because in XE we have a firmware scheduler, the
> GuC,
> > > > > which allowed to reorder, timeslice, and preempt submissions. If a
> using
> > > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR
> falls
> > > > > apart as the TDR expects submission order == completion order.
> Using a
> > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this
> problem.
> > > >
> > > > Oh, that's interesting. I've been trying to solve the same sort of
> > > > issues to support Arm's new Mali GPU which is relying on a
> FW-assisted
> > > > scheduling scheme (you give the FW N streams to execute, and it does
> > > > the scheduling between those N command streams, the kernel driver
> > > > does timeslice scheduling to update the command streams passed to the
> > > > FW). I must admit I gave up on using drm_sched at some point, mostly
> > > > because the integration with drm_sched was painful, but also because
> I
> > > > felt trying to bend drm_sched to make it interact with a
> > > > timeslice-oriented scheduling model wasn't really future proof.
> Giving
> > > > drm_sched_entity exlusive access to a drm_gpu_scheduler probably
> might
> > > > help for a few things (didn't think it through yet), but I feel it's
> > > > coming short on other aspects we have to deal with on Arm GPUs.
> > >
> > > Ok, so I just had a quick look at the Xe driver and how it
> > > instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> > > have a better understanding of how you get away with using drm_sched
> > > while still controlling how scheduling is really done. Here
> > > drm_gpu_scheduler is just a dummy abstract that let's you use the
> > > drm_sched job queuing/dep/tracking mechanism. The whole run-queue
>
> You nailed it here, we use the DRM scheduler for queuing jobs,
> dependency tracking and releasing jobs to be scheduled when dependencies
> are met, and lastly a tracking mechanism of inflights jobs that need to
> be cleaned up if an error occurs. It doesn't actually do any scheduling
> aside from the most basic level of not overflowing the submission ring
> buffer. In this sense, a 1 to 1 relationship between entity and
> scheduler fits quite well.
>

Yeah, I think there's an annoying difference between what AMD/NVIDIA/Intel
want here and what you need for Arm thanks to the number of FW queues
available. I don't remember the exact number of GuC queues but it's at
least 1k. This puts it in an entirely different class from what you have on
Mali. Roughly, there's about three categories here:

 1. Hardware where the kernel is placing jobs on actual HW rings. This is
old Mali, Intel Haswell and earlier, and probably a bunch of others.
(Intel BDW+ with execlists is a weird case that doesn't fit in this
categorization.)

 2. Hardware (or firmware) with a very limited number of queues where
you're going to have to juggle in the kernel in order to run desktop Linux.

 3. Firmware scheduling with a high queue count. In this case, you don't
want the kernel scheduling anything. Just throw it at the firmware and let
it go brrrrr.  If we ever run out of queues (unlikely), the kernel can
temporarily pause some low-priority contexts and do some juggling or,
frankly, just fail userspace queue creation and tell the user to close some
windows.

The existence of this 2nd class is a bit annoying but it's where we are. I
think it's worth recognizing that Xe and panfrost are in different places
here and will require different designs. For Xe, we really are just using
drm/scheduler as a front-end and the firmware does all the real scheduling.

How do we deal with class 2? That's an interesting question.  We may
eventually want to break that off into a separate discussion and not litter
the Xe thread but let's keep going here for a bit.  I think there are some
pretty reasonable solutions but they're going to look a bit different.

The way I did this for Xe with execlists was to keep the 1:1:1 mapping
between drm_gpu_scheduler, drm_sched_entity, and userspace xe_engine.
Instead of feeding a GuC ring, though, it would feed a fixed-size execlist
ring and then there was a tiny kernel which operated entirely in IRQ
handlers which juggled those execlists by smashing HW registers.  For
Panfrost, I think we want something slightly different but can borrow some
ideas here.  In particular, have the schedulers feed kernel-side SW queues
(they can even be fixed-size if that helps) and then have a kthread which
juggles those feeds the limited FW queues.  In the case where you have few
enough active contexts to fit them all in FW, I do think it's best to have
them all active in FW and let it schedule. But with only 31, you need to be
able to juggle if you run out.

FWIW this design was also ran by AMD quite a while ago (off the list)
> and we didn't get any serious push back. Things can change however...
>

Yup, AMD and NVIDIA both want this, more-or-less.


> > > selection is dumb because there's only one entity ever bound to the
> > > scheduler (the one that's part of the xe_guc_engine object which also
> > > contains the drm_gpu_scheduler instance). I guess the main issue we'd
> > > have on Arm is the fact that the stream doesn't necessarily get
> > > scheduled when ->run_job() is called, it can be placed in the runnable
> > > queue and be picked later by the kernel-side scheduler when a FW slot
> > > gets released. That can probably be sorted out by manually disabling
> the
> > > job timer and re-enabling it when the stream gets picked by the
> > > scheduler. But my main concern remains, we're basically abusing
> > > drm_sched here.
> > >
>
> That's a matter of opinion, yes we are using it slightly differently
> than anyone else but IMO the fact the DRM scheduler works for the Xe use
> case with barely any changes is a testament to its design.
>
> > > For the Arm driver, that means turning the following sequence
> > >
> > > 1. wait for job deps
> > > 2. queue job to ringbuf and push the stream to the runnable
> > >    queue (if it wasn't queued already). Wakeup the timeslice scheduler
> > >    to re-evaluate (if the stream is not on a FW slot already)
> > > 3. stream gets picked by the timeslice scheduler and sent to the FW for
> > >    execution
> > >
> > > into
> > >
> > > 1. queue job to entity which takes care of waiting for job deps for
> > >    us
> > > 2. schedule a drm_sched_main iteration
> > > 3. the only available entity is picked, and the first job from this
> > >    entity is dequeued. ->run_job() is called: the job is queued to the
> > >    ringbuf and the stream is pushed to the runnable queue (if it wasn't
> > >    queued already). Wakeup the timeslice scheduler to re-evaluate (if
> > >    the stream is not on a FW slot already)
> > > 4. stream gets picked by the timeslice scheduler and sent to the FW for
> > >    execution
> > >
>
> Yes, an extra step but you get to use all the nice DRM scheduler
> functions for dependency tracking. Also in our case we really want a
> single entry point in the backend (the work queue). Also see [1] which
> helped us seal a bunch of races we had in the i915 by using a single
> entry point. All these benefits are why we landed on the DRM scheduler
> and it has worked of rather nicely compared to the i915.
>
> [1] https://patchwork.freedesktop.org/patch/515857/?series=112189&rev=1
>
> > > That's one extra step we don't really need. To sum-up, yes, all the
> > > job/entity tracking might be interesting to share/re-use, but I wonder
> > > if we couldn't have that without pulling out the scheduling part of
> > > drm_sched, or maybe I'm missing something, and there's something in
> > > drm_gpu_scheduler you really need.
> >
> > On second thought, that's probably an acceptable overhead (not even
> > sure the extra step I was mentioning exists in practice, because dep
> > fence signaled state is checked as part of the drm_sched_main
> > iteration, so that's basically replacing the worker I schedule to
> > check job deps), and I like the idea of being able to re-use drm_sched
> > dep-tracking without resorting to invasive changes to the existing
> > logic, so I'll probably give it a try.
>
> Let me know how this goes.
>
> Matt
>

--000000000000a9762005f1d6a73b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jan 5, 2023 at 1:40 PM Matthew Brost &lt;<a href=3D"mailto:m=
atthew.brost@intel.com">matthew.brost@intel.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jan 02, 2023 at 08:3=
0:19AM +0100, Boris Brezillon wrote:<br>
&gt; On Fri, 30 Dec 2022 12:55:08 +0100<br>
&gt; Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@collabora.com" t=
arget=3D"_blank">boris.brezillon@collabora.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, 30 Dec 2022 11:20:42 +0100<br>
&gt; &gt; Boris Brezillon &lt;<a href=3D"mailto:boris.brezillon@collabora.c=
om" target=3D"_blank">boris.brezillon@collabora.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; Hello Matthew,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On Thu, 22 Dec 2022 14:21:11 -0800<br>
&gt; &gt; &gt; Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.com"=
 target=3D"_blank">matthew.brost@intel.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; In XE, the new Intel GPU driver, a choice has made to h=
ave a 1 to 1<br>
&gt; &gt; &gt; &gt; mapping between a drm_gpu_scheduler and drm_sched_entit=
y. At first this<br>
&gt; &gt; &gt; &gt; seems a bit odd but let us explain the reasoning below.=
<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; 1. In XE the submission order from multiple drm_sched_e=
ntity is not<br>
&gt; &gt; &gt; &gt; guaranteed to be the same completion even if targeting =
the same hardware<br>
&gt; &gt; &gt; &gt; engine. This is because in XE we have a firmware schedu=
ler, the GuC,<br>
&gt; &gt; &gt; &gt; which allowed to reorder, timeslice, and preempt submis=
sions. If a using<br>
&gt; &gt; &gt; &gt; shared drm_gpu_scheduler across multiple drm_sched_enti=
ty, the TDR falls<br>
&gt; &gt; &gt; &gt; apart as the TDR expects submission order =3D=3D comple=
tion order. Using a<br>
&gt; &gt; &gt; &gt; dedicated drm_gpu_scheduler per drm_sched_entity solve =
this problem.=C2=A0 =C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Oh, that&#39;s interesting. I&#39;ve been trying to solve th=
e same sort of<br>
&gt; &gt; &gt; issues to support Arm&#39;s new Mali GPU which is relying on=
 a FW-assisted<br>
&gt; &gt; &gt; scheduling scheme (you give the FW N streams to execute, and=
 it does<br>
&gt; &gt; &gt; the scheduling between those N command streams, the kernel d=
river<br>
&gt; &gt; &gt; does timeslice scheduling to update the command streams pass=
ed to the<br>
&gt; &gt; &gt; FW). I must admit I gave up on using drm_sched at some point=
, mostly<br>
&gt; &gt; &gt; because the integration with drm_sched was painful, but also=
 because I<br>
&gt; &gt; &gt; felt trying to bend drm_sched to make it interact with a<br>
&gt; &gt; &gt; timeslice-oriented scheduling model wasn&#39;t really future=
 proof. Giving<br>
&gt; &gt; &gt; drm_sched_entity exlusive access to a drm_gpu_scheduler prob=
ably might<br>
&gt; &gt; &gt; help for a few things (didn&#39;t think it through yet), but=
 I feel it&#39;s<br>
&gt; &gt; &gt; coming short on other aspects we have to deal with on Arm GP=
Us.=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; Ok, so I just had a quick look at the Xe driver and how it<br>
&gt; &gt; instantiates the drm_sched_entity and drm_gpu_scheduler, and I th=
ink I<br>
&gt; &gt; have a better understanding of how you get away with using drm_sc=
hed<br>
&gt; &gt; while still controlling how scheduling is really done. Here<br>
&gt; &gt; drm_gpu_scheduler is just a dummy abstract that let&#39;s you use=
 the<br>
&gt; &gt; drm_sched job queuing/dep/tracking mechanism. The whole run-queue=
<br>
<br>
You nailed it here, we use the DRM scheduler for queuing jobs,<br>
dependency tracking and releasing jobs to be scheduled when dependencies<br=
>
are met, and lastly a tracking mechanism of inflights jobs that need to<br>
be cleaned up if an error occurs. It doesn&#39;t actually do any scheduling=
<br>
aside from the most basic level of not overflowing the submission ring<br>
buffer. In this sense, a 1 to 1 relationship between entity and<br>
scheduler fits quite well.<br></blockquote><div><br></div><div>Yeah, I thin=
k there&#39;s an annoying difference between what AMD/NVIDIA/Intel want her=
e and what you need for Arm thanks to the number of FW queues available. I =
don&#39;t remember the exact number of GuC queues but it&#39;s at least 1k.=
 This puts it in an entirely different class from what you have on Mali. Ro=
ughly, there&#39;s about three categories here:</div><div><br></div><div>=
=C2=A01. Hardware where the kernel is placing jobs on actual HW rings. This=
 is old Mali, Intel Haswell and earlier, and probably a bunch of others.=C2=
=A0 (Intel BDW+ with execlists is a weird case that doesn&#39;t fit in this=
 categorization.)<br></div><div><br></div><div>=C2=A02. Hardware (or firmwa=
re) with a very limited number of queues where you&#39;re going to have to =
juggle in the kernel in order to run desktop Linux.</div><div><br></div><di=
v>=C2=A03. Firmware scheduling with a high queue count. In this case, you d=
on&#39;t want the kernel scheduling anything. Just throw it at the firmware=
 and let it go brrrrr.=C2=A0 If we ever run out of queues (unlikely), the k=
ernel can temporarily pause some low-priority contexts and do some juggling=
 or, frankly, just fail userspace queue creation and tell the user to close=
 some windows.</div><div><br></div><div>The existence of this 2nd class is =
a bit annoying but it&#39;s where we are. I think it&#39;s worth recognizin=
g that Xe and panfrost are in different places here and will require differ=
ent designs. For Xe, we really are just using drm/scheduler as a front-end =
and the firmware does all the real scheduling.</div><div><br></div><div>How=
 do we deal with class 2? That&#39;s an interesting question.=C2=A0 We may =
eventually want to break that off into a separate discussion and not litter=
 the Xe thread but let&#39;s keep going here for a bit.=C2=A0 I think there=
 are some pretty reasonable solutions but they&#39;re going to look a bit d=
ifferent.</div><div><br></div><div>The way I did this for Xe with execlists=
 was to keep the 1:1:1 mapping between drm_gpu_scheduler, drm_sched_entity,=
 and userspace xe_engine.=C2=A0 Instead of feeding a GuC ring, though, it w=
ould feed a fixed-size execlist ring and then there was a tiny kernel which=
 operated entirely in IRQ handlers which juggled those execlists by smashin=
g HW registers.=C2=A0 For Panfrost, I think we want something slightly diff=
erent but can borrow some ideas here.=C2=A0 In particular, have the schedul=
ers feed kernel-side SW queues (they can even be fixed-size if that helps) =
and then have a kthread which juggles those feeds the limited FW queues.=C2=
=A0 In the case where you have few enough active contexts to fit them all i=
n FW, I do think it&#39;s best to have them all active in FW and let it sch=
edule. But with only 31, you need to be able to juggle if you run out.<br><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
FWIW this design was also ran by AMD quite a while ago (off the list)<br>
and we didn&#39;t get any serious push back. Things can change however...<b=
r></blockquote><div><br></div><div>Yup, AMD and NVIDIA both want this, more=
-or-less.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; &gt; selection is dumb because there&#39;s only one entity ever bound =
to the<br>
&gt; &gt; scheduler (the one that&#39;s part of the xe_guc_engine object wh=
ich also<br>
&gt; &gt; contains the drm_gpu_scheduler instance). I guess the main issue =
we&#39;d<br>
&gt; &gt; have on Arm is the fact that the stream doesn&#39;t necessarily g=
et<br>
&gt; &gt; scheduled when -&gt;run_job() is called, it can be placed in the =
runnable<br>
&gt; &gt; queue and be picked later by the kernel-side scheduler when a FW =
slot<br>
&gt; &gt; gets released. That can probably be sorted out by manually disabl=
ing the<br>
&gt; &gt; job timer and re-enabling it when the stream gets picked by the<b=
r>
&gt; &gt; scheduler. But my main concern remains, we&#39;re basically abusi=
ng<br>
&gt; &gt; drm_sched here.<br>
&gt; &gt; <br>
<br>
That&#39;s a matter of opinion, yes we are using it slightly differently<br=
>
than anyone else but IMO the fact the DRM scheduler works for the Xe use<br=
>
case with barely any changes is a testament to its design.<br>
<br>
&gt; &gt; For the Arm driver, that means turning the following sequence<br>
&gt; &gt; <br>
&gt; &gt; 1. wait for job deps<br>
&gt; &gt; 2. queue job to ringbuf and push the stream to the runnable<br>
&gt; &gt;=C2=A0 =C2=A0 queue (if it wasn&#39;t queued already). Wakeup the =
timeslice scheduler<br>
&gt; &gt;=C2=A0 =C2=A0 to re-evaluate (if the stream is not on a FW slot al=
ready)<br>
&gt; &gt; 3. stream gets picked by the timeslice scheduler and sent to the =
FW for<br>
&gt; &gt;=C2=A0 =C2=A0 execution<br>
&gt; &gt; <br>
&gt; &gt; into<br>
&gt; &gt; <br>
&gt; &gt; 1. queue job to entity which takes care of waiting for job deps f=
or<br>
&gt; &gt;=C2=A0 =C2=A0 us<br>
&gt; &gt; 2. schedule a drm_sched_main iteration<br>
&gt; &gt; 3. the only available entity is picked, and the first job from th=
is<br>
&gt; &gt;=C2=A0 =C2=A0 entity is dequeued. -&gt;run_job() is called: the jo=
b is queued to the<br>
&gt; &gt;=C2=A0 =C2=A0 ringbuf and the stream is pushed to the runnable que=
ue (if it wasn&#39;t<br>
&gt; &gt;=C2=A0 =C2=A0 queued already). Wakeup the timeslice scheduler to r=
e-evaluate (if<br>
&gt; &gt;=C2=A0 =C2=A0 the stream is not on a FW slot already)<br>
&gt; &gt; 4. stream gets picked by the timeslice scheduler and sent to the =
FW for<br>
&gt; &gt;=C2=A0 =C2=A0 execution<br>
&gt; &gt;<br>
<br>
Yes, an extra step but you get to use all the nice DRM scheduler<br>
functions for dependency tracking. Also in our case we really want a<br>
single entry point in the backend (the work queue). Also see [1] which<br>
helped us seal a bunch of races we had in the i915 by using a single<br>
entry point. All these benefits are why we landed on the DRM scheduler<br>
and it has worked of rather nicely compared to the i915.<br>
<br>
[1] <a href=3D"https://patchwork.freedesktop.org/patch/515857/?series=3D112=
189&amp;rev=3D1" rel=3D"noreferrer" target=3D"_blank">https://patchwork.fre=
edesktop.org/patch/515857/?series=3D112189&amp;rev=3D1</a><br>
<br>
&gt; &gt; That&#39;s one extra step we don&#39;t really need. To sum-up, ye=
s, all the<br>
&gt; &gt; job/entity tracking might be interesting to share/re-use, but I w=
onder<br>
&gt; &gt; if we couldn&#39;t have that without pulling out the scheduling p=
art of<br>
&gt; &gt; drm_sched, or maybe I&#39;m missing something, and there&#39;s so=
mething in<br>
&gt; &gt; drm_gpu_scheduler you really need.<br>
&gt; <br>
&gt; On second thought, that&#39;s probably an acceptable overhead (not eve=
n<br>
&gt; sure the extra step I was mentioning exists in practice, because dep<b=
r>
&gt; fence signaled state is checked as part of the drm_sched_main<br>
&gt; iteration, so that&#39;s basically replacing the worker I schedule to<=
br>
&gt; check job deps), and I like the idea of being able to re-use drm_sched=
<br>
&gt; dep-tracking without resorting to invasive changes to the existing<br>
&gt; logic, so I&#39;ll probably give it a try.<br>
<br>
Let me know how this goes.<br>
<br>
Matt<br>
</blockquote></div></div>

--000000000000a9762005f1d6a73b--
