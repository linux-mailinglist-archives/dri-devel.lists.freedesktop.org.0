Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81747A700
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F90113B2B;
	Mon, 20 Dec 2021 09:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A64113B2B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:29:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p36-20020a05600c1da400b003457428ec78so7929815wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=veKz7pqKEvJOHj+yQvYH7QBzpYMR6TzDT1gVkqQw5NA=;
 b=jEsak5Za+6G/8XRJVrCHBVFSHzhGyBhDZFpfgsGWTUypw4VhhcR/6EV08xsM/dxBo1
 3xyfvva5iWSc4i8ZrxC1R5nF5IDCxt9uxEoM6HqYF2R1QSAV/b5fBOnazQj1we3IMuBv
 cnUX6JXgs5OteD1Z4coTieNjkN2tWKvVkeoTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=veKz7pqKEvJOHj+yQvYH7QBzpYMR6TzDT1gVkqQw5NA=;
 b=XZjufiXvOldUpElmmae234gu+147H9wr6mo0Ggt+0euIfmfMZDCDG6zFMwvTPVUeMY
 NsKIAzSi9DMBGuSfdqn8w2Jf98PFSQQ94ax5N9K/Nnovm/XAk1GbXghkTqmpyq50GGfD
 65JodVqF/y/v3aBAJuoNegmkutFxfEZm4B2Y3T+2i2km/4l9ZAvEUDqLcfvXEfIhWL+v
 ZL/AZawQXITdbrj0Uxfq3AN2hltFnZEGXoC2zskhrk8MpPORu5YHZcxRYNOdBkK4tp2D
 SH77hQjUTfOtvN+gCn/sGGb4o3USd8kx1bKvjXsUbNLb61W4UBpijQdChfx2znED2bsZ
 kktg==
X-Gm-Message-State: AOAM5306ZmEeLLJIMKv8wKQDAQXXRpMxDKgCyB8t7Hh5v5nfoECFPpIy
 MpbeFztREpv1G10ui4gPmzuelQ==
X-Google-Smtp-Source: ABdhPJyn23ZKsEn429DuwLi/QqE3pv7uq8XnE92UxEVnTd/5sj2Zm1sUTyKDW0GFlFpn+yQqHlc33Q==
X-Received: by 2002:a05:600c:231a:: with SMTP id
 26mr4966938wmo.16.1639992543593; 
 Mon, 20 Dec 2021 01:29:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p22sm2806378wms.2.2021.12.20.01.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:29:03 -0800 (PST)
Date: Mon, 20 Dec 2021 10:29:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Message-ID: <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, "Bhardwaj,
 Rajneesh" <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 07:58:50AM +0100, Christian König wrote:
> Am 09.12.21 um 19:28 schrieb Felix Kuehling:
> > Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
> > > That still won't work.
> > > 
> > > But I think we could do this change for the amdgpu mmap callback only.
> > If graphics user mode has problems with it, we could even make this
> > specific to KFD BOs in the amdgpu_gem_object_mmap callback.
> 
> I think it's fine for the whole amdgpu stack, my concern is more about
> radeon, nouveau and the ARM stacks which are using this as well.
> 
> That blew up so nicely the last time we tried to change it and I know of at
> least one case where radeon was/is used with BOs in a child process.

I'm way late and burried again, but I think it'd be good to be consistent
here across drivers. Or at least across drm drivers. And we've had the vma
open/close refcounting to make fork work since forever.

I think if we do this we should really only do this for mmap() where this
applies, but reading through the thread here I'm honestly confused why
this is a problem. If CRIU can't handle forked mmaps it needs to be
thought that, not hacked around. Or at least I'm not understanding why
this shouldn't work ...
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Regards,
> >    Felix
> > 
> > 
> > > Regards,
> > > Christian.
> > > 
> > > Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
> > > > Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
> > > > you!
> > > > 
> > > > On 12/9/2021 10:27 AM, Christian König wrote:
> > > > > Hi Rajneesh,
> > > > > 
> > > > > yes, separating this from the drm_gem_mmap_obj() change is certainly
> > > > > a good idea.
> > > > > 
> > > > > > The child cannot access the BOs mapped by the parent anyway with
> > > > > > access restrictions applied
> > > > > exactly that is not correct. That behavior is actively used by some
> > > > > userspace stacks as far as I know.
> > > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
> > > > > > Thanks Christian. Would it make it less intrusive if I just use the
> > > > > > flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
> > > > > > this patch? For our use case, just the ttm_bo_mmap_obj change
> > > > > > should suffice and we don't want to put any more work arounds in
> > > > > > the user space (thunk, in our case).
> > > > > > 
> > > > > > The child cannot access the BOs mapped by the parent anyway with
> > > > > > access restrictions applied so I wonder why even inherit the vma?
> > > > > > 
> > > > > > On 12/9/2021 2:54 AM, Christian König wrote:
> > > > > > > Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
> > > > > > > > When an application having open file access to a node forks, its
> > > > > > > > shared
> > > > > > > > mappings also get reflected in the address space of child process
> > > > > > > > even
> > > > > > > > though it cannot access them with the object permissions applied.
> > > > > > > > With the
> > > > > > > > existing permission checks on the gem objects, it might be
> > > > > > > > reasonable to
> > > > > > > > also create the VMAs with VM_DONTCOPY flag so a user space
> > > > > > > > application
> > > > > > > > doesn't need to explicitly call the madvise(addr, len,
> > > > > > > > MADV_DONTFORK)
> > > > > > > > system call to prevent the pages in the mapped range to appear in
> > > > > > > > the
> > > > > > > > address space of the child process. It also prevents the memory
> > > > > > > > leaks
> > > > > > > > due to additional reference counts on the mapped BOs in the child
> > > > > > > > process that prevented freeing the memory in the parent for which
> > > > > > > > we had
> > > > > > > > worked around earlier in the user space inside the thunk library.
> > > > > > > > 
> > > > > > > > Additionally, we faced this issue when using CRIU to checkpoint
> > > > > > > > restore
> > > > > > > > an application that had such inherited mappings in the child which
> > > > > > > > confuse CRIU when it mmaps on restore. Having this flag set for the
> > > > > > > > render node VMAs helps. VMAs mapped via KFD already take care of
> > > > > > > > this so
> > > > > > > > this is needed only for the render nodes.
> > > > > > > Unfortunately that is most likely a NAK. We already tried
> > > > > > > something similar.
> > > > > > > 
> > > > > > > While it is illegal by the OpenGL specification and doesn't work
> > > > > > > for most userspace stacks, we do have some implementations which
> > > > > > > call fork() with a GL context open and expect it to work.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > > > > 
> > > > > > > > Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> > > > > > > > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> > > > > > > > ---
> > > > > > > >    drivers/gpu/drm/drm_gem.c       | 3 ++-
> > > > > > > >    drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
> > > > > > > >    2 files changed, 3 insertions(+), 2 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > > > > > index 09c820045859..d9c4149f36dd 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > > > > > @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
> > > > > > > > *obj, unsigned long obj_size,
> > > > > > > >                goto err_drm_gem_object_put;
> > > > > > > >            }
> > > > > > > >    -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
> > > > > > > > VM_DONTDUMP;
> > > > > > > > +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
> > > > > > > > +                | VM_DONTDUMP | VM_DONTCOPY;
> > > > > > > >            vma->vm_page_prot =
> > > > > > > > pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> > > > > > > >            vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> > > > > > > >        }
> > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > index 33680c94127c..420a4898fdd2 100644
> > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
> > > > > > > > *vma, struct ttm_buffer_object *bo)
> > > > > > > >          vma->vm_private_data = bo;
> > > > > > > >    -    vma->vm_flags |= VM_PFNMAP;
> > > > > > > > +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
> > > > > > > >        vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> > > > > > > >        return 0;
> > > > > > > >    }
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
