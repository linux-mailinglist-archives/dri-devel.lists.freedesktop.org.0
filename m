Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC37025D215
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF8E6EA9F;
	Fri,  4 Sep 2020 07:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BAE6EA36
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 17:32:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k15so4076753wrn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 10:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdQAZvbXCVXJwkRywSLG6JnetvOXivYhmXNx/fFNfOo=;
 b=PeZ+do84XUsG8yX+y0xtDFdM3W7ihrw4+Eg7Lf0egrb9LtMBQGYbfe6kry3lmEqaZ4
 YD5uVyabXPVOVnG1zctNz091NT+5kRmWJ8Qxdde146p1G2TpEQ8aLZWKX307mJHW2sP5
 YOWr2Z/cspMQV4ehyL7JTVxf4sQxxzDheuxQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdQAZvbXCVXJwkRywSLG6JnetvOXivYhmXNx/fFNfOo=;
 b=kTGnkURELPIDL8PSrD0fDaZ7WBICG7YH4ILvCpFM9pfwLMxIAt4cK/HyBWR0wK9rGC
 3BkBOzZ2FgwIkA2F8StpBhUgO0k9mke/C4NYl2QyIta4YcLPRm+H5ch1usm6duh1RYMA
 0KyBAnIJC4sNvEMsOx9P+EaFnK3ztgdIKGIOvpgbEB+QGNRXKLWfpqpWzfpmkcgWCdoR
 RsPHx+PONrmCtY4JTwEdzTSpntockB9tY1VgeKadh9qR4JDz1bN7KN4XQEAh8wPGH4Tx
 A5W8Bl19lEMpzX1juo3NJBskvv2bSrtFu1dTV+vqXO76KSoyYQ0G4Vo66R9CJw0IfBs/
 vtVQ==
X-Gm-Message-State: AOAM533if66smbctB/hmnZd172eoGB8YR6cvB/AIxZThUtNkBI4FEAtX
 mEDVgGG2cqS+PPaGmG4YmtWwytT5GMDZnz5y6YuNSg==
X-Google-Smtp-Source: ABdhPJzlo38OUlokDbtl4G3RL3E1kLc3kVQIe+ooBj2Om40oPL84GGMLXmXAPwATVhS0dB/n9pwMRt0/2muUtlKoUvU=
X-Received: by 2002:a5d:56c1:: with SMTP id m1mr3453960wrw.87.1599154374779;
 Thu, 03 Sep 2020 10:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <20200824193036.6033-8-james.quinlan@broadcom.com>
 <20200902215314.GA881878@ubuntu-n2-xlarge-x86>
 <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
 <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
 <6922bc0b-1849-2f2f-ec2f-fe9f0124dcfc@gmail.com>
 <20200903005240.GA1118@Ryzen-9-3900X.localdomain>
In-Reply-To: <20200903005240.GA1118@Ryzen-9-3900X.localdomain>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 3 Sep 2020 13:32:43 -0400
Message-ID: <CA+-6iNyv_sFJOxDi5OcYNWe=ovLnOnrZNsWFQk5b-bzQzA8T_Q@mail.gmail.com>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Nathan Chancellor <natechancellor@gmail.com>, 
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:34 +0000
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
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 2, 2020 at 8:52 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Sep 02, 2020 at 05:36:29PM -0700, Florian Fainelli wrote:
> >
> >
> > On 9/2/2020 3:38 PM, Nathan Chancellor wrote:
> > [snip]
> > > > Hello Nathan,
> > > >
> > > > Can you tell me how much memory your RPI has and if all of it is
> > >
> > > This is the 4GB version.
> > >
> > > > accessible by the PCIe device?  Could you also please include the DTS
> > > > of the PCIe node?  IIRC, the RPI firmware does some mangling of the
> > > > PCIe DT before Linux boots -- could you describe what is going on
> > > > there?
> > >
> > > Unfortunately, I am not familiar with how to get this information. If
> > > you could provide some instructions for how to do so, I am more than
> > > happy to. I am not very knowleagable about the inner working of the Pi,
> > > I mainly use it as a test platform for making sure that LLVM does not
> > > cause problems on real devices.
> >
> > Can you bring the dtc application to your Pi root filesystem, and if so, can
> > you run the following:
> >
> > dtc -I fs -O dtb /proc/device-tree -f > /tmp/device.dtb
>
> Sure, the result is attached.
>
> > or cat /sys/firmware/fdt > device.dtb
> >
> > and attach the resulting file?
> >
> > >
> > > > Finally, can you attach the text of the full boot log?
> > >
> > > I have attached a working and broken boot log. Thank you for the quick
> > > response!
> >
> > Is it possible for you to rebuild your kernel with CONFIG_MMC_DEBUG by any
> > chance?
>
> Of course. A new log is attached with the debug output from that config.


Hi Nicolas,

Can you please help us out here?  It appears that your commit

3d2cbb644836 "ARM: dts: bcm2711: Move emmc2 into its own bus"

added the following line to the bcm2711.dtsi file:

+ dma-ranges = <0x0 0xc0000000  0x0 0x00000000  0x40000000>;

and for some reason the eMMC is not operating properly w/ my commit..
 Regardless, the only difference that my commit should make is to
enforce the bounds of the dma_window (whereas the previous code
adds/subs the pfn_offset everywhere).

Thanks,
Jim Quinlan

PS If you would like to talk, let me know and we can make arrangements.


>
>
> > I have a suspicion that this part of the DTS for the bcm2711.dtsi platform
> > is at fault:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2711.dtsi#n264
> >
> > and the resulting dma-ranges parsing is just not working for reasons to be
> > determined.
> > --
> > Florian
>
> Let me know if you need anything else out of me.
>
> Cheers,
> Nathan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
