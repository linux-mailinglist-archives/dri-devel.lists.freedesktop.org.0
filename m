Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E9EB14A44
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 10:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD41110E5F4;
	Tue, 29 Jul 2025 08:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5F0RFaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9B010E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:40:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F0ABD601EC;
 Tue, 29 Jul 2025 08:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8928C4CEEF;
 Tue, 29 Jul 2025 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753778399;
 bh=OwIYfsDVT+NrTf9pe9SqTHnHnwWkQ93t/xB2WubT90E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M5F0RFaAnIV1InpC5Z2ni72wX3Gt2VxXzbhksr3xOJ1TeTRCWQ0u8eCBRDawTegSU
 9WeyNAVLruaM4v0e5fxxVTwWe3R75xM9uuxh2YRgjFTScwkMi8pG+5t6Mg20IKrxGB
 NGcLT9dJY0mpUgWIP5dXln1PJIrr26Ba2JLQhTz2o4sB6ZuU1tih414TMIIriKtVb8
 oEvkOHh7OxqhOGrJbvZiu70ODXucDPABU9psK1pm3OKH5psLmA6+IVsT7RRXq5S+Ju
 8oo9d4NqyKlt/4eREWPutcfL1Jy1y7Tg38lMaB21tJigLyzQrhrUCKCq9BrO4s6YFz
 3z5QK7qlk7Drw==
Date: Tue, 29 Jul 2025 11:39:54 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 09/10] vfio/pci: Share the core device pointer while
 invoking feature functions
Message-ID: <20250729083954.GE402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <19f71a0f4d1a5db8c712cb4d094ccf2f10dc22c5.1753274085.git.leonro@nvidia.com>
 <20250728145553.53e94d49.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728145553.53e94d49.alex.williamson@redhat.com>
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

On Mon, Jul 28, 2025 at 02:55:53PM -0600, Alex Williamson wrote:
> On Wed, 23 Jul 2025 16:00:10 +0300
> Leon Romanovsky <leon@kernel.org> wrote:
> 
> > From: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > 
> > There is no need to share the main device pointer (struct vfio_device *)
> > with all the feature functions as they only need the core device
> > pointer. Therefore, extract the core device pointer once in the
> > caller (vfio_pci_core_ioctl_feature) and share it instead.
> > 
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_core.c | 30 +++++++++++++-----------------
> >  1 file changed, 13 insertions(+), 17 deletions(-)

<...>

> >  static int vfio_pci_core_pm_entry_with_wakeup(
> > -	struct vfio_device *device, u32 flags,
> > +	struct vfio_pci_core_device *vdev, u32 flags,
> >  	struct vfio_device_low_power_entry_with_wakeup __user *arg,
> >  	size_t argsz)
> 
> I'm tempted to fix the line wrapping here, but I think this patch
> stands on its own.  Even if it's rather trivial, it makes sense to
> consolidate and standardize on the vfio_pci_core_device getting passed
> around within vfio_pci_core.c.  Any reason not to split this off?

No problem, I will send it separately after merge window ends.

Thanks

> Thanks,
> 
> Alex
