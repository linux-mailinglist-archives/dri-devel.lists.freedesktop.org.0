Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB8232C4F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 09:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE286E86E;
	Thu, 30 Jul 2020 07:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8858A6E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 14:26:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so11294614wrc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 07:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dy8KWXYTow5Rv/ocWI6NcoOurbpn5CoM2X7oqF6BBwc=;
 b=QmJ7s1Bm/VMGgvExl3jijvZ0ohCPoRnWqYNUcbqX2X++mJh+1jczZcgs7Y3nyrS1WU
 chFU3XTv1g/b/Pg3/n4Pr6ULcF0R8YoeqquXmUxHmEMPkXMvxotu8b7fgAlBfY0gSJqq
 +Ecuc9EPJXEn/D3CXcZueyzy8wr2xqcKQGKYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dy8KWXYTow5Rv/ocWI6NcoOurbpn5CoM2X7oqF6BBwc=;
 b=kKLm0OBuEOoAnXKDdYvmhJf9HVxVkTnt2f6xB18uH3vAe/KtRoc6obQMQ3iyKrLdKW
 fynEauRwR63BNYSFK3wFP7cIUwKrxb5o67cTi9VyFnRN3xUL+huRCch0yPV02X5rOrVb
 Fv3EMJPpLsB07OPFWSv+oMOKVYYdZHK1ZquxhQJMMrTORDOqYb0+/Vgf1OlZoc05BmDh
 2Sin1l3r6GTL/AyfvKzbOio1yU6CptRuvKT2UJ44kPWrx9gGgmVz6/HCMcOpvB1duqlj
 rkW0imY8GHC/uJ8Sh/0+QryL52tHtauIE5j9Kahv9kC2v+FmDDKkpYRMaA8ZdwOvyxOj
 c3AQ==
X-Gm-Message-State: AOAM531/JxLvp67V/Eb+1rnxP5PMjTRf68C1AhFRQJ4p+AMdHKw6M+E2
 yGYBJDqS3KqdxVc5RJbbRGHguQ8kfGWT+NnwYIeEOA==
X-Google-Smtp-Source: ABdhPJwwt8UrAlXwvkhdeyf8ibKzxRjk8LPYCRKGkcT48qYnyQotcCx0FHhfXS6w8sTit2G3tX8NQB2n4nyKOS9ipgI=
X-Received: by 2002:adf:9501:: with SMTP id 1mr22051008wrs.413.1596032801912; 
 Wed, 29 Jul 2020 07:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200724203407.16972-1-james.quinlan@broadcom.com>
 <20200724203407.16972-9-james.quinlan@broadcom.com>
 <CAL_Jsq+9QE_uz+81O-Bm3xycSrJptx0xmwpPdP3x65KG00ugDQ@mail.gmail.com>
 <CA+-6iNwD1ehy6LPJ6gZJjvVeTBXAG_ybhyfUHTCvsDnM-HnmXA@mail.gmail.com>
 <20200729061903.GA31671@lst.de>
In-Reply-To: <20200729061903.GA31671@lst.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 29 Jul 2020 10:26:29 -0400
Message-ID: <CA+-6iNxW9=9ZEcspxvbf7F_n6g5CrEWmGh-cNcmC4BKdY0SMfA@mail.gmail.com>
Subject: Re: [PATCH v9 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Thu, 30 Jul 2020 07:16:49 +0000
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

On Wed, Jul 29, 2020 at 2:19 AM Christoph Hellwig <hch@lst.de> wrote:
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

Actually, there were no arguments for using an unmanaged kcalloc, just
comments [1], [2].  When it was rightly suggested to have 'dev'
dropped from of_dma_range() [3], I submitted v6 to accomplish this.
But now of_dma_range() would call kcalloc(), and then
of_dma_configure() was required to "dup" the result, requiring a
devm_kcalloc(), memcpy(), and kfree().  This was awkward, so
considering [1], [2], I dropped the devm_kcalloc() and submitted v7.

So I can easily revert to the awkward code of v6.  But I'm hoping you
have a more elegant solution :-)

Thanks,
Jim

[1]
[v6, Andy Shevchenko]
> +             /* We want the offset map to be device-managed, so alloc & copy */
> +             dev->dma_range_map = devm_kcalloc(dev, num_ranges + 1, sizeof(*r),
> +                                               GFP_KERNEL);
The question is how many times per device lifetime this can be called?

[2]
[v2, Andy Shevchenko]
> +     r = devm_kzalloc(dev, r_size, GFP_KERNEL);
devm_?!
Looking at r_size it should be rather kcalloc().

[3]
[v3, Nicolas Saenz Julienne]
> I agree with you.  The reason I needed a "struct device *"  in the call is
> because I wanted to make sure the memory that is alloc'd belongs to the
> device that needs it.  If I do a regular kzalloc(), this memory  will become
> a leak once someone starts unbinding/binding their device.  Also, in  all
> uses of of_dma_rtange() -- there is only one --  a dev is required as one
> can't attach an offset map to NULL.
>
> I do see that there are a number of functions in drivers/of/*.c that
> take 'struct device *dev' as an argument so there is precedent for
> something like this.  Regardless, I need an owner to the memory I
> alloc().
I understand the need for dev to be around, devm_*() is key. But also it's
important to keep the functions on purpose. And if of_dma_get_range() starts
setting ranges it calls, for the very least, for a function rename. Although
I'd rather split the parsing and setting of ranges as mentioned earlier. That
said, I get that's a more drastic move.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
