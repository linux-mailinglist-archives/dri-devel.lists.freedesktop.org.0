Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 982DDCAD530
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 14:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF03E10E3F8;
	Mon,  8 Dec 2025 13:44:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hR3HVuEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CC910E3F8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 13:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765201480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9liAUxTZcYAvrXRnAoojNcLHa78VR2fm4Rt4/fDPnGw=;
 b=hR3HVuEVNMaq7bLszMXTRQwJO6FHHi+O31JYjtBvpeJvQlgZwi833DhcmzQ40P3mTHsrbG
 0Vc+k8BdR+b3Crb6rX/y90z3Vi16fx4BRh2KiCCHY/fDCzmM9/dpGIQSRW1uY5eCj9ekZS
 NXMkM6RNuijo8yTn/ytzhkDZD61ZjVM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-NWB2jXqGNfmonauMuoUJhg-1; Mon, 08 Dec 2025 08:44:39 -0500
X-MC-Unique: NWB2jXqGNfmonauMuoUJhg-1
X-Mimecast-MFC-AGG-ID: NWB2jXqGNfmonauMuoUJhg_1765201478
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso40094115e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 05:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765201478; x=1765806278;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5UTdihlCxrJ/v+55wome2ohhqUb+LoZs5AAOQUD/qKo=;
 b=VD+Hni+YV76ZLG4Ueb78cO14zXmj0g4z8zsSkEY21ETIiVxagBnlmi4Wlngf2xxMyD
 jToAcl4vHs+5MErHBORIy0A1SOvEd2teMTLlvBO4g8Vjv9LSHJFAIZHxzgMdF8E6ajBO
 Kx1DbPubRh2186sgH03F1ADDfcZeOrZoc8q3UOKIVTFEt3LA9T9UnYqx57GHDlohT7Qq
 20qyPm7D0BmxHv6WWNGS6d9koA5j4xLT5mG+7OSqpvVprZbS2W3MdCIrzHRHHn8eAskx
 l0VmWxkGh6L83McHQG7pWESIrDxZFRzNqMrn7OqSY+jPmbF5AasSdy/lItDqFLs0Jobc
 ybQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjZYosngUPtFB/XbTwyPncFGR6nT/Rft8KJ/350vCoTSEzY7ynJEHxnskm9YAyEFWa4mhQ47IvWho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRbnGOdCZLL11hrK8T1z58WAqzQhh2JNXW9Adx9IHmrG+oG8pU
 RFQ/0mQ5iGM76ZYsTkU1x5p7Q+060YzLGoGelVQD9UcG+yYXMrBwiz6FX/JvRFEP+Kdp/NIy/ex
 +kB/Xbc1prCD2NWlgzKIOpWuxYQ5NbreK/r0zogjO0+kEQW4d/U2EqouD/hkuWVEJhOkjfw==
X-Gm-Gg: ASbGncsrCbQ+tj4kx4e9+nlQeo/LBiMPEDKAZ5oue0jhevtz8bYQJzOCRinXzFV/3zV
 K4KpmroyNmwxrDUir6e8w1snJAS4EpudElvqArAYcH4XSR2ckv8I+Z+0x2wsdfVi5ThoJ7kawJm
 A7afjcZEAeLdzl3V+98c9yGs3uQCGm6AFf2OoVo3DO3LOv0KWaBtPTR1DY4b5krdFVuc5jfom1z
 QI7WYomExtWL4WzMpzJZyndGzi46Di4QvKwwxHD9DRrAA258hKssEmr/kkuVZVRZUwVztjRKvzp
 rhcHXuE0hYUz5q5CZo8slTtK4fS54Vnca/bvChsNG1gmo0FL63MzotNUMdGQExw3GbOQMN816+W
 JwCjMUL9V5kMS6Gx2rQEQoDe5MsRW1qXcfuunk/O8Sbclh/h90BBhjANJ
X-Received: by 2002:a05:6000:2884:b0:42f:8816:9507 with SMTP id
 ffacd0b85a97d-42f89f58eafmr7378615f8f.63.1765201478020; 
 Mon, 08 Dec 2025 05:44:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNzXbr4QNksX/vYqCU437IdQLPh06CcRiT/YI/X+e97BT+9Vv2o5JanLDz3A0M6c0SEnZZ1A==
X-Received: by 2002:a05:6000:2884:b0:42f:8816:9507 with SMTP id
 ffacd0b85a97d-42f89f58eafmr7378590f8f.63.1765201477560; 
 Mon, 08 Dec 2025 05:44:37 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d03:eb00:dc87:649d:b5b:d46f?
 ([2001:16b8:3d03:eb00:dc87:649d:b5b:d46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353c9esm24868688f8f.40.2025.12.08.05.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 05:44:37 -0800 (PST)
Message-ID: <f3f4306f6dd0286505bada7746c78e14f716f7c1.camel@redhat.com>
Subject: Re: [PATCH v7 4/9] drm/xe: Stop abusing DRM scheduler internals
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 dakr@kernel.org, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Mon, 08 Dec 2025 14:44:36 +0100
In-Reply-To: <aTChOcJb1dTaD+e2@lstrano-desk.jf.intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-5-matthew.brost@intel.com>
 <9bd6778fc3d22bad2b2f8adc6bb165134ef919e5.camel@redhat.com>
 <aTChOcJb1dTaD+e2@lstrano-desk.jf.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uGsGd6kj4PwNbxucERTXSc0WkUs5iXRBPWdS-xj9Op0_1765201478
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

On Wed, 2025-12-03 at 12:44 -0800, Matthew Brost wrote:
> On Wed, Dec 03, 2025 at 11:56:01AM +0100, Philipp Stanner wrote:
> > On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> > > Use new pending job list iterator and new helper functions in Xe to
> > > avoid reaching into DRM scheduler internals.
> > >=20

[=E2=80=A6]

> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@int=
el.com>
> > > ---
> > > =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 4 +-
> > > =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.h=C2=A0=C2=A0=C2=A0 | 33 ++=
--------
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 81 ++++++------------------
> > > =C2=A0drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 16 -----
> > > =C2=A0drivers/gpu/drm/xe/xe_hw_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 -
> > > =C2=A06 files changed, 27 insertions(+), 120 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/=
xe/xe_gpu_scheduler.c
> > > index f4f23317191f..9c8004d5dd91 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > @@ -7,7 +7,7 @@
> > > =C2=A0
> > > =C2=A0static void xe_sched_process_msg_queue(struct xe_gpu_scheduler =
*sched)
> > > =C2=A0{
> > > -=09if (!READ_ONCE(sched->base.pause_submit))
> > > +=09if (!drm_sched_is_stopped(&sched->base))
> > > =C2=A0=09=09queue_work(sched->base.submit_wq, &sched->work_process_ms=
g);
> >=20
> > Sharing the submit_wq is legal. But next-level cleanness would be if
> > struct drm_gpu_scheduler's internal components wouldn't be touched.
> > That's kind of a luxury request, though.
> >=20
>=20
> Yes, perhaps a helper to extract the submit_wq too.

Could work; but best would be if driver's store their own pointer.
That's not always possible (Boris recently tried to do it for Panthor),
but often it is.

>=20
> > > =C2=A0}
> > > =C2=A0
> > > @@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_s=
truct *w)
> > > =C2=A0=09=09container_of(w, struct xe_gpu_scheduler, work_process_msg=
);
> > > =C2=A0=09struct xe_sched_msg *msg;
> > > =C2=A0
> > > -=09if (READ_ONCE(sched->base.pause_submit))
> > > +=09if (drm_sched_is_stopped(&sched->base))
> > > =C2=A0=09=09return;
> > > =C2=A0
> > > =C2=A0=09msg =3D xe_sched_get_msg(sched);
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/=
xe/xe_gpu_scheduler.h
> > > index dceb2cd0ee5b..664c2db56af3 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > > @@ -56,12 +56,9 @@ static inline void xe_sched_resubmit_jobs(struct x=
e_gpu_scheduler *sched)
> > > =C2=A0=09struct drm_sched_job *s_job;
> > > =C2=A0=09bool restore_replay =3D false;
> > > =C2=A0
> > > -=09list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > > -=09=09struct drm_sched_fence *s_fence =3D s_job->s_fence;
> > > -=09=09struct dma_fence *hw_fence =3D s_fence->parent;
> > > -
> > > +=09drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> > > =C2=A0=09=09restore_replay |=3D to_xe_sched_job(s_job)->restore_repla=
y;
> > > -=09=09if (restore_replay || (hw_fence && !dma_fence_is_signaled(hw_f=
ence)))
> > > +=09=09if (restore_replay || !drm_sched_job_is_signaled(s_job))
> >=20
> > So that's where this function is needed. You check whether that job in
> > the pending_list is signaled.=20
> >=20
>=20
> Yes, during GT reset flows (think a device level reset) it is possible
> we stop the scheduler between the window of a job signaling but before
> free_job is called. We want avoid resubmission of jobs which have
> signaled.

I'm not so convinced then that the function should be called
drm_sched_job_is_signaled(). A job is also associated with
s_fence.finished.

Why is it that that can race here, btw. =E2=80=93 isn't it your driver whic=
h
signals the hardware fences? How and where? Interrupts?

>=20
> > > =C2=A0=09=09=09sched->base.ops->run_job(s_job);
> >=20
> > Aaaaaahm. So you invoke your own callback. But basically just to access
> > the function pointer I suppose?
> >=20
> > Since this is effectively your drm_sched_resubmit_jobs(), it is
> > definitely desirable to provide a text book example of how to do resets
> > so that others can follow your usage.
> >=20
>=20
> Yes, but drm_sched_resubmit_jobs() does some nonsense with dma-fence
> that I don=E2=80=99t need here. Honestly, I=E2=80=99m a little unsure wha=
t that is
> actually doing.
>=20

Resubmit jobs shouldn't be used anymore, it's depercated. What I mean
is that your code here effectively is the resubmission code. So if you
think that it's the right way of doing resets, in harmony with
drm_sched, then it would be good if this code is as tidy as possible
and preferably even commented, so that we can point other driver
programmers to this as an example of idiomatic usage.


>  We also use this function during VF restore after
> migration. This is a multi-step process that needs to operate on the
> same set of jobs at each step of the restore. That=E2=80=99s what the
> restore_replay variable represents=E2=80=94it marks a job at the very beg=
inning
> of the restore process, and each step along the way ensures execution
> starts at that job. Techincally once we here in a VF restore jobs can
> start signaling as the hardware is live. So some of this really is
> vendor-specific.
>=20
> > Can't you replace ops->run_job() with a call to your functions where
> > you push the jobs to the ring, directly?
> >=20
>=20
> Yes, we could, but that function isn=E2=80=99t currently exported. Also, =
in
> future products, we may assign a different run_job vfunc based on
> hardware generation or queue type. So using a vfunc here makes sense as
> a bit of future-proofing. Of course, we could also have a DRM
> scheduler-level helper that invokes run_job for us.

OK.

But same comment as above applies, having distinct pointers would be the cl=
eanest thing.


P.

