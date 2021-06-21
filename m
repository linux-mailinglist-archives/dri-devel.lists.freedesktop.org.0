Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD5B3AF372
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 19:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC2A6E328;
	Mon, 21 Jun 2021 17:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DAB6E328;
 Mon, 21 Jun 2021 17:59:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94438611CE;
 Mon, 21 Jun 2021 17:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624298362;
 bh=y8attfyCFvmhE/rEq1lKuxtMSlY+L9uu0zEo4FMjkv8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nVdx/hwygYr/MG4oSfAecQoTkcAWFsVr6dFhXJUhFXwqSbH08hcJcQHHaJ6yNTgwJ
 WFFrnk+RLaMbXPz1Xtr0MorwwBCBRCnNVEqXP2tUXHhGV2Usf3U4gjEu3zxeInr5od
 B9ktxTxXUHFXTSVy1nFGEpPSBK9O5Aws7oD7ucKaVc2hx8hm7IAXVZOQ8U1l9ZRj62
 sEXsTrg9MCBDzVl47wBX5+3xzZhCsWmVRvgAWZv47Xmzv8udI19xFqd0CjGvBvgqzh
 BtSw3vV40r9z2Jdokw3+RVbueWCN8P3KLA5YE9ZkG0ZSqiTJvVk9SGjw4FEHT8nF7N
 esGUOKjtCMepQ==
Date: Mon, 21 Jun 2021 10:59:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v13 01/12] swiotlb: Refactor swiotlb init functions
In-Reply-To: <20210618143212.GA19284@lst.de>
Message-ID: <alpine.DEB.2.21.2106211052270.24906@sstabellini-ThinkPad-T480s>
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <20210617062635.1660944-2-tientzu@chromium.org>
 <alpine.DEB.2.21.2106171434480.24906@sstabellini-ThinkPad-T480s>
 <CALiNf29SJ0jXirWVDhJw4BUNvkjUeGPyGNJK9m8c30OPX41=5Q@mail.gmail.com>
 <741a34cc-547c-984d-8af4-2f309880acfa@amd.com> <20210618143212.GA19284@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: thomas.hellstrom@linux.intel.com, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, Tom Lendacky <thomas.lendacky@amd.com>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Jun 2021, Christoph Hellwig wrote:
> On Fri, Jun 18, 2021 at 09:09:17AM -0500, Tom Lendacky wrote:
> > > swiotlb_init_with_tbl uses memblock_alloc to allocate the io_tlb_mem
> > > and memblock_alloc[1] will do memset in memblock_alloc_try_nid[2], so
> > > swiotlb_init_with_tbl is also good.
> > > I'm happy to add the memset in swiotlb_init_io_tlb_mem if you think
> > > it's clearer and safer.
> > 
> > On x86, if the memset is done before set_memory_decrypted() and memory
> > encryption is active, then the memory will look like ciphertext afterwards
> > and not be zeroes. If zeroed memory is required, then a memset must be
> > done after the set_memory_decrypted() calls.
> 
> Which should be fine - we don't care that the memory is cleared to 0,
> just that it doesn't leak other data.  Maybe a comment would be useful,
> though,

Just as a clarification: I was referring to the zeroing of "mem" in
swiotlb_late_init_with_tbl and swiotlb_init_with_tbl. While it looks
like Tom and Christoph are talking about the zeroing of "tlb".

The zeroing of "mem" is required as some fields of struct io_tlb_mem
need to be initialized to zero. While the zeroing of "tlb" is not
required except from the point of view of not leaking sensitive data as
Christoph mentioned.

Either way, Claire's v14 patch 01/12 looks fine to me.
