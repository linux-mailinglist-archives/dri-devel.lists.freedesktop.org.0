Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D419A862
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 11:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D8E6E397;
	Wed,  1 Apr 2020 09:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A0B6E397
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 09:13:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a25so29678967wrd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=q0j1o05g8aFG+uaxxUGKxOxBttKAov588LF0QVeNw9U=;
 b=cZxwsRibrcyQ/IN4yh6EC+2FlL0FwEl0r4TH+Fi5VFVAQLINt0wq2p11t6yrM06rqd
 M1+3M+tAaQSdrYEKokBp/4B8/1Robk22SckGA5kxP1GqYhZQU9yuD1GM+L8zscxw3qw+
 KkPDxjvopTEgh+FkWDHD1eu4BEfY8+dR8VbT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q0j1o05g8aFG+uaxxUGKxOxBttKAov588LF0QVeNw9U=;
 b=DNTWE4ZruaLmwdrgbDWaZWosydphfKxwZmPtx5vuiRhhFaRvqitkvxFZ6ejXqGZ5WI
 Cx2s2QGGPOMXVUHYmiWfr2aNH3ULmlTkSpsFHG1Qqjld3VuTswNBQaLAn00Xn+x1Ut7+
 y/OF1/FC1OfR+nN/N13rGCRYs7KKtTuYphigV/nuBXsBzuReUhAZeRzFrO6XqzAA4LyJ
 SpgTLisF/nuwycQ7aZMcyuBBAoJMqBRAspRLVKYM1k59imvRPFTbjGfJfZsCG+AHzrtN
 hLzCpFcpShwkcTPxAFXDqJ3IP95ODoZUtN/MCTj7ZI97qZFHBPYoXLLNXWXfpjw80rQc
 Uswg==
X-Gm-Message-State: ANhLgQ3+Uc80EQuP0RFnm52j9LerJogHb1h2XlSkq8+bG+KLFFHKghUw
 t/CE0hC/6IfLyPc6C0gSLWQfJQ==
X-Google-Smtp-Source: ADFU+vvwNn2kwDvYx3EXQeGZw7h/CHEiNhl3EtFq4XuFakBuwGS8lpv5XZuVExE2fIJpZ+QpGje5/g==
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr24658922wrw.262.1585732437081; 
 Wed, 01 Apr 2020 02:13:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g186sm1884534wmg.36.2020.04.01.02.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 02:13:56 -0700 (PDT)
Date: Wed, 1 Apr 2020 11:13:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 2/2] drm/core: Calculate bpp in afbc helper
Message-ID: <20200401091354.GQ2363188@phenom.ffwll.local>
References: <CAKMK7uE67t-qWLXNo5FHDUubVWdb+sDxF=yijtM-0n626d-10g@mail.gmail.com>
 <20200331155308.6345-1-andrzej.p@collabora.com>
 <20200331155308.6345-3-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331155308.6345-3-andrzej.p@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>, dri-devel@lists.freedesktop.org,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 05:53:08PM +0200, Andrzej Pietrasiewicz wrote:
> Some drivers (komeda, malidp) don't set anything in cpp. If that is the
> case the right value can be inferred from the format. Then the "bpp" member
> can be eliminated from struct drm_afbc_framebuffer.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Didn't check computations, but yup this matches what I had in mind.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/todo.rst                   | 15 --------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 39 ++++++++++++++++----
>  include/drm/drm_framebuffer.h                |  7 ----
>  3 files changed, 32 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 37a3a023c114..439656f55c5d 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -404,21 +404,6 @@ Contact: Laurent Pinchart, respective driver maintainers
>  
>  Level: Intermediate
>  
> -Encode cpp properly in malidp
> ------------------------------
> -
> -cpp (chars per pixel) is not encoded properly in malidp, zero is
> -used instead. afbc implementation needs bpp or cpp, but if it is
> -zero it needs to be provided elsewhere, and so the bpp field exists
> -in struct drm_afbc_framebuffer.
> -
> -Properly encode cpp in malidp and remove the bpp field in struct
> -drm_afbc_framebuffer.
> -
> -Contact: malidp maintainers
> -
> -Level: Intermediate
> -
>  Core refactorings
>  =================
>  
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 6fb1841fa71c..cac15294aef6 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -309,11 +309,37 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>  
> +static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
> +				  const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	const struct drm_format_info *info;
> +
> +	info = drm_get_format_info(dev, mode_cmd);
> +
> +	/* use whatever a driver has set */
> +	if (info->cpp[0])
> +		return info->cpp[0] * 8;
> +
> +	/* guess otherwise */
> +	switch (info->format) {
> +	case DRM_FORMAT_YUV420_8BIT:
> +		return 12;
> +	case DRM_FORMAT_YUV420_10BIT:
> +		return 15;
> +	case DRM_FORMAT_VUY101010:
> +		return 30;
> +	default:
> +		break;
> +	}
> +
> +	/* all attempts failed */
> +	return 0;
> +}
> +
>  static int drm_gem_afbc_min_size(struct drm_device *dev,
>  				 const struct drm_mode_fb_cmd2 *mode_cmd,
>  				 struct drm_afbc_framebuffer *afbc_fb)
>  {
> -	const struct drm_format_info *info;
>  	__u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
>  	/* remove bpp when all users properly encode cpp in drm_format_info */
>  	__u32 bpp;
> @@ -351,12 +377,11 @@ static int drm_gem_afbc_min_size(struct drm_device *dev,
>  	afbc_fb->aligned_height = ALIGN(mode_cmd->height, h_alignment);
>  	afbc_fb->offset = mode_cmd->offsets[0];
>  
> -	info = drm_get_format_info(dev, mode_cmd);
> -	/*
> -	 * Change to always using info->cpp[0]
> -	 * when all users properly encode it
> -	 */
> -	bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
> +	bpp = drm_gem_afbc_get_bpp(dev, mode_cmd);
> +	if (!bpp) {
> +		drm_dbg_kms(dev, "Invalid AFBC bpp value: %d\n", bpp);
> +		return -EINVAL;
> +	}
>  
>  	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height)
>  		   / AFBC_SUPERBLOCK_PIXELS;
> diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
> index b53c0332f040..be658ebbec72 100644
> --- a/include/drm/drm_framebuffer.h
> +++ b/include/drm/drm_framebuffer.h
> @@ -331,13 +331,6 @@ struct drm_afbc_framebuffer {
>  	 * @afbc_size: minimum size of afbc buffer
>  	 */
>  	u32 afbc_size;
> -	/**
> -	 * @bpp: bpp value for this afbc buffer
> -	 * To be removed when users such as malidp
> -	 * properly store the cpp in drm_format_info.
> -	 * New users should not start using this field.
> -	 */
> -	u32 bpp;
>  };
>  
>  #define fb_to_afbc_fb(x) container_of(x, struct drm_afbc_framebuffer, base)
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
