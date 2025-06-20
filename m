Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E8AE2348
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 22:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E4E10EBB8;
	Fri, 20 Jun 2025 20:11:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C33B10EBBA
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 20:11:32 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1uSi5B-0008Rs-7l; Fri, 20 Jun 2025 22:11:29 +0200
Message-ID: <5b80ca5883ccf930e6cbe6da8f5c219e0346295f.camel@pengutronix.de>
Subject: Re: [PATCH v2 4/6] drm/etnaviv: Identify GPU already when binding
From: Lucas Stach <l.stach@pengutronix.de>
To: Gert Wollny <gert.wollny@collabora.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 22:11:27 +0200
In-Reply-To: <20250618204400.21808-5-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
 <20250618204400.21808-5-gert.wollny@collabora.com>
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

Am Mittwoch, dem 18.06.2025 um 22:43 +0200 schrieb Gert Wollny:
> This is required to know whether to be able to avoid allocating
> the flop reset data if non of the available GPUs actually need
> it.
>=20
I'm surprised that this works on your platform at all. You can not move
the identification here, as the GPU is still treated as suspended in
etnaviv_gpu_bind, so on platforms with clock or power gating reading
the ID registers will cause aborts or system hangs.

Regards,
Lucas

> Signed-off-by: Gert Wollny <gert.wollny@collabora.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index cf0d9049bcf1..dc8a7ff3e797 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -829,14 +829,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  		goto fail;
>  	}
> =20
> -	etnaviv_hw_identify(gpu);
> -
> -	if (gpu->identity.model =3D=3D 0) {
> -		dev_err(gpu->dev, "Unknown GPU model\n");
> -		ret =3D -ENXIO;
> -		goto fail;
> -	}
> -
>  	if (gpu->identity.nn_core_count > 0)
>  		dev_warn(gpu->dev, "etnaviv has been instantiated on a NPU, "
>                                     "for which the UAPI is still experime=
ntal\n");
> @@ -1808,6 +1800,13 @@ static int etnaviv_gpu_bind(struct device *dev, st=
ruct device *master,
>  	INIT_WORK(&gpu->sync_point_work, sync_point_worker);
>  	init_waitqueue_head(&gpu->fence_event);
> =20
> +	etnaviv_hw_identify(gpu);
> +
> +	if (gpu->identity.model =3D=3D 0) {
> +		dev_err(gpu->dev, "Unknown GPU model\n");
> +		ret =3D -ENXIO;
> +		goto out_sched;
> +	}
>  	priv->gpu[priv->num_gpus++] =3D gpu;
> =20
>  	return 0;

