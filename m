Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C973162B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD3110E4C5;
	Thu, 15 Jun 2023 11:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCA10E4C5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:11:01 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q9ksV-00038k-OB; Thu, 15 Jun 2023 13:10:59 +0200
Message-ID: <031a0bb7d9308480235d91a915549cb3e9a94e53.camel@pengutronix.de>
Subject: Re: [PATCH] nouveau: fix client work fence deletion race
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Date: Thu, 15 Jun 2023 13:10:58 +0200
In-Reply-To: <20230615024008.1600281-1-airlied@gmail.com>
References: <20230615024008.1600281-1-airlied@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 15.06.2023 um 12:40 +1000 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> This seems to have existed for ever but is now more apparant after
> 9bff18d13473a9fdf81d5158248472a9d8ecf2bd (drm/ttm: use per BO cleanup wor=
kers)
>=20
> My analysis:
> two threads are running,
> one in the irq signalling the fence, in dma_fence_signal_timestamp_locked=
,
> it has done the DMA_FENCE_FLAG_SIGNALLED_BIT setting, but hasn't yet reac=
hed the callbacks.
>=20
> second thread in nouveau_cli_work_ready, where it sees the fence is signa=
lled, so then puts the
> fence, cleanups the object and frees the work item, which contains the ca=
llback.
>=20
> thread one goes again and tries to call the callback and causes the use-a=
fter-free.
>=20
> Proposed fix:
> lock the fence signalled check in nouveau_cli_work_ready, so either the c=
allbacks are done
> or the memory is freed.
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index cc7c5b4a05fd..1a45be769848 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -137,10 +137,16 @@ nouveau_name(struct drm_device *dev)
>  static inline bool
>  nouveau_cli_work_ready(struct dma_fence *fence)
>  {
> -	if (!dma_fence_is_signaled(fence))
> -		return false;
> -	dma_fence_put(fence);
> -	return true;
> +	unsigned long flags;
> +	bool ret =3D true;
> +	spin_lock_irqsave(fence->lock, flags);

This function is only ever called from worker (process) context, so
there is no point in saving the current irq state. This can be a plain
spin_lock_irq.

Regards,
Lucas

> +	if (!dma_fence_is_signaled_locked(fence))
> +		ret =3D false;
> +	spin_unlock_irqrestore(fence->lock, flags);
> +
> +	if (ret =3D=3D true)
> +		dma_fence_put(fence);
> +	return ret;
>  }
> =20
>  static void

