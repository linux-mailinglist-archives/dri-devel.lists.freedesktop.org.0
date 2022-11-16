Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B162BFC7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 14:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63DB10E4AA;
	Wed, 16 Nov 2022 13:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A9810E4AA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 13:42:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24E5649C;
 Wed, 16 Nov 2022 14:42:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668606121;
 bh=ly9CkcS/E6lEtVCZSc//19c85px1pIbhycLP/DAh1Cw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lEFmnNRZreTfZ1Wat9uytAN4TR+xMZC/JVaIbPKtEvSGqBRy/IhoWFRtzZ7mXkIa/
 HB1SorTuNEvROnYNcS7LTtV5FZD4dsHgjctEbqWuzA4FrKl1fAg3+q0YK1FtfUxILc
 SZND94ydG+7VJuIGW9NulFOzO2SBMknNiJHxA0I8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221107175256.360839-9-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175256.360839-1-paul@crapouillou.net>
 <20221107175256.360839-9-paul@crapouillou.net>
Subject: Re: [PATCH 19/26] drm: shmobile: Remove #ifdef guards for PM related
 functions
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 16 Nov 2022 13:41:58 +0000
Message-ID: <166860611898.50677.15769438490654163273@Monstersaurus>
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

Quoting Paul Cercueil (2022-11-07 17:52:49)
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

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/s=
hmobile/shmob_drm_drv.c
> index 3d511fa38913..337040fa6438 100644
> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
> @@ -143,7 +143,6 @@ static const struct drm_driver shmob_drm_driver =3D {
>   * Power management
>   */
> =20
> -#ifdef CONFIG_PM_SLEEP
>  static int shmob_drm_pm_suspend(struct device *dev)
>  {
>         struct shmob_drm_device *sdev =3D dev_get_drvdata(dev);
> @@ -165,11 +164,9 @@ static int shmob_drm_pm_resume(struct device *dev)
>         drm_kms_helper_poll_enable(sdev->ddev);
>         return 0;
>  }
> -#endif
> =20
> -static const struct dev_pm_ops shmob_drm_pm_ops =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(shmob_drm_pm_suspend, shmob_drm_pm_resume)
> -};
> +static DEFINE_SIMPLE_DEV_PM_OPS(shmob_drm_pm_ops,
> +                               shmob_drm_pm_suspend, shmob_drm_pm_resume=
);
> =20
>  /* ---------------------------------------------------------------------=
--------
>   * Platform driver
> @@ -292,7 +289,7 @@ static struct platform_driver shmob_drm_platform_driv=
er =3D {
>         .remove         =3D shmob_drm_remove,
>         .driver         =3D {
>                 .name   =3D "shmob-drm",
> -               .pm     =3D &shmob_drm_pm_ops,
> +               .pm     =3D pm_sleep_ptr(&shmob_drm_pm_ops),
>         },
>  };
> =20
> --=20
> 2.35.1
>
