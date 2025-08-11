Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB84B20191
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 10:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37C810E083;
	Mon, 11 Aug 2025 08:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="TeB8pNAa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D7A410E083
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 08:18:24 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c0nZh5tVgz9t2j;
 Mon, 11 Aug 2025 10:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1754900300; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XOK6/dKxx6oD3WrpXy0CXeEs0i50/K2mbos99xxJAOA=;
 b=TeB8pNAapFRC7Px6H+AozOZtoeVKhdOT3/A5C7BWScEUjOGw7FbTQC5Q/1fv+TvMqneLol
 BOc+w213TpBmxrSvQtjoVzyRB1wFCTGItUYDYBhKQ1bQRuB80uJbuVLGXtl9SyQS5VZw9U
 k4TlADenUoyTYRXXTd88+OwF56aq/1mIDF4Wbv2AX74nyhl76l0jbL/ruqk/MYZrB+9lce
 LgzLVzZfbb1Dzt2k12UShW6HfupiDnxPmWQnbJYXs4OxfEsCkof4ZPBECIJPB7RHrU5rUY
 b4g4NmlVwOzL3kvHESYaiJQ8LAbHkHg8t2+8pHbMj4vvTCa1e347bNiOxvH02w==
Message-ID: <3aa7b54d9acb0467a253c9bc993552f7f109f6aa.camel@mailbox.org>
Subject: Re: [PATCH] drm/amdgpu: fix task hang from failed job submission
 during process kill
From: Philipp Stanner <phasta@mailbox.org>
To: Liu01 Tong <Tong.Liu01@amd.com>, dri-devel@lists.freedesktop.org
Cc: phasta@kernel.org, dakr@kernel.org, matthew.brost@intel.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, gang.ba@amd.com,
 matthew.schwartz@linux.dev,  lin.cao@amd.com, "Lin . Cao"
 <lincao12@amd.com>, dakr@kernel.org, Matthew Brost <matthew.brost@intel.com>
Date: Mon, 11 Aug 2025 10:18:15 +0200
In-Reply-To: <20250811072050.3838241-1-Tong.Liu01@amd.com>
References: <20250811072050.3838241-1-Tong.Liu01@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: wbesxfm7g7p1o1scg1eobczr6axj1xda
X-MBO-RS-ID: 804a55dc9b15ab2b848
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

Hi,

title: this patch changes nothing in amdgpu.

Thus, the prefix must be drm/sched: Fix [=E2=80=A6]


Furthermore, please use scripts/get_maintainer. A few relevant folks
are missing. +Cc Danilo, Matthew


On Mon, 2025-08-11 at 15:20 +0800, Liu01 Tong wrote:
> During process kill, drm_sched_entity_flush() will kill the vm
> entities.
>=20

What is a "vm entity"? This seems to be driver-specific language.


>  The following job submissions of this process will fail, and
> the resources of these jobs have not been released, nor have the fences
> been signalled, causing tasks to hang.
>=20
> Fix by not doing job init when the entity is stopped. And when the job
> is already submitted, free the job resource if the entity is stopped.

I'm not sure I can fully follow. Can you give more details on why that
bug doesn't always occur?

In general: Why is this something that needs to be fixed in the
scheduler? amdgpu knows when it killed an entity. Why can't it stop
submitting thereafter?

>=20
> Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
> Signed-off-by: Lin.Cao <lincao12@amd.com>

Two authors? AFAIK should contain a Co-authored-by tag then.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++------
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 |=C2=A0 5 +++++
> =C2=A02 files changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index ac678de7fe5e..1e744b2eb2db 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -570,6 +570,13 @@ void drm_sched_entity_push_job(struct drm_sched_job =
*sched_job)
> =C2=A0	bool first;
> =C2=A0	ktime_t submit_ts;
> =C2=A0
> +	if (entity->stopped) {

This screams "race!" because you're checking for the entity being
stopped now without the lock, as was done before.

That's definitely a no-go because that has caused big trouble and the
past and is still causing trouble right now at other places where the
lock was not taken:

https://lore.kernel.org/dri-devel/20250731093008.45267-2-phasta@kernel.org/


> +		DRM_ERROR("Trying to push job to a killed entity\n");
> +		INIT_WORK(&sched_job->work, drm_sched_entity_kill_jobs_work);
> +		schedule_work(&sched_job->work);
> +		return;
> +	}
> +
> =C2=A0	trace_drm_sched_job(sched_job, entity);
> =C2=A0	atomic_inc(entity->rq->sched->score);
> =C2=A0	WRITE_ONCE(entity->last_user, current->group_leader);
> @@ -589,12 +596,6 @@ void drm_sched_entity_push_job(struct drm_sched_job =
*sched_job)
> =C2=A0
> =C2=A0		/* Add the entity to the run queue */
> =C2=A0		spin_lock(&entity->lock);
> -		if (entity->stopped) {
> -			spin_unlock(&entity->lock);
> -
> -			DRM_ERROR("Trying to push to a killed entity\n");
> -			return;
> -		}
> =C2=A0
> =C2=A0		rq =3D entity->rq;
> =C2=A0		sched =3D rq->sched;
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index bfea608a7106..c15b17d9ffe3 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -795,6 +795,11 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0		return -ENOENT;
> =C2=A0	}
> =C2=A0
> +	if (unlikely(entity->stopped)) {
> +		pr_err("*ERROR* %s: entity is stopped!\n", __func__);
> +		return -EINVAL;
> +	}

Same here, racy.


Regards,
Philipp

> +
> =C2=A0	if (unlikely(!credits)) {
> =C2=A0		pr_err("*ERROR* %s: credits cannot be 0!\n", __func__);
> =C2=A0		return -EINVAL;

