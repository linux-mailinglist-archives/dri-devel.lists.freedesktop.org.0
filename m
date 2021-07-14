Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 858753C8384
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 13:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0953F6E214;
	Wed, 14 Jul 2021 11:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47D26E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:15:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d2so2808455wrn.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 04:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=i8/A30K8hudwTNghCdg8ZkcE46hRfkXp+xmcc8OkaCs=;
 b=garYAm0nyapXuSIT0H9wMaBmUorVzFAfU/jlf94Y9S/O55Q2w/dd0L+cbKlcKYgn+n
 OlAK6z3zcyfa1wvxMdrgRDKC4A2UghHj9lkS6yFe/wPT2UolaCZIPv+U7v48bl7BMciA
 L3mKXIBuVp+SJS6l0XVyv3P0wtRSZaE9E5k5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=i8/A30K8hudwTNghCdg8ZkcE46hRfkXp+xmcc8OkaCs=;
 b=kbf3gqQPcB8z9xE/Na2v6Su0yuV/lKUX3bSoFMiol9ezyR5usXD7PX4HCcwkSsG/z9
 uHW7DqexUx9PRN+v+6Cdf5v/5g5eftiA2ck5hILXnOZZhDluzXGozhl2N7ae+YCare3d
 f9FsiTljLIz4I5yR+nmJu78P5XgvFHgFBiI7EjFOTtJmvOZtoYaPGRl9w9ednwPXQOOE
 KNo163duUMSCnZIE27mX/NNtZRTzID1jOen05Z4ClAbyB7vTEcFopY0Jq55MdD/j6cXB
 cAD4utwJj61X0I5CsUlfzVUMo15kUWdI4mzsb5UWJY5XaVrsTVgZqhJyQJq15qXFiIu0
 GV7Q==
X-Gm-Message-State: AOAM532hTWvFI6uCJolx5ePkuJrzG6YuQMGprW4djiXeL8uB9vzTLXl/
 DE5zoaD1PdP1Xt+3pG1I5RW1UQ==
X-Google-Smtp-Source: ABdhPJyBNry25zXPTDcV0L0tWlzyF8WITqBCoYUMx1j4Uuqkk4hk+w/VhuOnMb5N17J9hKkni/zuAA==
X-Received: by 2002:a05:6000:551:: with SMTP id
 b17mr12123386wrf.32.1626261303434; 
 Wed, 14 Jul 2021 04:15:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m6sm2853947wrw.9.2021.07.14.04.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 04:15:02 -0700 (PDT)
Date: Wed, 14 Jul 2021 13:15:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
Message-ID: <YO7HNStidzhlHYe0@phenom.ffwll.local>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <YO6/8DWgD9d6tJcr@phenom.ffwll.local>
 <acc33c53-b56a-0da4-5706-414a444c6459@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acc33c53-b56a-0da4-5706-414a444c6459@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 12:51:15PM +0200, Christian König wrote:
> Am 14.07.21 um 12:44 schrieb Daniel Vetter:
> > On Mon, Jul 12, 2021 at 06:06:36PM -0400, Felix Kuehling wrote:
> > > KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> > > is_cow_mapping returns true for these mappings. Add a check for
> > > vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> > > PROT_NONE mappings.
> > > 
> > > v2: protect against mprotect making a mapping writable after the fact
> > > v3: update driver-specific vm_operations_structs
> > > 
> > > Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> > > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > So looking at vmf_insert_pfn_prot() and the comment there we can't have
> > VM_PFNMAP and is_cow_mapping ever be true, or things break. On platforms
> > without pte_special at least.
> 
> Key idea is that we never end up in vmf_insert_pfn_prot() because the vma is
> mapped with PROT_NONE.

Ah right if it's PROT_NONE then it's ok. But the code here only checks for
VM_WRITE, not VM_READ, so PROT_READ can get through and go boom? Or
something else I'm missing?

Maybe time for a few amdgpu mmap tests that go through the combos and make
sure it works/fails all correctly.
-Daniel

> > So I'm not sure this is a great idea, and definitely not for all drivers
> 
> Yeah, I'm absolutely not happy with this either but it seemed to be the
> least painful thing to do.
> 
> > ...
> > 
> > Can we clear VM_MAYWRITE instead to force this to be a non-cow mapping
> > instead?
> 
> Well we have considered forcefully setting VM_SHARED, which won't work
> easily for a couple of reasons.
> 
> But clearing VM_MAYWRITE in amdgpu/amdkfd may actually work as well.
> 
> Felix can you test this?
> 
> Thanks,
> Christian.
> 
> > -Daniel
> > 
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
> > >   drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
> > >   drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
> > >   drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
> > >   include/drm/ttm/ttm_bo_api.h             |  4 ++++
> > >   6 files changed, 24 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > index b3404c43a911..1aa750a6a5d2 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
> > >   	.fault = amdgpu_gem_fault,
> > >   	.open = ttm_bo_vm_open,
> > >   	.close = ttm_bo_vm_close,
> > > -	.access = ttm_bo_vm_access
> > > +	.access = ttm_bo_vm_access,
> > > +	.mprotect = ttm_bo_vm_mprotect
> > >   };
> > >   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > index 5b27845075a1..164ea564bb7a 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
> > >   	.fault = nouveau_ttm_fault,
> > >   	.open = ttm_bo_vm_open,
> > >   	.close = ttm_bo_vm_close,
> > > -	.access = ttm_bo_vm_access
> > > +	.access = ttm_bo_vm_access,
> > > +	.mprotect = ttm_bo_vm_mprotect
> > >   };
> > >   void
> > > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> > > index 458f92a70887..c19ad07eb7b5 100644
> > > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > > @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
> > >   	.fault = radeon_gem_fault,
> > >   	.open = ttm_bo_vm_open,
> > >   	.close = ttm_bo_vm_close,
> > > -	.access = ttm_bo_vm_access
> > > +	.access = ttm_bo_vm_access,
> > > +	.mprotect = ttm_bo_vm_mprotect
> > >   };
> > >   static void radeon_gem_object_free(struct drm_gem_object *gobj)
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > index f56be5bc0861..fb325bad5db6 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > >   }
> > >   EXPORT_SYMBOL(ttm_bo_vm_access);
> > > +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> > > +		       unsigned long end, unsigned long newflags)
> > > +{
> > > +	/* Enforce no COW since would have really strange behavior with it. */
> > > +	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> > > +		return -EINVAL;
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> > > +
> > >   static const struct vm_operations_struct ttm_bo_vm_ops = {
> > >   	.fault = ttm_bo_vm_fault,
> > >   	.open = ttm_bo_vm_open,
> > >   	.close = ttm_bo_vm_close,
> > >   	.access = ttm_bo_vm_access,
> > > +	.mprotect = ttm_bo_vm_mprotect,
> > >   };
> > >   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
> > >   {
> > >   	/* Enforce no COW since would have really strange behavior with it. */
> > > -	if (is_cow_mapping(vma->vm_flags))
> > > +	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
> > >   		return -EINVAL;
> > >   	ttm_bo_get(bo);
> > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > index e6b1f98ec99f..e4bf7dc99320 100644
> > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
> > >   		.fault = vmw_bo_vm_fault,
> > >   		.open = ttm_bo_vm_open,
> > >   		.close = ttm_bo_vm_close,
> > > +		.mprotect = ttm_bo_vm_mprotect,
> > >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > >   		.huge_fault = vmw_bo_vm_huge_fault,
> > >   #endif
> > > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > > index f681bbdbc698..40eb95875355 100644
> > > --- a/include/drm/ttm/ttm_bo_api.h
> > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
> > >   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > >   		     void *buf, int len, int write);
> > > +
> > > +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> > > +		       unsigned long end, unsigned long newflags);
> > > +
> > >   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> > >   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> > > -- 
> > > 2.32.0
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
