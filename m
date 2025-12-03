Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1C7C9E531
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FAF10E771;
	Wed,  3 Dec 2025 08:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Six01LoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE0A10E771
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 08:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764752217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FKpRGX3o1cb0P7D6YkuLKLXe7ij3WTfEdq+WgMxbUyM=;
 b=Six01LoKk+Wi/9zmNfufzyPrEiuDdawNwNVpKUxWCcamxj0dCK50gcdw11LzIXOYez/CL+
 pbmo4ByYLUVGqIJkAvUzWeJ5VDnr5IfDi4TxI+Z6m98T/0YSbUl2pOP1eIKMUmMeCTL/zr
 wHZzbjd+v7tW7uO1NpfGeJk06zED7is=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-MUKnET4wMu2z-Lt0YPGxLA-1; Wed, 03 Dec 2025 03:56:56 -0500
X-MC-Unique: MUKnET4wMu2z-Lt0YPGxLA-1
X-Mimecast-MFC-AGG-ID: MUKnET4wMu2z-Lt0YPGxLA_1764752215
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7b9090d9f2eso10771687b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 00:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764752215; x=1765357015;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RofnEOBgbOyhIcNHlRC4C1ByGHmhIXzrhEMHFHM8wME=;
 b=MLwg6Ud05VVtasinauCc8cx2CIa+9t1tfXK0emk49y4ljEeZvh60UYi9mvhdzEk7Dx
 7kHUcZUlOBa4Y7nZa6/IxcEfsGx8aX4l6MNhP6ZvB9sPtY7BA2NUbhZrMZJCQvkKovMO
 aqEarUhC68HyqDDuqCVBDLuDE8/m6KEM4F7k9WUFqL7PnEAzDNkJCauDM/FJK62zOThT
 ZxgvvuMYSND5AJLo2gaFwcYSvKHf2ZjJybHPIjV9XGILcxqF65Da30uGtfqCWxuYtP+U
 FEd9hjRI4OCaZsEOATAtlHzMFHxbktDSG1rxih+ihWuL1Z6UVe0bv1SUQiXFcL3xLnQ8
 jdIQ==
X-Gm-Message-State: AOJu0Yy7L/eHyzhngjJXf1FBLNuWrYWCWXCen0QEYrTvpgGDHv7m0Mau
 sk2QCXNKXqw6zXXl2wvegEj1O5unW17VGpIRr1XeI6FCnUwAfOLpzsnd7iXxyATJ8JmZDfgWeAJ
 vB4wTYMOA1yy9Sr+yWCEM/Kh/BLJYGzBlfCo0G3ntkQbg2e0CxROnMD9anTLEx6nd6ILStA==
X-Gm-Gg: ASbGncsFjvna/QBcR7t83zNZA222r+/P6wY+fERSKrFhHV+WRrczAVA6Efi4m3gOKoG
 Q1FNvf2Q1Nk7dCkdAStXlmkWzM4TG5adCpfMogl2//cwi1tQxb4JGB7aqPUh46umw+bbLV3F/yh
 97YUGDBBY33RU6oSRMuqDYDgdCw8PLX2oDHG6Vo3iIHNGDAH6w7Qsbvgc2e3CmPdwA8ik57S90V
 3M0gFWm4DjyvJR5bwIn0zfJZrTJhu+8HOTZ4P7lkSdvM84gnztWpdUm3qf7trmi/2hKPwixMRye
 1VR3/rso6Sa8RqdBioNLNcdBIeZUsr77Vv2CpkwQcGcSX53M4zS4f3uQn9yHIPe6oAomUDEk4Fx
 bGvFJi462grDSuOF/RKCGGB4lmHRo9ohIdw0M
X-Received: by 2002:a05:6a21:999c:b0:34f:ec81:bc3d with SMTP id
 adf61e73a8af0-363f5e95a0bmr2492959637.44.1764752215006; 
 Wed, 03 Dec 2025 00:56:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpqCBdDRCPPxUKfz/ixOi/SypCC+hEGz1RnL28j4fV5owx/FoBTNhhBSlg3UZdLxeAtVEPtw==
X-Received: by 2002:a05:6a21:999c:b0:34f:ec81:bc3d with SMTP id
 adf61e73a8af0-363f5e95a0bmr2492896637.44.1764752213955; 
 Wed, 03 Dec 2025 00:56:53 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-be5093b5b79sm17402491a12.25.2025.12.03.00.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 00:56:53 -0800 (PST)
Message-ID: <0b1b4bbf0b49832db2c1e12477c5af55780f39df.camel@redhat.com>
Subject: Re: [PATCH v7 1/9] drm/sched: Add several job helpers to avoid
 drivers touching scheduler state
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, Christian
 =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Date: Wed, 03 Dec 2025 09:56:45 +0100
In-Reply-To: <20251201183954.852637-2-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-2-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SJg2QjosPSOqqcyiGkJn13tYRs5_da34bbgmWB1WBKI_1764752215
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

+Cc Christian, Alex, Danilo


On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> Add helpers to see if scheduler is stopped and a jobs signaled state.
> Expected to be used driver side on recovery and debug flows.

First, thanks for working on this.

This is a big and significant change because it moves towards ending
the 10-year practice of accessing internal locks etc. =E2=80=93 I think thi=
s
should have a long(er) and detailed commit message aka "In the past
drivers used to =E2=80=A6 this must end because =E2=80=A6 to do so we need =
to provide
those new functions: =E2=80=A6"

>=20
> v4:
> =C2=A0- Reorder patch to first in series (Niranjana)
> =C2=A0- Also check parent fence for signaling (Niranjana)

"We" mostly agreed of not adding changelogs to commit messages anymore
and either have them in the cover letter or in the patche's comment
section below ---
The commit changelog comments are not canonical in the kernel and don't
provide any value IMO.

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.c=
om>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c |=C2=A0 4 ++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 32 ++++++++++++++++++++++++++
> =C2=A02 files changed, 34 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 1d4f1b822e7b..cf40c18ab433 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -344,7 +344,7 @@ drm_sched_rq_select_entity_fifo(struct drm_gpu_schedu=
ler *sched,
> =C2=A0 */
> =C2=A0static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched=
)
> =C2=A0{
> -=09if (!READ_ONCE(sched->pause_submit))
> +=09if (!drm_sched_is_stopped(sched))
> =C2=A0=09=09queue_work(sched->submit_wq, &sched->work_run_job);
> =C2=A0}
> =C2=A0
> @@ -354,7 +354,7 @@ static void drm_sched_run_job_queue(struct drm_gpu_sc=
heduler *sched)
> =C2=A0 */
> =C2=A0static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sche=
d)
> =C2=A0{
> -=09if (!READ_ONCE(sched->pause_submit))
> +=09if (!drm_sched_is_stopped(sched))
> =C2=A0=09=09queue_work(sched->submit_wq, &sched->work_free_job);
> =C2=A0}
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..385bf34e76fe 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -698,4 +698,36 @@ void drm_sched_entity_modify_sched(struct drm_sched_=
entity *entity,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 struct drm_gpu_scheduler **sched_list,
> =C2=A0=09=09=09=09=C2=A0=C2=A0 unsigned int num_sched_list);
> =C2=A0
> +/* Inlines */

Surplus comment, everyone immediately sees by the keyword that the
functions are inline.

But why do you want to provide them here instead of in sched_main.c in
the first place?


> +
> +/**
> + * drm_sched_is_stopped() - DRM is stopped

Well no, I doubt the entire DRM subsystem is stopped ;)

"Checks whether drm_sched is stopped"

> + * @sched: DRM scheduler
> + *
> + * Return: True if sched is stopped, False otherwise
> + */
> +static inline bool drm_sched_is_stopped(struct drm_gpu_scheduler *sched)
> +{
> +=09return READ_ONCE(sched->pause_submit);

I am by the way suspecting since a long time

> +}
> +
> +/**
> + * drm_sched_job_is_signaled() - DRM scheduler job is signaled
> + * @job: DRM scheduler job
> + *
> + * Determine if DRM scheduler job is signaled. DRM scheduler should be s=
topped
> + * to obtain a stable snapshot of state. Both parent fence (hardware fen=
ce) and
> + * finished fence (software fence) are check to determine signaling stat=
e.

s/check/checked

I can roughly understand why you need the start/stop checkers for your
list iterator, but what is this function's purpose? The commit message
should explain that.

Do you need them in Xe? Do all drivers need them?

I think it's very cool that you provide this series and are working on
all that, but at XDC I think the important point was that we determined
that AMD and Intel basically do the same trick for GPU resets.

So our desire was not only to prevent folks from accessing the
scheduler's internals, but, ideally, also provide a well documented,
centralized and canonical mechanisms to do GPU resets.

So I think this drm/sched code must be discussed with AMD and we should
see whether it would be sufficient for them, too. And if yes, we need
to properly document that new way of GPU resets and tell users what
those functions are for. The docstrings so far just highlight that
those functions exist and how they are used, but not *why* they exist.

> + *
> + * Return: True if job is signaled, False otherwise

True and False should be lower case I think. At least I've never seen
them upper case in docstrings so far?


P.

> + */
> +static inline bool drm_sched_job_is_signaled(struct drm_sched_job *job)
> +{
> +=09struct drm_sched_fence *s_fence =3D job->s_fence;
> +
> +=09WARN_ON(!drm_sched_is_stopped(job->sched));
> +=09return (s_fence->parent && dma_fence_is_signaled(s_fence->parent)) ||
> +=09=09dma_fence_is_signaled(&s_fence->finished);
> +}
> +
> =C2=A0#endif

