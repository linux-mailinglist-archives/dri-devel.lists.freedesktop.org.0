Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A1053A5EA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 15:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96DE10E5DF;
	Wed,  1 Jun 2022 13:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A558E10E68A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 13:26:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id z17so978486wmf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=noaGYaAS2ngUF9rHVIdsqxhgMZ5al5C5XajbVIc9isw=;
 b=U9Q37OOk4NWi1lfVMCL5nxB3ANIs4vKn/tkhmKrp4ANPiZCL7MccGApGO1NslW5urV
 VY3DyS4a3zVHfSl+H82ZxVMr5vz+nBIuGEx2a6jX0pacMGcibgvLq0wxWDSXydyynAFC
 W/hDJDd57aiuvLD+4bvNQXITPUzouz0cAir9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=noaGYaAS2ngUF9rHVIdsqxhgMZ5al5C5XajbVIc9isw=;
 b=U/KjWp8I+C3zzsVowBQyxargn4nzA8+71FXO8gmIV7J9ljL5/u5OhDsWd2js9n4zMF
 Yyu4KFM5BXFyheb1Ayc1Okw7ebYLRRI8ZZI6RwLDVDYVKHI/LuNFuqXf+P3kWuRkBJnX
 HvlS0OoZ3diyUtD9IyGZCyFMgZwYpbx1ki7ZBQOK0inVSCibMQ5W0t9lEd6t9345Ea1k
 u9hklJpLM4/bxrhogfVjFsebMPbPa9bIA15wVzA38gzfzvKLFB7elgBJ5e3N5poLKZzc
 95dve6R4My5SBNiDJhZVRxzzSUYAwP13IZnBWAFHqycO/NcbAdEwc2cHv+u+lKdVtU22
 1hMQ==
X-Gm-Message-State: AOAM531xv95dvnWLwUCcsyDKLiIWd6q8NryG1xS+zHkRErd8obNZ8d0Q
 A3zwFuYN5OESJ41nln+sMgSW3Q==
X-Google-Smtp-Source: ABdhPJxmblSP3nC88vFqaAjKJ7iAz+rr7pZAeiJzY+x4Fx1vknqCtD2WNZKbvxTL/xgpNn9A/fjafg==
X-Received: by 2002:a05:600c:1f18:b0:39c:2360:d824 with SMTP id
 bd24-20020a05600c1f1800b0039c2360d824mr2178484wmb.75.1654089996195; 
 Wed, 01 Jun 2022 06:26:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m30-20020a05600c3b1e00b00395f15d993fsm5809686wms.5.2022.06.01.06.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 06:26:35 -0700 (PDT)
Date: Wed, 1 Jun 2022 15:26:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v3] drm/v3d/v3d_drv: Fix PM disable depth imbalance
Message-ID: <YpdpCWW9+igsVydr@phenom.ffwll.local>
Mail-Followup-To: Miaoqian Lin <linmq006@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220601122050.1822-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601122050.1822-1-linmq006@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 04:20:50PM +0400, Miaoqian Lin wrote:
> The pm_runtime_enable will increase power disable depth.
> If the probe fails, we should use pm_runtime_disable() to balance
> pm_runtime_enable().
> Also call disable function in remove function.
> 
> Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> Changes in v3:
> - call pm_runtime_disable() in v3d_platform_drm_remove
> - update commit message
> 
> Changes in v2
> - put pm_runtime_disable before dma_free_wc
> - rename dma_free to pm_disable
> 
> v1: https://lore.kernel.org/r/20220105120442.14418-1-linmq006@gmail.com
> v2: https://lore.kernel.org/r/20220106124657.32737-1-linmq006@gmail.com

Maybe a bit late since we're at v3 already, but are there no devm_
functions here that would dtrt automatically? Or is there another reason
we can't use them?
-Daniel
> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 1afcd54fbbd5..f3380399fe17 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -286,7 +286,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>  
>  	ret = v3d_gem_init(drm);
>  	if (ret)
> -		goto dma_free;
> +		goto pm_disable;
>  
>  	ret = v3d_irq_init(v3d);
>  	if (ret)
> @@ -302,7 +302,8 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
>  	v3d_irq_disable(v3d);
>  gem_destroy:
>  	v3d_gem_destroy(drm);
> -dma_free:
> +pm_disable:
> +	pm_runtime_disable(dev);
>  	dma_free_wc(dev, 4096, v3d->mmu_scratch, v3d->mmu_scratch_paddr);
>  	return ret;
>  }
> @@ -316,6 +317,7 @@ static int v3d_platform_drm_remove(struct platform_device *pdev)
>  
>  	v3d_gem_destroy(drm);
>  
> +	pm_runtime_disable(&pdev->dev);
>  	dma_free_wc(v3d->drm.dev, 4096, v3d->mmu_scratch,
>  		    v3d->mmu_scratch_paddr);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
