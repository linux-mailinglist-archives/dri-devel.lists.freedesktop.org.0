Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D2BAE60FD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 11:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E9310E54A;
	Tue, 24 Jun 2025 09:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7423410E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 09:38:23 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uU061-0000ys-4O; Tue, 24 Jun 2025 11:37:41 +0200
Message-ID: <fbc1de81cbb50ea1c74ea153b2d8f7ef619bb151.camel@pengutronix.de>
Subject: Re: [PATCH v3 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to
 skip the reset
From: Lucas Stach <l.stach@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner <phasta@kernel.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Simona Vetter <simona@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Date: Tue, 24 Jun 2025 11:37:38 +0200
In-Reply-To: <20250618-sched-skip-reset-v3-6-8be5cca2725d@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
 <20250618-sched-skip-reset-v3-6-8be5cca2725d@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Am Mittwoch, dem 18.06.2025 um 11:47 -0300 schrieb Ma=C3=ADra Canal:
> Etnaviv can skip a hardware reset in two situations:
>=20
>   1. TDR has fired before the free-job worker and the timeout is spurious=
.
>   2. The GPU is still making progress on the front-end and we can give
>      the job a chance to complete.
>=20
> Instead of manipulating scheduler's internals, inform the scheduler that
> the job did not actually timeout and no reset was performed through
> the new status code DRM_GPU_SCHED_STAT_NO_HANG.
>=20
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index 7146069a98492f5fab2a49d96e2054f649e1fe3d..46f5391e84a12232b247886cf=
1311f8e09f42f04 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -40,11 +40,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout=
_job(struct drm_sched_job
>  	int change;
> =20
>  	/*
> -	 * If the GPU managed to complete this jobs fence, the timout is
> -	 * spurious. Bail out.
> +	 * If the GPU managed to complete this jobs fence, the timeout has
> +	 * fired before free-job worker. The timeout is spurious, so bail out.
>  	 */
>  	if (dma_fence_is_signaled(submit->out_fence))
> -		goto out_no_timeout;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> =20
>  	/*
>  	 * If the GPU is still making forward progress on the front-end (which
> @@ -70,7 +70,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_j=
ob(struct drm_sched_job
>  		gpu->hangcheck_dma_addr =3D dma_addr;
>  		gpu->hangcheck_primid =3D primid;
>  		gpu->hangcheck_fence =3D gpu->completed_fence;
> -		goto out_no_timeout;
> +		return DRM_GPU_SCHED_STAT_NO_HANG;
>  	}
> =20
>  	/* block scheduler */
> @@ -86,10 +86,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_=
job(struct drm_sched_job
>  	drm_sched_resubmit_jobs(&gpu->sched);
> =20
>  	drm_sched_start(&gpu->sched, 0);
> -	return DRM_GPU_SCHED_STAT_RESET;
> =20
> -out_no_timeout:
> -	list_add(&sched_job->list, &sched_job->sched->pending_list);
>  	return DRM_GPU_SCHED_STAT_RESET;
>  }
> =20
>=20

