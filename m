Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04904388B97
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5F16E29D;
	Wed, 19 May 2021 10:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3753F6E29D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 10:21:45 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id u133so6977554wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 03:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=agmM9r0ocVor9/dELzPhDyxV/Q6g4/KHl3BaIRPfQMo=;
 b=Q6r5E6/JTJ/+6maNrSQPa/GSrHfkMCdUNc4pqocJv5EXGNMDrowwxW1txNa/5N/+xk
 GYwR8lgHZ/BFD65gvsud0SnoBSz3HfCltufKq3dO9clYMX2s9Tcy+dbP2wX4TL8a2nNe
 n88muJcwXgf0oVKFKyBM87UMvPIeEOJKEJsJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=agmM9r0ocVor9/dELzPhDyxV/Q6g4/KHl3BaIRPfQMo=;
 b=bRFPQdJ4UOWt/NTFD4rMnmbIllOCfjtCfL9v/OCLkajwx5+UIcNjQI0qdw+RTD6+DL
 RIq7YGDyc7DYebeKOt4mxLEjRCbWkbEg2FVebmDBwgCoAF4hMHLnIw/n6zsuI6/h2Bfs
 J5bC7UL/Yyiz0xsNCeCVsfDosIJMbJBYLFaDO01w4jf2ypHuw8zSDwQ5rDplL8z482RO
 2JmTJ1+F2flaxYtVK9o98hBYN+GG8K3LdRAze84bKIuIa+nLiGqkaXEzJ7SLRBlmFnca
 tg7bTzs+rVC6x3Br3ixQKPkYiwXSImN3uIIp1riQ8mpmRM9GsYVrW7q9bXXeevYtcOqn
 cinA==
X-Gm-Message-State: AOAM533yiAtlnnsw6GU08zl2bNaGXrdGaXF4dgamo8I/sVm1g5T/XTmh
 gsyeVoNQtde6fy7kzhgj6nAmrsVimC1wCA==
X-Google-Smtp-Source: ABdhPJyrrNplyPF4l7h+AsOBRZFblqke572pHjkUgJUA7dvxQHAp9nrQ62XQOtKxwOeNoU38M3wWtw==
X-Received: by 2002:a7b:cc19:: with SMTP id f25mr10714124wmh.153.1621419703930; 
 Wed, 19 May 2021 03:21:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q13sm23556881wrw.56.2021.05.19.03.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 03:21:43 -0700 (PDT)
Date: Wed, 19 May 2021 12:21:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] drm: Fix missing unlock and free on error in
 drm_legacy_addbufs_pci()
Message-ID: <YKTmta3l0barePvJ@phenom.ffwll.local>
Mail-Followup-To: Zou Wei <zou_wei@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, joseph.kogut@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1621341302-112089-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621341302-112089-1-git-send-email-zou_wei@huawei.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: joseph.kogut@gmail.com, tzimmermann@suse.de, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 18, 2021 at 08:35:02PM +0800, Zou Wei wrote:
> Add the missing unlock and free before return from function
> drm_legacy_addbufs_pci() in the error handling case.
> 
> Fixes: 70556e24e18e ("drm: remove usage of drm_pci_alloc/free")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_bufs.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index 4805726..c23d7f7 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -984,8 +984,16 @@ int drm_legacy_addbufs_pci(struct drm_device *dev,
>  
>  	while (entry->buf_count < count) {
>  		dmah = kmalloc(sizeof(drm_dma_handle_t), GFP_KERNEL);
> -		if (!dmah)
> +		if (!dmah) {
> +			/* Set count correctly so we free the proper amount. */
> +			entry->buf_count = count;
> +			entry->seg_count = count;
> +			drm_cleanup_buf_error(dev, entry);
> +			kfree(temp_pagelist);
> +			mutex_unlock(&dev->struct_mutex);
> +			atomic_dec(&dev->buf_alloc);
>  			return -ENOMEM;
> +		}
>  
>  		dmah->size = total;
>  		dmah->vaddr = dma_alloc_coherent(dev->dev,
> -- 
> 2.6.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
