Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC541D4641
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADD86EBDD;
	Fri, 15 May 2020 06:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Wed, 13 May 2020 09:12:33 UTC
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5B76E9D8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:12:33 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 63BBB46A; Wed, 13 May 2020 11:03:22 +0200 (CEST)
Date: Wed, 13 May 2020 11:03:21 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 03/38] iommu: add generic helper for mapping sgtable
 objects
Message-ID: <20200513090320.GH9820@8bytes.org>
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090108eucas1p2168167ab5e1de09df0d5def83f64dbfe@eucas1p2.samsung.com>
 <20200512090058.14910-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512090058.14910-3-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Tue, May 12, 2020 at 11:00:23AM +0200, Marek Szyprowski wrote:
> ---
>  include/linux/iommu.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Some nits below, with those fixed:

	Acked-by: Joerg Roedel <jroedel@suse.de>

> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 7cfd2dd..ba662ba 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -478,6 +478,22 @@ extern size_t iommu_map_sg_atomic(struct iommu_domain *domain,
>  extern void iommu_set_fault_handler(struct iommu_domain *domain,
>  			iommu_fault_handler_t handler, void *token);
>  
> +/**
> + * iommu_map_sgtable - Map the given buffer to the IOMMU domain
> + * @domain:	The IOMMU domain to perfor
                                    ^^^^^^ Truncated comment?
> + * @iova:	The start addrees to map the buffer
                          ^^^^^^^ Typo

> + * @sgt:	The sg_table object describing the buffer
> + * @prot:	IOMMU protection bits
> + *
> + * Create a mapping at @iova for the buffer described by a scatterlist
> + * stored in the given sg_table object in the provided IOMMU domain.
> + */
> +static inline size_t iommu_map_sgtable(struct iommu_domain *domain,
> +			unsigned long iova, struct sg_table *sgt, int prot)
> +{
> +	return iommu_map_sg(domain, iova, sgt->sgl, sgt->orig_nents, prot);
> +}
> +
>  extern void iommu_get_resv_regions(struct device *dev, struct list_head *list);
>  extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
>  extern void generic_iommu_put_resv_regions(struct device *dev,
> -- 
> 1.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
