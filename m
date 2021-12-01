Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D464655D3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 19:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5906E88F;
	Wed,  1 Dec 2021 18:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32306E88F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 18:48:44 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1msUeL-0004bm-9E; Wed, 01 Dec 2021 19:48:13 +0100
Message-ID: <eda5db9762875d3c891d909b3bed752a6bb06fdc.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] drm/etnaviv: add pci device driver support
From: Lucas Stach <l.stach@pengutronix.de>
To: Sui Jingfeng <15330273260@189.cn>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Krzysztof Kozlowski
 <krzk@kernel.org>, Andrey Zhizhikin
 <andrey.zhizhikin@leica-geosystems.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Qing Zhang <zhangqing@loongson.cn>,
 Jinyang He <hejinyang@loongson.cn>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Xiaochuan Mao <maoxiaochuan@loongson.cn>, zhaoxiao
 <zhaoxiao@uniontech.com>, suijingfeng <suijingfeng@loongson.cn>
Date: Wed, 01 Dec 2021 19:48:04 +0100
In-Reply-To: <20211201113502.3168-2-15330273260@189.cn>
References: <20211201113502.3168-1-15330273260@189.cn>
 <20211201113502.3168-2-15330273260@189.cn>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, etnaviv@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

Am Mittwoch, dem 01.12.2021 um 19:35 +0800 schrieb Sui Jingfeng:
> From: suijingfeng <suijingfeng@loongson.cn>
> 
>   v2: update commits and provide more material.
> 
>   There is a Vivante GC1000 V5037 in LS2K1000 and LS7A1000,
>   the gpu in those chip is a PCI device not platform one.
>   This GPU have 2D and 3D in the same core, so component
>   framework can be avoid, in fact we find it is diffcult to
>   use it with a pci device driver.
> 
>   Therefore, this patch try to provide PCI device driver wrapper
>   for it by mimic the platform counterpart.
> 
>   LS7A1000 is a bridge chip, brief user manual can be read on line
>   form[1]. This bridge chip typically use with LS3A4000 (4 core 1.8gHz,
>   Mips64r5) and LS3A5000 (4 core loongarch 2.5Ghz)[2].
> 
>   While LS2K1000[3] is a double core 1.0Ghz Mips64r2 SoC.
> 
>   Loongson CPU's cache coherency is maintained by the hardware,
>   this is tramendous difference from other Mips or ARM, as the
>   cohercecy problems can be ignored when using cached coherent
>   BOs.
> 
>   On the other hand, current Mips kernel's writecombine support
>   is not being implemented correctly under the hardware maintained
>   cache coherency framework. At lease this is true for loongson's cpu.

Can you please explain in some more detail what is the issue with
writecombined memory on your platform? I'm asking because we use WC not
just to get around missing hardware cache coherence on other platforms,
but also for performance reasons. Graphics buffers can be quite huge
and in a lot of cases it makes no sense to cache them on the CPU side
an sacrifice other valuable cached data for it. WC allows us to
efficiently write graphics buffers without polluting the cache.

Is the coherency issue that you don't have a proper way to invalidate
the cached alias? Do you hit speculatively loaded cache lines even if
you access the writecombined alias?

Regards,
Lucas

> 
>   In other words, ETNA_BO_WC is NOT usable on our platform, it suffer
>   from cache coherency problem. Howerver use ETNA_BO_CACHED_COHERENT
>   instead of ETNA_BO_WC, etnaviv driver works well on our platform.
> 
>   Both LS7A1000 and LS2K1000 have a display controller integrated,
>   named lsdc. By using KMS-RO framework, lsdc and gc1000 made a
>   compatible pair.
> 
>   I have write xf86-video-loongson[4] DDX driver which make etnaviv works
>   with lsdc on our custom debian and fedora, glmark2-es2 and glxgears
>   can be hardware accelerated under X11 environment. (Mesa-18.3.6 and
>   Mesa-18.05 are tested and it works)
> 
>   See https://github.com/suijingfeng/xf86-video-loongson.
> 
> [1] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN.html
> [2] https://loongson.github.io/LoongArch-Documentation/Loongson-3A5000-usermanual-EN.html
> [3] https://wiki.debian.org/InstallingDebianOn/Lemote/Loongson2K1000
> 
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> ---
>  drivers/gpu/drm/etnaviv/Kconfig           |  12 ++
>  drivers/gpu/drm/etnaviv/Makefile          |   2 +
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c     | 113 ++++++++---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.h     |   8 +
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c     |  28 ++-
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c     | 106 +++++++----
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h     |   6 +
>  drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c | 218 ++++++++++++++++++++++
>  include/uapi/drm/etnaviv_drm.h            |  11 +-
>  9 files changed, 430 insertions(+), 74 deletions(-)
>  create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
> 
> diff --git a/drivers/gpu/drm/etnaviv/Kconfig b/drivers/gpu/drm/etnaviv/Kconfig
> index faa7fc68b009..5858eec59025 100644
> --- a/drivers/gpu/drm/etnaviv/Kconfig
> +++ b/drivers/gpu/drm/etnaviv/Kconfig
> @@ -15,6 +15,18 @@ config DRM_ETNAVIV
>  	help
>  	  DRM driver for Vivante GPUs.
>  
> +config DRM_ETNAVIV_PCI_DRIVER
> +	bool "Enable PCI device driver support"
> +	depends on DRM_ETNAVIV
> +	depends on PCI
> +	depends on MACH_LOONGSON64
> +	default y
> +	help
> +	  DRM PCI driver for the Vivante GPU in LS7A1000 north bridge
> +	  and LS2K1000 SoC. The GC1000 in LS2K1000 and LS7A1000 is a
> +	  PCI device.
> +	  If in doubt, say "n".
> +
>  config DRM_ETNAVIV_THERMAL
>  	bool "enable ETNAVIV thermal throttling"
>  	depends on DRM_ETNAVIV
> diff --git a/drivers/gpu/drm/etnaviv/Makefile b/drivers/gpu/drm/etnaviv/Makefile
> index 46e5ffad69a6..6829e1ebf2db 100644
> --- a/drivers/gpu/drm/etnaviv/Makefile
> +++ b/drivers/gpu/drm/etnaviv/Makefile
> @@ -16,4 +16,6 @@ etnaviv-y := \
>  	etnaviv_perfmon.o \
>  	etnaviv_sched.o
>  
> +etnaviv-$(CONFIG_DRM_ETNAVIV_PCI_DRIVER) += etnaviv_pci_drv.o
> +
>  obj-$(CONFIG_DRM_ETNAVIV)	+= etnaviv.o
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 7dcc6392792d..dc2bb3a6efe6 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -8,6 +8,9 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/uaccess.h>
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +#include <linux/pci.h>
> +#endif
>  
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
> @@ -72,7 +75,7 @@ static int etnaviv_open(struct drm_device *dev, struct drm_file *file)
>  			drm_sched_entity_init(&ctx->sched_entity[i],
>  					      DRM_SCHED_PRIORITY_NORMAL, &sched,
>  					      1, NULL);
> -			}
> +		}
>  	}
>  
>  	file->driver_priv = ctx;
> @@ -470,7 +473,7 @@ static const struct drm_ioctl_desc etnaviv_ioctls[] = {
>  
>  DEFINE_DRM_GEM_FOPS(fops);
>  
> -static const struct drm_driver etnaviv_drm_driver = {
> +const struct drm_driver etnaviv_drm_driver = {
>  	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
>  	.open               = etnaviv_open,
>  	.postclose           = etnaviv_postclose,
> @@ -491,6 +494,36 @@ static const struct drm_driver etnaviv_drm_driver = {
>  	.minor              = 3,
>  };
>  
> +
> +/*
> + * PCI device driver:
> + */
> +
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +enum vivante_gpu_pci_family {
> +	GC1000_IN_LS7A1000 = 0,
> +	GC1000_IN_LS2K1000 = 1,
> +	CHIP_LAST,
> +};
> +
> +static const struct pci_device_id etnaviv_pci_id_lists[] = {
> +	{0x0014, 0x7a15, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS7A1000},
> +	{0x0014, 0x7a05, PCI_ANY_ID, PCI_ANY_ID, 0, 0, GC1000_IN_LS2K1000},
> +	{0, 0, 0, 0, 0, 0, 0}
> +};
> +
> +static struct pci_driver etnaviv_pci_driver = {
> +	.name = "etnaviv",
> +	.id_table = etnaviv_pci_id_lists,
> +	.probe = etnaviv_pci_probe,
> +	.remove = etnaviv_pci_remove,
> +	.driver = {
> +		.name   = "etnaviv",
> +	},
> +};
> +#endif
> +
> +
>  /*
>   * Platform driver:
>   */
> @@ -629,10 +662,40 @@ static struct platform_driver etnaviv_platform_driver = {
>  
>  static struct platform_device *etnaviv_drm;
>  
> -static int __init etnaviv_init(void)
> +static int etnaviv_create_platform_device(const char *name, struct device_node *np)
>  {
>  	struct platform_device *pdev;
>  	int ret;
> +
> +	pdev = platform_device_alloc(name, -1);
> +	if (!pdev)
> +		return -ENOMEM;
> +
> +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> +	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> +
> +	/*
> +	 * Apply the same DMA configuration to the virtual etnaviv
> +	 * device as the GPU we found. This assumes that all Vivante
> +	 * GPUs in the system share the same DMA constraints.
> +	 */
> +	if (np)
> +		of_dma_configure(&pdev->dev, np, true);
> +
> +	ret = platform_device_add(pdev);
> +	if (ret) {
> +		platform_device_put(pdev);
> +		return ret;
> +	}
> +
> +	etnaviv_drm = pdev;
> +
> +	return 0;
> +}
> +
> +static int __init etnaviv_init(void)
> +{
> +	int ret;
>  	struct device_node *np;
>  
>  	etnaviv_validate_init();
> @@ -645,6 +708,12 @@ static int __init etnaviv_init(void)
>  	if (ret != 0)
>  		goto unregister_gpu_driver;
>  
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +	ret = pci_register_driver(&etnaviv_pci_driver);
> +	if (ret != 0)
> +		goto unregister_platform_driver;
> +#endif
> +
>  	/*
>  	 * If the DT contains at least one available GPU device, instantiate
>  	 * the DRM platform device.
> @@ -653,36 +722,22 @@ static int __init etnaviv_init(void)
>  		if (!of_device_is_available(np))
>  			continue;
>  
> -		pdev = platform_device_alloc("etnaviv", -1);
> -		if (!pdev) {
> -			ret = -ENOMEM;
> -			of_node_put(np);
> -			goto unregister_platform_driver;
> -		}
> -		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> -		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> -
> -		/*
> -		 * Apply the same DMA configuration to the virtual etnaviv
> -		 * device as the GPU we found. This assumes that all Vivante
> -		 * GPUs in the system share the same DMA constraints.
> -		 */
> -		of_dma_configure(&pdev->dev, np, true);
> -
> -		ret = platform_device_add(pdev);
> -		if (ret) {
> -			platform_device_put(pdev);
> -			of_node_put(np);
> -			goto unregister_platform_driver;
> -		}
> +		ret = etnaviv_create_platform_device("etnaviv", np);
>  
> -		etnaviv_drm = pdev;
>  		of_node_put(np);
> +
> +		if (ret)
> +			goto unregister_pci_driver;
> +
>  		break;
>  	}
>  
>  	return 0;
>  
> +unregister_pci_driver:
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +	pci_unregister_driver(&etnaviv_pci_driver);
> +#endif
>  unregister_platform_driver:
>  	platform_driver_unregister(&etnaviv_platform_driver);
>  unregister_gpu_driver:
> @@ -694,6 +749,9 @@ module_init(etnaviv_init);
>  static void __exit etnaviv_exit(void)
>  {
>  	platform_device_unregister(etnaviv_drm);
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +	pci_unregister_driver(&etnaviv_pci_driver);
> +#endif
>  	platform_driver_unregister(&etnaviv_platform_driver);
>  	platform_driver_unregister(&etnaviv_gpu_driver);
>  }
> @@ -705,3 +763,6 @@ MODULE_AUTHOR("Lucas Stach <l.stach@pengutronix.de>");
>  MODULE_DESCRIPTION("etnaviv DRM Driver");
>  MODULE_LICENSE("GPL v2");
>  MODULE_ALIAS("platform:etnaviv");
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +MODULE_DEVICE_TABLE(pci, etnaviv_pci_id_lists);
> +#endif
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 049ae87de9be..f488e2502b8b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -42,6 +42,7 @@ struct etnaviv_drm_private {
>  	/* list of GEM objects: */
>  	struct mutex gem_lock;
>  	struct list_head gem_list;
> +	bool has_cached_coherent;
>  };
>  
>  int etnaviv_ioctl_gem_submit(struct drm_device *dev, void *data,
> @@ -81,6 +82,8 @@ void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
>  	struct seq_file *m);
>  #endif
>  
> +extern const struct drm_driver etnaviv_drm_driver;
> +
>  #define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
>  
> @@ -120,4 +123,9 @@ static inline unsigned long etnaviv_timeout_to_jiffies(
>  	return timespec64_to_jiffies(&ts);
>  }
>  
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +int etnaviv_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
> +void etnaviv_pci_remove(struct pci_dev *pdev);
> +#endif
> +
>  #endif /* __ETNAVIV_DRV_H__ */
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index d5314aa28ff7..b9235fe72bc2 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <drm/drm_prime.h>
> +#include <drm/drm_cache.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/spinlock.h>
> @@ -340,6 +341,7 @@ void *etnaviv_gem_vmap(struct drm_gem_object *obj)
>  static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>  {
>  	struct page **pages;
> +	pgprot_t prot;
>  
>  	lockdep_assert_held(&obj->lock);
>  
> @@ -347,8 +349,20 @@ static void *etnaviv_gem_vmap_impl(struct etnaviv_gem_object *obj)
>  	if (IS_ERR(pages))
>  		return NULL;
>  
> -	return vmap(pages, obj->base.size >> PAGE_SHIFT,
> -			VM_MAP, pgprot_writecombine(PAGE_KERNEL));
> +	switch (obj->flags) {
> +	case ETNA_BO_CACHED_COHERENT:
> +	case ETNA_BO_CACHED:
> +		prot = PAGE_KERNEL;
> +		break;
> +	case ETNA_BO_UNCACHED:
> +		prot = pgprot_noncached(PAGE_KERNEL);
> +		break;
> +	case ETNA_BO_WC:
> +	default:
> +		prot = pgprot_writecombine(PAGE_KERNEL);
> +	}
> +
> +	return vmap(pages, obj->base.size >> PAGE_SHIFT, VM_MAP, prot);
>  }
>  
>  static inline enum dma_data_direction etnaviv_op_to_dma_dir(u32 op)
> @@ -543,6 +557,7 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>  static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  	const struct etnaviv_gem_ops *ops, struct drm_gem_object **obj)
>  {
> +	struct etnaviv_drm_private *priv = dev->dev_private;
>  	struct etnaviv_gem_object *etnaviv_obj;
>  	unsigned sz = sizeof(*etnaviv_obj);
>  	bool valid = true;
> @@ -553,6 +568,10 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  	case ETNA_BO_CACHED:
>  	case ETNA_BO_WC:
>  		break;
> +	case ETNA_BO_CACHED_COHERENT:
> +		if (priv->has_cached_coherent)
> +			break;
> +		fallthrough;
>  	default:
>  		valid = false;
>  	}
> @@ -563,6 +582,11 @@ static int etnaviv_gem_new_impl(struct drm_device *dev, u32 size, u32 flags,
>  		return -EINVAL;
>  	}
>  
> +	if (priv->has_cached_coherent) {
> +		if (flags & ETNA_BO_WC)
> +			flags = ETNA_BO_CACHED_COHERENT;
> +	}
> +
>  	etnaviv_obj = kzalloc(sz, GFP_KERNEL);
>  	if (!etnaviv_obj)
>  		return -ENOMEM;
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> index 242a5fd8b932..3404a1baec6f 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -1664,8 +1664,8 @@ static struct thermal_cooling_device_ops cooling_ops = {
>  	.set_cur_state = etnaviv_gpu_cooling_set_cur_state,
>  };
>  
> -static int etnaviv_gpu_bind(struct device *dev, struct device *master,
> -	void *data)
> +
> +int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct drm_device *drm = data;
>  	struct etnaviv_drm_private *priv = drm->dev_private;
> @@ -1726,8 +1726,8 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
>  	return ret;
>  }
>  
> -static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
> -	void *data)
> +
> +void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data)
>  {
>  	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
>  
> @@ -1774,6 +1774,58 @@ static const struct of_device_id etnaviv_gpu_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, etnaviv_gpu_match);
>  
> +
> +void etnaviv_gpu_get_clock(struct etnaviv_gpu *gpu, struct device *dev)
> +{
> +	/* Get Clocks: */
> +	gpu->clk_reg = devm_clk_get(dev, "reg");
> +	DBG("clk_reg: %p", gpu->clk_reg);
> +	if (IS_ERR(gpu->clk_reg))
> +		gpu->clk_reg = NULL;
> +
> +	gpu->clk_bus = devm_clk_get(dev, "bus");
> +	DBG("clk_bus: %p", gpu->clk_bus);
> +	if (IS_ERR(gpu->clk_bus))
> +		gpu->clk_bus = NULL;
> +
> +	gpu->clk_core = devm_clk_get(dev, "core");
> +	DBG("clk_core: %p", gpu->clk_core);
> +	if (IS_ERR(gpu->clk_core))
> +		gpu->clk_core = NULL;
> +	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
> +
> +	gpu->clk_shader = devm_clk_get(dev, "shader");
> +	DBG("clk_shader: %p", gpu->clk_shader);
> +	if (IS_ERR(gpu->clk_shader))
> +		gpu->clk_shader = NULL;
> +	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
> +}
> +
> +
> +int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq)
> +{
> +	struct device *dev = gpu->dev;
> +	int err;
> +
> +	if (irq < 0) {
> +		dev_err(dev, "failed to get irq: %d\n", irq);
> +		return irq;
> +	}
> +
> +	err = devm_request_irq(dev, irq, irq_handler, 0, dev_name(dev), gpu);
> +	if (err) {
> +		dev_err(dev, "failed to request IRQ %u: %d\n", irq, err);
> +		return err;
> +	}
> +
> +	dev_info(dev, "IRQ registered, irq=%d\n", irq);
> +
> +	gpu->irq = irq;
> +
> +	return 0;
> +}
> +
> +
>  static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1784,7 +1836,7 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  	if (!gpu)
>  		return -ENOMEM;
>  
> -	gpu->dev = &pdev->dev;
> +	gpu->dev = dev;
>  	mutex_init(&gpu->lock);
>  	mutex_init(&gpu->fence_lock);
>  
> @@ -1794,39 +1846,11 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  		return PTR_ERR(gpu->mmio);
>  
>  	/* Get Interrupt: */
> -	gpu->irq = platform_get_irq(pdev, 0);
> -	if (gpu->irq < 0)
> -		return gpu->irq;
> -
> -	err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> -			       dev_name(gpu->dev), gpu);
> -	if (err) {
> -		dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq, err);
> +	err = etnaviv_gpu_register_irq(gpu, platform_get_irq(pdev, 0));
> +	if (err)
>  		return err;
> -	}
> -
> -	/* Get Clocks: */
> -	gpu->clk_reg = devm_clk_get_optional(&pdev->dev, "reg");
> -	DBG("clk_reg: %p", gpu->clk_reg);
> -	if (IS_ERR(gpu->clk_reg))
> -		return PTR_ERR(gpu->clk_reg);
>  
> -	gpu->clk_bus = devm_clk_get_optional(&pdev->dev, "bus");
> -	DBG("clk_bus: %p", gpu->clk_bus);
> -	if (IS_ERR(gpu->clk_bus))
> -		return PTR_ERR(gpu->clk_bus);
> -
> -	gpu->clk_core = devm_clk_get(&pdev->dev, "core");
> -	DBG("clk_core: %p", gpu->clk_core);
> -	if (IS_ERR(gpu->clk_core))
> -		return PTR_ERR(gpu->clk_core);
> -	gpu->base_rate_core = clk_get_rate(gpu->clk_core);
> -
> -	gpu->clk_shader = devm_clk_get_optional(&pdev->dev, "shader");
> -	DBG("clk_shader: %p", gpu->clk_shader);
> -	if (IS_ERR(gpu->clk_shader))
> -		return PTR_ERR(gpu->clk_shader);
> -	gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
> +	etnaviv_gpu_get_clock(gpu, dev);
>  
>  	/* TODO: figure out max mapped size */
>  	dev_set_drvdata(dev, gpu);
> @@ -1836,13 +1860,13 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
>  	 * autosuspend delay is rather arbitary: no measurements have
>  	 * yet been performed to determine an appropriate value.
>  	 */
> -	pm_runtime_use_autosuspend(gpu->dev);
> -	pm_runtime_set_autosuspend_delay(gpu->dev, 200);
> -	pm_runtime_enable(gpu->dev);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 200);
> +	pm_runtime_enable(dev);
>  
> -	err = component_add(&pdev->dev, &gpu_ops);
> +	err = component_add(dev, &gpu_ops);
>  	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to register component: %d\n", err);
> +		dev_err(dev, "failed to register component: %d\n", err);
>  		return err;
>  	}
>  
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> index 1c75c8ed5bce..9082d53c4d2d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -182,4 +182,10 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch);
>  
>  extern struct platform_driver etnaviv_gpu_driver;
>  
> +int etnaviv_gpu_bind(struct device *dev, struct device *master, void *data);
> +void etnaviv_gpu_unbind(struct device *dev, struct device *master, void *data);
> +
> +int etnaviv_gpu_register_irq(struct etnaviv_gpu *gpu, int irq);
> +void etnaviv_gpu_get_clock(struct etnaviv_gpu *gpu, struct device *dev);
> +
>  #endif /* __ETNAVIV_GPU_H__ */
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
> new file mode 100644
> index 000000000000..f1227bfd5441
> --- /dev/null
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2015-2018 Etnaviv Project
> + */
> +
> +#include <linux/pci.h>
> +#include <linux/pm_runtime.h>
> +#include <drm/drm_drv.h>
> +
> +#include "etnaviv_drv.h"
> +#include "etnaviv_gpu.h"
> +
> +
> +#ifdef CONFIG_DRM_ETNAVIV_PCI_DRIVER
> +
> +
> +static int etnaviv_alloc_gpu(struct pci_dev *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct etnaviv_gpu *gpu;
> +	int err;
> +
> +	gpu = devm_kzalloc(dev, sizeof(*gpu), GFP_KERNEL);
> +	if (!gpu)
> +		return -ENOMEM;
> +
> +	gpu->dev = dev;
> +	mutex_init(&gpu->lock);
> +	mutex_init(&gpu->fence_lock);
> +
> +	/* gpu bar 0 contain registers */
> +	gpu->mmio = devm_ioremap_resource(dev, &pdev->resource[0]);
> +	if (IS_ERR(gpu->mmio))
> +		return PTR_ERR(gpu->mmio);
> +
> +	/* Get Interrupt: */
> +	err = etnaviv_gpu_register_irq(gpu, pdev->irq);
> +	if (err)
> +		return err;
> +
> +	/* Get Clocks: */
> +	etnaviv_gpu_get_clock(gpu, dev);
> +
> +	dev_set_drvdata(dev, gpu);
> +	/*
> +	 * We treat the device as initially suspended.  The runtime PM
> +	 * autosuspend delay is rather arbitrary: no measurements have
> +	 * yet been performed to determine an appropriate value.
> +	 */
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 200);
> +	pm_runtime_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void etnaviv_free_gpu(struct pci_dev *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
> +
> +	pm_runtime_disable(dev);
> +
> +	if (gpu)
> +		devm_kfree(dev, gpu);
> +
> +	dev_set_drvdata(dev, NULL);
> +}
> +
> +static int etnaviv_create_private(struct drm_device *ddev)
> +{
> +	struct etnaviv_drm_private *priv;
> +	int ret;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ddev->dev_private = priv;
> +
> +	mutex_init(&priv->gem_lock);
> +	INIT_LIST_HEAD(&priv->gem_list);
> +
> +	priv->num_gpus = 0;
> +	priv->shm_gfp_mask = GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
> +
> +	priv->cmdbuf_suballoc = etnaviv_cmdbuf_suballoc_new(ddev->dev);
> +	if (IS_ERR(priv->cmdbuf_suballoc)) {
> +		dev_err(ddev->dev, "Failed to create cmdbuf suballocator\n");
> +		ret = PTR_ERR(priv->cmdbuf_suballoc);
> +		goto out_free_priv;
> +	}
> +
> +	dev_info(ddev->dev, "etnaviv drm private created\n");
> +
> +	return 0;
> +
> +out_free_priv:
> +	ddev->dev_private = NULL;
> +	kfree(priv);
> +
> +	return ret;
> +}
> +
> +
> +static void etnaviv_destroy_private(struct drm_device *ddev)
> +{
> +	struct etnaviv_drm_private *priv = ddev->dev_private;
> +
> +	etnaviv_cmdbuf_suballoc_destroy(priv->cmdbuf_suballoc);
> +
> +	ddev->dev_private = NULL;
> +	kfree(priv);
> +
> +	dev_info(ddev->dev, "etnaviv drm private freed\n");
> +}
> +
> +
> +/*
> + * GC1000 0x5037 has 2D and 3D feature bits set,
> + * there will be one driver instance which supports 2D and 3D pipes
> + */
> +int etnaviv_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> +{
> +	int ret;
> +	struct drm_device *ddev;
> +	struct etnaviv_drm_private *priv;
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		DRM_ERROR("failed to enable\n");
> +		return ret;
> +	}
> +
> +	pci_set_master(pdev);
> +
> +	/*
> +	 * Instantiate the DRM device.
> +	 */
> +	ddev = drm_dev_alloc(&etnaviv_drm_driver, &pdev->dev);
> +	if (IS_ERR(ddev))
> +		return PTR_ERR(ddev);
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		goto out_put;
> +
> +	dev_info(&pdev->dev, "DMA mask and the coherent DMA mask: 32\n");
> +
> +	ret = dma_set_max_seg_size(&pdev->dev, SZ_2G);
> +	if (ret)
> +		goto out_put;
> +
> +	dev_info(&pdev->dev, "dev->dma_parms->max_segment_size = 2G\n");
> +
> +	ret = etnaviv_create_private(ddev);
> +	if (ret)
> +		goto out_put;
> +
> +	priv = ddev->dev_private;
> +	/*
> +	 * loongson CPU's cache coherency is maintained by the hardware,
> +	 * include but not limitied: ls3a5000, ls3a4000, ls3a3000, ls2k1000.
> +	 */
> +	priv->has_cached_coherent = true;
> +
> +	ret = etnaviv_alloc_gpu(pdev);
> +	if (ret)
> +		goto out_destroy_private;
> +
> +	ret = etnaviv_gpu_bind(&pdev->dev, NULL, ddev);
> +	if (ret)
> +		goto out_free_gpu;
> +
> +	dev_info(&pdev->dev, "Number of GPU: %d\n", priv->num_gpus);
> +
> +	ret = etnaviv_gpu_init(priv->gpu[0]);
> +	if (ret)
> +		goto out_unbind_gpu;
> +
> +	dev_info(&pdev->dev, "GPU Initialized\n");
> +
> +	ret = drm_dev_register(ddev, 0);
> +	if (ret)
> +		goto out_unbind_gpu;
> +
> +	return 0;
> +
> +out_unbind_gpu:
> +	etnaviv_gpu_unbind(&pdev->dev, NULL, ddev);
> +out_free_gpu:
> +	etnaviv_free_gpu(pdev);
> +out_destroy_private:
> +	etnaviv_destroy_private(ddev);
> +out_put:
> +	drm_dev_put(ddev);
> +
> +	return ret;
> +}
> +
> +
> +void etnaviv_pci_remove(struct pci_dev *pdev)
> +{
> +	struct etnaviv_gpu *gpu = dev_get_drvdata(&pdev->dev);
> +	struct drm_device *ddev = gpu->drm;
> +
> +	drm_dev_unregister(ddev);
> +
> +	etnaviv_gpu_unbind(&pdev->dev, NULL, ddev);
> +
> +	etnaviv_free_gpu(pdev);
> +
> +	etnaviv_destroy_private(ddev);
> +
> +	drm_put_dev(ddev);
> +}
> +
> +#endif
> diff --git a/include/uapi/drm/etnaviv_drm.h b/include/uapi/drm/etnaviv_drm.h
> index af024d90453d..e065deefc3bc 100644
> --- a/include/uapi/drm/etnaviv_drm.h
> +++ b/include/uapi/drm/etnaviv_drm.h
> @@ -90,13 +90,14 @@ struct drm_etnaviv_param {
>   * GEM buffers:
>   */
>  
> -#define ETNA_BO_CACHE_MASK   0x000f0000
> +#define ETNA_BO_CACHE_MASK       0x000f0000
>  /* cache modes */
> -#define ETNA_BO_CACHED       0x00010000
> -#define ETNA_BO_WC           0x00020000
> -#define ETNA_BO_UNCACHED     0x00040000
> +#define ETNA_BO_CACHED           0x00010000
> +#define ETNA_BO_WC               0x00020000
> +#define ETNA_BO_UNCACHED         0x00040000
> +#define ETNA_BO_CACHED_COHERENT  0x00080000
>  /* map flags */
> -#define ETNA_BO_FORCE_MMU    0x00100000
> +#define ETNA_BO_FORCE_MMU        0x00100000
>  
>  struct drm_etnaviv_gem_new {
>  	__u64 size;           /* in */


