Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCBDC710F9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 21:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53B10E67A;
	Wed, 19 Nov 2025 20:45:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qlv5a0X0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4FE10E681
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 20:45:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 441AF6000A;
 Wed, 19 Nov 2025 20:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F3FC4CEF5;
 Wed, 19 Nov 2025 20:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763585145;
 bh=5rI8lrrVbFn1InvbQielmCucdPk01bWsAxmwyIxRJJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qlv5a0X0ngRKyFh2JKVmpc2TkyYK/DU2m5BSvUPEl7BnF5Z4h3h/m+RqO7z1bx61m
 rbyyfMoS9aqKBh0aUmaaII2BVk6WpQkAzGGpg1rUG+s8HZmAW8WSgoYrh4VjU5XyVE
 cn3LgrCO1dpfJBw5cCJ/USdlN3JLkb+DpB22klLCEqHAbG4qjTuayYPjr+pzzDi4EO
 R0Qx5aJ2BOOXu+TPpbSpmwtVpBrFTUylK5laErKZm5ellYru+TJRCMyV7sgWpV4Qxc
 Y4Mw7ZQsZniCIYFf6yWIotwra9fYcCXVMUXRBjbCK8S0k+X0tqBTMuTL7f8E/JttUG
 kQjOcbKaf5FSw==
Date: Wed, 19 Nov 2025 22:45:41 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
Message-ID: <20251119204541.GN18335@unreal>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
 <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
 <20251119133529.GL17968@ziepe.ca>
 <ad36ef4e-a485-4bbf-aaa9-67cd517ca018@amd.com>
 <20251119194506.GS17968@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251119194506.GS17968@ziepe.ca>
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

On Wed, Nov 19, 2025 at 03:45:06PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 19, 2025 at 03:06:18PM +0100, Christian König wrote:
> > On 11/19/25 14:35, Jason Gunthorpe wrote:
> > > On Wed, Nov 19, 2025 at 10:18:08AM +0100, Christian König wrote:
> > >>> +As this is not well-defined or well-supported in real HW the kernel defaults to
> > >>> +blocking such routing. There is an allow list to allow detecting known-good HW,
> > >>> +in which case P2P between any two PCIe devices will be permitted.

<...>

> > The documentation makes it sound like DMA-buf is limited to not
> > using struct pages and direct I/O, but that is not true.
> 
> Okay, I see what you mean, the intention was to be very strong and say
> if you are not using struct pages then you must using DMABUF or
> something like it to control lifetime. Not to say that was the only
> way how DMABUF can be used.
> 
> Leon let's try to clarify that a bit more

diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
index 32e9b691508b..280673b50350 100644
--- a/Documentation/driver-api/pci/p2pdma.rst
+++ b/Documentation/driver-api/pci/p2pdma.rst
@@ -156,7 +156,8 @@ Usage With DMABUF
 =================
 
 DMABUF provides an alternative to the above struct page-based
-client/provider/orchestrator system. In this mode the exporting driver will wrap
+client/provider/orchestrator system and should be used when struct page
+doesn't exist. In this mode the exporting driver will wrap
 some of its MMIO in a DMABUF and give the DMABUF FD to userspace.
 
 Userspace can then pass the FD to an importing driver which will ask the


> 
> Jason
