Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686372C86D1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 15:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47CB89ED6;
	Mon, 30 Nov 2020 14:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4489ED6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:32:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o1so2540731wrx.7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=1izSrE5tIgte+y1yJePg5s3+P+hBR2gHJhVi9jRqD4Q=;
 b=NDVpU9VLchEJ8x8pxoh/NqTjZdE2GQ96DmheGPRwcS12219t7XRWd7c5RrCvm9jahr
 rzpJQlmnqq9/m26nRRoxUctoabq+9THeNHT9vIxiRjyi2vvSnSafWEBbRW4TCwcUC5ZK
 UOtdZ3APNagSW5LFgUW0fCEz+zBBKOy3G6xHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=1izSrE5tIgte+y1yJePg5s3+P+hBR2gHJhVi9jRqD4Q=;
 b=NrQNMf2KtmNq7IGjBI0cO5AZf1iae1KAUbnqYtvO/04UAFopulm1osfp72T9om7tvq
 z/4GbeOiwcXHMoEectkf6bhCOaUK0evMvJA/hrAsNaomZsfSQZh8nTSptV27mYdrIEuF
 /EfdWQ1r0RdcfF/cActfIivSr3+sFOtDFv9rQBIrlJZTM/HY4Z6iCKJ3yWUJus6OGUpQ
 ie+f0ADYOIBWHa5fLKOcQEfGhivkt6s82tcwpH3Z8UuiMomLpM6wHXHUAd2h4QlUWA0g
 eXRyA5FvWfV6XZLyiZvvOlo9cQnE/zUpREftodxRuQOij2/9T9uNRQk+B+qCAQxboGfC
 72fw==
X-Gm-Message-State: AOAM533MYAYzHT62HZCItbL7dG+EZACU3gU+RJQRvH9197pTSK/p532i
 5nRox6xPhkAOXTR+ERIy5bOm4Diy6t303w==
X-Google-Smtp-Source: ABdhPJzFZzm1pxUa1tzPVIl975jKOl71PdeKWbmbtr6Jv3Sb2mul/MxJ+GXaVbUEzZI9TgYlzlNxsQ==
X-Received: by 2002:a5d:4746:: with SMTP id o6mr7734934wrs.324.1606746764681; 
 Mon, 30 Nov 2020 06:32:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v20sm23112819wmh.44.2020.11.30.06.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 06:32:43 -0800 (PST)
Date: Mon, 30 Nov 2020 15:32:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jialin Zhang <zhangjialin11@huawei.com>
Subject: Re: [PATCH] drm/gma500: Fix error return code in psb_driver_load()
Message-ID: <20201130143241.GO401619@phenom.ffwll.local>
Mail-Followup-To: Jialin Zhang <zhangjialin11@huawei.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, Alan Cox <alan@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, huawei.libin@huawei.com
References: <20201130020216.1906141-1-zhangjialin11@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201130020216.1906141-1-zhangjialin11@huawei.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: huawei.libin@huawei.com, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 30, 2020 at 10:02:16AM +0800, Jialin Zhang wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jialin Zhang <zhangjialin11@huawei.com>

Out of curiosity, what is hulk robot matching here? This is a really
interesting bug for automated checkers to find!

Thanks for the patch, applied to drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 34b4aae9a15e..074f403d7ca0 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -313,6 +313,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
>  	if (ret)
>  		goto out_err;
>  
> +	ret = -ENOMEM;
> +
>  	dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, 0);
>  	if (!dev_priv->mmu)
>  		goto out_err;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
