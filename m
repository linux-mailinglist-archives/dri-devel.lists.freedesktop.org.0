Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595F7A78C7E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E0E10E73F;
	Wed,  2 Apr 2025 10:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a27VhqEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF80D10E02B
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743590243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LB+OCrETLjI154ev6c36UWNo2HChSSsbPeEPe6IM2Qo=;
 b=a27VhqEyeNkNPGpYXZS2ErfCN2M7ZwJBbUDZl2THUtTfQgSRyG4SywOq1OcGfJUTQ1LVGO
 +As42JbfknpX1fiKxmbE/bftO9tDXJhslGHbmczMNEc5zrVaOXVQhqQm8eOCp5E0OkPTvM
 FhjMHYogeTwjo7UZTbkYsxlBzjx1M8U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-Gt1ZS82bNMiStq72HQ203Q-1; Wed, 02 Apr 2025 06:37:22 -0400
X-MC-Unique: Gt1ZS82bNMiStq72HQ203Q-1
X-Mimecast-MFC-AGG-ID: Gt1ZS82bNMiStq72HQ203Q_1743590241
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-ac37ed2b99fso586407866b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 03:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743590241; x=1744195041;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LB+OCrETLjI154ev6c36UWNo2HChSSsbPeEPe6IM2Qo=;
 b=Bx327wx7U05foA5e2M2HjxI5mAilxZunHzkHd06qsuIKkVY/4q2DggH2dh4hevAbjI
 XGDQGJUDSedDCFO2SKhYMBrEXaEG8JSNPpBjHfVaTl049J9+psqf60tBPodPZJL7iorO
 GtAFGe2CqBCqTzLrfQM8A2bKEBSJVhvPpgCNbqdx7ahvmEDB1E9bQQuovE9V5XtS4Vyo
 JuUHEI7hEg9RWMoM/OA5MRCpS0n8NUcZmiWCLSyOclJ4qOYy2TpPKRqZc/EMsAnv8Mg7
 VnPM/7Vq8M8FaIE1RrX9004N7jfV/9clM9Z0dbtJQH+vdpogamUrpugikyZqnie1uFtn
 m+3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcaI44EeDrSXQSGeX1NdYXldcDEs09JCifkIECSj7UyTyDLYxlAi5JUQ239z9fkbuwh2/V+siSdcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYrbT4Zg6LS0Krht02YIbRZi5nVfKNpBFwAWNzFnfH/YBfKLSY
 ZQBl/RIWDDTl5Ny6AmZBsi4WJmu//ciUm2RKdczVy4Zf5qx5EDnE66M6DKrtgMh0BtyvEOg1mre
 y0HfrbmQYcgN8aO7+7Kt5bFrRcWkIQT2kTKxGSW+sf1pNxSxZ/91k8n6rBLuEH/t5yw==
X-Gm-Gg: ASbGnctvgtBaCM+YopZz9WOGvTi+vfKFeHQXH2qQOx583oHfPt6Dtf/LGv7/fEIQplV
 VlsXByXd3GvXZ56WpcsXZmOuhcnDZeFHadFSO5ajgQ+sIWGVZ1JM+NgKs1/IkGfhIHL5q/cVT5q
 mTr2heedth/7Wpoai/SnPlcI9SM8hmrHq7nsouQleXvn9QYRFRovUBBN/olkO4ajARj6wlfqpan
 L9p6JiBwtAsqrogzDmjwyfVVU4h6FfmbtZoUcL350MMPyLkj8CeUi8HmIZhl3pU2chOTFsT1IKz
 eYNdaI472NOy+QtW9tlFlBb5WtLKCcLLZFvVRdV/6J0SDELcYAAVfh0LqbXVs8EciSRF7IOXCR8
 cj/8mh67tkdzQbMhtV7EKbrwR0dX0SYWIbgg8r+7HKdV6Kfdsy3s=
X-Received: by 2002:a17:907:1c9c:b0:ac2:baab:681c with SMTP id
 a640c23a62f3a-ac738a55dffmr1304227066b.28.1743590241304; 
 Wed, 02 Apr 2025 03:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCPtn6z+7pvVwjH4k3MJa1nEZjlSSXMOZDJB+JROM5z2iSHHfjRzj0zMHa9cE4mOGf93YM9g==
X-Received: by 2002:a17:907:1c9c:b0:ac2:baab:681c with SMTP id
 a640c23a62f3a-ac738a55dffmr1304224766b.28.1743590240831; 
 Wed, 02 Apr 2025 03:37:20 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d97:6a00:6929:a9f6:5863:aac5?
 (200116b82d976a006929a9f65863aac5.dip.versatel-1u1.de.
 [2001:16b8:2d97:6a00:6929:a9f6:5863:aac5])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7196999f5sm909884766b.143.2025.04.02.03.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 03:37:20 -0700 (PDT)
Message-ID: <92572c626ae16366eeccd3d1e7d957991549c02a.camel@redhat.com>
Subject: Re: [RFC v3 00/14] Deadline DRM scheduler
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>, Matthew
 Brost <matthew.brost@intel.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>
Date: Wed, 02 Apr 2025 12:37:19 +0200
In-Reply-To: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kCVJhgGncOaUz0QGBG0qehXxmfnjVnFChZaZtG9XDb0_1743590241
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alright alright, uff, so this will be a lot to discuss=E2=80=A6

(btw. my chaotic email filters had me search the cover-letter for a
while, which seems to have gone to my RH addr, with the others going to
kernel.org =E2=80=93 I need a better mail client)


On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
> This is similar to v2 but I dropped some patches (for now) and added
> some new
> ones. Most notably deadline scaling based on queue depth appears to
> be able to
> add a little bit of fairness with spammy clients (deep submission
> queue).
>=20
> As such, on the high level main advantages of the series:
>=20
> =C2=A01. Code simplification - no more multiple run queues.
> =C2=A02. Scheduling quality - schedules better than FIFO.
> =C2=A03. No more RR is even more code simplification but this one needs t=
o
> be tested
> =C2=A0=C2=A0=C2=A0 and approved by someone who actually uses RR.
>=20
> In the future futher simplifactions and improvements should be
> possible on top
> of this work. But for now I keep it simple.
>=20
> First patch adds some unit tests which allow for easy evaluation of
> scheduling
> behaviour against different client submission patterns. From there
> onwards it is
> a hopefully natural progression of patches (or close) to the end
> result which is
> a slightly more fair scheduler than FIFO.
>=20
> Regarding the submission patterns tested, it is always two parallel
> clients
> and they broadly cover these categories:
>=20
> =C2=A0* Deep queue clients
> =C2=A0* Hogs versus interactive
> =C2=A0* Priority handling
>=20
> Lets look at the results:
>=20
> 1. Two normal priority deep queue clients.
>=20
> These ones submit one second worth of 8ms jobs. As fast as they can,
> no
> dependencies etc. There is no difference in runtime between FIFO and
> qddl but
> the latter allows both clients to progress with work more evenly:
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/normal-normal.png

I read qd surprisingly long as dp and was confused :)

And the title reads "Normal vs Normal"

>=20
> (X axis is time, Y is submitted queue-depth, hence lowering of qd
> corresponds
> =C2=A0 with work progress for both clients, tested with both schedulers
> separately.)
>=20
> 2. Same two clients but one is now low priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/normal-low.png
>=20
> Normal priority client is a solid line, low priority dotted. We can
> see how FIFO
> completely starves the low priority client until the normal priority
> is fully
> done. Only then the low priority client gets any GPU time.
>=20
> In constrast, qddl allows some GPU time to the low priority client.
>=20
> 3. Same clients but now high versus normal priority.
>=20
> Similar behaviour as in the previous one with normal a bit less de-
> prioritised
> relative to high, than low was against normal.
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/high-normal.png
>=20
> 4. Heavy load vs interactive client.
>=20
> Heavy client emits a 75% GPU load in the format of 3x 2.5ms jobs
> followed by a
> 2.5ms wait.
>=20
> Interactive client emites a 10% GPU load in the format of 1x 1ms job
> followed
> by a 9ms wait.
>=20
> This simulates an interactive graphical client used on top of a
> relatively heavy
> background load but no GPU oversubscription.
>=20
> Graphs show the interactive client only and from now on, instead of
> looking at
> the client's queue depth, we look at its "fps".
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/heavy-interactive.png
>=20
> We can see that qddl allows a slighty higher fps for the interactive
> client
> which is good.
>=20
> 5. Low priority GPU hog versus heavy-interactive.
>=20
> Low priority client: 3x 2.5ms jobs client followed by a 0.5ms wait.
> Interactive client: 1x 0.5ms job followed by a 10ms wait.
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/lowhog-interactive.png
>=20
> No difference between the schedulers.
>=20
> 6. Last set of test scenarios will have three subgroups.
>=20
> In all cases we have two interactive (synchronous, single job at a
> time) clients
> with a 50% "duty cycle" GPU time usage.
>=20
> Client 1: 1.5ms job + 1.5ms wait (aka short bursty)
> Client 2: 2.5ms job + 2.5ms wait (aka long bursty)
>=20
> a) Both normal priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-short.png
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-long.png
>=20
> Both schedulers favour the higher frequency duty cycle with qddl
> giving it a
> little bit more which should be good for interactivity.
>=20
> b) Normal vs low priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-normal.=
png
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-normal-low-low.png
>=20
> Qddl gives a bit more to the normal than low.
>=20
> c) High vs normal priority.
>=20
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-high.p=
ng
> https://people.igalia.com/tursulin/drm-sched-qddl/5050-high-normal-normal=
.png
>=20
> Again, qddl gives a bit more share to the higher priority client.
>=20
> On the overall qddl looks like a potential improvement in terms of
> fairness,
> especially avoiding priority starvation. There do not appear to be
> any
> regressions with the tested workloads.

OK, so the above seems to be the measurements serving as a
justification for the major rework.

I suppose this was tested on a workstation with AMD card?

>=20
> As before, I am looking for feedback, ideas for what kind of
> submission
> scenarios to test. Testers on different GPUs would be very welcome
> too.
>=20
> And I should probably test round-robin at some point, to see if we
> are maybe
> okay to drop unconditionally, it or further work improving qddl would
> be needed.
>=20
> v2:
> =C2=A0* Fixed many rebase errors.
> =C2=A0* Added some new patches.
> =C2=A0* Dropped single shot dependecy handling.
>=20
> v3:
> =C2=A0* Added scheduling quality unit tests.
> =C2=A0* Refined a tiny bit by adding some fairness.
> =C2=A0* Dropped a few patches for now.
>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
>=20
> Tvrtko Ursulin (14):

There appear to be, again, some candidates which should be branched out
since they're independent from the scheduling policy. Suspicious ones
are:

> =C2=A0 drm/sched: Add some scheduling quality unit tests
> =C2=A0 drm/sched: Avoid double re-lock on the job free path
> =C2=A0 drm/sched: Consolidate drm_sched_job_timedout

this one

> =C2=A0 drm/sched: Clarify locked section in
> drm_sched_rq_select_entity_fifo

^

> =C2=A0 drm/sched: Consolidate drm_sched_rq_select_entity_rr
> =C2=A0 drm/sched: Implement RR via FIFO
> =C2=A0 drm/sched: Consolidate entity run queue management
> =C2=A0 drm/sched: Move run queue related code into a separate file
> =C2=A0 drm/sched: Add deadline policy
> =C2=A0 drm/sched: Remove FIFO and RR and simplify to a single run queue
> =C2=A0 drm/sched: Queue all free credits in one worker invocation
> =C2=A0 drm/sched: Embed run queue singleton into the scheduler
> =C2=A0 drm/sched: De-clutter drm_sched_init

^

> =C2=A0 drm/sched: Scale deadlines depending on queue depth
>=20
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 27 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 8 +-

Alright, so here we have our lovely AMD cards :)

Here's a thing:

Back in the day, we did a seemingly harmless change of the scheduler's
default scheduling policy, from RR to FIFO. From all the arguments I
have seen in the git log and the archives, this was one of the typical
changes where the developer is tempted to think "This *cannot* break
anything, it makes everything _better_ and has only advantages". But it
turned out that it did break things and resulted in lengthy and
interesting discussions here:

https://gitlab.freedesktop.org/drm/amd/-/issues/2516

Now, from time to time it is worth breaking things for progress. So the
possibility that things *could* break even with the best improvements
is not really an argument.

It becomes an argument, however, when we consider the following:
AMD cards are the major profiteer of this change, generating X percent
of performance and fairness gain.

Reason being that AMD seems to be the most important party that has
hardware scheduling. For Nouveau and Xe, that deadline policy won't do
anything.

And, if I understood correctly, new AMD generations will move to
firmware schedeuling, too.

So that raises the question: is it worth it?

If I am not mistaken, the firmware scheduler stakeholders largely
shouldn't feel an impact when drm_sched changes its scheduling
behavior, since the firmware does what it wants anyways.

But there are some other drivers that use hardware scheduling, and this
(and remaining bad feelings in the guts about firmware schedulers)
makes me nervous about touching the global scheduling behavior.

It appears to me that if AMD cards are the major profiteer, and it is
deemed that the performance gain is really worth it for the older and
current generations, then we should at least explore / consider paths
toward changing scheduling behavior for AMD only.

But, as you, I am also interested in hearing from the other drivers.
And correct me on any wrong assumptions above.


P.


> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 121 ++--
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_internal.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 17 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 581 ++++------------
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 188 ++++++
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0.../gpu/drm/scheduler/tests/tests_scheduler.c | 548
> +++++++++++++++++
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 17 +-
> =C2=A015 files changed, 962 insertions(+), 579 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_scheduler.=
c
>=20

