Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EF13425D0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 20:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C096EA97;
	Fri, 19 Mar 2021 19:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDCC6EA97
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 19:10:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v11so10158132wro.7
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jZpUFw5riLd0C9+mvdtvugCUovm7ZDUvByCOa9/76ZQ=;
 b=QhR+4KSqTHgaKnWXgqZDaD4oyvTkcghD7MmZhFA4mM/vgZNq/zvisfJ4lTbhpNMaDk
 WuvekNJUiEA/uWdTT1o59OVsNAcXORuTDKyS6drhuWf8q4bLYMPF208DZ7sK3aB2JtLo
 dQde/mDhVwjY5i7YnPoiQJN6FQ7596ueC8wIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jZpUFw5riLd0C9+mvdtvugCUovm7ZDUvByCOa9/76ZQ=;
 b=UXRlc6ThKnd051+wvkhIHOPO0jf6kxTb4wEK3qkECP/LUhYADDvtgR1EvBVbFSdK9/
 8H++6GQDoVSpgNBF1i2p0RQ9Q7M4ynUAwVUJMrLyPPuVBzZS2+tJkBlfouosO4ggDDwK
 MMILrVuqKjy0gHg2H+IxjyBkLqQZMD9vYEE4BUhpeXisQ6dmpjilswWYh7JPq1k7uKQd
 Lm8aw3wXlYr4CTY4fhL/AscTQx7YjIB0hOZmNDA7HHvCR2HsZ5RQG671xkAdYdA+LXl1
 FrQMpsf13UjIeRdPYZTCDWFrpVv/4yvCCnqQKQn06J3avfUzfXIhpel+qF6uugsk7jAn
 pObQ==
X-Gm-Message-State: AOAM532e7WPx4Bx5p/ExJMMQKRYfvhPfMCEt6SeMcrSIlyFXRnTQMOS4
 iKrbxxtkjxjHWA8wRH0pRgX6p1KQV2mIuRhs
X-Google-Smtp-Source: ABdhPJzFO9WN+CgE2/RgrKtksHm0n51FPIRyY4UczFIou1uJWBnUN6p6hqCHNzK6RXb0lDvwSgUmfw==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr5802818wrx.129.1616181002238; 
 Fri, 19 Mar 2021 12:10:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z2sm9085005wrv.47.2021.03.19.12.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 12:10:01 -0700 (PDT)
Date: Fri, 19 Mar 2021 20:09:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/etnaviv: Use FOLL_FORCE for userptr
Message-ID: <YFT3B9fRldXI470m@phenom.ffwll.local>
References: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301095254.1946084-1-daniel.vetter@ffwll.ch>
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
Cc: John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 etnaviv@lists.freedesktop.org, stable@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 01, 2021 at 10:52:53AM +0100, Daniel Vetter wrote:
> Nothing checks userptr.ro except this call to pup_fast, which means
> there's nothing actually preventing userspace from writing to this.
> Which means you can just read-only mmap any file you want, userptr it
> and then write to it with the gpu. Not good.
> 
> The right way to handle this is FOLL_WRITE | FOLL_FORCE, which will
> break any COW mappings and update tracking for MAY_WRITE mappings so
> there's no exploit and the vm isn't confused about what's going on.
> For any legit use case there's no difference from what userspace can
> observe and do.
> 
> Cc: stable@vger.kernel.org
> Cc: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org

Can I please have an ack on this so I can apply it? It's stuck.

Thanks, Daniel

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 6d38c5c17f23..a9e696d05b33 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -689,7 +689,7 @@ static int etnaviv_gem_userptr_get_pages(struct etnaviv_gem_object *etnaviv_obj)
>  		struct page **pages = pvec + pinned;
>  
>  		ret = pin_user_pages_fast(ptr, num_pages,
> -					  !userptr->ro ? FOLL_WRITE : 0, pages);
> +					  FOLL_WRITE | FOLL_FORCE, pages);
>  		if (ret < 0) {
>  			unpin_user_pages(pvec, pinned);
>  			kvfree(pvec);
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
