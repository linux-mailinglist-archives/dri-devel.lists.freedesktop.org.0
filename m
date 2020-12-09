Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A002D3B9F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 07:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58DBA89AC9;
	Wed,  9 Dec 2020 06:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B6B8981D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 06:44:34 +0000 (UTC)
Date: Wed, 9 Dec 2020 08:44:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607496274;
 bh=nm1XpRO8wEjXGxSoNUUKePlW/cwmjJV9G1vreS0Qhz8=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=jhkZfbI482puH4s+5IT32A+6rw8/PHQwRZ/pD/pLX7QAKFjPkZrTd8rgOwzxhCB+n
 +Yxg0N0J7PW1QzqxJhbbiBvj5pkm6/pZZGMlBQzhGuTJuAnYbf12lYMYQ9Sxg/g8as
 fq+k89Wv27l96EoVjs+6QxD9mN+Dl52Iu783x5Wb+IDQUc9aUOCp7oXsTu2UDk5YOo
 SDKv5ZijirApwyP3iMpB3kppHGqhi9C9PO45QMhusthXtxkBk5Ek9RYCEgvZ/8pXMc
 IDZ0ME7t4NwnOVRBtTibulBHCh+BkJZLOfDMjUUjWpuJgT/kQZ6OhWJTBMlfogH6cj
 9aLGdDMHd9DWQ==
From: Leon Romanovsky <leon@kernel.org>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v14 4/4] RDMA/mlx5: Support dma-buf based userspace
 memory region
Message-ID: <20201209064430.GM4430@unreal>
References: <1607467155-92725-1-git-send-email-jianxin.xiong@intel.com>
 <1607467155-92725-5-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607467155-92725-5-git-send-email-jianxin.xiong@intel.com>
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

On Tue, Dec 08, 2020 at 02:39:15PM -0800, Jianxin Xiong wrote:
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
>  drivers/infiniband/hw/mlx5/main.c    |   2 +
>  drivers/infiniband/hw/mlx5/mlx5_ib.h |  18 +++++
>  drivers/infiniband/hw/mlx5/mr.c      | 128 +++++++++++++++++++++++++++++++++--
>  drivers/infiniband/hw/mlx5/odp.c     |  86 +++++++++++++++++++++--
>  4 files changed, 225 insertions(+), 9 deletions(-)

<...>

>
> +
> +	umem = ib_umem_dmabuf_get(&dev->ib_dev, offset, length, fd, access_flags,
> +				  &mlx5_ib_dmabuf_attach_ops);
> +	if (IS_ERR(umem)) {
> +		mlx5_ib_dbg(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
> +		return ERR_PTR(PTR_ERR(umem));

return ERR_CAST(umem);

> +	}

<...>

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

Let's write this section in kernel coding style, please

dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
err = ib_umem_dmabuf_map_pages(umem_dmabuf);
if (err) {
      dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);
      return err;
}
.....

Thanks
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
