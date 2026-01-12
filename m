Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9AD12809
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 13:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173AE89654;
	Mon, 12 Jan 2026 12:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iL2K02pv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E8A89654
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 12:20:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 544F06013C;
 Mon, 12 Jan 2026 12:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 233D1C16AAE;
 Mon, 12 Jan 2026 12:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768220402;
 bh=+Nliq3Hq9k4ThIYArW3/W+oRJeWgrnz/ZUwpOJtv0cM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iL2K02pvk6E1DsvDlqWboBCtpQHXaKUBrL1wltPlg05hlgRoVPE9d6yCnJgpfHU3K
 5wnwkxG9AmFATvFjjgHmhJmW/kYdcxNn5zEl7CCQGsXozborPGix1NS3B6tfKluFUp
 4+jaQq6nlsWR88DToo/mPKJ87brhQnhnntP/R+nXtW3dhiXFicBW1f3BpAsty+mLjZ
 99FE2FBFc/kRsz2G+ht2VEMhhnQ2twEqyml4iPXDcjXNFCp0ahYY66D1dhde+2mS0q
 8Y77nf0bPjNjJG2JcBS0x7Evxif8Ub6tPWPTIo5nqywmPi5aJOLKCeAsDSKhiNLd77
 0aouxLftPfDUw==
Date: Mon, 12 Jan 2026 14:19:56 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
Message-ID: <20260112121956.GE14378@unreal>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
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

On Mon, Jan 12, 2026 at 11:04:38AM +0100, Christian König wrote:
> On 1/11/26 11:37, Leon Romanovsky wrote:
> > This series implements a dma-buf “revoke” mechanism: to allow a dma-buf
> > exporter to explicitly invalidate (“kill”) a shared buffer after it has
> > been distributed to importers, so that further CPU and device access is
> > prevented and importers reliably observe failure.
> 
> We already have that. This is what the move_notify is all about.
> 
> > Today, dma-buf effectively provides “if you have the fd, you can keep using
> > the memory indefinitely.” That assumption breaks down when an exporter must
> > reclaim, reset, evict, or otherwise retire backing memory after it has been
> > shared. Concrete cases include GPU reset and recovery where old allocations
> > become unsafe to access, memory eviction/overcommit where backing storage
> > must be withdrawn, and security or isolation situations where continued access
> > must be prevented. While drivers can sometimes approximate this with
> > exporter-specific fencing and policy, there is no core dma-buf state transition
> > that communicates “this buffer is no longer valid; fail access” across all
> > access paths.
> 
> It's not correct that there is no DMA-buf handling for this use case.
> 
> > The change in this series is to introduce a core “revoked” state on the dma-buf
> > object and a corresponding exporter-triggered revoke operation. Once a dma-buf
> > is revoked, new access paths are blocked so that attempts to DMA-map, vmap, or
> > mmap the buffer fail in a consistent way.
> > 
> > In addition, the series aims to invalidate existing access as much as the kernel
> > allows: device mappings are torn down where possible so devices and IOMMUs cannot
> > continue DMA.
> > 
> > The semantics are intentionally simple: revoke is a one-way, permanent transition
> > for the lifetime of that dma-buf instance.
> > 
> > From a compatibility perspective, users that never invoke revoke are unaffected,
> > and exporters that adopt it gain a core-supported enforcement mechanism rather
> > than relying on ad hoc driver behavior. The intent is to keep the interface
> > minimal and avoid imposing policy; the series provides the mechanism to terminate
> > access, with policy remaining in the exporter and higher-level components.
> 
> As far as I can see that patch set is completely superfluous.
> 
> The move_notify mechanism has been implemented exactly to cover this use case and is in use for a couple of years now.
> 
> What exactly is missing?

From what I can tell, the missing piece is what happens after .move_notify()
is called. According to the documentation, the exporter remains valid, and
the importer is expected to recreate all mappings.

include/linux/dma-buf.h:
  471          * Mappings stay valid and are not directly affected by this callback.
  472          * But the DMA-buf can now be in a different physical location, so all
  473          * mappings should be destroyed and re-created as soon as possible.
  474          *
  475          * New mappings can be created after this callback returns, and will
  476          * point to the new location of the DMA-buf.

Call to dma_buf_move_notify() does not prevent new attachments to that
exporter, while "revoke" does. In the current code, the importer is not aware
that the exporter no longer exists and will continue calling
dma_buf_map_attachment().

In summary, the current implementation allows a single .attach() check but
permits multiple .map_dma_buf() calls. With "revoke", we gain the ability to
block any subsequent .map_dma_buf() operations.

Main use case is VFIO as exporter and IOMMUFD as importer.

Thanks

> 
> Regards,
> Christian.
> 
> > 
> > BTW, see this megathread [1] for additional context.  
> > Ironically, it was posted exactly one year ago.
> > 
> > [1] https://lore.kernel.org/all/20250107142719.179636-2-yilun.xu@linux.intel.com/
> > 
> > Thanks
> > 
> > Cc: linux-rdma@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: kvm@vger.kernel.org
> > Cc: iommu@lists.linux.dev
> > To: Jason Gunthorpe <jgg@ziepe.ca>
> > To: Leon Romanovsky <leon@kernel.org>
> > To: Sumit Semwal <sumit.semwal@linaro.org>
> > To: Christian König <christian.koenig@amd.com>
> > To: Alex Williamson <alex@shazbot.org>
> > To: Kevin Tian <kevin.tian@intel.com>
> > To: Joerg Roedel <joro@8bytes.org>
> > To: Will Deacon <will@kernel.org>
> > To: Robin Murphy <robin.murphy@arm.com>
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> > Leon Romanovsky (4):
> >       dma-buf: Introduce revoke semantics
> >       vfio: Use dma-buf revoke semantics
> >       iommufd: Require DMABUF revoke semantics
> >       iommufd/selftest: Reuse dma-buf revoke semantics
> > 
> >  drivers/dma-buf/dma-buf.c          | 36 ++++++++++++++++++++++++++++++++----
> >  drivers/iommu/iommufd/pages.c      |  2 +-
> >  drivers/iommu/iommufd/selftest.c   | 12 ++++--------
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 27 ++++++---------------------
> >  include/linux/dma-buf.h            | 31 +++++++++++++++++++++++++++++++
> >  5 files changed, 74 insertions(+), 34 deletions(-)
> > ---
> > base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> > change-id: 20251221-dmabuf-revoke-b90ef16e4236
> > 
> > Best regards,
> > --  
> > Leon Romanovsky <leonro@nvidia.com>
> > 
> 
> 
