Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9771F3502
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE16E9F6;
	Tue,  9 Jun 2020 07:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1626E94D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 15:49:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k26so17033039wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 08:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Zatdh65W3aH6MhJdNTH/AWqzt1N9QOAuNbG/kKQoQk=;
 b=XPgpdZtMZfiMPg5da4wdaof5iSzhA/ZVCghQbqTrDuqbo6ZHBkJ+6hzW6Rtuswt2th
 CucS7L68rAc9A2OMX3t2hThgLQkSf86045BbVp0BSipvykLwZzc3TREpeZqGeurMVBb8
 4aYqZctCI+0ceRS4poPN+NvTaALqxbr51DJqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Zatdh65W3aH6MhJdNTH/AWqzt1N9QOAuNbG/kKQoQk=;
 b=KFPfy40ahJJfr8Yat4/in2Hduyr+GI9YZbVQsCqVI6sCgkLi9S7y/twiJc5humkRoj
 x0M4xBIemCDPibDcXH+Gli6q+0/Is9ptFV362YJa0OXIfU2AGtClLVIpWu4QndseAy+h
 FfBjASmC35QNvUaPS3Ea3OolNg5Bamo/K33MIsiSzDrwS3bPCHqNkpdEzELn5VAnCrkW
 6QrvPzTDnixOxj3UE612ZLg3SF2O5UrjINSZyQHEH+ukDpsGqP+IyYNsLk5y+4VahX4r
 uCGxAXt9OcFdp2zpUalQH1r0FQpxN1gISb5zzhkKpbSAkl4aXdlQuE1Yoi85BKHsS/78
 Vf7g==
X-Gm-Message-State: AOAM531SVMoONmJV1DpoLVk9mrkBULMwlAMcHKxqwOdUmRwoPfaypdxW
 v9fcLSQeHGsOobJNfPyZ8Ns//V6moBw/VMpV3AVzPA==
X-Google-Smtp-Source: ABdhPJwc8WgkB5baQneSP3O56E527r0CcFTd8E6eqmfIQH4X1bWsduigHTlQQV7Hic/QVkEEt7XICj+d1DgqVMzgDVk=
X-Received: by 2002:a7b:c44a:: with SMTP id l10mr19134wmi.92.1591631342886;
 Mon, 08 Jun 2020 08:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200605212706.7361-1-james.quinlan@broadcom.com>
 <20200605212706.7361-9-james.quinlan@broadcom.com>
 <20200607164950.GX2428291@smile.fi.intel.com>
In-Reply-To: <20200607164950.GX2428291@smile.fi.intel.com>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Mon, 8 Jun 2020 11:48:51 -0400
Message-ID: <CA+-6iNyL12Z+igSrWnsmTzrwzyyeDtSK-9ULiZe0MwM5LO5bjQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] device core: Introduce multiple dma pfn offsets
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Wolfram Sang <wsa@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
 Dan Williams <dan.j.williams@intel.com>, Rob Herring <robh+dt@kernel.org>,
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
 Mark Brown <broonie@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Sun, Jun 7, 2020 at 12:500f9bfe0fb8840b268af1bbcc51f1cd440514e PM
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jun 05, 2020 at 05:26:48PM -0400, Jim Quinlan wrote:
> > The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> > the use of single or multiple pfn offsets between cpu addrs and dma addrs.
> > It subsumes the role of dev->dma_pfn_offset -- a uniform offset.
> >
> > The function of_dma_get_range() has been modified to take two additional
> > arguments: the "map", which is an array that holds the information
> > regarding the pfn offset regions, and map_size, which is the size in bytes
> > of the map array.
> >
> > of_dma_configure() is the typical manner to set pfn offsets but there are a
> > number of ad hoc assignments to dev->dma_pfn_offset in the kernel driver
> > code.  These cases now invoke the function
> > dma_attach_uniform_pfn_offset(dev, pfn_offset).
>
> ...
>
> > +             int ret = dma_attach_uniform_pfn_offset
> > +                             (dev, keystone_dma_pfn_offset);
>
> It's strange indentation. Have you configured your editor correctly?
> Seems to me as fit on one line.
I'm using emacs with the c-style set to linux.  I may have some custom
tweaks; I'll check into it.  But I think I can fix most of your
objections by using the max_line_length of 100.

>
> > +             dev_err(dev, "set dma_pfn_offset%08lx%s\n",
> > +                     dev->dma_pfn_offset, ret ? " failed" : "");
>
> ...
>
> > +     *map_size = (num_ranges + 1) * sizeof(**map);
> > +     r = kzalloc(*map_size, GFP_KERNEL);
>
> kcalloc()
Since I have to calculate the size anyway I thought kzalloc was fine.
I'll switch.
>
> > +     if (!r)
> > +             return -ENOMEM;
>
> ...
>
> > +             r->pfn_offset = PFN_DOWN(range.cpu_addr)
> > +                     - PFN_DOWN(range.bus_addr);
>
> Ditto (indentation).
>
> ...
>
>
> > +             unsigned long dma_pfn_offset
> > +                     = dma_pfn_offset_from_phys_addr(dev, paddr);
>
> Ditto.
>
> ...
>
> > +             unsigned long dma_pfn_offset
> > +                     = dma_pfn_offset_from_dma_addr(dev, dev_addr);
>
> Ditto.
>
> Check entire your series for a such, please!

Will do,
Thanks
Jim Quinlan
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
