Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E9C41945
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 21:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218E010EB79;
	Fri,  7 Nov 2025 20:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GnHfPvK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01910EB79
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 20:27:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77AA241B35;
 Fri,  7 Nov 2025 20:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836D6C4CEF5;
 Fri,  7 Nov 2025 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762547244;
 bh=VAySUlKP+gpY13ehfWvqZiKxHmLFx9bZKqh1eqOc7BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GnHfPvK9RlbGueuO2dIzOFloCGUIJO+4STJ9acaeZ4mwoNgCLVysGF3G1CD2dslTO
 J8xEeZg2TWQROLBRgu9cIRspJbvL0T9YEBkcbbcqYSRUqcnzE6UpSuE7s17MqR38od
 k1auiNEzsLsrcn/e5bmLAUXdt14ph1onYr5+m4OBZiUnSghRHlS5cz0wreim7qkvti
 AitNvNVxIXHxoXVVQZB1fuCmNeB+VUFl+qA0fr1ukYsVMffsErSLFPHEZkD3QhPl33
 mZVBp/M5pmVMtLNk4jfzBFQR0vtiXMXgOHw2XwWQXqRS2kcJr3JwuXFYWK3abcXYgE
 W34/n88w3YbCg==
Date: Fri, 7 Nov 2025 22:27:18 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v7 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251107202718.GE15456@unreal>
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251106-dmabuf-vfio-v7-5-2503bf390699@nvidia.com>
 <135df7eb-9291-428b-9c86-d58c2e19e052@infradead.org>
 <20251107160120.GD15456@unreal>
 <0c265a9b-fdc5-40d7-845f-30910f1ac6ea@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c265a9b-fdc5-40d7-845f-30910f1ac6ea@infradead.org>
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

On Fri, Nov 07, 2025 at 10:58:27AM -0800, Randy Dunlap wrote:
> 	
> 
> On 11/7/25 8:01 AM, Leon Romanovsky wrote:
> > On Thu, Nov 06, 2025 at 10:15:07PM -0800, Randy Dunlap wrote:
> >>
> >>
> >> On 11/6/25 6:16 AM, Leon Romanovsky wrote:
> >>> From: Jason Gunthorpe <jgg@nvidia.com>
> >>>
> >>> Reflect latest changes in p2p implementation to support DMABUF lifecycle.
> >>>
> >>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> >>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >>> ---
> >>>  Documentation/driver-api/pci/p2pdma.rst | 95 +++++++++++++++++++++++++--------
> >>>  1 file changed, 72 insertions(+), 23 deletions(-)

<...>

> >>> -The second issue is that to make use of existing interfaces in Linux,
> >>> -memory that is used for P2P transactions needs to be backed by struct
> >>> -pages. However, PCI BARs are not typically cache coherent so there are
> >>> -a few corner case gotchas with these pages so developers need to
> >>> -be careful about what they do with them.
> >>> +For PCIe the routing of TLPs is well defined up until they reach a host bridge
> >>
> >> Define what TLP means?
> > 
> > In PCIe "world", TLP is very well-known and well-defined acronym, which
> > means Transaction Layer Packet.
> 
> It's your choice (or Bjorn's). I'm just reviewing...

Thanks a lot.
