Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A2BA21D8D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C941F10E002;
	Wed, 29 Jan 2025 13:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5800410E002
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 13:08:57 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1td7oL-0006hM-05; Wed, 29 Jan 2025 14:08:53 +0100
Message-ID: <5323c8d6d906fe1724eac606c94588d815580a40.camel@pengutronix.de>
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout v2
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 marek.olsak@amd.com, sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Date: Wed, 29 Jan 2025 14:08:51 +0100
In-Reply-To: <20250129105841.1806-1-christian.koenig@amd.com>
References: <20250129105841.1806-1-christian.koenig@amd.com>
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

Am Mittwoch, dem 29.01.2025 um 11:58 +0100 schrieb Christian K=C3=B6nig:
> Even the kerneldoc says that with a zero timeout the function should not
> wait for anything, but still return 1 to indicate that the fences are
> signaled now.
>=20
> Unfortunately that isn't what was implemented, instead of only returning
> 1 we also waited for at least one jiffies.
>=20
> Fix that by adjusting the handling to what the function is actually
> documented to do.
>=20
> v2: improve code readability
>=20
> Reported-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> Reported-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: <stable@vger.kernel.org>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/dma-buf/dma-resv.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 5f8d010516f0..c78cdae3deaf 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -684,11 +684,13 @@ long dma_resv_wait_timeout(struct dma_resv *obj, en=
um dma_resv_usage usage,
>  	dma_resv_iter_begin(&cursor, obj, usage);
>  	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> =20
> -		ret =3D dma_fence_wait_timeout(fence, intr, ret);
> -		if (ret <=3D 0) {
> -			dma_resv_iter_end(&cursor);
> -			return ret;
> -		}
> +		ret =3D dma_fence_wait_timeout(fence, intr, timeout);
> +		if (ret <=3D 0)
> +			break;
> +
> +		/* Even for zero timeout the return value is 1 */
> +		if (timeout)
> +			timeout =3D ret;
>  	}
>  	dma_resv_iter_end(&cursor);
> =20

