Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80302512FA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026296E86D;
	Tue, 25 Aug 2020 07:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 8843 seconds by postgrey-1.36 at gabe;
 Tue, 25 Aug 2020 00:07:43 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B296E039
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 00:07:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OLdsPY046027;
 Mon, 24 Aug 2020 16:39:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598305194;
 bh=bf+6mDZifTI9HQJSeivn4me8d5zREYk1XPJ3eAaDXHY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tJ6RhK6wvGyEiAhqwOPDwT69Y3+7BoJNjgEuOOW+0PGCMSlzIrjy7T2GrEFwuAAcZ
 51c8X4oGyc7X5b+1hxYLGjFw1iyT+DGwI6G2Whe/r0fmJRG1pX1zZGWT3yn2053eaa
 4Szann3xS0X39D0KAerooEYGEMuFIf1zy1xME1pQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07OLdr7q044652
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Aug 2020 16:39:53 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 16:39:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 16:39:53 -0500
Received: from [10.250.32.171] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OLdqBH090259;
 Mon, 24 Aug 2020 16:39:52 -0500
Subject: Re: [PATCH 11/18] iommu/omap: Add IOMMU_DOMAIN_DMA support
To: Robin Murphy <robin.murphy@arm.com>, <hch@lst.de>, <joro@8bytes.org>,
 <linux@armlinux.org.uk>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <5ac3788f9f61f7698cfa9c5924d62714e230f678.1597931876.git.robin.murphy@arm.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <c98765ad-e824-a54c-7cf8-c245dbf960d3@ti.com>
Date: Mon, 24 Aug 2020 16:39:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5ac3788f9f61f7698cfa9c5924d62714e230f678.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, will@kernel.org,
 m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,

On 8/20/20 10:08 AM, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/omap-iommu.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 71f29c0927fc..ea25c2fe0418 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -9,6 +9,7 @@
>   *		Paul Mundt and Toshihiro Kobayashi
>   */
>  
> +#include <linux/dma-iommu.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> @@ -1574,13 +1575,19 @@ static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
>  {
>  	struct omap_iommu_domain *omap_domain;
>  
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> +	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>  		return NULL;
>  
>  	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
>  	if (!omap_domain)
>  		return NULL;
>  
> +	if (type == IOMMU_DOMAIN_DMA &&
> +	    iommu_get_dma_cookie(&omap_domain->domain)) {
> +		kfree(omap_domain);
> +		return NULL;
> +	}
> +
>  	spin_lock_init(&omap_domain->lock);
>  
>  	omap_domain->domain.geometry.aperture_start = 0;
> @@ -1601,6 +1608,7 @@ static void omap_iommu_domain_free(struct iommu_domain *domain)
>  	if (omap_domain->dev)
>  		_omap_iommu_detach_dev(omap_domain, omap_domain->dev);
>  
> +	iommu_put_dma_cookie(&omap_domain->domain);
>  	kfree(omap_domain);
>  }
>  
> @@ -1736,6 +1744,17 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
>  	return group;
>  }
>  
> +static int omap_iommu_of_xlate(struct device *dev,
> +			       struct of_phandle_args *args)
> +{
> +	/*
> +	 * Logically, some of the housekeeping from _omap_iommu_add_device()
> +	 * should probably move here, but the minimum we *need* is simply to
> +	 * cooperate with of_iommu at all to let iommu-dma work.
> +	 */
> +	return 0;
> +}
> +

I have tested this series, and it is breaking the OMAP remoteproc functionality.
We definitely need some more plumbing. I am currently getting MMU faults and
also the DMA allocated addresses are not coming from the device-specific CMA
pools (opposite of what Sakari has reported with OMAP3 ISP). Just removing the
of_xlate gets me back the expected allocations, and no MMU faults, but I don't
see any valid traces.

The MMU devices that the OMAP IOMMU driver deals with are not traditional
bus-level IOMMU devices, but local MMU devices that are present within a remote
processor sub-system or hardware accelerator (eg: OMAP3 ISP). The usage is also
slightly different between remoteprocs and OMAP3 ISP. The former uses the CMA
pools and iommu_map/unmap API (UNMANAGED iommu domain), as the allocated regions
need to be mapped using specific device addresses adhering to the firmware
linker map, while OMAP3 ISP uses it like a traditional DMA pool.

regards
Suman

>  static const struct iommu_ops omap_iommu_ops = {
>  	.domain_alloc	= omap_iommu_domain_alloc,
>  	.domain_free	= omap_iommu_domain_free,
> @@ -1747,6 +1766,7 @@ static const struct iommu_ops omap_iommu_ops = {
>  	.probe_device	= omap_iommu_probe_device,
>  	.release_device	= omap_iommu_release_device,
>  	.device_group	= omap_iommu_device_group,
> +	.of_xlate	= omap_iommu_of_xlate,
>  	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
>  };
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
