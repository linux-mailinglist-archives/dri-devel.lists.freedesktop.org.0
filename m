Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB83C1747
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 18:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F176E8EF;
	Thu,  8 Jul 2021 16:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AC36E8EF;
 Thu,  8 Jul 2021 16:44:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88F256145A;
 Thu,  8 Jul 2021 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625762671;
 bh=W3zJ1dUIVfwK2RD5Gb/pjjaY8IvTpKuqVuwPdbuz25M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sp+30VCoqVzKdRCHxsdjheJ32Al4GyKkdqY67UI3HBglP9/4ElBHuP/C2H/FyWKo7
 e/R4/9B3d7vhaPNlh1DPVXpIf7uT6p/REBIACdKpJwJF9GZS42ymRBAxS0kVUi63dX
 LFzIygW0HZtu2Ulg0IazOQ0jJMqOOsCWNLsNFVLNWlAdaw+e6puTS7FlMwyfD5gEdI
 lFB3Rrin6g2B0nXBBJNO+PUuvd4DpkVlBGoDw/jR5Tje1HakbrKaEjYhMjAxMq0G0/
 9JUb/J7ll5Lxx3f7sEDifcv8wjoDYV7KpD0n+YA4MYDlWDIvbopDufBoyo/NtyqWxC
 FAtOTP/W4ikEQ==
Date: Thu, 8 Jul 2021 17:44:19 +0100
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210708164418.GB23598@willie-the-truck>
References: <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
 <20210706170657.GD20750@willie-the-truck>
 <e1c026c6-22c7-8979-4941-de9cfab3863a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c026c6-22c7-8979-4941-de9cfab3863a@kernel.org>
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
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
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

On Tue, Jul 06, 2021 at 12:14:16PM -0700, Nathan Chancellor wrote:
> On 7/6/2021 10:06 AM, Will Deacon wrote:
> > On Tue, Jul 06, 2021 at 04:39:11PM +0100, Robin Murphy wrote:
> > > On 2021-07-06 15:05, Christoph Hellwig wrote:
> > > > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > > > FWIW I was pondering the question of whether to do something along those
> > > > > lines or just scrap the default assignment entirely, so since I hadn't got
> > > > > round to saying that I've gone ahead and hacked up the alternative
> > > > > (similarly untested) for comparison :)
> > > > > 
> > > > > TBH I'm still not sure which one I prefer...
> > > > 
> > > > Claire did implement something like your suggestion originally, but
> > > > I don't really like it as it doesn't scale for adding multiple global
> > > > pools, e.g. for the 64-bit addressable one for the various encrypted
> > > > secure guest schemes.
> > > 
> > > Ah yes, that had slipped my mind, and it's a fair point indeed. Since we're
> > > not concerned with a minimal fix for backports anyway I'm more than happy to
> > > focus on Will's approach. Another thing is that that looks to take us a
> > > quiet step closer to the possibility of dynamically resizing a SWIOTLB pool,
> > > which is something that some of the hypervisor protection schemes looking to
> > > build on top of this series may want to explore at some point.
> > 
> > Ok, I'll split that nasty diff I posted up into a reviewable series and we
> > can take it from there.
> 
> For what it's worth, I attempted to boot Will's diff on top of Konrad's
> devel/for-linus-5.14 and it did not work; in fact, I got no output on my
> monitor period, even with earlyprintk=, and I do not think this machine has
> a serial console.

Looking back at the diff, I completely messed up swiotlb_exit() by mixing up
physical and virtual addresses.

> Robin's fix does work, it survived ten reboots with no issues getting to X
> and I do not see the KASAN and slub debug messages anymore but I understand
> that this is not the preferred solution it seems (although Konrad did want
> to know if it works).
> 
> I am happy to test any further patches or follow ups as needed, just keep me
> on CC.

Cheers. Since this isn't 5.14 material any more, I'll CC you on a series
next week.

Will
