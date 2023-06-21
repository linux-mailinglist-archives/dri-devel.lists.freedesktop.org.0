Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E3737EFD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5043910E41D;
	Wed, 21 Jun 2023 09:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB1410E41D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:29:58 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBu9t-0005p1-SG; Wed, 21 Jun 2023 11:29:50 +0200
Message-ID: <2c48ad0d1277f880d4d758fe3a3ad24d33e2fabe.camel@pengutronix.de>
Subject: Re: [PATCH v10 05/11] drm/etnaviv: Allow bypass component framework
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <18949883232@163.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 11:29:48 +0200
In-Reply-To: <20230620094716.2231414-6-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-6-18949883232@163.com>
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
> Originally, component frameworks were used to bind multiple GPU cores to =
a
> virtual master. But there are chips that have only one GPU core integrate=
d.
> The component framework can be avoided under some circumstances, Another
> reason is that=C2=A0usperspace programs=C2=A0such as X server and Mesa wi=
ll try to
> find the PCI device to use by default. Creating a virtual master device
> for PCI GPUs cause unnecessary troubles.
>=20
> This patch add additional code paths to allow bypassing the component
> frameworks, platforms with a single GPU core could probably try the
> non-component code path also. This patch is for code shaing between the
> PCI driver and the platform driver.
>=20
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 47 ++++++++++-----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 83 +++++++++++++++++----------
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  3 +
>  3 files changed, 91 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 6a048be02857..93ca240cd4c0 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -536,10 +536,9 @@ static const struct drm_driver etnaviv_drm_driver =
=3D {
>  	.minor              =3D 3,
>  };
> =20
> -/*
> - * Platform driver:
> - */
> -static int etnaviv_bind(struct device *dev)
> +static struct etnaviv_drm_private *etna_private_ptr;

That's not going to fly. You are dropping the virtual master device,
which bundles multiple GPUs together, but you are also only allowing a
single GPU instance via this global private data pointer.

I'm okay with dropping the virtual master and instantiating a DRM
device for each PCI device, but then the driver at least needs to be
able to handle multiple instances.

Also what exactly is the problem with the virtual master device?
Couldn't we just instantiate one of those for each PCI device to
minimize the changes needed to the bind/unbind logic?

Regards,
Lucas

> +
> +static int etnaviv_drm_bind(struct device *dev, bool component)
>  {
>  	struct etnaviv_drm_private *priv;
>  	struct drm_device *drm;
> @@ -556,12 +555,15 @@ static int etnaviv_bind(struct device *dev)
>  	}
> =20
>  	drm->dev_private =3D priv;
> +	etna_private_ptr =3D priv;
> =20
>  	dma_set_max_seg_size(dev, SZ_2G);
> =20
> -	dev_set_drvdata(dev, drm);
> +	if (component)
> +		ret =3D component_bind_all(dev, drm);
> +	else
> +		ret =3D etnaviv_gpu_bind(dev, NULL, drm);
> =20
> -	ret =3D component_bind_all(dev, drm);
>  	if (ret < 0)
>  		goto out_free_priv;
> =20
> @@ -574,7 +576,10 @@ static int etnaviv_bind(struct device *dev)
>  	return 0;
> =20
>  out_unbind:
> -	component_unbind_all(dev, drm);
> +	if (component)
> +		component_unbind_all(dev, drm);
> +	else
> +		etnaviv_gpu_unbind(dev, NULL, drm);
>  out_free_priv:
>  	etnaviv_free_private(priv);
>  out_put:
> @@ -583,14 +588,17 @@ static int etnaviv_bind(struct device *dev)
>  	return ret;
>  }
> =20
> -static void etnaviv_unbind(struct device *dev)
> +static void etnaviv_drm_unbind(struct device *dev, bool component)
>  {
> -	struct drm_device *drm =3D dev_get_drvdata(dev);
> -	struct etnaviv_drm_private *priv =3D drm->dev_private;
> +	struct etnaviv_drm_private *priv =3D etna_private_ptr;
> +	struct drm_device *drm =3D priv->drm;
> =20
>  	drm_dev_unregister(drm);
> =20
> -	component_unbind_all(dev, drm);
> +	if (component)
> +		component_unbind_all(dev, drm);
> +	else
> +		etnaviv_gpu_unbind(dev, NULL, drm);
> =20
>  	etnaviv_free_private(priv);
> =20
> @@ -599,9 +607,22 @@ static void etnaviv_unbind(struct device *dev)
>  	drm_dev_put(drm);
>  }
> =20
> +/*
> + * Platform driver:
> + */
> +static int etnaviv_master_bind(struct device *dev)
> +{
> +	return etnaviv_drm_bind(dev, true);
> +}
> +
> +static void etnaviv_master_unbind(struct device *dev)
> +{
> +	return etnaviv_drm_unbind(dev, true);
> +}
> +
>  static const struct component_master_ops etnaviv_master_ops =3D {
> -	.bind =3D etnaviv_bind,
> -	.unbind =3D etnaviv_unbind,
> +	.bind =3D etnaviv_master_bind,
> +	.unbind =3D etnaviv_master_unbind,
>  };
> =20
>  static int etnaviv_pdev_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 5e88fa95dac2..059be8c89c5a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1737,8 +1737,7 @@ static const struct thermal_cooling_device_ops cool=
ing_ops =3D {
>  	.set_cur_state =3D etnaviv_gpu_cooling_set_cur_state,
>  };
> =20
> -static int etnaviv_gpu_bind(struct device *dev, struct device *master,
> -	void *data)
> +int etnaviv_gpu_bind(struct device *dev, struct device *master, void *da=
ta)
>  {
>  	struct drm_device *drm =3D data;
>  	struct etnaviv_drm_private *priv =3D drm->dev_private;
> @@ -1769,7 +1768,6 @@ static int etnaviv_gpu_bind(struct device *dev, str=
uct device *master,
>  	if (ret < 0)
>  		goto out_sched;
> =20
> -
>  	gpu->drm =3D drm;
>  	gpu->fence_context =3D dma_fence_context_alloc(1);
>  	xa_init_flags(&gpu->user_fences, XA_FLAGS_ALLOC);
> @@ -1798,8 +1796,7 @@ static int etnaviv_gpu_bind(struct device *dev, str=
uct device *master,
>  	return ret;
>  }
> =20
> -static void etnaviv_gpu_unbind(struct device *dev, struct device *master=
,
> -	void *data)
> +void etnaviv_gpu_unbind(struct device *dev, struct device *master, void =
*data)
>  {
>  	struct etnaviv_gpu *gpu =3D dev_get_drvdata(dev);
> =20
> @@ -1867,9 +1864,11 @@ static int etnaviv_gpu_register_irq(struct etnaviv=
_gpu *gpu, int irq)
>  	return 0;
>  }
> =20
> -static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
> +/* platform independent */
> +
> +static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *m=
mio,
> +				     int irq, bool component, bool has_clk)
>  {
> -	struct device *dev =3D &pdev->dev;
>  	struct etnaviv_gpu *gpu;
>  	int err;
> =20
> @@ -1877,24 +1876,22 @@ static int etnaviv_gpu_platform_probe(struct plat=
form_device *pdev)
>  	if (!gpu)
>  		return -ENOMEM;
> =20
> -	gpu->dev =3D &pdev->dev;
> +	gpu->dev =3D dev;
> +	gpu->mmio =3D mmio;
>  	mutex_init(&gpu->lock);
>  	mutex_init(&gpu->sched_lock);
> =20
> -	/* Map registers: */
> -	gpu->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(gpu->mmio))
> -		return PTR_ERR(gpu->mmio);
> -
>  	/* Get Interrupt: */
> -	err =3D etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
> +	err =3D etnaviv_gpu_register_irq(gpu, irq);
>  	if (err)
>  		return err;
> =20
>  	/* Get Clocks: */
> -	err =3D etnaviv_gpu_clk_get(gpu);
> -	if (err)
> -		return err;
> +	if (has_clk) {
> +		err =3D etnaviv_gpu_clk_get(gpu);
> +		if (err)
> +			return err;
> +	}
> =20
>  	/* TODO: figure out max mapped size */
>  	dev_set_drvdata(dev, gpu);
> @@ -1904,24 +1901,27 @@ static int etnaviv_gpu_platform_probe(struct plat=
form_device *pdev)
>  	 * autosuspend delay is rather arbitary: no measurements have
>  	 * yet been performed to determine an appropriate value.
>  	 */
> -	pm_runtime_use_autosuspend(gpu->dev);
> -	pm_runtime_set_autosuspend_delay(gpu->dev, 200);
> -	pm_runtime_enable(gpu->dev);
> -
> -	err =3D component_add(&pdev->dev, &gpu_ops);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register component: %d\n", err);
> -		return err;
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 200);
> +	pm_runtime_enable(dev);
> +
> +	if (component) {
> +		err =3D component_add(dev, &gpu_ops);
> +		if (err < 0) {
> +			dev_err(dev, "failed to register component: %d\n", err);
> +			return err;
> +		}
>  	}
> =20
>  	return 0;
>  }
> =20
> -static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
> +static void etnaviv_gpu_driver_destroy(struct device *dev, bool componen=
t)
>  {
> -	component_del(&pdev->dev, &gpu_ops);
> -	pm_runtime_disable(&pdev->dev);
> -	return 0;
> +	if (component)
> +		component_del(dev, &gpu_ops);
> +
> +	pm_runtime_disable(dev);
>  }
> =20
>  static int etnaviv_gpu_rpm_suspend(struct device *dev)
> @@ -1971,6 +1971,31 @@ static const struct dev_pm_ops etnaviv_gpu_pm_ops =
=3D {
>  	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
>  };
> =20
> +static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *mmio;
> +	int irq;
> +
> +	/* Map registers: */
> +	mmio =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mmio))
> +		return PTR_ERR(mmio);
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +
> +	return etnaviv_gpu_driver_create(dev, mmio, irq, true, true);
> +}
> +
> +static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +
> +	etnaviv_gpu_driver_destroy(dev, true);
> +
> +	return 0;
> +}
> +
>  struct platform_driver etnaviv_gpu_driver =3D {
>  	.driver =3D {
>  		.name =3D "etnaviv-gpu",
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 98c6f9c320fc..1ec829a649b5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -206,6 +206,9 @@ void etnaviv_gpu_pm_put(struct etnaviv_gpu *gpu);
>  int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_=
ms);
>  void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 pref=
etch);
> =20
> +int etnaviv_gpu_bind(struct device *dev, struct device *master, void *da=
ta);
> +void etnaviv_gpu_unbind(struct device *dev, struct device *master, void =
*data);
> +
>  extern struct platform_driver etnaviv_gpu_driver;
> =20
>  #endif /* __ETNAVIV_GPU_H__ */

