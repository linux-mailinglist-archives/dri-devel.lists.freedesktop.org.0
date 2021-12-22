Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D447D864
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 21:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6DC10E25A;
	Wed, 22 Dec 2021 20:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA3910E1C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 20:53:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id q14so5717830edi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 12:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gKs4FTWpbN7wVlAXqZCULnr0rO9wpYSfxBHmbkn8xwo=;
 b=EC6SyVH7zLhECo0tEAlETkUkVF0HK9rMmX0HMFsdcWP2p9k2VT/amoPZtpsgosRgqh
 EhVKDLLd+v04i9QZAPvD8avlZZJSUaaT9aWJXamTEvT9hdbBdMY+C36kZ6OZX7Iyo8MV
 LWux4/DpekzV3zYJ4my5BGGsERuJj8Fjmw7DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gKs4FTWpbN7wVlAXqZCULnr0rO9wpYSfxBHmbkn8xwo=;
 b=lGmv9cqp07mkOvsSJy6QurjmnWmg9LJYn9KQITjBBdOEjVLWrQX2hMyERFRpgSDuCp
 STUZgESFzX4lwNRh4FfWis81qTXbEC0X0pVv7oH/S3v3qgSowQx4TeBg22h8BpCqQBVj
 TX/N+Lf+iZxa/07WtHwBevgfF+Ldgsm7+zeqrmsHpYrpEjEXKsZi902D/KOx4255kONq
 hlPGSxZvXw/miEjQX+ZGGJMdqxRQYtbZieZKHv4u2HyP7aj47u3J4XLN/GjyJP/j8LBG
 5dBC1pU6oWsz3aFIYKQTF17pewlmiZuWnep80mEfxKU3RvycXjo4lE6/53FrOP1Ni+JA
 1fbA==
X-Gm-Message-State: AOAM533firboLg91pbFXu3NaprNH9U/cL/DDLUI8d6Z956OLwgsQNKez
 TNaYVqDClHuWZ2De6mNP1JwSZw==
X-Google-Smtp-Source: ABdhPJzNiF29mt0Q9K2CtwkzinGHy7Lw4AM95KQpmVphuH9KYH3UpsOM7x3/C9jjYCIjvg4eVN697w==
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr4448174edc.297.1640206394130; 
 Wed, 22 Dec 2021 12:53:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 16sm1051863ejz.34.2021.12.22.12.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 12:53:13 -0800 (PST)
Date: Wed, 22 Dec 2021 21:53:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
Message-ID: <YcOQN/l7W66W/X0f@phenom.ffwll.local>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
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
 Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, alexander.deucher@amd.com, airlied@redhat.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
> 
> On 12/20/2021 4:29 AM, Daniel Vetter wrote:
> > On Fri, Dec 10, 2021 at 07:58:50AM +0100, Christian König wrote:
> > > Am 09.12.21 um 19:28 schrieb Felix Kuehling:
> > > > Am 2021-12-09 um 10:30 a.m. schrieb Christian König:
> > > > > That still won't work.
> > > > > 
> > > > > But I think we could do this change for the amdgpu mmap callback only.
> > > > If graphics user mode has problems with it, we could even make this
> > > > specific to KFD BOs in the amdgpu_gem_object_mmap callback.
> > > I think it's fine for the whole amdgpu stack, my concern is more about
> > > radeon, nouveau and the ARM stacks which are using this as well.
> > > 
> > > That blew up so nicely the last time we tried to change it and I know of at
> > > least one case where radeon was/is used with BOs in a child process.
> > I'm way late and burried again, but I think it'd be good to be consistent
> > here across drivers. Or at least across drm drivers. And we've had the vma
> > open/close refcounting to make fork work since forever.
> > 
> > I think if we do this we should really only do this for mmap() where this
> > applies, but reading through the thread here I'm honestly confused why
> > this is a problem. If CRIU can't handle forked mmaps it needs to be
> > thought that, not hacked around. Or at least I'm not understanding why
> > this shouldn't work ...
> > -Daniel
> > 
> 
> Hi Daniel
> 
> In the v2
> https://lore.kernel.org/all/a1a865f5-ad2c-29c8-cbe4-2635d53eceb6@amd.com/T/
> I pretty much limited the scope of the change to KFD BOs on mmap. Regarding
> CRIU, I think its not a CRIU problem as CRIU on restore, only tries to
> recreate all the child processes and then mmaps all the VMAs it sees (as per
> checkpoint snapshot) in the new process address space after the VMA
> placements are finalized in the position independent code phase. Since the
> inherited VMAs don't have access rights the criu mmap fails.

Still sounds funky. I think minimally we should have an ack from CRIU
developers that this is officially the right way to solve this problem. I
really don't want to have random one-off hacks that don't work across the
board, for a problem where we (drm subsystem) really shouldn't be the only
one with this problem. Where "this problem" means that the mmap space is
per file description, and not per underlying inode or real device or
whatever. That part sounds like a CRIU problem, and I expect CRIU folks
want a consistent solution across the board for this. Hence please grab an
ack from them.

Cheers, Daniel

> 
> Regards,
> 
> Rajneesh
> 
> > > Regards,
> > > Christian.
> > > 
> > > > Regards,
> > > >     Felix
> > > > 
> > > > 
> > > > > Regards,
> > > > > Christian.
> > > > > 
> > > > > Am 09.12.21 um 16:29 schrieb Bhardwaj, Rajneesh:
> > > > > > Sounds good. I will send a v2 with only ttm_bo_mmap_obj change. Thank
> > > > > > you!
> > > > > > 
> > > > > > On 12/9/2021 10:27 AM, Christian König wrote:
> > > > > > > Hi Rajneesh,
> > > > > > > 
> > > > > > > yes, separating this from the drm_gem_mmap_obj() change is certainly
> > > > > > > a good idea.
> > > > > > > 
> > > > > > > > The child cannot access the BOs mapped by the parent anyway with
> > > > > > > > access restrictions applied
> > > > > > > exactly that is not correct. That behavior is actively used by some
> > > > > > > userspace stacks as far as I know.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Christian.
> > > > > > > 
> > > > > > > Am 09.12.21 um 16:23 schrieb Bhardwaj, Rajneesh:
> > > > > > > > Thanks Christian. Would it make it less intrusive if I just use the
> > > > > > > > flag for ttm bo mmap and remove the drm_gem_mmap_obj change from
> > > > > > > > this patch? For our use case, just the ttm_bo_mmap_obj change
> > > > > > > > should suffice and we don't want to put any more work arounds in
> > > > > > > > the user space (thunk, in our case).
> > > > > > > > 
> > > > > > > > The child cannot access the BOs mapped by the parent anyway with
> > > > > > > > access restrictions applied so I wonder why even inherit the vma?
> > > > > > > > 
> > > > > > > > On 12/9/2021 2:54 AM, Christian König wrote:
> > > > > > > > > Am 08.12.21 um 21:53 schrieb Rajneesh Bhardwaj:
> > > > > > > > > > When an application having open file access to a node forks, its
> > > > > > > > > > shared
> > > > > > > > > > mappings also get reflected in the address space of child process
> > > > > > > > > > even
> > > > > > > > > > though it cannot access them with the object permissions applied.
> > > > > > > > > > With the
> > > > > > > > > > existing permission checks on the gem objects, it might be
> > > > > > > > > > reasonable to
> > > > > > > > > > also create the VMAs with VM_DONTCOPY flag so a user space
> > > > > > > > > > application
> > > > > > > > > > doesn't need to explicitly call the madvise(addr, len,
> > > > > > > > > > MADV_DONTFORK)
> > > > > > > > > > system call to prevent the pages in the mapped range to appear in
> > > > > > > > > > the
> > > > > > > > > > address space of the child process. It also prevents the memory
> > > > > > > > > > leaks
> > > > > > > > > > due to additional reference counts on the mapped BOs in the child
> > > > > > > > > > process that prevented freeing the memory in the parent for which
> > > > > > > > > > we had
> > > > > > > > > > worked around earlier in the user space inside the thunk library.
> > > > > > > > > > 
> > > > > > > > > > Additionally, we faced this issue when using CRIU to checkpoint
> > > > > > > > > > restore
> > > > > > > > > > an application that had such inherited mappings in the child which
> > > > > > > > > > confuse CRIU when it mmaps on restore. Having this flag set for the
> > > > > > > > > > render node VMAs helps. VMAs mapped via KFD already take care of
> > > > > > > > > > this so
> > > > > > > > > > this is needed only for the render nodes.
> > > > > > > > > Unfortunately that is most likely a NAK. We already tried
> > > > > > > > > something similar.
> > > > > > > > > 
> > > > > > > > > While it is illegal by the OpenGL specification and doesn't work
> > > > > > > > > for most userspace stacks, we do have some implementations which
> > > > > > > > > call fork() with a GL context open and expect it to work.
> > > > > > > > > 
> > > > > > > > > Regards,
> > > > > > > > > Christian.
> > > > > > > > > 
> > > > > > > > > > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: David Yat Sin <david.yatsin@amd.com>
> > > > > > > > > > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> > > > > > > > > > ---
> > > > > > > > > >     drivers/gpu/drm/drm_gem.c       | 3 ++-
> > > > > > > > > >     drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 +-
> > > > > > > > > >     2 files changed, 3 insertions(+), 2 deletions(-)
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > > > > > > > index 09c820045859..d9c4149f36dd 100644
> > > > > > > > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > > > > > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > > > > > > > @@ -1058,7 +1058,8 @@ int drm_gem_mmap_obj(struct drm_gem_object
> > > > > > > > > > *obj, unsigned long obj_size,
> > > > > > > > > >                 goto err_drm_gem_object_put;
> > > > > > > > > >             }
> > > > > > > > > >     -        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND |
> > > > > > > > > > VM_DONTDUMP;
> > > > > > > > > > +        vma->vm_flags |= VM_IO | VM_PFNMAP | VM_DONTEXPAND
> > > > > > > > > > +                | VM_DONTDUMP | VM_DONTCOPY;
> > > > > > > > > >             vma->vm_page_prot =
> > > > > > > > > > pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
> > > > > > > > > >             vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
> > > > > > > > > >         }
> > > > > > > > > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > index 33680c94127c..420a4898fdd2 100644
> > > > > > > > > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > > > > > > > > @@ -566,7 +566,7 @@ int ttm_bo_mmap_obj(struct vm_area_struct
> > > > > > > > > > *vma, struct ttm_buffer_object *bo)
> > > > > > > > > >           vma->vm_private_data = bo;
> > > > > > > > > >     -    vma->vm_flags |= VM_PFNMAP;
> > > > > > > > > > +    vma->vm_flags |= VM_PFNMAP | VM_DONTCOPY;
> > > > > > > > > >         vma->vm_flags |= VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> > > > > > > > > >         return 0;
> > > > > > > > > >     }

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
