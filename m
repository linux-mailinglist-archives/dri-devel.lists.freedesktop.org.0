Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D040AFE9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 15:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295B6E48C;
	Tue, 14 Sep 2021 13:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950496E48C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 13:56:41 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i23so20404808wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=BJpmi1XQksrmE+6cGS/DGj3dgnRtNEKtYHayJmsAAoM=;
 b=D4yt3Kc0GRkRqagRUNCu1KyedAtKxU/j+US12IdwxoOA+U7jkce9ZVoihpqUUne4PL
 TZzhvCKdolmMybBxCL31yulCMPTV64YgK7uSbxLVU441h8cStTdAWyjYeRTudwKMsoBx
 nzGOwcyeFt88uPl+BVP1gtgJA/oIfB7pgtb7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=BJpmi1XQksrmE+6cGS/DGj3dgnRtNEKtYHayJmsAAoM=;
 b=aupPMTpZxLMawRuwL8PDnoit96/wzSxcNbV1O2lQjzpZlX9vuWgGS61B9byGwfo0nz
 HO27AI7rqbbs4UmlXWlB5GFrCJkcve4eNmpRrLjBWIn6oJUmO3LuLeGThja+rqBMpmSJ
 YIbAA+FSjVN73XFVJogqMEFMfQhcNJsZf1UmZNMC272UoudSfrTnvSm9ac3Ey4SCadcH
 FenZt27oB2DU9ZMAyIfET+qm0WM0q+0lib9B9YlZa2pulJ8P+WrHXQs72GzXFujv5O+V
 TTr7mD+7w73VBk5KSXbFZToiuYoDueMxVRUBkscvF/IUt00Eozey3gHhx0hmeGQ9tWRY
 Bicg==
X-Gm-Message-State: AOAM532ft006USfzPSiyxiKo1ypz4ce8N3wFPvbqhV4HdsctUIL+UvuZ
 aosDKb3bPBSZ2NrSofKCq1qy6w==
X-Google-Smtp-Source: ABdhPJyDKElqKL755NRY0ePXn8wKr8HnluL3UEt4MtxABidMGqXOp6zHr06thq+3q69ls1ttFDdZaA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr10016355wrr.187.1631627800311; 
 Tue, 14 Sep 2021 06:56:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y8sm3539342wrh.44.2021.09.14.06.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:56:39 -0700 (PDT)
Date: Tue, 14 Sep 2021 15:56:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Brian Starkey <Brian.Starkey@arm.com>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Sandeep Patil <sspatil@google.com>,
 Daniel Mentz <danielmentz@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
 Leo Yan <leo.yan@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dma-buf: system_heap: Avoid warning on mid-order
 allocations
Message-ID: <YUCqFfalhgSTX249@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Liam Mark <lmark@codeaurora.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>,
 Brian Starkey <Brian.Starkey@arm.com>,
 Hridya Valsaraju <hridya@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Sandeep Patil <sspatil@google.com>,
 Daniel Mentz <danielmentz@google.com>,
 =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Simon Ser <contact@emersion.fr>, James Jones <jajones@nvidia.com>,
 Leo Yan <leo.yan@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210909023741.2592429-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210909023741.2592429-1-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Thu, Sep 09, 2021 at 02:37:41AM +0000, John Stultz wrote:
> When trying to do mid-order allocations, set __GFP_NOWARN to
> avoid warning messages if the allocation fails, as we will
> still fall back to single page allocatitions in that case.
> This is the similar to what we already do for large order
> allocations.
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Liam Mark <lmark@codeaurora.org>
> Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
> Cc: Laura Abbott <labbott@kernel.org>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: Hridya Valsaraju <hridya@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Sandeep Patil <sspatil@google.com>
> Cc: Daniel Mentz <danielmentz@google.com>
> Cc: Ørjan Eide <orjan.eide@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: James Jones <jajones@nvidia.com>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/heaps/system_heap.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 23a7e74ef966..f57a39ddd063 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -40,11 +40,12 @@ struct dma_heap_attachment {
>  	bool mapped;
>  };
>  
> +#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
> +#define MID_ORDER_GFP (LOW_ORDER_GFP | __GFP_NOWARN)
>  #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
>  				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
>  				| __GFP_COMP)
> -#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_COMP)
> -static gfp_t order_flags[] = {HIGH_ORDER_GFP, LOW_ORDER_GFP, LOW_ORDER_GFP};
> +static gfp_t order_flags[] = {HIGH_ORDER_GFP, MID_ORDER_GFP, LOW_ORDER_GFP};
>  /*
>   * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
>   * to match with the sizes often found in IOMMUs. Using order 4 pages instead
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
