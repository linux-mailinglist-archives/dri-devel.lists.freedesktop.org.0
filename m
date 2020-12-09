Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853902D3B73
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 07:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680FE6E10A;
	Wed,  9 Dec 2020 06:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3AE6E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:30:42 +0000 (UTC)
Date: Wed, 9 Dec 2020 08:30:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607495442;
 bh=FCsXHnNBphQDu3Pwh35xnOWUUwZUXkHuwg7GMeSSsC8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=hzoWDHMVS2zLSVQHe1Xe5JCFfO02oyBK3+pUWT3hMKF47u2CTTVIpp0BETkNlhFlS
 90q1j6VIRrc2f3pF7T9Rb23Dd67dohHs1FV2XFxcmqDJEv1eI4DOHvRbJOiimz9Euv
 LTT7EJqmBVc4lzC08ldQ+3Nyp/OV5n3wtndaf/8dAfpxtXa3UvRCrEVrThvT19a3mU
 97AKuABAgi9ejrtu/27ikjVB7+/TDA6BZUj2X5w75ZVo02GPrBOWTv91JVyqJcaH4r
 hMBytzvP+I+fsjsJ0NffNFwWweMhj36PUeJAoKN3YRD09h+6xY9COpcpJP+fbES5M4
 tkkjOVTmuiwGA==
From: Leon Romanovsky <leon@kernel.org>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v14 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201209063038.GL4430@unreal>
References: <1607467155-92725-1-git-send-email-jianxin.xiong@intel.com>
 <1607467155-92725-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607467155-92725-2-git-send-email-jianxin.xiong@intel.com>
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

On Tue, Dec 08, 2020 at 02:39:12PM -0800, Jianxin Xiong wrote:
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
>  drivers/infiniband/core/umem.c        |   3 +
>  drivers/infiniband/core/umem_dmabuf.c | 174 ++++++++++++++++++++++++++++++++++
>  include/rdma/ib_umem.h                |  47 ++++++++-
>  4 files changed, 222 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.c

<...>

> +int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
> +{
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	struct dma_fence *fence;
> +	unsigned long start, end, cur = 0;
> +	unsigned int nmap = 0;
> +	int i;
> +
> +	dma_resv_assert_held(umem_dmabuf->attach->dmabuf->resv);
> +
> +	if (umem_dmabuf->sgt)
> +		goto wait_fence;
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
> +wait_fence:
> +	/*
> +	 * Although the sg list is valid now, the content of the pages
> +	 * may be not up-to-date. Wait for the exporter to finish
> +	 * the migration.
> +	 */
> +	fence = dma_resv_get_excl(umem_dmabuf->attach->dmabuf->resv);
> +	if (fence)
> +		return dma_fence_wait(fence, false);

You called to dma_buf_map_attachment() earlier in this function, so if
you return an error here, the dma_buf won't be unmapped in pagefault_dmabuf_mr()

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
