Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EEF488B70
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128FA10E20E;
	Sun,  9 Jan 2022 17:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210E110E20E
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ta5u1tMcVsHVM2qpoxG/0Wgw3v/CyJYs5Hd40n8EmEo=; b=ilcLSD15Roeid0rJLBvlCL63wR
 z9ySoC3aSX89Dut632+zJEkhvCtxLAYHzeuyrg6JBb67WmI39kJQREy/MeskUcEa/qPCRSTboOfQz
 mFDcP0H0TVgYbbj1N10y21vN/jHGuR2PHlxodCmp8YGf7LMqY2zEissNq66kjnXQETF4xLxTERB6o
 4gbEkmHs9CQm3obgSPq2kpl7tjQR0iXg9y1T54yiCA5LlvO5XMC8fUJFh3YYYUz63OaDFSUw58MCZ
 pjA0sSL0zxLE84RRoOGWDsQzCelQjbbRGmd2eThS8ooFULja1Mu9m/8SMNLLBDf5ELsCIU1HtCB66
 VYkzjDwg==;
Received: from [165.90.113.117] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1n6cJ4-0000Zy-Fy; Sun, 09 Jan 2022 18:48:38 +0100
Date: Sun, 9 Jan 2022 16:48:17 -0100
From: Melissa Wen <mwen@igalia.com>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v2] drm/v3d: Fix PM disable depth imbalance in
 v3d_platform_drm_probe
Message-ID: <20220109174817.drma7zfckeywvndc@mail.igalia.com>
References: <CAPY8ntAdknutH=OmV1dWPbez1ZqLgaOj-BoQQkZAu0WbhbE6nQ@mail.gmail.com>
 <20220106124657.32737-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ee43ywlavjqsjxzn"
Content-Disposition: inline
In-Reply-To: <20220106124657.32737-1-linmq006@gmail.com>
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
Cc: emma@anholt.net, dave.stevenson@raspberrypi.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, eric@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ee43ywlavjqsjxzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/06, Miaoqian Lin wrote:
> The pm_runtime_enable will increase power disable depth.
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
>=20
> Fixes: 57692c9 ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.=
x+")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> Changes in v2
> - put pm_runtime_disable before dma_free_wc
> - rename dma_free to pm_disable
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index bd46396a1ae0..7d500dd5314e 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -282,7 +282,7 @@ static int v3d_platform_drm_probe(struct platform_dev=
ice *pdev)
> =20
>  	ret =3D v3d_gem_init(drm);
>  	if (ret)
> -		goto dma_free;
> +		goto pm_disable;
> =20
>  	ret =3D v3d_irq_init(v3d);
>  	if (ret)
> @@ -298,7 +298,8 @@ static int v3d_platform_drm_probe(struct platform_dev=
ice *pdev)
>  	v3d_irq_disable(v3d);
>  gem_destroy:
>  	v3d_gem_destroy(drm);
> -dma_free:
> +pm_disable:
> +	pm_runtime_disable(dev);

Hi,

I see this pm_runtime_disable balancing is also missing for
v3d_platform_drm_remove(), right?

BR,

Melissa
>  	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
>  	return ret;
>  }
> --=20
> 2.17.1
>=20

--ee43ywlavjqsjxzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmHbH9wACgkQwqF3j0dL
ehwfGw//UjlDJVwtU17AnsPL+/W4lUJyxKJ8A34ElKhICjWegLZpByNFW3uxTjdS
hDNKBP5EnBthGwy4zk/gdqbl4s38d7p2PuFDX2DTofhbTkYOuV1TpgkdeVtAlKQR
7ktsKfZ7KHnSxQptfhywPpV4DXu3021rMY2FDqBU+ncJStrhMn4Q84ZNTatObjG3
pbVDL9r6RU03heGR/KrKJFdSAQx1D10JoChnnLBHdwIpgj786EN5cft4eKDRnyr7
kqN3Zov4BE2X02XFoLs2WpLam+f9se/cSPZLTT6E7KwYv9GnFeW/UuWsd3FLjM1D
aJUgVSXvE5PPpSNbMob1rkm31aToQlSEVztEW+wi4DxmQtIwHOWs4yFalpyjGoDS
/i4N9KCLIv2M2lThwXWzkp8PE0qFVGhxH0Hlx2j6WHw+8vMAiIxhL5O3R8pRDSRv
hRA87ag+GISXnRK14M4Q+86TrUKnzasrB/mGgN/UI7CQJNOA5gmQHKIsjSsnQeG2
1sgbznJ8VQTruLQ0qAjx07LMu+2ISiFgis6o7H/xdeZ0z6GuLTyntvm3VZ4IaiHu
37s2QQPyAD7GO7L/4kUjKjNGSHiu0x3kX/wuZ53lE0anE2X9JVUlfEXR0+GJmYbc
WYTCPgk9g9ZnQgvNJNP1tb7KLbnuvKxsV4gGTLGBQY46HfqTVlM=
=84uP
-----END PGP SIGNATURE-----

--ee43ywlavjqsjxzn--
