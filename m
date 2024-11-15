Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7039CE4EF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA2D10E877;
	Fri, 15 Nov 2024 14:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="K7B5bBoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25E510E877
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731682599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WV9W3zg5d83iQZ45Rf4XhMQla7+WYNm1GGVbj+zgyVk=;
 b=K7B5bBoVFNC99d+Y3cXFl91w+mNVj9kNkim29gbz9GfXH5jMyVI65WzGjlmLSk6fYFksbM
 R0B776uRnIVTk60yQeukyCK/1rRdaJz3MnL6uUN1AnLsjr6dmgRaPpHefiGdhwoFgEUO2C
 dHhfeil2QD8pcgZlCtDyl9lBuzIPkBs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-MceomZzqOgO6w0PNLwwgqw-1; Fri, 15 Nov 2024 09:56:38 -0500
X-MC-Unique: MceomZzqOgO6w0PNLwwgqw-1
X-Mimecast-MFC-AGG-ID: MceomZzqOgO6w0PNLwwgqw
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-53a0b48e8d4so1570467e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 06:56:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731682597; x=1732287397;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=N8EjXKxXbGMJix7s+6p8u6BtlRQrjZ54NaumohMNvYE=;
 b=EhR6Q8Vj1LHmzgT54FC4InzQcYxYNy480mguuPaehHg3V0UFzUlz6UKiIH5ZTgNGwk
 CEYMNhmQcRxtFhMq0FTdgDfCiBWeGmwmNqNKMUMKmx41CdfHKYexrVjB4PCPhm+D7PNQ
 gRRUo3QVRxHjrsdHEsUuHPMa0yM1R8PI3nK6SSerArwopHAjxxrQ/BHFYvRehOnjF4hs
 afBJgp0q6ssSmzlf3rk1ZRvUziZNPZp2/QqFlTNWp781lypllHBOV9HKT2jFaOtWFUEE
 YCURgm1VRrIdDQdY40QwzM/nNZbXs9t4i869kxsEo9VsnpDGvJJTZzVutEi+O8PO3UPJ
 yP+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXadU1L45doJ4ZFfVg06psxnjpvM5WvkVxhGzb3GnkJkRIS3cGPF+VHJqPC2JK7pHW/OATqfSOlWn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNMKfM9PPLcD/4+lUzY1hcQat428m+XgW5T9uTOuDxuSoeRWhn
 sMZFDYkZC3TrhzY5l/o6mCHI9Prl0zjWiiI1uNECZ+BIAN710engO7PohOV9NqoMQ9RS5mHE5st
 Oev8zA2Apdj0igaUURhw5QSaYOtYsqerEhvLcpsj8CwsDEhzFJgF500jmnV0SS/yTGg==
X-Received: by 2002:a05:6512:3d24:b0:53d:a132:c68f with SMTP id
 2adb3069b0e04-53dab3bec99mr1583267e87.47.1731682596519; 
 Fri, 15 Nov 2024 06:56:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+zFmotz+MlEN4GZN4pF7e07WJFbVbZIzLfXNp9WdPCOyI9QnvGs2U0zbQ1oiu9byKR1XIKA==
X-Received: by 2002:a05:6512:3d24:b0:53d:a132:c68f with SMTP id
 2adb3069b0e04-53dab3bec99mr1583237e87.47.1731682595913; 
 Fri, 15 Nov 2024 06:56:35 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432dac0aef0sm57114685e9.28.2024.11.15.06.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:56:35 -0800 (PST)
Message-ID: <62a641970c2afda37f5850d5b532c21c1d147a49.camel@redhat.com>
Subject: Re: [PATCH v6 2/7] drm/sched: store the drm client_id in
 drm_sched_fence
From: Philipp Stanner <pstanner@redhat.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, ltuikov89@gmail.com, 
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,  tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch,  dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com,  rostedt@goodmis.org,
 l.stach@pengutronix.de, matt.coster@imgtec.com,  frank.binns@imgtec.com,
 yuq825@gmail.com, robdclark@gmail.com, kherbst@redhat.com, 
 lyude@redhat.com, boris.brezillon@collabora.com, steven.price@arm.com, 
 mwen@igalia.com, mcanal@igalia.com, thomas.hellstrom@linux.intel.com, 
 tvrtko.ursulin@igalia.com
Date: Fri, 15 Nov 2024 15:56:34 +0100
In-Reply-To: <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PY4kIVtW9TA-6WcD1ECk5U8AnAA3sLWFXcZ83YKGc64_1731682597
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

On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
> This will be used in a later commit to trace the drm client_id in
> some of the gpu_scheduler trace events.

I think this commit message should detail what the patch is actual
intended to do.

Especially, it should mention that several drivers are being touched.

Some other comments below

>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer
> <pierre-eric.pelloux-prayer@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 8 +++++---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 5 +++--
> =C2=A0drivers/gpu/drm/imagination/pvr_queue.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/lima/lima_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 6 ++++--
> =C2=A0drivers/gpu/drm/lima/lima_sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/msm/msm_gem_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +++++---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ++-
> =C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 +++-
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 6 ++++--
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_sched_job.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++=
++++--
> =C2=A019 files changed, 51 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index b545940e512b..eede43701d51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -681,7 +681,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device
> *adev,
> =C2=A0=09=09goto err;
> =C2=A0=09}
> =C2=A0
> -=09ret =3D amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
> +=09ret =3D amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job, 0);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto err;
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 98aa4beee36a..a0a129405323 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -293,7 +293,8 @@ static int amdgpu_cs_pass1(struct
> amdgpu_cs_parser *p,
> =C2=A0
> =C2=A0=09for (i =3D 0; i < p->gang_size; ++i) {
> =C2=A0=09=09ret =3D amdgpu_job_alloc(p->adev, vm, p->entities[i],
> vm,
> -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_ibs[i], &p->jobs[i]=
);
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_ibs[i], &p->jobs[i]=
,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->filp->client_id);
> =C2=A0=09=09if (ret)
> =C2=A0=09=09=09goto free_all_kdata;
> =C2=A0=09=09p->jobs[i]->enforce_isolation =3D p->adev-
> >enforce_isolation[fpriv->xcp_id];
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index c774cd019a10..1dd8e940d1e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -186,7 +186,8 @@ static enum drm_gpu_sched_stat
> amdgpu_job_timedout(struct drm_sched_job *s_job)
> =C2=A0
> =C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
> *vm,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity, voi=
d *owner,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_ibs, struct amdgpu_job *=
*job)
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_ibs, struct amdgpu_job *=
*job,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t drm_client_id)

You can take the short cut and use u64 instead of uint64_t. Easier to
type for you and more congruent with the other code (in the kernel).


> =C2=A0{
> =C2=A0=09if (num_ibs =3D=3D 0)
> =C2=A0=09=09return -EINVAL;
> @@ -209,7 +210,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev,
> struct amdgpu_vm *vm,
> =C2=A0=09if (!entity)
> =C2=A0=09=09return 0;
> =C2=A0
> -=09return drm_sched_job_init(&(*job)->base, entity, 1, owner);
> +=09return drm_sched_job_init(&(*job)->base, entity, 1, owner,
> +=09=09=09=09=C2=A0 drm_client_id);
> =C2=A0}
> =C2=A0
> =C2=A0int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> @@ -219,7 +221,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device
> *adev,
> =C2=A0{
> =C2=A0=09int r;
> =C2=A0
> -=09r =3D amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
> +=09r =3D amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
> =C2=A0=09if (r)
> =C2=A0=09=09return r;
> =C2=A0
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index ce6b9ba967ff..41a03477ba5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -90,7 +90,8 @@ static inline struct amdgpu_ring
> *amdgpu_job_ring(struct amdgpu_job *job)
> =C2=A0
> =C2=A0int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
> *vm,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity, voi=
d *owner,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_ibs, struct amdgpu_job *=
*job);
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int num_ibs, struct amdgpu_job *=
*job,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t drm_client_id);

same

> =C2=A0int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *entity, =
void
> *owner,
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 size_t size, enum amdgpu_ib_pool_=
type
> pool_type,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> index 3d0f8d182506..70294ca6202f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
> @@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device
> *dev, void *data,
> =C2=A0
> =C2=A0=09ret =3D drm_sched_job_init(&submit->sched_job,
> =C2=A0=09=09=09=09 &ctx->sched_entity[args->pipe],
> -=09=09=09=09 1, submit->ctx);
> +=09=09=09=09 1, submit->ctx, file->client_id);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto err_submit_put;
> =C2=A0
> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
> b/drivers/gpu/drm/imagination/pvr_job.c
> index 618503a212a7..64152b57e8b1 100644
> --- a/drivers/gpu/drm/imagination/pvr_job.c
> +++ b/drivers/gpu/drm/imagination/pvr_job.c
> @@ -446,7 +446,7 @@ create_job(struct pvr_device *pvr_dev,
> =C2=A0=09if (err)
> =C2=A0=09=09goto err_put_job;
> =C2=A0
> -=09err =3D pvr_queue_job_init(job);
> +=09err =3D pvr_queue_job_init(job, pvr_file->file->client_id);
> =C2=A0=09if (err)
> =C2=A0=09=09goto err_put_job;
> =C2=A0
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> b/drivers/gpu/drm/imagination/pvr_queue.c
> index c4f08432882b..598180fca141 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.c
> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> @@ -1059,6 +1059,7 @@ static int pvr_queue_cleanup_fw_context(struct
> pvr_queue *queue)
> =C2=A0/**
> =C2=A0 * pvr_queue_job_init() - Initialize queue related fields in a
> pvr_job object.
> =C2=A0 * @job: The job to initialize.
> + * @drm_client_id: drm_file.client_id submitting the job
> =C2=A0 *
> =C2=A0 * Bind the job to a queue and allocate memory to guarantee
> pvr_queue_job_arm()
> =C2=A0 * and pvr_queue_job_push() can't fail. We also make sure the
> context type is
> @@ -1068,7 +1069,7 @@ static int pvr_queue_cleanup_fw_context(struct
> pvr_queue *queue)
> =C2=A0 *=C2=A0 * 0 on success, or
> =C2=A0 *=C2=A0 * An error code if something failed.
> =C2=A0 */
> -int pvr_queue_job_init(struct pvr_job *job)
> +int pvr_queue_job_init(struct pvr_job *job, uint64_t drm_client_id)

same

> =C2=A0{
> =C2=A0=09/* Fragment jobs need at least one native fence wait on the
> geometry job fence. */
> =C2=A0=09u32 min_native_dep_count =3D job->type =3D=3D
> DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
> @@ -1085,7 +1086,7 @@ int pvr_queue_job_init(struct pvr_job *job)
> =C2=A0=09if (!pvr_cccb_cmdseq_can_fit(&queue->cccb,
> job_cmds_size(job, min_native_dep_count)))
> =C2=A0=09=09return -E2BIG;
> =C2=A0
> -=09err =3D drm_sched_job_init(&job->base, &queue->entity, 1,
> THIS_MODULE);
> +=09err =3D drm_sched_job_init(&job->base, &queue->entity, 1,
> THIS_MODULE, drm_client_id);
> =C2=A0=09if (err)
> =C2=A0=09=09return err;
> =C2=A0
> diff --git a/drivers/gpu/drm/imagination/pvr_queue.h
> b/drivers/gpu/drm/imagination/pvr_queue.h
> index e06ced69302f..bc556169b2cf 100644
> --- a/drivers/gpu/drm/imagination/pvr_queue.h
> +++ b/drivers/gpu/drm/imagination/pvr_queue.h
> @@ -139,7 +139,7 @@ struct pvr_queue {
> =C2=A0
> =C2=A0bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
> =C2=A0
> -int pvr_queue_job_init(struct pvr_job *job);
> +int pvr_queue_job_init(struct pvr_job *job, uint64_t drm_client_id);

Same. Probably applies to the other patches, too.

> =C2=A0
> =C2=A0void pvr_queue_job_cleanup(struct pvr_job *job);
> =C2=A0
> diff --git a/drivers/gpu/drm/lima/lima_gem.c
> b/drivers/gpu/drm/lima/lima_gem.c
> index 9bb997dbb4b9..f46f961afc56 100644
> --- a/drivers/gpu/drm/lima/lima_gem.c
> +++ b/drivers/gpu/drm/lima/lima_gem.c
> @@ -341,7 +341,7 @@ int lima_gem_submit(struct drm_file *file, struct
> lima_submit *submit)
> =C2=A0
> =C2=A0=09err =3D lima_sched_task_init(
> =C2=A0=09=09submit->task, submit->ctx->context + submit->pipe,
> -=09=09bos, submit->nr_bos, vm);
> +=09=09bos, submit->nr_bos, vm, file->client_id);
> =C2=A0=09if (err)
> =C2=A0=09=09goto err_out1;
> =C2=A0
> diff --git a/drivers/gpu/drm/lima/lima_sched.c
> b/drivers/gpu/drm/lima/lima_sched.c
> index b40c90e97d7e..84599549661a 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -113,7 +113,8 @@ static inline struct lima_sched_pipe
> *to_lima_pipe(struct drm_gpu_scheduler *sch
> =C2=A0int lima_sched_task_init(struct lima_sched_task *task,
> =C2=A0=09=09=09 struct lima_sched_context *context,
> =C2=A0=09=09=09 struct lima_bo **bos, int num_bos,
> -=09=09=09 struct lima_vm *vm)
> +=09=09=09 struct lima_vm *vm,
> +=09=09=09 uint64_t drm_client_id)
> =C2=A0{
> =C2=A0=09int err, i;
> =C2=A0
> @@ -124,7 +125,8 @@ int lima_sched_task_init(struct lima_sched_task
> *task,
> =C2=A0=09for (i =3D 0; i < num_bos; i++)
> =C2=A0=09=09drm_gem_object_get(&bos[i]->base.base);
> =C2=A0
> -=09err =3D drm_sched_job_init(&task->base, &context->base, 1,
> vm);
> +=09err =3D drm_sched_job_init(&task->base, &context->base, 1, vm,
> +=09=09=09=09 drm_client_id);
> =C2=A0=09if (err) {
> =C2=A0=09=09kfree(task->bos);
> =C2=A0=09=09return err;
> diff --git a/drivers/gpu/drm/lima/lima_sched.h
> b/drivers/gpu/drm/lima/lima_sched.h
> index 85b23ba901d5..4041468586bd 100644
> --- a/drivers/gpu/drm/lima/lima_sched.h
> +++ b/drivers/gpu/drm/lima/lima_sched.h
> @@ -88,7 +88,8 @@ struct lima_sched_pipe {
> =C2=A0int lima_sched_task_init(struct lima_sched_task *task,
> =C2=A0=09=09=09 struct lima_sched_context *context,
> =C2=A0=09=09=09 struct lima_bo **bos, int num_bos,
> -=09=09=09 struct lima_vm *vm);
> +=09=09=09 struct lima_vm *vm,
> +=09=09=09 uint64_t drm_client_id);
> =C2=A0void lima_sched_task_fini(struct lima_sched_task *task);
> =C2=A0
> =C2=A0int lima_sched_context_init(struct lima_sched_pipe *pipe,
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
> b/drivers/gpu/drm/msm/msm_gem_submit.c
> index fba78193127d..ceeedd4186ef 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -30,7 +30,7 @@
> =C2=A0static struct msm_gem_submit *submit_create(struct drm_device *dev,
> =C2=A0=09=09struct msm_gpu *gpu,
> =C2=A0=09=09struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
> -=09=09uint32_t nr_cmds)
> +=09=09uint32_t nr_cmds, uint64_t drm_client_id)
> =C2=A0{
> =C2=A0=09static atomic_t ident =3D ATOMIC_INIT(0);
> =C2=A0=09struct msm_gem_submit *submit;
> @@ -54,7 +54,8 @@ static struct msm_gem_submit *submit_create(struct
> drm_device *dev,
> =C2=A0=09=09return ERR_PTR(ret);
> =C2=A0=09}
> =C2=A0
> -=09ret =3D drm_sched_job_init(&submit->base, queue->entity, 1,
> queue);
> +=09ret =3D drm_sched_job_init(&submit->base, queue->entity, 1,
> queue,
> +=09=09=09=09 drm_client_id);
> =C2=A0=09if (ret) {
> =C2=A0=09=09kfree(submit->hw_fence);
> =C2=A0=09=09kfree(submit);
> @@ -702,7 +703,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev,
> void *data,
> =C2=A0=09=09}
> =C2=A0=09}
> =C2=A0
> -=09submit =3D submit_create(dev, gpu, queue, args->nr_bos, args-
> >nr_cmds);
> +=09submit =3D submit_create(dev, gpu, queue, args->nr_bos, args-
> >nr_cmds,
> +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file->client_id);
> =C2=A0=09if (IS_ERR(submit)) {
> =C2=A0=09=09ret =3D PTR_ERR(submit);
> =C2=A0=09=09goto out_post_unlock;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 4412f2711fb5..ebc31adea39a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -87,7 +87,8 @@ nouveau_job_init(struct nouveau_job *job,
> =C2=A0=09}
> =C2=A0
> =C2=A0=09ret =3D drm_sched_job_init(&job->base, &sched->entity,
> -=09=09=09=09 args->credits, NULL);
> +=09=09=09=09 args->credits, NULL,
> +=09=09=09=09 job->file_priv->client_id);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto err_free_chains;
> =C2=A0
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
> b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 04d615df5259..a8135bd75cae 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct
> drm_device *dev, void *data,
> =C2=A0
> =C2=A0=09ret =3D drm_sched_job_init(&job->base,
> =C2=A0=09=09=09=09 &file_priv->sched_entity[slot],
> -=09=09=09=09 1, NULL);
> +=09=09=09=09 1, NULL, file->client_id);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto out_put_job;
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
> b/drivers/gpu/drm/scheduler/sched_fence.c
> index 0f35f009b9d3..909b886cd379 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -204,7 +204,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct
> dma_fence *f)
> =C2=A0EXPORT_SYMBOL(to_drm_sched_fence);
> =C2=A0
> =C2=A0struct drm_sched_fence *drm_sched_fence_alloc(struct
> drm_sched_entity *entity,
> -=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *owner)
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *owner,
> +=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t
> drm_client_id)
> =C2=A0{
> =C2=A0=09struct drm_sched_fence *fence =3D NULL;
> =C2=A0
> @@ -213,6 +214,7 @@ struct drm_sched_fence
> *drm_sched_fence_alloc(struct drm_sched_entity *entity,
> =C2=A0=09=09return NULL;
> =C2=A0
> =C2=A0=09fence->owner =3D owner;
> +=09fence->drm_client_id =3D drm_client_id;
> =C2=A0=09spin_lock_init(&fence->lock);
> =C2=A0
> =C2=A0=09return fence;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 7ce25281c74c..28ac709750e9 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -776,6 +776,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> =C2=A0 * @credits: the number of credits this job contributes to the
> schedulers
> =C2=A0 * credit limit
> =C2=A0 * @owner: job owner for debugging
> + * @drm_client_id: drm_file.client_id of the owner
> =C2=A0 *
> =C2=A0 * Refer to drm_sched_entity_push_job() documentation
> =C2=A0 * for locking considerations.
> @@ -796,7 +797,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> =C2=A0 */
> =C2=A0int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity =
*entity,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner)
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t drm_client_id)
> =C2=A0{
> =C2=A0=09if (!entity->rq) {
> =C2=A0=09=09/* This will most likely be followed by missing
> frames
> @@ -822,7 +824,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0
> =C2=A0=09job->entity =3D entity;
> =C2=A0=09job->credits =3D credits;
> -=09job->s_fence =3D drm_sched_fence_alloc(entity, owner);
> +=09job->s_fence =3D drm_sched_fence_alloc(entity, owner,
> drm_client_id);
> =C2=A0=09if (!job->s_fence)
> =C2=A0=09=09return -ENOMEM;
> =C2=A0
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
> b/drivers/gpu/drm/v3d/v3d_submit.c
> index d607aa9c4ec2..a086da31f441 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -168,7 +168,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file
> *file_priv,
> =C2=A0=09job->file =3D file_priv;
> =C2=A0
> =C2=A0=09ret =3D drm_sched_job_init(&job->base, &v3d_priv-
> >sched_entity[queue],
> -=09=09=09=09 1, v3d_priv);
> +=09=09=09=09 1, v3d_priv, file_priv->client_id);
> =C2=A0=09if (ret)
> =C2=A0=09=09return ret;
> =C2=A0
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> b/drivers/gpu/drm/xe/xe_sched_job.c
> index eeccc1c318ae..6617555e7a51 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct
> xe_exec_queue *q,
> =C2=A0=09kref_init(&job->refcount);
> =C2=A0=09xe_exec_queue_get(job->q);
> =C2=A0
> -=09err =3D drm_sched_job_init(&job->drm, q->entity, 1, NULL);
> +=09err =3D drm_sched_job_init(&job->drm, q->entity, 1, NULL,
> +=09=09=09=09 q->xef->drm->client_id);
> =C2=A0=09if (err)
> =C2=A0=09=09goto err_free;
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 95e17504e46a..42c381449443 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -311,6 +311,13 @@ struct drm_sched_fence {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @owner: job owne=
r for debugging
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> =C2=A0=09void=09=09=09=09*owner;
> +
> +=09/**
> +=09 * @drm_client_id:
> +=09 *
> +=09 * The client_id of the drm_file who owned the job.

s/who owned/which owns


Thx,
P.


> +=09 */
> +=09uint64_t=09=09=09drm_client_id;
> =C2=A0};
> =C2=A0
> =C2=A0struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
> @@ -563,7 +570,8 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched,
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched);
> =C2=A0int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity =
*entity,
> -=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner);
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t drm_client_id);
> =C2=A0void drm_sched_job_arm(struct drm_sched_job *job);
> =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *job,
> =C2=A0=09=09=09=09 struct dma_fence *fence);
> @@ -624,7 +632,7 @@ bool drm_sched_entity_is_ready(struct
> drm_sched_entity *entity);
> =C2=A0int drm_sched_entity_error(struct drm_sched_entity *entity);
> =C2=A0
> =C2=A0struct drm_sched_fence *drm_sched_fence_alloc(
> -=09struct drm_sched_entity *s_entity, void *owner);
> +=09struct drm_sched_entity *s_entity, void *owner, uint64_t
> drm_client_id);
> =C2=A0void drm_sched_fence_init(struct drm_sched_fence *fence,
> =C2=A0=09=09=09=C2=A0 struct drm_sched_entity *entity);
> =C2=A0void drm_sched_fence_free(struct drm_sched_fence *fence);

