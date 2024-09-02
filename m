Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B19967FE4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216D810E203;
	Mon,  2 Sep 2024 07:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ILZAaLoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2332C10E202
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 07:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725260515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3p2EjLfmrsiKMAspdgEACltc7GqCKArCBhLyAbT6pjM=;
 b=ILZAaLoMt3Xj47rblBfclYIiNfLnIryHDNUgN6W5wjxnoa5LmPX8kBIwVQe+gTdIXq2EZ7
 yoyGcnOyukzGGfkydcgJFDv8+6Ox/M0bv1wdlS6I8cVp7hBxuFqY5+2cSVmwx24yCbQVed
 22S3RHd1WcLgzzjojicQ4QsNMs68TD8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-QPqdxnEPNKGoG0l6_pAcug-1; Mon, 02 Sep 2024 03:01:52 -0400
X-MC-Unique: QPqdxnEPNKGoG0l6_pAcug-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6c3554020afso26158176d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 00:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725260512; x=1725865312;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9KL7uEJnX/BKcRSAgIpHpxweWLyE+EHZLjAPPjvmk04=;
 b=TYuAtWoo2aCOLA+LZ4dDvU6Zlk/wRehWMkTp0+RsQRNTpVHVRcVvs4r4rnLgEDKHl+
 BIZOVMghv7YtFnFO5tEhPInmwbcIYzausFiYW+hrnfpnx6FA+CAUId7TzUJITe+m48Eb
 QVNKT5hNAOr5d4+oNqoVnObLp1m0fyqblHhK6ck3BHtO6ujLurpA++B5HT/0TttQLTYO
 nKSYQkV7f/wXEzfES4FrIkPAlVs7F0gkM23ZrlP/Uy+zYoAs6YoyvqDmKJLJ5c754peQ
 iX3k6ZtYj6m55yE0YL9uellz7lVhPRGsecEC3g1r8LxVAenrUWl3c+T6jT7WLTaCdq3+
 4CTQ==
X-Gm-Message-State: AOJu0YygQgtuOV39EhgWEmF4NiUMJ+Libc1ko8SvcRdj18D77/Qp+uN5
 fKJUGdGII3G0KSNi6j8qfnV4+tYPcw9aeol//Z5i305arjnIzlSVZVoB97IhPmV9i7uCyGwwGio
 +/MmNVnTOuFVAzgIprUadQ6JhTl8tFlpPy1zDplUIUwkUH0QDpv+qwHxFTPQXmJSYtQ==
X-Received: by 2002:a05:6214:5346:b0:6c1:547b:418a with SMTP id
 6a1803df08f44-6c33e69c654mr159325026d6.36.1725260511964; 
 Mon, 02 Sep 2024 00:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgQl33b08//KToTMuHVd+jamAe6RmKrYCTD6Ged69hTUlOzhpPczbgKj3D1yRH1B4OeQhUCA==
X-Received: by 2002:a05:6214:5346:b0:6c1:547b:418a with SMTP id
 6a1803df08f44-6c33e69c654mr159324806d6.36.1725260511494; 
 Mon, 02 Sep 2024 00:01:51 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c35cc115f7sm15951086d6.3.2024.09.02.00.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:01:51 -0700 (PDT)
Message-ID: <7db2f831c86b3d73d99b8cf006e11a3546fa38d6.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com
Cc: dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Mon, 02 Sep 2024 09:01:48 +0200
In-Reply-To: <9b46fa6d-37f4-4438-a2ab-c2109cb1ebd6@gmail.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
 <efade2855efe93dd66104d59e113b2a99ed2a8d2.camel@redhat.com>
 <9b46fa6d-37f4-4438-a2ab-c2109cb1ebd6@gmail.com>
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

On Fri, 2024-08-30 at 15:15 +0200, Christian K=C3=B6nig wrote:
> Am 28.08.24 um 11:30 schrieb Philipp Stanner:
> > On Mon, 2024-08-26 at 14:25 +0200, Christian K=C3=B6nig wrote:
> > > The current implementation of drm_sched_start uses a hardcoded
> > > -ECANCELED to dispose of a job when the parent/hw fence is NULL.
> > > This results in drm_sched_job_done being called with -ECANCELED
> > > for
> > > each job with a NULL parent in the pending list, making it
> > > difficult
> > > to distinguish between recovery methods, whether a queue reset or
> > > a
> > > full GPU reset was used.
> > >=20
> > > To improve this, we first try a soft recovery for timeout jobs
> > > and
> > > use the error code -ENODATA. If soft recovery fails, we proceed
> > > with
> > > a queue reset, where the error code remains -ENODATA for the job.
> > > Finally, for a full GPU reset, we use error codes -ECANCELED or
> > > -ETIME. This patch adds an error code parameter to
> > > drm_sched_start,
> > > allowing us to differentiate between queue reset and GPU reset
> > > failures. This enables user mode and test applications to
> > > validate
> > > the expected correctness of the requested operation. After a
> > > successful queue reset, the only way to continue normal operation
> > > is
> > > to call drm_sched_job_done with the specific error code -ENODATA.
> > >=20
> > > v1: Initial implementation by Jesse utilized
> > > amdgpu_device_lock_reset_domain
> > > =C2=A0=C2=A0=C2=A0=C2=A0 and amdgpu_device_unlock_reset_domain to all=
ow user mode to
> > > track
> > > =C2=A0=C2=A0=C2=A0=C2=A0 the queue reset status and distinguish betwe=
en queue reset
> > > and
> > > =C2=A0=C2=A0=C2=A0=C2=A0 GPU reset.
> > > v2: Christian suggested using the error codes -ENODATA for queue
> > > reset
> > > =C2=A0=C2=A0=C2=A0=C2=A0 and -ECANCELED or -ETIME for GPU reset, retu=
rned to
> > > =C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_cs_wait_ioctl.
> > > v3: To meet the requirements, we introduce a new function
> > > =C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_start_ex with an additional parame=
ter to set
> > > =C2=A0=C2=A0=C2=A0=C2=A0 dma_fence_set_error, allowing us to handle t=
he specific
> > > error
> > > =C2=A0=C2=A0=C2=A0=C2=A0 codes appropriately and dispose of bad jobs =
with the
> > > selected
> > > =C2=A0=C2=A0=C2=A0=C2=A0 error code depending on whether it was a que=
ue reset or GPU
> > > reset.
> > > v4: Alex suggested using a new name,
> > > drm_sched_start_with_recovery_error,
> > > =C2=A0=C2=A0=C2=A0=C2=A0 which more accurately describes the function=
's purpose.
> > > =C2=A0=C2=A0=C2=A0=C2=A0 Additionally, it was recommended to add docu=
mentation
> > > details
> > > =C2=A0=C2=A0=C2=A0=C2=A0 about the new method.
> > > v5: Fixed declaration of new function
> > > drm_sched_start_with_recovery_error.(Alex)
> > > v6 (chk): rebase on upstream changes, cleanup the commit message,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drop the=
 new function again and update all callers,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apply th=
e errno also to scheduler fences with hw
> > > fences
> > >=20
> > > Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> > > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +=
-
> > > =C2=A0=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> > > =C2=A0=C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> > > =C2=A0=C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 ++++---
> > > =C2=A0=C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0=C2=A011 files changed, 16 insertions(+), 15 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > index 2320df51c914..18135d8235f9 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> > > @@ -300,7 +300,7 @@ static int
> > > suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool
> > > sus
> > > =C2=A0=C2=A0=09=09=09if (r)
> > > =C2=A0=C2=A0=09=09=09=09goto out;
> > > =C2=A0=C2=A0=09=09} else {
> > > -=09=09=09drm_sched_start(&ring->sched);
> > > +=09=09=09drm_sched_start(&ring->sched, 0);
> > > =C2=A0=C2=A0=09=09}
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index 1cd7d355689c..5891312e44ea 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -5879,7 +5879,7 @@ int amdgpu_device_gpu_recover(struct
> > > amdgpu_device *adev,
> > > =C2=A0=C2=A0=09=09=09if (!amdgpu_ring_sched_ready(ring))
> > > =C2=A0=C2=A0=09=09=09=09continue;
> > > =C2=A0=20
> > > -=09=09=09drm_sched_start(&ring->sched);
> > > +=09=09=09drm_sched_start(&ring->sched, 0);
> > > =C2=A0=C2=A0=09=09}
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09=09if
> > > (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) &&
> > > !job_signaled)
> > > @@ -6374,7 +6374,7 @@ void amdgpu_pci_resume(struct pci_dev
> > > *pdev)
> > > =C2=A0=C2=A0=09=09if (!amdgpu_ring_sched_ready(ring))
> > > =C2=A0=C2=A0=09=09=09continue;
> > > =C2=A0=20
> > > -=09=09drm_sched_start(&ring->sched);
> > > +=09=09drm_sched_start(&ring->sched, 0);
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09amdgpu_device_unset_mp1_state(adev);
> > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > index ab9ca4824b62..23ced5896c7c 100644
> > > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > > @@ -72,7 +72,7 @@ static enum drm_gpu_sched_stat
> > > etnaviv_sched_timedout_job(struct drm_sched_job
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09drm_sched_resubmit_jobs(&gpu->sched);
> > > =C2=A0=20
> > > -=09drm_sched_start(&gpu->sched);
> > > +=09drm_sched_start(&gpu->sched, 0);
> > > =C2=A0=C2=A0=09return DRM_GPU_SCHED_STAT_NOMINAL;
> > > =C2=A0=20
> > > =C2=A0=C2=A0out_no_timeout:
> > > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> > > b/drivers/gpu/drm/imagination/pvr_queue.c
> > > index 20cb46012082..c4f08432882b 100644
> > > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > > @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue
> > > *queue)
> > > =C2=A0=C2=A0=09=09}
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > -=09drm_sched_start(&queue->scheduler);
> > > +=09drm_sched_start(&queue->scheduler, 0);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job
> > > *s_job)
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=C2=A0=09mutex_unlock(&pvr_dev->queues.lock);
> > > =C2=A0=20
> > > -=09drm_sched_start(sched);
> > > +=09drm_sched_start(sched, 0);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09return DRM_GPU_SCHED_STAT_NOMINAL;
> > > =C2=A0=C2=A0}
> > > diff --git a/drivers/gpu/drm/lima/lima_sched.c
> > > b/drivers/gpu/drm/lima/lima_sched.c
> > > index 1a944edb6ddc..b40c90e97d7e 100644
> > > --- a/drivers/gpu/drm/lima/lima_sched.c
> > > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > > @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat
> > > lima_sched_timedout_job(struct drm_sched_job *job
> > > =C2=A0=C2=A0=09lima_pm_idle(ldev);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09drm_sched_resubmit_jobs(&pipe->base);
> > > -=09drm_sched_start(&pipe->base);
> > > +=09drm_sched_start(&pipe->base, 0);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09return DRM_GPU_SCHED_STAT_NOMINAL;
> > > =C2=A0=C2=A0}
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index eb6c3f9a01f5..4412f2711fb5 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct
> > > drm_sched_job
> > > *sched_job)
> > > =C2=A0=C2=A0=09else
> > > =C2=A0=C2=A0=09=09NV_PRINTK(warn, job->cli, "Generic job
> > > timeout.\n");
> > > =C2=A0=20
> > > -=09drm_sched_start(sched);
> > > +=09drm_sched_start(sched, 0);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09return stat;
> > > =C2=A0=C2=A0}
> > > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > index df49d37d0e7e..d140800606bf 100644
> > > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > > @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09/* Restart the schedulers */
> > > =C2=A0=C2=A0=09for (i =3D 0; i < NUM_JOB_SLOTS; i++)
> > > -=09=09drm_sched_start(&pfdev->js->queue[i].sched);
> > > +=09=09drm_sched_start(&pfdev->js->queue[i].sched, 0);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09/* Re-enable job interrupts now that everything has be=
en
> > > restarted. */
> > > =C2=A0=C2=A0=09job_write(pfdev, JOB_INT_MASK,
> > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > index d47972806d50..e630cdf47f99 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm
> > > *vm)
> > > =C2=A0=20
> > > =C2=A0=C2=A0static void panthor_vm_start(struct panthor_vm *vm)
> > > =C2=A0=C2=A0{
> > > -=09drm_sched_start(&vm->sched);
> > > +=09drm_sched_start(&vm->sched, 0);
> > > =C2=A0=C2=A0}
> > > =C2=A0=20
> > > =C2=A0=C2=A0/**
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index ab53ab486fe6..f093616fe53c 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> > > =C2=A0=C2=A0 * drm_sched_start - recover jobs after a reset
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * @sched: scheduler instance
> > > + * @errno: error to set on the pending fences
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 */
> > > -void drm_sched_start(struct drm_gpu_scheduler *sched)
> > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0=09struct drm_sched_job *s_job, *tmp;
> > > =C2=A0=20
> > > @@ -691,13 +692,13 @@ void drm_sched_start(struct
> > > drm_gpu_scheduler
> > > *sched)
> > > =C2=A0=C2=A0=09=09atomic_add(s_job->credits, &sched-
> > > >credit_count);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09=09if (!fence) {
> > > -=09=09=09drm_sched_job_done(s_job, -ECANCELED);
> > > +=09=09=09drm_sched_job_done(s_job, errno ?: -
> > > ECANCELED);
> > > =C2=A0=C2=A0=09=09=09continue;
> > > =C2=A0=C2=A0=09=09}
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09=09if (dma_fence_add_callback(fence, &s_job->cb,
> > > =C2=A0=C2=A0=09=09=09=09=09=C2=A0=C2=A0
> > > drm_sched_job_done_cb))
> > > -=09=09=09drm_sched_job_done(s_job, fence->error);
> > > +=09=09=09drm_sched_job_done(s_job, fence->error
> > > ?:
> > > errno);
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09drm_sched_start_timeout_unlocked(sched);
> > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > > b/drivers/gpu/drm/v3d/v3d_sched.c
> > > index fd29a00b233c..b6a89171824b 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > @@ -663,7 +663,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev
> > > *v3d,
> > > struct drm_sched_job *sched_job)
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09/* Unblock schedulers and restart their jobs. */
> > > =C2=A0=C2=A0=09for (q =3D 0; q < V3D_MAX_QUEUES; q++) {
> > > -=09=09drm_sched_start(&v3d->queue[q].sched);
> > > +=09=09drm_sched_start(&v3d->queue[q].sched, 0);
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09mutex_unlock(&v3d->reset_lock);
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index fe8edb917360..a8d19b10f9b8 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct
> > > drm_gpu_scheduler *sched);
> > > =C2=A0=C2=A0void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sche=
d);
> > > =C2=A0=C2=A0void drm_sched_wqueue_start(struct drm_gpu_scheduler *sch=
ed);
> > > =C2=A0=C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, stru=
ct
> > > drm_sched_job *bad);
> > > -void drm_sched_start(struct drm_gpu_scheduler *sched);
> > > +void drm_sched_start(struct drm_gpu_scheduler *sched, int
> > > errno);
> > I personally only recently started using the scheduler and many
> > things
> > were quite confusing.
> >=20
> > In particular, I thought it's not good to call this function
> > drm_sched_start(), because that implies to new users / programmers
> > that
> > this function is supposed to start the scheduler.
> >=20
> > Accordingly, drm_sched_stop() sounds as if it's intended to be used
> > on
> > scheduler teardown. "Alright, I'll stop the scheduler with
> > drm_sched_stop(), then can safely call drm_sched_entity_destroy()
> > and
> > then tear it down completely through drm_sched_fini()".
> >=20
> > Now the comments make it obvious that those start and stop
> > functions
> > are more intended for error recovery.
> >=20
> > So my stance is that start should be called, e.g.,
> > drm_sched_restart()
> > or perhaps drm_sched_recover_start().
> >=20
> > So since you're already touching all the lines where the function
> > is
> > used, this might be a good opportunity to improve the name, too.
> >=20
> > If that's deemed desirable.
>=20
> Yeah completely agree.
>=20
> We also had people incorrectly thinking that they should call=20
> drm_sched_stop/start on suspend/resume resulting in a system which=20
> didn't come up again after resume.
>=20
> How about we call it drm_sched_suspend_before_reset() and=20
> drm_sched_resume_after_reset()?

Yes, that sounds bullet-proof to me :)

One might also consider drm_sched_start()'s function summary "recover
jobs after a reset". Maybe have a sentence about what "recover" means
would help there, too.


Regards,
P.


>=20
> Thanks,
> Christian.
>=20
> >=20
> > P.
> >=20
> >=20
> > > =C2=A0=C2=A0void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sc=
hed);
> > > =C2=A0=C2=A0void drm_sched_increase_karma(struct drm_sched_job *bad);
> > > =C2=A0=C2=A0void drm_sched_reset_karma(struct drm_sched_job *bad);
>=20

