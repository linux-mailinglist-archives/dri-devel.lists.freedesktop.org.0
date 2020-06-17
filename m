Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7BC1FCDFD
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 15:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3F26E07D;
	Wed, 17 Jun 2020 13:00:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A002A6E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 13:00:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D483131B;
 Wed, 17 Jun 2020 06:00:28 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 931663F73C;
 Wed, 17 Jun 2020 06:00:20 -0700 (PDT)
Subject: Re: [PATCH v5 08/12] device core: Introduce multiple dma pfn offsets
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 bcm-kernel-feedback-list@broadcom.com
References: <20200616205533.3513-1-james.quinlan@broadcom.com>
 <20200616205533.3513-9-james.quinlan@broadcom.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b0feb616-63f3-8563-fbc1-663816d344ea@arm.com>
Date: Wed, 17 Jun 2020 14:00:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616205533.3513-9-james.quinlan@broadcom.com>
Content-Language: en-GB
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
 Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jim,

Thanks for taking this on!

On 2020-06-16 21:55, Jim Quinlan wrote:
> The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> the use of single or multiple pfn offsets between cpu addrs and dma addrs.
> It subsumes the role of dev->dma_pfn_offset -- a uniform offset.

This isn't just about offsets - it should (eventually) subsume 
bus_dma_limit as well, so I'd be inclined to call it something like 
"dma_ranges"/"dma_range_map"/"dma_regions"/etc.

> The function of_dma_get_range() has been modified to take two additional
> arguments: the "map", which is an array that holds the information
> regarding the pfn offset regions, and map_size, which is the size in bytes
> of the map array.
> 
> of_dma_configure() is the typical manner to set pfn offsets but there are a
> number of ad hoc assignments to dev->dma_pfn_offset in the kernel driver
> code.  These cases now invoke the function
> dma_attach_uniform_pfn_offset(dev, pfn_offset).

I'm also not convinced that sticking to the PFN paradigm is necessarily 
the right way to go - when there's only a single nicely-aligned offset 
to consider then an unsigned long that's immune to PAE/LPAE/etc. 
disruption is indeed the cheapest and easiest option from core code's 
PoV. However it already means that all the users have to do some degree 
of conversion back and forth between PFNs and usable addresses; once the 
core code itself also has to start bouncing back and forth between 
addresses and PFNs internally then we end up effectively just doing work 
to cancel out other work, and the whole lot would end up simpler and 
more efficient if the API worked purely in terms of addresses.

[...]
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 8eea3f6e29a4..767fa3b492c8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -918,12 +918,48 @@ void __iomem *of_io_request_and_map(struct device_node *np, int index,
>   }
>   EXPORT_SYMBOL(of_io_request_and_map);
>   
> +static int dma_attach_pfn_offset_map(struct device_node *node, int num_ranges,
> +				     struct bus_dma_region **map, size_t *map_size)
> +{
> +	struct of_range_parser parser;
> +	struct of_range range;
> +	struct bus_dma_region *r;
> +
> +	*map_size = (num_ranges + 1) * sizeof(**map);
> +	r = kcalloc(num_ranges + 1, sizeof(**map), GFP_KERNEL);
> +	if (!r)
> +		return -ENOMEM;
> +	*map = r;
> +
> +	of_dma_range_parser_init(&parser, node);
> +	/*
> +	 * Record all info for DMA ranges array.  We could
> +	 * just use the of_range struct, but if we did that it

Not making the entire DMA API depend on OF is a far better justification 
for having its own dedicated structure.

> +	 * would require more calculations for phys_to_dma and
> +	 * dma_to_phys conversions.
> +	 */

However that part is pretty much nonsense. Consider your "efficient" 
operation for looking up and consuming a DMA offset:

	API				caller
1. load cpu_start
2. compare addr >= cpu_start
3. load cpu_end
4. compare addr <= cpu_end
5. load pfn_offset
6.				shift pfn_offset << PAGE_SHIFT
7.				add "offset" + addr
8.				[use the result]

versus the "more calculations" approach (once the PFN cruft is peeled away):

	API				caller
1. load cpu_addr
2. compare addr >= cpu_addr
3. subtract addr - cpu_addr
4. load size
5. compare "addr_offset" < size
6. load dma_start
7. add dma_start + "addr_offset"
8.				[use the result]

Oh look, it's the exact same number of memory accesses and ALU 
operations, but with a smaller code footprint (assuming, reasonably, 
more than one caller) and less storage overhead ;)

Basically, having this degree of redundancy is somewhere between silly 
and actively harmful (what if pfn_offset gets out of sync with 
cpu_start/dma_start? What if cpu_end/dma_end don't represent equivalent 
lengths?)

> +	for_each_of_range(&parser, &range) {
> +		r->cpu_start = range.cpu_addr;
> +		r->cpu_end = r->cpu_start + range.size - 1;
> +		r->dma_start = range.bus_addr;
> +		r->dma_end = r->dma_start + range.size - 1;
> +		r->pfn_offset = PFN_DOWN(range.cpu_addr) - PFN_DOWN(range.bus_addr);
> +		r++;
> +	}
> +	return 0;
> +}
> +
>   /**
>    * of_dma_get_range - Get DMA range info
>    * @np:		device node to get DMA range info
>    * @dma_addr:	pointer to store initial DMA address of DMA range
>    * @paddr:	pointer to store initial CPU address of DMA range
>    * @size:	pointer to store size of DMA range
> + * @map:	pointer to a pointer of an array of structs.  This is updated
> + *		to point to NULL (no offsets needed) or kmalloc'd array of
> + *		structs.  In the latter case, it is the caller's obligation to
> + *		kfree the array in the case it is no longer in use.
> + * @map_size:	updated to be the size in bytes of memory allocated to the map
>    *
>    * Look in bottom up direction for the first "dma-ranges" property
>    * and parse it.
> @@ -932,10 +968,11 @@ EXPORT_SYMBOL(of_io_request_and_map);
>    *	CPU addr (phys_addr_t)	: pna cells
>    *	size			: nsize cells
>    *
> - * It returns -ENODEV if "dma-ranges" property was not found
> - * for this device in DT.
> + * It returns -ENODEV if "dma-ranges" property was not found for this
> + * device in the DT.
>    */
> -int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
> +int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr,
> +		     u64 *size, struct bus_dma_region **map, size_t *map_size)

dma_addr, paddr and size don't really make much sense any more when we 
could be handling multiple ranges - it would seem logical to simplify 
the interface entirely:

struct bus_dma_region *of_dma_get_range(struct device_node *np);

which returns either a valid map, NULL if dma-ranges is absent, or an 
ERR_PTR.

>   {
>   	struct device_node *node = of_node_get(np);
>   	const __be32 *ranges = NULL;
> @@ -944,7 +981,10 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
>   	bool found_dma_ranges = false;
>   	struct of_range_parser parser;
>   	struct of_range range;
> -	u64 dma_start = U64_MAX, dma_end = 0, dma_offset = 0;
> +	phys_addr_t cpu_start = ~(phys_addr_t)0;
> +	u64 dma_start = U64_MAX, dma_end = 0;
> +	bool offset_map_needed = false;
> +	int num_ranges = 0;
>   
>   	while (node) {
>   		ranges = of_get_property(node, "dma-ranges", &len);
[...]
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 15460a5ac024..a17da8e271a2 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -492,7 +492,7 @@ struct dev_links_info {
>    * 		such descriptors.
>    * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
>    *		DMA limit than the device itself supports.
> - * @dma_pfn_offset: offset of DMA memory range relatively of RAM
> + * @dma_pfn_offset_map: offset map for DMA memory range relatively of RAM
>    * @dma_parms:	A low level driver may set these to teach IOMMU code about
>    * 		segment limitations.
>    * @dma_pools:	Dma pools (if dma'ble device).
> @@ -577,7 +577,7 @@ struct device {
>   					     64 bit addresses for consistent
>   					     allocations such descriptors. */
>   	u64		bus_dma_limit;	/* upstream dma constraint */
> -	unsigned long	dma_pfn_offset;
> +	struct bus_dma_region *dma_pfn_offset_map;

I think it's a very good idea for this to be const.

>   	struct device_dma_parameters *dma_parms;
>   
[...]
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 98e3d873792e..20149a29d136 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -11,6 +11,7 @@
>   #include <linux/dma-noncoherent.h>
>   #include <linux/export.h>
>   #include <linux/gfp.h>
> +#include <linux/limits.h>
>   #include <linux/of_device.h>
>   #include <linux/slab.h>
>   #include <linux/vmalloc.h>
> @@ -407,3 +408,41 @@ unsigned long dma_get_merge_boundary(struct device *dev)
>   	return ops->get_merge_boundary(dev);
>   }
>   EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
> +
> +/**
> + * dma_attach_uniform_pfn_offset - Assign scalar offset for all addresses.
> + * @dev:	device pointer; needed to "own" the alloced memory.
> + * @pfn_offset:	offset to apply when converting from phys addr
> + *		to dma addr and vice versa.
> + *
> + * This is for the simple case of a uniform offset which requires
> + * no bounds calculations for its use.

That's crap - just because we've been (mostly) getting away without them 
doesn't mean bounds checks aren't relevant to a uniform offset. Take a 
look at this saga for an example of phys_to_dma() on something *below* 
the offset being a very nasty problem indeed:

https://lore.kernel.org/linux-arm-kernel/9bbd87c2-5b6c-069c-dd22-5105dc827428@ti.com/

>  It is the equivalent the role
> + * of the former dev->dma_pfn_offset; ie it is just blindly added
> + * or subtracted in all cases.
> + *
> + * It returns -ENOMEM if out of memory, -ENODEV if dev == NULL, otherwise 0.
> + */
> +int dma_attach_uniform_pfn_offset(struct device *dev, unsigned long pfn_offset)
> +{
> +	struct bus_dma_region *map;
> +
> +	if (!dev)
> +		return -ENODEV;
> +
> +	if (!pfn_offset)
> +		return 0;
> +
> +	map = devm_kcalloc(dev, 2, sizeof(*map), GFP_KERNEL);

Nope, if you want to call this from bus notifiers then it can't use 
devres - see the list_empty(&dev->devres_head) check in really_probe(). 
However, I think those platform-level cases are probably better off 
statically allocating a single map for all devices to share (I had an 
idea about doing similar in the DT code, but that could be a future 
optimisation); this function is really only needed for nasty 
driver-level hacks like the sunxi ones.

And for those driver-level hacks, I think it would also be worth being a 
bit cleverer here, i.e. not blindly replacing any existing ranges (but 
returning success if the desired offset is already in place).

> +	if (!map)
> +		return -ENOMEM;
> +
> +	map->pfn_offset = pfn_offset;
> +	map->cpu_start = 0;
> +	map->cpu_end = PHYS_ADDR_MAX;
> +	map->dma_start = 0;
> +	map->dma_end = ~(dma_addr_t)0;

As above, allowing these to be out-of-sync with the fundamental 
constraints of dma_pfn_offset seems really bad - there is no valid DMA 
address corresponding to cpu_start and no representable physical address 
corresponding to dma_end, and no good can come of that. But of course 
getting rid of the redundancy entirely is even better.

Robin.

> +	dev->dma_pfn_offset_map = map;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dma_attach_uniform_pfn_offset);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
