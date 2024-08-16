Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4558A954B21
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 15:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B870810E6E0;
	Fri, 16 Aug 2024 13:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="vwlhcw/j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D910E6E0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6APiPsl1dk8hQTUQIp5bKhxGcpS03CWAMAQchIn+9+A=; b=vwlhcw/j12UiyS4tp3lQKpH1A3
 KHBdt7G5yTSG50550RFm+BIulA4G2eFh/eA/vcFBbBwmlq+2Kx9Qdl/YsMiR1BkFFvHRDN/kg5YYd
 lBb79ICOHR91T9X/LaVainI0wouXePAU8MpMvozCBFlZK7NZGME5qiLS4fPxEqQSQvEMoDlLruzbq
 cwv4U4c1/FlatNReWkKBlNZqfWIGLPEVUbnPXRC+rxwYo3yMULGkA/MZCYdzVWM/OpP2NN6ZmWtNU
 ZqdtR+PBY72bBd7QcG7NdqUESP49CYleEC6NEWkfr22DJTEOYsWkm1nqiTHOSinq/YLJN8BePuPxc
 jRqRLz0A==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sex67-0002U1-4U; Fri, 16 Aug 2024 15:34:31 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 38/86] drm/rockchip: Run DRM default client setup
Date: Fri, 16 Aug 2024 15:34:29 +0200
Message-ID: <2949271.e9J7NaK4W3@diego>
In-Reply-To: <20240816125408.310253-39-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-39-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Freitag, 16. August 2024, 14:23:04 CEST schrieb Thomas Zimmermann:
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>

I've looked up the whole patchseries and while I can't say overly much
about the core changes, at least for the Rockchip driver, things look
like they'll stay the same even after those changes are applied, so

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_drv.c
> index 44d769d9234d..83ea6cc8cd21 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
> @@ -17,6 +17,7 @@
>  #include <linux/iommu.h>
> =20
>  #include <drm/drm_aperture.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
>  #include <drm/drm_gem_dma_helper.h>
> @@ -191,7 +192,7 @@ static int rockchip_drm_bind(struct device *dev)
>  	if (ret)
>  		goto err_kms_helper_poll_fini;
> =20
> -	drm_fbdev_dma_setup(drm_dev, 0);
> +	drm_client_setup(drm_dev, NULL);
> =20
>  	return 0;
>  err_kms_helper_poll_fini:
> @@ -226,6 +227,7 @@ static const struct drm_driver rockchip_drm_driver =
=3D {
>  	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.dumb_create		=3D rockchip_gem_dumb_create,
>  	.gem_prime_import_sg_table	=3D rockchip_gem_prime_import_sg_table,
> +	DRM_FBDEV_DMA_DRIVER_OPS,
>  	.fops			=3D &rockchip_drm_driver_fops,
>  	.name	=3D DRIVER_NAME,
>  	.desc	=3D DRIVER_DESC,
>=20




