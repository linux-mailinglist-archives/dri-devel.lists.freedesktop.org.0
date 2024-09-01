Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8052F967BEA
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 21:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6F010E0DA;
	Sun,  1 Sep 2024 19:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="Bid52OYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CF010E0C7;
 Sun,  1 Sep 2024 19:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=References:Cc:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=spF0Jr7oCMuWWYaBUzIxTaZcwLNlD+eaLp7borKRh1E=; b=Bid52OYqHgAOY7jLDJTSsnohsQ
 8HJ/QIhi5h0NUynX9zGzoZSNow4+OW69kkDpBJISynN58L9uchwl5FYnRqu2WkA9jOsBWEU5E/sJN
 Bm3QNxpGw4AGQRgD1Fw6pxQbxhN8bZTfupp/RVObfDTGovrXqh1egiGL7t3lwNSSiFUUBv9DTTcRi
 OqzrUfhCzQMVbVax3u5Iv8Kri3uwKiIpA0JR77aSodJFLwvNMw6nl5GNr6Wt6GF8KqIU2k8cQB1En
 ruC2/k2kcHt2QzK9gnnbQMZ1xNV1QO+Z8CzanFI2jDo9sWOyDvhkJSFw4UBiXrToxNlgtg7Cj1XbF
 mZJmgTOw==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1skqFb-00EgmQ-3B;
 Sun, 01 Sep 2024 22:28:39 +0300
MIME-Version: 1.0
Date: Sun, 01 Sep 2024 19:28:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <765bab893c9859e4f73af2ea65e943dd913ec7f4@iki.fi>
Subject: Re: [PATCH v3 43/81] drm/tilcdc: Run DRM default client setup
To: "Thomas Zimmermann" <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
References: undefined <20240830084456.77630-1-tzimmermann@suse.de>
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

August 30, 2024 at 11:40 AM, "Thomas Zimmermann" <tzimmermann@suse.de mai=
lto:tzimmermann@suse.de?to=3D%22Thomas%20Zimmermann%22%20%3Ctzimmermann%4=
0suse.de%3E > wrote:

>=20
>=20Call drm_client_setup_with_color_mode() to run the kernel's default
> client setup for DRM. Set fbdev_probe in struct drm_driver, so that
> the client setup can start the common fbdev client.
>=20
>=20v3:
> - add DRM_FBDEV_DMA_DRIVER_OPS macro
>=20
>=20Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

Thanks,
Jyri

> ---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_drv.c
> index cd5eefa06060..8c9f3705aa6c 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -14,6 +14,7 @@
> #include <linux/pm_runtime.h>
>=20
>=20#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
> #include <drm/drm_debugfs.h>
> #include <drm/drm_drv.h>
> #include <drm/drm_fbdev_dma.h>
> @@ -374,7 +375,8 @@ static int tilcdc_init(const struct drm_driver *ddr=
v, struct device *dev)
>  goto init_failed;
>  priv->is_registered =3D true;
>=20
>=20- drm_fbdev_dma_setup(ddev, bpp);
> + drm_client_setup_with_color_mode(ddev, bpp);
> +
>  return 0;
>=20
>=20init_failed:
> @@ -472,6 +474,7 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
> static const struct drm_driver tilcdc_driver =3D {
>  .driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  DRM_GEM_DMA_DRIVER_OPS,
> + DRM_FBDEV_DMA_DRIVER_OPS,
> #ifdef CONFIG_DEBUG_FS
>  .debugfs_init =3D tilcdc_debugfs_init,
> #endif
> --=20
>=202.46.0
>
