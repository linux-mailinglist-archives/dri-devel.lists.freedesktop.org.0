Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A21A41B53F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 19:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E9D66E904;
	Tue, 28 Sep 2021 17:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309CD6E905
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 17:36:24 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id e16so20524832qte.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2j0hSIPEbEVg08O91IQHe4e/t66ZjkFeXF4uWgBdazo=;
 b=ax7LPES/qoKnFOEWKvaH8l1/x+ycloiA/hqHbPeL5rP8Z1vn907OmU4BErMfCuVCQc
 uykk/OGXe7PV+xjzDRfkypKmDznCXQsvvz3zqFUmlkelU8ZkngLjEO/wINJszUCiO6fM
 rkC4xrj8aKDffdSBLCe6RujXg1aOQUTzSlUr/UMvo61pUtTO+oYCwyOV634CFGZsY3yi
 IiQEQ7G33mCNMT2e5fuJtLPw8Dvjst412sYB6xqWHjwxFiWGrGwoYAs9wm8hFbqIOcUm
 D0BS8zqjwkZUWjefjReFzvuS5I14QPxK6cI/EN+UNxqhUhnycRjJZujgSzt7Xzy0jauC
 VN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2j0hSIPEbEVg08O91IQHe4e/t66ZjkFeXF4uWgBdazo=;
 b=NbeEL0Qeg52jQmPq614Vlzw1bHvKingD6Z4n5fyBVmmOu5R1cbtE5n/Xot8JFSjDIv
 r9zYe7Ai3u4lEW593ccwy4SWxiqsma6ash+xN17ywSdbQckgAjRvhfGSK3woH/bhViwX
 qlspFmPtKbJULgIKDKSBbOSULuV/5M9QEIbI6Q2/4qWK55n0nv8D+Mje69wq3SDRQTkY
 OIhnIEfPeIXuBJZxFQeXLBthwoXImVoWl+zz6XW76CxoGU96+YESqsnKQT1CeosYJh4T
 6hWPzY67isI1+CnbnOvw+me3cNJ/9tTvgQWVWr0qStPmGNkrgaw9kua25bKnuD2Fei01
 kPCA==
X-Gm-Message-State: AOAM532bQn2DzGISfAT/th+4Oj7BQTsmshRh0aHgb5wIyiegm2e03BqM
 LXZPE6PPoNpM1SKsVv6kjZzGmA==
X-Google-Smtp-Source: ABdhPJyCMnEBQPKgYsxOkhRLCW8qILx1aEYS07Bsz6/uRtyaQBO+Rln0oQrRf1mMYyjQAzRzdprBSg==
X-Received: by 2002:ac8:4819:: with SMTP id g25mr6958932qtq.364.1632850583261; 
 Tue, 28 Sep 2021 10:36:23 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129])
 by smtp.gmail.com with ESMTPSA id h4sm2175787qtb.67.2021.09.28.10.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 10:36:22 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1mVH1h-007EMG-K7; Tue, 28 Sep 2021 14:36:21 -0300
Date: Tue, 28 Sep 2021 14:36:21 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Oded Gabbay <ogabbay@kernel.org>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 galpress@amazon.com, sleybo@amazon.com,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, dledford@redhat.com, airlied@gmail.com,
 alexander.deucher@amd.com, leonro@nvidia.com, hch@lst.de,
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Tomer Tayar <ttayar@habana.ai>
Subject: Re: [PATCH v6 2/2] habanalabs: add support for dma-buf exporter
Message-ID: <20210928173621.GG3544071@ziepe.ca>
References: <20210912165309.98695-1-ogabbay@kernel.org>
 <20210912165309.98695-3-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210912165309.98695-3-ogabbay@kernel.org>
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

On Sun, Sep 12, 2021 at 07:53:09PM +0300, Oded Gabbay wrote:
> From: Tomer Tayar <ttayar@habana.ai>
> 
> Implement the calls to the dma-buf kernel api to create a dma-buf
> object backed by FD.
> 
> We block the option to mmap the DMA-BUF object because we don't support
> DIRECT_IO and implicit P2P. 

This statement doesn't make sense, you can mmap your dmabuf if you
like. All dmabuf mmaps are supposed to set the special bit/etc to
exclude them from get_user_pages() anyhow - and since this is BAR
memory not struct page memory this driver would be doing it anyhow.

> We check the p2p distance using pci_p2pdma_distance_many() and refusing
> to map dmabuf in case the distance doesn't allow p2p.

Does this actually allow the p2p transfer for your intended use cases?

> diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/habanalabs/common/memory.c
> index 33986933aa9e..8cf5437c0390 100644
> +++ b/drivers/misc/habanalabs/common/memory.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  /*
> - * Copyright 2016-2019 HabanaLabs, Ltd.
> + * Copyright 2016-2021 HabanaLabs, Ltd.
>   * All Rights Reserved.
>   */
>  
> @@ -11,11 +11,13 @@
>  
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
> +#include <linux/pci-p2pdma.h>
>  
>  #define HL_MMU_DEBUG	0
>  
>  /* use small pages for supporting non-pow2 (32M/40M/48M) DRAM phys page sizes */
> -#define DRAM_POOL_PAGE_SIZE SZ_8M
> +#define DRAM_POOL_PAGE_SIZE		SZ_8M
> +

??

>  /*
>   * The va ranges in context object contain a list with the available chunks of
> @@ -347,6 +349,13 @@ static int free_device_memory(struct hl_ctx *ctx, struct hl_mem_in *args)
>  			return -EINVAL;
>  		}
>  
> +		if (phys_pg_pack->exporting_cnt) {
> +			dev_err(hdev->dev,
> +				"handle %u is exported, cannot free\n",	handle);
> +			spin_unlock(&vm->idr_lock);

Don't write to the kernel log from user space triggered actions

> +static int alloc_sgt_from_device_pages(struct hl_device *hdev,
> +					struct sg_table **sgt, u64 *pages,
> +					u64 npages, u64 page_size,
> +					struct device *dev,
> +					enum dma_data_direction dir)

Why doesn't this return a sg_table * and an ERR_PTR?

> +{
> +	u64 chunk_size, bar_address, dma_max_seg_size;
> +	struct asic_fixed_properties *prop;
> +	int rc, i, j, nents, cur_page;
> +	struct scatterlist *sg;
> +
> +	prop = &hdev->asic_prop;
> +
> +	dma_max_seg_size = dma_get_max_seg_size(dev);

> +
> +	/* We would like to align the max segment size to PAGE_SIZE, so the
> +	 * SGL will contain aligned addresses that can be easily mapped to
> +	 * an MMU
> +	 */
> +	dma_max_seg_size = ALIGN_DOWN(dma_max_seg_size, PAGE_SIZE);
> +	if (dma_max_seg_size < PAGE_SIZE) {
> +		dev_err_ratelimited(hdev->dev,
> +				"dma_max_seg_size %llu can't be smaller than PAGE_SIZE\n",
> +				dma_max_seg_size);
> +		return -EINVAL;
> +	}
> +
> +	*sgt = kzalloc(sizeof(**sgt), GFP_KERNEL);
> +	if (!*sgt)
> +		return -ENOMEM;
> +
> +	/* If the size of each page is larger than the dma max segment size,
> +	 * then we can't combine pages and the number of entries in the SGL
> +	 * will just be the
> +	 * <number of pages> * <chunks of max segment size in each page>
> +	 */
> +	if (page_size > dma_max_seg_size)
> +		nents = npages * DIV_ROUND_UP_ULL(page_size, dma_max_seg_size);
> +	else
> +		/* Get number of non-contiguous chunks */
> +		for (i = 1, nents = 1, chunk_size = page_size ; i < npages ; i++) {
> +			if (pages[i - 1] + page_size != pages[i] ||
> +					chunk_size + page_size > dma_max_seg_size) {
> +				nents++;
> +				chunk_size = page_size;
> +				continue;
> +			}
> +
> +			chunk_size += page_size;
> +		}
> +
> +	rc = sg_alloc_table(*sgt, nents, GFP_KERNEL | __GFP_ZERO);
> +	if (rc)
> +		goto error_free;
> +
> +	/* Because we are not going to include a CPU list we want to have some
> +	 * chance that other users will detect this by setting the orig_nents
> +	 * to 0 and using only nents (length of DMA list) when going over the
> +	 * sgl
> +	 */
> +	(*sgt)->orig_nents = 0;

Maybe do this at the end so you'd have to undo it on the error path?

> +	cur_page = 0;
> +
> +	if (page_size > dma_max_seg_size) {
> +		u64 size_left, cur_device_address = 0;
> +
> +		size_left = page_size;
> +
> +		/* Need to split each page into the number of chunks of
> +		 * dma_max_seg_size
> +		 */
> +		for_each_sgtable_dma_sg((*sgt), sg, i) {
> +			if (size_left == page_size)
> +				cur_device_address =
> +					pages[cur_page] - prop->dram_base_address;
> +			else
> +				cur_device_address += dma_max_seg_size;
> +
> +			chunk_size = min(size_left, dma_max_seg_size);
> +
> +			bar_address = hdev->dram_pci_bar_start + cur_device_address;
> +
> +			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
> +			if (rc)
> +				goto error_unmap;
> +
> +			if (size_left > dma_max_seg_size) {
> +				size_left -= dma_max_seg_size;
> +			} else {
> +				cur_page++;
> +				size_left = page_size;
> +			}
> +		}
> +	} else {
> +		/* Merge pages and put them into the scatterlist */
> +		for_each_sgtable_dma_sg((*sgt), sg, i) {
> +			chunk_size = page_size;
> +			for (j = cur_page + 1 ; j < npages ; j++) {
> +				if (pages[j - 1] + page_size != pages[j] ||
> +						chunk_size + page_size > dma_max_seg_size)
> +					break;
> +
> +				chunk_size += page_size;
> +			}
> +
> +			bar_address = hdev->dram_pci_bar_start +
> +					(pages[cur_page] - prop->dram_base_address);
> +
> +			rc = set_dma_sg(sg, bar_address, chunk_size, dev, dir);
> +			if (rc)
> +				goto error_unmap;
> +
> +			cur_page = j;
> +		}
> +	}

We have this sg_append stuff now that is intended to help building
these things. It can only build CPU page lists, not these DMA lists,
but I do wonder if open coding in drivers is slipping back a
bit. Especially since AMD seems to be doing something different.

Could the DMABUF layer gain some helpers styled after the sg_append to
simplify building these things? and convert the AMD driver of course.

> +static int hl_dmabuf_attach(struct dma_buf *dmabuf,
> +				struct dma_buf_attachment *attachment)
> +{
> +	struct hl_dmabuf_wrapper *hl_dmabuf;
> +	struct hl_device *hdev;
> +	int rc;
> +
> +	hl_dmabuf = dmabuf->priv;
> +	hdev = hl_dmabuf->ctx->hdev;
> +
> +	rc = pci_p2pdma_distance_many(hdev->pdev, &attachment->dev, 1, true);
> +
> +	if (rc < 0)
> +		attachment->peer2peer = false;

Extra blank line

> +
> +	return 0;
> +}
> +
> +static struct sg_table *hl_map_dmabuf(struct dma_buf_attachment *attachment,
> +					enum dma_data_direction dir)
> +{
> +	struct dma_buf *dma_buf = attachment->dmabuf;
> +	struct hl_vm_phys_pg_pack *phys_pg_pack;
> +	struct hl_dmabuf_wrapper *hl_dmabuf;
> +	struct hl_device *hdev;
> +	struct sg_table *sgt;
> +	int rc;
> +
> +	hl_dmabuf = dma_buf->priv;
> +	hdev = hl_dmabuf->ctx->hdev;
> +	phys_pg_pack = hl_dmabuf->phys_pg_pack;
> +
> +	if (!attachment->peer2peer) {
> +		dev_err(hdev->dev,
> +			"Failed to map dmabuf because p2p is disabled\n");
> +		return ERR_PTR(-EPERM);

User triggered printable again?

> +static void hl_unmap_dmabuf(struct dma_buf_attachment *attachment,
> +				  struct sg_table *sgt,
> +				  enum dma_data_direction dir)
> +{
> +	struct scatterlist *sg;
> +	int i;
> +
> +	for_each_sgtable_dma_sg(sgt, sg, i)
> +		dma_unmap_resource(attachment->dev, sg_dma_address(sg),
> +					sg_dma_len(sg), dir,
> +					DMA_ATTR_SKIP_CPU_SYNC);

Why can we skip the CPU_SYNC? Seems like a comment is needed

Something has to do a CPU_SYNC before recylcing this memory for
another purpose, where is it?

> +static void hl_release_dmabuf(struct dma_buf *dmabuf)
> +{
> +	struct hl_dmabuf_wrapper *hl_dmabuf = dmabuf->priv;

Maybe hl_dmabuf_wrapper should be hl_dmabuf_priv

> + * export_dmabuf_from_addr() - export a dma-buf object for the given memory
> + *                             address and size.
> + * @ctx: pointer to the context structure.
> + * @device_addr:  device memory physical address.
> + * @size: size of device memory.
> + * @flags: DMA-BUF file/FD flags.
> + * @dmabuf_fd: pointer to result FD that represents the dma-buf object.
> + *
> + * Create and export a dma-buf object for an existing memory allocation inside
> + * the device memory, and return a FD which is associated with the dma-buf
> + * object.
> + *
> + * Return: 0 on success, non-zero for failure.
> + */
> +static int export_dmabuf_from_addr(struct hl_ctx *ctx, u64 device_addr,
> +					u64 size, int flags, int *dmabuf_fd)
> +{
> +	struct hl_dmabuf_wrapper *hl_dmabuf;
> +	struct hl_device *hdev = ctx->hdev;
> +	struct asic_fixed_properties *prop;
> +	u64 bar_address;
> +	int rc;
> +
> +	prop = &hdev->asic_prop;
> +
> +	if (!IS_ALIGNED(device_addr, PAGE_SIZE)) {
> +		dev_err_ratelimited(hdev->dev,
> +			"address of exported device memory should be aligned to 0x%lx, address 0x%llx\n",
> +			PAGE_SIZE, device_addr);
> +		return -EINVAL;
> +	}
> +
> +	if (size < PAGE_SIZE) {
> +		dev_err_ratelimited(hdev->dev,
> +			"size %llu of exported device memory should be equal to or greater than %lu\n",
> +			size, PAGE_SIZE);
> +		return -EINVAL;
> +	}
> +
> +	if (device_addr < prop->dram_user_base_address ||
> +				device_addr + size > prop->dram_end_address ||
> +				device_addr + size < device_addr) {
> +		dev_err_ratelimited(hdev->dev,
> +			"DRAM memory range is outside of DRAM boundaries, address 0x%llx, size 0x%llx\n",
> +			device_addr, size);
> +		return -EINVAL;
> +	}
> +
> +	bar_address = hdev->dram_pci_bar_start +
> +			(device_addr - prop->dram_base_address);
> +
> +	if (bar_address + size >
> +			hdev->dram_pci_bar_start + prop->dram_pci_bar_size ||
> +			bar_address + size < bar_address) {
> +		dev_err_ratelimited(hdev->dev,
> +			"DRAM memory range is outside of PCI BAR boundaries, address 0x%llx, size 0x%llx\n",
> +			device_addr, size);
> +		return -EINVAL;
> +	}

More prints from userspace

> +static int export_dmabuf_from_handle(struct hl_ctx *ctx, u64 handle, int flags,
> +					int *dmabuf_fd)
> +{
> +	struct hl_vm_phys_pg_pack *phys_pg_pack;
> +	struct hl_dmabuf_wrapper *hl_dmabuf;
> +	struct hl_device *hdev = ctx->hdev;
> +	struct asic_fixed_properties *prop;
> +	struct hl_vm *vm = &hdev->vm;
> +	u64 bar_address;
> +	u32 idr_handle;
> +	int rc, i;
> +
> +	prop = &hdev->asic_prop;
> +
> +	idr_handle = lower_32_bits(handle);

Why silent truncation? Shouldn't setting the upper 32 bits be an
error?

> +	case HL_MEM_OP_EXPORT_DMABUF_FD:
> +		rc = export_dmabuf_from_addr(ctx,
> +				args->in.export_dmabuf_fd.handle,
> +				args->in.export_dmabuf_fd.mem_size,
> +				args->in.flags,
> +				&dmabuf_fd);
> +		memset(args, 0, sizeof(*args));
> +		args->out.fd = dmabuf_fd;

Would expect the installed fd to be the positive return, not a pointer

Jason
