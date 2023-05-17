Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99C1706137
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9B910E3B6;
	Wed, 17 May 2023 07:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E1D10E3B6
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:32:32 +0000 (UTC)
Received: from meshulam.tesarici.cz
 (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz
 [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by bee.tesarici.cz (Postfix) with ESMTPSA id EFCF0164AA5;
 Wed, 17 May 2023 09:32:27 +0200 (CEST)
Authentication-Results: mail.tesarici.cz;
 dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
 t=1684308748; bh=SMZB1a3FJVckA4uh20yz2Mfq+e2cLIxWHNP75ATsZTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mCcRh259Vaj22uiaMFcYNHaDzhfPsk/D0QMaoI55cIkowp5s+9dkExQMSa8mLBTUT
 5HaVl2QV8QtWeIRuctMEN24UM7lmHIfQLwO8UrdS/9TVYOUE95+fnNnOKn5ipXk4AP
 evJWOCMsexuRG8FTtoAxJH7Sw//hc3hTXntur2OBH2Nelzkn8T4G8XWcAjsiAytoqy
 r5NZYBw8QLufWsBkKN5hlx34hE9EcHXlH8z+9sa9hrXKI/4ahp+nATH2KFDs3jtOBc
 mPZ69RpNCTo7KFBnr8LmhqIyqdXTIxSnHkaiJ3XNqz4PLNhJfG4Rz36dVOMuZs/mjk
 5g6PC4LcI462w==
Date: Wed, 17 May 2023 09:32:26 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Message-ID: <20230517093226.77ab1d2a@meshulam.tesarici.cz>
In-Reply-To: <20230517065653.GA25016@lst.de>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
 <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
 <20230516061309.GA7219@lst.de>
 <20230516083942.0303b5fb@meshulam.tesarici.cz>
 <ZGPEgsplBSsI9li3@arm.com>
 <20230517083510.0cd7fa1a@meshulam.tesarici.cz>
 <20230517065653.GA25016@lst.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Kim Phillips <kim.phillips@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E.
 McKenney" <paulmck@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

On Wed, 17 May 2023 08:56:53 +0200
Christoph Hellwig <hch@lst.de> wrote:

> Just thinking out loud:
> 
>  - what if we always way overallocate the swiotlb buffer
>  - and then mark the second half / two thirds / <pull some number out
>    of the thin air> slots as used, and make that region available
>    through a special CMA mechanism as ZONE_MOVABLE (but not allowing
>    other CMA allocations to dip into it).

This approach has also been considered internally at Huawei, and it
looked like a viable option, just more complex. We decided to send the
simple approach first to get some feedback and find out who else might
be interested in the dynamic sizing of swiotlb (if anyone).

> This allows us to have a single slot management for the entire
> area, but allow reclaiming from it.  We'd probably also need to make
> this CMA variant irq safe.

Let me recap my internal analysis.

On the pro side:

- no performance penalty for devices that do not use swiotlb
- all alignment and boundary constraints can be met
- efficient use of memory for buffers smaller than 1 page

On the con side:

- ZONE_MOVABLE cannot be used for most kernel allocations
- competition with CMA over precious physical address space
  (How much should be reserved for CMA and how much for SWIOTLB?)

To quote from Memory hotplug documentation:

Usually, MOVABLE:KERNEL ratios of up to 3:1 or even 4:1 are fine. [...]
Actual safe zone ratios depend on the workload. Extreme cases, like
excessive long-term pinning of pages, might not be able to deal with
ZONE_MOVABLE at all.

This should be no big issue on bare metal (where the motivation is
addressing limitations), but the size of SWIOTLB in CoCo VMs probably
needs some consideration.

> This could still be combined with more aggressive use of per-device
> swiotlb area, which is probably a good idea based on some hints.
> E.g. device could hint an amount of inflight DMA to the DMA layer,
> and if there are addressing limitations and the amout is large enough
> that could cause the allocation of a per-device swiotlb area.

I would not rely on device hints, because it probably depends on
workload rather than type of device. I'd rather implement some logic
based on the actual runtime usage pattern. I have some ideas already.

Petr T
