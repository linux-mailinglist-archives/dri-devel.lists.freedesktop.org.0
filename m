Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B943230CF2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:05:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72526E31C;
	Tue, 28 Jul 2020 15:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182276E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:05:14 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3D81F22CBB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595948713;
 bh=Kd8bN9GSVqE1wEKIElJMHffTgXE/l8rxxPq8mJwpeDc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cZ35l4imPETNfoE5SAGb6RI4G+j2qL/PGEF5B3hSK2uhOA9PtCfR+xbsDVzixo1A2
 U1mWrKtnqnlRfjDgl7t0mtPTxggBuCYWqyzYUs26F3x7aNYdNe8/4jg/uEpfOnQw5/
 zrPVm7uSz9hQXzOElm8GvRBKIkq0xJ4UsaYV83Oo=
Received: by mail-yb1-f175.google.com with SMTP id g6so10760974ybo.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:05:13 -0700 (PDT)
X-Gm-Message-State: AOAM532VeEeIsEhB/vo3AV60uVy7C2rXxHC21iUH/UjIIJ1Csw6nuo/1
 8IRirWSwbLEQ9Uafb+K7aJ/ojk+MVXo4NCSTxw==
X-Google-Smtp-Source: ABdhPJzpT0pH6HVQkOv8owk366/uYwD6THy4gI9lAaDuq4nkmUj1h5EG+A9f/h2y+Y7mXLtporGnSUp4PvHzrT0otbo=
X-Received: by 2002:a9d:4002:: with SMTP id m2mr24910491ote.129.1595948711211; 
 Tue, 28 Jul 2020 08:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
In-Reply-To: <20200724203407.16972-9-james.quinlan@broadcom.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 28 Jul 2020 09:04:59 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
Message-ID: <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Jim Quinlan <james.quinlan@broadcom.com>
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

On Fri, Jul 24, 2020 at 2:45 PM Jim Quinlan <james.quinlan@broadcom.com> wrote:
>
> The new field 'dma_range_map' in struct device is used to facilitate the
> use of single or multiple offsets between mapping regions of cpu addrs and
> dma addrs.  It subsumes the role of "dev->dma_pfn_offset" which was only
> capable of holding a single uniform offset and had no region bounds
> checking.
>
> The function of_dma_get_range() has been modified so that it takes a single
> argument -- the device node -- and returns a map, NULL, or an error code.
> The map is an array that holds the information regarding the DMA regions.
> Each range entry contains the address offset, the cpu_start address, the
> dma_start address, and the size of the region.
>
> of_dma_configure() is the typical manner to set range offsets but there are
> a number of ad hoc assignments to "dev->dma_pfn_offset" in the kernel
> driver code.  These cases now invoke the function
> dma_attach_offset_range(dev, cpu_addr, dma_addr, size).
>
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---

[...]

> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8eea3f6e29a4..4b718d199efe 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -918,33 +918,33 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
>  }
>  EXPORT_SYMBOL(of_io_request_and_map);
>
> +#ifdef CONFIG_HAS_DMA
>  /**
> - * of_dma_get_range - Get DMA range info
> + * of_dma_get_range - Get DMA range info and put it into a map array
>   * @np:                device node to get DMA range info
> - * @dma_addr:  pointer to store initial DMA address of DMA range
> - * @paddr:     pointer to store initial CPU address of DMA range
> - * @size:      pointer to store size of DMA range
> + * @map:       dma range structure to return
>   *
>   * Look in bottom up direction for the first "dma-ranges" property
> - * and parse it.
> - *  dma-ranges format:
> + * and parse it.  Put the information into a DMA offset map array.
> + *
> + * dma-ranges format:
>   *     DMA addr (dma_addr)     : naddr cells
>   *     CPU addr (phys_addr_t)  : pna cells
>   *     size                    : nsize cells
>   *
> - * It returns -ENODEV if "dma-ranges" property was not found
> - * for this device in DT.
> + * It returns -ENODEV if "dma-ranges" property was not found for this
> + * device in the DT.
>   */
> -int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
> +int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
>  {
>         struct device_node *node = of_node_get(np);
>         const __be32 *ranges = NULL;
> -       int len;
> -       int ret = 0;
>         bool found_dma_ranges = false;
>         struct of_range_parser parser;
>         struct of_range range;
> -       u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> +       struct bus_dma_region *r;
> +       int len, num_ranges = 0;
> +       int ret;
>
>         while (node) {
>                 ranges = of_get_property(node, "dma-ranges", &len);
> @@ -970,44 +970,35 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>         }
>
>         of_dma_range_parser_init(&parser, node);
> +       for_each_of_range(&parser, &range)
> +               num_ranges++;
> +
> +       of_dma_range_parser_init(&parser, node);
> +
> +       ret = -ENOMEM;
> +       r = kcalloc(num_ranges + 1, sizeof(*r), GFP_KERNEL);
> +       if (!r)
> +               goto out;

AFAICT, you have the error cases covered, but you are leaking memory
if the device is removed.

[...]

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 9f04c30c4aaf..49242dd6176e 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -519,7 +519,7 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
>         /* Initialise vdev subdevice */
>         snprintf(name, sizeof(name), "vdev%dbuffer", rvdev->index);
>         rvdev->dev.parent = &rproc->dev;
> -       rvdev->dev.dma_pfn_offset = rproc->dev.parent->dma_pfn_offset;
> +       rvdev->dev.dma_range_map = rproc->dev.parent->dma_range_map;

But doing this means you can't just free the dma_range_map. You need
to do a copy here or you'd have to refcount it. Or I suppose you could
check if it the child has a different dma_range_map ptr than the
parent.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
