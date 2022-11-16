Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5962BFC0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D21110E4AC;
	Wed, 16 Nov 2022 13:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF6A10E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:41:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF5B049C;
 Wed, 16 Nov 2022 14:41:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668606074;
 bh=7kjV9XaHGlcIvSJMo1l48yxddcL5QyvUynUQIQE/utQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PiSQRbxCpnhfvhLOvIlPUw+8d+v/T/vnY2kITjyVbbBRPRnaI26+x6KjSeEJAkFiE
 R/4WIZXhHw0F1vbQABp1Wn2bdozEEwXuxGS45peSlO4RxQUTFRRahTtr9S6UAmjYat
 S/H9lzSD7Uf3qXQDbCCMFxxR29ESVlnrcRDsinKk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221107175256.360839-7-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
 <20221107175256.360839-7-paul@crapouillou.net>
Subject: Re: [PATCH 17/26] drm: rcar-du: Remove #ifdef guards for PM related
 functions
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 16 Nov 2022 13:41:12 +0000
Message-ID: <166860607235.50677.11372324946195607108@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Paul Cercueil (2022-11-07 17:52:47)
> Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
> the .suspend/.resume callbacks.
>=20
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_SUSPEND is disabled, without having
> to use #ifdef guards.
>=20
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Seems reasonable to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar=
-du/rcar_du_drv.c
> index a2776f1d6f2c..0a89094461cc 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -599,7 +599,6 @@ static const struct drm_driver rcar_du_driver =3D {
>   * Power management
>   */
> =20
> -#ifdef CONFIG_PM_SLEEP
>  static int rcar_du_pm_suspend(struct device *dev)
>  {
>         struct rcar_du_device *rcdu =3D dev_get_drvdata(dev);
> @@ -613,11 +612,9 @@ static int rcar_du_pm_resume(struct device *dev)
> =20
>         return drm_mode_config_helper_resume(&rcdu->ddev);
>  }
> -#endif
> =20
> -static const struct dev_pm_ops rcar_du_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(rcar_du_pm_suspend, rcar_du_pm_resume)
> -};
> +static DEFINE_SIMPLE_DEV_PM_OPS(rcar_du_pm_ops,
> +                               rcar_du_pm_suspend, rcar_du_pm_resume);
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * Platform driver
> @@ -712,7 +709,7 @@ static struct platform_driver rcar_du_platform_driver=
 =3D {
>         .shutdown       =3D rcar_du_shutdown,
>         .driver         =3D {
>                 .name   =3D "rcar-du",
> -               .pm     =3D &rcar_du_pm_ops,
> +               .pm     =3D pm_sleep_ptr(&rcar_du_pm_ops),
>                 .of_match_table =3D rcar_du_of_table,
>         },
>  };
> --=20
> 2.35.1
>
