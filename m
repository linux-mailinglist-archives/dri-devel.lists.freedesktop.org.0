Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E323A0CD
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9876C890E5;
	Mon,  3 Aug 2020 08:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BD16EBA2
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 17:17:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F17C0B5EA;
 Sat,  1 Aug 2020 17:17:50 +0000 (UTC)
Message-ID: <649c37347138ecf4d0bca9825fba989151757d02.camel@suse.de>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org, 
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, 
 bcm-kernel-feedback-list@broadcom.com
Date: Sat, 01 Aug 2020 19:17:22 +0200
In-Reply-To: <20200724203407.16972-9-james.quinlan@broadcom.com>
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
 Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
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
 "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim, here's some comments after testing your series against RPi4.

On Fri, 2020-07-24 at 16:33 -0400, Jim Quinlan wrote:
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
>   * @np:		device node to get DMA range info
> - * @dma_addr:	pointer to store initial DMA address of DMA range
> - * @paddr:	pointer to store initial CPU address of DMA range
> - * @size:	pointer to store size of DMA range
> + * @map:	dma range structure to return
>   *
>   * Look in bottom up direction for the first "dma-ranges" property
> - * and parse it.
> - *  dma-ranges format:
> + * and parse it.  Put the information into a DMA offset map array.
> + *
> + * dma-ranges format:
>   *	DMA addr (dma_addr)	: naddr cells
>   *	CPU addr (phys_addr_t)	: pna cells
>   *	size			: nsize cells
>   *
> - * It returns -ENODEV if "dma-ranges" property was not found
> - * for this device in DT.
> + * It returns -ENODEV if "dma-ranges" property was not found for this
> + * device in the DT.
>   */
> -int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
> +int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
>  {
>  	struct device_node *node = of_node_get(np);
>  	const __be32 *ranges = NULL;
> -	int len;
> -	int ret = 0;
>  	bool found_dma_ranges = false;
>  	struct of_range_parser parser;
>  	struct of_range range;
> -	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> +	struct bus_dma_region *r;
> +	int len, num_ranges = 0;
> +	int ret;
>  
>  	while (node) {
>  		ranges = of_get_property(node, "dma-ranges", &len);
> @@ -970,44 +970,35 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>  	}
>  
>  	of_dma_range_parser_init(&parser, node);
> +	for_each_of_range(&parser, &range)
> +		num_ranges++;
> +
> +	of_dma_range_parser_init(&parser, node);
> +
> +	ret = -ENOMEM;
> +	r = kcalloc(num_ranges + 1, sizeof(*r), GFP_KERNEL);
> +	if (!r)
> +		goto out;
>  
> +	/*
> +	 * Record all info in the generic DMA ranges array for struct device.
> +	 */
> +	*map = r;
>  	for_each_of_range(&parser, &range) {
>  		pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
>  			 range.bus_addr, range.cpu_addr, range.size);
> -
> -		if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset) {
> -			pr_warn("Can't handle multiple dma-ranges with different offsets on node(%pOF)\n", node);
> -			/* Don't error out as we'd break some existing DTs */
> -			continue;
> -		}
> -		dma_offset = range.cpu_addr - range.bus_addr;
> -
> -		/* Take lower and upper limits */
> -		if (range.bus_addr < dma_start)
> -			dma_start = range.bus_addr;
> -		if (range.bus_addr + range.size > dma_end)
> -			dma_end = range.bus_addr + range.size;
> -	}
> -
> -	if (dma_start >= dma_end) {
> -		ret = -EINVAL;
> -		pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
> -			 node);
> -		goto out;
> +		r->cpu_start = range.cpu_addr;
> +		r->dma_start = range.bus_addr;
> +		r->size = range.size;
> +		r->offset = (u64)range.cpu_addr - (u64)range.bus_addr;
> +		r++;
>  	}
>  
> -	*dma_addr = dma_start;
> -	*size = dma_end - dma_start;
> -	*paddr = dma_start + dma_offset;
> -
> -	pr_debug("final: dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> -		 *dma_addr, *paddr, *size);
> -

I think you're missing here:

	ret = 0;

>  out:
>  	of_node_put(node);
> -
>  	return ret;
>  }

Regards,
Nicolas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
