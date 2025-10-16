Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F30BE1AB0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97EB10E947;
	Thu, 16 Oct 2025 06:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BG3eEDCS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D14F10E947
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 06:10:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E092F490D6;
 Thu, 16 Oct 2025 06:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39906C4CEF1;
 Thu, 16 Oct 2025 06:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760595029;
 bh=tT6N7q0N+tYnpCuKuxnxGLzsNtDaUUpQ+9IuABIG9g0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BG3eEDCSI/HeqTCyC/0LCNKBgZ3zo6ECD9ngmXBKIPPl5NBH22Bn7mghAB8et/H6G
 Mk66piiBKnfchNsu3YfuJzNnwCXFrqb8msDY8Om7bdz82Hkljjp7CPmpHtnH9rNGgs
 KlMJt91fqlCWGDLVdc6FP/YNLaLQ7lPh9mflRMeup/0Wzsexbxj6A0mkigA65Vzw0x
 gbAD3ImrXMKJVAfq/R2QbmWKCY7eNvtD8O8jYdRtYFKQ5Hq1PrhccrO90mG8ylxJEA
 UlVJ3lTR+OmS5SyBhCnebiq7W+a6V2pL6QQLerxSwT6B4ZcH42Z/KxX0dqJOEZ6gTV
 xAaHdT8g/V/0w==
Date: Thu, 16 Oct 2025 09:10:25 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org,
 linux-pci@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 8/9] vfio/pci: Enable peer-to-peer DMA transactions by
 default
Message-ID: <20251016061025.GA6199@unreal>
References: <cover.1760368250.git.leon@kernel.org>
 <a04c44aa4625a6edfadaf9c9e2c2afb460ad1857.1760368250.git.leon@kernel.org>
 <aPBwEVJSzezdii1V@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPBwEVJSzezdii1V@Asurada-Nvidia>
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

On Wed, Oct 15, 2025 at 09:09:53PM -0700, Nicolin Chen wrote:
> Hi Leon,
> 
> On Mon, Oct 13, 2025 at 06:26:10PM +0300, Leon Romanovsky wrote:
> > @@ -2090,6 +2092,9 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
> >  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
> >  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
> >  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> > +	ret = pcim_p2pdma_init(vdev->pdev);
> > +	if (ret != -EOPNOTSUPP)
> > +		return ret;
> >  	init_rwsem(&vdev->memory_lock);
> >  	xa_init(&vdev->ctx);
> 
> I think this should be:
> 	if (ret && ret != -EOPNOTSUPP)
> 		return ret;
> 
> Otherwise, init_rwsem() and xa_init() would be missed if ret==0.

You absolutely right.

Thanks

> 
> Thanks
> Nicolin
> 
