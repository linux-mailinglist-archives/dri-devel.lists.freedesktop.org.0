Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA63BDBBA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 18:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B08706E526;
	Tue,  6 Jul 2021 16:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCDE6E526;
 Tue,  6 Jul 2021 16:57:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 027E761A0F;
 Tue,  6 Jul 2021 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625590652;
 bh=5up8/Bb0rLsCNavkU95AUJkD0QYWqQ8IKvDM0S2EuWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdlCeYWdA0LGQqw4NCthGEImHDcykOTXLbRY0p2OzfXTSjVjgAkalkpSZRdXk7myS
 ggdoMpep1HYdBLP4alpxbeLY2vbW4R6HTU/Vi4e5HLBlWUzcqfaGM7iFoc0a6mvwIQ
 OtryjDMBpvdg7dJuiMXwOl88SmpKdFQmz0rw3SopyQp4YNJrpHbSZzb5034J5yMjTF
 8iEUr6dVhZVSqKBvB0pDdDElb2vQPGkIFBQxZHqD6FxdW2DFwsOiJcnDaYmQKnMJGl
 2f5cYXW5YDte/kZj3tp146452h4FgBzYXIDAdb4rsa2LksEi8bwpu2LbdNX+D444o2
 b9VQWPtZ1e95g==
Date: Tue, 6 Jul 2021 17:57:21 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210706165720.GC20750@willie-the-truck>
References: <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <YORsr0h7u5l9DZwh@char.us.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YORsr0h7u5l9DZwh@char.us.oracle.com>
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, xypron.glpk@gmx.de,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, intel-gfx@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 10:46:07AM -0400, Konrad Rzeszutek Wilk wrote:
> On Tue, Jul 06, 2021 at 04:05:13PM +0200, Christoph Hellwig wrote:
> > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > FWIW I was pondering the question of whether to do something along those 
> > > lines or just scrap the default assignment entirely, so since I hadn't got 
> > > round to saying that I've gone ahead and hacked up the alternative 
> > > (similarly untested) for comparison :)
> > >
> > > TBH I'm still not sure which one I prefer...
> > 
> > Claire did implement something like your suggestion originally, but
> > I don't really like it as it doesn't scale for adding multiple global
> > pools, e.g. for the 64-bit addressable one for the various encrypted
> > secure guest schemes.
> 
> Couple of things:
>  - I am not pushing to Linus the Claire's patchset until we have a
>    resolution on this. I hope you all agree that is a sensible way
>    forward as much as I hate doing that.

Sure, it's a pity but we could clearly use a bit more time to get these
just right and we've run out of time for 5.14.

I think the main question I have is how would you like to see patches for
5.15? i.e. as patches on top of devel/for-linus-5.14 or something else?

Cheers,

Will
