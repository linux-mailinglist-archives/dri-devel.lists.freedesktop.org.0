Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A999C13C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366D10E3A1;
	Mon, 14 Oct 2024 07:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="R73QQi6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F1710E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728890829;
 bh=AV5GzsU1/P60BWtmrIaHzjkP3KanKsoJ9sqwKIlKnHc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R73QQi6lccAGSymlMmfW/c+DElC5NNykdPkzCXkRdgs7CakOJqn+B4uHjdk2vGEH8
 HDRaS1DSHTZC24bnXEE7nPPzDtUhZt/5ywJ9aBDFziSWcrwkH0alEudHUyvHVJhxHy
 Ed0SSxy6WljpBng/ITTPwKM9Qszw1ftT7DFE9qBYQQrRbX0EaFWALtNrlTYBOJVNYQ
 hLFrRHsDl+7FmS7+ZyWDVUYaNzileZHdGfy+RIUMK1ic6WufRjs7nJ2oArrIvGfDr1
 1LjkNUNg/Ks16vY4zFWI+dV5PptPUZyb2JDCnkZgBARewlZaqjK9WlN+JXtXsCFUzw
 CaTfJF/RIy0+w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4731B17E10A4;
 Mon, 14 Oct 2024 09:27:09 +0200 (CEST)
Date: Mon, 14 Oct 2024 09:27:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/panthor: Rreset device and load FW after failed
 PM suspend
Message-ID: <20241014092704.50a21276@collabora.com>
In-Reply-To: <20241011225906.3789965-3-adrian.larumbe@collabora.com>
References: <20241011225906.3789965-1-adrian.larumbe@collabora.com>
 <20241011225906.3789965-3-adrian.larumbe@collabora.com>
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

On Fri, 11 Oct 2024 23:57:01 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> On rk3588 SoCs, during a runtime PM suspend, the transition to the
> lowest voltage/frequency pair might sometimes fail for reasons not yet
> understood. In that case, even a slow FW reset will fail, leaving the
> device's PM runtime status as unusuable.
>=20
> When that happens, successive attempts to resume the device upon running
> a job will always fail.
>=20
> Fix it by forcing a synchronous device reset, which will lead to a
> successful FW reload, and also reset the device's PM runtime error
> status before resuming it.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 10 ++++++++++
>  drivers/gpu/drm/panthor/panthor_device.h |  2 ++
>  drivers/gpu/drm/panthor/panthor_sched.c  |  7 +++++++
>  3 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index 5430557bd0b8..ec6fed5e996b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -105,6 +105,16 @@ static void panthor_device_reset_cleanup(struct drm_=
device *ddev, void *data)
>  	destroy_workqueue(ptdev->reset.wq);
>  }
> =20
> +int panthor_device_reset_sync(struct panthor_device *ptdev)
> +{
> +	panthor_fw_pre_reset(ptdev, false);
> +	panthor_mmu_pre_reset(ptdev);
> +	panthor_gpu_soft_reset(ptdev);
> +	panthor_gpu_l2_power_on(ptdev);
> +	panthor_mmu_post_reset(ptdev);
> +	return panthor_fw_post_reset(ptdev);
> +}
> +
>  static void panthor_device_reset_work(struct work_struct *work)
>  {
>  	struct panthor_device *ptdev =3D container_of(work, struct panthor_devi=
ce, reset.work);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 0e68f5a70d20..05a5a7233378 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -217,6 +217,8 @@ struct panthor_file {
>  int panthor_device_init(struct panthor_device *ptdev);
>  void panthor_device_unplug(struct panthor_device *ptdev);
> =20
> +int panthor_device_reset_sync(struct panthor_device *ptdev);
> +
>  /**
>   * panthor_device_schedule_reset() - Schedules a reset operation
>   */
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index c7b350fc3eba..9a854c8c5718 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3101,6 +3101,13 @@ queue_run_job(struct drm_sched_job *sched_job)
>  		return dma_fence_get(job->done_fence);
>  	}
> =20
> +	if (ptdev->base.dev->power.runtime_error) {
> +		ret =3D panthor_device_reset_sync(ptdev);
> +		if (drm_WARN_ON(&ptdev->base, ret))
> +			return ERR_PTR(ret);
> +		drm_WARN_ON(&ptdev->base, pm_runtime_set_active(ptdev->base.dev));
> +	}

I'd rather pretend the suspend/resume worked (even if it didn't) and
deal with the consequences (force a slow reset on the next resume), than
spread the 'if-PM-op-failed-force-sync-reset' thing everywhere we do a
pm_runtime_resume_and_get(). Also not sure how resetting the GPU will
help fixing the OPP transition failure.

> +
>  	ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		return ERR_PTR(ret);

