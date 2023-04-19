Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E36E7665
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 11:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470D310E8FC;
	Wed, 19 Apr 2023 09:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F16D10E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 09:35:06 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pp4DP-0000nw-SN; Wed, 19 Apr 2023 11:35:03 +0200
Message-ID: <ba65decf8d11bfaeea37ab3217d2846e7ed4a974.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: don't block scheduler when GPU is still
 active
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Date: Wed, 19 Apr 2023 11:35:02 +0200
In-Reply-To: <20230331110012.69844-1-l.stach@pengutronix.de>
References: <20230331110012.69844-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

does anyone have some bandwidth to review this?

Regards,
Lucas

Am Freitag, dem 31.03.2023 um 13:00 +0200 schrieb Lucas Stach:
> Since 45ecaea73883 ("drm/sched: Partial revert of 'drm/sched: Keep
> s_fence->parent pointer'") still active jobs aren't put back in the
> pending list on drm_sched_start(), as they don't have a active
> parent fence anymore, so if the GPU is still working and the timeout
> is extended, all currently active jobs will be freed.
>=20
> To avoid prematurely freeing jobs that are still active on the GPU,
> don't block the scheduler until we are fully committed to actually
> reset the GPU.
>=20
> Cc: stable@vger.kernel.org #6.0
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
> The behavior change in the scheduler is unfortunate and at least
> deserves some updated documentation. This change aligns etnaviv with
> the behavior of other drivers and avoids the issue.
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/et=
naviv/etnaviv_sched.c
> index 1ae87dfd19c4..35d7c2ef7a57 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> @@ -38,15 +38,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout=
_job(struct drm_sched_job
>  	u32 dma_addr;
>  	int change;
> =20
> -	/* block scheduler */
> -	drm_sched_stop(&gpu->sched, sched_job);
> -
>  	/*
>  	 * If the GPU managed to complete this jobs fence, the timout is
>  	 * spurious. Bail out.
>  	 */
>  	if (dma_fence_is_signaled(submit->out_fence))
> -		goto out_no_timeout;
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
> =20
>  	/*
>  	 * If the GPU is still making forward progress on the front-end (which
> @@ -59,9 +56,12 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_=
job(struct drm_sched_job
>  	    change < 0 || change > 16) {
>  		gpu->hangcheck_dma_addr =3D dma_addr;
>  		gpu->hangcheck_fence =3D gpu->completed_fence;
> -		goto out_no_timeout;
> +		return DRM_GPU_SCHED_STAT_NOMINAL;
>  	}
> =20
> +	/* block scheduler */
> +	drm_sched_stop(&gpu->sched, sched_job);
> +
>  	if(sched_job)
>  		drm_sched_increase_karma(sched_job);
> =20
> @@ -73,11 +73,6 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_=
job(struct drm_sched_job
> =20
>  	drm_sched_start(&gpu->sched, true);
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
> -
> -out_no_timeout:
> -	/* restart scheduler after GPU is usable again */
> -	drm_sched_start(&gpu->sched, true);
> -	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
> =20
>  static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)

