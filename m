Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D9399DF23
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 09:12:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D93510E513;
	Tue, 15 Oct 2024 07:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NzPyJiCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB00D10E513
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728976322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckLNPMuUCK2EJNKQO6rkUKqNz13gZab1l6sB+87VGvg=;
 b=NzPyJiCvSNh4+GzuiDTtfuJZ+DQW0fuPixplkjnqjgh+E84yuhcwz3ocTXlDhpBld8/O2/
 V7EddLWYX84+I7QMO81FUS8dIFI4MDCb/bOi9i5aM1/LD+P8p9B96UVLSUnGkKuQLWWLcg
 wd5Iuf/6r0FekznPF3OSqcfkV/QuV3I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-dRdPUo00O865IUwtQJV2Mw-1; Tue, 15 Oct 2024 03:12:00 -0400
X-MC-Unique: dRdPUo00O865IUwtQJV2Mw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-37d5ca5bfc8so1682788f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 00:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728976319; x=1729581119;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ckLNPMuUCK2EJNKQO6rkUKqNz13gZab1l6sB+87VGvg=;
 b=kGLXACm6i0c2XAtz3ZudtkaDhOcQvM/JfYK+IqDdzfX1LvDM/QBgcnjEk8qThp7P0N
 MJ+PqhTwT6OiR4hpoGwB0H7YRLsIkFBR7Ov+CFcnda3sqzRxUQW7I2mjgZ6qVKKc967/
 WX1+s2yf7MMhnTOfPGZMqUJ5Wk4wNAGz6P3aT6s3RSYIxjBQzzDhKOe/LB48/ryHXqMo
 tjz4wtGA4uSrPLWhYj49F7s3X/sblF7XGW+2L+kwfmI0AYjv4spnw4ZYkF0i9M5oWdM/
 QzsKCiRp92fyy6n0B150LPT0XwXvpYRMDdmaRfHO0tlGPHijSpipoCw+yVuwyZw9qZDs
 iUYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGS6VkMGwaJHcitwojYRwP0/y5TjJjMGzjMnjgGrqR81Jj4MABk1SD5tNsDemVyD88/Rn48zLB5Ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq6Ksp9+4kdtYjCQaWhbEnIUGmCkdbtwIe1Rhp54mtcJrZvjFl
 KGnqPjRJc0MisKjxOm8cmw7vC1BBfHiAY8wiVm1JckA2rPPF5Ix/4Q+Kbf7Tzl4go2UutISz7tb
 tJTLBsziIw9UMIEikgRgxR0sQPCsH1MUlY6HS1m66uv6aBXQxn/Ww8bT48uvxFuPGOg==
X-Received: by 2002:adf:e44c:0:b0:37d:4f1b:361 with SMTP id
 ffacd0b85a97d-37d551fabc4mr8049508f8f.25.1728976319221; 
 Tue, 15 Oct 2024 00:11:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhBM5cIKUJEg5HmVaiOwS9Q3JUbGlHaYkoVBlCTFnj0y6oWM/IA36aOCHRGIgIypVCuQlMvg==
X-Received: by 2002:adf:e44c:0:b0:37d:4f1b:361 with SMTP id
 ffacd0b85a97d-37d551fabc4mr8049491f8f.25.1728976318759; 
 Tue, 15 Oct 2024 00:11:58 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fa87c44sm789295f8f.33.2024.10.15.00.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 00:11:58 -0700 (PDT)
Message-ID: <587ac0260e9c843ccd0e7d449fc6b6c9270ec741.camel@redhat.com>
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Luben
 Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
Date: Tue, 15 Oct 2024 09:11:56 +0200
In-Reply-To: <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
 <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
 <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2024-10-14 at 13:07 +0100, Tvrtko Ursulin wrote:
>=20
> On 14/10/2024 12:32, Philipp Stanner wrote:
> > Hi,
> >=20
> > On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > >=20
> > > In FIFO mode We can avoid dropping the lock only to immediately
> > > re-
> > > acquire
> > > by adding a new drm_sched_rq_update_fifo_locked() helper.
> > >=20
> >=20
> > Please write detailed commit messages, as described here [1].
> > =C2=A0=C2=A0=C2=A0 1. Describe the problem: current state and why it's =
bad.
> > =C2=A0=C2=A0=C2=A0 2. Then, describe in imperative (present tense) form=
 what the
> > commit
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 does about the problem.
>=20
> Both pieces of info are already there:
>=20
> 1. Drops the lock to immediately re-acquire it.
> 2. We avoid that by by adding a locked helper.
> > Optionally, in between can be information about why it's solved
> > this
> > way and not another etc.
> >=20
> > Applies to the other patches, too.
> >=20
> >=20
> > [1]
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
describe-your-changes
>=20
> Thanks I am new here and did not know this.
>=20
> Seriosuly, lets not be too blindly strict about this because it can
> get=20
> IMO ridiculous.
>=20
> One example when I previously accomodated your request is patch 3/5
> from=20
> this series:
>=20
> """
> Current kerneldoc for struct drm_sched_rq incompletely documents what
> fields are protected by the lock.
>=20
> This is not good because it is misleading.
>=20
> Lets fix it by listing all the elements which are protected by the
> lock.
> """
>=20
> While this was the original commit text you weren't happy with:
>=20
> """
> drm/sched: Re-order struct drm_sched_rq members for clarity
>=20
> Lets re-order the members to make it clear which are protected by the
> lock
> and at the same time document it via kerneldoc.
> """
>=20
> I maintain the original text was passable.
>=20
> On top, this was just a respin to accomodate the merge process. All=20
> approvals were done and dusted couple weeks or so ago so asking for
> yet=20
> another respin for such trivial objections is not great.

I understand that you're unhappy, but please understand the position
I'm coming from. As you know, since you sent these patches within a
different series (and, thus, since I reviewed them), I was trusted with
co-maintaining this piece of shared infrastructure.

And since you've worked on it a bit now, I suppose you also know that
the GPU Scheduler is arguably in quite a bad shape, has far too little
documentation, has leaks, maybe race conditions, parts *where the
locking rules are unclear* and is probably only fully understood by a
small hand full of people. I also argue that this is a *very*
complicated piece of software.

So I might be or appear to be a bit pedantic, but I'm not doing that to
terrorize you, but because I want this thing to become well documented,
understandable, and bisectable. Working towards a canonical, idiot-
proof commit style is one measure that will help with that.

I want to offer you the following: I can be more relaxed with things
universally recognized as trivial (comment changes, struct member
reordering) =E2=80=93 but when something like a lock is touched in any way,=
 we
shall document that in the commit message as canonically as possible,
so someone who's less experienced and just bisected the commit
immediately understands what has been done (or rather: was supposed to
be done).

Greetings
P.



>=20
> Regards,
>=20
> Tvrtko
>=20
> > > v2:
> > > =C2=A0=C2=A0* Remove drm_sched_rq_update_fifo() altogether. (Christia=
n)
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++--=
--
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=
=A0 6 +++---
> > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0=C2=A03 files changed, 13 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > > b/drivers/gpu/drm/scheduler/sched_entity.c
> > > index 2951fcc2e6b1..b72cba292839 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > @@ -514,8 +514,12 @@ struct drm_sched_job
> > > *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
> > > =C2=A0=C2=A0 struct drm_sched_job *next;
> > > =C2=A0=20
> > > =C2=A0=C2=A0 next =3D to_drm_sched_job(spsc_queue_peek(&entity->job_q=
ueue));
> > > - if (next)
> > > - drm_sched_rq_update_fifo(entity, next->submit_ts);
> > > + if (next) {
> > > + spin_lock(&entity->rq_lock);
> > > + drm_sched_rq_update_fifo_locked(entity,
> > > + next->submit_ts);
> > > + spin_unlock(&entity->rq_lock);
> > > + }
> > > =C2=A0=C2=A0 }
> > > =C2=A0=20
> > > =C2=A0=C2=A0 /* Jobs and entities might have different lifecycles. Si=
nce
> > > we're
> > > @@ -613,10 +617,11 @@ void drm_sched_entity_push_job(struct
> > > drm_sched_job *sched_job)
> > > =C2=A0=C2=A0 sched =3D rq->sched;
> > > =C2=A0=20
> > > =C2=A0=C2=A0 drm_sched_rq_add_entity(rq, entity);
> > > - spin_unlock(&entity->rq_lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0 if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> > > - drm_sched_rq_update_fifo(entity, submit_ts);
> > > + drm_sched_rq_update_fifo_locked(entity, submit_ts);
> > > +
> > > + spin_unlock(&entity->rq_lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0 drm_sched_wakeup(sched);
> > > =C2=A0=C2=A0 }
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index e32b0f7d7e94..bbd1630407e4 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -169,14 +169,15 @@ static inline void
> > > drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
> > > =C2=A0=C2=A0 }
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> > > ktime_t ts)
> > > +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > > *entity, ktime_t ts)
> >=20
> > Since you touch function name / signature already, would you mind
> > writing a small doc string that also mentions the locking
> > requirements
> > or lack of the same?
> >=20
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0 /*
> > > =C2=A0=C2=A0 * Both locks need to be grabbed, one to protect from ent=
ity-
> > > >rq
> > > change
> > > =C2=A0=C2=A0 * for entity from within concurrent drm_sched_entity_sel=
ect_rq
> > > and
> > > the
> > > =C2=A0=C2=A0 * other to update the rb tree structure.
> > > =C2=A0=C2=A0 */
> >=20
> > It seems to me that the comment above is now out of date, no?
> >=20
> >=20
> > Thx for your efforts,
> > P.
> >=20
> > > - spin_lock(&entity->rq_lock);
> > > + lockdep_assert_held(&entity->rq_lock);
> > > +
> > > =C2=A0=C2=A0 spin_lock(&entity->rq->lock);
> > > =C2=A0=20
> > > =C2=A0=C2=A0 drm_sched_rq_remove_fifo_locked(entity);
> > > @@ -187,7 +188,6 @@ void drm_sched_rq_update_fifo(struct
> > > drm_sched_entity *entity, ktime_t ts)
> > > =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_entity_compare_=
before);
> > > =C2=A0=20
> > > =C2=A0=C2=A0 spin_unlock(&entity->rq->lock);
> > > - spin_unlock(&entity->rq_lock);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index e9f075f51db3..3658a6cb048e 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -593,7 +593,7 @@ void drm_sched_rq_add_entity(struct
> > > drm_sched_rq
> > > *rq,
> > > =C2=A0=C2=A0void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> > > =C2=A0=C2=A0 struct drm_sched_entity *entity);
> > > =C2=A0=20
> > > -void drm_sched_rq_update_fifo(struct drm_sched_entity *entity,
> > > ktime_t ts);
> > > +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
> > > *entity, ktime_t ts);
> > > =C2=A0=20
> > > =C2=A0=C2=A0int drm_sched_entity_init(struct drm_sched_entity *entity=
,
> > > =C2=A0=C2=A0 =C2=A0 enum drm_sched_priority priority,
> >=20
>=20

