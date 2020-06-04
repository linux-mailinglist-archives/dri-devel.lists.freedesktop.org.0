Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA4B1EF1E1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E1C6E84F;
	Fri,  5 Jun 2020 07:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319E6E067
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 13:49:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f5so5716491wmh.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 06:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NVOXrKAg02/5WkE8OaWh2gQjA4Qfw+gXm0oP/cRI1Qk=;
 b=EYHTqPVa2VFP6EZ1cWTc5lGtJrVFCHxbrv2/rTvDOttX5qaG1pQy8/OniJi0gi58gv
 i+2NVd3Yi0pNvAG3nGI06AJLJFByhQReV0pXNlXCHD0G9+g9/0wQ17u3CuB5qcwLuTQw
 YVPQUOvygf2XlNmJeGOCU3GxN+Zfjv40TjJdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NVOXrKAg02/5WkE8OaWh2gQjA4Qfw+gXm0oP/cRI1Qk=;
 b=ZRtHN/wT+xFRAkgCW+tPAIiiU/oDb52yxb1zdE18sdKLLm+SiG7dYvB5eigCME6vta
 7e06KQogPWW6xOHztSVDlaUXO93ieED0X4/Ih4A/wEiPrqlLyXgkVtJWBg6TIv7PRp1w
 4xRFUqBE+J7u8O1yp+lRVUEdA5ugcAcdS4UPnL6bLYE7EzTYGn1XQBVEG/4JDj+eHDHh
 8zgzyD3VmMHkXekPi7f09NqN0eeWOrJdLNlrlYQy8YzsUw+w5quj/B/hqeyefo0T/LBI
 Fv20z4/ALOJMYMcKmXOwe+J2syY1WcasEfHm4fmdpB8b+hy6VqVbIWzOJ/kdfh/JtsG3
 DhnA==
X-Gm-Message-State: AOAM530c7u1R7s3cZ9V8IHSUvcxYU8HmPOusErX2cM7kB63uepjwvFPp
 5LxRDywxc5YcKQkVaS50TzrlgvtXbk0aJYNJG1CXSQ==
X-Google-Smtp-Source: ABdhPJyLgGykFutB5VOIIsNo0UGMY9ntvyTBPwMd7cQzMDRPBJoaI2izkl0zhMzMo3/YlS8q3PY669MWygdUbIdMsjs=
X-Received: by 2002:a1c:4405:: with SMTP id r5mr4355466wma.72.1591278541928;
 Thu, 04 Jun 2020 06:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200603192058.35296-1-james.quinlan@broadcom.com>
 <20200603192058.35296-10-james.quinlan@broadcom.com>
 <20200604110455.GO30374@kadam>
In-Reply-To: <20200604110455.GO30374@kadam>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 4 Jun 2020 09:48:49 -0400
Message-ID: <CA+-6iNyaL8izv5eHJyYkhwu9diPsqT0AD08UU_ECexNcdrT+jA@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] device core: Introduce multiple dma pfn offsets
To: Dan Carpenter <dan.carpenter@oracle.com>
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
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On Thu, Jun 4, 2020 at 7:06 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Jun 03, 2020 at 03:20:41PM -0400, Jim Quinlan wrote:
> > @@ -786,7 +787,7 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
> >       const struct sun4i_backend_quirks *quirks;
> >       struct resource *res;
> >       void __iomem *regs;
> > -     int i, ret;
> > +     int i, ret = 0;
>
> No need for this.
Will fix.

>
> >
> >       backend = devm_kzalloc(dev, sizeof(*backend), GFP_KERNEL);
> >       if (!backend)
> > @@ -812,7 +813,9 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
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
> >               dev_err(cfg->iommu_dev, "Cannot accommodate DMA offset for IOMMU page tables\n");
> >               return NULL;
> >       }
> > diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
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
> > diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
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
> > @@ -918,6 +918,70 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
> >  }
> >  EXPORT_SYMBOL(of_io_request_and_map);
> >
> > +static int attach_dma_pfn_offset_map(struct device *dev,
> > +                                  struct device_node *node, int num_ranges)
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
> > + * @dma_pfn_offset:  offset to apply when converting from phys addr
>       ^^^^^^^^^^^^^^^
> This parameter name does not match.
Will fix.

>
> > + *                   to dma addr and vice versa.
> > + *
> > + * It returns -ENOMEM if out of memory, otherwise 0.
>
> It can also return -ENODEV.  Why are we passing NULL dev pointers to
> all these functions anyway?
No one should be passing dev==NULL to these functions -- that is why I
have the error out for this case.  Actually, there is a case of
dev==NULL being passed -- drivers/of/unittest.c makes a call with  a
NULL device because it has no dev  in its context.  I wasn't sure how
to fix this.

>
> > + */
> > +int attach_uniform_dma_pfn_offset(struct device *dev, unsigned long pfn_offset)
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
>
> Use:    r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
Will fix.

>
>
> > +     if (!r)
> > +             return -ENOMEM;
> > +
> > +     r->uniform_offset = true;
> > +     r->pfn_offset = pfn_offset;
> > +
> > +     return 0;
> > +}
>
> This function doesn't seem to do anything useful.  Is part of it
> missing?
No, the uniform pfn offset is a special case.  With it, there is only
one entry  in the "map" and 'uniform_offset' is set to true and the
pfn_offset is also set.  When the offset is to be computed, there are
no region bounds calculations needed -- the offset of the first entry
is returned immediately.  This special case was intentional to (a)
preserve backwards compatibility to  those using dev->dma_pfn_offset
and (b) it is faster than treating it as the general case -- I want to
minimize the execution cost of this case.  If this is deemed
unnecessary, I can remove the boolean and threat all cases in the same
way.

The other case is where multiple pfn offsets are needed for multiple
regions.  In this case the code checks the bounds for each successive
region, returning an  offset if there is a match.
>
> > +EXPORT_SYMBOL_GPL(attach_uniform_dma_pfn_offset);
> > +
>
> regards,
> dan carpenter
>

Thanks!
Jim Quinlan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
