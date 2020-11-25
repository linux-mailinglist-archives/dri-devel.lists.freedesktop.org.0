Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC892C5048
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A46E85E;
	Thu, 26 Nov 2020 08:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A61616EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 14:56:29 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbe709f0002>; Wed, 25 Nov 2020 06:56:31 -0800
Received: from [172.27.12.45] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 14:56:16 +0000
Subject: Re: [PATCH v12 4/4] RDMA/mlx5: Support dma-buf based userspace memory
 region
To: Jianxin Xiong <jianxin.xiong@intel.com>
References: <1606253750-67057-1-git-send-email-jianxin.xiong@intel.com>
 <1606253750-67057-5-git-send-email-jianxin.xiong@intel.com>
From: Yishai Hadas <yishaih@nvidia.com>
Message-ID: <89218a55-9dc1-4f62-b4d6-47692158608a@nvidia.com>
Date: Wed, 25 Nov 2020 16:56:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <1606253750-67057-5-git-send-email-jianxin.xiong@intel.com>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606316191; bh=4Z8WR93xziByjfx5G5ZPozLFdvFNpoNHm75oXcOXrQI=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=WIHnUYVdh4Ov0IEQW1Bz8+K9Ht4QViMP7yaH+4JwJ2gjE3EH361NlxsQ0cKVfPDrZ
 0EPlcCulrCOI3PpILbFK4/Za5MriBPbjeJb28gvV/t6gM//p4QKI3BYFVCrn2phYRk
 /cGk3FA0uKmC9fxNVxU0QcyPYYSv6kPDVYxbZo07DnuUsInO1SN8o1dy9PDseFs0K6
 RG5DnQsFyI4K7ErxtF037Ni99JBaatqcqh5k9hVlCa6oTHBzy1ipE9SXlrXQvG4a8H
 Wsryjgu60mSaCn/VCnCmDQ2Q+AQ0IO7mNpfiwK80Y4TlKDXBJoj89IDkgrgKoLVRav
 +EG8fR9I8oK5g==
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon
 Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug
 Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/24/2020 11:35 PM, Jianxin Xiong wrote:
> Implement the new driver method 'reg_user_mr_dmabuf'.  Utilize the core
> functions to import dma-buf based memory region and update the mappings.
>
> Add code to handle dma-buf related page fault.
>
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Acked-by: Christian Koenig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>   drivers/infiniband/hw/mlx5/main.c    |   2 +
>   drivers/infiniband/hw/mlx5/mlx5_ib.h |  18 ++++
>   drivers/infiniband/hw/mlx5/mr.c      | 128 +++++++++++++++++++++++++--
>   drivers/infiniband/hw/mlx5/odp.c     |  86 +++++++++++++++++-
>   4 files changed, 225 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/infiniband/hw/mlx5/main.c b/drivers/infiniband/hw/mlx5/main.c
> index 36b15a063e68..e647ea4bf9ce 100644
> --- a/drivers/infiniband/hw/mlx5/main.c
> +++ b/drivers/infiniband/hw/mlx5/main.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
>   /*
>    * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
> + * Copyright (c) 2020, Intel Corporation. All rights reserved.
>    */
>   
>   #include <linux/debugfs.h>
> @@ -4055,6 +4056,7 @@ static const struct ib_device_ops mlx5_ib_dev_ops = {
>   	.query_srq = mlx5_ib_query_srq,
>   	.query_ucontext = mlx5_ib_query_ucontext,
>   	.reg_user_mr = mlx5_ib_reg_user_mr,
> +	.reg_user_mr_dmabuf = mlx5_ib_reg_user_mr_dmabuf,
>   	.req_notify_cq = mlx5_ib_arm_cq,
>   	.rereg_user_mr = mlx5_ib_rereg_user_mr,
>   	.resize_cq = mlx5_ib_resize_cq,
> diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
> index bb44080170be..3ef6872fa258 100644
> --- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
> +++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
>   /*
>    * Copyright (c) 2013-2020, Mellanox Technologies inc. All rights reserved.
> + * Copyright (c) 2020, Intel Corporation. All rights reserved.
>    */
>   
>   #ifndef MLX5_IB_H
> @@ -665,6 +666,12 @@ static inline bool is_odp_mr(struct mlx5_ib_mr *mr)
>   	       mr->umem->is_odp;
>   }
>   
> +static inline bool is_dmabuf_mr(struct mlx5_ib_mr *mr)
> +{
> +	return IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING) && mr->umem &&
> +	       mr->umem->is_dmabuf;

This doesn't really make sense to have the umem marked as 
'is_dmabuf=true' but to return false from the function.
The IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING) check should be done 
before creating it.

> +}
> +
>   struct mlx5_ib_mw {
>   	struct ib_mw		ibmw;
>   	struct mlx5_core_mkey	mmkey;
> @@ -1200,6 +1207,10 @@ struct ib_mr *mlx5_ib_get_dma_mr(struct ib_pd *pd, int acc);
>   struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
>   				  u64 virt_addr, int access_flags,
>   				  struct ib_udata *udata);
> +struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 start,
> +					 u64 length, u64 virt_addr,
> +					 int fd, int access_flags,
> +					 struct ib_udata *udata);
>   int mlx5_ib_advise_mr(struct ib_pd *pd,
>   		      enum ib_uverbs_advise_mr_advice advice,
>   		      u32 flags,
> @@ -1210,11 +1221,13 @@ int mlx5_ib_alloc_mw(struct ib_mw *mw, struct ib_udata *udata);
>   int mlx5_ib_dealloc_mw(struct ib_mw *mw);
>   int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
>   		       int page_shift, int flags);
> +int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags);
>   struct mlx5_ib_mr *mlx5_ib_alloc_implicit_mr(struct mlx5_ib_pd *pd,
>   					     struct ib_udata *udata,
>   					     int access_flags);
>   void mlx5_ib_free_implicit_mr(struct mlx5_ib_mr *mr);
>   void mlx5_ib_fence_odp_mr(struct mlx5_ib_mr *mr);
> +void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr);
>   int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
>   			  u64 length, u64 virt_addr, int access_flags,
>   			  struct ib_pd *pd, struct ib_udata *udata);
> @@ -1306,6 +1319,7 @@ int mlx5_ib_advise_mr_prefetch(struct ib_pd *pd,
>   			       enum ib_uverbs_advise_mr_advice advice,
>   			       u32 flags, struct ib_sge *sg_list, u32 num_sge);
>   int mlx5_ib_init_odp_mr(struct mlx5_ib_mr *mr, bool enable);
> +int mlx5_ib_init_dmabuf_mr(struct mlx5_ib_mr *mr);
>   #else /* CONFIG_INFINIBAND_ON_DEMAND_PAGING */
>   static inline void mlx5_ib_internal_fill_odp_caps(struct mlx5_ib_dev *dev)
>   {
> @@ -1331,6 +1345,10 @@ static inline int mlx5_ib_init_odp_mr(struct mlx5_ib_mr *mr, bool enable)
>   {
>   	return -EOPNOTSUPP;
>   }
> +static inline int mlx5_ib_init_dmabuf_mr(struct mlx5_ib_mr *mr)
> +{
> +	return -EOPNOTSUPP;
> +}
>   #endif /* CONFIG_INFINIBAND_ON_DEMAND_PAGING */
>   
>   extern const struct mmu_interval_notifier_ops mlx5_mn_ops;
> diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
> index 9f653b4a5438..4551d41596f9 100644
> --- a/drivers/infiniband/hw/mlx5/mr.c
> +++ b/drivers/infiniband/hw/mlx5/mr.c
> @@ -1,5 +1,6 @@
>   /*
>    * Copyright (c) 2013-2015, Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2020, Intel Corporation. All rights reserved.
>    *
>    * This software is available to you under a choice of one of two
>    * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -36,6 +37,8 @@
>   #include <linux/debugfs.h>
>   #include <linux/export.h>
>   #include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
>   #include <rdma/ib_umem.h>
>   #include <rdma/ib_umem_odp.h>
>   #include <rdma/ib_verbs.h>
> @@ -957,6 +960,16 @@ static struct mlx5_cache_ent *mr_cache_ent_from_order(struct mlx5_ib_dev *dev,
>   	return &cache->ent[order];
>   }
>   
> +static unsigned int mlx5_umem_dmabuf_default_pgsz(struct ib_umem *umem,
> +						  u64 iova)
> +{
> +	if ((iova ^ umem->address) & (PAGE_SIZE - 1))
> +		return 0;
> +
This failure can be triggered by some user space application bad 
parameters, right ? if so need to drop the WARN_ON() in the caller to 
prevent
the WARN
> +	umem->iova = iova;
> +	return PAGE_SIZE;
> +}
> +
>   static struct mlx5_ib_mr *alloc_mr_from_cache(struct ib_pd *pd,
>   					      struct ib_umem *umem, u64 iova,
>   					      int access_flags)
> @@ -966,7 +979,11 @@ static struct mlx5_ib_mr *alloc_mr_from_cache(struct ib_pd *pd,
>   	struct mlx5_ib_mr *mr;
>   	unsigned int page_size;
>   
> -	page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> +	if (umem->is_dmabuf)
> +		page_size = mlx5_umem_dmabuf_default_pgsz(umem, iova);
> +	else
> +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> +						     0, iova);
>   	if (WARN_ON(!page_size))
>   		return ERR_PTR(-EINVAL);
>   	ent = mr_cache_ent_from_order(
> @@ -1212,8 +1229,10 @@ int mlx5_ib_update_xlt(struct mlx5_ib_mr *mr, u64 idx, int npages,
>   
>   /*
>    * Send the DMA list to the HW for a normal MR using UMR.
> + * Dmabuf MR is handled in a similar way, except that the MLX5_IB_UPD_XLT_ZAP
> + * flag may be used.
>    */
> -static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
> +int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
>   {
>   	struct mlx5_ib_dev *dev = mr->dev;
>   	struct device *ddev = dev->ib_dev.dev.parent;
> @@ -1255,6 +1274,10 @@ static int mlx5_ib_update_mr_pas(struct mlx5_ib_mr *mr, unsigned int flags)
>   		cur_mtt->ptag =
>   			cpu_to_be64(rdma_block_iter_dma_address(&biter) |
>   				    MLX5_IB_MTT_PRESENT);
> +
> +		if (mr->umem->is_dmabuf && (flags & MLX5_IB_UPD_XLT_ZAP))
> +			cur_mtt->ptag = 0;
> +
>   		cur_mtt++;
>   	}
>   
> @@ -1291,8 +1314,11 @@ static struct mlx5_ib_mr *reg_create(struct ib_mr *ibmr, struct ib_pd *pd,
>   	int err;
>   	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
>   
> -	page_size =
> -		mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> +	if (umem->is_dmabuf)
> +		page_size = mlx5_umem_dmabuf_default_pgsz(umem, iova);
> +	else
> +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> +						     0, iova);
>   	if (WARN_ON(!page_size))
>   		return ERR_PTR(-EINVAL);
>   
> @@ -1581,6 +1607,96 @@ struct ib_mr *mlx5_ib_reg_user_mr(struct ib_pd *pd, u64 start, u64 length,
>   	return ERR_PTR(err);
>   }
>   
> +static void mlx5_ib_dmabuf_invalidate_cb(struct dma_buf_attachment *attach)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = attach->importer_priv;
> +	struct mlx5_ib_mr *mr = umem_dmabuf->private;
> +
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (!umem_dmabuf->sgt)
> +		return;
> +
> +	mlx5_ib_update_mr_pas(mr, MLX5_IB_UPD_XLT_ZAP);
> +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +}
> +
> +static struct dma_buf_attach_ops mlx5_ib_dmabuf_attach_ops = {
> +	.allow_peer2peer = 1,
> +	.move_notify = mlx5_ib_dmabuf_invalidate_cb,
> +};
> +
> +struct ib_mr *mlx5_ib_reg_user_mr_dmabuf(struct ib_pd *pd, u64 offset,
> +					 u64 length, u64 virt_addr,
> +					 int fd, int access_flags,
> +					 struct ib_udata *udata)
> +{
> +	struct mlx5_ib_dev *dev = to_mdev(pd->device);
> +	struct mlx5_ib_mr *mr = NULL;
> +	struct ib_umem *umem;
> +	int err;
> +
> +	if (!IS_ENABLED(CONFIG_INFINIBAND_USER_MEM))
> +		return ERR_PTR(-EOPNOTSUPP);
> +

I would expect checking here for CONFIG_INFINIBAND_ON_DEMAND_PAGING as 
well to prevent creating such an MR when it can't really be applicable.

> +	mlx5_ib_dbg(dev,
> +		    "offset 0x%llx, virt_addr 0x%llx, length 0x%llx, fd %d, access_flags 0x%x\n",
> +		    offset, virt_addr, length, fd, access_flags);
> +
> +	if (!mlx5_ib_can_load_pas_with_umr(dev, length))
> +		return ERR_PTR(-EINVAL);
> +
> +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> +				  &mlx5_ib_dmabuf_attach_ops);
> +	if (IS_ERR(umem)) {
> +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> +		return ERR_PTR(PTR_ERR(umem));
> +	}
> +
> +	mr = alloc_mr_from_cache(pd, umem, virt_addr, access_flags);
> +	if (IS_ERR(mr))
> +		mr = NULL;
> +
> +	if (!mr) {
> +		mutex_lock(&dev->slow_path_mutex);
> +		mr = reg_create(NULL, pd, umem, virt_addr, access_flags,
> +				false);
> +		mutex_unlock(&dev->slow_path_mutex);
> +	}
> +
> +	if (IS_ERR(mr)) {
> +		err = PTR_ERR(mr);
> +		goto error;
> +	}
> +
> +	mlx5_ib_dbg(dev, "mkey 0x%x\n", mr->mmkey.key);
> +
> +	mr->umem = umem;
> +	atomic_add(ib_umem_num_pages(mr->umem), &dev->mdev->priv.reg_pages);
> +	set_mr_fields(dev, mr, length, access_flags);
> +
> +	to_ib_umem_dmabuf(umem)->private = mr;
> +	init_waitqueue_head(&mr->q_deferred_work);
> +	atomic_set(&mr->num_deferred_work, 0);
> +	err = xa_err(xa_store(&dev->odp_mkeys,
> +			      mlx5_base_mkey(mr->mmkey.key), &mr->mmkey,
> +			      GFP_KERNEL));
> +	if (err) {
> +		dereg_mr(dev, mr);
> +		return ERR_PTR(err);
> +	}
> +
> +	err = mlx5_ib_init_dmabuf_mr(mr);
> +	if (err) {
> +		dereg_mr(dev, mr);
> +		return ERR_PTR(err);
> +	}
> +	return &mr->ibmr;
> +error:
> +	ib_umem_release(umem);
> +	return ERR_PTR(err);
> +}
> +
>   /**
>    * mlx5_mr_cache_invalidate - Fence all DMA on the MR
>    * @mr: The MR to fence
> @@ -1649,7 +1765,7 @@ int mlx5_ib_rereg_user_mr(struct ib_mr *ib_mr, int flags, u64 start,
>   	if (!mr->umem)
>   		return -EINVAL;
>   
> -	if (is_odp_mr(mr))
> +	if (is_odp_mr(mr) || is_dmabuf_mr(mr))
>   		return -EOPNOTSUPP;
>   
>   	if (flags & IB_MR_REREG_TRANS) {
> @@ -1812,6 +1928,8 @@ static void dereg_mr(struct mlx5_ib_dev *dev, struct mlx5_ib_mr *mr)
>   	/* Stop all DMA */
>   	if (is_odp)
>   		mlx5_ib_fence_odp_mr(mr);
> +	else if (is_dmabuf_mr(mr))
> +		mlx5_ib_fence_dmabuf_mr(mr);
>   	else
>   		clean_mr(dev, mr);
>   
> diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
> index 5c853ec1b0d8..41aeb9200427 100644
> --- a/drivers/infiniband/hw/mlx5/odp.c
> +++ b/drivers/infiniband/hw/mlx5/odp.c
> @@ -33,6 +33,8 @@
>   #include <rdma/ib_umem.h>
>   #include <rdma/ib_umem_odp.h>
>   #include <linux/kernel.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
>   
>   #include "mlx5_ib.h"
>   #include "cmd.h"
> @@ -664,6 +666,37 @@ void mlx5_ib_fence_odp_mr(struct mlx5_ib_mr *mr)
>   	dma_fence_odp_mr(mr);
>   }
>   
> +/**
> + * mlx5_ib_fence_dmabuf_mr - Stop all access to the dmabuf MR
> + * @mr: to fence
> + *
> + * On return no parallel threads will be touching this MR and no DMA will be
> + * active.
> + */
> +void mlx5_ib_fence_dmabuf_mr(struct mlx5_ib_mr *mr)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> +
> +	/* Prevent new page faults and prefetch requests from succeeding */
> +	xa_erase(&mr->dev->odp_mkeys, mlx5_base_mkey(mr->mmkey.key));
> +
> +	/* Wait for all running page-fault handlers to finish. */
> +	synchronize_srcu(&mr->dev->odp_srcu);
> +
> +	wait_event(mr->q_deferred_work, !atomic_read(&mr->num_deferred_work));
> +
> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> +	mlx5_mr_cache_invalidate(mr);
> +	umem_dmabuf->private = NULL;
> +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (!mr->cache_ent) {
> +		mlx5_core_destroy_mkey(mr->dev->mdev, &mr->mmkey);
> +		WARN_ON(mr->descs);
> +	}
> +}
> +
>   #define MLX5_PF_FLAGS_DOWNGRADE BIT(1)
>   #define MLX5_PF_FLAGS_SNAPSHOT BIT(2)
>   #define MLX5_PF_FLAGS_ENABLE BIT(3)
> @@ -797,6 +830,41 @@ static int pagefault_implicit_mr(struct mlx5_ib_mr *imr,
>   	return ret;
>   }
>   
> +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, size_t bcnt,
> +			       u32 *bytes_mapped, u32 flags)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> +	u32 xlt_flags = 0;
> +	int err;
> +	unsigned int page_size;
> +
> +	if (flags & MLX5_PF_FLAGS_ENABLE)
> +		xlt_flags |= MLX5_IB_UPD_XLT_ENABLE;
> +
> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> +	if (!err) {
> +		page_size = mlx5_umem_find_best_pgsz(&umem_dmabuf->umem, mkc,
> +						     log_page_size, 0,
> +						     umem_dmabuf->umem.iova);
> +		if (unlikely(page_size < PAGE_SIZE)) {
> +			ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +			err = -EINVAL;
> +		} else {
> +			err = mlx5_ib_update_mr_pas(mr, xlt_flags);
> +		}
> +	}
> +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (err)
> +		return err;
> +
> +	if (bytes_mapped)
> +		*bytes_mapped += bcnt;
> +
> +	return ib_umem_num_pages(mr->umem);
> +}
> +
>   /*
>    * Returns:
>    *  -EFAULT: The io_virt->bcnt is not within the MR, it covers pages that are
> @@ -815,6 +883,9 @@ static int pagefault_mr(struct mlx5_ib_mr *mr, u64 io_virt, size_t bcnt,
>   	if (unlikely(io_virt < mr->mmkey.iova))
>   		return -EFAULT;
>   
> +	if (is_dmabuf_mr(mr))
> +		return pagefault_dmabuf_mr(mr, bcnt, bytes_mapped, flags);
> +
>   	if (!odp->is_implicit_odp) {
>   		u64 user_va;
>   
> @@ -845,6 +916,16 @@ int mlx5_ib_init_odp_mr(struct mlx5_ib_mr *mr, bool enable)
>   	return ret >= 0 ? 0 : ret;
>   }
>   
> +int mlx5_ib_init_dmabuf_mr(struct mlx5_ib_mr *mr)
> +{
> +	int ret;
> +
> +	ret = pagefault_dmabuf_mr(mr, mr->umem->length, NULL,
> +				  MLX5_PF_FLAGS_ENABLE);
> +
> +	return ret >= 0 ? 0 : ret;
> +}
> +
>   struct pf_frame {
>   	struct pf_frame *next;
>   	u32 key;
> @@ -1747,7 +1828,6 @@ get_prefetchable_mr(struct ib_pd *pd, enum ib_uverbs_advise_mr_advice advice,
>   {
>   	struct mlx5_ib_dev *dev = to_mdev(pd->device);
>   	struct mlx5_core_mkey *mmkey;
> -	struct ib_umem_odp *odp;
>   	struct mlx5_ib_mr *mr;
>   
>   	lockdep_assert_held(&dev->odp_srcu);
> @@ -1761,11 +1841,9 @@ get_prefetchable_mr(struct ib_pd *pd, enum ib_uverbs_advise_mr_advice advice,
>   	if (mr->ibmr.pd != pd)
>   		return NULL;
>   
> -	odp = to_ib_umem_odp(mr->umem);
> -
>   	/* prefetch with write-access must be supported by the MR */
>   	if (advice == IB_UVERBS_ADVISE_MR_ADVICE_PREFETCH_WRITE &&
> -	    !odp->umem.writable)
> +	    !mr->umem->writable)
>   		return NULL;
>   
>   	return mr;


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
