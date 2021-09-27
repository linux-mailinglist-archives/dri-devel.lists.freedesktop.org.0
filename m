Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEF34198B1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 18:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CADC89F2E;
	Mon, 27 Sep 2021 16:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD3E89F2A;
 Mon, 27 Sep 2021 16:14:36 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id a13so11475617qvo.9;
 Mon, 27 Sep 2021 09:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h64gNFlWIc42VGrS9XKwzi00cpHGNGVgYmjsS0AwF2A=;
 b=ctkHMkrLSW7fwZSozOJuNfYI82G/MP5YZbxFoMR7J1u2tekrDy1/1NufP7KizFKJj7
 unCwwDChR9lzh0XLA1O6yhs6BY+wXfaxbtRWNzMHfy2ae7p8X+p0/VXzVj/1rtmD7FVm
 pjVCpf42Dn1/BslTFyG5+HK+8C6or5Mwaf1eDzCMZIfzXgxYGcDFKwTzULri796SNtf5
 lh+YKWvLZ1awo2ghSwGPCQV/Aig7M9JYqp79pNwLJx+LqeE+swPfXT3Y0u7iUwfL3OiN
 Jl8VwcTDAvBWj8A7a6iAB36A4ETowgQauuLdvSQY2hClcaYA5xBCjTQt2YRGOWvFu9I5
 WXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h64gNFlWIc42VGrS9XKwzi00cpHGNGVgYmjsS0AwF2A=;
 b=IjIOMByMtZmSoCNIX7KCLxCoSstDIC/YZbKsxXUxdCQYPRpHe6bhPKEGNaQ4gP3ipj
 EOA7YYpzKGsjArOVvVYbOVQdGlZqNEfIfllava5ekrBBu7MhScLIAdacnAKSOip7dtDo
 9fXwJjvYNHy1vMbvjWOa14LxlUoxJOQiBY5rMxLNUaMqmTPc754/yk+ZWfnm8MhYdZ6I
 on6XwNOdxS9wu7roajVNP1cRjtkFkcZaxMbY7hK5k9loz2CldOgrEaKkhO8BTg1wMU7L
 PMJZzv1ZE+rbr8ucvdNYgYWIC16NuL1mHzrUIvnkLjdZNnH4LkZPyVW/Ssjh8TFo2J6/
 CfNw==
X-Gm-Message-State: AOAM533YwHHVpDrhfVLwfGj+LHljsEFf99Tw9sIQalwKymHARcEGs+Pu
 QXamyZcWWCdClI/lgMrCDCXGCspXnjE3TlJ6CSg=
X-Google-Smtp-Source: ABdhPJy/jb2s2DJZb7tgjR4PBEAYlr2a94Az5LuINlHFGNkWBWH3eDjktK+H13rHrsdyItZYFt3W5GUuS3pF9FdFEKw=
X-Received: by 2002:a05:6214:153:: with SMTP id
 x19mr670918qvs.18.1632759274761; 
 Mon, 27 Sep 2021 09:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <a0ff7b4a-2433-7ff4-a998-c2c286d3c497@amd.com>
In-Reply-To: <a0ff7b4a-2433-7ff4-a998-c2c286d3c497@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 27 Sep 2021 17:14:06 +0100
Message-ID: <CAM0jSHMrYPM9Wb2WCw5ktLjhN=+0H-qD_1cQbrnPhQRg0_U2=Q@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 01/13] drm/ttm: stop calling tt_swapin in
 vm_access
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Sept 2021 at 12:47, Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Any objections that I just push patches 1-7 to drm-misc-next?

Please go ahead Christian. Thanks.

>
> Christian.
>
> Am 27.09.21 um 13:41 schrieb Matthew Auld:
> > In commit:
> >
> > commit 09ac4fcb3f255e9225967c75f5893325c116cdbe
> > Author: Felix Kuehling <Felix.Kuehling@amd.com>
> > Date:   Thu Jul 13 17:01:16 2017 -0400
> >
> >      drm/ttm: Implement vm_operations_struct.access v2
> >
> > we added the vm_access hook, where we also directly call tt_swapin for
> > some reason. If something is swapped-out then the ttm_tt must also be
> > unpopulated, and since access_kmap should also call tt_populate, if
> > needed, then swapping-in will already be handled there.
> >
> > If anything, calling tt_swapin directly here would likely always fail
> > since the tt->pages won't yet be populated, or worse since the tt->page=
s
> > array is never actually cleared in unpopulate this might lead to a nast=
y
> > uaf.
> >
> > Fixes: 09ac4fcb3f25 ("drm/ttm: Implement vm_operations_struct.access v2=
")
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > ---
> >   drivers/gpu/drm/ttm/ttm_bo_vm.c | 5 -----
> >   1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_=
bo_vm.c
> > index f56be5bc0861..5b9b7fd01a69 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > @@ -519,11 +519,6 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, u=
nsigned long addr,
> >
> >       switch (bo->resource->mem_type) {
> >       case TTM_PL_SYSTEM:
> > -             if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)=
) {
> > -                     ret =3D ttm_tt_swapin(bo->ttm);
> > -                     if (unlikely(ret !=3D 0))
> > -                             return ret;
> > -             }
> >               fallthrough;
> >       case TTM_PL_TT:
> >               ret =3D ttm_bo_vm_access_kmap(bo, offset, buf, len, write=
);
>
