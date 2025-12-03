Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3039C9EC89
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9565B10E73B;
	Wed,  3 Dec 2025 10:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QRJ8rzGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC2D10E73B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764759374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pY/T8pxOvQ8oMUKdsezfeEdQecUkAbIHWDdibYbSlnU=;
 b=QRJ8rzGrHkWE8M7Uve92tGapbtEZbYMMM12uvsEpIyuYz4kgYMB02Uwkn5MuRjMZpG1vfP
 Z7uod/Afk1tin/9lipkGTuJiW+O++8E4AnMCJba6qb5jj8jrLfIHoLV4aBvYba2oYCNTFH
 41WMdkNrcmhCOuldqX2TI51BCiuwSCo=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-3utZJJZGOd6xrF3GBGbwWg-1; Wed, 03 Dec 2025 05:56:13 -0500
X-MC-Unique: 3utZJJZGOd6xrF3GBGbwWg-1
X-Mimecast-MFC-AGG-ID: 3utZJJZGOd6xrF3GBGbwWg_1764759371
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3418ad76023so10967971a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 02:56:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764759371; x=1765364171;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=neNpAH4brbwi06DhnReMp3uzKU4SDPQXAiWvP0P7onE=;
 b=fpZ1AqNVHHFjUR0KPkwtXBEuJ4CdIyXYiWAE7rNULu0KU+ypbwI8tVit4Vg43Ou0oI
 WCogHSHpyC0JHysbbK8jO3D7EX4+goQx9w+yjQyF4brH4za4Ac7vfGZjcbbhRIggGlmJ
 brUMpC+oLQ+eYC/gCJO9/3zkFUDTkZDpOQ8ONLPZh0MNQ2GrIzrQvtTgyNHL82VHTVbE
 fQAvnwG9eCD6ZgujuW0I+oJmw3Y3WSuAm0haKzv4Afzp0HQNOJhapUdT3aThq4IwRf8T
 4vNmOMw7SyKb+KsN3f0V72w45GjTvodkTExycerDoypRC3Df5D4r243do2oEqxLXBNXp
 eIcQ==
X-Gm-Message-State: AOJu0YwtjW0Z9ANjtBSKg51sEsbg17aOADKOzESkkgWW8urN83Lgj+DG
 eIt2gEllqLrcRm8/LUsC/lXkVJCcwJRtP7bXLwm8GxJsokxo3tCpuwf7GHLA91BoiLHNcdJh9JN
 rV8bvZj79+4b5TADK8fxKdhwKiXw57ejoq8Uf6qf/p8AP3CJcGu0vnRXEmRA2PHPFzCsl/A==
X-Gm-Gg: ASbGncv4GmnI0RZYOoN8CpHMq6kKPeu4V7CZRXhe3kUMn2OHv+ZmkLzKCdLInuqG//B
 gl9I3UeDGAxX2o+uB+ISJJTahRGj8nhlrAHhFWrCgZyNzGmwPeKfBa2QKWQ3ZMy8x/DWbImCTkn
 hz7ogJp/ioZEww6bD4RNMGZQOKnutOlWYIMTkrkzi/B2+l6vczSl5GlZMEEHXKw/7Yl04MMqS8D
 uhftF15UWPVrLPEKcceuwYu2LrFJGCAkuq9hWpqqgtDPlqzFvojlABteHEkE0gFCBP7lKZ8gds4
 n/Jk2yq0X7/9rcW9h08wQ3ycfCVRdKNWA3qTBujZbqskdlk3FtDxIqZJRowXOIOjCODCc8adN7S
 N/bQ255T1guMclWvhDtRJyP77vKVv1+nj+UGj
X-Received: by 2002:a17:90b:4d07:b0:340:c261:f9db with SMTP id
 98e67ed59e1d1-349125d0893mr2082511a91.10.1764759371457; 
 Wed, 03 Dec 2025 02:56:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFw7EHNvdsKJnQQE6Im4sp+X6L/gF+FUYvHD4ooSLEWO4GmOIUh8jS/PzMX4Tp2G5Nyq6lPg==
X-Received: by 2002:a17:90b:4d07:b0:340:c261:f9db with SMTP id
 98e67ed59e1d1-349125d0893mr2082498a91.10.1764759371035; 
 Wed, 03 Dec 2025 02:56:11 -0800 (PST)
Received: from [10.200.68.138] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34910e9e0desm2406745a91.15.2025.12.03.02.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:56:10 -0800 (PST)
Message-ID: <9bd6778fc3d22bad2b2f8adc6bb165134ef919e5.camel@redhat.com>
Subject: Re: [PATCH v7 4/9] drm/xe: Stop abusing DRM scheduler internals
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, dakr@kernel.org, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Wed, 03 Dec 2025 11:56:01 +0100
In-Reply-To: <20251201183954.852637-5-matthew.brost@intel.com>
References: <20251201183954.852637-1-matthew.brost@intel.com>
 <20251201183954.852637-5-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9h-XhDl0DEEUOH-7ocQzRZuitOc8lxSC-OhcPlfp-pI_1764759371
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

On Mon, 2025-12-01 at 10:39 -0800, Matthew Brost wrote:
> Use new pending job list iterator and new helper functions in Xe to
> avoid reaching into DRM scheduler internals.

Cool.

Obviously this is your driver, but some comments below which you might
want to take into account.

>=20
> Part of this change involves removing pending jobs debug information
> from debugfs and devcoredump. As agreed, the pending job list should
> only be accessed when the scheduler is stopped. However, it's not
> straightforward to determine whether the scheduler is stopped from the
> shared debugfs/devcoredump code path. Additionally, the pending job list
> provides little useful information, as pending jobs can be inferred from
> seqnos and ring head/tail positions. Therefore, this debug information
> is being removed.

This reads a bit like a contradiction to the first sentence.

>=20
> v4:
> =C2=A0- Add comment around DRM_GPU_SCHED_STAT_NO_HANG (Niranjana)

Revision info for just one of 7 revisions?

>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.c=
om>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +=
-
> =C2=A0drivers/gpu/drm/xe/xe_gpu_scheduler.h=C2=A0=C2=A0=C2=A0 | 33 ++----=
----
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 81 ++++++------------------
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> =C2=A0drivers/gpu/drm/xe/xe_hw_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 16 -----
> =C2=A0drivers/gpu/drm/xe/xe_hw_fence.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 -
> =C2=A06 files changed, 27 insertions(+), 120 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.c
> index f4f23317191f..9c8004d5dd91 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -7,7 +7,7 @@
> =C2=A0
> =C2=A0static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sch=
ed)
> =C2=A0{
> -=09if (!READ_ONCE(sched->base.pause_submit))
> +=09if (!drm_sched_is_stopped(&sched->base))
> =C2=A0=09=09queue_work(sched->base.submit_wq, &sched->work_process_msg);

Sharing the submit_wq is legal. But next-level cleanness would be if
struct drm_gpu_scheduler's internal components wouldn't be touched.
That's kind of a luxury request, though.

> =C2=A0}
> =C2=A0
> @@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struc=
t *w)
> =C2=A0=09=09container_of(w, struct xe_gpu_scheduler, work_process_msg);
> =C2=A0=09struct xe_sched_msg *msg;
> =C2=A0
> -=09if (READ_ONCE(sched->base.pause_submit))
> +=09if (drm_sched_is_stopped(&sched->base))
> =C2=A0=09=09return;
> =C2=A0
> =C2=A0=09msg =3D xe_sched_get_msg(sched);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/x=
e_gpu_scheduler.h
> index dceb2cd0ee5b..664c2db56af3 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -56,12 +56,9 @@ static inline void xe_sched_resubmit_jobs(struct xe_gp=
u_scheduler *sched)
> =C2=A0=09struct drm_sched_job *s_job;
> =C2=A0=09bool restore_replay =3D false;
> =C2=A0
> -=09list_for_each_entry(s_job, &sched->base.pending_list, list) {
> -=09=09struct drm_sched_fence *s_fence =3D s_job->s_fence;
> -=09=09struct dma_fence *hw_fence =3D s_fence->parent;
> -
> +=09drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> =C2=A0=09=09restore_replay |=3D to_xe_sched_job(s_job)->restore_replay;
> -=09=09if (restore_replay || (hw_fence && !dma_fence_is_signaled(hw_fence=
)))
> +=09=09if (restore_replay || !drm_sched_job_is_signaled(s_job))

So that's where this function is needed. You check whether that job in
the pending_list is signaled.=20

> =C2=A0=09=09=09sched->base.ops->run_job(s_job);

Aaaaaahm. So you invoke your own callback. But basically just to access
the function pointer I suppose?

Since this is effectively your drm_sched_resubmit_jobs(), it is
definitely desirable to provide a text book example of how to do resets
so that others can follow your usage.

Can't you replace ops->run_job() with a call to your functions where
you push the jobs to the ring, directly?


P.

