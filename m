Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A8248012
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 09:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBAA89CB9;
	Tue, 18 Aug 2020 07:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5029489CA0;
 Tue, 18 Aug 2020 07:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZs8fIUbZD7GbH+Wq+6a5fpD6XsRqDl8h3dY4m1woQBlu19iIha4EiWF9Kdm+1hg0im+r5Di/6K6hcEZJ7ZSVRRKtAma+/2zRpOyoUhHvT5aFDCmYfL6y2go7sWo6p7mjU7rmepCzBYwMUt4TEdXJft6cBhvgUG4XGXS+uLuJmC9wHzPFY2iWzPOjrSvcKz9Py7WWNuR85YWw5F2iKmnvhfmEJzx09a931xBisP/7M3qbjUq6kWy8O7fAEKx+jQai7jcYaesFMjUqvdoxVE06cyZKFMAjvfWN9m7Es2z2SwkIQQChJlIs5fBvFilIAVwgSjQAFThXqbWHi++ILINjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EK3lX3GavvNjO3+ZjPDvyQVZn6K0CH5jRYSdwxdRs8=;
 b=fE3zIDS4LX2Ku9CxkxQjK1CKVhYq3m0Zjoo4ZLh8V4MDhYiHKCzR2KTCtQLNX9AmaDmHWEwi8iyE5nfCtx9WX52QHH76kvFbn68wIYd1jYID8yVLWV8z2x9spyjpRSNQ172ZxRT8kM68dWuDH8sXAE4ICxrXrPAnGTu8i/QAh8uAfj66kpnaUc9Gd89rGimUNgZ+g/gNLv8RVURsDZb4X05YzVY0RfuX70Xits8o/KSS6AHxSN4WH4zHt+pAx1bAdfQLAOMGmrpZkz4YS4DKztNA2lVXf1gfYfyYkiAltc9lWxdab63bNkqtbN8iAJY9hQygMbNazReCWpyDHZNFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EK3lX3GavvNjO3+ZjPDvyQVZn6K0CH5jRYSdwxdRs8=;
 b=zbCYQdEVC3hKC33YhhQECD43R9+w4pQ4Nq8irQ4eXhiYboCF7Ps372F/ysmOC8EagGhR/QDnUrPE9Qs9YNsQ6GWagmwpK0TDLMudkeF6Ftt6p3RHpRjHp1l5OrNxBmdx74ZKayKgsyjuXNckBLTsbTT5SumN1Zvm8Gzpf8AzRyI=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Tue, 18 Aug
 2020 07:58:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 07:58:06 +0000
Subject: Re: [PATCH 1/2] drm: allow limiting the scatter list size.
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
Date: Tue, 18 Aug 2020 09:57:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200818074828.9509-2-kraxel@redhat.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:208:1::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:208:1::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.15 via Frontend Transport; Tue, 18 Aug 2020 07:58:02 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36acc88a-ea0c-4a23-69c9-08d8434c7067
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36969E49B6CBE62456F3C3FF835C0@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJICQZ3vvUC4qYRzVNIOVqMXwL/+LNv5lZtjFzTQjNwObH0kgjsE7yvI2pxg4XO5NBuwnR7kd3VESzYYGrad9apkwXaN69Hg75mKzwJbp4nOqNpOZGtve4KZEfzl8GtCiwL2tyJqPuyo5iXRIVJSxx/HMRSobk+JfFm2SLbNIwMFYUwo6eJeD/WckmWYC86bgM6Iu559vakJ4aAZMixOM3IY+sTfcWjtO1/fn7EvgwtAlJPpVzSZO0H1U2gF1lytAGJPedJKLftV+d26QTVaNYJwYISy2IMpyhxwcOZKhEq9kNwlNB590qR2H4sBoRAApHJoMxIFPJTp/hgfe8CY0OKUFDaAQBEXPrz6j8rRs8Z1M6Ai2U/5snLsd2ENMfCF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(31696002)(186003)(8676002)(478600001)(2616005)(86362001)(52116002)(66476007)(83380400001)(66556008)(66946007)(54906003)(8936002)(31686004)(5660300002)(316002)(36756003)(16526019)(4326008)(7416002)(2906002)(6666004)(30864003)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 09Pu6O3+2dUkDSYKZtIndy6NYcL9CdYi/HAycGaO4ooDsRNLJg0RJxl6jmYSi1bX0o4mDR0IMW7IAz+6pbjkSGVzK6g26HcOLzr1RT/fs5J/F4HbZz8y5SKDv2gcI7Jg3GPV8N146v7po4R4DrZITRZqrQe/QAUdmNQtLUfTs3gt3xDElNe8T09Rv7j2SGDoYOH/UvnIxNv8VNqG6TQzVhUGDqxpjoRo8h8HpEQCZ607DbpyhW23gK6tmnxSBTng/sC6f+T6IMEc4Y+zdDSqv1UJxG5NeHyrNHBPFyaI9GE30uI350ZEuP+xUiMbWOUOHNlC4R5ME60+iq6sbpHExL/zQQvIq9sSBFiIFoPS1nGI4GQ1ztAgvUPpIdTi+u8YPebhrYUMbu6XrDGpbU1DyWByO9i38lEJNhX5JiP8gX9QF1oO7HSebvPcIho3qvj0sNhtLFCkaXG1yL0ijQY9RmozJmQbd2XRiSlsQOb2V3cuZWsIW+czaZ7Oyci9XiE/HWAU15iCBkcPsOTZEYNb6c73N2I5qesFpIYWpnxlYKDyxhEMnwAGxnK6k5L8TZP4q5ItU4HutfU+uPHIRChEKMIJ/to7Tgb71yxf4u7SMshFRfbmm533e0ZWWDmzHnldBl5n0rrTpXEK8pGYa15EcSf6LHUkZYLaQGe3itrAbIAQSEzVdsv5gRcRgiaEkVRPsJurA7FUHwJA1hUgxX6fIQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36acc88a-ea0c-4a23-69c9-08d8434c7067
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 07:58:05.8774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4VJmiF3KGPP5fNKMfyzPdSkIDfSPdlh7Bt+1JDU+qYuLI5f6uclcHajsFQnLHmO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.08.20 um 09:48 schrieb Gerd Hoffmann:
> Add max_segment argument to drm_prime_pages_to_sg().  When set pass it
> through to the __sg_alloc_table_from_pages() call, otherwise use
> SCATTERLIST_MAX_SEGMENT.
>
> Also add max_segment field to gem objects and pass it to
> drm_prime_pages_to_sg() calls in drivers and helpers.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

I'm missing an explanation why this should be useful (it certainly is).

And the maximum segment size seems misplaced in the GEM object. This is 
usually a property of the device or even completely constant.

Christian.

> ---
>   include/drm/drm_gem.h                       |  8 ++++++++
>   include/drm/drm_prime.h                     |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  3 ++-
>   drivers/gpu/drm/drm_gem_shmem_helper.c      |  3 ++-
>   drivers/gpu/drm/drm_prime.c                 | 10 +++++++---
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  3 ++-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 ++-
>   drivers/gpu/drm/msm/msm_gem.c               |  3 ++-
>   drivers/gpu/drm/msm/msm_gem_prime.c         |  3 ++-
>   drivers/gpu/drm/nouveau/nouveau_prime.c     |  3 ++-
>   drivers/gpu/drm/radeon/radeon_prime.c       |  3 ++-
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  6 ++++--
>   drivers/gpu/drm/tegra/gem.c                 |  3 ++-
>   drivers/gpu/drm/vgem/vgem_drv.c             |  3 ++-
>   drivers/gpu/drm/xen/xen_drm_front_gem.c     |  3 ++-
>   15 files changed, 43 insertions(+), 17 deletions(-)
>
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 337a48321705..dea5e92e745b 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -241,6 +241,14 @@ struct drm_gem_object {
>   	 */
>   	size_t size;
>   
> +	/**
> +	 * @max_segment:
> +	 *
> +	 * Max size for scatter list segments.  When unset the default
> +	 * (SCATTERLIST_MAX_SEGMENT) is used.
> +	 */
> +	size_t max_segment;
> +
>   	/**
>   	 * @name:
>   	 *
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 9af7422b44cf..2c3689435cb4 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -88,7 +88,8 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
>   int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>   int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
>   
> -struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages);
> +struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages,
> +				       size_t max_segment);
>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>   				     int flags);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 519ce4427fce..5e8a9760b33f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -303,7 +303,8 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
>   	switch (bo->tbo.mem.mem_type) {
>   	case TTM_PL_TT:
>   		sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages,
> -					    bo->tbo.num_pages);
> +					    bo->tbo.num_pages,
> +					    obj->max_segment);
>   		if (IS_ERR(sgt))
>   			return sgt;
>   
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 4b7cfbac4daa..cfb979d808fd 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -656,7 +656,8 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj)
>   
>   	WARN_ON(shmem->base.import_attach);
>   
> -	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT);
> +	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT,
> +				     obj->max_segment);
>   }
>   EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>   
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1693aa7c14b5..27c783fd6633 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -802,7 +802,8 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>    *
>    * This is useful for implementing &drm_gem_object_funcs.get_sg_table.
>    */
> -struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages)
> +struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages,
> +				       size_t max_segment)
>   {
>   	struct sg_table *sg = NULL;
>   	int ret;
> @@ -813,8 +814,11 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
>   		goto out;
>   	}
>   
> -	ret = sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> -				nr_pages << PAGE_SHIFT, GFP_KERNEL);
> +	if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
> +		max_segment = SCATTERLIST_MAX_SEGMENT;
> +	ret = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
> +					  nr_pages << PAGE_SHIFT,
> +					  max_segment, GFP_KERNEL);
>   	if (ret)
>   		goto out;
>   
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index f06e19e7be04..e5b6e7996f80 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -103,7 +103,8 @@ struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>   		int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
>   		struct sg_table *sgt;
>   
> -		sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
> +		sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages,
> +					    etnaviv_obj->base.max_segment);
>   		if (IS_ERR(sgt)) {
>   			dev_err(dev->dev, "failed to allocate sgt: %ld\n",
>   				PTR_ERR(sgt));
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 6d9e5c3c4dd5..f327676450bd 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -19,7 +19,8 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
>   		return ERR_PTR(-EINVAL);
>   
> -	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
> +	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages,
> +				     obj->max_segment);
>   }
>   
>   void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index b2f49152b4d4..f805419bb84a 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -126,7 +126,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
>   
>   		msm_obj->pages = p;
>   
> -		msm_obj->sgt = drm_prime_pages_to_sg(p, npages);
> +		msm_obj->sgt = drm_prime_pages_to_sg(p, npages,
> +						     obj->max_segment);
>   		if (IS_ERR(msm_obj->sgt)) {
>   			void *ptr = ERR_CAST(msm_obj->sgt);
>   
> diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
> index d7c8948427fe..a5a412564c7f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_prime.c
> +++ b/drivers/gpu/drm/msm/msm_gem_prime.c
> @@ -19,7 +19,8 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
>   		return NULL;
>   
> -	return drm_prime_pages_to_sg(msm_obj->pages, npages);
> +	return drm_prime_pages_to_sg(msm_obj->pages, npages,
> +				     obj->max_segment);
>   }
>   
>   void *msm_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index bae6a3eccee0..56a2e916d51a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -32,7 +32,8 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
>   	int npages = nvbo->bo.num_pages;
>   
> -	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages);
> +	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages,
> +				     obj->max_segment);
>   }
>   
>   void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
> index b906e8fbd5f3..503e35625045 100644
> --- a/drivers/gpu/drm/radeon/radeon_prime.c
> +++ b/drivers/gpu/drm/radeon/radeon_prime.c
> @@ -36,7 +36,8 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	struct radeon_bo *bo = gem_to_radeon_bo(obj);
>   	int npages = bo->tbo.num_pages;
>   
> -	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages);
> +	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages,
> +				     obj->max_segment);
>   }
>   
>   void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index b9275ba7c5a5..444657e03c16 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -85,7 +85,8 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
>   
>   	rk_obj->num_pages = rk_obj->base.size >> PAGE_SHIFT;
>   
> -	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
> +	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages,
> +					    rk_obj->base.max_segment);
>   	if (IS_ERR(rk_obj->sgt)) {
>   		ret = PTR_ERR(rk_obj->sgt);
>   		goto err_put_pages;
> @@ -442,7 +443,8 @@ struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
>   	int ret;
>   
>   	if (rk_obj->pages)
> -		return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
> +		return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages,
> +					     obj->max_segment);
>   
>   	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>   	if (!sgt)
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index 723df142a981..8d98b02a8d21 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -284,7 +284,8 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
>   
>   	bo->num_pages = bo->gem.size >> PAGE_SHIFT;
>   
> -	bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages);
> +	bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages,
> +					bo->gem.max_segment);
>   	if (IS_ERR(bo->sgt)) {
>   		err = PTR_ERR(bo->sgt);
>   		goto put_pages;
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 313339bbff90..d25c93b5a2c1 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -321,7 +321,8 @@ static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_object *obj)
>   {
>   	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
>   
> -	return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT);
> +	return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT,
> +				     obj->max_segment);
>   }
>   
>   static struct drm_gem_object* vgem_prime_import(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> index f0b85e094111..362fe5311b1b 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
> @@ -179,7 +179,8 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
>   	if (!xen_obj->pages)
>   		return ERR_PTR(-ENOMEM);
>   
> -	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages);
> +	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages,
> +				     gem_obj->max_segment);
>   }
>   
>   struct drm_gem_object *

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
