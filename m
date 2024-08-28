Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35959627EF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 14:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1598910E041;
	Wed, 28 Aug 2024 12:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="F9apZzFZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA29910E041
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724849837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxpYxSE0LB9NbwXxnXEYdZW6aa0Byn813SATU/6Y7XI=;
 b=F9apZzFZd3vHt3mnMLG27LniaZwLITEDQZGcnj/tuxJ2rkFHQw31FS5rEUfcVcnWV6U5Vb
 iczEYTpPx/B2v77Ex6SFsDk6ML6bfWmco6kQlGtskU7ubzEgX/Fo71CutaUZ4pBP102u2l
 A5vb93gJt7dDrDbZso5/5bxvQMLBcC0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-2-xim63lOWCYpDRezv2wzQ-1; Wed, 28 Aug 2024 08:57:16 -0400
X-MC-Unique: 2-xim63lOWCYpDRezv2wzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3719559c51dso3817863f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 05:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724849835; x=1725454635;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IObnPhTVGYc0oDOQLNaca7it9FDta78II2gOMX6ooMA=;
 b=joZGKDeI33WSY69pGftLG3Jx5JfIGcZ29urDKLVoL61KK+fIP6aWqBu95C21cbze6/
 f74bbZWFI53xFRxd/vG/NjvweVYTf/3guRnuYzU7OB/j5pYJTpaUXC4RYzHOs9UVtTkj
 vLvYC6GCy9Mplbw9I7yohT3l/hGlmkNPHFmv9mw1yHfWUsO87L3ym2aVA+V1qMfnwgdg
 08887HDkpftIixcoev5sWN0xSopoz570GisIUjnoVhQAnuYgPod4P7rzxU+uCyPefPy8
 2YFaTlasComXKpGf+t5T2pSOIgKXZ2I5Sm9XZJR/Vn8dxhO/NNGNokMK9raP9dhEoZrL
 hEQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX32+E7FgAtnaiXN3pZ4oqzQTB6sQrRD6GXCk+dgmKhbToYElPl70REHGD0FUIiDlDgIPEjqfy55Os=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yylf4MYk+7zpwDBOjjcQ84PE1dm2wpW03P6XlvSHPyA/C53Ko10
 HB9sTuDC5D+0VZN+cZOcCEI/4MH/I+zYGsDV3q1IV8zEx3Zm7j+ZLYTPzJUWuF82Tp67xfX0RFE
 wnTmdr442BTeL0vFS885eBAxdApi9b0T+lzXMsFTSEVLBA5VM+JcSsAaaDaKNNIRLKQ==
X-Received: by 2002:a05:6000:b8e:b0:36d:2984:ef6b with SMTP id
 ffacd0b85a97d-37311888373mr10696355f8f.11.1724849834864; 
 Wed, 28 Aug 2024 05:57:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcGzZzODngC+pGZEJw8FL8ceFblDSz/vUkxp8vzzvF3O0hg/Y0wZ4RAVeE2/uUuSRD5b5IDQ==
X-Received: by 2002:a05:6000:b8e:b0:36d:2984:ef6b with SMTP id
 ffacd0b85a97d-37311888373mr10696329f8f.11.1724849834290; 
 Wed, 28 Aug 2024 05:57:14 -0700 (PDT)
Received: from dhcp-64-16.muc.redhat.com (nat-pool-muc-t.redhat.com.
 [149.14.88.26]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730811042bsm15792010f8f.4.2024.08.28.05.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 05:57:13 -0700 (PDT)
Message-ID: <75c06da11741d46cd67dbb685b7473ae94c2feb5.camel@redhat.com>
Subject: Re: [PATCH] drm/meson: switch to a managed drm device
From: Philipp Stanner <pstanner@redhat.com>
To: Anastasia Belova <abelova@astralinux.ru>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org,  linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Date: Wed, 28 Aug 2024 14:57:12 +0200
In-Reply-To: <20240828110421.14956-1-abelova@astralinux.ru>
References: <20240828110421.14956-1-abelova@astralinux.ru>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 2024-08-28 at 14:04 +0300, Anastasia Belova wrote:
> Switch to a managed drm device to cleanup some error handling
> and make future work easier.

It's best to state what the current situation is like and then how this
patch addresses it.

If the cleanup topic is separate from the addressed NULL pointer issue
referenced below, it might make sense to split it into two patches, one
that does the cleanup, and another that addresses the NULL pointer
deref.

>=20
> Fix dereference of NULL in meson_drv_bind_master by removing
> drm_dev_put(drm) before meson_encoder_*_remove where drm
> dereferenced.

(-> "where drm *is* dereferenced" )

Can this be backported to older versions?

If yes, stable@vger.kernel.org should be put on CC.


>=20
> Co-developed by Linux Verification Center (linuxtesting.org).
>=20
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>

Should also include:

Cc: stable@vger.kernel.org # vX.Y
Fixes: <commit>

=D0=A1=D0=BF=D0=B0=D1=81=D0=B8=D0=B1=D0=BE,
P.

> ---
> =C2=A0drivers/gpu/drm/meson/meson_crtc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 10 +--
> =C2=A0drivers/gpu/drm/meson/meson_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 71 ++++++++++----------
> --
> =C2=A0drivers/gpu/drm/meson/meson_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/meson/meson_encoder_cvbs.c |=C2=A0 8 +--
> =C2=A0drivers/gpu/drm/meson/meson_overlay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 8 +--
> =C2=A0drivers/gpu/drm/meson/meson_plane.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10 +--
> =C2=A06 files changed, 51 insertions(+), 58 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_crtc.c
> b/drivers/gpu/drm/meson/meson_crtc.c
> index d70616da8ce2..e1c0bf3baeea 100644
> --- a/drivers/gpu/drm/meson/meson_crtc.c
> +++ b/drivers/gpu/drm/meson/meson_crtc.c
> @@ -662,13 +662,13 @@ void meson_crtc_irq(struct meson_drm *priv)
> =C2=A0
> =C2=A0=09drm_crtc_handle_vblank(priv->crtc);
> =C2=A0
> -=09spin_lock_irqsave(&priv->drm->event_lock, flags);
> +=09spin_lock_irqsave(&priv->drm.event_lock, flags);
> =C2=A0=09if (meson_crtc->event) {
> =C2=A0=09=09drm_crtc_send_vblank_event(priv->crtc, meson_crtc-
> >event);
> =C2=A0=09=09drm_crtc_vblank_put(priv->crtc);
> =C2=A0=09=09meson_crtc->event =3D NULL;
> =C2=A0=09}
> -=09spin_unlock_irqrestore(&priv->drm->event_lock, flags);
> +=09spin_unlock_irqrestore(&priv->drm.event_lock, flags);
> =C2=A0}
> =C2=A0
> =C2=A0int meson_crtc_create(struct meson_drm *priv)
> @@ -677,18 +677,18 @@ int meson_crtc_create(struct meson_drm *priv)
> =C2=A0=09struct drm_crtc *crtc;
> =C2=A0=09int ret;
> =C2=A0
> -=09meson_crtc =3D devm_kzalloc(priv->drm->dev,
> sizeof(*meson_crtc),
> +=09meson_crtc =3D devm_kzalloc(priv->drm.dev,
> sizeof(*meson_crtc),
> =C2=A0=09=09=09=09=C2=A0 GFP_KERNEL);
> =C2=A0=09if (!meson_crtc)
> =C2=A0=09=09return -ENOMEM;
> =C2=A0
> =C2=A0=09meson_crtc->priv =3D priv;
> =C2=A0=09crtc =3D &meson_crtc->base;
> -=09ret =3D drm_crtc_init_with_planes(priv->drm, crtc,
> +=09ret =3D drm_crtc_init_with_planes(&priv->drm, crtc,
> =C2=A0=09=09=09=09=09priv->primary_plane, NULL,
> =C2=A0=09=09=09=09=09&meson_crtc_funcs,
> "meson_crtc");
> =C2=A0=09if (ret) {
> -=09=09dev_err(priv->drm->dev, "Failed to init CRTC\n");
> +=09=09dev_err(priv->drm.dev, "Failed to init CRTC\n");
> =C2=A0=09=09return ret;
> =C2=A0=09}
> =C2=A0
> diff --git a/drivers/gpu/drm/meson/meson_drv.c
> b/drivers/gpu/drm/meson/meson_drv.c
> index 4bd0baa2a4f5..2e7c2e7c7b82 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -182,7 +182,6 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09struct platform_device *pdev =3D to_platform_device(dev);
> =C2=A0=09const struct meson_drm_match_data *match;
> =C2=A0=09struct meson_drm *priv;
> -=09struct drm_device *drm;
> =C2=A0=09struct resource *res;
> =C2=A0=09void __iomem *regs;
> =C2=A0=09int ret, i;
> @@ -197,17 +196,13 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09if (!match)
> =C2=A0=09=09return -ENODEV;
> =C2=A0
> -=09drm =3D drm_dev_alloc(&meson_driver, dev);
> -=09if (IS_ERR(drm))
> -=09=09return PTR_ERR(drm);
> +=09priv =3D devm_drm_dev_alloc(dev, &meson_driver,
> +=09=09=09=09 struct meson_drm, drm);
> =C2=A0
> -=09priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -=09if (!priv) {
> -=09=09ret =3D -ENOMEM;
> -=09=09goto free_drm;
> -=09}
> -=09drm->dev_private =3D priv;
> -=09priv->drm =3D drm;
> +=09if (IS_ERR(priv))
> +=09=09return PTR_ERR(priv);
> +
> +=09priv->drm.dev_private =3D priv;
> =C2=A0=09priv->dev =3D dev;
> =C2=A0=09priv->compat =3D match->compat;
> =C2=A0=09priv->afbcd.ops =3D match->afbcd_ops;
> @@ -215,7 +210,7 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09regs =3D devm_platform_ioremap_resource_byname(pdev, "vpu");
> =C2=A0=09if (IS_ERR(regs)) {
> =C2=A0=09=09ret =3D PTR_ERR(regs);
> -=09=09goto free_drm;
> +=09=09goto remove_encoders;
> =C2=A0=09}
> =C2=A0
> =C2=A0=09priv->io_base =3D regs;
> @@ -223,13 +218,13 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> "hhi");
> =C2=A0=09if (!res) {
> =C2=A0=09=09ret =3D -EINVAL;
> -=09=09goto free_drm;
> +=09=09goto remove_encoders;
> =C2=A0=09}
> =C2=A0=09/* Simply ioremap since it may be a shared register zone */
> =C2=A0=09regs =3D devm_ioremap(dev, res->start, resource_size(res));
> =C2=A0=09if (!regs) {
> =C2=A0=09=09ret =3D -EADDRNOTAVAIL;
> -=09=09goto free_drm;
> +=09=09goto remove_encoders;
> =C2=A0=09}
> =C2=A0
> =C2=A0=09priv->hhi =3D devm_regmap_init_mmio(dev, regs,
> @@ -237,18 +232,18 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09if (IS_ERR(priv->hhi)) {
> =C2=A0=09=09dev_err(&pdev->dev, "Couldn't create the HHI
> regmap\n");
> =C2=A0=09=09ret =3D PTR_ERR(priv->hhi);
> -=09=09goto free_drm;
> +=09=09goto remove_encoders;
> =C2=A0=09}
> =C2=A0
> =C2=A0=09priv->canvas =3D meson_canvas_get(dev);
> =C2=A0=09if (IS_ERR(priv->canvas)) {
> =C2=A0=09=09ret =3D PTR_ERR(priv->canvas);
> -=09=09goto free_drm;
> +=09=09goto remove_encoders;
> =C2=A0=09}
> =C2=A0
> =C2=A0=09ret =3D meson_canvas_alloc(priv->canvas, &priv-
> >canvas_id_osd1);
> =C2=A0=09if (ret)
> -=09=09goto free_drm;
> +=09=09goto remove_encoders;
> =C2=A0=09ret =3D meson_canvas_alloc(priv->canvas, &priv-
> >canvas_id_vd1_0);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto free_canvas_osd1;
> @@ -261,7 +256,7 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0
> =C2=A0=09priv->vsync_irq =3D platform_get_irq(pdev, 0);
> =C2=A0
> -=09ret =3D drm_vblank_init(drm, 1);
> +=09ret =3D drm_vblank_init(&priv->drm, 1);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto free_canvas_vd1_2;
> =C2=A0
> @@ -284,10 +279,10 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09ret =3D drmm_mode_config_init(drm);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto free_canvas_vd1_2;
> -=09drm->mode_config.max_width =3D 3840;
> -=09drm->mode_config.max_height =3D 2160;
> -=09drm->mode_config.funcs =3D &meson_mode_config_funcs;
> -=09drm->mode_config.helper_private=09=3D
> &meson_mode_config_helpers;
> +=09priv->drm.mode_config.max_width =3D 3840;
> +=09priv->drm.mode_config.max_height =3D 2160;
> +=09priv->drm.mode_config.funcs =3D &meson_mode_config_funcs;
> +=09priv->drm.mode_config.helper_private =3D
> &meson_mode_config_helpers;
> =C2=A0
> =C2=A0=09/* Hardware Initialization */
> =C2=A0
> @@ -308,9 +303,9 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09=09goto exit_afbcd;
> =C2=A0
> =C2=A0=09if (has_components) {
> -=09=09ret =3D component_bind_all(dev, drm);
> +=09=09ret =3D component_bind_all(dev, &priv->drm);
> =C2=A0=09=09if (ret) {
> -=09=09=09dev_err(drm->dev, "Couldn't bind all
> components\n");
> +=09=09=09dev_err(priv->drm.dev, "Couldn't bind all
> components\n");
> =C2=A0=09=09=09/* Do not try to unbind */
> =C2=A0=09=09=09has_components =3D false;
> =C2=A0=09=09=09goto exit_afbcd;
> @@ -339,26 +334,26 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09if (ret)
> =C2=A0=09=09goto exit_afbcd;
> =C2=A0
> -=09ret =3D request_irq(priv->vsync_irq, meson_irq, 0, drm-
> >driver->name, drm);
> +=09ret =3D request_irq(priv->vsync_irq, meson_irq, 0, priv-
> >drm.driver->name, &priv->drm);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto exit_afbcd;
> =C2=A0
> -=09drm_mode_config_reset(drm);
> +=09drm_mode_config_reset(&priv->drm);
> =C2=A0
> -=09drm_kms_helper_poll_init(drm);
> +=09drm_kms_helper_poll_init(&priv->drm);
> =C2=A0
> =C2=A0=09platform_set_drvdata(pdev, priv);
> =C2=A0
> -=09ret =3D drm_dev_register(drm, 0);
> +=09ret =3D drm_dev_register(&priv->drm, 0);
> =C2=A0=09if (ret)
> =C2=A0=09=09goto uninstall_irq;
> =C2=A0
> -=09drm_fbdev_dma_setup(drm, 32);
> +=09drm_fbdev_dma_setup(&priv->drm, 32);
> =C2=A0
> =C2=A0=09return 0;
> =C2=A0
> =C2=A0uninstall_irq:
> -=09free_irq(priv->vsync_irq, drm);
> +=09free_irq(priv->vsync_irq, &priv->drm);
> =C2=A0exit_afbcd:
> =C2=A0=09if (priv->afbcd.ops)
> =C2=A0=09=09priv->afbcd.ops->exit(priv);
> @@ -370,15 +365,14 @@ static int meson_drv_bind_master(struct device
> *dev, bool has_components)
> =C2=A0=09meson_canvas_free(priv->canvas, priv->canvas_id_vd1_0);
> =C2=A0free_canvas_osd1:
> =C2=A0=09meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
> -free_drm:
> -=09drm_dev_put(drm);
> +remove_encoders:
> =C2=A0
> =C2=A0=09meson_encoder_dsi_remove(priv);
> =C2=A0=09meson_encoder_hdmi_remove(priv);
> =C2=A0=09meson_encoder_cvbs_remove(priv);
> =C2=A0
> =C2=A0=09if (has_components)
> -=09=09component_unbind_all(dev, drm);
> +=09=09component_unbind_all(dev, &priv->drm);
> =C2=A0
> =C2=A0=09return ret;
> =C2=A0}
> @@ -391,7 +385,7 @@ static int meson_drv_bind(struct device *dev)
> =C2=A0static void meson_drv_unbind(struct device *dev)
> =C2=A0{
> =C2=A0=09struct meson_drm *priv =3D dev_get_drvdata(dev);
> -=09struct drm_device *drm =3D priv->drm;
> +=09struct drm_device *drm =3D &priv->drm;
> =C2=A0
> =C2=A0=09if (priv->canvas) {
> =C2=A0=09=09meson_canvas_free(priv->canvas, priv-
> >canvas_id_osd1);
> @@ -404,7 +398,6 @@ static void meson_drv_unbind(struct device *dev)
> =C2=A0=09drm_kms_helper_poll_fini(drm);
> =C2=A0=09drm_atomic_helper_shutdown(drm);
> =C2=A0=09free_irq(priv->vsync_irq, drm);
> -=09drm_dev_put(drm);
> =C2=A0
> =C2=A0=09meson_encoder_dsi_remove(priv);
> =C2=A0=09meson_encoder_hdmi_remove(priv);
> @@ -428,7 +421,7 @@ static int __maybe_unused
> meson_drv_pm_suspend(struct device *dev)
> =C2=A0=09if (!priv)
> =C2=A0=09=09return 0;
> =C2=A0
> -=09return drm_mode_config_helper_suspend(priv->drm);
> +=09return drm_mode_config_helper_suspend(&priv->drm);
> =C2=A0}
> =C2=A0
> =C2=A0static int __maybe_unused meson_drv_pm_resume(struct device *dev)
> @@ -445,7 +438,7 @@ static int __maybe_unused
> meson_drv_pm_resume(struct device *dev)
> =C2=A0=09if (priv->afbcd.ops)
> =C2=A0=09=09priv->afbcd.ops->init(priv);
> =C2=A0
> -=09return drm_mode_config_helper_resume(priv->drm);
> +=09return drm_mode_config_helper_resume(&priv->drm);
> =C2=A0}
> =C2=A0
> =C2=A0static void meson_drv_shutdown(struct platform_device *pdev)
> @@ -455,8 +448,8 @@ static void meson_drv_shutdown(struct
> platform_device *pdev)
> =C2=A0=09if (!priv)
> =C2=A0=09=09return;
> =C2=A0
> -=09drm_kms_helper_poll_fini(priv->drm);
> -=09drm_atomic_helper_shutdown(priv->drm);
> +=09drm_kms_helper_poll_fini(&priv->drm);
> +=09drm_atomic_helper_shutdown(&priv->drm);
> =C2=A0}
> =C2=A0
> =C2=A0/*
> diff --git a/drivers/gpu/drm/meson/meson_drv.h
> b/drivers/gpu/drm/meson/meson_drv.h
> index 3f9345c14f31..c4c6c810cb20 100644
> --- a/drivers/gpu/drm/meson/meson_drv.h
> +++ b/drivers/gpu/drm/meson/meson_drv.h
> @@ -53,7 +53,7 @@ struct meson_drm {
> =C2=A0=09u8 canvas_id_vd1_1;
> =C2=A0=09u8 canvas_id_vd1_2;
> =C2=A0
> -=09struct drm_device *drm;
> +=09struct drm_device drm;
> =C2=A0=09struct drm_crtc *crtc;
> =C2=A0=09struct drm_plane *primary_plane;
> =C2=A0=09struct drm_plane *overlay_plane;
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index d1191de855d9..ddca22c8c1ff 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -104,7 +104,7 @@ static int meson_encoder_cvbs_get_modes(struct
> drm_bridge *bridge,
> =C2=A0=09for (i =3D 0; i < MESON_CVBS_MODES_COUNT; ++i) {
> =C2=A0=09=09struct meson_cvbs_mode *meson_mode =3D
> &meson_cvbs_modes[i];
> =C2=A0
> -=09=09mode =3D drm_mode_duplicate(priv->drm, &meson_mode-
> >mode);
> +=09=09mode =3D drm_mode_duplicate(&priv->drm, &meson_mode-
> >mode);
> =C2=A0=09=09if (!mode) {
> =C2=A0=09=09=09dev_err(priv->dev, "Failed to create a new
> display mode\n");
> =C2=A0=09=09=09return 0;
> @@ -221,7 +221,7 @@ static const struct drm_bridge_funcs
> meson_encoder_cvbs_bridge_funcs =3D {
> =C2=A0
> =C2=A0int meson_encoder_cvbs_probe(struct meson_drm *priv)
> =C2=A0{
> -=09struct drm_device *drm =3D priv->drm;
> +=09struct drm_device *drm =3D &priv->drm;
> =C2=A0=09struct meson_encoder_cvbs *meson_encoder_cvbs;
> =C2=A0=09struct drm_connector *connector;
> =C2=A0=09struct device_node *remote;
> @@ -256,7 +256,7 @@ int meson_encoder_cvbs_probe(struct meson_drm
> *priv)
> =C2=A0=09meson_encoder_cvbs->priv =3D priv;
> =C2=A0
> =C2=A0=09/* Encoder */
> -=09ret =3D drm_simple_encoder_init(priv->drm,
> &meson_encoder_cvbs->encoder,
> +=09ret =3D drm_simple_encoder_init(&priv->drm,
> &meson_encoder_cvbs->encoder,
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_MODE_ENCODER_TVDAC);
> =C2=A0=09if (ret)
> =C2=A0=09=09return dev_err_probe(priv->dev, ret,
> @@ -273,7 +273,7 @@ int meson_encoder_cvbs_probe(struct meson_drm
> *priv)
> =C2=A0=09}
> =C2=A0
> =C2=A0=09/* Initialize & attach Bridge Connector */
> -=09connector =3D drm_bridge_connector_init(priv->drm,
> &meson_encoder_cvbs->encoder);
> +=09connector =3D drm_bridge_connector_init(&priv->drm,
> &meson_encoder_cvbs->encoder);
> =C2=A0=09if (IS_ERR(connector))
> =C2=A0=09=09return dev_err_probe(priv->dev, PTR_ERR(connector),
> =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 "Unable to create CVBS bridge
> connector\n");
> diff --git a/drivers/gpu/drm/meson/meson_overlay.c
> b/drivers/gpu/drm/meson/meson_overlay.c
> index 7f98de38842b..60ee7f758723 100644
> --- a/drivers/gpu/drm/meson/meson_overlay.c
> +++ b/drivers/gpu/drm/meson/meson_overlay.c
> @@ -484,7 +484,7 @@ static void meson_overlay_atomic_update(struct
> drm_plane *plane,
> =C2=A0
> =C2=A0=09interlace_mode =3D new_state->crtc->mode.flags &
> DRM_MODE_FLAG_INTERLACE;
> =C2=A0
> -=09spin_lock_irqsave(&priv->drm->event_lock, flags);
> +=09spin_lock_irqsave(&priv->drm.event_lock, flags);
> =C2=A0
> =C2=A0=09if ((fb->modifier & DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) =3D=3D
> =C2=A0=09=09=09=C2=A0=C2=A0=C2=A0 DRM_FORMAT_MOD_AMLOGIC_FBC(0, 0)) {
> @@ -717,7 +717,7 @@ static void meson_overlay_atomic_update(struct
> drm_plane *plane,
> =C2=A0
> =C2=A0=09priv->viu.vd1_enabled =3D true;
> =C2=A0
> -=09spin_unlock_irqrestore(&priv->drm->event_lock, flags);
> +=09spin_unlock_irqrestore(&priv->drm.event_lock, flags);
> =C2=A0
> =C2=A0=09DRM_DEBUG_DRIVER("\n");
> =C2=A0}
> @@ -838,7 +838,7 @@ int meson_overlay_create(struct meson_drm *priv)
> =C2=A0
> =C2=A0=09DRM_DEBUG_DRIVER("\n");
> =C2=A0
> -=09meson_overlay =3D devm_kzalloc(priv->drm->dev,
> sizeof(*meson_overlay),
> +=09meson_overlay =3D devm_kzalloc(priv->drm.dev,
> sizeof(*meson_overlay),
> =C2=A0=09=09=09=09=C2=A0=C2=A0 GFP_KERNEL);
> =C2=A0=09if (!meson_overlay)
> =C2=A0=09=09return -ENOMEM;
> @@ -846,7 +846,7 @@ int meson_overlay_create(struct meson_drm *priv)
> =C2=A0=09meson_overlay->priv =3D priv;
> =C2=A0=09plane =3D &meson_overlay->base;
> =C2=A0
> -=09drm_universal_plane_init(priv->drm, plane, 0xFF,
> +=09drm_universal_plane_init(&priv->drm, plane, 0xFF,
> =C2=A0=09=09=09=09 &meson_overlay_funcs,
> =C2=A0=09=09=09=09 supported_drm_formats,
> =C2=A0=09=09=09=09 ARRAY_SIZE(supported_drm_formats),
> diff --git a/drivers/gpu/drm/meson/meson_plane.c
> b/drivers/gpu/drm/meson/meson_plane.c
> index b43ac61201f3..13be94309bf4 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -157,7 +157,7 @@ static void meson_plane_atomic_update(struct
> drm_plane *plane,
> =C2=A0=09 * Update Buffer
> =C2=A0=09 * Enable Plane
> =C2=A0=09 */
> -=09spin_lock_irqsave(&priv->drm->event_lock, flags);
> +=09spin_lock_irqsave(&priv->drm.event_lock, flags);
> =C2=A0
> =C2=A0=09/* Check if AFBC decoder is required for this buffer */
> =C2=A0=09if ((meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM) ||
> @@ -393,7 +393,7 @@ static void meson_plane_atomic_update(struct
> drm_plane *plane,
> =C2=A0
> =C2=A0=09priv->viu.osd1_enabled =3D true;
> =C2=A0
> -=09spin_unlock_irqrestore(&priv->drm->event_lock, flags);
> +=09spin_unlock_irqrestore(&priv->drm.event_lock, flags);
> =C2=A0}
> =C2=A0
> =C2=A0static void meson_plane_atomic_disable(struct drm_plane *plane,
> @@ -536,7 +536,7 @@ int meson_plane_create(struct meson_drm *priv)
> =C2=A0=09const uint64_t *format_modifiers =3D format_modifiers_default;
> =C2=A0=09int ret;
> =C2=A0
> -=09meson_plane =3D devm_kzalloc(priv->drm->dev,
> sizeof(*meson_plane),
> +=09meson_plane =3D devm_kzalloc(priv->drm.dev,
> sizeof(*meson_plane),
> =C2=A0=09=09=09=09=C2=A0=C2=A0 GFP_KERNEL);
> =C2=A0=09if (!meson_plane)
> =C2=A0=09=09return -ENOMEM;
> @@ -549,14 +549,14 @@ int meson_plane_create(struct meson_drm *priv)
> =C2=A0=09else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> =C2=A0=09=09format_modifiers =3D format_modifiers_afbc_g12a;
> =C2=A0
> -=09ret =3D drm_universal_plane_init(priv->drm, plane, 0xFF,
> +=09ret =3D drm_universal_plane_init(&priv->drm, plane, 0xFF,
> =C2=A0=09=09=09=09=09&meson_plane_funcs,
> =C2=A0=09=09=09=09=09supported_drm_formats,
> =C2=A0=09=09=09=09=09ARRAY_SIZE(supported_drm_for
> mats),
> =C2=A0=09=09=09=09=09format_modifiers,
> =C2=A0=09=09=09=09=09DRM_PLANE_TYPE_PRIMARY,
> "meson_primary_plane");
> =C2=A0=09if (ret) {
> -=09=09devm_kfree(priv->drm->dev, meson_plane);
> +=09=09devm_kfree(priv->drm.dev, meson_plane);
> =C2=A0=09=09return ret;
> =C2=A0=09}
> =C2=A0

