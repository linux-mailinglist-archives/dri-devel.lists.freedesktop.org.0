Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7582312A3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93BA6E3B8;
	Tue, 28 Jul 2020 19:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5847E6E191
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 18:36:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so19245144wrh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 11:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ag+56VHWa4UupCVslbddFog8v3QbAb1GzSUnW5D8pYk=;
 b=PvUUgnajTgVqHh7tBRuZtFIB7BDtmLfblYvw2jEF15/d3+GlAPeqDzU78CSy/v0pSc
 lRFq6ogjsZSCDNnqZvDLYvmrGBsDuGWMguwsPfef44qQP0JhMGjYegJNcQNw7zqiNRbQ
 oPe6Iyj4j4DGdTKv7Om6t5OoeejJ16+aTcAjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ag+56VHWa4UupCVslbddFog8v3QbAb1GzSUnW5D8pYk=;
 b=hr58TIdp+gjde4LCzPXJUSDQpMzGEm/71suBoPWss3eQ8v7zEgYvdYqk3BhXrA3nUv
 I44w6F9s+RqhUkf8keVk2zqgvV1zILMlBHn/s0CxGgqUmkhNqsnaKZv+8zl35eGW0HkP
 sU2+oHfYW/IoPENHIeId5sky8wMFGl+bMMMqp5U//zuj5cxrwje4Snb6P1XQrd4uLFtK
 K9ejsvEn5hCVQu5nDfmZRVyMbpa00Ft90xfUUdLcwv2wKfTwfCPJNRtBFVEfz+A8D2Ct
 zB2VKlEMhXMKaMoScDtTKfUROkXVxrdt3dTQPVM37+3PSf+IfeVCU3Yv1BpsST6Jrh0O
 rC5Q==
X-Gm-Message-State: AOAM530/yulXMxFBZo0f9bj/PN+n86w27JkyvQ2TXze17jDk9j86OtrX
 3Eb8g7+6YbrjZy3O4Cpl+orb+cmfO+P2JqQsw+Ec8A==
X-Google-Smtp-Source: ABdhPJyyeHCQpGWv2ZVhb8OOYQVNDOYREJTG68F/E7l3B030xqT3Xde6PnTY6nzIbRmhmBAEDqIr9CfuhXn3sEs6Cd4=
X-Received: by 2002:adf:ebc5:: with SMTP id v5mr22136755wrn.100.1595961374761; 
 Tue, 28 Jul 2020 11:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <20200728123343.GA3939@lst.de>
In-Reply-To: <20200728123343.GA3939@lst.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Tue, 28 Jul 2020 14:36:02 -0400
Message-ID: <CA+-6iNwRC3UZ5nMrWeBEKYDV=Jbj5Nvf9sWgY1CPXZyy9ofS4g@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
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
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
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
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

On Tue, Jul 28, 2020 at 8:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> A few tiny nitpicks:
>
> The subject should have the dma-mapping prefix, this doesn't
> really touch the device core.
>
> > -     rc = of_dma_get_range(np, &dma_addr, &paddr, &size);
> > +     rc = of_dma_get_range(np, &map);
> > +     rc = PTR_ERR_OR_ZERO(map);
>
> I don't think you need the PTR_ERR_OR_ZERO line here, of_dma_get_range
> returns the error.

Yes, that link needs to be deleted.

>
> > +int dma_set_offset_range(struct device *dev, phys_addr_t cpu_start,
> > +                      dma_addr_t dma_start, u64 size)hh
> > +{
> > +     struct bus_dma_region *map;
> > +     u64 offset = (u64)cpu_start - (u64)dma_start;
> > +
> > +     if (!dev)
> > +             return -ENODEV;
>
> I don't think we need the NULL protection here, all DMA API calls
> expect a device.
Yes, your review-patch removed it but left the comment about the
function returning -ENODEV.  So I wasn't sure to leave it in or not.
>
> > +     if (!offset)
> > +             return 0;
> > +
> > +     /*
> > +      * See if a map already exists and we already encompass the new range:
> > +      */
> > +     if (dev->dma_range_map) {
> > +             if (dma_range_overlaps(dev, cpu_start, dma_start, size, offset))
> > +                     return 0;
> > +             dev_err(dev, "attempt to add conflicting DMA range to existing map\n");
> > +             return -EINVAL;
> > +     }
>
> And here why do we need the overlap check at all?  I'd be tempted to
> always return an error for this case.
I believe the overlap check was your suggestion or at least in your
review-patch?  I'm fine with just returning an error.

>
> What is the plan to merge this?  Do you want all this to go into one
> tree, or get as many bits into the applicable trees for 5.9 and then
> finish up for 5.10?  If the former I can apply it to the dma-mapping
> tree and just fix up the nitpicks.
Whatever you think is best -- I would be quite happy if you could
accept at least the "dma_range_map" commit.   Of course I'd be most
happy if the entire patchset were accepted, but perhaps you can just
apply the  "dma_range_map" commit, and I will continue to bang away at
getting the N-1 PCIe-related commits ack'd and accepted.

Thanks much!
Jim Quinlan
Broadcom STB
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
