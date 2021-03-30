Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57834E799
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 14:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57A26E8C6;
	Tue, 30 Mar 2021 12:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800C76E8C4;
 Tue, 30 Mar 2021 12:40:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E982E60232;
 Tue, 30 Mar 2021 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617108015;
 bh=IX2YifXUPutEwODCiJ5FkZ7svmqC2sPBx3924aa48Yg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWgQteGwA5KJlS2JEm1DqLRTwpQa9MxXWOIN5GJCMFtjX0INuGG/yNdjsVWCFpiYJ
 oxPSJpF11duop8M2scavelMol6/AT8NTEQVpD99bNW9C8YnpWrW5SilD7uovqWEsBw
 9NXGPUDX+nSIkkaLAjXvH1N0TCwIw2ZKe5EClUtTpNYe36xPYxZpRn+GOishndd0RZ
 XkYFeNPS5aTR5cbmGiWYvlLf/h/vfoDZLBLAT/a/UKQp/8Kfhx8IIcqRyN0qW/Vx0V
 DJqO0c48Fq0jOR6T0u+2L2HLBIx3MQrqTW4L44QcFkRIAs0f/QJTlssAZuY9kevdw9
 EsfSKgPiTPvmQ==
Date: Tue, 30 Mar 2021 13:40:09 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/18] iommu/fsl_pamu: remove ->domain_window_enable
Message-ID: <20210330124009.GF5908@willie-the-truck>
References: <20210316153825.135976-1-hch@lst.de>
 <20210316153825.135976-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316153825.135976-7-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 16, 2021 at 04:38:12PM +0100, Christoph Hellwig wrote:
> The only thing that fsl_pamu_window_enable does for the current caller
> is to fill in the prot value in the only dma_window structure, and to
> propagate a few values from the iommu_domain_geometry struture into the
> dma_window.  Remove the dma_window entirely, hardcode the prot value and
> otherwise use the iommu_domain_geometry structure instead.
> 
> Remove the now unused ->domain_window_enable iommu method.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Li Yang <leoyang.li@nxp.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c     | 182 +++-------------------------
>  drivers/iommu/fsl_pamu_domain.h     |  17 ---
>  drivers/iommu/iommu.c               |  11 --
>  drivers/soc/fsl/qbman/qman_portal.c |   7 --
>  include/linux/iommu.h               |  17 ---
>  5 files changed, 14 insertions(+), 220 deletions(-)
> 
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index e6bdd38fc18409..fd2bc88b690465 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -54,34 +54,18 @@ static int __init iommu_init_mempool(void)
>  	return 0;
>  }
>  
> -static phys_addr_t get_phys_addr(struct fsl_dma_domain *dma_domain, dma_addr_t iova)
> -{
> -	struct dma_window *win_ptr = &dma_domain->win_arr[0];
> -	struct iommu_domain_geometry *geom;
> -
> -	geom = &dma_domain->iommu_domain.geometry;
> -
> -	if (win_ptr->valid)
> -		return win_ptr->paddr + (iova & (win_ptr->size - 1));
> -
> -	return 0;
> -}
> -
>  /* Map the DMA window corresponding to the LIODN */
>  static int map_liodn(int liodn, struct fsl_dma_domain *dma_domain)
>  {
>  	int ret;
> -	struct dma_window *wnd = &dma_domain->win_arr[0];
> -	phys_addr_t wnd_addr = dma_domain->iommu_domain.geometry.aperture_start;
> +	struct iommu_domain_geometry *geom = &dma_domain->iommu_domain.geometry;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&iommu_lock, flags);
> -	ret = pamu_config_ppaace(liodn, wnd_addr,
> -				 wnd->size,
> -				 ~(u32)0,
> -				 wnd->paddr >> PAMU_PAGE_SHIFT,
> -				 dma_domain->snoop_id, dma_domain->stash_id,
> -				 wnd->prot);
> +	ret = pamu_config_ppaace(liodn, geom->aperture_start,
> +				 geom->aperture_end - 1, ~(u32)0,

You're passing 'geom->aperture_end - 1' as the size here, but the old code
seemed to _add_ 1:

> -static int fsl_pamu_window_enable(struct iommu_domain *domain, u32 wnd_nr,
> -				  phys_addr_t paddr, u64 size, int prot)
> -{
> -	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
> -	struct dma_window *wnd;
> -	int pamu_prot = 0;
> -	int ret;
> -	unsigned long flags;
> -	u64 win_size;
> -
> -	if (prot & IOMMU_READ)
> -		pamu_prot |= PAACE_AP_PERMS_QUERY;
> -	if (prot & IOMMU_WRITE)
> -		pamu_prot |= PAACE_AP_PERMS_UPDATE;
> -
> -	spin_lock_irqsave(&dma_domain->domain_lock, flags);
> -	if (wnd_nr > 0) {
> -		pr_debug("Invalid window index\n");
> -		spin_unlock_irqrestore(&dma_domain->domain_lock, flags);
> -		return -EINVAL;
> -	}
> -
> -	win_size = (domain->geometry.aperture_end + 1) >> ilog2(1);

here ^^ when calculating the exclusive upper bound. In other words, I think
'1ULL << 36' used to get passed to pamu_config_ppaace(). Is that an
intentional change?

Will
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
