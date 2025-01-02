Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 919C49FF9B3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 14:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAAF10E24F;
	Thu,  2 Jan 2025 13:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X39+Mj6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1AF10E24F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735823483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YltHdIy9gcB5XKI4JktxGoNRQsZ1+DIiuCU0Wd2laH4=;
 b=X39+Mj6TnDyaQVdpgeRD4Tu5Q4tWWD2UxSygkAep/VQzAtdKXzPlAiUBIXn48zXy3cPGfw
 zuIwZgefDKH49CfgC6zgui1/3qaQ1xi3LrDbruKayEamKrFKMvx8rAu0eY8YByixutbjf6
 tw5X83fio+M3TzdwiPlCkjUi3gJYHD0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-t9ozPNE0OX-OOE0VX1KRqA-1; Thu, 02 Jan 2025 08:11:21 -0500
X-MC-Unique: t9ozPNE0OX-OOE0VX1KRqA-1
X-Mimecast-MFC-AGG-ID: t9ozPNE0OX-OOE0VX1KRqA
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so25883435e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 05:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735823480; x=1736428280;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p8anlJkrponu5ZTrt3fIGRaIMtBUU7U1N8cON9ykIf4=;
 b=l9CFdLvcIFvq2AliIzOEQa2wzWGIDKt6gem2AoCUpvpq67esbDwgEue1wyXv1VN+vv
 T7mebbqtaj4LE6U8lkxUwL6NEomEMyzDAV5JWeUorqJ9Y/wiMIZMgnNf0SgCoSFHzDVT
 8BaN+tVVGDYWGzRO0+HWYo5jOlZqscpXX4uGrGqY0vM0SxqxWFNSZDhlBPEfHWO9RoQL
 X2YikwDBGGmEC+ce1ca95AOIlCthoXXXJdPWWggH4vRn5Do62ZpaY4XiB+hy7TVuB2qn
 nrv91YBB/wg/xDrJiB+xEPaKP5oxMI232k0mel1KJ8W8GxsSyX3qG6zMFtUvKq1V3NWn
 MtYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrLq2AG3dABzJhqQxZzdIx/ghir1kwMjMeNSZcdLlREmtNIcfk9Vw2G6bM7ZWNa7fOVBDJsDWDIOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCvTgTZ2t8U2j57266i21EUS3bKYrya85a1hbIxKIhK54lM7gD
 iU8U3AFrMWCvdlo8US92IPjcmpOfS3HHm8b7V2eeyrkJGtKTz2Rg8HqDLslBIAiqJsNAcPbSUJm
 1YTsZh0tIF+SueDATX1aHLL4murFR+TzvV/hGZbK1cduQfytC7RlpIg5sbD1EaRirgA==
X-Gm-Gg: ASbGnctPMGWzO2bBnJCXvXU8a3YX9gG1brT/+ozl6D/Vn6gKbcxPVpxNfthoCyCLYM4
 UY6P5MdFU3wO9vhX7e77br2sVA6vVBXIRAFgqtWJdp37RphPuO37pPX/70/oAblR0rXilvnIvfb
 ALtY++KpL07SnFin5B0WNvL6paoO3GXz/eqobZo5T6FIj1nwQ/kVcFwCVbqJkjABwHLu9UnYapY
 POXS4ygQyAYYIL5VI+YysOBXrdyuQGpjHAyqQPNUjMm5/HKXtJfgQeQmKlk2rep3yOoTUbXvmbC
 OYCO23Y=
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id
 5b1f17b1804b1-43668b783d0mr361650835e9.29.1735823480492; 
 Thu, 02 Jan 2025 05:11:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0Ti4snKdBM2ZXepcFXxzBEBidjv7wCyF51HVD1LiBR2+XI1FTktw4coB5QRsELl/bHTifyQ==
X-Received: by 2002:a05:600c:4510:b0:436:5fc9:30ba with SMTP id
 5b1f17b1804b1-43668b783d0mr361650615e9.29.1735823480117; 
 Thu, 02 Jan 2025 05:11:20 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828a8dsm38402003f8f.2.2025.01.02.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 05:11:19 -0800 (PST)
Message-ID: <2bab43a317a2049fc81993f694de9c0b8fae9700.camel@redhat.com>
Subject: Re: [RFC 08/14] drm/sched: Add deadline policy
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
Date: Thu, 02 Jan 2025 14:11:18 +0100
In-Reply-To: <20241230165259.95855-9-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-9-tursulin@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q2v6_uiobAxH1_dCpPLqS3NXfeMZjfg2iQa8pIVsCTA_1735823481
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

On Mon, 2024-12-30 at 16:52 +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Deadline scheduling policy should be a fairer flavour of FIFO with
> two
> main advantages being that it can naturally connect with the dma-
> fence
> deadlines, and secondly that it can get away with multiple run queues
> per
> scheduler.
>=20
> From the latter comes the fairness advantage. Where the current FIFO
> policy will always starve low priority entities by normal, and normal
> by high etc, deadline tracks all runnable entities in a single run
> queue
> and assigns them deadlines based on priority. Instead of being
> ordered
> strictly by priority, jobs and entities become ordered by deadlines.
>=20
> This means that a later higher priority submission can still overtake
> an
> earlier lower priority one, but eventually the lower priority will
> get its
> turn even if high priority is constantly feeding new work.

So, as you're aware of, this is a major change in behavior. FIFO's
purpose actually is to be unfair, and my understanding has always been
that it is on purpose that the higher priority will with absolute
certainty take precedence.

Reason being that on the high priority things like configuring memory /
mappings are done, which you want to be prioritized.

IOW in which scenario would you want the low priorities to be able to
overtake the higher ones?

@Danilo, @Christian?


>=20
> Current mapping of priority to deadlines is somewhat arbitrary and
> looks
> like this (submit timestamp plus constant offset in micro-seconds):
>=20
> =09static const unsigned int d_us[] =3D {
> =09=09[DRM_SCHED_PRIORITY_KERNEL] =3D=C2=A0=C2=A0=C2=A0 100,
> =09=09[DRM_SCHED_PRIORITY_HIGH]=C2=A0=C2=A0 =3D=C2=A0=C2=A0 1000,
> =09=09[DRM_SCHED_PRIORITY_NORMAL] =3D=C2=A0=C2=A0 5000,
> =09=09[DRM_SCHED_PRIORITY_LOW]=C2=A0=C2=A0=C2=A0 =3D 100000,
> =09};
>=20
> Assuming simultaneous submission of one normal and one low prioriy
> job at
> a time of "t", they will get respective deadlines of t+5ms and
> t+100ms.
> Hence normal will run first and low will run after it, or at the
> latest
> 100ms after it was submitted in case other higher priority
> submissions
> overtake it in the meantime.
>=20
> Because deadline policy does not need run queues, if the FIFO and RR
> polices are later removed, that would allow for a significant
> simplification of the code base by reducing the 1:N to 1:1 scheduler
> to run queue relationship.

So the proposed upsides for the rework are that a) code can arguably be
simplified and that b) deadline is fairer than FIFO.

Focusing on b) right now: Have you seen it in the wild that high
priorities starve lower ones? Is that a problem already?

I assume you have been working on that for a reason =E2=80=93 do you have a
usecase in amdgpu or similar where the deadline policy improves things
in a way?

P.

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 53 +++++++++++++++++++--=
-
> --
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 14 ++++---
> =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 5 ++-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 ++++-
> =C2=A04 files changed, 64 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 608bc43ff256..6928ec19ec23 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -71,6 +71,8 @@ int drm_sched_entity_init(struct drm_sched_entity
> *entity,
> =C2=A0=09entity->guilty =3D guilty;
> =C2=A0=09entity->num_sched_list =3D num_sched_list;
> =C2=A0=09entity->priority =3D priority;
> +=09entity->rq_priority =3D drm_sched_policy =3D=3D
> DRM_SCHED_POLICY_DEADLINE ?
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_KERNEL : prio=
rity;
> =C2=A0=09/*
> =C2=A0=09 * It's perfectly valid to initialize an entity without
> having a valid
> =C2=A0=09 * scheduler attached. It's just not valid to use the
> scheduler before it
> @@ -87,17 +89,23 @@ int drm_sched_entity_init(struct drm_sched_entity
> *entity,
> =C2=A0=09=09 */
> =C2=A0=09=09pr_warn("%s: called with uninitialized scheduler\n",
> __func__);
> =C2=A0=09} else if (num_sched_list) {
> -=09=09/* The "priority" of an entity cannot exceed the
> number of run-queues of a
> -=09=09 * scheduler. Protect against num_rqs being 0, by
> converting to signed. Choose
> -=09=09 * the lowest priority available.
> +=09=09enum drm_sched_priority p =3D entity->priority;
> +
> +=09=09/*
> +=09=09 * The "priority" of an entity cannot exceed the
> number of
> +=09=09 * run-queues of a scheduler. Protect against
> num_rqs being 0,
> +=09=09 * by converting to signed. Choose the lowest
> priority
> +=09=09 * available.
> =C2=A0=09=09 */
> -=09=09if (entity->priority >=3D sched_list[0]->num_rqs) {
> -=09=09=09drm_err(sched_list[0], "entity with out-of-
> bounds priority:%u num_rqs:%u\n",
> -=09=09=09=09entity->priority, sched_list[0]-
> >num_rqs);
> -=09=09=09entity->priority =3D max_t(s32, (s32)
> sched_list[0]->num_rqs - 1,
> -=09=09=09=09=09=09 (s32)
> DRM_SCHED_PRIORITY_KERNEL);
> +=09=09if (p >=3D sched_list[0]->num_user_rqs) {
> +=09=09=09drm_err(sched_list[0], "entity with out-of-
> bounds priority:%u num_user_rqs:%u\n",
> +=09=09=09=09p, sched_list[0]->num_user_rqs);
> +=09=09=09p =3D max_t(s32,
> +=09=09=09=09 (s32)sched_list[0]->num_user_rqs -
> 1,
> +=09=09=09=09 (s32)DRM_SCHED_PRIORITY_KERNEL);
> +=09=09=09entity->priority =3D p;
> =C2=A0=09=09}
> -=09=09entity->rq =3D sched_list[0]->sched_rq[entity-
> >priority];
> +=09=09entity->rq =3D sched_list[0]->sched_rq[entity-
> >rq_priority];
> =C2=A0=09}
> =C2=A0
> =C2=A0=09init_completion(&entity->entity_idle);
> @@ -377,6 +385,27 @@ void drm_sched_entity_set_priority(struct
> drm_sched_entity *entity,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_set_priority);
> =C2=A0
> +static ktime_t
> +__drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0 ktime_t submit_ts)
> +{
> +=09static const unsigned int d_us[] =3D {
> +=09=09[DRM_SCHED_PRIORITY_KERNEL] =3D=C2=A0=C2=A0=C2=A0 100,
> +=09=09[DRM_SCHED_PRIORITY_HIGH]=C2=A0=C2=A0 =3D=C2=A0=C2=A0 1000,
> +=09=09[DRM_SCHED_PRIORITY_NORMAL] =3D=C2=A0=C2=A0 5000,
> +=09=09[DRM_SCHED_PRIORITY_LOW]=C2=A0=C2=A0=C2=A0 =3D 100000,
> +=09};
> +
> +=09return ktime_add_us(submit_ts, d_us[entity->priority]);
> +}
> +
> +ktime_t
> +drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
> +=09=09=09=09=C2=A0 struct drm_sched_job *job)
> +{
> +=09return __drm_sched_entity_get_job_deadline(entity, job-
> >submit_ts);
> +}
> +
> =C2=A0/*
> =C2=A0 * drm_sched_entity_wakeup - callback to clear the entity's
> dependency and
> =C2=A0 * wake up the scheduler
> @@ -503,7 +532,7 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0
> =C2=A0=09spin_lock(&entity->lock);
> =C2=A0=09sched =3D drm_sched_pick_best(entity->sched_list, entity-
> >num_sched_list);
> -=09rq =3D sched ? sched->sched_rq[entity->priority] : NULL;
> +=09rq =3D sched ? sched->sched_rq[entity->rq_priority] : NULL;
> =C2=A0=09if (rq !=3D entity->rq) {
> =C2=A0=09=09drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0=09=09entity->rq =3D rq;
> @@ -547,6 +576,10 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0=09if (first) {
> =C2=A0=09=09struct drm_gpu_scheduler *sched;
> =C2=A0
> +=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_DEADLINE)
> +=09=09=09submit_ts =3D
> __drm_sched_entity_get_job_deadline(entity,
> +=09=09=09=09=09=09=09=09
> =09submit_ts);
> +
> =C2=A0=09=09sched =3D drm_sched_rq_add_entity(entity->rq, entity,
> submit_ts);
> =C2=A0=09=09if (sched)
> =C2=A0=09=09=09drm_sched_wakeup(sched);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ba9b0274b185..433bef85eeaf 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -87,13 +87,13 @@ static struct lockdep_map drm_sched_lockdep_map =3D
> {
> =C2=A0};
> =C2=A0#endif
> =C2=A0
> -int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> +int drm_sched_policy =3D DRM_SCHED_POLICY_DEADLINE;
> =C2=A0
> =C2=A0/**
> =C2=A0 * DOC: sched_policy (int)
> =C2=A0 * Used to override default entities scheduling policy in a run
> queue.
> =C2=A0 */
> -MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for
> entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round
> Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO (default).");
> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for
> entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " =3D Round
> Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " =3D FIFO, "
> __stringify(DRM_SCHED_POLICY_DEADLINE) " =3D Virtual deadline
> (default).");
> =C2=A0module_param_named(sched_policy, drm_sched_policy, int, 0444);
> =C2=A0
> =C2=A0static u32 drm_sched_available_credits(struct drm_gpu_scheduler
> *sched)
> @@ -1109,11 +1109,15 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0=09=09sched->own_submit_wq =3D true;
> =C2=A0=09}
> =C2=A0
> -=09sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched-
> >sched_rq),
> +=09sched->num_user_rqs =3D num_rqs;
> +=09sched->num_rqs =3D drm_sched_policy !=3D
> DRM_SCHED_POLICY_DEADLINE ?
> +=09=09=09 num_rqs : 1;
> +=09sched->sched_rq =3D kmalloc_array(sched->num_rqs,
> +=09=09=09=09=09sizeof(*sched->sched_rq),
> =C2=A0=09=09=09=09=09GFP_KERNEL | __GFP_ZERO);
> =C2=A0=09if (!sched->sched_rq)
> =C2=A0=09=09goto Out_check_own;
> -=09sched->num_rqs =3D num_rqs;
> +
> =C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++)
> {
> =C2=A0=09=09sched->sched_rq[i] =3D kzalloc(sizeof(*sched-
> >sched_rq[i]), GFP_KERNEL);
> =C2=A0=09=09if (!sched->sched_rq[i])
> @@ -1227,7 +1231,7 @@ void drm_sched_increase_karma(struct
> drm_sched_job *bad)
> =C2=A0=09if (bad->s_priority !=3D DRM_SCHED_PRIORITY_KERNEL) {
> =C2=A0=09=09atomic_inc(&bad->karma);
> =C2=A0
> -=09=09for (i =3D DRM_SCHED_PRIORITY_HIGH; i < sched-
> >num_rqs; i++) {
> +=09=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched-
> >num_rqs; i++) {
> =C2=A0=09=09=09struct drm_sched_rq *rq =3D sched-
> >sched_rq[i];
> =C2=A0
> =C2=A0=09=09=09spin_lock(&rq->lock);
> diff --git a/drivers/gpu/drm/scheduler/sched_rq.c
> b/drivers/gpu/drm/scheduler/sched_rq.c
> index 5b31e5434d12..a6bb21250350 100644
> --- a/drivers/gpu/drm/scheduler/sched_rq.c
> +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> @@ -152,7 +152,10 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq
> *rq,
> =C2=A0=09if (next_job) {
> =C2=A0=09=09ktime_t ts;
> =C2=A0
> -=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> +=09=09if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_DEADLINE)
> +=09=09=09ts =3D
> drm_sched_entity_get_job_deadline(entity,
> +=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> next_job);
> +=09=09else if (drm_sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> =C2=A0=09=09=09ts =3D next_job->submit_ts;
> =C2=A0=09=09else
> =C2=A0=09=09=09ts =3D drm_sched_rq_get_rr_deadline(rq);
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 6fee85e45d45..7532071fbea8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -74,8 +74,9 @@ enum drm_sched_priority {
> =C2=A0/* Used to choose between FIFO and RR job-scheduling */
> =C2=A0extern int drm_sched_policy;
> =C2=A0
> -#define DRM_SCHED_POLICY_RR=C2=A0=C2=A0=C2=A0 0
> -#define DRM_SCHED_POLICY_FIFO=C2=A0 1
> +#define DRM_SCHED_POLICY_RR=09=C2=A0 0
> +#define DRM_SCHED_POLICY_FIFO=09=C2=A0 1
> +#define DRM_SCHED_POLICY_DEADLINE 2
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct drm_sched_entity - A wrapper around a job queue (typicall=
y
> @@ -153,6 +154,8 @@ struct drm_sched_entity {
> =C2=A0=09 */
> =C2=A0=09struct spsc_queue=09=09job_queue;
> =C2=A0
> +=09enum drm_sched_priority=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rq_priority;
> +
> =C2=A0=09/**
> =C2=A0=09 * @fence_seq:
> =C2=A0=09 *
> @@ -522,6 +525,7 @@ struct drm_gpu_scheduler {
> =C2=A0=09long=09=09=09=09timeout;
> =C2=A0=09const char=09=09=09*name;
> =C2=A0=09u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_rqs;
> +=09u32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_user_rqs;
> =C2=A0=09struct drm_sched_rq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 **sched_rq;
> =C2=A0=09wait_queue_head_t=09=09job_scheduled;
> =C2=A0=09atomic64_t=09=09=09job_id_count;
> @@ -623,6 +627,8 @@ void drm_sched_entity_set_priority(struct
> drm_sched_entity *entity,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 enum drm_sched_priority
> priority);
> =C2=A0bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> =C2=A0int drm_sched_entity_error(struct drm_sched_entity *entity);
> +ktime_t drm_sched_entity_get_job_deadline(struct drm_sched_entity
> *entity,
> +=09=09=09=09=09=C2=A0 struct drm_sched_job
> *job);
> =C2=A0
> =C2=A0struct drm_sched_fence *drm_sched_fence_alloc(
> =C2=A0=09struct drm_sched_entity *s_entity, void *owner);

