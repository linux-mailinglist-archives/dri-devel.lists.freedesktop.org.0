Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC053718908
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 20:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D1410E506;
	Wed, 31 May 2023 18:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FAC10E1DD
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 18:07:53 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q4QEc-0002pT-KH; Wed, 31 May 2023 20:07:46 +0200
Message-ID: <85565974d45b5553035aeabe8a98a667718482d5.camel@pengutronix.de>
Subject: Re: [PATCH v6 2/6] drm/etnaviv: add a dedicated function to get
 various clocks
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 31 May 2023 20:07:43 +0200
In-Reply-To: <20230530160643.2344551-3-suijingfeng@loongson.cn>
References: <20230530160643.2344551-1-suijingfeng@loongson.cn>
 <20230530160643.2344551-3-suijingfeng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: loongson-kernel@lists.loongnix.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 31.05.2023 um 00:06 +0800 schrieb Sui Jingfeng:
> Because it is also platform-dependent, there are environments where don't
> have CLK subsystem support, for example, discreted PCI gpu. So don't rage
> quit if there is no CLK subsystem.
>=20
> For the GPU in LS7a1000 and LS2k2000, the working frequency of the GPU is
> tuned by configuring the PLL register directly.
>=20
Is this PLL under control of system firmware and invisible to Linux?

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 62 ++++++++++++++++++---------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  1 +
>  2 files changed, 42 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 636d3f39ddcb..4937580551a5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1565,10 +1565,45 @@ static irqreturn_t irq_handler(int irq, void *dat=
a)
>  	return ret;
>  }
> =20
> +static int etnaviv_gpu_clk_get(struct etnaviv_gpu *gpu)
> +{
> +	struct device *dev =3D gpu->dev;
> +
> +	if (gpu->no_clk)
> +		return 0;
> +
> +	gpu->clk_reg =3D devm_clk_get_optional(dev, "reg");
> +	DBG("clk_reg: %p", gpu->clk_reg);
> +	if (IS_ERR(gpu->clk_reg))
> +		return PTR_ERR(gpu->clk_reg);
> +
> +	gpu->clk_bus =3D devm_clk_get_optional(dev, "bus");
> +	DBG("clk_bus: %p", gpu->clk_bus);
> +	if (IS_ERR(gpu->clk_bus))
> +		return PTR_ERR(gpu->clk_bus);
> +
> +	gpu->clk_core =3D devm_clk_get(dev, "core");
> +	DBG("clk_core: %p", gpu->clk_core);
> +	if (IS_ERR(gpu->clk_core))
> +		return PTR_ERR(gpu->clk_core);
> +	gpu->base_rate_core =3D clk_get_rate(gpu->clk_core);
> +
> +	gpu->clk_shader =3D devm_clk_get_optional(dev, "shader");
> +	DBG("clk_shader: %p", gpu->clk_shader);
> +	if (IS_ERR(gpu->clk_shader))
> +		return PTR_ERR(gpu->clk_shader);
> +	gpu->base_rate_shader =3D clk_get_rate(gpu->clk_shader);
> +
> +	return 0;
> +}
> +
>  static int etnaviv_gpu_clk_enable(struct etnaviv_gpu *gpu)
>  {
>  	int ret;
> =20
> +	if (gpu->no_clk)
> +		return 0;
> +
I don't see why this would be needed? If your platform doesn't provide
CONFIG_HAVE_CLK all those functions should be successful no-ops, so
there is no need to special case this in the driver.

Or does your platform in fact provide a clk subsystem, just the GPU
clocks are managed by it?

Also all those functions are fine with being called on a NULL clk, so
shouldn't it be enough to simply avoid calling etnaviv_gpu_clk_get() in
the PCI device case?

Regards,
Lucas

>  	ret =3D clk_prepare_enable(gpu->clk_reg);
>  	if (ret)
>  		return ret;
> @@ -1599,6 +1634,9 @@ static int etnaviv_gpu_clk_enable(struct etnaviv_gp=
u *gpu)
> =20
>  static int etnaviv_gpu_clk_disable(struct etnaviv_gpu *gpu)
>  {
> +	if (gpu->no_clk)
> +		return 0;
> +
>  	clk_disable_unprepare(gpu->clk_shader);
>  	clk_disable_unprepare(gpu->clk_core);
>  	clk_disable_unprepare(gpu->clk_bus);
> @@ -1865,27 +1903,9 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
>  		return err;
> =20
>  	/* Get Clocks: */
> -	gpu->clk_reg =3D devm_clk_get_optional(&pdev->dev, "reg");
> -	DBG("clk_reg: %p", gpu->clk_reg);
> -	if (IS_ERR(gpu->clk_reg))
> -		return PTR_ERR(gpu->clk_reg);
> -
> -	gpu->clk_bus =3D devm_clk_get_optional(&pdev->dev, "bus");
> -	DBG("clk_bus: %p", gpu->clk_bus);
> -	if (IS_ERR(gpu->clk_bus))
> -		return PTR_ERR(gpu->clk_bus);
> -
> -	gpu->clk_core =3D devm_clk_get(&pdev->dev, "core");
> -	DBG("clk_core: %p", gpu->clk_core);
> -	if (IS_ERR(gpu->clk_core))
> -		return PTR_ERR(gpu->clk_core);
> -	gpu->base_rate_core =3D clk_get_rate(gpu->clk_core);
> -
> -	gpu->clk_shader =3D devm_clk_get_optional(&pdev->dev, "shader");
> -	DBG("clk_shader: %p", gpu->clk_shader);
> -	if (IS_ERR(gpu->clk_shader))
> -		return PTR_ERR(gpu->clk_shader);
> -	gpu->base_rate_shader =3D clk_get_rate(gpu->clk_shader);
> +	err =3D etnaviv_gpu_clk_get(gpu);
> +	if (err)
> +		return err;
> =20
>  	/* TODO: figure out max mapped size */
>  	dev_set_drvdata(dev, gpu);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 98c6f9c320fc..6da5209a7d64 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -148,6 +148,7 @@ struct etnaviv_gpu {
>  	struct clk *clk_reg;
>  	struct clk *clk_core;
>  	struct clk *clk_shader;
> +	bool no_clk;
> =20
>  	unsigned int freq_scale;
>  	unsigned long base_rate_core;

