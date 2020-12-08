Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D607F2D2408
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 08:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627D46E06E;
	Tue,  8 Dec 2020 07:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3267D6E06E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 07:05:40 +0000 (UTC)
Date: Tue, 8 Dec 2020 09:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607411139;
 bh=/7ZGiUT83vpr+AYE7iOeMqQBysq+rMzZJTcw+kUy6Nc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKd04aYN5M84ur8Ci7wg628+wXqTgb2niUckKe4hfSPfT3RwEzLDws5QqCMEf0mg4
 jZQWBdMLopxPNPRmImSkiUzFSzhaM9KzqCWXL7h6t12XEi2c0s61EzbiTr8hv0Sc6d
 x/arB66fVTnAzmXk975nRJ99O8RXEftlCjm+w4AqFRiBOi4uSr53K2jyu/c4LIc156
 BFVZpJDdoJIhFTk95ZgGA71mG0WrddGOXr5yjzwKyK4htK2qfGzrrKY0V2bEDxtsQz
 FPwQOkVYV44NzzvH0JF99dIf7FW0b88Qkx3AESYEdc6c/602+HAH42b29KI2SmXqGd
 uqkTHn3HDLKoA==
From: Leon Romanovsky <leon@kernel.org>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201208070532.GE4430@unreal>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607379353-116215-2-git-send-email-jianxin.xiong@intel.com>
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
Cc: linux-rdma@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 07, 2020 at 02:15:50PM -0800, Jianxin Xiong wrote:
> Dma-buf is a standard cross-driver buffer sharing mechanism that can be
> used to support peer-to-peer access from RDMA devices.
>
> Device memory exported via dma-buf is associated with a file descriptor.
> This is passed to the user space as a property associated with the
> buffer allocation. When the buffer is registered as a memory region,
> the file descriptor is passed to the RDMA driver along with other
> parameters.
>
> Implement the common code for importing dma-buf object and mapping
> dma-buf pages.
>
> Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> Reviewed-by: Sean Hefty <sean.hefty@intel.com>
> Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Acked-by: Christian Koenig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Conflicts:
> 	include/rdma/ib_umem.h

This probably leftover from rebase, am I right?

> ---
>  drivers/infiniband/core/Makefile      |   2 +-
>  drivers/infiniband/core/umem.c        |   3 +
>  drivers/infiniband/core/umem_dmabuf.c | 173 ++++++++++++++++++++++++++++++++++
>  include/rdma/ib_umem.h                |  43 ++++++++-
>  4 files changed, 219 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.c
>
> diff --git a/drivers/infiniband/core/Makefile b/drivers/infiniband/core/Makefile
> index ccf2670..8ab4eea 100644
> --- a/drivers/infiniband/core/Makefile
> +++ b/drivers/infiniband/core/Makefile
> @@ -40,5 +40,5 @@ ib_uverbs-y :=			uverbs_main.o uverbs_cmd.o uverbs_marshall.o \
>  				uverbs_std_types_srq.o \
>  				uverbs_std_types_wq.o \
>  				uverbs_std_types_qp.o
> -ib_uverbs-$(CONFIG_INFINIBAND_USER_MEM) += umem.o
> +ib_uverbs-$(CONFIG_INFINIBAND_USER_MEM) += umem.o umem_dmabuf.o
>  ib_uverbs-$(CONFIG_INFINIBAND_ON_DEMAND_PAGING) += umem_odp.o
> diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
> index 7ca4112..cc131f8 100644
> --- a/drivers/infiniband/core/umem.c
> +++ b/drivers/infiniband/core/umem.c
> @@ -2,6 +2,7 @@
>   * Copyright (c) 2005 Topspin Communications.  All rights reserved.
>   * Copyright (c) 2005 Cisco Systems.  All rights reserved.
>   * Copyright (c) 2005 Mellanox Technologies. All rights reserved.
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
>   *
>   * This software is available to you under a choice of one of two
>   * licenses.  You may choose to be licensed under the terms of the GNU
> @@ -278,6 +279,8 @@ void ib_umem_release(struct ib_umem *umem)
>  {
>  	if (!umem)
>  		return;
> +	if (umem->is_dmabuf)
> +		return ib_umem_dmabuf_release(to_ib_umem_dmabuf(umem));
>  	if (umem->is_odp)
>  		return ib_umem_odp_release(to_ib_umem_odp(umem));
>
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> new file mode 100644
> index 0000000..e50b955
> --- /dev/null
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
> +#include <linux/dma-mapping.h>
> +
> +#include "uverbs.h"
> +
> +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	struct dma_fence *fence;
> +	unsigned long start, end, cur;
> +	unsigned int nmap;
> +	int i;
> +
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (umem_dmabuf->sgt)
> +		return 0;
> +
> +	sgt = dma_buf_map_attachment(umem_dmabuf->attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt))
> +		return PTR_ERR(sgt);
> +
> +	/* modify the sg list in-place to match umem address and length */
> +
> +	start = ALIGN_DOWN(umem_dmabuf->umem.address, PAGE_SIZE);
> +	end = ALIGN(umem_dmabuf->umem.address + umem_dmabuf->umem.length,
> +		    PAGE_SIZE);
> +	cur = 0;
> +	nmap = 0;

Better to put as part of variable initialization.

> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		if (start < cur + sg_dma_len(sg) && cur < end)
> +			nmap++;
> +		if (cur <= start && start < cur + sg_dma_len(sg)) {
> +			unsigned long offset = start - cur;
> +
> +			umem_dmabuf->first_sg = sg;
> +			umem_dmabuf->first_sg_offset = offset;
> +			sg_dma_address(sg) += offset;
> +			sg_dma_len(sg) -= offset;
> +			cur += offset;
> +		}
> +		if (cur < end && end <= cur + sg_dma_len(sg)) {
> +			unsigned long trim = cur + sg_dma_len(sg) - end;
> +
> +			umem_dmabuf->last_sg = sg;
> +			umem_dmabuf->last_sg_trim = trim;
> +			sg_dma_len(sg) -= trim;
> +			break;
> +		}
> +		cur += sg_dma_len(sg);
> +	}
> +
> +	umem_dmabuf->umem.sg_head.sgl = umem_dmabuf->first_sg;
> +	umem_dmabuf->umem.sg_head.nents = nmap;
> +	umem_dmabuf->umem.nmap = nmap;
> +	umem_dmabuf->sgt = sgt;
> +
> +	/*
> +	 * Although the sg list is valid now, the content of the pages
> +	 * may be not up-to-date. Wait for the exporter to finish
> +	 * the migration.
> +	 */
> +	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
> +	if (fence)
> +		dma_fence_wait(fence, false);

Any reason do not check return result from dma_fence_wait()?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
> +
> +void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (!umem_dmabuf->sgt)
> +		return;
> +
> +	/* retore the original sg list */
> +	if (umem_dmabuf->first_sg) {
> +		sg_dma_address(umem_dmabuf->first_sg) -=
> +			umem_dmabuf->first_sg_offset;
> +		sg_dma_len(umem_dmabuf->first_sg) +=
> +			umem_dmabuf->first_sg_offset;
> +		umem_dmabuf->first_sg = NULL;
> +		umem_dmabuf->first_sg_offset = 0;
> +	}
> +	if (umem_dmabuf->last_sg) {
> +		sg_dma_len(umem_dmabuf->last_sg) +=
> +			umem_dmabuf->last_sg_trim;
> +		umem_dmabuf->last_sg = NULL;
> +		umem_dmabuf->last_sg_trim = 0;
> +	}
> +
> +	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> +				 DMA_BIDIRECTIONAL);
> +
> +	umem_dmabuf->sgt = NULL;
> +}
> +EXPORT_SYMBOL(ib_umem_dmabuf_unmap_pages);
> +
> +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> +				   unsigned long offset, size_t size,
> +				   int fd, int access,
> +				   const struct dma_buf_attach_ops *ops)
> +{
> +	struct dma_buf *dmabuf;
> +	struct ib_umem_dmabuf *umem_dmabuf;
> +	struct ib_umem *umem;
> +	unsigned long end;
> +	long ret = -EINVAL;

It is wrong type for the returned value. One of the possible options
is to declare "struct ib_umem *ret;" and set ret = ERR_PTR(-EINVAL) or
ret = ERR_CAST(dmabuf);

> +
> +	if (check_add_overflow(offset, (unsigned long)size, &end))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(!ops || !ops->move_notify))

Let's not put likely/unlikely in control paths.

> +		return ERR_PTR(-EINVAL);
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf))
> +		return (void *)dmabuf;

return ERR_CAST(dmabuf);

> +
> +	if (dmabuf->size < end)
> +		goto out_release_dmabuf;
> +
> +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> +	if (!umem_dmabuf)
> +		return ERR_PTR(-ENOMEM);

You are leaking dmabuf here, forgot to call to dma_buf_put();

> +
> +	umem = &umem_dmabuf->umem;
> +	umem->ibdev = device;
> +	umem->length = size;
> +	umem->address = offset;
> +	umem->writable = ib_access_writable(access);
> +	umem->is_dmabuf = 1;
> +
> +	if (unlikely(!ib_umem_num_pages(umem)))

There is no advantage in "unlikely" here.

> +		goto out_free_umem;
> +
> +	umem_dmabuf->attach = dma_buf_dynamic_attach(
> +					dmabuf,
> +					device->dma_device,
> +					ops,
> +					umem_dmabuf);
> +	if (IS_ERR(umem_dmabuf->attach)) {
> +		ret = PTR_ERR(umem_dmabuf->attach);
> +		goto out_free_umem;
> +	}
> +	return umem;
> +
> +out_free_umem:
> +	kfree(umem_dmabuf);
> +
> +out_release_dmabuf:
> +	dma_buf_put(dmabuf);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(ib_umem_dmabuf_get);
> +
> +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
> +
> +	dma_buf_detach(dmabuf, umem_dmabuf->attach);
> +	dma_buf_put(dmabuf);
> +	kfree(umem_dmabuf);
> +}
> diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
> index 7752211..b49a96d 100644
> --- a/include/rdma/ib_umem.h
> +++ b/include/rdma/ib_umem.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB */
>  /*
>   * Copyright (c) 2007 Cisco Systems.  All rights reserved.
> + * Copyright (c) 2020 Intel Corporation.  All rights reserved.
>   */
>
>  #ifndef IB_UMEM_H
> @@ -13,6 +14,7 @@
>
>  struct ib_ucontext;
>  struct ib_umem_odp;
> +struct dma_buf_attach_ops;
>
>  struct ib_umem {
>  	struct ib_device       *ibdev;
> @@ -22,12 +24,29 @@ struct ib_umem {
>  	unsigned long		address;
>  	u32 writable : 1;
>  	u32 is_odp : 1;
> +	u32 is_dmabuf : 1;
>  	struct work_struct	work;
>  	struct sg_table sg_head;
>  	int             nmap;
>  	unsigned int    sg_nents;
>  };
>
> +struct ib_umem_dmabuf {
> +	struct ib_umem umem;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +	struct scatterlist *first_sg;
> +	struct scatterlist *last_sg;
> +	unsigned long first_sg_offset;
> +	unsigned long last_sg_trim;
> +	void *private;
> +};
> +
> +static inline struct ib_umem_dmabuf *to_ib_umem_dmabuf(struct ib_umem *umem)
> +{
> +	return container_of(umem, struct ib_umem_dmabuf, umem);
> +}
> +
>  /* Returns the offset of the umem start relative to the first page. */
>  static inline int ib_umem_offset(struct ib_umem *umem)
>  {
> @@ -86,6 +105,7 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
>  unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
>  				     unsigned long pgsz_bitmap,
>  				     unsigned long virt);
> +
>  /**
>   * ib_umem_find_best_pgoff - Find best HW page size
>   *
> @@ -116,6 +136,14 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
>  				      dma_addr & pgoff_bitmask);
>  }
>
> +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> +				   unsigned long offset, size_t size,
> +				   int fd, int access,
> +				   const struct dma_buf_attach_ops *ops);
> +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf);
> +void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf);
> +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
> +
>  #else /* CONFIG_INFINIBAND_USER_MEM */
>
>  #include <linux/err.h>
> @@ -143,7 +171,20 @@ static inline unsigned long ib_umem_find_best_pgoff(struct ib_umem *umem,
>  {
>  	return 0;
>  }
> +static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> +						 unsigned long offset,
> +						 size_t size, int fd,
> +						 int access,
> +						 struct dma_buf_attach_ops *ops)
> +{
> +	return ERR_PTR(-EINVAL);

Probably, It should be EOPNOTSUPP and not EINVAL.

> +}
> +static inline int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	return -EINVAL;
> +}
> +static inline void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf) { }
> +static inline void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf) { }
>
>  #endif /* CONFIG_INFINIBAND_USER_MEM */
> -
>  #endif /* IB_UMEM_H */
> --
> 1.8.3.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
