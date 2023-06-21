Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB53737F13
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 11:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B510E429;
	Wed, 21 Jun 2023 09:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD4210E425
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 09:39:43 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qBuJJ-0007Vm-NL; Wed, 21 Jun 2023 11:39:33 +0200
Message-ID: <7719934465d538f60d56486de91c3daaa722efc5.camel@pengutronix.de>
Subject: Re: [PATCH v10 06/11] drm/etnaviv: Add driver support for the PCI
 devices
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <18949883232@163.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
Date: Wed, 21 Jun 2023 11:39:29 +0200
In-Reply-To: <20230620094716.2231414-7-18949883232@163.com>
References: <20230620094716.2231414-1-18949883232@163.com>
 <20230620094716.2231414-7-18949883232@163.com>
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
> This patch adds PCI driver support on top of what we already have, take
> the GC1000 in LS7A1000/LS2K1000 as the first instance which enjoy the PCI
> device driver. There is only one GPU core for the GC1000 in the LS7A1000
> and LS2K1000. Therefore, component frameworks can be avoided.
>=20
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/etnaviv/Kconfig           | 10 +++
>  drivers/gpu/drm/etnaviv/Makefile          |  2 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 13 +++-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h     |  3 +
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c     |  8 +--
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |  6 ++
>  drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 75 +++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h | 18 ++++++
>  8 files changed, 128 insertions(+), 7 deletions(-)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
>=20
> diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kc=
onfig
> index faa7fc68b009..1b5b162efb61 100644
> --- a/drivers/gpu/drm/etnaviv/Kconfig
> +++ b/drivers/gpu/drm/etnaviv/Kconfig
> @@ -15,6 +15,16 @@ config DRM_ETNAVIV
>  	help
>  	  DRM driver for Vivante GPUs.
> =20
> +config DRM_ETNAVIV_PCI_DRIVER
> +	bool "enable ETNAVIV PCI driver support"
> +	depends on DRM_ETNAVIV
> +	depends on PCI
> +	default y

Drop the default y. Lots of existing systems with Vivante GPUs on a
platform bus also have a PCI bus, so this will activate the added code
paths in a lot of configurations that don't need it.

> +	help
> +	  Compile in support for PCI GPUs of Vivante.

Compile in support for Vivante GPUs attached via PCI(e).

> +	  For example, the GC1000 in LS7A1000 and LS2K1000.

Not sure if the example is that helpful. Maybe drop this.

> +	  Say Y if you have such a hardware.
> +
>  config DRM_ETNAVIV_THERMAL
>  	bool "enable ETNAVIV thermal throttling"
>  	depends on DRM_ETNAVIV
> diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/M=
akefile
> index 46e5ffad69a6..6829e1ebf2db 100644
> --- a/drivers/gpu/drm/etnaviv/Makefile
> +++ b/drivers/gpu/drm/etnaviv/Makefile
> @@ -16,4 +16,6 @@ etnaviv-y :=3D \
>  	etnaviv_perfmon.o \
>  	etnaviv_sched.o
> =20
> +etnaviv-$(CONFIG_DRM_ETNAVIV_PCI_DRIVER) +=3D etnaviv_pci_drv.o
> +
>  obj-$(CONFIG_DRM_ETNAVIV)	+=3D etnaviv.o
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etna=
viv/etnaviv_drv.c
> index 93ca240cd4c0..0a365e96d371 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -21,6 +21,7 @@
>  #include "etnaviv_gpu.h"
>  #include "etnaviv_gem.h"
>  #include "etnaviv_mmu.h"
> +#include "etnaviv_pci_drv.h"
>  #include "etnaviv_perfmon.h"
> =20
>  /*
> @@ -538,7 +539,7 @@ static const struct drm_driver etnaviv_drm_driver =3D=
 {
> =20
>  static struct etnaviv_drm_private *etna_private_ptr;
> =20
> -static int etnaviv_drm_bind(struct device *dev, bool component)
> +int etnaviv_drm_bind(struct device *dev, bool component)
>  {
>  	struct etnaviv_drm_private *priv;
>  	struct drm_device *drm;
> @@ -588,7 +589,7 @@ static int etnaviv_drm_bind(struct device *dev, bool =
component)
>  	return ret;
>  }
> =20
> -static void etnaviv_drm_unbind(struct device *dev, bool component)
> +void etnaviv_drm_unbind(struct device *dev, bool component)
>  {
>  	struct etnaviv_drm_private *priv =3D etna_private_ptr;
>  	struct drm_device *drm =3D priv->drm;
> @@ -746,6 +747,10 @@ static int __init etnaviv_init(void)
>  	if (ret !=3D 0)
>  		goto unregister_gpu_driver;
> =20
> +	ret =3D etnaviv_register_pci_driver();
> +	if (ret !=3D 0)
> +		goto unregister_platform_driver;
> +
>  	/*
>  	 * If the DT contains at least one available GPU device, instantiate
>  	 * the DRM platform device.
> @@ -763,7 +768,7 @@ static int __init etnaviv_init(void)
>  		break;
>  	}
> =20
> -	return 0;
> +	return ret;
> =20
>  unregister_platform_driver:
>  	platform_driver_unregister(&etnaviv_platform_driver);
> @@ -778,6 +783,8 @@ static void __exit etnaviv_exit(void)
>  	etnaviv_destroy_platform_device(&etnaviv_platform_device);
>  	platform_driver_unregister(&etnaviv_platform_driver);
>  	platform_driver_unregister(&etnaviv_gpu_driver);
> +
> +	etnaviv_unregister_pci_driver();
>  }
>  module_exit(etnaviv_exit);
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etna=
viv/etnaviv_drv.h
> index e58f82e698de..9cd72948cfad 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -83,6 +83,9 @@ bool etnaviv_cmd_validate_one(struct etnaviv_gpu *gpu,
>  	u32 *stream, unsigned int size,
>  	struct drm_etnaviv_gem_submit_reloc *relocs, unsigned int reloc_size);
> =20
> +int etnaviv_drm_bind(struct device *dev, bool component);
> +void etnaviv_drm_unbind(struct device *dev, bool component);
> +
>  #ifdef CONFIG_DEBUG_FS
>  void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
>  	struct seq_file *m);
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 059be8c89c5a..d6a21e97feb1 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1866,8 +1866,8 @@ static int etnaviv_gpu_register_irq(struct etnaviv_=
gpu *gpu, int irq)
> =20
>  /* platform independent */
> =20
> -static int etnaviv_gpu_driver_create(struct device *dev, void __iomem *m=
mio,
> -				     int irq, bool component, bool has_clk)
> +int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
> +			      int irq, bool component, bool has_clk)
>  {
>  	struct etnaviv_gpu *gpu;
>  	int err;
> @@ -1916,7 +1916,7 @@ static int etnaviv_gpu_driver_create(struct device =
*dev, void __iomem *mmio,
>  	return 0;
>  }
> =20
> -static void etnaviv_gpu_driver_destroy(struct device *dev, bool componen=
t)
> +void etnaviv_gpu_driver_destroy(struct device *dev, bool component)
>  {
>  	if (component)
>  		component_del(dev, &gpu_ops);
> @@ -1967,7 +1967,7 @@ static int etnaviv_gpu_rpm_resume(struct device *de=
v)
>  	return 0;
>  }
> =20
> -static const struct dev_pm_ops etnaviv_gpu_pm_ops =3D {
> +const struct dev_pm_ops etnaviv_gpu_pm_ops =3D {
>  	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
>  };
> =20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 1ec829a649b5..8d9833996ed7 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -209,6 +209,12 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u=
32 address, u16 prefetch);
>  int etnaviv_gpu_bind(struct device *dev, struct device *master, void *da=
ta);
>  void etnaviv_gpu_unbind(struct device *dev, struct device *master, void =
*data);
> =20
> +int etnaviv_gpu_driver_create(struct device *dev, void __iomem *mmio,
> +			      int irq, bool component, bool has_clk);
> +
> +void etnaviv_gpu_driver_destroy(struct device *dev, bool component);
> +
>  extern struct platform_driver etnaviv_gpu_driver;
> +extern const struct dev_pm_ops etnaviv_gpu_pm_ops;
> =20
>  #endif /* __ETNAVIV_GPU_H__ */
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/=
etnaviv/etnaviv_pci_drv.c
> new file mode 100644
> index 000000000000..78e44a28d30c
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/pci.h>
> +
> +#include "etnaviv_drv.h"
> +#include "etnaviv_gpu.h"
> +#include "etnaviv_pci_drv.h"
> +
> +static int etnaviv_pci_probe(struct pci_dev *pdev,
> +			     const struct pci_device_id *ent)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	void __iomem *mmio;
> +	int ret;
> +
> +	ret =3D pcim_enable_device(pdev);
> +	if (ret) {
> +		dev_err(dev, "failed to enable\n");
> +		return ret;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));

Is your device really restricted to 32 bit dma addressing?

> +	if (ret)
> +		return ret;
> +
> +	/* Map registers, assume the PCI bar 0 contain the registers */
> +	mmio =3D pcim_iomap(pdev, 0, 0);
> +	if (IS_ERR(mmio))
> +		return PTR_ERR(mmio);
> +
> +	ret =3D etnaviv_gpu_driver_create(dev, mmio, pdev->irq, false, false);
> +	if (ret)
> +		return ret;
> +
> +	return etnaviv_drm_bind(dev, false);
> +}
> +
> +static void etnaviv_pci_remove(struct pci_dev *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +
> +	etnaviv_drm_unbind(dev, false);
> +
> +	etnaviv_gpu_driver_destroy(dev, false);
> +
> +	pci_clear_master(pdev);
> +}
> +
> +static const struct pci_device_id etnaviv_pci_id_lists[] =3D {
> +	{PCI_VDEVICE(LOONGSON, 0x7a15)},
> +	{PCI_VDEVICE(LOONGSON, 0x7a05)},
> +	{ }
> +};
> +
> +static struct pci_driver etnaviv_pci_driver =3D {
> +	.name =3D "etnaviv",
> +	.id_table =3D etnaviv_pci_id_lists,
> +	.probe =3D etnaviv_pci_probe,
> +	.remove =3D etnaviv_pci_remove,
> +	.driver.pm =3D pm_ptr(&etnaviv_gpu_pm_ops),
> +};
> +
> +int etnaviv_register_pci_driver(void)
> +{
> +	return pci_register_driver(&etnaviv_pci_driver);
> +}
> +
> +void etnaviv_unregister_pci_driver(void)
> +{
> +	pci_unregister_driver(&etnaviv_pci_driver);
> +}
> +
> +MODULE_DEVICE_TABLE(pci, etnaviv_pci_id_lists);

Hm, I think the amount of code added here is small enough to go
directly into etnaviv_drv.c behind a
#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER, which would allow to keep the
referenced functions and pm ops static.

Regards,
Lucas

> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h b/drivers/gpu/drm/=
etnaviv/etnaviv_pci_drv.h
> new file mode 100644
> index 000000000000..1db559ee5e9b
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __ETNAVIV_PCI_DRV_H__
> +#define __ETNAVIV_PCI_DRV_H__
> +
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +
> +int etnaviv_register_pci_driver(void);
> +void etnaviv_unregister_pci_driver(void);
> +
> +#else
> +
> +static inline int etnaviv_register_pci_driver(void) { return 0; }
> +static inline void etnaviv_unregister_pci_driver(void) { }
> +
> +#endif
> +
> +#endif

