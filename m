Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818763C7325
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 17:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6E56E0DF;
	Tue, 13 Jul 2021 15:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710006E0DC;
 Tue, 13 Jul 2021 15:28:14 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 42-20020a9d012d0000b02904b98d90c82cso874859otu.5; 
 Tue, 13 Jul 2021 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eSVqAM6jfMSrVn365H5CUYgvo5Rmml9/i8igIHyouD8=;
 b=sGVSn/S5RbJ0wY8kCdH9RPg8ltmTvqxt71l5S+FiS0vXlO/d3nU6A6yEU49sdXzi3L
 /cy6X1m/bf3gmKHaGIA3UMjjYd/0PMD8V8X6lxCIRFNzW/IkD4QgehIJLkuTtswQ0kJD
 38QlQkFcfPLDa0G4Smuuj3D23Tkr7sjEYRT5VhtW5zsbQ6EGATr6GmrYvnWiBKD00heP
 Bb6EHXHE0EXp5ieFJG4GEjgxs1U+RQGdfeR/WhmTj9Jhpd1W8uF1U3VW7sTyW+CnbnTb
 9SZOTM0MmNcYtDXjL5AJ1nit73EwlpYNI8Kmto9BSR80r1Q6zf2kr1fTrPTzlneyKQrN
 cCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eSVqAM6jfMSrVn365H5CUYgvo5Rmml9/i8igIHyouD8=;
 b=rK1Hjtefxrc/6o4ME1Km3tOe2zULPFDN+VfikWw0ET0OdVKz5y1+2tkQX+7lP6XptB
 jqLhVgiU7SU1PsFCkdiS5P4s4fClOEJOGxySd5T5oPgX8yVTM1SuaLP88Qb1CD0LPauq
 bu58xnui63oIKUxZmsJd/eEr++yuV/qgIg0gfO0/3DcyCIxTlfiLY/r8QbBwnrBs76Gj
 pXlaMxVavnR44cDeDPPu6ykzm1RzAfxMJ1VtAlQO/ivNu/bnI2q7l/oSJmv4syw2W1UX
 CT5yM4Plt7SsCzA+LnlF8Q3i8f0Rfi0EZ0wdrxSypu0hN2snh7FLIqbgEMmoBOMbyxBM
 Y90A==
X-Gm-Message-State: AOAM531JecJbjlwMePZhi69xWlO0rDMrZk/H9BVkmzbr8XUqgLPNgdH9
 5D2kKwK6L28sA8DgFrHL0nxIqaGic/kg4Tc++kQ=
X-Google-Smtp-Source: ABdhPJxD/aFh3d9tHL86TFiS88oBQ/Lrm2CAanyKlynNITpF2GsWAidfRm2ajOEOfJYANWxrIOwoWBJIE8nf5Tpuu6k=
X-Received: by 2002:a9d:2482:: with SMTP id z2mr1322602ota.132.1626190093699; 
 Tue, 13 Jul 2021 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
In-Reply-To: <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Jul 2021 11:28:02 -0400
Message-ID: <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 2:57 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
>
>
> Am 13.07.21 um 00:06 schrieb Felix Kuehling:
> > KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> > is_cow_mapping returns true for these mappings. Add a check for
> > vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> > PROT_NONE mappings.
> >
> > v2: protect against mprotect making a mapping writable after the fact
> > v3: update driver-specific vm_operations_structs
> >
> > Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> > Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Are you planning to push this to drm-misc?

Alex

>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
> >   drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
> >   drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
> >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
> >   include/drm/ttm/ttm_bo_api.h             |  4 ++++
> >   6 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gem.c
> > index b3404c43a911..1aa750a6a5d2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_v=
m_ops =3D {
> >       .fault =3D amdgpu_gem_fault,
> >       .open =3D ttm_bo_vm_open,
> >       .close =3D ttm_bo_vm_close,
> > -     .access =3D ttm_bo_vm_access
> > +     .access =3D ttm_bo_vm_access,
> > +     .mprotect =3D ttm_bo_vm_mprotect
> >   };
> >
> >   static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/no=
uveau/nouveau_gem.c
> > index 5b27845075a1..164ea564bb7a 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_=
vm_ops =3D {
> >       .fault =3D nouveau_ttm_fault,
> >       .open =3D ttm_bo_vm_open,
> >       .close =3D ttm_bo_vm_close,
> > -     .access =3D ttm_bo_vm_access
> > +     .access =3D ttm_bo_vm_access,
> > +     .mprotect =3D ttm_bo_vm_mprotect
> >   };
> >
> >   void
> > diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/rade=
on/radeon_gem.c
> > index 458f92a70887..c19ad07eb7b5 100644
> > --- a/drivers/gpu/drm/radeon/radeon_gem.c
> > +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> > @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_v=
m_ops =3D {
> >       .fault =3D radeon_gem_fault,
> >       .open =3D ttm_bo_vm_open,
> >       .close =3D ttm_bo_vm_close,
> > -     .access =3D ttm_bo_vm_access
> > +     .access =3D ttm_bo_vm_access,
> > +     .mprotect =3D ttm_bo_vm_mprotect
> >   };
> >
> >   static void radeon_gem_object_free(struct drm_gem_object *gobj)
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> > index f56be5bc0861..fb325bad5db6 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, =
unsigned long addr,
> >   }
> >   EXPORT_SYMBOL(ttm_bo_vm_access);
> >
> > +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start=
,
> > +                    unsigned long end, unsigned long newflags)
> > +{
> > +     /* Enforce no COW since would have really strange behavior with i=
t. */
> > +     if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> > +
> >   static const struct vm_operations_struct ttm_bo_vm_ops =3D {
> >       .fault =3D ttm_bo_vm_fault,
> >       .open =3D ttm_bo_vm_open,
> >       .close =3D ttm_bo_vm_close,
> >       .access =3D ttm_bo_vm_access,
> > +     .mprotect =3D ttm_bo_vm_mprotect,
> >   };
> >
> >   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_obj=
ect *bo)
> >   {
> >       /* Enforce no COW since would have really strange behavior with i=
t. */
> > -     if (is_cow_mapping(vma->vm_flags))
> > +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
> >               return -EINVAL;
> >
> >       ttm_bo_get(bo);
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_glue.c
> > index e6b1f98ec99f..e4bf7dc99320 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct=
 *vma)
> >               .fault =3D vmw_bo_vm_fault,
> >               .open =3D ttm_bo_vm_open,
> >               .close =3D ttm_bo_vm_close,
> > +             .mprotect =3D ttm_bo_vm_mprotect,
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >               .huge_fault =3D vmw_bo_vm_huge_fault,
> >   #endif
> > diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.=
h
> > index f681bbdbc698..40eb95875355 100644
> > --- a/include/drm/ttm/ttm_bo_api.h
> > +++ b/include/drm/ttm/ttm_bo_api.h
> > @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
> >
> >   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> >                    void *buf, int len, int write);
> > +
> > +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start=
,
> > +                    unsigned long end, unsigned long newflags);
> > +
> >   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> >
> >   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
>
