Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FFC42C225
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0616E0C8;
	Wed, 13 Oct 2021 14:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95096E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 14:07:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r10so8748012wra.12
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MKxaZc1pgApmzpCUtsxcB625bqKcDpcD1a7kgFDuO2c=;
 b=L+k3W2pOKne4quT1JwDLgoYvBTDNcQO7CjmuZjq7JfRe+vfeIKBrKVplAhVpXWwuUa
 m50PhxWJ3zjFv8h5BW7Pe5vIfesh4gLNQbXQK1J+KKywDFrwP3zogV7U0QcHa2smoOZh
 bXCL/2qqYIwY+IrEwP/CBh9IGsi0ka4uPf54A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MKxaZc1pgApmzpCUtsxcB625bqKcDpcD1a7kgFDuO2c=;
 b=r0OTyKffBUoaj2wWNxmyBt53nRAKAjZNE+OUXez8IbtnO1HJXL/5Jdzuj5uHta7u51
 18N4UdaxD3NLsTlMijTmJTAmGvxdQbvYBfTo6lk0QqkvK3pqBfk/o3Ooz8wV5/w5hXYS
 cUwHIklyNGRoUfiPV7BKe2h1r2r995fR7vEm5OwDYxTmQuLYf1990nKeYNMc1M0SzrNO
 OXvCVv2TVLNLTpNNt3raZ0yvEPLFGSOJeHAYWDrnP7zBhaLcllY+8zkyjQ0UKAF0okrF
 N6Xmufvj0SrpyrolyW2P4MyiV6SSIgOTDdxR4J2/fefGIg4Ycb9lEPrKv50Wh67D0v/0
 aghQ==
X-Gm-Message-State: AOAM532nGu+Os5W/06mdSPdVzgRck6deCf3WOebIfazDHCrB9IsR1lYG
 MMDPrXF4QAj8cmkxDZkZoQPOmQ==
X-Google-Smtp-Source: ABdhPJwpY3GMpSXEeLezpKBdLRdIlDqC60mIwmphTOUCOalzhlFSIcORR+wr7zU2kxe9TM1Th2J1mg==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr13407345wmq.56.1634134068132; 
 Wed, 13 Oct 2021 07:07:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r27sm13404433wrr.70.2021.10.13.07.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 07:07:47 -0700 (PDT)
Date: Wed, 13 Oct 2021 16:07:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 daniel@ffwll.ch, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH 12/28] drm/amdgpu: use new iterator in
 amdgpu_ttm_bo_eviction_valuable
Message-ID: <YWboMfLOIjl1l7tF@phenom.ffwll.local>
References: <20211005113742.1101-1-christian.koenig@amd.com>
 <20211005113742.1101-13-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211005113742.1101-13-christian.koenig@amd.com>
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

On Tue, Oct 05, 2021 at 01:37:26PM +0200, Christian König wrote:
> Simplifying the code a bit.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index e8d70b6e6737..722e3c9e8882 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1345,10 +1345,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  					    const struct ttm_place *place)
>  {
>  	unsigned long num_pages = bo->resource->num_pages;
> +	struct dma_resv_iter resv_cursor;
>  	struct amdgpu_res_cursor cursor;
> -	struct dma_resv_list *flist;
>  	struct dma_fence *f;
> -	int i;
>  
>  	/* Swapout? */
>  	if (bo->resource->mem_type == TTM_PL_SYSTEM)
> @@ -1362,14 +1361,9 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  	 * If true, then return false as any KFD process needs all its BOs to
>  	 * be resident to run successfully
>  	 */
> -	flist = dma_resv_shared_list(bo->base.resv);
> -	if (flist) {
> -		for (i = 0; i < flist->shared_count; ++i) {
> -			f = rcu_dereference_protected(flist->shared[i],
> -				dma_resv_held(bo->base.resv));
> -			if (amdkfd_fence_check_mm(f, current->mm))
> -				return false;
> -		}
> +	dma_resv_for_each_fence(&resv_cursor, bo->base.resv, true, f) {

							    ^false?

At least I'm not seeing the code look at the exclusive fence here.
-Daniel

> +		if (amdkfd_fence_check_mm(f, current->mm))
> +			return false;
>  	}
>  
>  	switch (bo->resource->mem_type) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
