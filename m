Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7321E5ACB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C906E50E;
	Thu, 28 May 2020 08:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0116E11C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:29:28 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f185so1114265wmf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3a+6oUJ3RVAXmDVoeSWKckQbnvzhZe/iIrVHhbckTSA=;
 b=ERqBDMdAnQDYPD9KzJ57eRE4d+vU/o813ShwTbfBLtbCPVIBgTaGUk/HN4PKVgHz5s
 ssiiZRJ60nWDc+hDFscU9QlTDVUzDb9MRNK98C0hJwkIiyOSSelVGtknQyCpx4ES2ly1
 yNdD/WL4E0sqjH6i2/6NDVraxFVCuAVJXsZxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3a+6oUJ3RVAXmDVoeSWKckQbnvzhZe/iIrVHhbckTSA=;
 b=dFFEvnLBtL00kyMrvl5+XgcANqMV70iVoj2E9mYwg19WBkf85da9CuONDT6yBNES7O
 TNskUgErckxsi9+Poyj6ajBadEhJP6UbwBlaL1PCZlPTZ/orJEiE4lpUh+C6ZZf7dFcm
 V4xlvSQXp5qQ2lYmDDUB3P4loDtRkYTVJrgtpXjFYGQlGD9occ7g5+eoHgiRk7gtp47C
 LKa/176l/wg6wdWF3mrZNIDpHtVGNAeKXuts/KV7WFWHIyDaI/oGScgEaVcAg7xJE1f3
 b7yzWKM2Gy3BegOANCrLCyxfFVyujxZtfidLq+rmrUGFShZjq63FCmSKOjuzUXCD4yBA
 ZEYA==
X-Gm-Message-State: AOAM530qEGbgPMbb95Y/VVWRvB438HXWeSAnqZQhzoymqcLuwWt1OvsF
 HvUFwRyU5+6td3jH40AwsqybhKzN4+8=
X-Google-Smtp-Source: ABdhPJw4yVmexsCHhZYQAMfsaB18NxRGTxyj/lu3EJI0gih192r5q6aVr+bET/fdfmcmLb2vss9cyA==
X-Received: by 2002:a05:600c:2201:: with SMTP id
 z1mr2224541wml.70.1590654567303; 
 Thu, 28 May 2020 01:29:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm5288810wro.91.2020.05.28.01.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 01:29:26 -0700 (PDT)
Date: Thu, 28 May 2020 10:29:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
Message-ID: <20200528082924.GT206103@phenom.ffwll.local>
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
 <20200514201117.465146-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 10:11:17PM +0200, Daniel Vetter wrote:
> I honestly don't exactly understand what's going on here, but the
> current code is wrong for sure: It calls dma_buf_vunmap without ever
> calling dma_buf_vmap.
> 
> What I'm not sure about is whether the WARN_ON is correct:
> - msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
>   a pretty neat layering violation of how you shouldn't peek behind
>   the curtain of the dma-buf exporter, but par for course. Note that
>   all the nice new helpers don't (and we should probably have a bit a
>   warning about this in the kerneldoc).
> 
> - but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
>   vmap() around any object with ->pages set (so including imported
>   dma-buf).
> 
> - I'm not seeing any guarantees that userspace can't use an imported
>   dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
>   guarantees that an imported dma-buf won't end up with a ->vaddr set.
> 
> But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
> calling dma_buf_vunmap is the wrong thing to do.
> 
> v2: Rob said in review that we do indeed have a gap in get_vaddr() that
> needs to be plugged. But the users I've found aren't legit users on
> imported dma-buf, so we can just reject that.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org

Ping for some review/ack so I can start landing thist stuff please?

Thanks, Daniel

> ---
>  drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 5a6a79fbc9d6..e70abd1cde43 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
>  	struct msm_gem_object *msm_obj = to_msm_bo(obj);
>  	int ret = 0;
>  
> +	if (obj->import_attach)
> +		return ERR_PTR(-ENODEV);
> +
>  	mutex_lock(&msm_obj->lock);
>  
>  	if (WARN_ON(msm_obj->madv > madv)) {
> @@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
>  	put_iova(obj);
>  
>  	if (obj->import_attach) {
> -		if (msm_obj->vaddr)
> -			dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
> +		WARN_ON(msm_obj->vaddr);
>  
>  		/* Don't drop the pages for imported dmabuf, as they are not
>  		 * ours, just free the array we allocated:
> -- 
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
