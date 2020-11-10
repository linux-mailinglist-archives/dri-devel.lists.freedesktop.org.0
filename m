Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7422AD10F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7738989911;
	Tue, 10 Nov 2020 08:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2A9893E8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 00:06:23 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id 7so3029200qtp.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 16:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yX5QL1qES3b/Bku6ul29vkGASbNkXxT4r025bOENuB0=;
 b=Q6FjnbBQqeSPoMQK5k6x1N8LrOVBM+a9yc6GvVS3kPEEOS4b76xtP4Qtr+Rf1Z7Hfv
 L91iIskGZs5++KTAT/jVked4JHq/Ro7OrmkKZXCJB+IUTnp4FeZ/9WlonwlagdVRJSSD
 nK1mcUMyz3WqP7mClbDQaVgIi7lsbOpiW7nymGw+fz2zvdqSzJHbsBvqhYYuV0FhfYrs
 pD+tB2X07xXx+9i9AZ6Le/OKnjtKdSoR1EXAt+BmJzsihksOemZKPxCqMAbtb/ss2Oft
 CK4nNUC8J+dbI8fvtfxHHW6ANJ3wbE7XIj78CLmEbkVbEPNDF8uhDkQi08/jZXJ1Fe6S
 qssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yX5QL1qES3b/Bku6ul29vkGASbNkXxT4r025bOENuB0=;
 b=k3nARczkKRERuTWJE3K0+hStDwaWnZ/afAKcFxRNuPVpUYXNGFvyWVLr/75e+JtjY0
 e2TJBrwYxz+hprAJGqsPM8GMWKEc597ZINvVLWKgaswIKERFGhXSFBB3fdGDez1swVuf
 ZHjEMGuNnyfnQHJ5KttvIFkJBvuCGn7TWqCPSJppu89kUZFpby3FZgKYeQa/gwpRaFEA
 eeY/9XE07RcJfHhmmM+EC4F6dv8VOo/aRyBPRwlnnvWvdtGn1WBIeuknrRUVKSOxoTrF
 EEDDtZAcyUn3qsUooszmlV3buQzM/GBlUeZ+1KFY87B4b+vcfyDq9WioksZW7GIapaXO
 GS5w==
X-Gm-Message-State: AOAM533xD5u3G5pICGtNYvlFzb/ru6GsVsf8FRQmyIS3PHUEm1hARG9l
 HRHc5/vTWclnQD54fTSZEux9tQ==
X-Google-Smtp-Source: ABdhPJxIze9PP+D+0OkbuVGb0ER2DW/fkIdpHngI4eWixp8ibhn+diXgdlruvw1rzzu8CNeXslT8aw==
X-Received: by 2002:ac8:615c:: with SMTP id d28mr15886785qtm.104.1604966782537; 
 Mon, 09 Nov 2020 16:06:22 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id k64sm7428185qkc.97.2020.11.09.16.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 16:06:21 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kcHAz-002AMB-Ar; Mon, 09 Nov 2020 20:06:21 -0400
Date: Mon, 9 Nov 2020 20:06:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jianxin Xiong <jianxin.xiong@intel.com>
Subject: Re: [PATCH v9 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201110000621.GK244516@ziepe.ca>
References: <1604949781-20735-1-git-send-email-jianxin.xiong@intel.com>
 <1604949781-20735-2-git-send-email-jianxin.xiong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604949781-20735-2-git-send-email-jianxin.xiong@intel.com>
X-Mailman-Approved-At: Tue, 10 Nov 2020 08:16:56 +0000
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

On Mon, Nov 09, 2020 at 11:22:57AM -0800, Jianxin Xiong wrote:

> +	page_size = ib_umem_find_best_pgsz(&umem_dmabuf->umem, PAGE_SIZE,
> +					   umem_dmabuf->umem.iova);
> +
> +	if (WARN_ON(cur != end || page_size != PAGE_SIZE)) {
> +		ib_umem_dmabuf_unmap_pages(umem_dmabuf);
> +		return -EINVAL;
> +	}

This is not a warn_on situation, users can trigger this

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
