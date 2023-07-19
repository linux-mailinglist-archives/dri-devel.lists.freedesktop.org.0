Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479AD759336
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF66410E464;
	Wed, 19 Jul 2023 10:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B3310E463
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:38:07 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qM4ZE-00082e-VV; Wed, 19 Jul 2023 12:38:01 +0200
Message-ID: <94b5ccf8f10e51426bd410705ce1260d006f9b37.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: fix error code in event_alloc()
From: Lucas Stach <l.stach@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Wed, 19 Jul 2023 12:37:59 +0200
In-Reply-To: <53fc5292-669a-4fca-8b99-e35a49da0b0f@moroto.mountain>
References: <53fc5292-669a-4fca-8b99-e35a49da0b0f@moroto.mountain>
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
Cc: kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Am Mittwoch, dem 19.07.2023 um 13:17 +0300 schrieb Dan Carpenter:
> There are two "ret" variables declared in this function so setting
> "ret =3D -EBUSY;" sets the wrong one.  The function ends up returning an
> uninitialized variable.
>=20
Thanks for the fix. Applied to the etnaviv/next branch where the
offending commit sits right now.

Regards,
Lucas

> Fixes: f098f9b8042a ("drm/etnaviv: move runtime PM handling to events")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index f54f12090685..0382cd91eebf 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1158,18 +1158,18 @@ static int event_alloc(struct etnaviv_gpu *gpu, u=
nsigned nr_events,
>  	int ret;
> =20
>  	for (i =3D 0; i < nr_events; i++) {
> -		unsigned long ret;
> +		unsigned long remaining;
> =20
> -		ret =3D wait_for_completion_timeout(&gpu->event_free, timeout);
> +		remaining =3D wait_for_completion_timeout(&gpu->event_free, timeout);
> =20
> -		if (!ret) {
> +		if (!remaining) {
>  			dev_err(gpu->dev, "wait_for_completion_timeout failed");
>  			ret =3D -EBUSY;
>  			goto out;
>  		}
> =20
>  		acquired++;
> -		timeout =3D ret;
> +		timeout =3D remaining;
>  	}
> =20
>  	spin_lock(&gpu->event_spinlock);

