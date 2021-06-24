Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A593B2DA9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC856EABB;
	Thu, 24 Jun 2021 11:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528E96EAB9;
 Thu, 24 Jun 2021 11:19:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D5C7613C1;
 Thu, 24 Jun 2021 11:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624533547;
 bh=fyQk9K7V5mi+iulKCuVouHY96p/8l9exJzzlUIeSpn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bw4AVsGwRrbnlqsX5CZZBCGVkLRWbVSBBROzH0cW0WxgQnoyiN2SkbZT9Y0qsOq8u
 JL8IIrlYNHTHfBROv+myGIoSXn3V0Qajeyu6WrQ15CejRET9x4mwWpuBCwWkKgfe+I
 +cOMFFna8tPSjLTq48KMyVkK5wGgtDdocNICZALKyCcFBQrrDac4GVZrs41lrwovdH
 A7+mTUl4b8SpYL5RZSXQGAdCk4J4xBM23HuRVgN0YiE8QMME9/0wtATNSKneCXnM3U
 aM6IUBXxfGBIajg731amXfhwP7wHdtJMySWai/ROQfVX1amjwBJVAnH3akjkMUY271
 lYvk5WkbaBLcQ==
Date: Thu, 24 Jun 2021 12:18:56 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210624111855.GA1382@willie-the-truck>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, mingo@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 xypron.glpk@gmx.de, Tom Lendacky <thomas.lendacky@amd.com>,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 12:14:39PM +0100, Robin Murphy wrote:
> On 2021-06-24 07:05, Claire Chang wrote:
> > On Thu, Jun 24, 2021 at 1:43 PM Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
> > > > is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
> > > > 
> > > > is_swiotlb_force_bounce() was the new function introduced in this patch here.
> > > > 
> > > > +static inline bool is_swiotlb_force_bounce(struct device *dev)
> > > > +{
> > > > +     return dev->dma_io_tlb_mem->force_bounce;
> > > > +}
> > > 
> > > To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
> > > turn this into :
> > > 
> > >          return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;
> > > 
> > > for a quick debug check?
> > 
> > I just realized that dma_io_tlb_mem might be NULL like Christoph
> > pointed out since swiotlb might not get initialized.
> > However,  `Unable to handle kernel paging request at virtual address
> > dfff80000000000e` looks more like the address is garbage rather than
> > NULL?
> > I wonder if that's because dev->dma_io_tlb_mem is not assigned
> > properly (which means device_initialize is not called?).
> 
> What also looks odd is that the base "address" 0xdfff800000000000 is held in
> a couple of registers, but the offset 0xe looks too small to match up to any
> relevant structure member in that dereference chain :/

FWIW, I've managed to trigger a NULL dereference locally when swiotlb hasn't
been initialised but we dereference 'dev->dma_io_tlb_mem', so I think
Christoph's suggestion is needed regardless. But I agree that it won't help
with the issue reported by Qian Cai.

Qian Cai: please can you share your .config and your command line?

Thanks,

Will
