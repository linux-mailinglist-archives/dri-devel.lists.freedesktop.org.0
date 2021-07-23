Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 816A23D3746
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC44A6E880;
	Fri, 23 Jul 2021 09:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BB36E852
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:00:27 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hs23so2457180ejc.13
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=H26XLDHAuR0jPZ2O2Q0bOo1MF/EVyLPQLBSZ6hdsVnM=;
 b=BiQl2gBbigvHJE/9/tHAh7I+BwJmeQGRnucu07I6wHNJ0qPhWZChQPXnHDdONxxB80
 fc82S5R044fRYwcTJ2ELDam/CC5efspA2CuaVREFuvzbd/OM4BqTPki+AWtrcKYU3Jqz
 H5hEXS2uTlpgWgJgE+ShQtKqt+TSoczqoyMxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=H26XLDHAuR0jPZ2O2Q0bOo1MF/EVyLPQLBSZ6hdsVnM=;
 b=Y8tVBQim+AnM0jZau5xuzZwAAWSsKVHflzNqL+4ZTkW3Ii4SWRKOlgbukF6YQBmXPn
 +9ebNJ5lGlkuH8Wn/xNoKW7EUWizEHzwuwZ7TtLzuEodzB7jpCv0qd5sCSb92eEOzWXy
 mbOho34+SuY/MIMknymj26gxiftKxIvY4aJEHMlE0+8hICVgElAdpVdSkpQ71IF4rWFo
 8JI/fXvV6O7W6wJv+MJSIBPdkGwpyNEeU6lzkxYBG7KMFcB8F3jd/TFQQLfeLPUpv6SN
 3QOrXhLfDayZ1fdy3zndxE808O5tZPBxw/XHxiL1Z1zjrq8Rgt+59qx2Ir+wP2APT1fL
 p+jg==
X-Gm-Message-State: AOAM532jXTo3jFzZNDMRIEztRsqH8SxQ6Y/PlC4JbQLwXNID8qnwuqR2
 gKk4GE1tzK1A8PdW4Q1pzZCn2g==
X-Google-Smtp-Source: ABdhPJxaqRvTTcawwQoh7Z4vp5PxhjTlxsn7RgYfy3eAl/e8KGn8cJ6GjJc+BMI4dcYMZFxDziF80Q==
X-Received: by 2002:a17:906:86d0:: with SMTP id
 j16mr3701421ejy.20.1627030825944; 
 Fri, 23 Jul 2021 02:00:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b25sm13844275edv.9.2021.07.23.02.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 02:00:25 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:00:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
Message-ID: <YPqFJ0GSciZnyszl@phenom.ffwll.local>
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
 <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
 <1dd35814-c2bb-6e71-6259-e9d4f77d8969@amd.com>
 <CAKMK7uH7YUgFUkgdrRrxypqkHoYx_NN6vcvTB=LOwVGDriov9Q@mail.gmail.com>
 <ab0b302e-436a-f5e6-b111-957f79d18da0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab0b302e-436a-f5e6-b111-957f79d18da0@gmail.com>
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 10:33:48AM +0200, Christian König wrote:
> 
> 
> Am 23.07.21 um 10:21 schrieb Daniel Vetter:
> > On Wed, Jul 14, 2021 at 10:51 AM Christian König
> > <christian.koenig@amd.com> wrote:
> > > 
> > > 
> > > Am 13.07.21 um 17:28 schrieb Alex Deucher:
> > > > On Tue, Jul 13, 2021 at 2:57 AM Christian König
> > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > 
> > > > > Am 13.07.21 um 00:06 schrieb Felix Kuehling:
> > > > > > KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> > > > > > is_cow_mapping returns true for these mappings. Add a check for
> > > > > > vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> > > > > > PROT_NONE mappings.
> > > > > > 
> > > > > > v2: protect against mprotect making a mapping writable after the fact
> > > > > > v3: update driver-specific vm_operations_structs
> > > > > > 
> > > > > > Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> > > > > > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > > Are you planning to push this to drm-misc?
> > > Yes, just didn't found time yesterday.
> > This is pushed to the wrong tree drm-misc-next-fixes, should have been
> > in drm-misc-fixes. Please be careful with that because every time that
> > goes wrong the script gets confused about which the current tree is,
> > and pushes the wrong tree to linux-next branches.
> > 
> > I'm going to hard-reset drm-misc-next-fixes now and hope that's good
> > enough to fix things up (since Thomas is not around all the time for
> > this merge window).
> 
> STOP! I'm about to push a revert for this patch.
> 
> And yes that was pushed to the wrong branch, but it turned out that this was
> fortunate since the patch doesn't work correctly.

Well I just hard-reset, so you can push the right patch to the right
branch now. The trouble is that outside of the merge window no one is
allowed to push to drm-misc-next-fixes. If you do, then dim pushes
drm-misc-next-fixes to for-linux-next instead of drm-misc-next, and we
have bad surprises.

Which unfortunately happens like every merge window a few times and always
takes a few days/weeks to get caught.
-Danie

> 
> Christian.
> 
> > -Daniel
> > 
> > 
> > > Christian.
> > > 
> > > > Alex
> > > > 
> > > > > > ---
> > > > > >     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
> > > > > >     drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
> > > > > >     drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
> > > > > >     drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
> > > > > >     drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
> > > > > >     include/drm/ttm/ttm_bo_api.h             |  4 ++++
> > > > > >     6 files changed, 24 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > > > index b3404c43a911..1aa750a6a5d2 100644
> > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > > > > > @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
> > > > > >         .fault = amdgpu_gem_fault,
> > > > > >         .open = ttm_bo_vm_open,
> > > > > >         .close = ttm_bo_vm_close,
> > > > > > -     .access = ttm_bo_vm_access
> > > > > > +     .access = ttm_bo_vm_access,
> > > > > > +     .mprotect = ttm_bo_vm_mprotect
> > > > > >     };
> > > > > > 
> > > > > >     static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> > > > > > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > > > index 5b27845075a1..164ea564bb7a 100644
> > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > > > > @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
> > > > > >         .fault = nouveau_ttm_fault,
> > > > > >         .open = ttm_bo_vm_open,
> > > > > >         .close = ttm_bo_vm_close,
> > > > > > -     .access = ttm_bo_vm_access
> > > > > > +     .access = ttm_bo_vm_access,
> > > > > > +     .mprotect = ttm_bo_vm_mprotect
> > > > > >     };
> > > > > > 
> > > > > >     void
> > > > > > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
> > > > > > index 458f92a70887..c19ad07eb7b5 100644
> > > > > > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > > > > > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > > > > > @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
> > > > > >         .fault = radeon_gem_fault,
> > > > > >         .open = ttm_bo_vm_open,
> > > > > >         .close = ttm_bo_vm_close,
> > > > > > -     .access = ttm_bo_vm_access
> > > > > > +     .access = ttm_bo_vm_access,
> > > > > > +     .mprotect = ttm_bo_vm_mprotect
> > > > > >     };
> > > > > > 
> > > > > >     static void radeon_gem_object_free(struct drm_gem_object *gobj)
> > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > index f56be5bc0861..fb325bad5db6 100644
> > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > >     }
> > > > > >     EXPORT_SYMBOL(ttm_bo_vm_access);
> > > > > > 
> > > > > > +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> > > > > > +                    unsigned long end, unsigned long newflags)
> > > > > > +{
> > > > > > +     /* Enforce no COW since would have really strange behavior with it. */
> > > > > > +     if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> > > > > > +             return -EINVAL;
> > > > > > +
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> > > > > > +
> > > > > >     static const struct vm_operations_struct ttm_bo_vm_ops = {
> > > > > >         .fault = ttm_bo_vm_fault,
> > > > > >         .open = ttm_bo_vm_open,
> > > > > >         .close = ttm_bo_vm_close,
> > > > > >         .access = ttm_bo_vm_access,
> > > > > > +     .mprotect = ttm_bo_vm_mprotect,
> > > > > >     };
> > > > > > 
> > > > > >     int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
> > > > > >     {
> > > > > >         /* Enforce no COW since would have really strange behavior with it. */
> > > > > > -     if (is_cow_mapping(vma->vm_flags))
> > > > > > +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
> > > > > >                 return -EINVAL;
> > > > > > 
> > > > > >         ttm_bo_get(bo);
> > > > > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > > > index e6b1f98ec99f..e4bf7dc99320 100644
> > > > > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > > > @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
> > > > > >                 .fault = vmw_bo_vm_fault,
> > > > > >                 .open = ttm_bo_vm_open,
> > > > > >                 .close = ttm_bo_vm_close,
> > > > > > +             .mprotect = ttm_bo_vm_mprotect,
> > > > > >     #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > > > > >                 .huge_fault = vmw_bo_vm_huge_fault,
> > > > > >     #endif
> > > > > > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> > > > > > index f681bbdbc698..40eb95875355 100644
> > > > > > --- a/include/drm/ttm/ttm_bo_api.h
> > > > > > +++ b/include/drm/ttm/ttm_bo_api.h
> > > > > > @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
> > > > > > 
> > > > > >     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > > > > >                      void *buf, int len, int write);
> > > > > > +
> > > > > > +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
> > > > > > +                    unsigned long end, unsigned long newflags);
> > > > > > +
> > > > > >     bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> > > > > > 
> > > > > >     vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
