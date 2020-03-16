Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C4A18744E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 21:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425376E4DD;
	Mon, 16 Mar 2020 20:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8548F6E4DD;
 Mon, 16 Mar 2020 20:55:43 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e6fe7c10000>; Mon, 16 Mar 2020 13:55:30 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 16 Mar 2020 13:55:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 16 Mar 2020 13:55:43 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Mar
 2020 20:55:42 +0000
Subject: Re: [PATCH 1/4] memremap: add an owner field to struct dev_pagemap
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan
 Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-2-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <afaadfde-94b1-5b7d-802b-812b0b448b78@nvidia.com>
Date: Mon, 16 Mar 2020 13:55:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200316193216.920734-2-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1584392130; bh=0aYvPtJbjqch4ne24GuhOWD+PoFcLm231x6U+7kZWAs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=DITaQRakDsVSmGgSZKi1PGUUH+bPNs/QPdDH6im7uTaWf10+4t1ICJeKBx2iGGrjO
 D1Nm4+XFyD1CTkESpqEJCLF5vL6O6R9u4RqmGc6sQkE1lfAn0DcpTCCVa6soJ+nrXj
 47qWJWoqGKXcox8VntW4qx/9NaOhfRYGMtzwQF5Bx3muX+BK1gGKH1b/mORuFsz1gw
 DSW+RtOQ7304OqeICUUdFZqcg71Na861f/VbjiE+o3bFI53V1SgzsCf1SDFF1jhxpH
 NyEgrQwVohlRMiOS7pNX9UKWoLGWUSQC4lnW9zknTBG9RsCtbJHttoiKllzaf6fRzH
 D4VSBo4TyProQ==
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
Cc: kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> Add a new opaque owner field to struct dev_pagemap, which will allow
> the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
> and refuse to work on mappings not owned by the calling entity.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This looks like a reasonable approach to take.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c     | 2 ++
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
>   include/linux/memremap.h               | 4 ++++
>   mm/memremap.c                          | 4 ++++
>   4 files changed, 11 insertions(+)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 79b1202b1c62..67fefb03b9b7 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -779,6 +779,8 @@ int kvmppc_uvmem_init(void)
>   	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
>   	kvmppc_uvmem_pgmap.res = *res;
>   	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
> +	/* just one global instance: */
> +	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
>   	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
>   	if (IS_ERR(addr)) {
>   		ret = PTR_ERR(addr);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 0ad5d87b5a8e..a4682272586e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -526,6 +526,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
>   	drm->dmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
>   	drm->dmem->pagemap.res = *res;
>   	drm->dmem->pagemap.ops = &nouveau_dmem_pagemap_ops;
> +	drm->dmem->pagemap.owner = drm->dev;
>   	if (IS_ERR(devm_memremap_pages(device, &drm->dmem->pagemap)))
>   		goto out_free;
>   
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 6fefb09af7c3..60d97e8fd3c0 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -103,6 +103,9 @@ struct dev_pagemap_ops {
>    * @type: memory type: see MEMORY_* in memory_hotplug.h
>    * @flags: PGMAP_* flags to specify defailed behavior
>    * @ops: method table
> + * @owner: an opaque pointer identifying the entity that manages this
> + *	instance.  Used by various helpers to make sure that no
> + *	foreign ZONE_DEVICE memory is accessed.
>    */
>   struct dev_pagemap {
>   	struct vmem_altmap altmap;
> @@ -113,6 +116,7 @@ struct dev_pagemap {
>   	enum memory_type type;
>   	unsigned int flags;
>   	const struct dev_pagemap_ops *ops;
> +	void *owner;
>   };
>   
>   static inline struct vmem_altmap *pgmap_altmap(struct dev_pagemap *pgmap)
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 09b5b7adc773..9b2c97ceb775 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -181,6 +181,10 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>   			WARN(1, "Missing migrate_to_ram method\n");
>   			return ERR_PTR(-EINVAL);
>   		}
> +		if (!pgmap->owner) {
> +			WARN(1, "Missing owner\n");
> +			return ERR_PTR(-EINVAL);
> +		}
>   		break;
>   	case MEMORY_DEVICE_FS_DAX:
>   		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
