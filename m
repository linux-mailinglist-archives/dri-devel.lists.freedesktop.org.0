Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D102DA0E2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 20:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D999E6E0E8;
	Mon, 14 Dec 2020 19:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EC46E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 19:55:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c5so14007447wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 11:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/HEll0mCpOxWvmN28AJh3wixW4NXkgWf1+NE5mNPIsA=;
 b=WoI9bXoiRMn9lPkLFTlZXplxekUAfx4rc4sAOV4wmu4qXz+K4cK/+J5P3WctXf7ZqZ
 cZ/w+cRFtvj1KTHq04kiVtZEP9vhK1p89tpjRpmSrOJc90Z4cKzoKubF3rwVr+R25gpC
 nPFEnV0Ks9V53OcAaYlkAvGI4yvyAs5mjNMQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/HEll0mCpOxWvmN28AJh3wixW4NXkgWf1+NE5mNPIsA=;
 b=qbBLJVAmd/OZw/AAvfIcibH4E/UXPhd9ZJlKD7l0rvtf2zRHdi0qyMHmn/CIz3V4is
 ZbfjNG9i9ZlxbHpWKaDrjFh/VZOJIdTOMN7JnsfmBPsVStr7fYp6EmSc8zRQ3InYU89d
 3HQ8ZNStor2np1CcgMBiseGpZ5OV2+dcZE4vYnZYTmxY0b5ueZLzlMIa2rfT7+UCkNsz
 7QSxStumfmXrLkxBWuF7EcWH70ousejbAggE62oWJhJFdIv386zqvsnH3odEI7CHCsWS
 K/2XELFQ3jjFCIbXAQO9q9DuGNG+sUX3gmjgJV6HooT1tBygtZkNEjc7nqG385Lug94H
 FjCw==
X-Gm-Message-State: AOAM530xWuDp2CuEicq8Ut6deKp01Ag89JLZOqp5Eq7NzM3a9IJDkt4c
 ohxs73YKhTR///Y2jjJz7QKK0w==
X-Google-Smtp-Source: ABdhPJzhPJbAMvJyQwDWsYl7SAWVCvPUvyHKaO+tVkRqyBL7HVi084NsS+vdI1ZTVXbgGJqUYBycaQ==
X-Received: by 2002:adf:a1d5:: with SMTP id v21mr30637687wrv.24.1607975707880; 
 Mon, 14 Dec 2020 11:55:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k10sm29927947wrq.38.2020.12.14.11.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 11:55:07 -0800 (PST)
Date: Mon, 14 Dec 2020 20:55:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix ttm size refactor fallout
Message-ID: <20201214195505.GA401619@phenom.ffwll.local>
References: <20201214191725.3899147-1-daniel.vetter@ffwll.ch>
 <CADnq5_MNC73FKyfJScYr0ieaOeCJB0nzPXyGK6g9UH=B9rCbjA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADnq5_MNC73FKyfJScYr0ieaOeCJB0nzPXyGK6g9UH=B9rCbjA@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 14, 2020 at 02:20:39PM -0500, Alex Deucher wrote:
> On Mon, Dec 14, 2020 at 2:17 PM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
> > I guess Christian didn't compile test amdkfd.
> >
> > Fixes: e11bfb99d6ec ("drm/ttm: cleanup BO size handling v3")
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Cc: Huang Rui <ray.huang@amd.com> (v1)
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Pushed to drm-misc-next, thanks for review and all.
-Daniel

> =

> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers=
/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > index 7791d074bd32..a9647e7f98a8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > @@ -453,7 +453,7 @@ static int add_bo_to_vm(struct amdgpu_device *adev,=
 struct kgd_mem *mem,
> >         struct amdgpu_bo *bo =3D mem->bo;
> >         uint64_t va =3D mem->va;
> >         struct list_head *list_bo_va =3D &mem->bo_va_list;
> > -       unsigned long bo_size =3D bo->tbo.mem.size;
> > +       unsigned long bo_size =3D bo->tbo.base.size;
> >
> >         if (!va) {
> >                 pr_err("Invalid VA when adding BO to VM\n");
> > @@ -1281,7 +1281,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
> >                 struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *siz=
e)
> >  {
> >         struct amdkfd_process_info *process_info =3D mem->process_info;
> > -       unsigned long bo_size =3D mem->bo->tbo.mem.size;
> > +       unsigned long bo_size =3D mem->bo->tbo.base.size;
> >         struct kfd_bo_va_list *entry, *tmp;
> >         struct bo_vm_reservation_context ctx;
> >         struct ttm_validate_buffer *bo_list_entry;
> > @@ -1402,7 +1402,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
> >         mutex_lock(&mem->lock);
> >
> >         domain =3D mem->domain;
> > -       bo_size =3D bo->tbo.mem.size;
> > +       bo_size =3D bo->tbo.base.size;
> >
> >         pr_debug("Map VA 0x%llx - 0x%llx to vm %p domain %s\n",
> >                         mem->va,
> > @@ -1506,7 +1506,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
> >         struct amdgpu_device *adev =3D get_amdgpu_device(kgd);
> >         struct amdkfd_process_info *process_info =3D
> >                 ((struct amdgpu_vm *)vm)->process_info;
> > -       unsigned long bo_size =3D mem->bo->tbo.mem.size;
> > +       unsigned long bo_size =3D mem->bo->tbo.base.size;
> >         struct kfd_bo_va_list *entry;
> >         struct bo_vm_reservation_context ctx;
> >         int ret;
> > --
> > 2.29.2
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
