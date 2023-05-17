Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60757707BC4
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 10:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C9010E4E5;
	Thu, 18 May 2023 08:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B268810E3DA
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:41:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 815406447A;
 Wed, 17 May 2023 09:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC390C433EF;
 Wed, 17 May 2023 09:41:22 +0000 (UTC)
Date: Wed, 17 May 2023 10:41:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 RESEND 4/7] swiotlb: Dynamically allocated bounce
 buffers
Message-ID: <ZGShP6i1Ed0kTF83@arm.com>
References: <cover.1683623618.git.petr.tesarik.ext@huawei.com>
 <346abecdb13b565820c414ecf3267275577dbbf3.1683623618.git.petr.tesarik.ext@huawei.com>
 <BYAPR21MB168874BC467BFCEC133A9DCDD7789@BYAPR21MB1688.namprd21.prod.outlook.com>
 <20230516061309.GA7219@lst.de>
 <20230516083942.0303b5fb@meshulam.tesarici.cz>
 <ZGPEgsplBSsI9li3@arm.com>
 <20230517083510.0cd7fa1a@meshulam.tesarici.cz>
 <20230517065653.GA25016@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517065653.GA25016@lst.de>
X-Mailman-Approved-At: Thu, 18 May 2023 08:20:23 +0000
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 Kim Phillips <kim.phillips@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Petr Tesarik <petrtesarik@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Borislav Petkov <bp@suse.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>,
 Hans de Goede <hdegoede@redhat.com>,
 "Steven Rostedt \(Google\)" <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Roberto Sassu <roberto.sassu@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 08:56:53AM +0200, Christoph Hellwig wrote:
> Just thinking out loud:
> 
>  - what if we always way overallocate the swiotlb buffer
>  - and then mark the second half / two thirds / <pull some number out
>    of the thin air> slots as used, and make that region available
>    through a special CMA mechanism as ZONE_MOVABLE (but not allowing
>    other CMA allocations to dip into it).
> 
> This allows us to have a single slot management for the entire
> area, but allow reclaiming from it.  We'd probably also need to make
> this CMA variant irq safe.

I think this could work. It doesn't need to be ZONE_MOVABLE (and we
actually need this buffer in ZONE_DMA). But we can introduce a new
migrate type, MIGRATE_SWIOTLB, and movable page allocations can use this
range. The CMA allocations go to free_list[MIGRATE_CMA], so they won't
overlap.

One of the downsides is that migrating movable pages still needs a
sleep-able context.

Another potential confusion is is_swiotlb_buffer() for pages in this
range allocated through the normal page allocator. We may need to check
the slots as well rather than just the buffer boundaries.

(we are actually looking at a MIGRATE_METADATA type for the arm64 memory
tagging extension which uses a 3% carveout of the RAM for storing the
tags and people want that reused somehow; we have some WIP patches but
we'll post them later this summer)

> This could still be combined with more aggressive use of per-device
> swiotlb area, which is probably a good idea based on some hints.
> E.g. device could hint an amount of inflight DMA to the DMA layer,
> and if there are addressing limitations and the amout is large enough
> that could cause the allocation of a per-device swiotlb area.

If we go for one large-ish per-device buffer for specific cases, maybe
something similar to the rmem_swiotlb_setup() but which can be
dynamically allocated at run-time and may live alongside the default
swiotlb. The advantage is that it uses a similar slot tracking to the
default swiotlb, no need to invent another. This per-device buffer could
also be allocated from the MIGRATE_SWIOTLB range if we make it large
enough at boot. It would be seen just a local accelerator for devices
that use bouncing frequently or from irq context.

-- 
Catalin
