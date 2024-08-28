Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2251962362
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CAB08905A;
	Wed, 28 Aug 2024 09:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OZyIUebR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AD98905A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724837412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tS1CEMbTEHzBj/S+CalTHRuPbmQwYl3wda/AU2JiR3E=;
 b=OZyIUebRELhPwYNB3wM2+bQS2coBoRemo3evNZQ3Uywi5E8a7NgCRo+qC21L20cKyTv2NF
 l/UEN+DjSmvfx9ENagI2cMPs/mCjleg2C60VRxHRKnoQR3/0JzDaRJXXSQ5rtQ53g2+WXl
 DcviLyCGXCz5zSKY/r3opVabQ6W+Ckw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-1KcfbUkNPSyRMc6IjXDpWA-1; Wed, 28 Aug 2024 05:30:10 -0400
X-MC-Unique: 1KcfbUkNPSyRMc6IjXDpWA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7a1d06f8f03so773453985a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724837409; x=1725442209;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IjPOSw4zEQ4MrjL+Pf0Zyrknk3Z6bJubvFb2bII73SA=;
 b=HM8lg9ORXF1nivcrmBhET35IesewLp8uwhxZ9ay7HqiHPk3BDKVDA2Ln/4451/3Xb2
 y5S/OZxLKqlNsp1B805tjqiU0E9D5LD8mxLF5blRds/K7SE/SkAg7rfoMytrn1OBsjU8
 Q+DIw1GxEKzH/Y10zTi55s3QyUsnQKNYBXvauKrRA/Kvh0xjNrbN4sfd8SZv7FEJjrZK
 bCMU/X9C11bXrbX6biZ8E0tHSI2ApifA5UQoM/2pYRwnkYg8oYUsB2hFjAo5n3tf0Dd2
 qMNvflHDiqS0GGyyGD4xlAd6SLzbaFCfbQOUj/D7/SZhtPif8iNz38uaL8QbNuhv+mNU
 Q56A==
X-Gm-Message-State: AOJu0Yz5Y8TaWGqJZkUTIrRLmfn764OOacHI5Un24GBriVpnmiPEM0+8
 R4bZ8TP+gjw6WQnCF/ZACvzS4Gm2Kke4QjgDv8IH9OFxtDaZvYFBQalBBaC0wyKUJszU+P5Ak7d
 3C2FfU//YR4UdjOm3Xzup4JM666Ucr40MYpGyT4CWclJMlkyr6DnSDJY4y9SoWjQkcQ==
X-Received: by 2002:a05:620a:2405:b0:79d:6dd6:5a66 with SMTP id
 af79cd13be357-7a6897142eemr1957940185a.36.1724837409610; 
 Wed, 28 Aug 2024 02:30:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGhOkONtKQ2RC12uW0SWaxm2WjNR0jOkLleWlItEGCTYctDuIBnr8NxovZdHTguQNHCC9OuQ==
X-Received: by 2002:a05:620a:2405:b0:79d:6dd6:5a66 with SMTP id
 af79cd13be357-7a6897142eemr1957938085a.36.1724837409129; 
 Wed, 28 Aug 2024 02:30:09 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f3471aasm628340585a.39.2024.08.28.02.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:30:08 -0700 (PDT)
Message-ID: <efade2855efe93dd66104d59e113b2a99ed2a8d2.camel@redhat.com>
Subject: Re: [PATCH 1/4] drm/sched: add optional errno to drm_sched_start()
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 daniel.vetter@ffwll.ch, vitaly.prosyak@amd.com
Cc: dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Date: Wed, 28 Aug 2024 11:30:06 +0200
In-Reply-To: <20240826122541.85663-1-christian.koenig@amd.com>
References: <20240826122541.85663-1-christian.koenig@amd.com>
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

On Mon, 2024-08-26 at 14:25 +0200, Christian K=C3=B6nig wrote:
> The current implementation of drm_sched_start uses a hardcoded
> -ECANCELED to dispose of a job when the parent/hw fence is NULL.
> This results in drm_sched_job_done being called with -ECANCELED for
> each job with a NULL parent in the pending list, making it difficult
> to distinguish between recovery methods, whether a queue reset or a
> full GPU reset was used.
>=20
> To improve this, we first try a soft recovery for timeout jobs and
> use the error code -ENODATA. If soft recovery fails, we proceed with
> a queue reset, where the error code remains -ENODATA for the job.
> Finally, for a full GPU reset, we use error codes -ECANCELED or
> -ETIME. This patch adds an error code parameter to drm_sched_start,
> allowing us to differentiate between queue reset and GPU reset
> failures. This enables user mode and test applications to validate
> the expected correctness of the requested operation. After a
> successful queue reset, the only way to continue normal operation is
> to call drm_sched_job_done with the specific error code -ENODATA.
>=20
> v1: Initial implementation by Jesse utilized
> amdgpu_device_lock_reset_domain
> =C2=A0=C2=A0=C2=A0 and amdgpu_device_unlock_reset_domain to allow user mo=
de to track
> =C2=A0=C2=A0=C2=A0 the queue reset status and distinguish between queue r=
eset and
> =C2=A0=C2=A0=C2=A0 GPU reset.
> v2: Christian suggested using the error codes -ENODATA for queue
> reset
> =C2=A0=C2=A0=C2=A0 and -ECANCELED or -ETIME for GPU reset, returned to
> =C2=A0=C2=A0=C2=A0 amdgpu_cs_wait_ioctl.
> v3: To meet the requirements, we introduce a new function
> =C2=A0=C2=A0=C2=A0 drm_sched_start_ex with an additional parameter to set
> =C2=A0=C2=A0=C2=A0 dma_fence_set_error, allowing us to handle the specifi=
c error
> =C2=A0=C2=A0=C2=A0 codes appropriately and dispose of bad jobs with the s=
elected
> =C2=A0=C2=A0=C2=A0 error code depending on whether it was a queue reset o=
r GPU
> reset.
> v4: Alex suggested using a new name,
> drm_sched_start_with_recovery_error,
> =C2=A0=C2=A0=C2=A0 which more accurately describes the function's purpose=
.
> =C2=A0=C2=A0=C2=A0 Additionally, it was recommended to add documentation =
details
> =C2=A0=C2=A0=C2=A0 about the new method.
> v5: Fixed declaration of new function
> drm_sched_start_with_recovery_error.(Alex)
> v6 (chk): rebase on upstream changes, cleanup the commit message,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drop the new funct=
ion again and update all callers,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apply the errno al=
so to scheduler fences with hw fences
>=20
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c | 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++--
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 2 +-
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 ++++---
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 2 +-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A011 files changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> index 2320df51c914..18135d8235f9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
> @@ -300,7 +300,7 @@ static int
> suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool sus
> =C2=A0=09=09=09if (r)
> =C2=A0=09=09=09=09goto out;
> =C2=A0=09=09} else {
> -=09=09=09drm_sched_start(&ring->sched);
> +=09=09=09drm_sched_start(&ring->sched, 0);
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 1cd7d355689c..5891312e44ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5879,7 +5879,7 @@ int amdgpu_device_gpu_recover(struct
> amdgpu_device *adev,
> =C2=A0=09=09=09if (!amdgpu_ring_sched_ready(ring))
> =C2=A0=09=09=09=09continue;
> =C2=A0
> -=09=09=09drm_sched_start(&ring->sched);
> +=09=09=09drm_sched_start(&ring->sched, 0);
> =C2=A0=09=09}
> =C2=A0
> =C2=A0=09=09if
> (!drm_drv_uses_atomic_modeset(adev_to_drm(tmp_adev)) &&
> !job_signaled)
> @@ -6374,7 +6374,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
> =C2=A0=09=09if (!amdgpu_ring_sched_ready(ring))
> =C2=A0=09=09=09continue;
> =C2=A0
> -=09=09drm_sched_start(&ring->sched);
> +=09=09drm_sched_start(&ring->sched, 0);
> =C2=A0=09}
> =C2=A0
> =C2=A0=09amdgpu_device_unset_mp1_state(adev);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> index ab9ca4824b62..23ced5896c7c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -72,7 +72,7 @@ static enum drm_gpu_sched_stat
> etnaviv_sched_timedout_job(struct drm_sched_job
> =C2=A0
> =C2=A0=09drm_sched_resubmit_jobs(&gpu->sched);
> =C2=A0
> -=09drm_sched_start(&gpu->sched);
> +=09drm_sched_start(&gpu->sched, 0);
> =C2=A0=09return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0
> =C2=A0out_no_timeout:
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> b/drivers/gpu/drm/imagination/pvr_queue.c
> index 20cb46012082..c4f08432882b 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -782,7 +782,7 @@ static void pvr_queue_start(struct pvr_queue
> *queue)
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> -=09drm_sched_start(&queue->scheduler);
> +=09drm_sched_start(&queue->scheduler, 0);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -842,7 +842,7 @@ pvr_queue_timedout_job(struct drm_sched_job
> *s_job)
> =C2=A0=09}
> =C2=A0=09mutex_unlock(&pvr_dev->queues.lock);
> =C2=A0
> -=09drm_sched_start(sched);
> +=09drm_sched_start(sched, 0);
> =C2=A0
> =C2=A0=09return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}
> diff --git a/drivers/gpu/drm/lima/lima_sched.c
> b/drivers/gpu/drm/lima/lima_sched.c
> index 1a944edb6ddc..b40c90e97d7e 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -463,7 +463,7 @@ static enum drm_gpu_sched_stat
> lima_sched_timedout_job(struct drm_sched_job *job
> =C2=A0=09lima_pm_idle(ldev);
> =C2=A0
> =C2=A0=09drm_sched_resubmit_jobs(&pipe->base);
> -=09drm_sched_start(&pipe->base);
> +=09drm_sched_start(&pipe->base, 0);
> =C2=A0
> =C2=A0=09return DRM_GPU_SCHED_STAT_NOMINAL;
> =C2=A0}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index eb6c3f9a01f5..4412f2711fb5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -379,7 +379,7 @@ nouveau_sched_timedout_job(struct drm_sched_job
> *sched_job)
> =C2=A0=09else
> =C2=A0=09=09NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
> =C2=A0
> -=09drm_sched_start(sched);
> +=09drm_sched_start(sched, 0);
> =C2=A0
> =C2=A0=09return stat;
> =C2=A0}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> b/drivers/gpu/drm/panfrost/panfrost_job.c
> index df49d37d0e7e..d140800606bf 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -727,7 +727,7 @@ panfrost_reset(struct panfrost_device *pfdev,
> =C2=A0
> =C2=A0=09/* Restart the schedulers */
> =C2=A0=09for (i =3D 0; i < NUM_JOB_SLOTS; i++)
> -=09=09drm_sched_start(&pfdev->js->queue[i].sched);
> +=09=09drm_sched_start(&pfdev->js->queue[i].sched, 0);
> =C2=A0
> =C2=A0=09/* Re-enable job interrupts now that everything has been
> restarted. */
> =C2=A0=09job_write(pfdev, JOB_INT_MASK,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> b/drivers/gpu/drm/panthor/panthor_mmu.c
> index d47972806d50..e630cdf47f99 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -827,7 +827,7 @@ static void panthor_vm_stop(struct panthor_vm
> *vm)
> =C2=A0
> =C2=A0static void panthor_vm_start(struct panthor_vm *vm)
> =C2=A0{
> -=09drm_sched_start(&vm->sched);
> +=09drm_sched_start(&vm->sched, 0);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index ab53ab486fe6..f093616fe53c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -674,9 +674,10 @@ EXPORT_SYMBOL(drm_sched_stop);
> =C2=A0 * drm_sched_start - recover jobs after a reset
> =C2=A0 *
> =C2=A0 * @sched: scheduler instance
> + * @errno: error to set on the pending fences
> =C2=A0 *
> =C2=A0 */
> -void drm_sched_start(struct drm_gpu_scheduler *sched)
> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno)
> =C2=A0{
> =C2=A0=09struct drm_sched_job *s_job, *tmp;
> =C2=A0
> @@ -691,13 +692,13 @@ void drm_sched_start(struct drm_gpu_scheduler
> *sched)
> =C2=A0=09=09atomic_add(s_job->credits, &sched->credit_count);
> =C2=A0
> =C2=A0=09=09if (!fence) {
> -=09=09=09drm_sched_job_done(s_job, -ECANCELED);
> +=09=09=09drm_sched_job_done(s_job, errno ?: -
> ECANCELED);
> =C2=A0=09=09=09continue;
> =C2=A0=09=09}
> =C2=A0
> =C2=A0=09=09if (dma_fence_add_callback(fence, &s_job->cb,
> =C2=A0=09=09=09=09=09=C2=A0=C2=A0 drm_sched_job_done_cb))
> -=09=09=09drm_sched_job_done(s_job, fence->error);
> +=09=09=09drm_sched_job_done(s_job, fence->error ?:
> errno);
> =C2=A0=09}
> =C2=A0
> =C2=A0=09drm_sched_start_timeout_unlocked(sched);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index fd29a00b233c..b6a89171824b 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -663,7 +663,7 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d,
> struct drm_sched_job *sched_job)
> =C2=A0
> =C2=A0=09/* Unblock schedulers and restart their jobs. */
> =C2=A0=09for (q =3D 0; q < V3D_MAX_QUEUES; q++) {
> -=09=09drm_sched_start(&v3d->queue[q].sched);
> +=09=09drm_sched_start(&v3d->queue[q].sched, 0);
> =C2=A0=09}
> =C2=A0
> =C2=A0=09mutex_unlock(&v3d->reset_lock);
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index fe8edb917360..a8d19b10f9b8 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -579,7 +579,7 @@ bool drm_sched_wqueue_ready(struct
> drm_gpu_scheduler *sched);
> =C2=A0void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
> =C2=A0void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
> =C2=A0void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
> drm_sched_job *bad);
> -void drm_sched_start(struct drm_gpu_scheduler *sched);
> +void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);

I personally only recently started using the scheduler and many things
were quite confusing.

In particular, I thought it's not good to call this function
drm_sched_start(), because that implies to new users / programmers that
this function is supposed to start the scheduler.

Accordingly, drm_sched_stop() sounds as if it's intended to be used on
scheduler teardown. "Alright, I'll stop the scheduler with
drm_sched_stop(), then can safely call drm_sched_entity_destroy() and
then tear it down completely through drm_sched_fini()".

Now the comments make it obvious that those start and stop functions
are more intended for error recovery.

So my stance is that start should be called, e.g., drm_sched_restart()
or perhaps drm_sched_recover_start().

So since you're already touching all the lines where the function is
used, this might be a good opportunity to improve the name, too.

If that's deemed desirable.

P.


> =C2=A0void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> =C2=A0void drm_sched_increase_karma(struct drm_sched_job *bad);
> =C2=A0void drm_sched_reset_karma(struct drm_sched_job *bad);

