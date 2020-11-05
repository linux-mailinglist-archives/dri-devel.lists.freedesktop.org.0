Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A84082A86F4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 20:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643B86EDE0;
	Thu,  5 Nov 2020 19:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ACE6EDE0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 19:21:38 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h62so2693396wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 11:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2Bk4/xqsWHJ+QJsuH2yoRO+5y/CB/BDylWZ+pDPbpiw=;
 b=cLlLYS880OFnzwuaVJSYqUA82GSGtJPqVxvK8a7NCHYIelpgUsEk8lndgHu4doJ9ij
 I54tsZ6AlNR5AWdqnwBcw+XfFXh6K+xiQET4mwmZOwRkYefDRX/kGJDH6Q1uHlZu4vRK
 7/tQ4lnBWIsvNVS8j5Hxfhh/NmnA0zOa8flEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2Bk4/xqsWHJ+QJsuH2yoRO+5y/CB/BDylWZ+pDPbpiw=;
 b=fHe/UiaqgQcIip/leX0iyQRuVfV1l5XJWOSB4cS5OGvQOsbvgo8iGL4tZZLAATH2Ih
 W8oTeH/CTHfa/4b3mWqoBMfrJdRCQHByS1B82vC3FzZnf85gNXmfWT0ep8vM5BSWfK0B
 p1LcpQGbAXCWPa7QqbVQlnjDfJxyOHqOOblidORZLolpfQOCd0gknMCFPdsO0OOToZAN
 VGmJjsaKqeUL+K5NFBk/LTrHDgll6F6LFb7qWvLVFbPQAA1r3m+aaUtONXrJFMZ4sShJ
 /4T5Q0rAAIrWS+Czoe4CWy7uLRq7t26zek+/772mCioRpEcLLJ22kx3Ik+MvC+jhzVT4
 RWiA==
X-Gm-Message-State: AOAM531YJbu+EkfvURQ6yZS4kXM+yFewOybbCEhNnwzshRNkc3bj+zew
 zC476IFUiDgP1CBYDfEbs0k7xQ==
X-Google-Smtp-Source: ABdhPJya2GsvFIQGCBU9AjvdCRvL9wo+O2cq9ySQRVtNRfCR1035RDtyDh0t5XdgNIcPQzyGdOWHDQ==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr4429173wms.77.1604604096667; 
 Thu, 05 Nov 2020 11:21:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f23sm3671445wmb.43.2020.11.05.11.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:21:35 -0800 (PST)
Date: Thu, 5 Nov 2020 20:21:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/gma500: Fix out-of-bounds access to struct
 drm_device.vblank[]
Message-ID: <20201105192133.GD401619@phenom.ffwll.local>
References: <20201105190256.3893-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105190256.3893-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 08:02:56PM +0100, Thomas Zimmermann wrote:
> The gma500 driver expects 3 pipelines in several it's IRQ functions.
> Accessing struct drm_device.vblank[], this fails with devices that only
> have 2 pipelines. An example KASAN report is shown below.
> 
>   [   62.267688] ==================================================================
>   [   62.268856] BUG: KASAN: slab-out-of-bounds in psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
>   [   62.269450] Read of size 1 at addr ffff8880012bc6d0 by task systemd-udevd/285
>   [   62.269949]
>   [   62.270192] CPU: 0 PID: 285 Comm: systemd-udevd Tainted: G            E     5.10.0-rc1-1-default+ #572
>   [   62.270807] Hardware name:  /DN2800MT, BIOS MTCDT10N.86A.0164.2012.1213.1024 12/13/2012
>   [   62.271366] Call Trace:
>   [   62.271705]  dump_stack+0xae/0xe5
>   [   62.272180]  print_address_description.constprop.0+0x17/0xf0
>   [   62.272987]  ? psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
>   [   62.273474]  __kasan_report.cold+0x20/0x38
>   [   62.273989]  ? psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
>   [   62.274460]  kasan_report+0x3a/0x50
>   [   62.274891]  psb_irq_postinstall+0x250/0x3c0 [gma500_gfx]
>   [   62.275380]  drm_irq_install+0x131/0x1f0
>   <...>
>   [   62.300751] Allocated by task 285:
>   [   62.301223]  kasan_save_stack+0x1b/0x40
>   [   62.301731]  __kasan_kmalloc.constprop.0+0xbf/0xd0
>   [   62.302293]  drmm_kmalloc+0x55/0x100
>   [   62.302773]  drm_vblank_init+0x77/0x210
> 
> Resolve the issue by only handling vblank entries up to the number of
> CRTCs.
> 
> I'm adding a Fixes tag for reference, although the bug has been present
> since the driver's initial commit.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 5c49fd3aa0ab ("gma500: Add the core DRM files and headers")
> Cc: Alan Cox <alan@linux.intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: stable@vger.kernel.org#v3.3+

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/gma500/psb_irq.c | 34 +++++++++++---------------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
> index 15eb3770d817..361e3a0c5ab6 100644
> --- a/drivers/gpu/drm/gma500/psb_irq.c
> +++ b/drivers/gpu/drm/gma500/psb_irq.c
> @@ -347,6 +347,7 @@ int psb_irq_postinstall(struct drm_device *dev)
>  {
>  	struct drm_psb_private *dev_priv = dev->dev_private;
>  	unsigned long irqflags;
> +	unsigned int i;
>  
>  	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
>  
> @@ -359,20 +360,12 @@ int psb_irq_postinstall(struct drm_device *dev)
>  	PSB_WVDC32(dev_priv->vdc_irq_mask, PSB_INT_ENABLE_R);
>  	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>  
> -	if (dev->vblank[0].enabled)
> -		psb_enable_pipestat(dev_priv, 0, PIPE_VBLANK_INTERRUPT_ENABLE);
> -	else
> -		psb_disable_pipestat(dev_priv, 0, PIPE_VBLANK_INTERRUPT_ENABLE);
> -
> -	if (dev->vblank[1].enabled)
> -		psb_enable_pipestat(dev_priv, 1, PIPE_VBLANK_INTERRUPT_ENABLE);
> -	else
> -		psb_disable_pipestat(dev_priv, 1, PIPE_VBLANK_INTERRUPT_ENABLE);
> -
> -	if (dev->vblank[2].enabled)
> -		psb_enable_pipestat(dev_priv, 2, PIPE_VBLANK_INTERRUPT_ENABLE);
> -	else
> -		psb_disable_pipestat(dev_priv, 2, PIPE_VBLANK_INTERRUPT_ENABLE);
> +	for (i = 0; i < dev->num_crtcs; ++i) {
> +		if (dev->vblank[i].enabled)
> +			psb_enable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> +		else
> +			psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> +	}
>  
>  	if (dev_priv->ops->hotplug_enable)
>  		dev_priv->ops->hotplug_enable(dev, true);
> @@ -385,6 +378,7 @@ void psb_irq_uninstall(struct drm_device *dev)
>  {
>  	struct drm_psb_private *dev_priv = dev->dev_private;
>  	unsigned long irqflags;
> +	unsigned int i;
>  
>  	spin_lock_irqsave(&dev_priv->irqmask_lock, irqflags);
>  
> @@ -393,14 +387,10 @@ void psb_irq_uninstall(struct drm_device *dev)
>  
>  	PSB_WVDC32(0xFFFFFFFF, PSB_HWSTAM);
>  
> -	if (dev->vblank[0].enabled)
> -		psb_disable_pipestat(dev_priv, 0, PIPE_VBLANK_INTERRUPT_ENABLE);
> -
> -	if (dev->vblank[1].enabled)
> -		psb_disable_pipestat(dev_priv, 1, PIPE_VBLANK_INTERRUPT_ENABLE);
> -
> -	if (dev->vblank[2].enabled)
> -		psb_disable_pipestat(dev_priv, 2, PIPE_VBLANK_INTERRUPT_ENABLE);
> +	for (i = 0; i < dev->num_crtcs; ++i) {
> +		if (dev->vblank[i].enabled)
> +			psb_disable_pipestat(dev_priv, i, PIPE_VBLANK_INTERRUPT_ENABLE);
> +	}
>  
>  	dev_priv->vdc_irq_mask &= _PSB_IRQ_SGX_FLAG |
>  				  _PSB_IRQ_MSVDX_FLAG |
> -- 
> 2.29.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
