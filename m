Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B64192ADB77
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 17:19:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E882892F0;
	Tue, 10 Nov 2020 16:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97617892F0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:19:32 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j7so6044599wrp.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BwMjI6U9romklg+hgAGIduU70JCtCyqReQL7WCIuHuk=;
 b=j/GJUYfg1mqjRtzdSIH0PDTQWNv8H3larekaQ50iMfediydsqgNPV5VnQiQzbjzFim
 U7TRqMFZvbiOkcPzPc5UXNNybO8hNA2y6YeWo6PfGqX44Qye21Pj802l1YZ3fsHZ1fgf
 ATg6ZjtmtX7afMNJ195u1GsODx6F7ER9YoKvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BwMjI6U9romklg+hgAGIduU70JCtCyqReQL7WCIuHuk=;
 b=VgVvXXZFnNCUUAOClcNRN89IDEZSNNP3J++ox3L1icPhWDI/UnFveKLbzqbLyx12U5
 G0lhWP6DQdny/n3+R/C8GUlINXedNRrILcinT9cr2fCrth5ANg4wAiiPxZfz0xWTkq7p
 X3VxjHAUh8gMTvSEEXsauOvXPSyQk+1fdRMS324RFbpMMuBQ2+W+L6LSNfXFvKwCXcIE
 WsO9A5IaAybciqRZgn2UYryLMsySygq9iPKxkmGr9C2JKIZ+CT4Rh2ckLJL6PngBvHNl
 xlfugPZPSyoPo9gV35WgmPMneh5n86SY1N8RPPYHQ1QrgZaCO1jP7AkylHA1xLgPf+Nq
 V6GA==
X-Gm-Message-State: AOAM5323yokD+lGWesbu1nvGwvej5CHESJ3t/DICH+zc/4TjnQ9RB4xC
 l0F9O+jbjxp3c/vD6tc67n3+Fg==
X-Google-Smtp-Source: ABdhPJxl2v/GJUtdpbMJkA+9neTZodZok7pEabgbRZYu6akGvx2SQecTa0IO0NcSLSqx84jcAYPIew==
X-Received: by 2002:a05:6000:182:: with SMTP id
 p2mr14632996wrx.116.1605025171327; 
 Tue, 10 Nov 2020 08:19:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m21sm4768649wmi.3.2020.11.10.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:19:30 -0800 (PST)
Date: Tue, 10 Nov 2020 17:19:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm: remove pgprot_decrypted() before calls to
 io_remap_pfn_range()
Message-ID: <20201110161928.GO401619@phenom.ffwll.local>
References: <0-v1-2e6a0db57868+166-drm_sme_clean_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0-v1-2e6a0db57868+166-drm_sme_clean_jgg@nvidia.com>
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 01:00:19PM -0400, Jason Gunthorpe wrote:
> commit f8f6ae5d077a ("mm: always have io_remap_pfn_range() set
> pgprot_decrypted()") moves the pgprot_decrypted() into
> io_remap_pfn_range(). Delete any, now confusing, open coded calls that
> directly precede io_remap_pfn_range():
> 
> - drm_io_prot() is only in drm_mmap_locked() to call io_remap_pfn_range()
> 
> - fb_mmap() immediately calls vm_iomap_memory() which is a convenience
>   wrapper for io_remap_pfn_range()
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Pushed to drm-misc-next now, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_vm.c         | 3 ---
>  drivers/video/fbdev/core/fbmem.c | 5 -----
>  2 files changed, 8 deletions(-)
> 
> rc3 will have the dependent patch, this should not be merged to DRM until it
> has the rc3 commits.
> 
> There are three other pgprot_decrypted() calls in DRM, I could not figure out
> what was what there, but other than very special cases I would expect code to
> use io_remap_pfn_range() instead.
> 
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index 1a636963378947..6d5a03b3223800 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -70,9 +70,6 @@ static pgprot_t drm_io_prot(struct drm_local_map *map,
>  {
>  	pgprot_t tmp = vm_get_page_prot(vma->vm_flags);
>  
> -	/* We don't want graphics memory to be mapped encrypted */
> -	tmp = pgprot_decrypted(tmp);
> -
>  #if defined(__i386__) || defined(__x86_64__) || defined(__powerpc__) || \
>      defined(__mips__)
>  	if (map->type == _DRM_REGISTERS && !(map->flags & _DRM_WRITE_COMBINING))
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 8268bbee8cae11..63a27a67a05cfa 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1386,11 +1386,6 @@ fb_mmap(struct file *file, struct vm_area_struct * vma)
>  	mutex_unlock(&info->mm_lock);
>  
>  	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
> -	/*
> -	 * The framebuffer needs to be accessed decrypted, be sure
> -	 * SME protection is removed
> -	 */
> -	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
>  	fb_pgprotect(file, vma, start);
>  
>  	return vm_iomap_memory(vma, start, len);
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
