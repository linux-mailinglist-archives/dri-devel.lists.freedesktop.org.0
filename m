Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 854853D3690
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230D06E9C3;
	Fri, 23 Jul 2021 08:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A110F6E9C3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:21:21 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 48-20020a9d0bb30000b02904cd671b911bso1371129oth.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dyosij4uetTaOKYJdoRUCx8uK6Y+Pk1yK6Y86bo5prA=;
 b=RO4UXO6pWy71XWFDt3xQnjNscW97+2ODsznFrEmN3uGp1gb2lRpWXKp5BvEEtYcebN
 52QWTWEd7QNTZw6FtkphqyWjotkWjee9B/v0ZmLLn0dMiG8w74t0OBGu+npO11GsReic
 Zcbo49nL7ZuhTOdsOAA+y5X0RJIjCwm0KYpFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dyosij4uetTaOKYJdoRUCx8uK6Y+Pk1yK6Y86bo5prA=;
 b=oB91W1BTOnhgbMIicavZaIadWin0roSslgTbN5BgexDZb8j98TNux9Ex0xg3oVibzr
 B1uh2tTJYLn8/jmCVKBGg1FwC5dF0jTwLvKvJBlUTPrxso/O42ZsNNxEkgePreN+QZMs
 nh1G+obwwwQtkb4Sf8bZv/mvrvfBf3MJNgWXRM3bd3xhK4tFbnBsQl6h3lCwoACbJMUn
 8Q0pmm2NAy6Z7ss+5A08c3KyHdRtkiUMTWh+bTjMDOqztCbxegkFpqRW0v99+K5hVtqF
 hCNdtWvkqrdIH+cNkfG3MseVs/JNB6ysHT6qTSu2ZN9kN8g6Yt4QmaEurlqDQf9/nGG+
 /aLw==
X-Gm-Message-State: AOAM5338He9cCd2C4OboBExYy8LA9ymizcKAf7uaviKZo1h4KP1WZULY
 ljffbYFFMr135ghGtGQgaD2QdXeUN4pa7jnjKTT2oQ==
X-Google-Smtp-Source: ABdhPJzRb0LMyGhTtSu3Xw7G5poCanJ1XyxArvodWr/KFw3tPt1FpddaS6wYK1+CVI1/OkWG26UQMZO9V0EM2dZa7i8=
X-Received: by 2002:a05:6830:2802:: with SMTP id
 w2mr2239059otu.303.1627028480891; 
 Fri, 23 Jul 2021 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210712220636.475675-1-Felix.Kuehling@amd.com>
 <d617d831-7168-51a4-042e-e36a5af7761d@gmail.com>
 <CADnq5_NCg6VnWgH7Hn61CjZBZiRuAdROW5s6imwQ8AR=9Bm4=g@mail.gmail.com>
 <1dd35814-c2bb-6e71-6259-e9d4f77d8969@amd.com>
In-Reply-To: <1dd35814-c2bb-6e71-6259-e9d4f77d8969@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 23 Jul 2021 10:21:09 +0200
Message-ID: <CAKMK7uH7YUgFUkgdrRrxypqkHoYx_NN6vcvTB=LOwVGDriov9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/ttm: Fix COW check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 10:51 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> Am 13.07.21 um 17:28 schrieb Alex Deucher:
> > On Tue, Jul 13, 2021 at 2:57 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >>
> >>
> >> Am 13.07.21 um 00:06 schrieb Felix Kuehling:
> >>> KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
> >>> is_cow_mapping returns true for these mappings. Add a check for
> >>> vm_flags & VM_WRITE to avoid mmap failures on private read-only or
> >>> PROT_NONE mappings.
> >>>
> >>> v2: protect against mprotect making a mapping writable after the fact
> >>> v3: update driver-specific vm_operations_structs
> >>>
> >>> Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
> >>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Are you planning to push this to drm-misc?
>
> Yes, just didn't found time yesterday.

This is pushed to the wrong tree drm-misc-next-fixes, should have been
in drm-misc-fixes. Please be careful with that because every time that
goes wrong the script gets confused about which the current tree is,
and pushes the wrong tree to linux-next branches.

I'm going to hard-reset drm-misc-next-fixes now and hope that's good
enough to fix things up (since Thomas is not around all the time for
this merge window).
-Daniel


>
> Christian.
>
> >
> > Alex
> >
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
> >>>    drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
> >>>    drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
> >>>    drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
> >>>    drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
> >>>    include/drm/ttm/ttm_bo_api.h             |  4 ++++
> >>>    6 files changed, 24 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_gem.c
> >>> index b3404c43a911..1aa750a6a5d2 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> >>> @@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem=
_vm_ops =3D {
> >>>        .fault =3D amdgpu_gem_fault,
> >>>        .open =3D ttm_bo_vm_open,
> >>>        .close =3D ttm_bo_vm_close,
> >>> -     .access =3D ttm_bo_vm_access
> >>> +     .access =3D ttm_bo_vm_access,
> >>> +     .mprotect =3D ttm_bo_vm_mprotect
> >>>    };
> >>>
> >>>    static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
> >>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/=
nouveau/nouveau_gem.c
> >>> index 5b27845075a1..164ea564bb7a 100644
> >>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> >>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> >>> @@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_tt=
m_vm_ops =3D {
> >>>        .fault =3D nouveau_ttm_fault,
> >>>        .open =3D ttm_bo_vm_open,
> >>>        .close =3D ttm_bo_vm_close,
> >>> -     .access =3D ttm_bo_vm_access
> >>> +     .access =3D ttm_bo_vm_access,
> >>> +     .mprotect =3D ttm_bo_vm_mprotect
> >>>    };
> >>>
> >>>    void
> >>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/ra=
deon/radeon_gem.c
> >>> index 458f92a70887..c19ad07eb7b5 100644
> >>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> >>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> >>> @@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem=
_vm_ops =3D {
> >>>        .fault =3D radeon_gem_fault,
> >>>        .open =3D ttm_bo_vm_open,
> >>>        .close =3D ttm_bo_vm_close,
> >>> -     .access =3D ttm_bo_vm_access
> >>> +     .access =3D ttm_bo_vm_access,
> >>> +     .mprotect =3D ttm_bo_vm_mprotect
> >>>    };
> >>>
> >>>    static void radeon_gem_object_free(struct drm_gem_object *gobj)
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/tt=
m_bo_vm.c
> >>> index f56be5bc0861..fb325bad5db6 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> >>> @@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma=
, unsigned long addr,
> >>>    }
> >>>    EXPORT_SYMBOL(ttm_bo_vm_access);
> >>>
> >>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long sta=
rt,
> >>> +                    unsigned long end, unsigned long newflags)
> >>> +{
> >>> +     /* Enforce no COW since would have really strange behavior with=
 it. */
> >>> +     if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
> >>> +             return -EINVAL;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +EXPORT_SYMBOL(ttm_bo_vm_mprotect);
> >>> +
> >>>    static const struct vm_operations_struct ttm_bo_vm_ops =3D {
> >>>        .fault =3D ttm_bo_vm_fault,
> >>>        .open =3D ttm_bo_vm_open,
> >>>        .close =3D ttm_bo_vm_close,
> >>>        .access =3D ttm_bo_vm_access,
> >>> +     .mprotect =3D ttm_bo_vm_mprotect,
> >>>    };
> >>>
> >>>    int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_=
object *bo)
> >>>    {
> >>>        /* Enforce no COW since would have really strange behavior wit=
h it. */
> >>> -     if (is_cow_mapping(vma->vm_flags))
> >>> +     if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE)=
)
> >>>                return -EINVAL;
> >>>
> >>>        ttm_bo_get(bo);
> >>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_glue.c
> >>> index e6b1f98ec99f..e4bf7dc99320 100644
> >>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> >>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> >>> @@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_stru=
ct *vma)
> >>>                .fault =3D vmw_bo_vm_fault,
> >>>                .open =3D ttm_bo_vm_open,
> >>>                .close =3D ttm_bo_vm_close,
> >>> +             .mprotect =3D ttm_bo_vm_mprotect,
> >>>    #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >>>                .huge_fault =3D vmw_bo_vm_huge_fault,
> >>>    #endif
> >>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_ap=
i.h
> >>> index f681bbdbc698..40eb95875355 100644
> >>> --- a/include/drm/ttm/ttm_bo_api.h
> >>> +++ b/include/drm/ttm/ttm_bo_api.h
> >>> @@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)=
;
> >>>
> >>>    int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long add=
r,
> >>>                     void *buf, int len, int write);
> >>> +
> >>> +int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long sta=
rt,
> >>> +                    unsigned long end, unsigned long newflags);
> >>> +
> >>>    bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_al=
l);
> >>>
> >>>    vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t pro=
t);
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
