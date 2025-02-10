Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 193EFA2ED3B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC3E10E523;
	Mon, 10 Feb 2025 13:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nZ3bRND1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773810E523
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739192935;
 bh=MfQty2qrQTi8a54QC8J/NxJbBWw8bzpg0pVBDnJN5eM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nZ3bRND1I4+3/opv27tOoYFzJ/VoXv8B+J1p3TITK51fcAdH3IconFNtyHIbpE7jG
 mgoiMD5oV1ElaudEze7939XauKfbkvDMEJNiJ1zgTY1s6czlu8Pdkl+38mBI7PT+V/
 7nsiPn+dUKKDpaYsWeOGS5IacK1RyUr60a9hwvVNPOLLvUNxUL8fWnkjdORKswFa1U
 JoAe+PmTIEjCwAZCVud2TFMnmu7cipdqL337Do0lTl9pq65itzjZgcXB5lPutn4ikW
 ZoOQ3csYPCMthYcg1Uy4ALv8z8t8U9GOfrvkjyaqhvuu9LW+xeezLcI6/0gLy6tVvh
 5k6WGzoZnRvVA==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7873917E014F;
 Mon, 10 Feb 2025 14:08:54 +0100 (CET)
Date: Mon, 10 Feb 2025 14:08:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panthor: Replace sleep locks with spinlocks in
 fdinfo path
Message-ID: <20250210140849.77232318@collabora.com>
In-Reply-To: <20250210124203.124191-1-adrian.larumbe@collabora.com>
References: <20250210124203.124191-1-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Mon, 10 Feb 2025 12:41:59 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Panthor's fdinfo handler is routed through the /proc file system, which
> executes in an atomic context. That means we cannot use mutexes because
> they might sleep.
>=20
> This bug was uncovered by enabling some of the kernel's mutex-debugging
> features:
>=20
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
>=20
> Replace Panthor's group fdinfo data mutex with a guarded spinlock.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 26 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 0b93bf83a9b2..7a267d1efeb6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -9,6 +9,7 @@
>  #include <drm/panthor_drm.h>
> =20
>  #include <linux/build_bug.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -631,10 +632,10 @@ struct panthor_group {
>  		struct panthor_gpu_usage data;
> =20
>  		/**
> -		 * @lock: Mutex to govern concurrent access from drm file's fdinfo cal=
lback
> -		 * and job post-completion processing function
> +		 * @fdinfo.lock: Spinlock to govern concurrent access from drm file's =
fdinfo
> +		 * callback and job post-completion processing function
>  		 */
> -		struct mutex lock;
> +		spinlock_t lock;
> =20
>  		/** @fdinfo.kbo_sizes: Aggregate size of private kernel BO's held by t=
he group. */
>  		size_t kbo_sizes;
> @@ -910,8 +911,6 @@ static void group_release_work(struct work_struct *wo=
rk)
>  						   release_work);
>  	u32 i;
> =20
> -	mutex_destroy(&group->fdinfo.lock);
> -
>  	for (i =3D 0; i < group->queue_count; i++)
>  		group_free_queue(group, group->queues[i]);
> =20
> @@ -2861,12 +2860,12 @@ static void update_fdinfo_stats(struct panthor_jo=
b *job)
>  	struct panthor_job_profiling_data *slots =3D queue->profiling.slots->km=
ap;
>  	struct panthor_job_profiling_data *data =3D &slots[job->profiling.slot];
> =20
> -	mutex_lock(&group->fdinfo.lock);
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> -		fdinfo->cycles +=3D data->cycles.after - data->cycles.before;
> -	if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> -		fdinfo->time +=3D data->time.after - data->time.before;
> -	mutex_unlock(&group->fdinfo.lock);
> +	scoped_guard(spinlock, &group->fdinfo.lock) {
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_CYCLES)
> +			fdinfo->cycles +=3D data->cycles.after - data->cycles.before;
> +		if (job->profiling.mask & PANTHOR_DEVICE_PROFILING_TIMESTAMP)
> +			fdinfo->time +=3D data->time.after - data->time.before;
> +	}
>  }
> =20
>  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
> @@ -2880,12 +2879,11 @@ void panthor_fdinfo_gather_group_samples(struct p=
anthor_file *pfile)
> =20
>  	xa_lock(&gpool->xa);
>  	xa_for_each(&gpool->xa, i, group) {
> -		mutex_lock(&group->fdinfo.lock);
> +		guard(spinlock)(&group->fdinfo.lock);
>  		pfile->stats.cycles +=3D group->fdinfo.data.cycles;
>  		pfile->stats.time +=3D group->fdinfo.data.time;
>  		group->fdinfo.data.cycles =3D 0;
>  		group->fdinfo.data.time =3D 0;
> -		mutex_unlock(&group->fdinfo.lock);
>  	}
>  	xa_unlock(&gpool->xa);
>  }
> @@ -3531,7 +3529,7 @@ int panthor_group_create(struct panthor_file *pfile,
>  	mutex_unlock(&sched->reset.lock);
> =20
>  	add_group_kbo_sizes(group->ptdev, group);
> -	mutex_init(&group->fdinfo.lock);
> +	spin_lock_init(&group->fdinfo.lock);
> =20
>  	return gid;
> =20
>=20
> base-commit: 2eca617f12586abff62038db1c14cb3aa60a15aa
> prerequisite-patch-id: 7e787ce5973b5fc7e9f69f26aa4d7e5ec03d5caa
> prerequisite-patch-id: 03a619b8c741444b28435850e23d9ec463171c13
> prerequisite-patch-id: 290e1053f8bf4a8b80fb037a87cae7e096b5aa96
> prerequisite-patch-id: bc49bb8c29905650fb4788acc528bb44013c0240
> prerequisite-patch-id: 46cab4c980824c03e5164afc43085fec23e1cba5

