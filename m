Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A75F28474D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F03D6E422;
	Tue,  6 Oct 2020 07:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAC289CF2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 13:13:05 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id v123so11737798qkd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g/nm80+Ud0wRxvGfW3dlVEjR1+0DLL+VUhoF4LmgS+Q=;
 b=HHMoe12/eAzH/fwzfESo4EPwuolZOIMbQjNC5GQRJrIb3mESWoCqFb/+X48/ok5xAY
 1Ib5j6cJag2rt7rEGRcYQvbjvT6rY99IutD+lWrQU8ZQAc2QLQ8yiHaxqA+hTUm9R0AG
 5niHdR+a9omhIWYTsRo+b8q6GcK3Zs8XSzXSBOQxcbygY0/2oiGqrcWOgqeLm3zPijhF
 mb40XErkCkx8a657/zpPt7xIE+/WVgRfNKkWYIzrCp2tFDP+3BInjM7+gEMEf76WZHqQ
 mWS1lNBj11tGTpzFwmXWxgQhpUHsgSF55YjnC64n3+0PHEFGUfjNmCIcTTGmKI9MGu2d
 kCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g/nm80+Ud0wRxvGfW3dlVEjR1+0DLL+VUhoF4LmgS+Q=;
 b=MXMkDHZ4D6q5S4UyWLGCOsOJJ2zx3jLGiDVxVQpYBkhJlHnaICg2KUcPznuDFuQ4Cf
 4uvotRo4OTzk0p66S/xA+Pp4IvRzccWfhD7b8ipah/u1kV5A/s1jddFbH/S9AGDyjuQ7
 3m7gQQjL83E6u3dNiYvtM4lF+LPUA5dz5ZQBS3FDS2vrgrHruarv5t52MfmCavgoxfDu
 FdVcqy60Em62qqGXXeI5b1QQOx3659Rh/1vMslczgpenaaEo82sm87SF7Ec0DS6b5kgZ
 6JMiklhGTSj+3Y2bdUFs+akWjGljoIae0mbr7EpRI/1/77xqfGgU76iaFAAekZaCTvjo
 HN+Q==
X-Gm-Message-State: AOAM530oborZuWkRpADUWqiR2linTA5DuVEoCkTbM9VJGufJpg10Dllg
 /V2qgj3hUetAUq6JWX+zxfqNwQ==
X-Google-Smtp-Source: ABdhPJyrho8zIByNj5JL9HWW/xbMfB4xrHk9GWGi+3WSdBd2xnU203QhJSgXIPPx+itKthHZDwz+Yg==
X-Received: by 2002:a37:bec2:: with SMTP id o185mr13957738qkf.37.1601903584565; 
 Mon, 05 Oct 2020 06:13:04 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id p29sm7381872qtu.68.2020.10.05.06.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:13:03 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPQIY-007crb-Gz; Mon, 05 Oct 2020 10:13:02 -0300
Date: Mon, 5 Oct 2020 10:13:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201005131302.GQ9916@ziepe.ca>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
 dri-devel@lists.freedesktop.org, Doug Ledford <dledford@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 04, 2020 at 12:12:28PM -0700, Jianxin Xiong wrote:
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
> ---
>  drivers/infiniband/core/Makefile      |   2 +-
>  drivers/infiniband/core/umem.c        |   4 +
>  drivers/infiniband/core/umem_dmabuf.c | 291 ++++++++++++++++++++++++++++++++++
>  drivers/infiniband/core/umem_dmabuf.h |  14 ++
>  drivers/infiniband/core/umem_odp.c    |  12 ++
>  include/rdma/ib_umem.h                |  19 ++-
>  6 files changed, 340 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.c
>  create mode 100644 drivers/infiniband/core/umem_dmabuf.h

I think this is using ODP too literally, dmabuf isn't going to need
fine grained page faults, and I'm not sure this locking scheme is OK -
ODP is horrifically complicated.

If this is the approach then I think we should make dmabuf its own
stand alone API, reg_user_mr_dmabuf()

The implementation in mlx5 will be much more understandable, it would
just do dma_buf_dynamic_attach() and program the XLT exactly the same
as a normal umem.

The move_notify() simply zap's the XLT and triggers a work to reload
it after the move. Locking is provided by the dma_resv_lock. Only a
small disruption to the page fault handler is needed.

> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> +	sgt = dma_buf_map_attachment(umem_dmabuf->attach,
> +				     DMA_BIDIRECTIONAL);
> +	dma_resv_unlock(umem_dmabuf->attach->dmabuf->resv);

This doesn't look right, this lock has to be held up until the HW is
prorgammed

The use of atomic looks probably wrong as well.

> +	k = 0;
> +	total_pages = ib_umem_odp_num_pages(umem_odp);
> +	for_each_sg(umem->sg_head.sgl, sg, umem->sg_head.nents, j) {
> +		addr = sg_dma_address(sg);
> +		pages = sg_dma_len(sg) >> page_shift;
> +		while (pages > 0 && k < total_pages) {
> +			umem_odp->dma_list[k++] = addr | access_mask;
> +			umem_odp->npages++;
> +			addr += page_size;
> +			pages--;

This isn't fragmenting the sg into a page list properly, won't work
for unaligned things

And really we don't need the dma_list for this case, with a fixed
whole mapping DMA SGL a normal umem sgl is OK and the normal umem XLT
programming in mlx5 is fine.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
