Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7F2495AC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B3D6E209;
	Wed, 19 Aug 2020 06:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2189AC6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 08:15:08 +0000 (UTC)
IronPort-SDR: KuLQpZNG9xAO8RA8q7hk3hk2DT3BwQm/ueMb8aiiTxNeXoFjLlQBI3yXRpHHXyjjt17API8E2M
 lq5KMrp/0lrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239686710"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="239686710"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 01:14:51 -0700
IronPort-SDR: dB+c55XC1WBWGCLhQBHPI/euik22wV/4UDZn1cU4j8QmPIipA3o1tbORCrLMTQGmlVLc3gCOT3
 0Cr/14sf3SbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="326661740"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 18 Aug 2020 01:14:39 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1k7wjJ-009bPd-AQ; Tue, 18 Aug 2020 11:12:25 +0300
Date: Tue, 18 Aug 2020 11:12:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH RESEND v10 07/11] device-mapping: Introduce DMA range
 map, supplanting dma_pfn_offset
Message-ID: <20200818081225.GA1891694@smile.fi.intel.com>
References: <20200817215326.30912-1-james.quinlan@broadcom.com>
 <20200817215326.30912-8-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817215326.30912-8-james.quinlan@broadcom.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
 linux-pci@vger.kernel.org, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
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
 bcm-kernel-feedback-list@broadcom.com, Alan Stern <stern@rowland.harvard.edu>,
 Len Brown <lenb@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 17, 2020 at 05:53:09PM -0400, Jim Quinlan wrote:
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

...

> +	if (dev) {
> +		phys_addr_t paddr = PFN_PHYS(pfn);
> +

> +		pfn -= (dma_offset_from_phys_addr(dev, paddr) >> PAGE_SHIFT);

PFN_DOWN() ?

> +	}

...

> +		pfn += (dma_offset_from_dma_addr(dev, addr) >> PAGE_SHIFT);

Ditto.


...

> +static inline u64 dma_offset_from_dma_addr(struct device *dev, dma_addr_t dma_addr)
> +{
> +	const struct bus_dma_region *m = dev->dma_range_map;
> +
> +	if (!m)
> +		return 0;
> +	for (; m->size; m++)
> +		if (dma_addr >= m->dma_start && dma_addr - m->dma_start < m->size)
> +			return m->offset;
> +	return 0;
> +}
> +
> +static inline u64 dma_offset_from_phys_addr(struct device *dev, phys_addr_t paddr)
> +{
> +	const struct bus_dma_region *m = dev->dma_range_map;
> +
> +	if (!m)
> +		return 0;
> +	for (; m->size; m++)
> +		if (paddr >= m->cpu_start && paddr - m->cpu_start < m->size)
> +			return m->offset;
> +	return 0;
> +}

Perhaps for these the form with one return 0 is easier to read

	if (m) {
		for (; m->size; m++)
			if (paddr >= m->cpu_start && paddr - m->cpu_start < m->size)
				return m->offset;
	}
	return 0;

?

...

> +	if (mem->use_dev_dma_pfn_offset) {
> +		u64 base_addr = (u64)mem->pfn_base << PAGE_SHIFT;

PFN_PHYS() ?

> +
> +		return base_addr - dma_offset_from_phys_addr(dev, base_addr);
> +	}

...

> + * It returns -ENOMEM if out of memory, 0 otherwise.

This doesn't describe cases dev->dma_range_map != NULL and offset == 0.

> +int dma_set_offset_range(struct device *dev, phys_addr_t cpu_start,
> +			 dma_addr_t dma_start, u64 size)
> +{
> +	struct bus_dma_region *map;
> +	u64 offset = (u64)cpu_start - (u64)dma_start;
> +
> +	if (!offset)
> +		return 0;
> +
> +	if (dev->dma_range_map) {
> +		dev_err(dev, "attempt to add DMA range to existing map\n");
> +		return -EINVAL;
> +	}
> +
> +	map = kcalloc(2, sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;
> +	map[0].cpu_start = cpu_start;
> +	map[0].dma_start = dma_start;
> +	map[0].offset = offset;
> +	map[0].size = size;
> +	dev->dma_range_map = map;
> +
> +	return 0;
> +}

...

> +void *dma_copy_dma_range_map(const struct bus_dma_region *map)
> +{
> +	int num_ranges;
> +	struct bus_dma_region *new_map;
> +	const struct bus_dma_region *r = map;
> +
> +	for (num_ranges = 0; r->size; num_ranges++)
> +		r++;

> +	new_map = kcalloc(num_ranges + 1, sizeof(*map), GFP_KERNEL);
> +	if (new_map)
> +		memcpy(new_map, map, sizeof(*map) * num_ranges);

Looks like krealloc() on the first glance...

> +
> +	return new_map;
> +}

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
