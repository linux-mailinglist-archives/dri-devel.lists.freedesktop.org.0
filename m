Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB1CCB657
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:33:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DB310EC91;
	Thu, 18 Dec 2025 10:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jOSuI8tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB49A10EC91
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766054002;
 bh=FwMGEoXaMRsLXZqxdn4ZHS5PZCjf6JvULuu/d4rKs04=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jOSuI8tuJtU6EjDR6vYhMNO+JQWwpByBY7Hu+j4hrZSVKTu34TN4bO6CtvPrJ0cCm
 stWTfJoro5EhWdU0FLEHn6PBqd6S18aqltMjo2VxY1vkiTruyXFFFV9SMigzj0FVMr
 9XqPiczmrVzs9poh8xvZETKP9FQmVk+CtGi4wTsul2Z5VrPR2yAQc/OG4y+k54F1I8
 6YuvB/CPtdvI/Nhv8JNJoqgftBy+7K9VG5FtGZFPdctRdgIQJOWwtktKA+eAw0wZ+0
 /PknMDYjDvBcZzdxfkzQ0eR9o3ivfmgQ3CLa0vMKZjV9t82vqpMR6ddJ3tJ9BG0aN4
 Ow7aEM3W8pFGg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0043B17E0C2E;
 Thu, 18 Dec 2025 11:33:21 +0100 (CET)
Date: Thu, 18 Dec 2025 11:33:18 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 3/7] drm/panthor: Add panthor perf initialization and
 termination
Message-ID: <20251218113318.774e18c6@fedora>
In-Reply-To: <20251215171453.2506348-4-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-4-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 15 Dec 2025 17:14:49 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> Added the panthor_perf system initialization and unplug code to allow
> for the handling of userspace sessions to be added in follow-up
> patches.
>=20
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  2 +
>  drivers/gpu/drm/panthor/panthor_device.h |  5 +-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 63 +++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
>  4 files changed, 69 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index dc237da92340..3063ffbead45 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -120,6 +120,7 @@ void panthor_device_unplug(struct panthor_device *ptd=
ev)
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> +	panthor_perf_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
> @@ -323,6 +324,7 @@ int panthor_device_init(struct panthor_device *ptdev)
> =20
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +	panthor_perf_unplug(ptdev);
> =20
>  err_unplug_sched:
>  	panthor_sched_unplug(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 64b0048de6ac..e1a6250cecc8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -28,8 +28,8 @@ struct panthor_hw;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> -struct panthor_perfcnt;
>  struct panthor_pwr;
> +struct panthor_perf;
>  struct panthor_vm;
>  struct panthor_vm_pool;
> =20
> @@ -160,6 +160,9 @@ struct panthor_device {
>  	/** @devfreq: Device frequency scaling management data. */
>  	struct panthor_devfreq *devfreq;
> =20
> +	/** @perf: Performance counter management data. */
> +	struct panthor_perf *perf;
> +
>  	/** @unplug: Device unplug related fields. */
>  	struct {
>  		/** @lock: Lock used to serialize unplug operations. */
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/pan=
thor/panthor_perf.c
> index 842d62826ac3..3a65d6d326e8 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -4,6 +4,7 @@
> =20
>  #include <linux/bitops.h>
>  #include <drm/panthor_drm.h>
> +#include <drm/drm_print.h>
> =20
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
> @@ -22,6 +23,19 @@
>   */
>  #define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
> =20
> +struct panthor_perf {
> +	/** @next_session: The ID of the next session. */
> +	u32 next_session;
> +
> +	/** @session_range: The number of sessions supported at a time. */
> +	struct xa_limit session_range;
> +
> +	/**
> +	 * @sessions: Global map of sessions, accessed by their ID.
> +	 */
> +	struct xarray sessions;

Unless there's a need to have global session ID (sessions can be shared
and accessed from different processes), I'd move the xarray to some
panthor_file_perf object and make this session ID per-FD. Actually, I'm
not even sure I see a use case for having more than one session
per-file, so it could even be just a panthor_perf_session pointer and a
lock in panthor_file:

struct panthor_file {
	...
	struct {
		struct mutex lock;
		struct panthor_perf_session *session;
	} perf;
};

If we want to restrict the total number of sessions, we can have an
atomic_t in panthor_perf, but I think what really matters is the
maximum number of active sessions, and I believe we already have a
counter for that (panthor_perf_sampler::enabled_clients).

> +};
> +
>  struct panthor_perf_counter_block {
>  	struct drm_panthor_perf_block_header header;
>  	u64 counters[];
> @@ -76,14 +90,61 @@ static void panthor_perf_info_init(struct panthor_dev=
ice *const ptdev)
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
>   *
> + * The performance counters require the FW interface to be available to =
setup the
> + * sampling ringbuffers, so this must be called only after FW is initial=
ized.
> + *
>   * Return: 0 on success, negative error code on failure.
>   */
>  int panthor_perf_init(struct panthor_device *ptdev)
>  {
> +	struct panthor_perf *perf __free(kfree) =3D NULL;
> +	int ret =3D 0;
> +
>  	if (!ptdev)
>  		return -EINVAL;
> =20
>  	panthor_perf_info_init(ptdev);
> =20
> -	return 0;
> +	perf =3D kzalloc(sizeof(*perf), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(perf))
> +		return -ENOMEM;
> +
> +	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
> +
> +	perf->session_range =3D (struct xa_limit) {
> +		.min =3D 0,
> +		.max =3D 1,
> +	};
> +
> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
> +
> +	ptdev->perf =3D no_free_ptr(perf);
> +
> +	return ret;
> +}
> +
> +/**
> + * panthor_perf_unplug - Terminate the performance counter subsystem.
> + * @ptdev: Panthor device.
> + *
> + * This function will terminate the performance counter control structur=
es and any remaining
> + * sessions, after waiting for any pending interrupts.
> + */
> +void panthor_perf_unplug(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf =3D ptdev->perf;
> +
> +	if (!perf)
> +		return;
> +
> +	if (!xa_empty(&perf->sessions)) {
> +		drm_err(&ptdev->base,
> +			"Performance counter sessions active when unplugging the driver!");
> +	}
> +
> +	xa_destroy(&perf->sessions);
> +
> +	kfree(ptdev->perf);
> +
> +	ptdev->perf =3D NULL;
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/pan=
thor/panthor_perf.h
> index 3c32c24c164c..e4805727b9e7 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -10,6 +10,7 @@
>  struct panthor_device;
> =20
>  int panthor_perf_init(struct panthor_device *ptdev);
> +void panthor_perf_unplug(struct panthor_device *ptdev);
> =20
>  #endif /* __PANTHOR_PERF_H__ */
> =20

