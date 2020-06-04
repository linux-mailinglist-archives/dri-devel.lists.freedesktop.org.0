Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0693C1EF1E4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3623B6E861;
	Fri,  5 Jun 2020 07:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8AC6E06E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 13:53:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED4D0ACE3;
 Thu,  4 Jun 2020 13:53:22 +0000 (UTC)
Message-ID: <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>, bcm-kernel-feedback-list@broadcom.com
Date: Thu, 04 Jun 2020 15:53:13 +0200
In-Reply-To: <20200603192058.35296-10-james.quinlan@broadcom.com>
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Hanjun Guo <guohanjun@huawei.com>, "open list:REMOTE PROCESSOR
 \(REMOTEPROC\) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, "open
 list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 David Kershner <david.kershner@unisys.com>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, "open list:USB
 SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0240583914=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0240583914==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-dvCBVLPahkIYdQSZwNeh"


--=-dvCBVLPahkIYdQSZwNeh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Wed, 2020-06-03 at 15:20 -0400, Jim Quinlan wrote:
> The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> the use of multiple pfn offsets between cpu addrs and dma addrs.  It
> subsumes the role of dev->dma_pfn_offset -- a uniform offset -- and
> designates the single offset a special case.
>=20
> of_dma_configure() is the typical manner to set pfn offsets but there
> are a number of ad hoc assignments to dev->dma_pfn_offset in the
> kernel code.  These cases now invoke the function
> attach_uniform_dma_pfn_offset(dev, pfn_offset).
>=20
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  arch/arm/include/asm/dma-mapping.h            |  9 +-
>  arch/arm/mach-keystone/keystone.c             |  9 +-
>  arch/sh/drivers/pci/pcie-sh7786.c             |  3 +-
>  arch/sh/kernel/dma-coherent.c                 | 17 ++--
>  arch/x86/pci/sta2x11-fixup.c                  |  7 +-
>  drivers/acpi/arm64/iort.c                     |  5 +-
>  drivers/gpu/drm/sun4i/sun4i_backend.c         |  7 +-
>  drivers/iommu/io-pgtable-arm.c                |  2 +-
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  5 +-
>  drivers/of/address.c                          | 93 +++++++++++++++++--
>  drivers/of/device.c                           |  8 +-
>  drivers/remoteproc/remoteproc_core.c          |  2 +-
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
>  drivers/usb/core/message.c                    |  4 +-
>  drivers/usb/core/usb.c                        |  2 +-
>  include/linux/device.h                        |  4 +-
>  include/linux/dma-direct.h                    | 16 +++-
>  include/linux/dma-mapping.h                   | 45 +++++++++
>  kernel/dma/coherent.c                         | 11 ++-
>  20 files changed, 210 insertions(+), 51 deletions(-)
>=20
> diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dm=
a-
> mapping.h
> index bdd80ddbca34..f1e72f99468b 100644
> --- a/arch/arm/include/asm/dma-mapping.h
> +++ b/arch/arm/include/asm/dma-mapping.h
> @@ -35,8 +35,9 @@ static inline const struct dma_map_ops
> *get_arch_dma_ops(struct bus_type *bus)
>  #ifndef __arch_pfn_to_dma
>  static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pf=
n)
>  {
> -	if (dev)
> -		pfn -=3D dev->dma_pfn_offset;
> +	if (dev && dev->dma_pfn_offset_map)

Would it make sense to move the dev->dma_pfn_offset_map check into
dma_pfn_offset_from_phys_addr() and return 0 if not available? Same for the
opposite variant of the function. I think it'd make the code a little simpl=
er on
some of the use cases, and overall less error prone if anyone starts using =
the
function elsewhere.

> +		pfn -=3D dma_pfn_offset_from_phys_addr(dev, PFN_PHYS(pfn));
> +
>  	return (dma_addr_t)__pfn_to_bus(pfn);
>  }
> =20
> @@ -44,8 +45,8 @@ static inline unsigned long dma_to_pfn(struct device *d=
ev,
> dma_addr_t addr)
>  {
>  	unsigned long pfn =3D __bus_to_pfn(addr);
> =20
> -	if (dev)
> -		pfn +=3D dev->dma_pfn_offset;
> +	if (dev && dev->dma_pfn_offset_map)
> +		pfn +=3D dma_pfn_offset_from_dma_addr(dev, addr);
> =20
>  	return pfn;
>  }
> diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-
> keystone/keystone.c
> index 638808c4e122..e7d3ee6e9cb5 100644
> --- a/arch/arm/mach-keystone/keystone.c
> +++ b/arch/arm/mach-keystone/keystone.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/init.h>
>  #include <linux/of_platform.h>
>  #include <linux/of_address.h>
> @@ -38,9 +39,11 @@ static int keystone_platform_notifier(struct notifier_=
block
> *nb,
>  		return NOTIFY_BAD;
> =20
>  	if (!dev->of_node) {
> -		dev->dma_pfn_offset =3D keystone_dma_pfn_offset;
> -		dev_err(dev, "set dma_pfn_offset%08lx\n",
> -			dev->dma_pfn_offset);
> +		int ret =3D attach_uniform_dma_pfn_offset
> +				(dev, keystone_dma_pfn_offset);
> +
> +		dev_err(dev, "set dma_pfn_offset%08lx%s\n",
> +			dev->dma_pfn_offset, ret ? " failed" : "");
>  	}
>  	return NOTIFY_OK;
>  }
> diff --git a/arch/sh/drivers/pci/pcie-sh7786.c b/arch/sh/drivers/pci/pcie=
-
> sh7786.c
> index e0b568aaa701..2e832a5c58c1 100644
> --- a/arch/sh/drivers/pci/pcie-sh7786.c
> +++ b/arch/sh/drivers/pci/pcie-sh7786.c
> @@ -12,6 +12,7 @@
>  #include <linux/io.h>
>  #include <linux/async.h>
>  #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/slab.h>
>  #include <linux/clk.h>
>  #include <linux/sh_clk.h>
> @@ -487,7 +488,7 @@ int pcibios_map_platform_irq(const struct pci_dev *pd=
ev,
> u8 slot, u8 pin)
> =20
>  void pcibios_bus_add_device(struct pci_dev *pdev)
>  {
> -	pdev->dev.dma_pfn_offset =3D dma_pfn_offset;
> +	attach_uniform_dma_pfn_offset(&pdev->dev, dma_pfn_offset);
>  }
> =20
>  static int __init sh7786_pcie_core_init(void)
> diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.=
c
> index d4811691b93c..5fc9e358b6c7 100644
> --- a/arch/sh/kernel/dma-coherent.c
> +++ b/arch/sh/kernel/dma-coherent.c
> @@ -14,6 +14,8 @@ void *arch_dma_alloc(struct device *dev, size_t size,
> dma_addr_t *dma_handle,
>  {
>  	void *ret, *ret_nocache;
>  	int order =3D get_order(size);
> +	unsigned long pfn;
> +	phys_addr_t phys;
> =20
>  	gfp |=3D __GFP_ZERO;
> =20
> @@ -34,11 +36,14 @@ void *arch_dma_alloc(struct device *dev, size_t size,
> dma_addr_t *dma_handle,
>  		return NULL;
>  	}
> =20
> -	split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
> +	phys =3D virt_to_phys(ret);
> +	pfn =3D  phys >> PAGE_SHIFT;

nit: not sure it really pays off to have a pfn variable here.

> +	split_page(pfn_to_page(pfn), order);
> =20
> -	*dma_handle =3D virt_to_phys(ret);
> -	if (!WARN_ON(!dev))
> -		*dma_handle -=3D PFN_PHYS(dev->dma_pfn_offset);
> +	*dma_handle =3D (dma_addr_t)phys;
> +	if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
> +		*dma_handle -=3D PFN_PHYS(
> +			dma_pfn_offset_from_phys_addr(dev, phys));

> =20
>  	return ret_nocache;
>  }
> @@ -50,8 +55,8 @@ void arch_dma_free(struct device *dev, size_t size, voi=
d
> *vaddr,
>  	unsigned long pfn =3D (dma_handle >> PAGE_SHIFT);
>  	int k;
> =20
> -	if (!WARN_ON(!dev))
> -		pfn +=3D dev->dma_pfn_offset;
> +	if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
> +		pfn +=3D dma_pfn_offset_from_dma_addr(dev, dma_handle);
> =20
>  	for (k =3D 0; k < (1 << order); k++)
>  		__free_pages(pfn_to_page(pfn + k), 0);
> diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> index c313d784efab..4cdeca9f69b6 100644
> --- a/arch/x86/pci/sta2x11-fixup.c
> +++ b/arch/x86/pci/sta2x11-fixup.c
> @@ -12,6 +12,7 @@
>  #include <linux/export.h>
>  #include <linux/list.h>
>  #include <linux/dma-direct.h>
> +#include <linux/dma-mapping.h>
>  #include <asm/iommu.h>
> =20
>  #define STA2X11_SWIOTLB_SIZE (4*1024*1024)
> @@ -133,7 +134,7 @@ static void sta2x11_map_ep(struct pci_dev *pdev)
>  	struct sta2x11_instance *instance =3D sta2x11_pdev_to_instance(pdev);
>  	struct device *dev =3D &pdev->dev;
>  	u32 amba_base, max_amba_addr;
> -	int i;
> +	int i, ret;
> =20
>  	if (!instance)
>  		return;
> @@ -141,7 +142,9 @@ static void sta2x11_map_ep(struct pci_dev *pdev)
>  	pci_read_config_dword(pdev, AHB_BASE(0), &amba_base);
>  	max_amba_addr =3D amba_base + STA2X11_AMBA_SIZE - 1;
> =20
> -	dev->dma_pfn_offset =3D PFN_DOWN(-amba_base);
> +	ret =3D attach_uniform_dma_pfn_offset(dev, PFN_DOWN(-amba_base));
> +	if (ret)
> +		dev_err(dev, "sta2x11: could not set PFN offset\n");
> =20
>  	dev->bus_dma_limit =3D max_amba_addr;
>  	pci_set_consistent_dma_mask(pdev, max_amba_addr);
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 28a6b387e80e..153661ddc74b 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1142,8 +1142,9 @@ void iort_dma_setup(struct device *dev, u64 *dma_ad=
dr,
> u64 *dma_size)
>  	*dma_addr =3D dmaaddr;
>  	*dma_size =3D size;
> =20
> -	dev->dma_pfn_offset =3D PFN_DOWN(offset);
> -	dev_dbg(dev, "dma_pfn_offset(%#08llx)\n", offset);
> +	ret =3D attach_uniform_dma_pfn_offset(dev, PFN_DOWN(offset));
> +	dev_dbg(dev, "dma_pfn_offset(%#08llx)%s\n",
> +		offset, ret ? " failed!" : "");
>  }
> =20
>  static void __init acpi_iort_register_irq(int hwirq, const char *name,
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
> b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index 072ea113e6be..3d41dfc7d178 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> =20
> @@ -786,7 +787,7 @@ static int sun4i_backend_bind(struct device *dev, str=
uct
> device *master,
>  	const struct sun4i_backend_quirks *quirks;
>  	struct resource *res;
>  	void __iomem *regs;
> -	int i, ret;
> +	int i, ret =3D 0;
> =20
>  	backend =3D devm_kzalloc(dev, sizeof(*backend), GFP_KERNEL);
>  	if (!backend)
> @@ -812,7 +813,9 @@ static int sun4i_backend_bind(struct device *dev, str=
uct
> device *master,
>  		 * on our device since the RAM mapping is at 0 for the DMA bus,
>  		 * unlike the CPU.
>  		 */
> -		drm->dev->dma_pfn_offset =3D PHYS_PFN_OFFSET;
> +		ret =3D attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
> +		if (ret)
> +			return ret;
>  	}
> =20
>  	backend->engine.node =3D dev->of_node;
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-ar=
m.c
> index 04fbd4bf0ff9..e9cc1c2d47cd 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -754,7 +754,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
>  		return NULL;
> =20
> -	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset) {
> +	if (!selftest_running && cfg->iommu_dev->dma_pfn_offset_map) {
>  		dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU
> page tables\n");
>  		return NULL;
>  	}
> diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> index eff34ded6305..7212da5e1076 100644
> --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> @@ -7,6 +7,7 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -183,7 +184,9 @@ static int sun4i_csi_probe(struct platform_device *pd=
ev)
>  			return ret;
>  	} else {
>  #ifdef PHYS_PFN_OFFSET
> -		csi->dev->dma_pfn_offset =3D PHYS_PFN_OFFSET;
> +		ret =3D attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
> +		if (ret)
> +			return ret;
>  #endif
>  	}
> =20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> index 055eb0b8e396..2d66d415b6c3 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> @@ -898,7 +898,10 @@ static int sun6i_csi_probe(struct platform_device *p=
dev)
> =20
>  	sdev->dev =3D &pdev->dev;
>  	/* The DMA bus has the memory mapped at 0 */
> -	sdev->dev->dma_pfn_offset =3D PHYS_OFFSET >> PAGE_SHIFT;
> +	ret =3D attach_uniform_dma_pfn_offset(sdev->dev,
> +					    PHYS_OFFSET >> PAGE_SHIFT);
> +	if (ret)
> +		return ret;
> =20
>  	ret =3D sun6i_csi_resource_request(sdev, pdev);
>  	if (ret)
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 96d8cfb14a60..c89333b0a5fb 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct device_no=
de
> *np, int index,
>  }
>  EXPORT_SYMBOL(of_io_request_and_map);
> =20
> +static int attach_dma_pfn_offset_map(struct device *dev,
> +				     struct device_node *node, int num_ranges)

As with the previous review, please take this comment with a grain of salt.

I think there should be a clear split between what belongs to OF and what
belongs to the core device infrastructure.

OF's job should be to parse DT and provide a list/array of ranges, whereas =
the
core device infrastructure should provide an API to assign a list of
ranges/offset to a device.

As a concrete example, you're forcing devices like the sta2x11 to build wit=
h OF
support, which, being an Intel device, it's pretty odd. But I'm also thinki=
ng
of how will all this fit once an ACPI device wants to use it.

Expanding on this idea, once you have a split between the OF's and device c=
ore
roles, it transpires that of_dma_get_range()'s job should only be to provid=
e
the ranges in a device understandable structure and of_dma_configre()'s to
actually assign the device's parameters. This would obsolete patch #7.

> +{
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	struct dma_pfn_offset_region *r;
> +
> +	r =3D devm_kcalloc(dev, num_ranges + 1,
> +			 sizeof(struct dma_pfn_offset_region), GFP_KERNEL);
> +	if (!r)
> +		return -ENOMEM;
> +	dev->dma_pfn_offset_map =3D r;
> +	of_dma_range_parser_init(&parser, node);
> +
> +	/*
> +	 * Record all info for DMA ranges array.  We could
> +	 * just use the of_range struct, but if we did that it
> +	 * would require more calculations for phys_to_dma and
> +	 * dma_to_phys conversions.
> +	 */
> +	for_each_of_range(&parser, &range) {
> +		r->cpu_start =3D range.cpu_addr;
> +		r->cpu_end =3D r->cpu_start + range.size - 1;
> +		r->dma_start =3D range.bus_addr;
> +		r->dma_end =3D r->dma_start + range.size - 1;
> +		r->pfn_offset =3D PFN_DOWN(range.cpu_addr)
> +			- PFN_DOWN(range.bus_addr);
> +		r++;
> +	}
> +	return 0;
> +}
> +
> +
> +
> +/**
> + * attach_dma_pfn_offset - Assign scalar offset for all addresses.
> + * @dev:	device pointer; only needed for a corner case.

That's a huge corner :P

> + * @dma_pfn_offset:	offset to apply when converting from phys addr
> + *			to dma addr and vice versa.
> + *
> + * It returns -ENOMEM if out of memory, otherwise 0.
> + */
> +int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long
> pfn_offset)

As I say above, does this really belong to of/address.c?

> +{
> +	struct dma_pfn_offset_region *r;
> +
> +	if (!dev)
> +		return -ENODEV;
> +
> +	if (!pfn_offset)
> +		return 0;
> +
> +	r =3D devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region),
> +			 GFP_KERNEL);
> +	if (!r)
> +		return -ENOMEM;

I think you're missing this:

	dev->dma_pfn_offset_map =3D r;

> +
> +	r->uniform_offset =3D true;
> +	r->pfn_offset =3D pfn_offset;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
> +
>  /**
>   * of_dma_get_range - Get DMA range info
>   * @dev:	device pointer; only needed for a corner case.
> @@ -933,7 +997,7 @@ EXPORT_SYMBOL(of_io_request_and_map);
>   *	CPU addr (phys_addr_t)	: pna cells
>   *	size			: nsize cells
>   *
> - * It returns -ENODEV if "dma-ranges" property was not found
> + * It returns -ENODEV if !dev or "dma-ranges" property was not found
>   * for this device in DT.
>   */
>  int of_dma_get_range(struct device *dev, struct device_node *np, u64
> *dma_addr,
> @@ -946,7 +1010,13 @@ int of_dma_get_range(struct device *dev, struct
> device_node *np, u64 *dma_addr,
>  	bool found_dma_ranges =3D false;
>  	struct of_range_parser parser;
>  	struct of_range range;
> +	phys_addr_t cpu_start =3D ~(phys_addr_t)0;
>  	u64 dma_start =3D U64_MAX, dma_end =3D 0, dma_offset =3D 0;
> +	bool dma_multi_pfn_offset =3D false;
> +	int num_ranges =3D 0;
> +
> +	if (!dev)
> +		return -ENODEV;

Shouldn't this be part of patch #7?

Regards,
Nicolas


--=-dvCBVLPahkIYdQSZwNeh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl7Y/MkACgkQlfZmHno8
x/58EQf+L3CZ9+7puoOhf6F5wByyQkoQhcYv82BRgn7U8E2dtoEAPtPljN8HDmWE
P7XP24W9pORlsVWs/rVKzxQa70JzoAixazumyYKt6iKrghT4UVjRlb2obqCYyoNW
7wj9Do5g2lJEic+xWi+bo7OIZtQinHXWJ6UTLd5Lz7xRpBl+mY690309UJioBjD0
a6mtXQN0WaCyJPfciJRDISzG6lSqJZNku8+NeMLI9hr0HRPb7HQh4+uT/ZGytXW8
K2+EAmJ1U48XLVNAdODxiGAp1rcINfdTF54RpOTf3WshKLjNiUvLVUV7uocoYZ5l
5349qyaYq+HmWOx1OgMxPYxEpbJXHA==
=kzZ/
-----END PGP SIGNATURE-----

--=-dvCBVLPahkIYdQSZwNeh--


--===============0240583914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0240583914==--

