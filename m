Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E18ADB2FC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A2A10E366;
	Mon, 16 Jun 2025 14:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F6B10E351
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 14:06:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uRATL-00039G-5O; Mon, 16 Jun 2025 16:06:03 +0200
Message-ID: <2d93b1e01aa6df134acf2e792440d62727d9a66c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Protect the scheduler's pending list with
 its lock
From: Lucas Stach <l.stach@pengutronix.de>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <cgmeiner@igalia.com>, Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 kernel-dev@igalia.com, stable@vger.kernel.org
Date: Mon, 16 Jun 2025 16:06:00 +0200
In-Reply-To: <20250602132240.93314-1-mcanal@igalia.com>
References: <20250602132240.93314-1-mcanal@igalia.com>
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

Hi Ma=C3=ADra,

Am Montag, dem 02.06.2025 um 10:22 -0300 schrieb Ma=C3=ADra Canal:
> Commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is stil=
l
> active") ensured that active jobs are returned to the pending list when
> extending the timeout. However, it didn't use the pending list's lock to
> manipulate the list, which causes a race condition as the scheduler's
> workqueues are running.
>=20
> Hold the lock while manipulating the scheduler's pending list to prevent
> a race.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is stil=
l active")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

Feel free to take this through drm-misc.

This code is really ugly and I'm really happy to see your work on a
better solution for extending the timeouts. Thanks for working on that!

Regards,
Lucas

> ---
> Hi,
>=20
> I'm proposing this workaround patch to address the race-condition caused
> by manipulating the pending list without using its lock. Although I
> understand this isn't a complete solution (see [1]), it's not reasonable
> to backport the new DRM stat series [2] to the stable branches.
>=20
> Therefore, I believe the best solution is backporting this fix to the
> stable branches, which will fix the race and will keep adding the job
> back to the pending list (which will avoid most memory leaks).
>=20
> [1] https://lore.kernel.org/dri-devel/bcc0ed477f8a6f3bb06665b1756bcb98fb7=
af871.camel@mailbox.org/
> [2] https://lore.kernel.org/dri-devel/20250530-sched-skip-reset-v2-0-c40a=
8d2d8daa@igalia.com/
>=20
> Best Regards,
> - Ma=C3=ADra
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index 76a3a3e517d8..71e2e6b9d713 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -35,6 +35,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_j=
ob(struct drm_sched_job
>  							  *sched_job)
>  {
>  	struct etnaviv_gem_submit *submit =3D to_etnaviv_submit(sched_job);
> +	struct drm_gpu_scheduler *sched =3D sched_job->sched;
>  	struct etnaviv_gpu *gpu =3D submit->gpu;
>  	u32 dma_addr, primid =3D 0;
>  	int change;
> @@ -89,7 +90,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_j=
ob(struct drm_sched_job
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
> =20
>  out_no_timeout:
> -	list_add(&sched_job->list, &sched_job->sched->pending_list);
> +	spin_lock(&sched->job_list_lock);
> +	list_add(&sched_job->list, &sched->pending_list);
> +	spin_unlock(&sched->job_list_lock);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> =20

