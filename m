Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E151665D8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 19:10:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8072E6EE2A;
	Thu, 20 Feb 2020 18:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A136EE2B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 18:09:59 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e8so5704318wrm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 10:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xDxwz2/yKNwMtFCP3/U101Ym2o1nJcRuFA46gL2IxLo=;
 b=TbV/sKc5aCZTXsYxFu0A/49N+OzwF6J+Acp3GgCvYy0vitHUcwvDHXoy3AveUQHFSE
 /gVjZB7pJ+KPHThzCdhNyYOo0dl0KXKTButkhQWgARJDuBxsSUFzKVXwGK5Y4jrllLgz
 8mQy41Y8XzqeX4mb0hQ5idmXZWnc58DA44lSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xDxwz2/yKNwMtFCP3/U101Ym2o1nJcRuFA46gL2IxLo=;
 b=BDxtAyZzin91GOZjCl79q0SDHW/ygsPdQ6U1isbfOsKX8ce+Tfsqy4Xyzwad6QJK7X
 RVv9KND/VPVjDaeb4EMZkgzMYo3WOgN8W5JSpZ2nUVLmbO9l1BzAfyqsUosP5qJOyiXa
 0hk7+ZPJSNDKNFMf4e4UmdO0uHhyVlwEqhLi2P/XDzvsWyfLdPgu/KEEJazeha/chuFb
 LKjKIi00jm5K2SdOcBhMoFAiOma/vTdQ8XxIrFOFiNYsQUdujO+EtJd4eXFQ8U3t5YrB
 +NTuUfbzB0uPIitCMqjSu6td2JFADMt2dL6KwRMGrWFgzpRrUshUlI6323ojoHZpu/ew
 Ixvg==
X-Gm-Message-State: APjAAAXOD62ZZSAWE4ouRLgXI8GAlGIMYqCQtjjBEQ2ZYofWjWStKDAE
 5/RJjaHOZFatPBAuCaXi+ebd0A==
X-Google-Smtp-Source: APXvYqyzpU8hIRwkXXlEKJvnpazDtr1Nw8MAM8kfp8lLZurRUJl0JJ09BmFt5Ccz+GYdf2rv/kNGlw==
X-Received: by 2002:adf:e692:: with SMTP id r18mr43909745wrm.413.1582222198596; 
 Thu, 20 Feb 2020 10:09:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q3sm86108wmj.38.2020.02.20.10.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 10:09:57 -0800 (PST)
Date: Thu, 20 Feb 2020 19:09:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Nirmoy Das <nirmoy.aiemd@gmail.com>
Subject: Re: [PATCH 6/8] drm/vram-helper: don't use ttm bo->offset v2
Message-ID: <20200220180955.GT2363188@phenom.ffwll.local>
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <20200219135322.56463-7-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219135322.56463-7-nirmoy.das@amd.com>
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
Cc: thellstrom@vmware.com, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com, kraxel@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 02:53:20PM +0100, Nirmoy Das wrote:
> Calculate GEM VRAM bo's offset within vram-helper without depending on
> bo->offset
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 92a11bb42365..3edf5f241c15 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -198,6 +198,21 @@ u64 drm_gem_vram_mmap_offset(struct drm_gem_vram_object *gbo)
>  }
>  EXPORT_SYMBOL(drm_gem_vram_mmap_offset);
> 
> +/**
> + * drm_gem_vram_pg_offset() - Returns a GEM VRAM object's page offset
> + * @gbo:	the GEM VRAM object
> + *
> + * Returns:
> + * The buffer object's page offset, or
> + * 0 with a warning when memory manager node of the buffer object is NULL
> + * */

We generally don't add full formal kerneldoc for internal functions like
this. It won't get pulled into generated docs and generally just bitrots.
Just informal comment if it's really tricky, but the function name here is
clear enough I think.

So with the comment removed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +static s64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
> +{
> +	if (WARN_ON_ONCE(!gbo->bo.mem.mm_node))
> +		return 0;
> +	return gbo->bo.mem.start;
> +}
> +
>  /**
>   * drm_gem_vram_offset() - \
>  	Returns a GEM VRAM object's offset in video memory
> @@ -214,7 +229,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>  {
>  	if (WARN_ON_ONCE(!gbo->pin_count))
>  		return (s64)-ENODEV;
> -	return gbo->bo.offset;
> +	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
>  }
>  EXPORT_SYMBOL(drm_gem_vram_offset);
> 
> --
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
