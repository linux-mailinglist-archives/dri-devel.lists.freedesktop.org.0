Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63B23204F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 16:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2B8923A;
	Wed, 29 Jul 2020 14:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A1F8923A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:28:08 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E8D222CB3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596032888;
 bh=gzjRkgu/X+pGUJM215OVzr30sIFOPcqIIJ3FwUsKltg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AlekHPMia4B/28gEpaaTb8OVMNIjxOYMD4Ol9/DHZoWyQ5NPyNG11D1rlpQ3KZHQO
 Ot4Q8F6eoZ6XWHnCip9Ku7TVI28rCjBGiW/sRPFGePnv8Oz7LqtACq290PQgQxmSyL
 lmQroeZQfBDWfe2PUGubOu3u1TXzOyCpozsjy1Es=
Received: by mail-ua1-f42.google.com with SMTP id e20so399154uav.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:28:08 -0700 (PDT)
X-Gm-Message-State: AOAM531rfFGnDFnaVN5jj01OSZnpZfoLmRTxLHDhNOjZjeuFwYVf9oGV
 vzJVDO3n0k/ZgpSjrZbhvxWYU+6ogMCAgCzz0w==
X-Google-Smtp-Source: ABdhPJy33nzlFPP5RuYWD7mp85pLwmqP2BSD2NuTMm/GnoDWXqUdLIpMQAJJ7nHyqaOoGOhqAV7hcShW9miR6MKi5fY=
X-Received: by 2002:a9d:4002:: with SMTP id m2mr28909696ote.129.1596032885490; 
 Wed, 29 Jul 2020 07:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
 <CA+-6iNwD1ehy6LPJ6gZJjvVeTBXAG_ybhyfUHTCvsDnM-HnmXA@mail.gmail.com>
 <20200729061903.GA31671@lst.de>
In-Reply-To: <20200729061903.GA31671@lst.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 29 Jul 2020 08:27:53 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLL_ZZFwinJpveybAtHg9KtrYCHgM3gNHero+Xujyd2eg@mail.gmail.com>
Message-ID: <CAL_JsqLL_ZZFwinJpveybAtHg9KtrYCHgM3gNHero+Xujyd2eg@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>, Jim Quinlan <james.quinlan@broadcom.com>
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
 PCI <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
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
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Borislav Petkov <bp@alien8.de>,
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

On Wed, Jul 29, 2020 at 12:19 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jul 28, 2020 at 02:24:51PM -0400, Jim Quinlan wrote:
> > I started using devm_kcalloc() but at least two reviewers convinced me
> > to just use kcalloc().  In addition, when I was using devm_kcalloc()
> > it was awkward because 'dev' is not available to this function.
> >
> > It comes down to whether unbind/binding the device N times is actually
> > a reasonable usage.  As for my experience I've seen two cases: (1) my
> > overnight "bind/unbind the PCIe RC driver" script, and we have a
> > customer who does an unbind/bind as a hail mary to bring back life to
> > their dead EP device.  If the latter case happens repeatedly, there
> > are bigger problems.
>
> We can't just leak the allocations.  Do you have a pointer to the
> arguments against managed resources?  I'm generally not a huge fan
> of the managed resources, but for a case like this they actually seem
> useful.  If we don't use the managed resources we'll at leat need
> to explicitly free the resources when freeing the device.

The lifetime for devm_kcalloc may not be what we want here. devm
allocs are freed on probe fail or remove, not on freeing the device
(there is a just in case free there too though).

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
