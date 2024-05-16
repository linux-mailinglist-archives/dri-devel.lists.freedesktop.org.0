Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2909B8C7B06
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F43810E478;
	Thu, 16 May 2024 17:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0076C10E44D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 17:20:19 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1s7em9-0007cw-Tz; Thu, 16 May 2024 19:20:17 +0200
Message-ID: <6c61933be624d8d6fe7609e56763e760c9721179.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: switch devcoredump allocations to GFP_NOWAIT
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>, 
 patchwork-lst@pengutronix.de, kernel@pengutronix.de, 
 dri-devel@lists.freedesktop.org, Russell King
 <linux+etnaviv@armlinux.org.uk>
Date: Thu, 16 May 2024 19:20:17 +0200
In-Reply-To: <20240126164623.1191363-1-l.stach@pengutronix.de>
References: <20240126164623.1191363-1-l.stach@pengutronix.de>
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

Am Freitag, dem 26.01.2024 um 17:46 +0100 schrieb Lucas Stach:
> The etnaviv devcoredump is created in the GPU reset path, which
> must make forward progress to avoid stalling memory reclaim on
> unsignalled dma fences. The currently used __GFP_NORETRY does not
> prohibit sleeping on direct reclaim, breaking the forward progress
> guarantee. Switch to GFP_NOWAIT, which allows background reclaim
> to be triggered, but avoids any stalls waiting for direct reclaim.
>=20
Any takers for reviewing this one?

Regards,
Lucas

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_dump.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etn=
aviv/etnaviv_dump.c
> index 898f84a0fc30c..42c5028872d54 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
> @@ -159,8 +159,7 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *sub=
mit)
>  	file_size +=3D sizeof(*iter.hdr) * n_obj;
> =20
>  	/* Allocate the file in vmalloc memory, it's likely to be big */
> -	iter.start =3D __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> -			__GFP_NORETRY);
> +	iter.start =3D __vmalloc(file_size, GFP_NOWAIT | __GFP_NOWARN);
>  	if (!iter.start) {
>  		mutex_unlock(&submit->mmu_context->lock);
>  		dev_warn(gpu->dev, "failed to allocate devcoredump file\n");
> @@ -230,5 +229,6 @@ void etnaviv_core_dump(struct etnaviv_gem_submit *sub=
mit)
> =20
>  	etnaviv_core_dump_header(&iter, ETDUMP_BUF_END, iter.data);
> =20
> -	dev_coredumpv(gpu->dev, iter.start, iter.data - iter.start, GFP_KERNEL)=
;
> +	dev_coredumpv(gpu->dev, iter.start, iter.data - iter.start,
> +		      GFP_NOWAIT | __GFP_NOWARN);
>  }

