Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A466343E52F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 17:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E386E99C;
	Thu, 28 Oct 2021 15:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AA46E99B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:31:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b12so6479823wrh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hL5kYv1CarHgW1uHatZG8PW17bRHJOkVZlZSdM553dw=;
 b=W+Lsjm/zk2xcf1nUMxsY2ag/Vh6UXe9HjUMARh+Y+j6G/1ifM6RwKNd779axt5+KKx
 4mIjxJTVXpnS1x75JhRivtIWmzavUV9RFpUJOUph6YrF2K8YSJyXl9BUfCjCQs5yeiqd
 Uxaq+iZp/YVJDGGj1T/p4EShLO+4tbbKaBT/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hL5kYv1CarHgW1uHatZG8PW17bRHJOkVZlZSdM553dw=;
 b=qgavJhH6jassYhAWpF+HGtKh8IwAhSh+6DYAc+eP25ddJdOKjCP2sVLwD0TQIOccJV
 VOaPIL5cnSyGqdz5W9fdZNrnybkm01MSR1UsuD2arTITvTqKGs+XxNdYFAcafjybxeIm
 c0uGx7aQ0yw+pkBfguGeebkdApXKNiAv/HV1PErYfUnaLwj/lABGnkBy1T1ZpiZyoEko
 k3vujSk2WQoGP7YuMNj5yGgFd6Iv/QVfALFvASorIFiAVDXRvtnDUjU3Q4pdqWpDkfUl
 +aM/pXOzoLCGkmFQwMiQx5qFgP0eInFanGoliZQJ+vEMVm0ARoUEkbE9DiqUmhgwqgEQ
 zLJQ==
X-Gm-Message-State: AOAM530B4D8y6vmC/AxfiENl+x2PecPR31Sa24TWBBn+qea8lddYQQhp
 j/Dd837wH8Z2zodcInNatfTXvuv7owbwng==
X-Google-Smtp-Source: ABdhPJyBT8wQ9ZsTtrONr85ky0ZDPryye7lDqkD1AOJzQnpAEMov3ntsCCqhq2mJs9NYuh+SKMxcrg==
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr5859622wrt.131.1635435114386; 
 Thu, 28 Oct 2021 08:31:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n66sm2908134wmn.2.2021.10.28.08.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:31:53 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:31:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/dmabuf: drop the flush on
 discrete
Message-ID: <YXrCaBnFWxlD3zX4@phenom.ffwll.local>
References: <20211021125332.2455288-1-matthew.auld@intel.com>
 <20211021125332.2455288-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211021125332.2455288-2-matthew.auld@intel.com>
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

On Thu, Oct 21, 2021 at 01:53:32PM +0100, Matthew Auld wrote:
> We were overzealous here; even though discrete is non-LLC, it should
> still be always coherent.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index a45d0ec2c5b6..848e81368043 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -251,7 +251,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>  		return PTR_ERR(pages);
>  
>  	/* XXX: consider doing a vmap flush or something */
> -	if (!HAS_LLC(i915) || i915_gem_object_can_bypass_llc(obj))
> +	if ((!HAS_LLC(i915) && !IS_DGFX(i915)) ||
> +	    i915_gem_object_can_bypass_llc(obj))
>  		wbinvd_on_all_cpus();

I think a comment here why we do wbinvd and not clflush like everywhere
else here would be good. There's the XXX, but it's kinda not explaining
why vmap isn't a good idea.

Just an aside.
-Daneil
>  
>  	sg_page_sizes = i915_sg_dma_sizes(pages->sgl);
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
