Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CDA7125A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 09:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527B810E65C;
	Wed, 26 Mar 2025 08:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="nE5nNb8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BBC10E65C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 08:14:38 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ZN0206w5Hz9vqS;
 Wed, 26 Mar 2025 09:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1742976873; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yDJA3AFDro/Gd5EG3lHw9enC/cyhwBJuPgmUI1A4KUE=;
 b=nE5nNb8m8bZemKMCNX24G3Le0cffXoaY/iJvd1FWcLTn9VvjyezQ1jXVRvi1B0agxn8aki
 ROuIguCRba8UOmxbLRvhfHLUelFM7stYMXw1V8NzJZnR1cOxLknFzOC7aiEC5svGfDOcnO
 EoN1ZTzBPOvhvo3vssjN/1TWOZSIK3IIwHHTm6VdY3V0ByiL6f8OuH98+Xx/98Rc4l75Sg
 Hmshs9urgCo4E09TSqRbe40CR8wicQfnSmRuG/+wuoPO7iFpVPTQJd0vzjPKWN4hQYWc6d
 EwQjvSY/VSXOkzvi4+kpWRIMh8je9xyqRu2DN2YxwPkK4YUZwBYHU9YDVP0WpQ==
Message-ID: <8e636b5ec44b8b5d859a18a4a21ca95d74e45587.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Add return value for drm_sched_entity_push_job
From: Philipp Stanner <phasta@mailbox.org>
To: Qianyi Liu <liuqianyi125@gmail.com>, airlied@gmail.com, 
 ckoenig.leichtzumerken@gmail.com, dakr@kernel.org, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, matthew.brost@intel.com,
 mripard@kernel.org,  phasta@kernel.org, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 26 Mar 2025 09:14:28 +0100
In-Reply-To: <20250326070441.1515428-1-liuqianyi125@gmail.com>
References: <20250326070441.1515428-1-liuqianyi125@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: idg8pyi8xtpzbgx6zcuj4mk6zjejcrna
X-MBO-RS-ID: 1dd07560aa5f956bd1a
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

thanks for your patch

On Wed, 2025-03-26 at 15:04 +0800, Qianyi Liu wrote:
> Currently drm_sched_entity_push_job() has no return value to indicate
> operation status. This makes it difficult for callers to handle error
> conditions properly.
>=20
> Add a int return value to drm_sched_entity_push_job() that returns 0
> on
> success or a negative error code (e.g., -EINVAL) on failure. This
> allows
> callers to:
>=20
> 1. Detect when job submission fails
> 2. Perform proper cleanup (e.g., release job and fence allocations)
> 3. Avoid potential memory leaks in error paths
>=20
> Signed-off-by: Qianyi Liu <liuqianyi125@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 8 ++++++--
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A02 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index bd39db7bb240..f31964e76062 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -579,8 +579,10 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> =C2=A0 * fence sequence number this function should be called with
> drm_sched_job_arm()
> =C2=A0 * under common lock for the struct drm_sched_entity that was set u=
p
> for
> =C2=A0 * @sched_job in drm_sched_job_init().
> + *
> + * Returns 0 on success or a negative error code on failure.
> =C2=A0 */
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> +int drm_sched_entity_push_job(struct drm_sched_job *sched_job)

I am not convinced this is a justified change, because:
   1. The entity being dead is the only error that might occur
   2. That error is extremely unlikely
   3. It does not occur in all existing upstream drivers
   4. Drivers typically first prevent userspace from pushing stuff to
      an entity, then tear the entity down, then (in case of firmware
      schedulers) tear the entire scheduler down.
   5. Your patch doesn't add an upstream user for the error code,
      showing how it's better / different from how existing drivers
      handle their entity-pushing.

Thus, pushing to a killed entity is a gross misdesign of the driver,
which should become visible during development and can't be handled
during runtime in a reasonable manner.

P.

> =C2=A0{
> =C2=A0 struct drm_sched_entity *entity =3D sched_job->entity;
> =C2=A0 bool first;
> @@ -609,7 +611,7 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0 spin_unlock(&entity->lock);
> =C2=A0
> =C2=A0 DRM_ERROR("Trying to push to a killed entity\n");
> - return;
> + return -EINVAL;
> =C2=A0 }
> =C2=A0
> =C2=A0 rq =3D entity->rq;
> @@ -626,5 +628,7 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> =C2=A0
> =C2=A0 drm_sched_wakeup(sched);
> =C2=A0 }
> +
> + return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_entity_push_job);
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 50928a7ae98e..48a263571bab 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -589,7 +589,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_entity *enti=
ty,
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 credits, void *owner);
> =C2=A0void drm_sched_job_arm(struct drm_sched_job *job);
> -void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> +int drm_sched_entity_push_job(struct drm_sched_job *sched_job);
> =C2=A0int drm_sched_job_add_dependency(struct drm_sched_job *job,
> =C2=A0 struct dma_fence *fence);
> =C2=A0int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

