Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD116F9AFA
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 20:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BA610E0C2;
	Sun,  7 May 2023 18:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF4610E0C2
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 18:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1683485195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7zExjFWqzdV/4mLRg4OsQL2ARudC9gcfA8x4buki0YI=;
 b=wVJhMqrrsq3rfxaRGcr+TjzOONqt1C9gg2i4IRq8ErT88IYCXjLMDZwzA/ZSQLDGFC0MLU
 foPA+c16h4Ym1Mv80I4pBjpQD9Ozo7FOxQ65K3yCmnlSLz2mlNlWOa9IbFjTBPGyIOABdP
 +1TOrlHLp0Gya9K38V5havgFmVnlrVo=
Message-ID: <c62e45951bb3d26008a3ddb90205f223131c2d0e.camel@crapouillou.net>
Subject: Re: [PATCH 23/53] drm/ingenic: Convert to platform remove callback
 returning void
From: Paul Cercueil <paul@crapouillou.net>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 07 May 2023 20:46:33 +0200
In-Reply-To: <20230507162616.1368908-24-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-24-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: kernel@pengutronix.de, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le dimanche 07 mai 2023 =C3=A0 18:25 +0200, Uwe Kleine-K=C3=B6nig a =C3=A9c=
rit=C2=A0:
> The .remove() callback for a platform driver returns an int which
> makes
> many driver authors wrongly assume it's possible to do error handling
> by
> returning an error code. However the value returned is (mostly)
> ignored
> and this typically results in resource leaks. To improve here there
> is a
> quest to make the remove callback return void. In the first step of
> this
> quest all drivers are converted to .remove_new() which already
> returns
> void.
>=20
> Trivially convert the ingenic drm drivers from always returning zero
> in
> the remove callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 6 ++----
> =C2=A0drivers/gpu/drm/ingenic/ingenic-ipu.c=C2=A0=C2=A0=C2=A0=C2=A0 | 5 +=
+---
> =C2=A02 files changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5ec75e9ba499..4a22b7465080 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1449,7 +1449,7 @@ static int ingenic_drm_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return component_master_a=
dd_with_match(dev,
> &ingenic_master_ops, match);
> =C2=A0}
> =C2=A0
> -static int ingenic_drm_remove(struct platform_device *pdev)
> +static void ingenic_drm_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device *dev =3D &p=
dev->dev;
> =C2=A0
> @@ -1457,8 +1457,6 @@ static int ingenic_drm_remove(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ingenic_drm_unbind(dev);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0component_master_del(dev, &ingenic_master_ops);
> -
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int ingenic_drm_suspend(struct device *dev)
> @@ -1611,7 +1609,7 @@ static struct platform_driver
> ingenic_drm_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D of_match_ptr(ingenic_drm_of_mat=
ch),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe =3D ingenic_drm_pr=
obe,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove =3D ingenic_drm_remove=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove_new =3D ingenic_drm_re=
move,
> =C2=A0};
> =C2=A0
> =C2=A0static int ingenic_drm_init(void)
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 7a43505011a5..fc0d8512d217 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -922,10 +922,9 @@ static int ingenic_ipu_probe(struct
> platform_device *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return component_add(&pde=
v->dev, &ingenic_ipu_ops);
> =C2=A0}
> =C2=A0
> -static int ingenic_ipu_remove(struct platform_device *pdev)
> +static void ingenic_ipu_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0component_del(&pdev->dev,=
 &ingenic_ipu_ops);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static const u32 jz4725b_ipu_formats[] =3D {
> @@ -992,7 +991,7 @@ static struct platform_driver ingenic_ipu_driver
> =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.of_match_table =3D ingenic_ipu_of_match,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe =3D ingenic_ipu_pr=
obe,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove =3D ingenic_ipu_remove=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove_new =3D ingenic_ipu_re=
move,
> =C2=A0};
> =C2=A0
> =C2=A0struct platform_driver *ingenic_ipu_driver_ptr =3D
> &ingenic_ipu_driver;

