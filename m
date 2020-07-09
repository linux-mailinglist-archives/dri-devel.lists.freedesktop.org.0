Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F121B0A5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A376EB8E;
	Fri, 10 Jul 2020 07:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00C46EA6C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 13:27:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r12so2318272wrj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 06:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWaS66ErLv63ISCBUv8Nr9+dmGgRCUtKHJMxssgE/AI=;
 b=CSHkHm9+F0ACxplsmgNYxr1myHYkKAn1Lpbiz/LCkZ9AKuceusLCQCIn83wvXUXLa2
 FURtCNllrVje+9rih8o1RYY4qf8+GSnJN2VDH2inYDambwg35p0jpUpsJ8UFZPweg3Zz
 VkoegZsvt0AfQk1WDxeI9lxqIFwVtoc6An0vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWaS66ErLv63ISCBUv8Nr9+dmGgRCUtKHJMxssgE/AI=;
 b=I5BmCq1rAJA8JeeXK+dNfWV3Nf/P3oweQXbr6IA1PvYtRhkvivbWf17ZEqHcHEMSJV
 gEXjNfx0RrRTBkUjusRvrNvvQoxhbVQJuJLRSu2XroPz2CADuFPT3n/YX9tKQdakPpJ/
 LAwt2/Ccic5p1AsquQNeLHt4KmoTbBQJ3qwFcJkNjIJu/0+MMoFJnQ/FcIA8VkBVb2kx
 5AEkKKQYQ5qvUN1OuQrlVQFmV236idxmRI7SWA+PMc1w/GWLSnuA5ogvjQBcLskgnlah
 OZEWdXP5aJah+7e+HwcgVOEYyaiOb1NANISwa5bShyiVVyltcLtTpemCWA6ztSw1ZZNA
 7dXg==
X-Gm-Message-State: AOAM5326oMQmLRFuuOiy7X749Dav3CRepxDP5IAe/husSB+LD1fghWEi
 PHvaahPDQvnHcKAoFVUfUjrG99n9RwtNZhWPQfxxig==
X-Google-Smtp-Source: ABdhPJyteHtv7vdDEbgqKCKSc6w9IMCW96FtUoZOjYuTSNpsCwUREsQgtMax8Ea9/qQOrx7ySkJfRSX5QGPcwUqrJm8=
X-Received: by 2002:a5d:4a4f:: with SMTP id v15mr60437347wrs.87.1594301239133; 
 Thu, 09 Jul 2020 06:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200708193219.47134-1-james.quinlan@broadcom.com>
 <20200708193219.47134-9-james.quinlan@broadcom.com>
 <20200709103108.GA20255@lst.de>
In-Reply-To: <20200709103108.GA20255@lst.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Thu, 9 Jul 2020 09:27:06 -0400
Message-ID: <CA+-6iNz8NWuBR=PMiiuROneXY_YhMHCkSzy1qZLfNcHH5B2KQg@mail.gmail.com>
Subject: Re: [PATCH v7 08/12] device core: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Julien Grall <julien.grall@arm.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
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
 Borislav Petkov <bp@alien8.de>,
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
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

I'm sending all commits to <linux-pci@vger.kernel.org> since most of
them are PCI related.  I don't send all patches to
linux-kernel@vger.kernel.org since I've read it is overused.  The --cc
list is generated by get_maintainer.pl.

IIRC, in a previous discussion you said you preferred NOT to get the
entire patchset by "--to Christoph"  but instead you would pick it off
from one of the "-to " kernel list sites.  It appears that  all
commits made it to the PCI list
(https://www.spinics.net/lists/linux-pci/).

Let me know what you want and I'll make it so.

Regards,
Jim


On Thu, Jul 9, 2020 at 6:31 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I someone seem to get just this patch instead of the full series for
> review again..
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
