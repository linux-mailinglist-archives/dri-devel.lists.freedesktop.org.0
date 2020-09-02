Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0926B25BDC8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEB76E570;
	Thu,  3 Sep 2020 08:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E970C89295
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 15:02:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so5589518wrm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZGIVv2/nKkKWqHnBVOyDTBWflj7dKm5Z1J/YDjsaUtE=;
 b=Z8Lj3TbqKgnf+Tg9Z0P832A14FJMQdIVQJkvmocdIbwtjttKsmDE4r9Qh2gQGw6NZU
 As25toD2CuCYv9eeG56/UbBx2y5/4HM22wP8iqo6rr8paXM5g8MG1OByan9PYMbZAEKD
 bMSSkhriycK9xJEs3VgMHxfmN359bRlL1LuGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZGIVv2/nKkKWqHnBVOyDTBWflj7dKm5Z1J/YDjsaUtE=;
 b=BBdngK6m+0TaOow0lwIwEj85/PM5bbFIDYPhUvFwK9BgGp9B8KReq8flekrhWtlk/y
 chRT6Ospr0gHGqfpx93RE6bEug52HZKNMJmcmNWgDVJFRbtKqB3vnCIM4GIDvJ60RYzB
 KNQ5HcVfPzM9VKyhnmzA7xkNYLPx6Z/gV36iT1VG5VISSIaITGd616ML/RFe+QkS9FzP
 adGSgbTffBEfBNeekAHT+ST5xsFMJy1diZO0b49n8nW/7cRcN2914cFZQsaQzq3fxpCY
 OWnCAqhGyZ2F+mdnYtr6h41bm99R4pSOsJgnuTneyn86m/p8937I57SKFULkBH4PFGH+
 oIkQ==
X-Gm-Message-State: AOAM531WA8TwpK/aAB++W6DwlAXIxsTpJ/0G82Jtuul5x5Knnuf4tv0t
 rwNpK5BrCUCXoYrxWwFpeYlAKrNUtP3QRa+ezxcr4A==
X-Google-Smtp-Source: ABdhPJwXlN3NHDVCqgynQUFgcYU8keK6MI5X2Io9fYXPD+Fsy3mNkxkFxRkwEAfYalcTpwO0KXeigTJj+lB1MzHkdrU=
X-Received: by 2002:adf:ba10:: with SMTP id o16mr7576162wrg.100.1599058974152; 
 Wed, 02 Sep 2020 08:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <20200824193036.6033-8-james.quinlan@broadcom.com>
 <20200901082429.GA1440@lst.de>
In-Reply-To: <20200901082429.GA1440@lst.de>
From: Jim Quinlan <james.quinlan@broadcom.com>
Date: Wed, 2 Sep 2020 11:02:42 -0400
Message-ID: <CA+-6iNw1rSJOjQDDEYdB3Y1S5KOjOULANbmsDVBM4Mr4Uifomw@mail.gmail.com>
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Yong Deng <yong.deng@magewell.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 1, 2020 at 4:24 AM Christoph Hellwig <hch@lst.de> wrote:
>
> I've applied this to the dma-mapping tree.
>
> I had to resolve a conflict in drivers/of/address.c with a recent
> mainline commit.  I also applied the minor tweaks Andy pointed out
> plus a few more style changes.  A real change is that I changed the
> prototype for dma_copy_dma_range_map to require less boilerplate code.
>
> The result is here:
>
>     http://git.infradead.org/users/hch/dma-mapping.git/commitdiff/eef520b232c60e74eb8b33a5a7863ad8f2b4a5c7
>
> please double check that everyting works as expected.
Tested-by: Jim Quinlan <james.quinlan@broadcom.com>

Thanks Christoph
Jim
>
> I can cut a stable branch with this if you need it for other trees, but
> I'd like to wait a few days to see if there is any fallout first.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
