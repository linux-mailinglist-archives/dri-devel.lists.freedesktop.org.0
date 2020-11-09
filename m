Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642842AD124
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3433E899D4;
	Tue, 10 Nov 2020 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F075894C9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 20:52:35 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id n63so7049118qte.4
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 12:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h+5AS1UAN6IG5itjeosMYs/x5pZ1pPVekrx/fUTSQGA=;
 b=UAw9/1Oz58ga9K9N3oXk3xZcD/LnhKQyXgzvxSGqzkqbYZJHaNbAgARCUUxja1yFz2
 WXhDVyEGvSWw0l/i8jhadaYHM4JsPvo4kTye05bihGmZwav0k6TbkqPM29fRpS/wsvWJ
 MYXU4jOW8cTwqzhw3zlA7szl4ez/zp3y77+NGNO7YmpVtrqI1dIYL+f/69dgH4x2AQmQ
 LH6R7/9IRhvsL20Q3sU2pslj7fLHM7sE1S4/5MZCoVGkeTRwqDzs/Rd24QpbUoLzKv4P
 BbQT+YkgR84GsJXepnhv0T/qAcvDDg/m8GfxVGiND1m92TB1ekN32HnMtG3yYIrjardh
 jkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+5AS1UAN6IG5itjeosMYs/x5pZ1pPVekrx/fUTSQGA=;
 b=gEKvdCJ09TXXzBwtvrkzDBGohKX+jERoC8aRGp/pYGt9eK8p3jsVqpHivEVUvQpDgj
 VLA2z70xBL7J0bpJSktok0RPGW2JQcxPtPYLY1UGxCEI+M4ieO3t1kSaIfj4M9G41CQE
 SrAf/ayttWHyFRITcWZXrfSrn/WwIrR74hsdK+15s/GGiG3w10E6J5FO2rcvqPEsuuB6
 9bSCQT45aNvaMSwkOvqMe9EFktwzGaTp4LiPBMhWVR+B0hKyTtZ0OH+Ti8vGyix70rRW
 DdSA+24bO83OegIVLmK7QqJivTmnO5a0jfBiUQ16rhvpgHmRwooINUTKdnetnzFD3S48
 PkUA==
X-Gm-Message-State: AOAM533yg1ry4V8aA7/rTvj2Rg6wypml78a6qGjIcifi6CtxL8REO2ey
 RDo+SV1iA5hY2Cal7YFeFBNl5w==
X-Google-Smtp-Source: ABdhPJywNymnP2MR+G1kl8vN/jM3BTl2P5r2jzpnYkweiQvO0UUHaB8V8tMztuoOxJHNPOz53DUzLA==
X-Received: by 2002:ac8:1288:: with SMTP id y8mr14996277qti.177.1604955154334; 
 Mon, 09 Nov 2020 12:52:34 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id l3sm5075169qkj.114.2020.11.09.12.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 12:52:33 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kcE9Q-0026th-Pc; Mon, 09 Nov 2020 16:52:32 -0400
Date: Mon, 9 Nov 2020 16:52:32 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v9 4/5] RDMA/mlx5: Support dma-buf based userspace memory
 region
Message-ID: <20201109205232.GH244516@ziepe.ca>
References: <1604949781-20735-1-git-send-email-jianxin.xiong@intel.com>
 <1604949781-20735-5-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604949781-20735-5-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:57 +0000
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

On Mon, Nov 09, 2020 at 11:23:00AM -0800, Jianxin Xiong wrote:
> @@ -1291,8 +1303,11 @@ static struct mlx5_ib_mr *reg_create(struct ib_mr *ibmr, struct ib_pd *pd,
>  	int err;
>  	bool pg_cap = !!(MLX5_CAP_GEN(dev->mdev, pg));
>  
> -	page_size =
> -		mlx5_umem_find_best_pgsz(umem, mkc, log_page_size, 0, iova);
> +	if (umem->is_dmabuf)
> +		page_size = ib_umem_find_best_pgsz(umem, PAGE_SIZE, iova);
> +	else
> +		page_size = mlx5_umem_find_best_pgsz(umem, mkc, log_page_size,
> +						     0, iova);

Any place touching the sgl has to also hold the resv lock, and sgl
might be NULL since an invalidation could come in at any time, eg
before we get here.

You can avoid those problems by ingoring the SGL and hard wiring
PAGE_SIZE here

> +static int pagefault_dmabuf_mr(struct mlx5_ib_mr *mr, size_t bcnt,
> +			       u32 *bytes_mapped, u32 flags)
> +{
> +	struct ib_umem_dmabuf *umem_dmabuf = to_ib_umem_dmabuf(mr->umem);
> +	u32 xlt_flags = 0;
> +	int err;
> +
> +	if (flags & MLX5_PF_FLAGS_ENABLE)
> +		xlt_flags |= MLX5_IB_UPD_XLT_ENABLE;
> +
> +	dma_resv_lock(umem_dmabuf->attach->dmabuf->resv, NULL);
> +	err = ib_umem_dmabuf_map_pages(umem_dmabuf);
> +	if (!err)
> +		err = mlx5_ib_update_mr_pas(mr, xlt_flags);

This still has to call mlx5_umem_find_best_pgsz() each time the sgl
changes to ensure it is still Ok. Just checking that 

  mlx5_umem_find_best_pgsz() > PAGE_SIZE

and then throwing away the value is OK

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
