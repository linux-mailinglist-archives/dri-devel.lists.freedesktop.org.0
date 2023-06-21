Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F1737E05
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7D810E423;
	Wed, 21 Jun 2023 09:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FD810E422
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:08:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBtoi-0002P0-7d; Wed, 21 Jun 2023 11:07:56 +0200
Message-ID: <77f62814f98dd2728a1e4747f0db6b2a3cfa2c11.camel@pengutronix.de>
Subject: Re: [PATCH v10 01/11] drm/etnaviv: Add a dedicated function to
 register an irq handler
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <18949883232@163.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 11:07:51 +0200
In-Reply-To: <20230620094716.2231414-2-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-2-18949883232@163.com>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, dem 20.06.2023 um 17:47 +0800 schrieb Sui Jingfeng:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>=20
> Because getting IRQ from a device is platform-dependent, PCI devices have
> different methods for getting an IRQ. This patch is a preparation to exte=
nd
> this driver for supporting the PCI devices.
>=20
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 32 +++++++++++++++++++--------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index de8c9894967c..a03e81337d8f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1817,6 +1817,27 @@ static const struct of_device_id etnaviv_gpu_match=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
> =20
> +static int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
> +{
> +	struct device *dev =3D gpu->dev;
> +	int err;
> +
> +	if (irq < 0)
> +		return irq;
> +
> +	err =3D devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
> +	if (err) {
> +		dev_err(dev, "failed to request irq %u: %d\n", irq, err);
> +		return err;
> +	}
> +
> +	gpu->irq =3D irq;
> +
> +	dev_info(dev, "irq(%d) handler registered\n", irq);

There is no reason to put this into the kernel log. It's no different
than other resources to the driver and we don't log each one of those
either.

In fact I don't see any reason for this change in the first place.
Effectively you are moving a single function call into a new function,
which doesn't seem like an improvement.

Regards,
Lucas

> +
> +	return 0;
> +}
> +
>  static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -1837,16 +1858,9 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
>  		return PTR_ERR(gpu->mmio);
> =20
>  	/* Get Interrupt: */
> -	gpu->irq =3D platform_get_irq(pdev, 0);
> -	if (gpu->irq < 0)
> -		return gpu->irq;
> -
> -	err =3D devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> -			       dev_name(gpu->dev), gpu);
> -	if (err) {
> -		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
> +	err =3D etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
> +	if (err)
>  		return err;
> -	}
> =20
>  	/* Get Clocks: */
>  	gpu->clk_reg =3D devm_clk_get_optional(&pdev->dev, "reg");

