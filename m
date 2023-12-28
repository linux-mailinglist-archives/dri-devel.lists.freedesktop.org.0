Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BB281FA57
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 18:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD8110E131;
	Thu, 28 Dec 2023 17:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD44910E131
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Subject:References:Cc:To:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtDkFjG4UEMR0PjUgaZp0uUgO7ggIMJp7j+YKLSw+8k=; b=EMk2cQCxOyGl3ud6E2QSBNpsyl
 YybtKOq0s6fvIEUSWx29MjsK/CAO3w8TnHPxITIoQBk+w5RyHRXbWeQ71GpjmYNwMig834VXmyIgF
 SPDABDCAyA3UkRQZLETn+mNQOo1xEfCTXw1rRoohNhEG9V3IFfqqpOptkj7h/CqHPnlYO0Y3dCu52
 k9ZfP0WaC7KPxabv3Rw40hR/xv/vRBhAbvSwgpamLokFaLJB68PW6UK+TDWPuf+nCEG8hNX98Ph5t
 10CbLOvUyaSybjlOqnqPle04j0DF+sjOFczcwjAwlN9KMmjsira17D/TeJPKCq5ya+Wgue8znJ/X9
 Ga4FcBHA==;
Received: from [2001:67c:1be8::200] (helo=rainloop.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <jyri.sarha@iki.fi>) id 1rIuBc-008JHs-19;
 Thu, 28 Dec 2023 19:28:48 +0200
MIME-Version: 1.0
Date: Thu, 28 Dec 2023 17:28:48 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: jyri.sarha@iki.fi
Message-ID: <7fee3509faf9d134db2f537dccacbc1adf284cce@iki.fi>
To: "Philipp Stanner" <pstanner@redhat.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
References: undefined
X-SA-Exim-Connect-IP: 2001:67c:1be8::200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=4.0.0
Subject: Re: [PATCH] drm/tilcdc: request and mapp iomem with devres
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

December 22, 2023 at 1:52 PM, "Philipp Stanner" <pstanner@redhat.com mail=
to:pstanner@redhat.com?to=3D%22Philipp%20Stanner%22%20%3Cpstanner%40redha=
t.com%3E > wrote:

>=20
>=20tilcdc currently just ioremaps its iomem, without doing the (a bit mo=
re
> robust) request on the memory first. The devm_ functions provide a hand=
y
> way to both request and ioremap the memory with automatic cleanup.
>=20
>=20Replace the manual ioremap with the devm_ version.
>=20
>=20Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

I'll apply this shortly to drm-misc-next.

Thanks,
Jyri

> ---
> drivers/gpu/drm/tilcdc/tilcdc_drv.c | 19 ++++---------------
> 1 file changed, 4 insertions(+), 15 deletions(-)
>=20
>=20diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/ti=
lcdc/tilcdc_drv.c
> index 8ebd7134ee21..2ad3f44a6e2d 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -182,9 +182,6 @@ static void tilcdc_fini(struct drm_device *dev)
>  if (priv->clk)
>  clk_put(priv->clk);
>=20
>=20- if (priv->mmio)
> - iounmap(priv->mmio);
> -
>  if (priv->wq)
>  destroy_workqueue(priv->wq);
>=20
>=20@@ -201,7 +198,6 @@ static int tilcdc_init(const struct drm_driver *d=
drv, struct device *dev)
>  struct platform_device *pdev =3D to_platform_device(dev);
>  struct device_node *node =3D dev->of_node;
>  struct tilcdc_drm_private *priv;
> - struct resource *res;
>  u32 bpp =3D 0;
>  int ret;
>=20
>=20@@ -226,17 +222,10 @@ static int tilcdc_init(const struct drm_driver =
*ddrv, struct device *dev)
>  goto init_failed;
>  }
>=20
>=20- res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> - if (!res) {
> - dev_err(dev, "failed to get memory resource\n");
> - ret =3D -EINVAL;
> - goto init_failed;
> - }
> -
> - priv->mmio =3D ioremap(res->start, resource_size(res));
> - if (!priv->mmio) {
> - dev_err(dev, "failed to ioremap\n");
> - ret =3D -ENOMEM;
> + priv->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> + if (IS_ERR(priv->mmio)) {
> + dev_err(dev, "failed to request / ioremap\n");
> + ret =3D PTR_ERR(priv->mmio);
>  goto init_failed;
>  }
>=20
>=20--=20
>=202.43.0
>
