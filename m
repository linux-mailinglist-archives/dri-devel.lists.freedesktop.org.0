Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D38203412
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 11:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F397E6E15A;
	Mon, 22 Jun 2020 09:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DCD6E15A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 09:56:47 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 17so508174wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F7tRoso4okHgzloM/c3qrplngWYdvfBJ4ANn6S/Yhuc=;
 b=GI9qkNrz795/XotIC7DGPNom7/J3QoFtoLFiMwfSithOAX+bHMZyCdSNEyK42nAxLs
 ZbGGwh7UfxQIeYteIVDZAqyhPvntED264sIJaAHD8WLqgeAVKWlTCTMjmyauUrGARlOp
 o+k+xd3168iwAf00wJb3cfAnDfgJDvPhZ+gAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F7tRoso4okHgzloM/c3qrplngWYdvfBJ4ANn6S/Yhuc=;
 b=nYRxBMepQ745CbmhWR/hEQvVxrb7YGi+XaeKQyMmdiCSGgrdKjhPglTxQ+zh94O/Z+
 z0dzGytBGwNWbgeh8W1KjjnT6EqUaRDA975NBm39YEVhZ0rZ2k5uqfkkOw7TlgJZF8Xb
 CMTlosPetu45lKR+c3p9R5CCuEItT3wL52X00gl4VnLM1YbS+j1yu7BolVGocvSEtB/2
 oHtxsLUrgA85PQytofxqytVwlwEBpPCikOHH/87bZzeIwFCOrF4ux5x3rzDAonVtJ+lG
 0PAPrLsCEmH/EPy5p81BQWmQ/S3dEBqHo6fqKAV2c9fHzzzSSJN43EasqRcLx/XZL2YM
 rnpA==
X-Gm-Message-State: AOAM531PJYOQhP49wzy/o1+cjLBlYPnePJs/6YmQaxoVXfi3LDVgNPC4
 /CmaBZvPZ9NEA2C45tKNLE8g6Q==
X-Google-Smtp-Source: ABdhPJxCL4sm4S5sIMUus72M9EfcShIJ7FollomcgsD0Mru0S9yrMPUxxMXfnEQZdFzL8Vpp1+iTTQ==
X-Received: by 2002:a1c:b7d5:: with SMTP id
 h204mr17599853wmf.100.1592819806471; 
 Mon, 22 Jun 2020 02:56:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c25sm4335675wml.46.2020.06.22.02.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:56:45 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:56:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2 6/8] drm/amdgpu: Unmap entire device address space on
 device remove.
Message-ID: <20200622095643.GH20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592719388-13819-7-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 02:03:06AM -0400, Andrey Grodzovsky wrote:
> Use the new TTM interface to invalidate all exsisting BO CPU mappings
> form all user proccesses.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 43592dc..6932d75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1135,6 +1135,7 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>  	struct drm_device *dev = pci_get_drvdata(pdev);
>  
>  	drm_dev_unplug(dev);
> +	ttm_bo_unmap_virtual_address_space(&adev->mman.bdev);
>  	amdgpu_driver_unload_kms(dev);

Hm a ttm, or maybe even vram helper function which wraps drm_dev_unplug +
ttm unmapping into one would be nice I think? I suspect there's going to
be more in the future here.
-Daniel

>  
>  	pci_disable_device(pdev);
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
