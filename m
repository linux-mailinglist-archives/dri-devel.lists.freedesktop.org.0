Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794735C955
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 17:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26C56E5CC;
	Mon, 12 Apr 2021 15:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573CF6E5CF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:01:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e7so4319842wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 08:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M+HH3G3g/0pLTiCkQMZstEq/tur77cz6G2XS8DBz2dE=;
 b=ix9JuoI/ozWylCqKoLzYD5L5lA8zWaLIQ+2TERUpIcNJjgShygexyH9xqt9bJCGRLp
 oP2CfviW+k4becQZLC1B0u7cC7j8n5VcweQ7VNIkOlURB8+OzMCjN5+NWEzRViCD4XKm
 I5ZihGLYyA9TJoInk9IR+4ncy7d+Owry6pLME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M+HH3G3g/0pLTiCkQMZstEq/tur77cz6G2XS8DBz2dE=;
 b=r8uG0EoodTe/FKkhyZn5PC8G4oSAFh2+XdLrZa8G1UOLxeH5+us0hJpJMQZdFcRNPr
 tcHBEzFrLQJQ/mnPFtcrBaEfy9zsQPRbZ6+2j45UDQwaHEuirrxXZ8hK5e2DAGBCGUeX
 EXxz4X6SBUfLGKiycN0DjqyNjBUAuAxFznZmZDDM8Cm1nKzRXRenrTIYtWtsRs8qz3PI
 OB7SOwuzNBHk8PIZXp1eJhoOJpQg7jiGH+bgQPJCf3ufRKOf4Mmg65ZBMAC0jQ9gX0rx
 4deqvAIh3ZJ35vN36bW3jQNTTMCDthN9GceJVCGIP805rpGsP04JWZBkGf+/7jjgMC9Y
 7MsA==
X-Gm-Message-State: AOAM53048bAHf6fSk+63EGMtN4mFVLOf5lO1Lp4S6VYhpimIqq7ebAaP
 7cexdfyMqO+KqWmadR74SveUNQ==
X-Google-Smtp-Source: ABdhPJxrKIbUfalvmRCpk4xhyzDGPZRkbXbzk+VuA5SRlzaTXGJzvSD/ISTOoPraZ43LymKtrr197A==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr31633576wrt.117.1618239661977; 
 Mon, 12 Apr 2021 08:01:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm15738946wme.39.2021.04.12.08.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:01:01 -0700 (PDT)
Date: Mon, 12 Apr 2021 17:00:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 07/19] drm/i915/fbdev: Use lmem physical addresses for
 fb_mmap() on discrete
Message-ID: <YHRgq4SV2OF1rnUo@phenom.ffwll.local>
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-8-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412090526.30547-8-matthew.auld@intel.com>
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 10:05:14AM +0100, Matthew Auld wrote:
> From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> 
> use local memory io BAR address for fbdev's fb_mmap() operation on
> discrete, fbdev uses the physical address of our framebuffer for its
> fb_mmap() fn.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>

Sob missing (I didn't check all previous patches), but also I think we
should aim more to reuse drm fbdev helpers and retire our owns here.
Eventually, long-term, and all that.
-Daniel

> ---
>  drivers/gpu/drm/i915/display/intel_fbdev.c | 29 +++++++++++++++++-----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
> index ccd00e65a5fe..2b37959da747 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
> @@ -41,6 +41,8 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  
> +#include "gem/i915_gem_lmem.h"
> +
>  #include "i915_drv.h"
>  #include "intel_display_types.h"
>  #include "intel_fbdev.h"
> @@ -178,6 +180,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	unsigned long flags = 0;
>  	bool prealloc = false;
>  	void __iomem *vaddr;
> +	struct drm_i915_gem_object *obj;
>  	int ret;
>  
>  	if (intel_fb &&
> @@ -232,13 +235,27 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	info->fbops = &intelfb_ops;
>  
>  	/* setup aperture base/size for vesafb takeover */
> -	info->apertures->ranges[0].base = ggtt->gmadr.start;
> -	info->apertures->ranges[0].size = ggtt->mappable_end;
> +	obj = intel_fb_obj(&intel_fb->base);
> +	if (i915_gem_object_is_lmem(obj)) {
> +		struct intel_memory_region *mem = obj->mm.region;
> +
> +		info->apertures->ranges[0].base = mem->io_start;
> +		info->apertures->ranges[0].size = mem->total;
> +
> +		/* Use fbdev's framebuffer from lmem for discrete */
> +		info->fix.smem_start =
> +			(unsigned long)(mem->io_start +
> +					i915_gem_object_get_dma_address(obj, 0));
> +		info->fix.smem_len = obj->base.size;
> +	} else {
> +		info->apertures->ranges[0].base = ggtt->gmadr.start;
> +		info->apertures->ranges[0].size = ggtt->mappable_end;
>  
> -	/* Our framebuffer is the entirety of fbdev's system memory */
> -	info->fix.smem_start =
> -		(unsigned long)(ggtt->gmadr.start + vma->node.start);
> -	info->fix.smem_len = vma->node.size;
> +		/* Our framebuffer is the entirety of fbdev's system memory */
> +		info->fix.smem_start =
> +			(unsigned long)(ggtt->gmadr.start + vma->node.start);
> +		info->fix.smem_len = vma->node.size;
> +	}
>  
>  	vaddr = i915_vma_pin_iomap(vma);
>  	if (IS_ERR(vaddr)) {
> -- 
> 2.26.3
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
