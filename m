Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0411AB14
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 13:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4826A6EB2E;
	Wed, 11 Dec 2019 12:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA7C6EB2E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 12:38:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q10so23857767wrm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 04:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oilqMrWOmUSWqLKTGEJQYVnIb6Khy8rZQCIwVkV2EgI=;
 b=KJqVnq80OYD3nHpLiKB4RCWguQxg3gbAVtmRJIBQyahJ2cRtyqyDo24gpCh3PvkZOx
 6a8X1IW2qjx02ByMsUMiXPy8XLnFUMVkQWttRFIURRebr1Gin1WWVnxvmX3RkhXVr8NA
 u+L8IgnOyLqjKoBcQNBX5FpGthRxI5USPeFLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=oilqMrWOmUSWqLKTGEJQYVnIb6Khy8rZQCIwVkV2EgI=;
 b=LLRdA1jJcLUKEu7HHGU4oOwjnelGabenSWE6z9WySx9cvw1VmMkLZAa37fJXJw6mZx
 0SuayKzsCsHKFW6cZP8jm8fViLZ8qzWehLOzOMzO61cM0749fg4JrntPsSPsObGAvkbY
 KKp62+j5bBGIA0dY8fWfdo0+V0YK+VNqSEMaH0B9vErWo34kfxtFPUteG8BxxaweCUkS
 WUJXm96xHGQLUmeo++jNpi3SHbygZYRFpSkpBxrvcLXxwjJxWMjmWQvOv7muhx94WNGT
 smUJ3LLxkCkv5voY1EckVtYt1hKLlI+XUHt5Qul/y7kCth//LTC7b+KsK3sWcXqIClyo
 Epfw==
X-Gm-Message-State: APjAAAX+VQdBN3IaHtDqJLk7FQod9cBtAJAnCMdOV6bNO9bUaduWtrpf
 Go67xbiRoi6EQOuEcYrCJcl/yQ==
X-Google-Smtp-Source: APXvYqxNEgdkHL4Hk1D8WjL8Exvt/tX0nokfJtSU3/y8Vl7lUKInCWQgPwwg8G6SR3+J2hh8OSF6KQ==
X-Received: by 2002:adf:dc8d:: with SMTP id r13mr3767933wrj.357.1576067917745; 
 Wed, 11 Dec 2019 04:38:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id n12sm2200963wmd.1.2019.12.11.04.38.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 04:38:37 -0800 (PST)
Date: Wed, 11 Dec 2019 13:38:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 1/4] drm: add pgprot callback to drm_gem_object_funcs
Message-ID: <20191211123835.GZ624164@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 gurchetansingh@chromium.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20191211121957.18637-1-kraxel@redhat.com>
 <20191211121957.18637-2-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211121957.18637-2-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 gurchetansingh@chromium.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 01:19:53PM +0100, Gerd Hoffmann wrote:
> The callback allows drivers and helpers to tweak pgprot for mappings.
> This is especially helpful when using shmem helpers.  It allows drivers
> to switch mappings from writecombine (default) to something else (cached
> for example) on a per-object base without having to supply their own
> mmap() and vmap() functions.
> 
> The patch also adds two implementations for the callback, for cached and
> writecombine mappings, and the drm_gem_pgprot() function to update
> pgprot for a given object, using the new &drm_gem_object_funcs.pgprot
> callback if available.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/drm/drm_gem.h     | 15 +++++++++++++
>  drivers/gpu/drm/drm_gem.c | 46 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 0b375069cd48..5beef7226e69 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -163,6 +163,17 @@ struct drm_gem_object_funcs {
>  	 */
>  	int (*mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  
> +	/**
> +	 * @pgprot:
> +	 *
> +	 * Tweak pgprot as needed, typically used to set cache bits.
> +	 *
> +	 * This callback is optional.
> +	 *
> +	 * If unset drm_gem_pgprot_wc() will be used.
> +	 */
> +	pgprot_t (*pgprot)(struct drm_gem_object *obj, pgprot_t prot);

I kinda prefer v1, mostly because this is a huge can of worms, and solving
this properly is going to be real hard (and will necessarily involve
dma-buf and dma-api and probably more). Charging ahead here just risks
that we dig ourselves into a corner. You're v1 is maybe not the most
clean, but just a few code bits here&there should be more flexible and
easier to hack on and experiment around with.
-Daniel

> +
>  	/**
>  	 * @vm_ops:
>  	 *
> @@ -350,6 +361,10 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>  		     struct vm_area_struct *vma);
>  int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>  
> +pgprot_t drm_gem_pgprot_cached(struct drm_gem_object *obj, pgprot_t prot);
> +pgprot_t drm_gem_pgprot_wc(struct drm_gem_object *obj, pgprot_t prot);
> +pgprot_t drm_gem_pgprot(struct drm_gem_object *obj, pgprot_t prot);
> +
>  /**
>   * drm_gem_object_get - acquire a GEM buffer object reference
>   * @obj: GEM buffer object
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 56f42e0f2584..1c468fe8e342 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1119,7 +1119,8 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>  			return -EINVAL;
>  
>  		vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
> -		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> +		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> +		vma->vm_page_prot = drm_gem_pgprot(obj, vma->vm_page_prot);
>  		vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>  	}
>  
> @@ -1210,6 +1211,49 @@ int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
>  }
>  EXPORT_SYMBOL(drm_gem_mmap);
>  
> +/**
> + * drm_gem_mmap - update pgprot for objects needing a cachable mapping.
> + * @obj: the GEM object.
> + * @prot: page attributes.
> + *
> + * This function can be used as &drm_gem_object_funcs.pgprot callback.
> + */
> +pgprot_t drm_gem_pgprot_cached(struct drm_gem_object *obj, pgprot_t prot)
> +{
> +	return prot;
> +}
> +EXPORT_SYMBOL(drm_gem_pgprot_cached);
> +
> +/**
> + * drm_gem_mmap - update pgprot for objects needing a wc mapping.
> + * @obj: the GEM object.
> + * @prot: page attributes.
> + *
> + * This function can be used as &drm_gem_object_funcs.pgprot callback.
> + */
> +pgprot_t drm_gem_pgprot_wc(struct drm_gem_object *obj, pgprot_t prot)
> +{
> +	return pgprot_writecombine(prot);
> +}
> +EXPORT_SYMBOL(drm_gem_pgprot_wc);
> +
> +/**
> + * drm_gem_mmap - update pgprot for a given gem object.
> + * @obj: the GEM object.
> + * @prot: page attributes.
> + *
> + * This function updates pgprot according to the needs of the given
> + * object.  If present &drm_gem_object_funcs.pgprot callback will be
> + * used, otherwise drm_gem_pgprot_wc() is called.
> + */
> +pgprot_t drm_gem_pgprot(struct drm_gem_object *obj, pgprot_t prot)
> +{
> +	if (obj->funcs->pgprot)
> +		return obj->funcs->pgprot(obj, prot);
> +	return drm_gem_pgprot_wc(obj, prot);
> +}
> +EXPORT_SYMBOL(drm_gem_pgprot);
> +
>  void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>  			const struct drm_gem_object *obj)
>  {
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
