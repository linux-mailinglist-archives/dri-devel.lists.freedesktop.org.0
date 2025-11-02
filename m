Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06937C290E0
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 16:13:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B5410E0E5;
	Sun,  2 Nov 2025 15:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CT9wGfoA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D6D10E0E5
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 15:13:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3ADB438F0;
 Sun,  2 Nov 2025 15:13:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAABBC4CEF7;
 Sun,  2 Nov 2025 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762096380;
 bh=tizBF6oQAn/Y3qWcygtT9HOK6tA8tcWjX6+eHwzztHc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CT9wGfoAiCv2vOtEIQkZsX5as/tdAoLN3LndZfBArHXUFA/Zw6aiiZ8s7L1ItFwnS
 J44TfxOhI/HBSPQzjPfDdOnuTocQGDHYR0rQS/QWk/RFyc2i6YnIcrq0bR37G55zSN
 cRUJYZHLWZuU9uME66gb8xkP50ARR5vellQ8rh2cps+8y1z5a6FXx1Bm7+UKl4xykw
 BKzX1CHLdgL5P2L7bHPJvSRCjuzG6pnNETHYekFTtAy6gY2hQ8xQ2LYlmtydkaNOmU
 IDJqI0JxojL60OTRm80nOQSmOqRXrUZh51uEpe4MhDqcBvu3YYEuSQHoFo9Sv5xLDN
 7aBCzDPV1VG1g==
Date: Sun, 2 Nov 2025 17:12:53 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Alex Williamson <alex@shazbot.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251102151253.GA50752@unreal>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <20251102-dmabuf-vfio-v6-10-d773cff0db9f@nvidia.com>
 <20251102080137.209aa567@shazbot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102080137.209aa567@shazbot.org>
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

On Sun, Nov 02, 2025 at 08:01:37AM -0700, Alex Williamson wrote:
> On Sun,  2 Nov 2025 10:00:58 +0200
> Leon Romanovsky <leon@kernel.org> wrote:
> > @@ -2391,6 +2403,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> >  				      struct iommufd_ctx *iommufd_ctx)
> >  {
> >  	struct vfio_pci_core_device *vdev;
> > +	bool restore_revoke = false;
> >  	struct pci_dev *pdev;
> >  	int ret;
> >  
> > @@ -2459,6 +2472,8 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> >  			break;
> >  		}
> >  
> > +		vfio_pci_dma_buf_move(vdev, true);
> > +		restore_revoke = true;
> >  		vfio_pci_zap_bars(vdev);
> >  	}
> >  
> > @@ -2486,6 +2501,12 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
> >  			       struct vfio_pci_core_device, vdev.dev_set_list);
> >  
> >  err_undo:
> > +	if (restore_revoke) {
> > +		list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
> > +			if (__vfio_pci_memory_enabled(vdev))
> > +				vfio_pci_dma_buf_move(vdev, false);
> > +	}
> > +
> >  	list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
> >  					 vdev.dev_set_list)
> 
> We don't need the separate loop or flag, and adding it breaks the
> existing reverse list walk.  Thanks,

Do you want me to send v7? I have a feeling that v6 is good to be merged.

Thanks

diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 24204893e221..51a3bcc26f8b 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -2403,7 +2403,6 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
                                      struct iommufd_ctx *iommufd_ctx)
 {
        struct vfio_pci_core_device *vdev;
-       bool restore_revoke = false;
        struct pci_dev *pdev;
        int ret;
 
@@ -2473,7 +2472,6 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
                }
 
                vfio_pci_dma_buf_move(vdev, true);
-               restore_revoke = true;
                vfio_pci_zap_bars(vdev);
        }
 
@@ -2501,15 +2499,12 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
                               struct vfio_pci_core_device, vdev.dev_set_list);
 
 err_undo:
-       if (restore_revoke) {
-               list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
-                       if (__vfio_pci_memory_enabled(vdev))
-                               vfio_pci_dma_buf_move(vdev, false);
-       }
-
        list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
-                                        vdev.dev_set_list)
+                                        vdev.dev_set_list) {
+               if (__vfio_pci_memory_enabled(vdev))
+                       vfio_pci_dma_buf_move(vdev, false);
                up_write(&vdev->memory_lock);
+       }
 
        list_for_each_entry(vdev, &dev_set->device_list, vdev.dev_set_list)
                pm_runtime_put(&vdev->pdev->dev);


> 
> Alex
> 
