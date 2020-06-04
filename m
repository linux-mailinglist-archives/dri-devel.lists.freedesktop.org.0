Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA11EF1D5
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910006E851;
	Fri,  5 Jun 2020 07:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891916E065
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 14:35:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u26so6983494wmn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wkulGcIfUsui0COexTmAKitvRWAZk+cNyz4pzTcKhuk=;
 b=S8IcrJt1hm+30Xbnr3ebAK/9EiW7c//TkTJaexYCQ+/cWuIjQCsiVyU+jNfo633jkg
 d/j/iXzopJFHzPvaqvOWYdBZgdnGyoKWOFCXHkq2iwHB259wPYrgzIbl/qhXJgoBT1+Z
 D86dfkYdxVYccALrBsR7ZAPPG10eYhcQBMl6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wkulGcIfUsui0COexTmAKitvRWAZk+cNyz4pzTcKhuk=;
 b=bws2tMYzvprcYJ8UfhOYds3NGPXES/oBh1GZsBoXYgkU5CRH4pd995seKiAyo8pu84
 NY0OfnXlq+AZrYY/mDmIN8BsrpREMEM69kkkv+ZJWTif2NtS+DpAGXJ3BsWesBzLJBAV
 nX9+I1AkhMDD1RWETE/ndzFRY7e75VsuH9dOAx7mUDeJgfcs0Ez8qBk8TC8wP37VlJCD
 C5QZ8k+2nAAOveoS84ImMh1t1dPTcfblRVeQyFOFANpCV/PjId7vOeotYv0RcwhxexPP
 0YquBWEu1I/LYMJipQ/ttjqEe/xn7rNBDNVAa5Sx47gJWeZ0ybzuCgVinKF2gey65BJz
 587Q==
X-Gm-Message-State: AOAM533C4h+CYbdCcyPxUNTyRWuSGPTBegg+XtgSvjmmO2aKX3Zza8In
 25f3mNSWq4nD0fZJR5vcchFOT48ageUIhAmzAeTy9w==
X-Google-Smtp-Source: ABdhPJyZI8awfRV49n22qCK8EWq2UJEhHb5aV1ozX7d2qItvO5hgMiYrQIk8LpemMDhr5S+a4s6dpRMOSYtaWx+FcE0=
X-Received: by 2002:a7b:c1c5:: with SMTP id a5mr4236267wmj.35.1591281323721;
 Thu, 04 Jun 2020 07:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
In-Reply-To: <09c451e24f62e226e1ceaa0fe5d0a81109cace74.camel@suse.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 4 Jun 2020 10:35:12 -0400
Message-ID: <CA+-6iNz1-1wOurKoOJzhbVL0_YP7dbmp0wy1GWkLW_61yhRXyA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 David Kershner <david.kershner@unisys.com>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>,
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
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 9:53 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Jim,
>
> On Wed, 2020-06-03 at 15:20 -0400, Jim Quinlan wrote:
> > The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> > the use of multiple pfn offsets between cpu addrs and dma addrs.  It
> > subsumes the role of dev->dma_pfn_offset -- a uniform offset -- and
> > designates the single offset a special case.
> >
> > of_dma_configure() is the typical manner to set pfn offsets but there
> > are a number of ad hoc assignments to dev->dma_pfn_offset in the
> > kernel code.  These cases now invoke the function
> > attach_uniform_dma_pfn_offset(dev, pfn_offset).
> >
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
> >  arch/arm/include/asm/dma-mapping.h            |  9 +-
> >  arch/arm/mach-keystone/keystone.c             |  9 +-
> >  arch/sh/drivers/pci/pcie-sh7786.c             |  3 +-
> >  arch/sh/kernel/dma-coherent.c                 | 17 ++--
> >  arch/x86/pci/sta2x11-fixup.c                  |  7 +-
> >  drivers/acpi/arm64/iort.c                     |  5 +-
> >  drivers/gpu/drm/sun4i/sun4i_backend.c         |  7 +-
> >  drivers/iommu/io-pgtable-arm.c                |  2 +-
> >  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  5 +-
> >  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  5 +-
> >  drivers/of/address.c                          | 93 +++++++++++++++++--
> >  drivers/of/device.c                           |  8 +-
> >  drivers/remoteproc/remoteproc_core.c          |  2 +-
> >  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  7 +-
> >  drivers/usb/core/message.c                    |  4 +-
> >  drivers/usb/core/usb.c                        |  2 +-
> >  include/linux/device.h                        |  4 +-
> >  include/linux/dma-direct.h                    | 16 +++-
> >  include/linux/dma-mapping.h                   | 45 +++++++++
> >  kernel/dma/coherent.c                         | 11 ++-
> >  20 files changed, 210 insertions(+), 51 deletions(-)
> >
> > diff --git a/arch/arm/include/asm/dma-mapping.h b/arch/arm/include/asm/dma-
> > mapping.h
> > index bdd80ddbca34..f1e72f99468b 100644
> > --- a/arch/arm/include/asm/dma-mapping.h
> > +++ b/arch/arm/include/asm/dma-mapping.h
> > @@ -35,8 +35,9 @@ static inline const struct dma_map_ops
> > *get_arch_dma_ops(struct bus_type *bus)
> >  #ifndef __arch_pfn_to_dma
> >  static inline dma_addr_t pfn_to_dma(struct device *dev, unsigned long pfn)
> >  {
> > -     if (dev)
> > -             pfn -= dev->dma_pfn_offset;
> > +     if (dev && dev->dma_pfn_offset_map)
>
> Would it make sense to move the dev->dma_pfn_offset_map check into
> dma_pfn_offset_from_phys_addr() and return 0 if not available? Same for the
> opposite variant of the function. I think it'd make the code a little simpler on
> some of the use cases, and overall less error prone if anyone starts using the
> function elsewhere.

Yes it makes sense and I was debating doing it but I just wanted to
make it explicit that there was not much cost for this change for the
fastpath -- no dma_pfn_offset whatsoever -- as the cost goes from a
"pfn += dev->dma_pfn_offset"  to a "if (dev->dma_pfn_offset_map)".  I
will do what you suggest.
>
> > +             pfn -= dma_pfn_offset_from_phys_addr(dev, PFN_PHYS(pfn));
> > +
> >       return (dma_addr_t)__pfn_to_bus(pfn);
> >  }
> >
> > @@ -44,8 +45,8 @@ static inline unsigned long dma_to_pfn(struct device *dev,
> > dma_addr_t addr)
> >  {
> >       unsigned long pfn = __bus_to_pfn(addr);
> >
> > -     if (dev)
> > -             pfn += dev->dma_pfn_offset;
> > +     if (dev && dev->dma_pfn_offset_map)
> > +             pfn += dma_pfn_offset_from_dma_addr(dev, addr);
> >
> >       return pfn;
> >  }
> > diff --git a/arch/arm/mach-keystone/keystone.c b/arch/arm/mach-
> > keystone/keystone.c
> > index 638808c4e122..e7d3ee6e9cb5 100644
> > --- a/arch/arm/mach-keystone/keystone.c
> > +++ b/arch/arm/mach-keystone/keystone.c
> > @@ -8,6 +8,7 @@
> >   */
> >  #include <linux/io.h>
> >  #include <linux/of.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/init.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/of_address.h>
> > @@ -38,9 +39,11 @@ static int keystone_platform_notifier(struct notifier_block
> > *nb,
> >               return NOTIFY_BAD;
> >
> >       if (!dev->of_node) {
> > -             dev->dma_pfn_offset = keystone_dma_pfn_offset;
> > -             dev_err(dev, "set dma_pfn_offset%08lx\n",
> > -                     dev->dma_pfn_offset);
> > +             int ret = attach_uniform_dma_pfn_offset
> > +                             (dev, keystone_dma_pfn_offset);
> > +
> > +             dev_err(dev, "set dma_pfn_offset%08lx%s\n",
> > +                     dev->dma_pfn_offset, ret ? " failed" : "");
> >       }
> >       return NOTIFY_OK;
> >  }
> > diff --git a/arch/sh/drivers/pci/pcie-sh7786.c b/arch/sh/drivers/pci/pcie-
> > sh7786.c
> > index e0b568aaa701..2e832a5c58c1 100644
> > --- a/arch/sh/drivers/pci/pcie-sh7786.c
> > +++ b/arch/sh/drivers/pci/pcie-sh7786.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/io.h>
> >  #include <linux/async.h>
> >  #include <linux/delay.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/slab.h>
> >  #include <linux/clk.h>
> >  #include <linux/sh_clk.h>
> > @@ -487,7 +488,7 @@ int pcibios_map_platform_irq(const struct pci_dev *pdev,
> > u8 slot, u8 pin)
> >
> >  void pcibios_bus_add_device(struct pci_dev *pdev)
> >  {
> > -     pdev->dev.dma_pfn_offset = dma_pfn_offset;
> > +     attach_uniform_dma_pfn_offset(&pdev->dev, dma_pfn_offset);
> >  }
> >
> >  static int __init sh7786_pcie_core_init(void)
> > diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.c
> > index d4811691b93c..5fc9e358b6c7 100644
> > --- a/arch/sh/kernel/dma-coherent.c
> > +++ b/arch/sh/kernel/dma-coherent.c
> > @@ -14,6 +14,8 @@ void *arch_dma_alloc(struct device *dev, size_t size,
> > dma_addr_t *dma_handle,
> >  {
> >       void *ret, *ret_nocache;
> >       int order = get_order(size);
> > +     unsigned long pfn;
> > +     phys_addr_t phys;
> >
> >       gfp |= __GFP_ZERO;
> >
> > @@ -34,11 +36,14 @@ void *arch_dma_alloc(struct device *dev, size_t size,
> > dma_addr_t *dma_handle,
> >               return NULL;
> >       }
> >
> > -     split_page(pfn_to_page(virt_to_phys(ret) >> PAGE_SHIFT), order);
> > +     phys = virt_to_phys(ret);
> > +     pfn =  phys >> PAGE_SHIFT;
>
> nit: not sure it really pays off to have a pfn variable here.
Did it for readability; the compiler's optimization should take care
of any extra variables.  But I can switch if you insist.
>
> > +     split_page(pfn_to_page(pfn), order);
> >
> > -     *dma_handle = virt_to_phys(ret);
> > -     if (!WARN_ON(!dev))
> > -             *dma_handle -= PFN_PHYS(dev->dma_pfn_offset);
> > +     *dma_handle = (dma_addr_t)phys;
> > +     if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
> > +             *dma_handle -= PFN_PHYS(
> > +                     dma_pfn_offset_from_phys_addr(dev, phys));
>
> >
> >       return ret_nocache;
> >  }
> > @@ -50,8 +55,8 @@ void arch_dma_free(struct device *dev, size_t size, void
> > *vaddr,
> >       unsigned long pfn = (dma_handle >> PAGE_SHIFT);
> >       int k;
> >
> > -     if (!WARN_ON(!dev))
> > -             pfn += dev->dma_pfn_offset;
> > +     if (!WARN_ON(!dev) && dev->dma_pfn_offset_map)
> > +             pfn += dma_pfn_offset_from_dma_addr(dev, dma_handle);
> >
> >       for (k = 0; k < (1 << order); k++)
> >               __free_pages(pfn_to_page(pfn + k), 0);
> > diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
> > index c313d784efab..4cdeca9f69b6 100644
> > --- a/arch/x86/pci/sta2x11-fixup.c
> > +++ b/arch/x86/pci/sta2x11-fixup.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/export.h>
> >  #include <linux/list.h>
> >  #include <linux/dma-direct.h>
> > +#include <linux/dma-mapping.h>
> >  #include <asm/iommu.h>
> >
> >  #define STA2X11_SWIOTLB_SIZE (4*1024*1024)
> > @@ -133,7 +134,7 @@ static void sta2x11_map_ep(struct pci_dev *pdev)
> >       struct sta2x11_instance *instance = sta2x11_pdev_to_instance(pdev);
> >       struct device *dev = &pdev->dev;
> >       u32 amba_base, max_amba_addr;
> > -     int i;
> > +     int i, ret;
> >
> >       if (!instance)
> >               return;
> > @@ -141,7 +142,9 @@ static void sta2x11_map_ep(struct pci_dev *pdev)
> >       pci_read_config_dword(pdev, AHB_BASE(0), &amba_base);
> >       max_amba_addr = amba_base + STA2X11_AMBA_SIZE - 1;
> >
> > -     dev->dma_pfn_offset = PFN_DOWN(-amba_base);
> > +     ret = attach_uniform_dma_pfn_offset(dev, PFN_DOWN(-amba_base));
> > +     if (ret)
> > +             dev_err(dev, "sta2x11: could not set PFN offset\n");
> >
> >       dev->bus_dma_limit = max_amba_addr;
> >       pci_set_consistent_dma_mask(pdev, max_amba_addr);
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index 28a6b387e80e..153661ddc74b 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -1142,8 +1142,9 @@ void iort_dma_setup(struct device *dev, u64 *dma_addr,
> > u64 *dma_size)
> >       *dma_addr = dmaaddr;
> >       *dma_size = size;
> >
> > -     dev->dma_pfn_offset = PFN_DOWN(offset);
> > -     dev_dbg(dev, "dma_pfn_offset(%#08llx)\n", offset);
> > +     ret = attach_uniform_dma_pfn_offset(dev, PFN_DOWN(offset));
> > +     dev_dbg(dev, "dma_pfn_offset(%#08llx)%s\n",
> > +             offset, ret ? " failed!" : "");
> >  }
> >
> >  static void __init acpi_iort_register_irq(int hwirq, const char *name,
> > diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > index 072ea113e6be..3d41dfc7d178 100644
> > --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> > +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/reset.h>
> >
> > @@ -786,7 +787,7 @@ static int sun4i_backend_bind(struct device *dev, struct
> > device *master,
> >       const struct sun4i_backend_quirks *quirks;
> >       struct resource *res;
> >       void __iomem *regs;
> > -     int i, ret;
> > +     int i, ret = 0;
> >
> >       backend = devm_kzalloc(dev, sizeof(*backend), GFP_KERNEL);
> >       if (!backend)
> > @@ -812,7 +813,9 @@ static int sun4i_backend_bind(struct device *dev, struct
> > device *master,
> >                * on our device since the RAM mapping is at 0 for the DMA bus,
> >                * unlike the CPU.
> >                */
> > -             drm->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
> > +             ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       backend->engine.node = dev->of_node;
> > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > index 04fbd4bf0ff9..e9cc1c2d47cd 100644
> > --- a/drivers/iommu/io-pgtable-arm.c
> > +++ b/drivers/iommu/io-pgtable-arm.c
> > @@ -754,7 +754,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
> >       if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
> >               return NULL;
> >
> > -     if (!selftest_running && cfg->iommu_dev->dma_pfn_offset) {
> > +     if (!selftest_running && cfg->iommu_dev->dma_pfn_offset_map) {
> >               dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU
> > page tables\n");
> >               return NULL;
> >       }
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > index eff34ded6305..7212da5e1076 100644
> > --- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
> > @@ -7,6 +7,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/dma-mapping.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > @@ -183,7 +184,9 @@ static int sun4i_csi_probe(struct platform_device *pdev)
> >                       return ret;
> >       } else {
> >  #ifdef PHYS_PFN_OFFSET
> > -             csi->dev->dma_pfn_offset = PHYS_PFN_OFFSET;
> > +             ret = attach_uniform_dma_pfn_offset(dev, PHYS_PFN_OFFSET);
> > +             if (ret)
> > +                     return ret;
> >  #endif
> >       }
> >
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > index 055eb0b8e396..2d66d415b6c3 100644
> > --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
> > @@ -898,7 +898,10 @@ static int sun6i_csi_probe(struct platform_device *pdev)
> >
> >       sdev->dev = &pdev->dev;
> >       /* The DMA bus has the memory mapped at 0 */
> > -     sdev->dev->dma_pfn_offset = PHYS_OFFSET >> PAGE_SHIFT;
> > +     ret = attach_uniform_dma_pfn_offset(sdev->dev,
> > +                                         PHYS_OFFSET >> PAGE_SHIFT);
> > +     if (ret)
> > +             return ret;
> >
> >       ret = sun6i_csi_resource_request(sdev, pdev);
> >       if (ret)
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 96d8cfb14a60..c89333b0a5fb 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct device_node
> > *np, int index,
> >  }
> >  EXPORT_SYMBOL(of_io_request_and_map);
> >
> > +static int attach_dma_pfn_offset_map(struct device *dev,
> > +                                  struct device_node *node, int num_ranges)
>
> As with the previous review, please take this comment with a grain of salt.
>
> I think there should be a clear split between what belongs to OF and what
> belongs to the core device infrastructure.
>
> OF's job should be to parse DT and provide a list/array of ranges, whereas the
> core device infrastructure should provide an API to assign a list of
> ranges/offset to a device.
>
> As a concrete example, you're forcing devices like the sta2x11 to build with OF
> support, which, being an Intel device, it's pretty odd. But I'm also thinking
> of how will all this fit once an ACPI device wants to use it.
To fix this I only have to move attach_uniform_dma_pfn_offset() from
of/address.c to say include/linux/dma-mapping.h.  It has no
dependencies on OF.  Do you agree?

>
> Expanding on this idea, once you have a split between the OF's and device core
> roles, it transpires that of_dma_get_range()'s job should only be to provide
> the ranges in a device understandable structure and of_dma_configre()'s to
> actually assign the device's parameters. This would obsolete patch #7.

I think you mean patch #8.  I agree with you.  The reason I needed a
"struct device *"  in the call is because I wanted to make sure the
memory that is alloc'd belongs to the device that needs it.  If I do a
regular kzalloc(), this memory  will become a leak once someone starts
unbinding/binding their device.  Also, in  all uses of of_dma_rtange()
-- there is only one --  a dev is required as one can't attach an
offset map to NULL.

I do see that there are a number of functions in drivers/of/*.c that
take 'struct device *dev' as an argument so there is precedent for
something like this.  Regardless, I need an owner to the memory I
alloc().


>
> > +{
> > +     struct of_range_parser parser;
> > +     struct of_range range;
> > +     struct dma_pfn_offset_region *r;
> > +
> > +     r = devm_kcalloc(dev, num_ranges + 1,
> > +                      sizeof(struct dma_pfn_offset_region), GFP_KERNEL);
> > +     if (!r)
> > +             return -ENOMEM;
> > +     dev->dma_pfn_offset_map = r;
> > +     of_dma_range_parser_init(&parser, node);
> > +
> > +     /*
> > +      * Record all info for DMA ranges array.  We could
> > +      * just use the of_range struct, but if we did that it
> > +      * would require more calculations for phys_to_dma and
> > +      * dma_to_phys conversions.
> > +      */
> > +     for_each_of_range(&parser, &range) {
> > +             r->cpu_start = range.cpu_addr;
> > +             r->cpu_end = r->cpu_start + range.size - 1;
> > +             r->dma_start = range.bus_addr;
> > +             r->dma_end = r->dma_start + range.size - 1;
> > +             r->pfn_offset = PFN_DOWN(range.cpu_addr)
> > +                     - PFN_DOWN(range.bus_addr);
> > +             r++;
> > +     }
> > +     return 0;
> > +}
> > +
> > +
> > +
> > +/**
> > + * attach_dma_pfn_offset - Assign scalar offset for all addresses.
> > + * @dev:     device pointer; only needed for a corner case.
>
> That's a huge corner :P
Good point; I'm not really sure what percent of Linux configurations
require a dma_pfn_offset.  I'll drop the "corner".

>
> > + * @dma_pfn_offset:  offset to apply when converting from phys addr
> > + *                   to dma addr and vice versa.
> > + *
> > + * It returns -ENOMEM if out of memory, otherwise 0.
> > + */
> > +int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long
> > pfn_offset)
>
> As I say above, does this really belong to of/address.c?
No it does not.  Will fix.

>
> > +{
> > +     struct dma_pfn_offset_region *r;
> > +
> > +     if (!dev)
> > +             return -ENODEV;
> > +
> > +     if (!pfn_offset)
> > +             return 0;
> > +
> > +     r = devm_kcalloc(dev, 1, sizeof(struct dma_pfn_offset_region),
> > +                      GFP_KERNEL);
> > +     if (!r)
> > +             return -ENOMEM;
>
> I think you're missing this:
>
>         dev->dma_pfn_offset_map = r;
>
That's a showstopper!  DanC also pointed it out but I still didn't see
it.  Thanks!

> > +
> > +     r->uniform_offset = true;
> > +     r->pfn_offset = pfn_offset;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
> > +
> >  /**
> >   * of_dma_get_range - Get DMA range info
> >   * @dev:     device pointer; only needed for a corner case.
> > @@ -933,7 +997,7 @@ EXPORT_SYMBOL(of_io_request_and_map);
> >   *   CPU addr (phys_addr_t)  : pna cells
> >   *   size                    : nsize cells
> >   *
> > - * It returns -ENODEV if "dma-ranges" property was not found
> > + * It returns -ENODEV if !dev or "dma-ranges" property was not found
> >   * for this device in DT.
> >   */
> >  int of_dma_get_range(struct device *dev, struct device_node *np, u64
> > *dma_addr,
> > @@ -946,7 +1010,13 @@ int of_dma_get_range(struct device *dev, struct
> > device_node *np, u64 *dma_addr,
> >       bool found_dma_ranges = false;
> >       struct of_range_parser parser;
> >       struct of_range range;
> > +     phys_addr_t cpu_start = ~(phys_addr_t)0;
> >       u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> > +     bool dma_multi_pfn_offset = false;
> > +     int num_ranges = 0;
> > +
> > +     if (!dev)
> > +             return -ENODEV;
>
> Shouldn't this be part of patch #7?
Do you mean #8?  Do you mean the test for !dev?   It is not required
for #8 so I thought I'd keep these two changes separate.  I could
squash them.
>
> Regards,
> Nicolas
>
Many thanks!

Jim Quinlan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
