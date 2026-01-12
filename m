Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65225D13979
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609F989F27;
	Mon, 12 Jan 2026 15:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="aJcgIh30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FF089F27
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 15:20:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso70393755e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768231206; x=1768836006;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xCaZzH+lcVbCcf5Es6xbFsEnRsI/nfXmSv9uR836XxI=;
 b=aJcgIh30Q6VOyPdZCASJobKE2CQfS/mn2DwERfHaNep2dn9gj8pbZea1gR5K785Sjo
 6AHqoyxVReMJq//xvm7HitjskrTWYfY77QcO35vHThxyQIWgYSq2INTq7rCbG1ziwvqc
 HSoQw2huHmEnJCyVqRMBxF39tg988LaU44oTw3u8wFr+P0Hogeb7oL/mIw49QqcaBDke
 eb8M3yyxuTagRXmJt3XOiMLj3gZYseSPSY62LC915xnPnqIrZDDADPNu4Un0ogC6bsO/
 u3zfEDmUFNTcYco3i8PbpPyt/CThq+8eeORT0fjX0EyL33s8ZR+4eAZNzHv+psNdLYAe
 iWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768231206; x=1768836006;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xCaZzH+lcVbCcf5Es6xbFsEnRsI/nfXmSv9uR836XxI=;
 b=TYSAQx6gYKTnjad+doA0QyVxRyQp45hbSiEpVUekp3Ot6hUS+xUnkMEOxjDq6/CDGM
 KnJa0k4eWdhsvw4adr7GjOqBfULrAVo7pnDxqmWp+eM3iBZhTSYcwpYlRDjRbV4lpi0K
 NTff0JxPFdg3K6hl33THoMHKR7Y7DfFr8aiFo+XKTHn+r7Gj4y5bOM9AM9K5LTBGs082
 U26uwRd3+5OcqlKqqSPObPtbz2YChnortJNcWOBeJ6089RYx4mXYnigQCeH0vqgOhew+
 MTogPJ874byZbY89WzFPYbNazBYpnMrgfGKrTRvFL3ITvaekcAK1ato+jOBJX5qNS8Nu
 Z9bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVceyEww7tTkocZQCJsS77h/cM31pC6MM3JfaGJEvWAvPj8U2Gd0EHLBFKUbCQ2Ei8+SYnmJXYPzbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpOYOEkWVf3QhewD6mQ/oBqHe5nOIDl9sRTKOmplthRW4rwAag
 UjOmd5mGzoxXChoF4NKj1Dla6mWCRUwdWMfOekZ98DL+9Qd7+e0zpqip8FUTyN/FCZI4Wa/XWB6
 iQe2c/JDxvlAQmcAPXB21Le7H6INQG4L/JBIuSd71
X-Gm-Gg: AY/fxX61KO+qdpZ2sBZ4vnTL0zoCP4XnOY+DlYg+JxME/1TX1O2cS06RVcINjmXyd7y
 muNfVDZ62vlHQSvr84kEtrwZp2lea/9oHEtYf4bhsRBKhHzq2Y01s7uEPhWmU1RMe8b2jPas2zl
 NDdbfwpduh5uwgfKhcw9pGpT4lpSSpQipCaxCXf45Z5PQR6gL+c4kbPKadqj1vL3xoeqmgKSI6w
 yWXRsF8rzmPrBEW+JwjsN1usLdKyP2NTgGXXPmxU82YiFXl2AXGi3LeafvxbCkjbijcNRK0EAj5
 qWx8FXw1iWvifPuuIIpe5NKLnw==
X-Google-Smtp-Source: AGHT+IEt7u7fimJVgeqny6t+QJ8D84JrK5SDHO38zaxi7BbKRvyaZu3UWMmoNG46WPl9z4Kvznu61ws1sxmhzF2tHIk=
X-Received: by 2002:a05:600c:1d04:b0:46e:35a0:3587 with SMTP id
 5b1f17b1804b1-47d84b3a06fmr221768935e9.27.1768231206244; Mon, 12 Jan 2026
 07:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-9-boris.brezillon@collabora.com>
 <c86e341d-0dd2-4a97-b047-f62f2aa64c7e@arm.com>
 <20260112153953.61eb20dc@fedora>
In-Reply-To: <20260112153953.61eb20dc@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Jan 2026 16:19:52 +0100
X-Gm-Features: AZwV_QgJcmcFcfD1nq9wVw7D6_OT-PWEmj_JMm13p6HZV8w6gpUl-Ug2_-KQyoA
Message-ID: <CAH5fLggS-sgKYRvnraRsOoYysVnYoDdhmiu1jbdWv132BBcWAA@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] drm/panthor: Track the number of mmap on a BO
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 kernel@collabora.com
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

On Mon, Jan 12, 2026 at 3:40=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon, 12 Jan 2026 12:33:33 +0000
> Steven Price <steven.price@arm.com> wrote:
>
> > On 09/01/2026 13:08, Boris Brezillon wrote:
> > > This will be used to order things by reclaimability.
> > >
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > ---
> > >  drivers/gpu/drm/panthor/panthor_gem.c | 44 +++++++++++++++++++++++++=
--
> > >  drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
> > >  2 files changed, 45 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/=
panthor/panthor_gem.c
> > > index 44f05bd957e7..458d22380e96 100644
> > > --- a/drivers/gpu/drm/panthor/panthor_gem.c
> > > +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> > > @@ -484,6 +484,7 @@ static void panthor_gem_print_info(struct drm_pri=
nter *p, unsigned int indent,
> > >     drm_printf_indent(p, indent, "vmap_use_count=3D%u\n",
> > >                       refcount_read(&bo->cmap.vaddr_use_count));
> > >     drm_printf_indent(p, indent, "vaddr=3D%p\n", bo->cmap.vaddr);
> > > +   drm_printf_indent(p, indent, "mmap_count=3D%u\n", refcount_read(&=
bo->cmap.mmap_count));
> > >  }
> > >
> > >  static int panthor_gem_pin_locked(struct drm_gem_object *obj)
> > > @@ -600,6 +601,13 @@ static int panthor_gem_mmap(struct drm_gem_objec=
t *obj, struct vm_area_struct *v
> > >     if (is_cow_mapping(vma->vm_flags))
> > >             return -EINVAL;
> > >
> > > +   if (!refcount_inc_not_zero(&bo->cmap.mmap_count)) {
> > > +           dma_resv_lock(obj->resv, NULL);
> > > +           if (!refcount_inc_not_zero(&bo->cmap.mmap_count))
> > > +                   refcount_set(&bo->cmap.mmap_count, 1);
> > > +           dma_resv_unlock(obj->resv);
> > > +   }
> > > +
> > >     vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> > >     vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> > >     if (should_map_wc(bo))
> > > @@ -732,10 +740,42 @@ static vm_fault_t panthor_gem_fault(struct vm_f=
ault *vmf)
> > >     return blocking_page_setup(vmf, bo, page_offset, true);
> > >  }
> > >
> > > +static void panthor_gem_vm_open(struct vm_area_struct *vma)
> > > +{
> > > +   struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private_d=
ata);
> > > +
> > > +   /* mmap_count must have been incremented at mmap time, so it can'=
t be
> > > +    * zero here.
> > > +    */
> > > +   if (!drm_gem_is_imported(&bo->base))
> > > +           drm_WARN_ON(bo->base.dev, !refcount_inc_not_zero(&bo->cma=
p.mmap_count));
> > > +
> > > +   drm_gem_vm_open(vma);
> > > +}
> > > +
> > > +static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > +{
> > > +   struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private_d=
ata);
> > > +
> > > +   if (drm_gem_is_imported(&bo->base))
> > > +           goto out;
> > > +
> > > +   if (refcount_dec_not_one(&bo->cmap.mmap_count))
> > > +           goto out;
> > > +
> > > +   dma_resv_lock(bo->base.resv, NULL);
> > > +   if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> > > +           refcount_set(&bo->cmap.mmap_count, 0);
> > > +   dma_resv_unlock(bo->base.resv);
> >
> > I don't think this logic is safe. Holding the resv_lock doesn't protect
> > against another thread doing a refcount_inc_not_zero() without holding
> > the lock.
> >
> > I think you can just replace the if() part with a refcount_dec() call,
> > the lock AFAICT is needed because the following patch wants to be sure
> > that !!mmap_count is stable when resv_lock is held.
>
> I wish I could, but refcount_dec() doesn't let me do the 1 -> 0 without
> complaining :P.

I'm pretty sure that refcount_dec() is fine with 1->0. Did you mean
refcount_inc() and 0->1?

> > I also feel you should invert the conditino for refcount_dec_not_one,
> > leading to the following which I feel is easier to read:
> >
> > static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > {
> >       [...]
> >
> >       if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> >               dma_resv_lock(bo->base.resv, NULL);
> >               refcount_dec(&bo->cmap.mmap_count);
> >               dma_resv_unlock(bo->base.resv);
> >       }
>
> The best I can do is:
>
>         if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
>                 dma_resv_lock(bo->base.resv, NULL);
>                 if (!refcount_dec_not_one(&bo->cmap.mmap_count))
>                         refcount_set(&bo->cmap.mmap_count, 0);
>                 dma_resv_unlock(bo->base.resv);
>         }
>
> so we only take the lock when absolutely needed, but the 1 -> 0
> transition still has to be done with "if (dec_not_one) set(0)".

Why not just use atomic_t and use the atomic inc/dec operations? They
don't have saturation, but also do not require treating zero
specially.

Alice
