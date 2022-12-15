Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9064E1E5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 20:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23A410E0A2;
	Thu, 15 Dec 2022 19:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 987 seconds by postgrey-1.36 at gabe;
 Thu, 15 Dec 2022 19:41:40 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0740510E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 19:41:40 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p5tog-0006Zv-ER; Thu, 15 Dec 2022 20:22:50 +0100
Message-ID: <8092f2cb083f9b9a189dbdf6f27ee874955af7db.camel@pengutronix.de>
Subject: Re: [PATCH v2 12/26] drm: etnaviv: Remove #ifdef guards for PM
 related functions
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Dec 2022 20:22:48 +0100
In-Reply-To: <20221129191733.137897-13-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191733.137897-13-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 29.11.2022 um 19:17 +0000 schrieb Paul Cercueil:
> Use the RUNTIME_PM_OPS() and pm_ptr() macros to handle the
> .runtime_suspend/.runtime_resume callbacks.
>=20
> These macros allow the suspend and resume functions to be automatically
> dropped by the compiler when CONFIG_PM is disabled, without having
> to use #ifdef guards.
>=20
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>=20
> Some #ifdef CONFIG_PM guards were protecting simple statements, and were
> also converted to "if (IS_ENABLED(CONFIG_PM))".
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Thanks, applied to my etnaviv/next branch.

Regards,
Lucas

> ---
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 30 +++++++++++----------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 51320eeebfcf..310382812029 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1629,7 +1629,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gp=
u *gpu)
>  	return etnaviv_gpu_clk_disable(gpu);
>  }
> =20
> -#ifdef CONFIG_PM
>  static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
> @@ -1645,7 +1644,6 @@ static int etnaviv_gpu_hw_resume(struct etnaviv_gpu=
 *gpu)
> =20
>  	return 0;
>  }
> -#endif
> =20
>  static int
>  etnaviv_gpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
> @@ -1713,11 +1711,10 @@ static int etnaviv_gpu_bind(struct device *dev, s=
truct device *master,
>  	if (ret)
>  		goto out_workqueue;
> =20
> -#ifdef CONFIG_PM
> -	ret =3D pm_runtime_get_sync(gpu->dev);
> -#else
> -	ret =3D etnaviv_gpu_clk_enable(gpu);
> -#endif
> +	if (IS_ENABLED(CONFIG_PM))
> +		ret =3D pm_runtime_get_sync(gpu->dev);
> +	else
> +		ret =3D etnaviv_gpu_clk_enable(gpu);
>  	if (ret < 0)
>  		goto out_sched;
> =20
> @@ -1761,12 +1758,12 @@ static void etnaviv_gpu_unbind(struct device *dev=
, struct device *master,
> =20
>  	etnaviv_sched_fini(gpu);
> =20
> -#ifdef CONFIG_PM
> -	pm_runtime_get_sync(gpu->dev);
> -	pm_runtime_put_sync_suspend(gpu->dev);
> -#else
> -	etnaviv_gpu_hw_suspend(gpu);
> -#endif
> +	if (IS_ENABLED(CONFIG_PM)) {
> +		pm_runtime_get_sync(gpu->dev);
> +		pm_runtime_put_sync_suspend(gpu->dev);
> +	} else {
> +		etnaviv_gpu_hw_suspend(gpu);
> +	}
> =20
>  	if (gpu->mmu_context)
>  		etnaviv_iommu_context_put(gpu->mmu_context);
> @@ -1880,7 +1877,6 @@ static int etnaviv_gpu_platform_remove(struct platf=
orm_device *pdev)
>  	return 0;
>  }
> =20
> -#ifdef CONFIG_PM
>  static int etnaviv_gpu_rpm_suspend(struct device *dev)
>  {
>  	struct etnaviv_gpu *gpu =3D dev_get_drvdata(dev);
> @@ -1923,18 +1919,16 @@ static int etnaviv_gpu_rpm_resume(struct device *=
dev)
> =20
>  	return 0;
>  }
> -#endif
> =20
>  static const struct dev_pm_ops etnaviv_gpu_pm_ops =3D {
> -	SET_RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
>  };
> =20
>  struct platform_driver etnaviv_gpu_driver =3D {
>  	.driver =3D {
>  		.name =3D "etnaviv-gpu",
>  		.owner =3D THIS_MODULE,
> -		.pm =3D &etnaviv_gpu_pm_ops,
> +		.pm =3D pm_ptr(&etnaviv_gpu_pm_ops),
>  		.of_match_table =3D etnaviv_gpu_match,
>  	},
>  	.probe =3D etnaviv_gpu_platform_probe,

