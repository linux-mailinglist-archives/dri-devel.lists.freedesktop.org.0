Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B54668EA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 18:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD4A6EB69;
	Thu,  2 Dec 2021 17:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5AA6EB69;
 Thu,  2 Dec 2021 17:13:41 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso526706ota.5; 
 Thu, 02 Dec 2021 09:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AajSOfABZmizcM6W0Pmxe8k6X7Mucgg0abkivyflOos=;
 b=bIlQhALzsSpyrYW9oR4N0/2vKAB+viUUzyc3WxBGoTrY1n1CuWkJAJWPyk//ixBkqO
 Q8mizzVUZP6eHGSldLFeptQbPnchOCZS0L5bdMOYKq7vmpUhSpYTE4rLByZvBCpx3rsd
 GBJDhjxb9oB7frIH62viMTVgoO2uX1p/kugcDiQKEArIHIE1qeF9onCNFc1zKr2IkZdN
 ExoRWlOlUChn5wzXFJ9s4M5Csp76CTawiysoyf2iZE7dhn1MuaNPTXvQRGAcvbS4gbdn
 4WyAfbS8Y5LS7K7HFcqsUuIPo59XZp0ov4xEUuHTribO/RQRrpvWFsMIY7+ZG+PqfTTA
 27tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AajSOfABZmizcM6W0Pmxe8k6X7Mucgg0abkivyflOos=;
 b=35hz4oS6CMMLXCwVWTn+3rCRdHGlRgZGniP5R4RtewcS8N/loTBySd/NuXl1duBA7J
 ARHLkK5doQQHvgFWi4gE53Lc4PpGeD3NU4zZyZ1A2qS09/kINXhpb4fE5sf81W/7cG+h
 nYe3UIu2zjG3SWHA2ylKB6s0JIZIhyMPsRhar+6N5l3lqL2YPsZv6dCiToWZGfRHcppm
 GdP2xLFM+EOekK0E9EpN9T9tub/RUFezWB/ddvpHIe1/Rdg/aNVqnn533PtYE8/Q4IXc
 2XwWfzv7+P7a2r8zkgq0I/Ul1DJPP7T18AC2HgqgNABw5+Aj8k8Qs4YTsOTFnhoJZizF
 DYgQ==
X-Gm-Message-State: AOAM531I7G2qvIqUFnfQvMw1SGm/xoAHiEc0iwY8pgJfbV0CQxF7s7KV
 Id31IOgeTZbbk27Xo1oUlVYcxvLhKGLEs4zdfaQ=
X-Google-Smtp-Source: ABdhPJyY0ZZWWmrlcECjWfIA9f9tGUxAjcFzMuc9v82NaipBZRDDsrY/MKV5w4zTGRjqkwjOCU8VNEXDZDW/t9WcfR0=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr12467723otn.299.1638465220553; 
 Thu, 02 Dec 2021 09:13:40 -0800 (PST)
MIME-Version: 1.0
References: <e2685075-fbc5-6f36-907f-76b6f76a59ce@amd.com>
 <20211201151310.177671-1-zhou1615@umn.edu>
 <77fca7d2-b1d8-fe11-322a-3d32f40f6f65@amd.com>
In-Reply-To: <77fca7d2-b1d8-fe11-322a-3d32f40f6f65@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 2 Dec 2021 12:13:29 -0500
Message-ID: <CADnq5_M61Ob29ftgNB7L1eEAb_St1WL1wLEF3C4wXSEFP+3BMw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Zhou Qingyang <zhou1615@umn.edu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Dec 1, 2021 at 10:16 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 01.12.21 um 16:13 schrieb Zhou Qingyang:
> > In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
> > vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
> > radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
> > which could lead to a NULL pointer dereference on failure of
> > radeon_vm_bo_add().
> >
> > Fix this bug by adding a check of vm->ib_bo_va.
> >
> > This bug was found by a static analyzer. The analysis employs
> > differential checking to identify inconsistent security operations
> > (e.g., checks or kfrees) between two code paths and confirms that the
> > inconsistent operations are not recovered in the current function or
> > the callers, so they constitute bugs.
> >
> > Note that, as a bug found by static analysis, it can be a false
> > positive or hard to trigger. Multiple researchers have cross-reviewed
> > the bug.
> >
> > Builds with CONFIG_DRM_RADEON=3Dm show no new warnings,
> > and our static analyzer no longer warns about this code.
> >
> > Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
> > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> > ---
> > Changes in v5:
> >    -  Use conditions to avoid unnecessary initialization
> >
> > Changes in v4:
> >    -  Initialize the variables to silence warning
> >
> > Changes in v3:
> >    -  Fix the bug that good case will also be freed
> >    -  Improve code style
> >
> > Changes in v2:
> >    -  Improve the error handling into goto style
> >
> >   drivers/gpu/drm/radeon/radeon_kms.c | 36 ++++++++++++++++------------=
-
> >   1 file changed, 20 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/rade=
on/radeon_kms.c
> > index 482fb0ae6cb5..66aee48fd09d 100644
> > --- a/drivers/gpu/drm/radeon/radeon_kms.c
> > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> > @@ -648,6 +648,8 @@ void radeon_driver_lastclose_kms(struct drm_device =
*dev)
> >   int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *f=
ile_priv)
> >   {
> >       struct radeon_device *rdev =3D dev->dev_private;
> > +     struct radeon_fpriv *fpriv;
> > +     struct radeon_vm *vm;
> >       int r;
> >
> >       file_priv->driver_priv =3D NULL;
> > @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device *dev, =
struct drm_file *file_priv)
> >
> >       /* new gpu have virtual address space support */
> >       if (rdev->family >=3D CHIP_CAYMAN) {
> > -             struct radeon_fpriv *fpriv;
> > -             struct radeon_vm *vm;
> >
> >               fpriv =3D kzalloc(sizeof(*fpriv), GFP_KERNEL);
> >               if (unlikely(!fpriv)) {
> > @@ -672,35 +672,39 @@ int radeon_driver_open_kms(struct drm_device *dev=
, struct drm_file *file_priv)
> >               if (rdev->accel_working) {
> >                       vm =3D &fpriv->vm;
> >                       r =3D radeon_vm_init(rdev, vm);
> > -                     if (r) {
> > -                             kfree(fpriv);
> > -                             goto out_suspend;
> > -                     }
> > +                     if (r)
> > +                             goto out_fpriv;
> >
> >                       r =3D radeon_bo_reserve(rdev->ring_tmp_bo.bo, fal=
se);
> > -                     if (r) {
> > -                             radeon_vm_fini(rdev, vm);
> > -                             kfree(fpriv);
> > -                             goto out_suspend;
> > -                     }
> > +                     if (r)
> > +                             goto out_vm_fini;
> >
> >                       /* map the ib pool buffer read only into
> >                        * virtual address space */
> >                       vm->ib_bo_va =3D radeon_vm_bo_add(rdev, vm,
> >                                                       rdev->ring_tmp_bo=
.bo);
> > +                     if (!vm->ib_bo_va) {
> > +                             r =3D -ENOMEM;
> > +                             goto out_vm_fini;
> > +                     }
> > +
> >                       r =3D radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
> >                                                 RADEON_VA_IB_OFFSET,
> >                                                 RADEON_VM_PAGE_READABLE=
 |
> >                                                 RADEON_VM_PAGE_SNOOPED)=
;
> > -                     if (r) {
> > -                             radeon_vm_fini(rdev, vm);
> > -                             kfree(fpriv);
> > -                             goto out_suspend;
> > -                     }
> > +                     if (r)
> > +                             goto out_vm_fini;
> >               }
> >               file_priv->driver_priv =3D fpriv;
> >       }
> >
> > +     if (!r)
>
> I think that test is unecessary now, maybe double check.
>
> Either way patch Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>. Alex will probably pick it up now.
>
> Thanks for the help,
> Christian.
>
> > +             goto out_suspend;
> > +
> > +out_vm_fini:
> > +     radeon_vm_fini(rdev, vm);
> > +out_fpriv:
> > +     kfree(fpriv);
> >   out_suspend:
> >       pm_runtime_mark_last_busy(dev->dev);
> >       pm_runtime_put_autosuspend(dev->dev);
>
