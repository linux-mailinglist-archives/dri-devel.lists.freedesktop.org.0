Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C649AB14080
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 18:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616B10E542;
	Mon, 28 Jul 2025 16:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B+keFTh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8679B10E542
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 16:41:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 66B4CA53E34;
 Mon, 28 Jul 2025 16:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E4FC4CEE7;
 Mon, 28 Jul 2025 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753720902;
 bh=7x0ZgIgFMhmGblvNn1rp9l0J3jLs/NKo357QqFEU40c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B+keFTh/H3uyJm+2CRXywKicPx1XFBBkxeKmrZZbdSdo7TbhwSKWM+9PVaAkV/Ggd
 rdbs8jBkHbT/8OTgeGMPL4gfUOW2ABlcD8WUcg8AnFQUJTXwNmVXpc6MVeqX+1gX/B
 Hl4YyyFNqJKjrMehvwoAGQununhgEiDlRgPJ4pHhRsT2e9nnS0dUD7g029zGYqMvz0
 +n1X/yXScSmTwLjOGstVCV5NVXNowOdBanEpgP5gJZIZzUwp2PqhdbrI1ndD1ANzQ6
 U3SK+z5/iiu7H8t8oy3Nyrh+r+SHqvFdQXzv1CHbtq87l4SZmHe8/P8OoUYzv0vSLF
 T/9RjFtCR33XQ==
Date: Mon, 28 Jul 2025 19:41:36 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Alex Williamson <alex.williamson@redhat.com>,
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
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 05/10] PCI/P2PDMA: Export pci_p2pdma_map_type() function
Message-ID: <20250728164136.GD402218@unreal>
References: <cover.1753274085.git.leonro@nvidia.com>
 <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
 <b32ae619-6c4a-46fc-a368-6ad4e245d581@deltatee.com>
 <20250727190514.GG7551@nvidia.com>
 <d69e0d74-285e-4cde-a2e4-a803accfa9e1@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d69e0d74-285e-4cde-a2e4-a803accfa9e1@deltatee.com>
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

On Mon, Jul 28, 2025 at 10:12:31AM -0600, Logan Gunthorpe wrote:
> 
> 
> On 2025-07-27 13:05, Jason Gunthorpe wrote:
> > On Fri, Jul 25, 2025 at 10:30:46AM -0600, Logan Gunthorpe wrote:
> >>
> >>
> >> On 2025-07-24 02:13, Leon Romanovsky wrote:
> >>> On Thu, Jul 24, 2025 at 10:03:13AM +0200, Christoph Hellwig wrote:
> >>>> On Wed, Jul 23, 2025 at 04:00:06PM +0300, Leon Romanovsky wrote:
> >>>>> From: Leon Romanovsky <leonro@nvidia.com>
> >>>>>
> >>>>> Export the pci_p2pdma_map_type() function to allow external modules
> >>>>> and subsystems to determine the appropriate mapping type for P2PDMA
> >>>>> transfers between a provider and target device.
> >>>>
> >>>> External modules have no business doing this.
> >>>
> >>> VFIO PCI code is built as module. There is no way to access PCI p2p code
> >>> without exporting functions in it.
> >>
> >> The solution that would make more sense to me would be for either
> >> dma_iova_try_alloc() or another helper in dma-iommu.c to handle the
> >> P2PDMA case.
> > 
> > This has nothing to do with dma-iommu.c, the decisions here still need
> > to be made even if dma-iommu.c is not compiled in.
> 
> Doesn't it though? Every single call in patch 10 to the newly exported
> PCI functions calls into the the dma-iommu functions. If there were
> non-iommu paths then I would expect the code would use the regular DMA
> api directly which would then call in to dma-iommu.

If p2p type is PCI_P2PDMA_MAP_BUS_ADDR, there will no dma-iommu and DMA
at all.

+static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
+				   struct dma_buf_attachment *attachment)
+{
+	struct vfio_pci_dma_buf *priv = dmabuf->priv;
+
+	if (!attachment->peer2peer)
+		return -EOPNOTSUPP;
+
+	if (priv->revoked)
+		return -ENODEV;
+
+	switch (pci_p2pdma_map_type(priv->vdev->provider, attachment->dev)) {
+	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
+		break;
+	case PCI_P2PDMA_MAP_BUS_ADDR:
+		/*
+		 * There is no need in IOVA at all for this flow.
+		 * We rely on attachment->priv == NULL as a marker
+		 * for this mode.
+		 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+
+	attachment->priv = kzalloc(sizeof(struct dma_iova_state), GFP_KERNEL);
+	if (!attachment->priv)
+		return -ENOMEM;
+
+	dma_iova_try_alloc(attachment->dev, attachment->priv, 0, priv->phys_vec.len);
+	return 0;
+}
