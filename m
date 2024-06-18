Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB890C561
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37B710E606;
	Tue, 18 Jun 2024 09:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="AQhnF6Nh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C9C210E607
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:35:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4212b102935so3644915e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718703319; x=1719308119; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JvMrPBgCReVozIZGcDRR/kzgpaQCooH9K4jB2LsfIus=;
 b=AQhnF6NhZJ8ms/a4ryhOVf8fFA3F2QS+JFr6NZAMtM9u+pvaD9+YgfE8tkSjO331QB
 s9chB2xCFhMqjDxqmgC2nzzG2pzsKKJAdXq5P8C7Hs9Ti7PflU49MVqNtD9F0kaiRhL+
 xK9zDDSgq5tfECFaS76aCX2zOyeqjNM/eSbtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718703319; x=1719308119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvMrPBgCReVozIZGcDRR/kzgpaQCooH9K4jB2LsfIus=;
 b=XvJ06eiVdG1z/HhI9cQF6x7gXVoS+HANyYeiFC6fhpSf9zVDl02WwpETYErUkfQh8t
 GE4TmBTK1/8YC804+ahYr30vmWSLTchyzvd93OqZjBA6AtQ5Gv1/rlyG3/29qwOkbvVs
 fbYQAzSqtop79RJIb5NL9dXv5q0Sb+NGOsF/GdhlT0sZio4EAbgoNEbTrNvmhe+g8Gf6
 ehrbI+XSJ0prJQgyjJd7WebnEPzPf8bfldFwWAR1o22HQ8kiZxARriFBXyR7M175Ozp2
 5MLvPnjNGyBsawPlEdcQUx0DpD2URxnvtkPB54qPaNJbQxhhLzgxG9O/AIA63zawvk7s
 b4QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVk+5YiIMkzJHLSD1PhjSGTg8Pl3lo2f+5GFDqcrd6/KxiUB73RNm7ZjDeFOzY9J1v9yAzdhmatuN4ApAP/DMAwj5+Mq5I9NDfbW60qzfW
X-Gm-Message-State: AOJu0Yw7QHnFLlyH98iwS3y+S3ESCoVV6JDS9NvJnhWLnidtSq4CsTDP
 0RT8irK9OceNOBdxbaRgHc5TyO5aIoIRwq2ZSkF6YWCgNFDAar1sL1mGosLx0RY=
X-Google-Smtp-Source: AGHT+IF/+uO95LmErOEf8gi75ElYdbTX5OXhXz8aEkEIsKdONPHbOScpFAENvMGunjPGMGG22bFtnQ==
X-Received: by 2002:a05:600c:3b9e:b0:422:ce5:2a3f with SMTP id
 5b1f17b1804b1-423056e01e6mr86149125e9.4.1718703319533; 
 Tue, 18 Jun 2024 02:35:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42307d5b78fsm135463655e9.6.2024.06.18.02.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:35:19 -0700 (PDT)
Date: Tue, 18 Jun 2024 11:35:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: peng.fan@oss.nxp.com, daniel@ffwll.ch, javierm@redhat.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/fbdev-dma: Only set smem_start is enable per module
 option
Message-ID: <ZnFU1cT8Sa81ynDg@phenom.ffwll.local>
References: <20240617152843.11886-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617152843.11886-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Mon, Jun 17, 2024 at 05:26:37PM +0200, Thomas Zimmermann wrote:
> Only export struct fb_info.fix.smem_start if that is required by the
> user and the memory does not come from vmalloc().
> 
> Setting struct fb_info.fix.smem_start breaks systems where DMA
> memory is backed by vmalloc address space. An example error is
> shown below.
> 
> [    3.536043] ------------[ cut here ]------------
> [    3.540716] virt_to_phys used for non-linear address: 000000007fc4f540 (0xffff800086001000)
> [    3.552628] WARNING: CPU: 4 PID: 61 at arch/arm64/mm/physaddr.c:12 __virt_to_phys+0x68/0x98
> [    3.565455] Modules linked in:
> [    3.568525] CPU: 4 PID: 61 Comm: kworker/u12:5 Not tainted 6.6.23-06226-g4986cc3e1b75-dirty #250
> [    3.577310] Hardware name: NXP i.MX95 19X19 board (DT)
> [    3.582452] Workqueue: events_unbound deferred_probe_work_func
> [    3.588291] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.595233] pc : __virt_to_phys+0x68/0x98
> [    3.599246] lr : __virt_to_phys+0x68/0x98
> [    3.603276] sp : ffff800083603990
> [    3.677939] Call trace:
> [    3.680393]  __virt_to_phys+0x68/0x98
> [    3.684067]  drm_fbdev_dma_helper_fb_probe+0x138/0x238
> [    3.689214]  __drm_fb_helper_initial_config_and_unlock+0x2b0/0x4c0
> [    3.695385]  drm_fb_helper_initial_config+0x4c/0x68
> [    3.700264]  drm_fbdev_dma_client_hotplug+0x8c/0xe0
> [    3.705161]  drm_client_register+0x60/0xb0
> [    3.709269]  drm_fbdev_dma_setup+0x94/0x148
> 
> Additionally, DMA memory is assumed to by contiguous in physical
> address space, which is not guaranteed by vmalloc().
> 
> Resolve this by checking the module flag drm_leak_fbdev_smem when
> DRM allocated the instance of struct fb_info. Fbdev-dma then only
> sets smem_start only if required (via FBINFO_HIDE_SMEM_START). Also
> guarantee that the framebuffer is not located in vmalloc address
> space.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Peng Fan (OSS) <peng.fan@oss.nxp.com>
> Closes: https://lore.kernel.org/dri-devel/20240604080328.4024838-1-peng.fan@oss.nxp.com/
> Fixes: b79fe9abd58b ("drm/fbdev-dma: Implement fbdev emulation for GEM DMA helpers")
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 6 +++---
>  drivers/gpu/drm/drm_fbdev_dma.c | 5 ++++-
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index e2e19f49342e1..18565ec684517 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -517,6 +517,9 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
>  	if (!info)
>  		return ERR_PTR(-ENOMEM);
>  
> +	if (!drm_leak_fbdev_smem)
> +		info->flags |= FBINFO_HIDE_SMEM_START;
> +
>  	ret = fb_alloc_cmap(&info->cmap, 256, 0);
>  	if (ret)
>  		goto err_release;
> @@ -1853,9 +1856,6 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
>  	info = fb_helper->info;
>  	info->var.pixclock = 0;
>  
> -	if (!drm_leak_fbdev_smem)
> -		info->flags |= FBINFO_HIDE_SMEM_START;
> -
>  	/* Need to drop locks to avoid recursive deadlock in
>  	 * register_framebuffer. This is ok because the only thing left to do is
>  	 * register the fbdev emulation instance in kernel_fb_helper_list. */
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 97ef6300d47e0..4b0527ddeb5a7 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -137,7 +137,10 @@ static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  		info->flags |= FBINFO_READS_FAST; /* signal caching */
>  	info->screen_size = sizes->surface_height * fb->pitches[0];
>  	info->screen_buffer = map.vaddr;
> -	info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
> +	if (!(info->flags & FBINFO_HIDE_SMEM_START)) {

I guess since the WARN is conditional on the explicit opt-in with
drm_leak_fbdev_smem it should be fine.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +		if (!drm_WARN_ON(dev, is_vmalloc_addr(info->screen_buffer)))
> +			info->fix.smem_start = page_to_phys(virt_to_page(info->screen_buffer));
> +	}
>  	info->fix.smem_len = info->screen_size;
>  
>  	/* deferred I/O */
> -- 
> 2.45.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
