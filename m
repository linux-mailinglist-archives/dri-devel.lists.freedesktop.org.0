Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42847973936
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 15:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471A710E80A;
	Tue, 10 Sep 2024 13:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="RuN7+7yE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AF110E80A;
 Tue, 10 Sep 2024 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Cc:To:Subject:Message-ID:From:Content-Transfer-Encoding:
 Content-Type:Date:MIME-Version:Sender:Reply-To:Content-ID:Content-Description
 :Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/srlUpi7y9C3zrteMvJN9inZYqF69BwthYbBUGYq088=; b=RuN7+7yEO6iA2xZtQqKCqwMf/W
 CzXkDgQkK8/owv1+kkaKYp+BgaMhCVyza16NLq39BjZoh8pZsrrQtxRqMeFPaeM0TADNHX/Ke9BFN
 EDBkWmxcVLA8AAXnlVGxhsEb+8T8olzUCjOOc+ldFRuMJ+PTfG+CK5bIbr0Z0nMXyrdWgVHepnulp
 n5W5uh2DiXDN+ibf9rRPHt1l+dCmQ6DL0zzewKZq/fKDaOOpRIZBS02r4vFBlLfO/QD7aXkq9H1aQ
 +CBINL77mrVrUOUdmsXCV6dHn63SL9lmwG4ic9MKdNdN9FmTQUEAzmj040CpZDFlNSbAMHP14jU7Y
 lxs1DS1w==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1so1OY-0078RP-0q;
 Tue, 10 Sep 2024 16:59:01 +0300
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 13:58:59 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <ce2520bb554e9682445f9700f3cf929045fcd017@iki.fi>
Subject: Re: [PATCH v4 42/80] drm/tilcdc: Run DRM default client setup
To: "Thomas Zimmermann" <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, "Jyri 
 Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>
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

September 9, 2024 at 2:30 PM, "Thomas Zimmermann" <tzimmermann@suse.de ma=
ilto:tzimmermann@suse.de?to=3D%22Thomas%20Zimmermann%22%20%3Ctzimmermann%=
40suse.de%3E > wrote:

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
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>=20

tilcdc=20patch looks identical to the previous version, but here is my ac=
k again:

Acked-by: Jyri Sarha <jyri.sarha@iki.fi>

Best regards,
Jyri

>=20
>=20---
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
> goto init_failed;
> priv->is_registered =3D true;
>=20
>=20- drm_fbdev_dma_setup(ddev, bpp);
> + drm_client_setup_with_color_mode(ddev, bpp);
> +
> return 0;
>=20
>=20init_failed:
> @@ -472,6 +474,7 @@ DEFINE_DRM_GEM_DMA_FOPS(fops);
> static const struct drm_driver tilcdc_driver =3D {
> .driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> DRM_GEM_DMA_DRIVER_OPS,
> + DRM_FBDEV_DMA_DRIVER_OPS,
> #ifdef CONFIG_DEBUG_FS
> .debugfs_init =3D tilcdc_debugfs_init,
> #endif
> --=20
>=202.46.0
>
