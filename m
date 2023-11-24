Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E35197F701A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 10:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A560210E7AC;
	Fri, 24 Nov 2023 09:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5110E7AC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 09:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1700818719; x=1701423519; i=spasswolf@web.de;
 bh=6ePSziEKIsnu6W26+QEv8KApAA7M4OnBSGyj1xQK2B8=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:
 References;
 b=DslePlZLwyrpr0KKU6Ar+562Do2Zuhc6Owk3l1iZC4npfTcGbZ0aXQLWkH0xtz7Q
 hAMlwpuXoKgp8pykV9hIJeTCntOmIylbBPkMRRY6RCi1Q4MwpNeNqtNt/CeVaZygI
 TEcnhJ/XJgi/sbkGIotLl8s9FHRU2YLbvR1GfF+0YrWxJWbN+1opqnCeDvMdCCDkC
 vO73gIzX3BkCiFKzYNRRCZQVEGnQp8joBYln2Jl3/hOCsweJ/DCCdvCi8bZ3abp9W
 y5jCpJhZH99pcdWMEBHKeI81AHxSE2/sfFF9co/hMnBrkXeJKWMwTBRQ12J53DeeE
 SECkpoB8o/9qrDfToQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MV2OY-1qhbTN23pG-00S85H; Fri, 24
 Nov 2023 10:38:39 +0100
Message-ID: <4ed1921c91c46ca2bb3877038aff27dc4ea0dab1.camel@web.de>
Subject: Re: drm scheduler redesign causes deadlocks [extended repost]
From: Bert Karwatzki <spasswolf@web.de>
To: Luben Tuikov <ltuikov89@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 24 Nov 2023 10:38:38 +0100
In-Reply-To: <b2185acd-b5fb-4f60-b5f3-631d27c0396a@gmail.com>
References: <36bece178ff5dc705065e53d1e5e41f6db6d87e4.camel@web.de>
 <b2185acd-b5fb-4f60-b5f3-631d27c0396a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.50.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3pQ1xpWdJo67yVCqkq5fpAp5sr250nGBZMO3wiz6e4gtBdDiqJP
 /WTikHWoIOFbtv0OunJ3CSnnsdbsbsVOh6CCr6YfyX6TRl6eN0NUAgmshbkz+jp90D+aKfD
 2Bkom6nmRrDZgYUg2kY1zI6eVBNrnwwNXD6ekNscYM2EnywfmEV+rNC/yKl6i3riEGk1IZl
 U9l/+XHnRC68RsdnHwFPw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IJWZWp6k3fI=;yNFElkiif0MtBAKQz1qglFQ5wNO
 JCUEmSjyL75614GgEnPWffBGdadVLdP0sh6NIhuboCu1pRDJM4MbIOO/FVxNxnFfELO1WSfbB
 ixSjbMRctIyQENBuG+rn8XIulmJyQjDExz8+5gGTm8U3i4+RYf/0up0S56tCpfWUZK8upw/0h
 eoGpQCajvxpVcJQJkMUlbnAZSgO6mN05M/IVywx4ODrKtvXisdlgMXJKOaPy3N+JwBJpgxNB3
 mfGMSD5unrMd9tpeAdQrRAOf+wxSlO4/hlCM/SSSJxlXeFv9aTZjLI9CQ1g3vkvGwrLTDIMGc
 PzW9Kg04JIa6ONV+zNQBSzTgBbf0J9x/QefTAuLBWatNHOec9M2QUXHGRAM+hBbX9/TMVV1Z7
 UQ9JrTFQybCynyg+HgwMjNZ/cc0zC/KcCeE+YkCwbU2G/bf2yW0lFZ2Abw+k8cJ/a4twF/CX5
 TWC/aPopLHCVTr0hSIaeqi/5AGWkbZvXHHte8gMhoOv1EpDhC6gBCfbI3KoAvQE2xNGyOqpIp
 Vm9g3hIhO2/Ldrp9Vok8DjLykVXsGcvRmWYP0toDF0ZK/E2Gqdi7mlmH3cSHv8MwBZEPaTRuL
 m/K+iKZACQdQLls85sG//j7qLYsbr1p06uV7jKhfjiQUdM0gBn6bkhOlMGXUZDtUFYRgG9hVt
 2MSd6agrJPzPcgi7wKMFpO3HNHyBR2uXDU7MCutuW1skVJb7za8821cQc4E3rXtRwMWqwe4sm
 d8w5KYsWz8KrK1qUy5lDn9SthCWRAkiMPFGSufic851ao2FDJExeRgFgwE0BoNln96GfdIgDE
 9r3G3EPm9N19++CFzjhc8ZGkqTp0m8XTrLvbjXKKoRHyL9mZS5VKznGP3Pjo+RCBm4/WX+GdQ
 CexjxJXpOS+z2TmaxEe05YcxIu6IB6e7TogCP49Bqd4tfH9gVxJy1Gi8x0vPCXnrCBvweSi4q
 +k9a2g==
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
Cc: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 22.11.2023 um 18:02 -0500 schrieb Luben Tuikov:
> On 2023-11-21 04:00, Bert Karwatzki wrote:
> > Since linux-next-20231115 my linux system (debian sid on msi alpha 15
> > laptop)
> > suffers from random deadlocks which can occur after=C2=A0 30 - 180min =
of usage.
> > These
> > deadlocks can be actively provoked by creating high system load (usual=
ly by
> > compiling a kernel with make -j NRCPUS) and the opening instances of
> > libreoffice
> > --writer until the system GUI locks (the mouse cursor can still be mov=
ed but
> > the
> > screen is frozen). In this state ssh'ing into the machine is still pos=
sible
> > and
> > at least sometimes log messages about hung tasks appear in
> > /var/log/kern.log.
> >
> > More info can be found here:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/2994
> >
> > Using the method described to trigger the bug I bisected the problem i=
n the
> > linux-next and drm-misc trees to give commit f3123c2590005 as the prob=
lem.
> > As this simple patch fixes the problem
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 044a8c4875ba..25b97db1b623 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
> > =C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched=
_entity *entity)
> > =C2=A0{
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_entity_is_ready(en=
tity))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched, entity))
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_=
run_job_queue(sched);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (drm_sched_can_queue(sched, e=
ntity))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 drm_sched_run_job_queue(sched);
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
> >
> > there might be in the entity->dependency branch of drm_sched_entity_is=
_ready
> > (some kind of circular dependencies ...).
> >
> > To see if the change to drm_sched_wakeup is the actual cause of the pr=
oblem
> > or
> > if this problem has been cause by the redesign of the drm scheduler in=
 linux
> > next-20231115+, I created the following patch for linux-6.6.0:
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index a42763e1429d..dc2abd299aeb 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -358,7 +358,7 @@ static void drm_sched_entity_wakeup(struct dma_fen=
ce *f,
> > =C2=A0container_of(cb, struct drm_sched_entity, cb);
> >
> > =C2=A0drm_sched_entity_clear_dep(f, cb);
> > - drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > + drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
> > =C2=A0}
> >
> > =C2=A0/**
> > @@ -590,7 +590,7 @@ void drm_sched_entity_push_job(struct drm_sched_jo=
b
> > *sched_job)
> > =C2=A0if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > =C2=A0drm_sched_rq_update_fifo(entity, submit_ts);
> >
> > - drm_sched_wakeup_if_can_queue(entity->rq->sched);
> > + drm_sched_wakeup_if_can_queue(entity->rq->sched, entity);
> > =C2=A0}
> > =C2=A0}
> > =C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 5a3a622fc672..bbe06403b33d 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -865,10 +865,11 @@ static bool drm_sched_can_queue(struct
> > drm_gpu_scheduler
> > *sched)
> > =C2=A0 *
> > =C2=A0 * Wake up the scheduler if we can queue jobs.
> > =C2=A0 */
> > -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
> > +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, s=
truct
> > drm_sched_entity *entity)
> > =C2=A0{
> > - if (drm_sched_can_queue(sched))
> > - wake_up_interruptible(&sched->wake_up_worker);
> > + if(drm_sched_entity_is_ready(entity))
> > + if (drm_sched_can_queue(sched))
> > + wake_up_interruptible(&sched->wake_up_worker);
> > =C2=A0}
> >
> > =C2=A0/**
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index ac65f0626cfc..6cfe3d193e69 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -548,7 +548,7 @@ void drm_sched_entity_modify_sched(struct
> > drm_sched_entity
> > *entity,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsi=
gned int num_sched_list);
> >
> > =C2=A0void drm_sched_job_cleanup(struct drm_sched_job *job);
> > -void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
> > +void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched, s=
truct
> > drm_sched_entity *entity);
> > =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_=
sched_job
> > *bad);
> > =C2=A0void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_=
recovery);
> > =C2=A0void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> >
> > This brings the extra check to the old scheduler and has so far not ca=
used
> > any
> > trouble (using the same stress test described above), so chances are t=
hat
> > the
> > error is somewhere else in redesigned scheduler.
> >
> >
> > Bert Karwatzki
>
> Hi Bert,
>
> Thanks for looking into this.
>
> As an afterthought, removing the "entity_is_ready()" qualifier in wake-u=
p,
> makes
> the scheduling more opportunistic, and I agree that that is the more cor=
rect
> approach.
> Commit f3123c2590005, basically made the code as close to the way it
> functioned before
> the move to run-queues.
>
> Would you like to create a patch for this?

Should I create the patch (is a simple revert of f3123c.. + explaining com=
mit
message enough?) for the drm-misc tree?

Also, I did a little more experimentation: I applied f3123c25900 on top
of=C2=A0commit a6149f0393699 and commit 35963cf2cd25e to see where the pro=
blems
start. The result is that f3.. + a6.. leads to lock ups while f3.. + 35.. =
seems
to be fine so the problems starts with the move from kthread to work queue=
.

Bert Karwatzki
