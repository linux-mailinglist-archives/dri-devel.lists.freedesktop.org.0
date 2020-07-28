Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D52312A1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6D7C6E3BC;
	Tue, 28 Jul 2020 19:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058786E154
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 18:25:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z18so15665681wrm.12
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMMzLyh9N4KLzRR7OnEb/CRueQwc3bzGAN4n9taot+0=;
 b=PytfZCmkQbzq9fb2mPahs4lhfuu5DgZ1oCa6WnGZNEZjDB3y38SNqrZFZYvn8OFYRU
 uGVee3+HlLeZ8Q7vaYyxcnfBiuUJFYVMKWGhfdbajfthrWVDxIkYEChlXakQeGsuOIf4
 jdhb6KHV26Y8/QW2HKGQvzzf8DWMeVFBpIQyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMMzLyh9N4KLzRR7OnEb/CRueQwc3bzGAN4n9taot+0=;
 b=YCo9fMdVc+6JS7CbGW27fo2/j/mjYcu5AoExYRPuQ8b8aj2/H6TbC9jpqkno8x0VLF
 LAlNle1D/tCxPulLzf+c3Y9nBVRDwpC5hcmAwsMGoXp8VqWV+oIPnDfgw1fxF6FNc2HS
 KlAPa/Kn/XMzvR1HMb4AytNB4n6/Oa/TS/Ij6DO2XB2L9tQvq5tU8Iw3Clfx0c+vqqMj
 M/9NX82p3cUKoJNDsgSUSmdewV3tw4lRIKLJJr2d8B66VNpH8bN1TNQWFVbuhDgsKh4J
 bvtZpP5aplGYN0BHjc/VgYwa2tugXR0+wZc5uh+ODCKQFEB0Ng+2VKBfUYbk7YlvJI0p
 xDLQ==
X-Gm-Message-State: AOAM531OrfL2eKcltfRlYF8ER62wmew4Fi42457dbTM1G/AmIcj68JTt
 dlaqKNEac5j9C+BZzzY9OJiNxvnFjtw8VyQUtQwOYw==
X-Google-Smtp-Source: ABdhPJxFu6bO7iTBIW4zb3RnQdJ4/IfwAkMcQcLz7bsGlQ0xKBBWgehf79k+jng/ZmP3kThHYgsUE0lS3nEkS/2rCmM=
X-Received: by 2002:a5d:484d:: with SMTP id n13mr26439994wrs.297.1595960706116; 
 Tue, 28 Jul 2020 11:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 28 Jul 2020 14:24:51 -0400
Message-ID: <CA+-6iNwD1ehy6LPJ6gZJjvVeTBXAG_ybhyfUHTCvsDnM-HnmXA@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 PCI <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Borislav Petkov <bp@alien8.de>,
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
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 28, 2020 at 11:05 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Jul 24, 2020 at 2:45 PM Jim Quinlan <james.quinlan@broadcom.com> wrote:
> >
> > The new field 'dma_range_map' in struct device is used to facilitate the
> > use of single or multiple offsets between mapping regions of cpu addrs and
> > dma addrs.  It subsumes the role of "dev->dma_pfn_offset" which was only
> > capable of holding a single uniform offset and had no region bounds
> > checking.
> >
> > The function of_dma_get_range() has been modified so that it takes a single
> > argument -- the device node -- and returns a map, NULL, or an error code.
> > The map is an array that holds the information regarding the DMA regions.
> > Each range entry contains the address offset, the cpu_start address, the
> > dma_start address, and the size of the region.
> >
> > of_dma_configure() is the typical manner to set range offsets but there are
> > a number of ad hoc assignments to "dev->dma_pfn_offset" in the kernel
> > driver code.  These cases now invoke the function
> > dma_attach_offset_range(dev, cpu_addr, dma_addr, size).
> >
> > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > ---
>
> [...]
>
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 8eea3f6e29a4..4b718d199efe 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -918,33 +918,33 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
> >  }
> >  EXPORT_SYMBOL(of_io_request_and_map);
> >
> > +#ifdef CONFIG_HAS_DMA
> >  /**
> > - * of_dma_get_range - Get DMA range info
> > + * of_dma_get_range - Get DMA range info and put it into a map array
> >   * @np:                device node to get DMA range info
> > - * @dma_addr:  pointer to store initial DMA address of DMA range
> > - * @paddr:     pointer to store initial CPU address of DMA range
> > - * @size:      pointer to store size of DMA range
> > + * @map:       dma range structure to return
> >   *
> >   * Look in bottom up direction for the first "dma-ranges" property
> > - * and parse it.
> > - *  dma-ranges format:
> > + * and parse it.  Put the information into a DMA offset map array.
> > + *
> > + * dma-ranges format:
> >   *     DMA addr (dma_addr)     : naddr cells
> >   *     CPU addr (phys_addr_t)  : pna cells
> >   *     size                    : nsize cells
> >   *
> > - * It returns -ENODEV if "dma-ranges" property was not found
> > - * for this device in DT.
> > + * It returns -ENODEV if "dma-ranges" property was not found for this
> > + * device in the DT.
> >   */
> > -int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
> > +int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
> >  {
> >         struct device_node *node = of_node_get(np);
> >         const __be32 *ranges = NULL;
> > -       int len;
> > -       int ret = 0;
> >         bool found_dma_ranges = false;
> >         struct of_range_parser parser;
> >         struct of_range range;
> > -       u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> > +       struct bus_dma_region *r;
> > +       int len, num_ranges = 0;
> > +       int ret;
> >
> >         while (node) {
> >                 ranges = of_get_property(node, "dma-ranges", &len);
> > @@ -970,44 +970,35 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
> >         }
> >
> >         of_dma_range_parser_init(&parser, node);
> > +       for_each_of_range(&parser, &range)
> > +               num_ranges++;
> > +
> > +       of_dma_range_parser_init(&parser, node);
> > +
> > +       ret = -ENOMEM;
> > +       r = kcalloc(num_ranges + 1, sizeof(*r), GFP_KERNEL);
> > +       if (!r)
> > +               goto out;
>
> AFAICT, you have the error cases covered, but you are leaking memory
> if the device is removed.

Hi Rob,

I started using devm_kcalloc() but at least two reviewers convinced me
to just use kcalloc().  In addition, when I was using devm_kcalloc()
it was awkward because 'dev' is not available to this function.

It comes down to whether unbind/binding the device N times is actually
a reasonable usage.  As for my experience I've seen two cases: (1) my
overnight "bind/unbind the PCIe RC driver" script, and we have a
customer who does an unbind/bind as a hail mary to bring back life to
their dead EP device.  If the latter case happens repeatedly, there
are bigger problems.

>
>
> [...]
>b
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 9f04c30c4aaf..49242dd6176e 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -519,7 +519,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
> >         /* Initialise vdev subdevice */
> >         snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
> >         rvdev->dev.parent = &rproc->dev;
> > -       rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
> > +       rvdev->dev.dma_range_map = rproc->dev.parent->dma_range_map;
>
> But doing this means you can't just free the dma_range_map. You need
> to do a copy here or you'd have to refcount it. Or I suppose you could
> check if it the child has a different dma_range_map ptr than the
> parent.

I don't believe the code here attempts to free the dma_range_map or
needs to.  Assuming that we devm_kcalloc'd() the dev->dma_range_map --
which we are not currently doing -- my reasoning is that this device
does not need to free anything since the dev->dma_range_map belongs to
a device higher up in the bus hierarchy, and the lower device will be
removed long before the higher device is removed and
dev->dma_range_map goes away.

Regards,
Jim

Regards,
Jim

>
>
> Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
