Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134BD9B3579
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 16:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B32110E503;
	Mon, 28 Oct 2024 15:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457510E503
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 15:56:28 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1t5S6T-0004Rl-NZ; Mon, 28 Oct 2024 16:56:25 +0100
Message-ID: <44d32006d33987027c09b4a025ef39436dbbd9ad.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/5] drm/etnaviv: hold GPU lock across perfmon sampling
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
Date: Mon, 28 Oct 2024 16:56:25 +0100
In-Reply-To: <20240705200013.2656275-1-l.stach@pengutronix.de>
References: <20240705200013.2656275-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
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

Am Freitag, dem 05.07.2024 um 22:00 +0200 schrieb Lucas Stach:
> The perfmon sampling mutates shared GPU state (e.g. VIVS_HI_CLOCK_CONTROL
> to select the pipe for the perf counter reads). To avoid clashing with
> other functions mutating the same state (e.g. etnaviv_gpu_update_clock)
> the perfmon sampling needs to hold the GPU lock.
>=20
> Fixes: 68dc0b295dcb ("drm/etnaviv: use 'sync points' for performance moni=
tor requests")
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Series applied to etnaviv/next.

> ---
> v2: new patch
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 7c7f97793ddd..2bd14d3501e2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1330,6 +1330,8 @@ static void sync_point_perfmon_sample_pre(struct et=
naviv_gpu *gpu,
>  {
>  	u32 val;
> =20
> +	mutex_lock(&gpu->lock);
> +
>  	/* disable clock gating */
>  	val =3D gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>  	val &=3D ~VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
> @@ -1341,6 +1343,8 @@ static void sync_point_perfmon_sample_pre(struct et=
naviv_gpu *gpu,
>  	gpu_write(gpu, VIVS_HI_CLOCK_CONTROL, val);
> =20
>  	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_PRE);
> +
> +	mutex_unlock(&gpu->lock);
>  }
> =20
>  static void sync_point_perfmon_sample_post(struct etnaviv_gpu *gpu,
> @@ -1350,13 +1354,9 @@ static void sync_point_perfmon_sample_post(struct =
etnaviv_gpu *gpu,
>  	unsigned int i;
>  	u32 val;
> =20
> -	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
> -
> -	for (i =3D 0; i < submit->nr_pmrs; i++) {
> -		const struct etnaviv_perfmon_request *pmr =3D submit->pmrs + i;
> +	mutex_lock(&gpu->lock);
> =20
> -		*pmr->bo_vma =3D pmr->sequence;
> -	}
> +	sync_point_perfmon_sample(gpu, event, ETNA_PM_PROCESS_POST);
> =20
>  	/* disable debug register */
>  	val =3D gpu_read(gpu, VIVS_HI_CLOCK_CONTROL);
> @@ -1367,6 +1367,14 @@ static void sync_point_perfmon_sample_post(struct =
etnaviv_gpu *gpu,
>  	val =3D gpu_read_power(gpu, VIVS_PM_POWER_CONTROLS);
>  	val |=3D VIVS_PM_POWER_CONTROLS_ENABLE_MODULE_CLOCK_GATING;
>  	gpu_write_power(gpu, VIVS_PM_POWER_CONTROLS, val);
> +
> +	mutex_unlock(&gpu->lock);
> +
> +	for (i =3D 0; i < submit->nr_pmrs; i++) {
> +		const struct etnaviv_perfmon_request *pmr =3D submit->pmrs + i;
> +
> +		*pmr->bo_vma =3D pmr->sequence;
> +	}
>  }
> =20
> =20

