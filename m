Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C4720CD5B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 10:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2168892D5;
	Mon, 29 Jun 2020 08:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBD16E42F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:40:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f18so7592110wrs.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 01:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XPGELmvmPyp0l3PBD/Z3WxdBrLw+VvHz4YJsRIRSLI0=;
 b=IgTzdD0sX9wbfgZbDQ8QrakB7bBf/6Nsj+bMwA0xgLHMBhpiml0pT9VAvpjbY09OAl
 Pj/M1efhp/36kXzVk/FShfAT7Avzo+ZrS/rjxNYABFbhnlvJiHsV4ZWp5uCHn57PC3Bj
 qkEekFaj3t0YQNHt8zCl9SB1lTS0r48Uc/kqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XPGELmvmPyp0l3PBD/Z3WxdBrLw+VvHz4YJsRIRSLI0=;
 b=H2rEu0cXNxoAEFLECH0g3u+8xUrpymLzGZBMEVmHlJjJDTYQ0TnXonGSYB6N8G+A8Z
 HIYY5kmABfpFRbV5l/dQFGUIsMLtZ8dgvsua6bSLk49UIE2SJiWxRk2zCNF1ZWz2Sqv8
 0DmpOjJbdoN8PDOzzwipgpzKErxtT4L64J4ptNzVgLb74bortymDAoM869kybH6nruPy
 eA+NF1yl11Nz9zvPVgKr5n/FTNeq6gwoA33ybu8G8HWXtpO55fjfiqrf2t4ON1oDLXCc
 0GUnRofyO/B1B9JG2YYpRriMdwGV96yvk1YxL7a5Xip0l5jLP5V6zJhBj2//ZOy0yxph
 iv9w==
X-Gm-Message-State: AOAM531crPt3ZfRxfgDxIdMR3+K/sLZvMMqRInoNkKaY81oS4/MPsbEk
 mAMsdDqGtEPfCZ7NWKxBr7kKpQ==
X-Google-Smtp-Source: ABdhPJxZhhak6S4NkG3nol7uTWFJao7JU9QJ74TU+RRCRdEV+Xtd2ejQUyWaBv2pHmhQj/CbTbTboA==
X-Received: by 2002:a5d:6803:: with SMTP id w3mr15788942wru.200.1593420047734; 
 Mon, 29 Jun 2020 01:40:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm47316860wrq.15.2020.06.29.01.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:40:46 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:40:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/9] drm/format-helper: Pass destination pitch to
 drm_fb_memcpy_dstclip()
Message-ID: <20200629084044.GL3278063@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200625120011.16168-2-tzimmermann@suse.de>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 02:00:03PM +0200, Thomas Zimmermann wrote:
> The memcpy's destination buffer might have a different pitch than the
> source. Support different pitches as function argument.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But I do have questions ... why did we allocate a source drm_framebuffer
with mismatching pitch? That sounds backwards, especially for simplekms.

Would be good to add the reasons why we need this to the commit message,
I'm sure I'll discover it later on eventually.
-Daniel

> ---
>  drivers/gpu/drm/drm_format_helper.c    | 9 +++++----
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 2 +-
>  drivers/gpu/drm/tiny/cirrus.c          | 2 +-
>  include/drm/drm_format_helper.h        | 2 +-
>  4 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
> index c043ca364c86..8d5a683afea7 100644
> --- a/drivers/gpu/drm/drm_format_helper.c
> +++ b/drivers/gpu/drm/drm_format_helper.c
> @@ -52,6 +52,7 @@ EXPORT_SYMBOL(drm_fb_memcpy);
>  /**
>   * drm_fb_memcpy_dstclip - Copy clip buffer
>   * @dst: Destination buffer (iomem)
> + * @dst_pitch: Number of bytes between two consecutive scanlines within dst
>   * @vaddr: Source buffer
>   * @fb: DRM framebuffer
>   * @clip: Clip rectangle area to copy
> @@ -59,12 +60,12 @@ EXPORT_SYMBOL(drm_fb_memcpy);
>   * This function applies clipping on dst, i.e. the destination is a
>   * full (iomem) framebuffer but only the clip rect content is copied over.
>   */
> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
> -			   struct drm_framebuffer *fb,
> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch,
> +			   void *vaddr, struct drm_framebuffer *fb,
>  			   struct drm_rect *clip)
>  {
>  	unsigned int cpp = fb->format->cpp[0];
> -	unsigned int offset = clip_offset(clip, fb->pitches[0], cpp);
> +	unsigned int offset = clip_offset(clip, dst_pitch, cpp);
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y, lines = clip->y2 - clip->y1;
>  
> @@ -73,7 +74,7 @@ void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
>  	for (y = 0; y < lines; y++) {
>  		memcpy_toio(dst, vaddr, len);
>  		vaddr += fb->pitches[0];
> -		dst += fb->pitches[0];
> +		dst += dst_pitch;
>  	}
>  }
>  EXPORT_SYMBOL(drm_fb_memcpy_dstclip);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index f16bd278ab7e..7d4f3a62d885 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1586,7 +1586,7 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
>  	if (drm_WARN_ON(dev, !vmap))
>  		return; /* BUG: SHMEM BO should always be vmapped */
>  
> -	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
> +	drm_fb_memcpy_dstclip(mdev->vram, fb->pitches[0], vmap, fb, clip);
>  
>  	drm_gem_shmem_vunmap(fb->obj[0], vmap);
>  
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 744a8e337e41..2dd9e5e31e3d 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -327,7 +327,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  		goto out_dev_exit;
>  
>  	if (cirrus->cpp == fb->format->cpp[0])
> -		drm_fb_memcpy_dstclip(cirrus->vram,
> +		drm_fb_memcpy_dstclip(cirrus->vram, fb->pitches[0],
>  				      vmap, fb, rect);
>  
>  	else if (fb->format->cpp[0] == 4 && cirrus->cpp == 2)
> diff --git a/include/drm/drm_format_helper.h b/include/drm/drm_format_helper.h
> index 5f9e37032468..2b5036a5fbe7 100644
> --- a/include/drm/drm_format_helper.h
> +++ b/include/drm/drm_format_helper.h
> @@ -11,7 +11,7 @@ struct drm_rect;
>  
>  void drm_fb_memcpy(void *dst, void *vaddr, struct drm_framebuffer *fb,
>  		   struct drm_rect *clip);
> -void drm_fb_memcpy_dstclip(void __iomem *dst, void *vaddr,
> +void drm_fb_memcpy_dstclip(void __iomem *dst, unsigned int dst_pitch, void *vaddr,
>  			   struct drm_framebuffer *fb,
>  			   struct drm_rect *clip);
>  void drm_fb_swab(void *dst, void *src, struct drm_framebuffer *fb,
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
