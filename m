Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA01D3B58C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 19:23:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467210E1CB;
	Mon, 19 Jan 2026 18:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kODgE/7I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2980210E1CB;
 Mon, 19 Jan 2026 18:23:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C747843845;
 Mon, 19 Jan 2026 18:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104A7C116C6;
 Mon, 19 Jan 2026 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768846985;
 bh=Lii9Wo3zMBgNZu8BfSOY2bf+6SIZLbGpUqMsnL7Mo1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kODgE/7I98Q5Jmc8h+EJtQ/PsgbfKxiuG7+i/OKTqySamVeiXJ1ev5n9Tu8e8+7Am
 eWcBTByTaCuS0pN4zKkZls5MedNPAn4I+Hsbq1SmcbRlCuZl8IS6k6KUcZhOQ5cwPq
 QEvQx8PMi6vRf/Cyws5p8kXrMKU7fcqSObgUcH6YasVT8Do8FUt//3CHGrsQYSZI57
 JjtDLmYAxiJIjWc5xqiuIHK7ya1LGuV3tOBOZ43uv2pzg/gzqVH+Fg7JPomEkrSv71
 pD+WzkHxHEeR8S/rk6YdY1H6mMFPgde202sJs+pg6vR5YElq7bO8BTz55Zfg/qynqM
 P7D/uGSD1I3oQ==
Date: Mon, 19 Jan 2026 20:23:00 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iommufd: Require DMABUF revoke semantics
Message-ID: <20260119182300.GO13201@unreal>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
 <20260119165951.GI961572@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119165951.GI961572@ziepe.ca>
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

On Mon, Jan 19, 2026 at 12:59:51PM -0400, Jason Gunthorpe wrote:
> On Sun, Jan 18, 2026 at 02:08:47PM +0200, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> > 
> > IOMMUFD does not support page fault handling, and after a call to
> > .invalidate_mappings() all mappings become invalid. Ensure that
> > the IOMMUFD DMABUF importer is bound to a revoke‑aware DMABUF exporter
> > (for example, VFIO).
> > 
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >  drivers/iommu/iommufd/pages.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> > index 76f900fa1687..a5eb2bc4ef48 100644
> > --- a/drivers/iommu/iommufd/pages.c
> > +++ b/drivers/iommu/iommufd/pages.c
> > @@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
> >  		mutex_unlock(&pages->mutex);
> >  	}
> >  
> > -	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > +	rc = dma_buf_pin(attach);
> >  	if (rc)
> >  		goto err_detach;
> >  
> > +	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> > +	if (rc)
> > +		goto err_unpin;
> > +
> >  	dma_resv_unlock(dmabuf->resv);
> >  
> >  	/* On success iopt_release_pages() will detach and put the dmabuf. */
> >  	pages->dmabuf.attach = attach;
> >  	return 0;
> 
> Don't we need an explicit unpin after unmapping?

Yes, but this patch is going to be dropped in v3 because of this
suggestion.
https://lore.kernel.org/all/a397ff1e-615f-4873-98a9-940f9c16f85c@amd.com

Thanks


> 
> Jason
