Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7098836549B
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9964A6E4A6;
	Tue, 20 Apr 2021 08:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D3C6E49F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:51:55 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id w23so41269075ejb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=j+++nrevZRXPhpw9iv22J29xnksChvbllnn/Sum81nU=;
 b=KvafGYBp1xKT95Sd29BDdgK7yWKpZmi5b87cfkS5aa1IzN7sDkXtpEqI2pCDOwHYOZ
 AKIOrpAyGskd/D8xwVPqA+dvy+crgCkaGC7tD3OVQTBI2JHjMk+5Si3ywls3nkFOpmPn
 SwoErAP2/j0X0i1SjVy9sRUNph7RCi3e3SFh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=j+++nrevZRXPhpw9iv22J29xnksChvbllnn/Sum81nU=;
 b=q/cAWy2x6xQqq1ty9rV2oZhyesxL8MT78QrwdaTrWDwznbNy7XbBn3u5lAD7EpL6BE
 NzS4BRNB3s6T3/wR+u5w+XiM4vQlyApMO45c8A9q3kVTbm2wSd3fTDhzer+rj8WFJAUo
 M19PoDbq9ZocQ4KAO9dDKuxaYmLp0VgQMbDQAITnZYchkLIUmwHDsVX/e6Sh1i19fO8a
 q/JGVF854tz3yx/pkwhi7wkYJhxu9KLh3B4ZXWJDhv5lBf8ZbrXuuqA1a1v4btFaHyMD
 +weQeFHl2QMKd7s/s/PsLlSax7NOahXdLW5pOshUatr4OY/tJHWFPurh+1iEN2h7ZlLj
 QOTg==
X-Gm-Message-State: AOAM532qaonqMqZ+ulZ4SrabdfLQQUq891HoiylV5d4qJeGpNm9Amj6V
 G7uMaR70Bv29soy/Y/4ThYwrUQ==
X-Google-Smtp-Source: ABdhPJxQeoo1M1oumGIbitNwXso9Gevl5Db2luvteAH4h8DEe/JHpH9usI0nbQ02nn0EK2p7FSYBgQ==
X-Received: by 2002:a17:906:e08b:: with SMTP id
 gh11mr26386908ejb.33.1618908714023; 
 Tue, 20 Apr 2021 01:51:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e16sm15157737edu.94.2021.04.20.01.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:51:53 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:51:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
Message-ID: <YH6WJ0p2jGd3Q5Xw@phenom.ffwll.local>
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
 <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
 <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52403618-62f5-2085-c245-e1e98762cccb@suse.de>
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
Cc: amd-gfx@lists.freedesktop.org, shashank.sharma@amd.com, airlied@linux.ie,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix.Kuehling@amd.com, sroland@vmware.com, nirmoy.das@amd.com,
 dri-devel@lists.freedesktop.org, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sam@ravnborg.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 09:51:27AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 16.04.21 um 15:51 schrieb Christian K=F6nig:
> > Am 16.04.21 um 15:46 schrieb Christian K=F6nig:
> > > Am 16.04.21 um 15:31 schrieb Thomas Zimmermann:
> > > > The vmwgfx driver is the only remaining user of ttm_bo_mmap(). Inli=
ne
> > > > the code. The internal helper ttm_bo_vm_lookup() is now also part of
> > > > vmwgfx as vmw_bo_vm_lookup().
> > > > =

> > > > v2:
> > > > =A0=A0=A0=A0* replace pr_err() with drm_err() (Zack)
> > > > =

> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Reviewed-by: Zack Rusin <zackr@vmware.com>
> > > > ---
> > > > =A0 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c | 56 +++++++++++++++++=
+++++--
> > > > =A0 1 file changed, 53 insertions(+), 3 deletions(-)
> > > > =

> > > > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > index cb9975889e2f..c8b6543b4e39 100644
> > > > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
> > > > @@ -27,6 +27,32 @@
> > > > =A0 =A0 #include "vmwgfx_drv.h"
> > > > =A0 +static struct ttm_buffer_object *vmw_bo_vm_lookup(struct
> > > > ttm_device *bdev,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 unsigned long offset,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 unsigned long pages)
> > > > +{
> > > > +=A0=A0=A0 struct vmw_private *dev_priv =3D container_of(bdev, stru=
ct
> > > > vmw_private, bdev);
> > > > +=A0=A0=A0 struct drm_device *drm =3D &dev_priv->drm;
> > > > +=A0=A0=A0 struct drm_vma_offset_node *node;
> > > > +=A0=A0=A0 struct ttm_buffer_object *bo =3D NULL;
> > > > +
> > > > +=A0=A0=A0 drm_vma_offset_lock_lookup(bdev->vma_manager);
> > > > +
> > > > +=A0=A0=A0 node =3D drm_vma_offset_lookup_locked(bdev->vma_manager,
> > > > offset, pages);
> > > > +=A0=A0=A0 if (likely(node)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 bo =3D container_of(node,
> struct ttm_buffer_object,
> > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 base.vma_node);
> > > > +=A0=A0=A0=A0=A0=A0=A0 bo =3D ttm_bo_get_unless_zero(bo);
> > > > +=A0=A0=A0 }
> > > > +
> > > > +=A0=A0=A0 drm_vma_offset_unlock_lookup(bdev->vma_manager);
> > > > +
> > > > +=A0=A0=A0 if (!bo)
> > > > +=A0=A0=A0=A0=A0=A0=A0 drm_err(drm, "Could not find buffer object t=
o map\n");
> > > > +
> > > > +=A0=A0=A0 return bo;
> > > > +}
> > > > +
> > > > =A0 int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
> > > > =A0 {
> > > > =A0=A0=A0=A0=A0 static const struct vm_operations_struct vmw_vm_ops=
 =3D {
> > > > @@ -41,10 +67,28 @@ int vmw_mmap(struct file *filp, struct
> > > > vm_area_struct *vma)
> > > > =A0=A0=A0=A0=A0 };
> > > > =A0=A0=A0=A0=A0 struct drm_file *file_priv =3D filp->private_data;
> > > > =A0=A0=A0=A0=A0 struct vmw_private *dev_priv =3D vmw_priv(file_priv=
->minor->dev);
> > > > -=A0=A0=A0 int ret =3D ttm_bo_mmap(filp, vma, &dev_priv->bdev);
> > > > +=A0=A0=A0 struct ttm_device *bdev =3D &dev_priv->bdev;
> > > > +=A0=A0=A0 struct ttm_buffer_object *bo;
> > > > +=A0=A0=A0 int ret;
> > > > +
> > > > +=A0=A0=A0 if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET_START))
> > > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > +
> > > > +=A0=A0=A0 bo =3D vmw_bo_vm_lookup(bdev, vma->vm_pgoff, vma_pages(v=
ma));
> > > > +=A0=A0=A0 if (unlikely(!bo))
> > > > +=A0=A0=A0=A0=A0=A0=A0 return -EINVAL;
> > > > =A0 -=A0=A0=A0 if (ret)
> > > > -=A0=A0=A0=A0=A0=A0=A0 return ret;
> > > > +=A0=A0=A0 if (unlikely(!bo->bdev->funcs->verify_access)) {
> > > > +=A0=A0=A0=A0=A0=A0=A0 ret =3D -EPERM;
> > > > +=A0=A0=A0=A0=A0=A0=A0 goto out_unref;
> > > > +=A0=A0=A0 }
> > > > +=A0=A0=A0 ret =3D bo->bdev->funcs->verify_access(bo, filp);
> > > =

> > > Is there any reason we can't call vmw_verify_access() directly here?
> > > =

> > > Would allow us to completely nuke the verify_access callback as well
> > > as far as I can see.
> > =

> > Forget what I said, couldn't see the next patch in my mailbox at time of
> > writing.
> > =

> > Whole series is Reviewed-by: Christian K=F6nig <christian.koenig@amd.co=
m>
> =

> Thanks a lot. If I'm not mistaken, the patches at [1] need to go in first.
> So it could take a a bit until this lands.
> =

> Otherwise, this series could go through the same tree as [1] if nouveau a=
nd
> vmwgfx devs don't mind.

I would land it all through drm-misc-next. Maybe check with Alex on irc
for an ack for merging that way, but I don't think this will cause issues
against the amdgpu tree. Lots of ttm cleanup has landed this way already
past few months. Otherwise you could create a small topic branch with
these patches here and send that to Alex, and he can sort out the
interaction with Felix' series.
-Daniel


> =

> Best regards
> Thomas
> =

> [1] https://patchwork.freedesktop.org/series/88822/
> =

> > =

> > Thanks for the nice cleanup,
> > Christian.
> > =

> > > =

> > > Regards,
> > > Christian.
> > > =

> > > > +=A0=A0=A0 if (unlikely(ret !=3D 0))
> > > > +=A0=A0=A0=A0=A0=A0=A0 goto out_unref;
> > > > +
> > > > +=A0=A0=A0 ret =3D ttm_bo_mmap_obj(vma, bo);
> > > > +=A0=A0=A0 if (unlikely(ret !=3D 0))
> > > > +=A0=A0=A0=A0=A0=A0=A0 goto out_unref;
> > > > =A0 =A0=A0=A0=A0=A0 vma->vm_ops =3D &vmw_vm_ops;
> > > > =A0 @@ -52,7 +96,13 @@ int vmw_mmap(struct file *filp, struct
> > > > vm_area_struct *vma)
> > > > =A0=A0=A0=A0=A0 if (!is_cow_mapping(vma->vm_flags))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 vma->vm_flags =3D (vma->vm_flags & ~VM_=
MIXEDMAP) | VM_PFNMAP;
> > > > =A0 +=A0=A0=A0 ttm_bo_put(bo); /* release extra ref taken
> by
> > > > ttm_bo_mmap_obj() */
> > > > +
> > > > =A0=A0=A0=A0=A0 return 0;
> > > > +
> > > > +out_unref:
> > > > +=A0=A0=A0 ttm_bo_put(bo);
> > > > +=A0=A0=A0 return ret;
> > > > =A0 }
> > > > =A0 =A0 /* struct vmw_validation_mem callback */
> > > =

> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
