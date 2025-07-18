Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF2CB0A602
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D3710E9C9;
	Fri, 18 Jul 2025 14:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="rBJeb8Ct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF7A10E046;
 Fri, 18 Jul 2025 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=nGat+aN/dUwx1e0CItMWnTJtYUFtXq1FOMv6w5QXIC4=; b=rBJeb8CtLixKT9l+aLVC1RQE1I
 Dveh3IljHpIJBFoA3sSWw2gY3xIDbSHioOrM7Q9Gcx14AJXR7JSOS6OW43vthaszlAsuDK510ve8X
 +OjROYs5T6be/WHCW/7SipY9DAMP3lh/Ck/HiTsCwKbHqZMTORmD7ta3f1iSKPwdT6/aTgWtAUQ+v
 pCdh6+N9ph0JZEdzxxI9dlYB175XdqBrIATo6pcdPAZRgW5MjT+Zo04Xu9aH9TjFKrsVfAZhhj7E7
 Z2oG62/swGwITcCJaMyeZ0o9hm+JIQOmN9YuB5cToI33n3ezsWoL5UEqSKNOD0K1RHQKngip/fsc/
 Hvds9ctQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ucltU-00000007NL5-3jwd;
 Fri, 18 Jul 2025 14:17:00 +0000
Date: Fri, 18 Jul 2025 15:17:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <aHpXXKTaqp8FUhmq@casper.infradead.org>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718115112.3881129-2-ymaman@nvidia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 18, 2025 at 02:51:08PM +0300, Yonatan Maman wrote:
> +++ b/include/linux/memremap.h
> @@ -89,6 +89,14 @@ struct dev_pagemap_ops {
>  	 */
>  	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
>  
> +	/*
> +	 * Used for private (un-addressable) device memory only. Return a
> +	 * corresponding PFN for a page that can be mapped to device
> +	 * (e.g using dma_map_page)
> +	 */
> +	int (*get_dma_pfn_for_device)(struct page *private_page,
> +				      unsigned long *dma_pfn);

This makes no sense.  If a page is addressable then it has a PFN.
If a page is not addressable then it doesn't have a PFN.
