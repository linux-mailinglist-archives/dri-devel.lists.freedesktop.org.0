Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B1216769
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BC86E5C6;
	Tue,  7 Jul 2020 07:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33436E3B7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 13:40:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f139so42177367wmf.5
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eYvPzaHZaaIgS61ZLjNpzen4uwKKezR2/OOrkoRIMZ0=;
 b=N7LoSn2vo9f3rQ4C2sGL7jY5i3u8il6SSYurszDcNXG4RDiQXye4oDe1w49wUKWGYU
 6YR9e3/7mWBT1uSXTqg4XPCPLbecgJ9K1U+X0Y65YB3vsKNWZaer91W4nyZCnw9XANrU
 W4Go14plLioc6jwPxUMtBUxX76ky2Nqwf5ejw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eYvPzaHZaaIgS61ZLjNpzen4uwKKezR2/OOrkoRIMZ0=;
 b=h/wL36R7aRtlEiEAksW6+TteNbCr9zigQzZxp37XhR+EepxqbWMMf5UMAJ/YTjTe9X
 btNML2kTanqYiOpyzoNi71vVuMlA/xUHphZ8xL+ck8DJDSkJzpi7SALAaOmvR1eiZs5T
 l4lb77O7rCgRCpWqDTjM2E9A0tiAW7BVw9rK9hAN0K+LBzx1qGmUVd5AOOwqtwDYcDCF
 OvyoALK8W/Zgrz8NhmWD869PfhfK3ifCgXDgJle7eQEPtffvALTBazXZNXzIPJBsk5Z6
 Si8FHTMe4yn/whsuDS8xLqvEpKzvbRDANYz/Vvc1brAf9qzidNc3AwhYFahe4+UR9yik
 kcfQ==
X-Gm-Message-State: AOAM531RqqxACCxpplbP1b9sHlJbJe0cqGAtHMAkhnsJNgKkRsHvGH02
 KXNZPAsluZxap/NACVx+atwakMzQtNcRwvF3jA9X0w==
X-Google-Smtp-Source: ABdhPJzJbQzeNPTuNOMHMff7aCJzGErvjO7pRBT5QzydRbyBwpY7TNg0ejysnilGn10ahFrXSo1oMtnUeWRwgRrZDag=
X-Received: by 2002:a7b:c185:: with SMTP id y5mr51495722wmi.85.1594042852077; 
 Mon, 06 Jul 2020 06:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200701212155.37830-1-james.quinlan@broadcom.com>
 <20200701212155.37830-9-james.quinlan@broadcom.com>
 <20200702084251.GF3703480@smile.fi.intel.com>
In-Reply-To: <20200702084251.GF3703480@smile.fi.intel.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Mon, 6 Jul 2020 09:40:40 -0400
Message-ID: <CA+-6iNwu-jHTb7VFpmkYoyipWK9rtTEOq2dW7K=nYXpUrOTwCQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 07 Jul 2020 07:26:57 +0000
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
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
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
 Suzuki K Poulose <suzuki.poulose@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Sorry for the delay in response.  I will do what you suggest in your
email.  I do have one response to one of your comments below.

On Thu, Jul 2, 2020 at 4:43 AM Andy Shevchenko
<andriy.shevchenko@linux.intePHYSl.com> wrote:
>
> On Wed, Jul 01, 2020 at 05:21:38PM -0400, Jim Quinlan wrote:
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
>
> ...
>
> > +     if (dev && dev->dma_range_map)
> > +             pfn -= (unsigned long)PFN_DOWN(dma_offset_from_phys_addr(dev, PFN_PHYS(pfn)));
>
> Instead of casting use PHYS_PFN() and it will be consistent with latter in the same line.
>
> > +     if (dev && dev->dma_range_map)
> > +             pfn += (unsigned long)PFN_DOWN(dma_offset_from_dma_addr(dev, addr));
>
> Ditto.
>
> ...
>
> > +             dev_err(dev, "set dma_offset%08llx%s\n", KEYSTONE_HIGH_PHYS_START
> > +                     - KEYSTONE_LOW_PHYS_START, ret ? " failed" : "");
>
> Please, avoid such indentation.
> Better split it to the three lines, argument per line (expect dev which will go
> on the first one).
>
> This applies to all similar places.
>
> ...
>
> >       unsigned long pfn = (dma_handle >> PAGE_SHIFT);
>
> PHYS_PFN() / PFN_DOWN() ?
>
> > +     if (!WARN_ON(!dev) && dev->dma_range_map)
> > +             pfn += (unsigned long)PFN_DOWN(dma_offset_from_dma_addr(dev, dma_handle));
>
> PHYS_PFN() ?
>
> ...
>
> > +     r = kcalloc(num_ranges + 1, sizeof(struct bus_dma_region), GFP_KERNEL);
>
> sizeof(*r) ?
>
> > +     if (!r)
> > +             return ERR_PTR(-ENOMEM);
>
> ...
>
> > +     ret = IS_ERR(map) ? PTR_ERR(map) : 0;
>
> PTR_ERR_OR_ZERO()
>
> ...
>
> > +             /* We want the offset map to be device-managed, so alloc & copy */
> > +             dev->dma_range_map = devm_kcalloc(dev, num_ranges + 1, sizeof(*r),
> > +                                               GFP_KERNEL);
>
> The question is how many times per device lifetime this can be called?
Someone else questioned this.  There are two cases that come to mind:
our overnight test which load/unloads the RC driver over and over, and
a customer that does an unbind/bind  of the RC driver when their EP is
hung and wants to restart.  Both cases are atypical and are weak
arguments to justify the second copy.  I will drop the copy.

Thanks,
Jim Quinlan
Broadcom STB
>
> ...
>
>
> > +             if (!dev->dma_range_map)
> > +                     return -ENOMEM;
> > +             memcpy((void *)dev->dma_range_map, map, sizeof(*r) * num_ranges + 1);
>
> If it's continuous, perhaps kmemdup() ?
>
> ...
>
> > +     rc = IS_ERR(map) ? PTR_ERR(map) : 0;
>
> PTR_ERR_OR_ZERO()
>
> ...
>
> > +                     = dma_offset_from_phys_addr(dev, PFN_PHYS(mem->pfn_base));
> > +
> > +             return (dma_addr_t)PFN_PHYS(mem->pfn_base) - dma_offset;
>
> Looking at this more, I think you need to introduce in the same header (pfn.h)
> something like:
>
>         #define PFN_DMA_ADDR()
>         #define DMA_ADDR_PFN()
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
