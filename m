Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD56B2974DE
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 18:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199766F8DF;
	Fri, 23 Oct 2020 16:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5B76F8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 16:49:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e2so2517989wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UPn8evHO2X2c4oUVF4dLN8IRh8TGrYGeyqgst8ZZpxM=;
 b=J5AZtOp5/E6cbX9S5r7f9NPx9aqgH0sW9dl15Iic4S4tVsdkJqLhEeehuD5vbGAo+p
 UnRUEVZ5Ovek7Lug8d40I61gGrm0ddQDGEXhvQTjmTsfh38edCVHO2UK2vuaP39GkjhM
 QvREUcBnXlxvE6TJqelAp2aQWMM+ta1vqN9jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UPn8evHO2X2c4oUVF4dLN8IRh8TGrYGeyqgst8ZZpxM=;
 b=QOHBkuZ4Xiq4PaWXvCpzGOhdKA5HZhB9ermMN0yBQya/rUVAYoNurEE8fJd6WXE6wa
 yuWnN4eZrCOfHraBa036iAY/ETACEQQg1jfT8A7RCHkkBj7lMzi0fLG/hxBhq89LGyPT
 aANLhtibbxdNpxHRex/cSO1ZHnEVN6R3hYuNmf93SZjSSwobHNmT4QKu4bzqEFWxMICQ
 HqAACcPOjY6jXS9JNnm7ho1/a7DfHWdfDmyxBotEUDN71jyntZMXB6uIvA5G/vanhlZE
 0M0YHCYxjL/em23fMRnjJIJFytdBKglvz/lhq1bAHr4a2qfaumx8Olgy+XU9B7fHjVt3
 4S9A==
X-Gm-Message-State: AOAM530MfEz72RngTOZLanEKXthiFeKUtUQdLDSYlYnt525lAbjcgf7+
 0NxwPhGlHmHgifMcHudA271R4A==
X-Google-Smtp-Source: ABdhPJw28FVd7q84l/C9pcw4ZAlgLe9R3O4ztuSaAvZ/9+zsOGKC1I1axsvDvg2SjNhdw2levDRBDg==
X-Received: by 2002:a1c:b6d5:: with SMTP id g204mr3235316wmf.65.1603471754297; 
 Fri, 23 Oct 2020 09:49:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm4350079wrp.74.2020.10.23.09.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 09:49:13 -0700 (PDT)
Date: Fri, 23 Oct 2020 18:49:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v6 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201023164911.GF401619@phenom.ffwll.local>
References: <1603471201-32588-1-git-send-email-jianxin.xiong@intel.com>
 <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603471201-32588-2-git-send-email-jianxin.xiong@intel.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 09:39:58AM -0700, Jianxin Xiong wrote:
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
> ---
>  drivers/infiniband/core/Makefile      |   2 +-
>  drivers/infiniband/core/umem.c        |   4 +
>  drivers/infiniband/core/umem_dmabuf.c | 197 ++++++++++++++++++++++++++++++++++
>  drivers/infiniband/core/umem_dmabuf.h |  11 ++
>  include/rdma/ib_umem.h                |  35 +++++-
>  5 files changed, 247 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.c
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.h
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
> index e9fecbd..2c45525 100644
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
> @@ -43,6 +44,7 @@
>  #include <rdma/ib_umem_odp.h>
>  
>  #include "uverbs.h"
> +#include "umem_dmabuf.h"
>  
>  static void __ib_umem_release(struct ib_device *dev, struct ib_umem *umem, int dirty)
>  {
> @@ -269,6 +271,8 @@ void ib_umem_release(struct ib_umem *umem)
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
> index 0000000..66b234d
> --- /dev/null
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -0,0 +1,197 @@
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
> +#include "umem_dmabuf.h"
> +
> +/*
> + * Generate a new dma sg list from a sub range of an existing dma sg list.
> + * Both the input and output have their entries page aligned.
> + */
> +static int ib_umem_dmabuf_sgt_slice(struct sg_table *sgt, u64 offset,
> +				    u64 length, struct sg_table *new_sgt)
> +{
> +	struct scatterlist *sg, *new_sg;
> +	u64 start, end, off, addr, len;
> +	unsigned int new_nents;
> +	int err;
> +	int i;
> +
> +	start = ALIGN_DOWN(offset, PAGE_SIZE);
> +	end = ALIGN(offset + length, PAGE_SIZE);
> +
> +	offset = start;
> +	length = end - start;
> +	new_nents = 0;
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		len = sg_dma_len(sg);
> +		off = min(len, offset);
> +		len -= off;
> +		len = min(len, length);
> +		if (len)
> +			new_nents++;
> +		length -= len;
> +		offset -= off;
> +	}
> +
> +	err = sg_alloc_table(new_sgt, new_nents, GFP_KERNEL);
> +	if (err)
> +		return err;
> +
> +	offset = start;
> +	length = end - start;
> +	new_sg = new_sgt->sgl;
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
> +		addr = sg_dma_address(sg);
> +		len = sg_dma_len(sg);
> +		off = min(len, offset);
> +		addr += off;
> +		len -= off;
> +		len = min(len, length);
> +		if (len) {
> +			sg_dma_address(new_sg) = addr;
> +			sg_dma_len(new_sg) = len;
> +			new_sg = sg_next(new_sg);
> +		}
> +		length -= len;
> +		offset -= off;
> +	}
> +
> +	return 0;
> +}
> +
> +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	struct sg_table *sgt;
> +	struct dma_fence *fence;
> +	int err;
> +
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
> +				     DMA_BIDIRECTIONAL);
> +
> +	if (IS_ERR(sgt))
> +		return PTR_ERR(sgt);
> +
> +	err = ib_umem_dmabuf_sgt_slice(sgt, umem_dmabuf->umem.address,
> +				       umem_dmabuf->umem.length,
> +				       &umem_dmabuf->umem.sg_head);
> +	if (err) {
> +		dma_buf_unmap_attachment(umem_dmabuf->attach, sgt,
> +					 DMA_BIDIRECTIONAL);
> +		return err;
> +	}
> +
> +	umem_dmabuf->umem.nmap = umem_dmabuf->umem.sg_head.nents;
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
> +	sg_free_table(&umem_dmabuf->umem.sg_head);
> +	dma_buf_unmap_attachment(umem_dmabuf->attach, umem_dmabuf->sgt,
> +				 DMA_BIDIRECTIONAL);
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
> +	long ret;
> +
> +	if (check_add_overflow(offset, (unsigned long)size, &end))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(PAGE_ALIGN(end) < PAGE_SIZE))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (unlikely(!ops || !ops->move_notify))
> +		return ERR_PTR(-EINVAL);
> +
> +#ifdef CONFIG_DMA_VIRT_OPS
> +	if (device->dma_device->dma_ops == &dma_virt_ops)
> +		return ERR_PTR(-EINVAL);
> +#endif

Maybe I'm confused, but should we have this check in dma_buf_attach, or at
least in dma_buf_dynamic_attach? The p2pdma functions use that too, and I
can't imagine how zerocopy should work (which is like the entire point of
dma-buf) when we have dma_virt_ops.

A similar problem exists for swiotlb bounce buffers, not sure how that's
solved.
-Daniel

> +
> +	umem_dmabuf = kzalloc(sizeof(*umem_dmabuf), GFP_KERNEL);
> +	if (!umem_dmabuf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	umem = &umem_dmabuf->umem;
> +	umem->ibdev = device;
> +	umem->length = size;
> +	umem->address = offset;
> +	umem->iova = offset;
> +	umem->writable = ib_access_writable(access);
> +	umem->is_dmabuf = 1;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto out_free_umem;
> +	}
> +
> +	umem_dmabuf->attach = dma_buf_dynamic_attach(
> +					dmabuf,
> +					device->dma_device,
> +					ops,
> +					umem_dmabuf);
> +	if (IS_ERR(umem_dmabuf->attach)) {
> +		ret = PTR_ERR(umem_dmabuf->attach);
> +		goto out_release_dmabuf;
> +	}
> +
> +	return umem;
> +
> +out_release_dmabuf:
> +	dma_buf_put(dmabuf);
> +
> +out_free_umem:
> +	kfree(umem_dmabuf);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL(ib_umem_dmabuf_get);
> +
> +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	struct dma_buf *dmabuf = umem_dmabuf->attach->dmabuf;
> +
> +	dma_resv_lock(dmabuf->resv, NULL);
> +	ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	dma_buf_detach(dmabuf, umem_dmabuf->attach);
> +	dma_buf_put(dmabuf);
> +	kfree(umem_dmabuf);
> +}
> diff --git a/drivers/infiniband/core/umem_dmabuf.h b/drivers/infiniband/core/umem_dmabuf.h
> new file mode 100644
> index 0000000..13acf55
> --- /dev/null
> +++ b/drivers/infiniband/core/umem_dmabuf.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> + */
> +
> +#ifndef UMEM_DMABUF_H
> +#define UMEM_DMABUF_H
> +
> +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
> +
> +#endif /* UMEM_DMABUF_H */
> diff --git a/include/rdma/ib_umem.h b/include/rdma/ib_umem.h
> index 7059750..73a7b19 100644
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
> @@ -22,12 +24,25 @@ struct ib_umem {
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
> +	void *device_context;
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
> @@ -79,6 +94,12 @@ int ib_umem_copy_from(void *dst, struct ib_umem *umem, size_t offset,
>  unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
>  				     unsigned long pgsz_bitmap,
>  				     unsigned long virt);
> +struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> +				   unsigned long offset, size_t size,
> +				   int fd, int access,
> +				   const struct dma_buf_attach_ops *ops);
> +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf);
> +void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf);
>  
>  #else /* CONFIG_INFINIBAND_USER_MEM */
>  
> @@ -101,7 +122,19 @@ static inline unsigned long ib_umem_find_best_pgsz(struct ib_umem *umem,
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
> +}
> +static inline int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	return -EINVAL;
> +}
> +static inline void ib_umem_dmabuf_unmap_pages(struct ib_umem_dmabuf *umem_dmabuf) { }
>  
>  #endif /* CONFIG_INFINIBAND_USER_MEM */
> -
>  #endif /* IB_UMEM_H */
> -- 
> 1.8.3.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
