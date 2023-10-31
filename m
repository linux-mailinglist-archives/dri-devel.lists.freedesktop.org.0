Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2FC7DCE71
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB46A10E4E7;
	Tue, 31 Oct 2023 14:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F8D10E4E7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 14:00:10 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6bc57401cb9so729120a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 07:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google; t=1698760810; x=1699365610;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6FqmGXkLwF16EKSjNxPpnhv80YLFjJkWtIoIkDYy1YE=;
 b=KaJdG0m2zW8Zi1OFPzDINxZR+MS7kiWNMMLCEIL/d2nRlxb0KQZrwdiPO5OkAEv70o
 t+6RQBYeE7Erhe1ri7blPzC24kVyPDUR8kfH45+h/DRBRdP2nDOAyYqAauRpKjeaSDoy
 AGgtsgWABlAmuJ2NT2UeFjvj5E7I6mJcurzGTPb2xYawFe4MLyJmfBF1WKazD70gIZgx
 NcQNXWkN4in9jggNh8CR6gt6G3SoWaG6lQDRfTh4/9nJI6Y3BQ/Cnve7h0/1EpJpf7N5
 LCwT3GOJrOHNBbsc8plTKIoym66HrAYT25LYEGAVAugplUp54EOdNv4oDoB1txuxaRVt
 coMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698760810; x=1699365610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6FqmGXkLwF16EKSjNxPpnhv80YLFjJkWtIoIkDYy1YE=;
 b=asbd+FlaqVXNoH/eJndqsktOTf4ZgmOGjqlb0KP2rv1ENfFCahuGYZHcMZGpqBTYOW
 jnl4q8kuknE5JdzR+rM9T6DLEsef6Ls2FCqPC4HD3LdhankPQaA/vEIorybAJrYFM1yr
 SjUBg8dseOynL24VJiELkmBfvRki1EFzHSnsokpffW3Jy64Th9Im4IwQm3xd1GexkdCx
 CxKCxhbL9YqIv3GmnLCevu4qMlv3hNZZ2HTZBOi+6aHgql5Yo6FiE91zlteHKRZUDIvZ
 5nQ/rU2kpkAGQ+o1+JhGkYhshl13OON2wD23tkJnDvMZb2NsaIm0AK8Pxqr2/3Vp3qiT
 yzXg==
X-Gm-Message-State: AOJu0YzMkf3/Ls5iSqfQeln6jMF5aozGyiw781JAWsLSB5zlDjK9gj7P
 nS+axpN+Thb0sBMTMjS2FvhHyU306ShHaK3orIClSg==
X-Google-Smtp-Source: AGHT+IG43gLTNb6aEWk3edl4xCOfPF0lJ8YhU+qc55CI6it/+rSdinesCtKKtzWZbZBilH258aaulWfHkWu1vJtZKeM=
X-Received: by 2002:a05:6808:1809:b0:3b2:ec66:d863 with SMTP id
 bh9-20020a056808180900b003b2ec66d863mr15094044oib.3.1698760809761; Tue, 31
 Oct 2023 07:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
In-Reply-To: <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 31 Oct 2023 14:59:58 +0100
Message-ID: <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="0000000000009fe70d0609039289"
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009fe70d0609039289
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 2:57=E2=80=AFPM Christian K=C3=B6nig <christian.koe=
nig@amd.com>
wrote:

> Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
> > The current amdgpu_gem_va_update_vm only tries to perform updates for t=
he
> > BO specified in the GEM ioctl; however, when a binding is split, the
> > adjacent bindings also need to be updated. Such updates currently ends =
up
> > getting deferred until next submission which causes stalls.
>
> Yeah, that is a necessity. The hardware simply doesn't support what you
> try to do here in all cases.
>

What can the hardware not do here? Is this just needing to wait for TLB
flushes before we can free pagetables, can we just delay that?


>
> So this approach won't work in general.
>
> Regards,
> Christian.
>
> >
> > Introduce a new state "dirty", shared between per-VM BOs and traditiona=
l
> > BOs, containing all BOs that have pending updates in `invalids`.
> > amdgpu_gem_va_update_vm will now simply flush any pending updates for B=
Os
> > in the dirty state.
> >
> > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66 ++++++++++++++++++------=
-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
> >   3 files changed, 63 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > index a1b15d0d6c48..01d3a97248b0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct drm_device
> *dev, void *data,
> >    * vital here, so they are not reported back to userspace.
> >    */
> >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
> > -                                 struct amdgpu_vm *vm,
> > -                                 struct amdgpu_bo_va *bo_va,
> > -                                 uint32_t operation)
> > +                                 struct amdgpu_vm *vm)
> >   {
> > +     struct amdgpu_bo_va *bo_va;
> >       int r;
> >
> >       if (!amdgpu_vm_ready(vm))
> > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct
> amdgpu_device *adev,
> >       if (r)
> >               goto error;
> >
> > -     if (operation =3D=3D AMDGPU_VA_OP_MAP ||
> > -         operation =3D=3D AMDGPU_VA_OP_REPLACE) {
> > +     spin_lock(&vm->status_lock);
> > +     while (!list_empty(&vm->dirty)) {
> > +             bo_va =3D list_first_entry(&vm->dirty, struct amdgpu_bo_v=
a,
> > +                                      base.vm_status);
> > +             spin_unlock(&vm->status_lock);
> > +
> >               r =3D amdgpu_vm_bo_update(adev, bo_va, false);
> >               if (r)
> >                       goto error;
> > +             spin_lock(&vm->status_lock);
> >       }
> > +     spin_unlock(&vm->status_lock);
> >
> >       r =3D amdgpu_vm_update_pdes(adev, vm, false);
> >
> > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, voi=
d
> *data,
> >               break;
> >       }
> >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) &&
> !amdgpu_vm_debug)
> > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
> > -                                     args->operation);
> > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
> >
> >   error:
> >       drm_exec_fini(&exec);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index dd6f72e2a1d6..01d31891cd05 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct
> amdgpu_vm_bo_base *vm_bo, bool evict
> >       spin_unlock(&vm_bo->vm->status_lock);
> >   }
> >
> > +/**
> > + * amdgpu_vm_bo_dirty - vm_bo is dirty
> > + *
> > + * @vm_bo: vm_bo which is dirty
> > + *
> > + * State for normal and per VM BOs that are not moved, but have new
> entries in
> > + * bo_va->invalids.
> > + */
> > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
> > +{
> > +     spin_lock(&vm_bo->vm->status_lock);
> > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
> > +     spin_unlock(&vm_bo->vm->status_lock);
> > +}
> > +
> >   /**
> >    * amdgpu_vm_bo_moved - vm_bo is moved
> >    *
> > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted,
> base.eviction_status)
> >               amdgpu_vm_bo_get_memory(bo_va, stats);
> >
> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status)
> > +             amdgpu_vm_bo_get_memory(bo_va, stats);
> > +
> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
> base.vm_status)
> >               amdgpu_vm_bo_get_memory(bo_va, stats);
> >
> > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct amdgpu_device
> *adev,
> >                       dma_resv_unlock(resv);
> >               spin_lock(&vm->status_lock);
> >       }
> > +
> > +     while (!list_empty(&vm->dirty)) {
> > +             bo_va =3D list_first_entry(&vm->dirty, struct amdgpu_bo_v=
a,
> > +                                      base.vm_status);
> > +             spin_unlock(&vm->status_lock);
> > +
> > +             r =3D amdgpu_vm_bo_update(adev, bo_va, false);
> > +             if (r)
> > +                     return r;
> > +             spin_lock(&vm->status_lock);
> > +     }
> >       spin_unlock(&vm->status_lock);
> >
> >       return 0;
> > @@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct
> amdgpu_device *adev,
> >                                   struct amdgpu_bo_va_mapping *mapping)
> >   {
> >       struct amdgpu_vm *vm =3D bo_va->base.vm;
> > -     struct amdgpu_bo *bo =3D bo_va->base.bo;
> >
> >       mapping->bo_va =3D bo_va;
> >       list_add(&mapping->list, &bo_va->invalids);
> >       amdgpu_vm_it_insert(mapping, &vm->va);
> > +     if (!bo_va->base.moved)
> > +             amdgpu_vm_bo_dirty(&bo_va->base);
> >
> >       if (mapping->flags & AMDGPU_PTE_PRT)
> >               amdgpu_vm_prt_get(adev);
> >
> > -     if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.resv &&
> > -         !bo_va->base.moved) {
> > -             amdgpu_vm_bo_moved(&bo_va->base);
> > -     }
> >       trace_amdgpu_vm_bo_map(bo_va, mapping);
> >   }
> >
> > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct
> amdgpu_device *adev,
> >                       before->flags =3D tmp->flags;
> >                       before->bo_va =3D tmp->bo_va;
> >                       list_add(&before->list, &tmp->bo_va->invalids);
> > +                     if (!tmp->bo_va->base.moved)
> > +                             amdgpu_vm_bo_dirty(&tmp->bo_va->base);
> >               }
> >
> >               /* Remember mapping split at the end */
> > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct
> amdgpu_device *adev,
> >                       after->flags =3D tmp->flags;
> >                       after->bo_va =3D tmp->bo_va;
> >                       list_add(&after->list, &tmp->bo_va->invalids);
> > +                     if (!tmp->bo_va->base.moved)
> > +                             amdgpu_vm_bo_dirty(&tmp->bo_va->base);
> >               }
> >
> >               list_del(&tmp->list);
> > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct
> amdgpu_device *adev,
> >
> >       /* Insert partial mapping before the range */
> >       if (!list_empty(&before->list)) {
> > -             struct amdgpu_bo *bo =3D before->bo_va->base.bo;
> > -
> >               amdgpu_vm_it_insert(before, &vm->va);
> >               if (before->flags & AMDGPU_PTE_PRT)
> >                       amdgpu_vm_prt_get(adev);
> > -
> > -             if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.=
resv
> &&
> > -                 !before->bo_va->base.moved)
> > -                     amdgpu_vm_bo_moved(&before->bo_va->base);
> >       } else {
> >               kfree(before);
> >       }
> >
> >       /* Insert partial mapping after the range */
> >       if (!list_empty(&after->list)) {
> > -             struct amdgpu_bo *bo =3D after->bo_va->base.bo;
> > -
> >               amdgpu_vm_it_insert(after, &vm->va);
> >               if (after->flags & AMDGPU_PTE_PRT)
> >                       amdgpu_vm_prt_get(adev);
> > -
> > -             if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.=
resv
> &&
> > -                 !after->bo_va->base.moved)
> > -                     amdgpu_vm_bo_moved(&after->bo_va->base);
> >       } else {
> >               kfree(after);
> >       }
> > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev,
> struct amdgpu_vm *vm, int32_t xcp
> >       INIT_LIST_HEAD(&vm->evicted);
> >       INIT_LIST_HEAD(&vm->relocated);
> >       INIT_LIST_HEAD(&vm->moved);
> > +     INIT_LIST_HEAD(&vm->dirty);
> >       INIT_LIST_HEAD(&vm->idle);
> >       INIT_LIST_HEAD(&vm->invalidated);
> >       spin_lock_init(&vm->status_lock);
> > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm
> *vm, struct seq_file *m)
> >   {
> >       struct amdgpu_bo_va *bo_va, *tmp;
> >       u64 total_idle =3D 0;
> > +     u64 total_dirty =3D 0;
> >       u64 total_relocated =3D 0;
> >       u64 total_moved =3D 0;
> >       u64 total_invalidated =3D 0;
> >       u64 total_done =3D 0;
> >       unsigned int total_idle_objs =3D 0;
> > +     unsigned int total_dirty_objs =3D 0;
> >       unsigned int total_relocated_objs =3D 0;
> >       unsigned int total_moved_objs =3D 0;
> >       unsigned int total_invalidated_objs =3D 0;
> > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm
> *vm, struct seq_file *m)
> >       total_idle_objs =3D id;
> >       id =3D 0;
> >
> > +     seq_puts(m, "\tDirty BOs:\n");
> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status) =
{
> > +             if (!bo_va->base.bo)
> > +                     continue;
> > +             total_dirty +=3D amdgpu_bo_print_info(id++, bo_va->base.b=
o,
> m);
> > +     }
> > +     total_dirty_objs =3D id;
> > +     id =3D 0;
> > +
> >       seq_puts(m, "\tRelocated BOs:\n");
> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated,
> base.vm_status) {
> >               if (!bo_va->base.bo)
> > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm
> *vm, struct seq_file *m)
> >
> >       seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n",
> total_idle,
> >                  total_idle_objs);
> > +     seq_printf(m, "\tTotal dirty size:       %12lld\tobjs:\t%d\n",
> total_dirty,
> > +                total_dirty_objs);
> >       seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n",
> total_relocated,
> >                  total_relocated_objs);
> >       seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n",
> total_moved,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > index d9ab97eabda9..f91d4fcf80b8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> > @@ -276,6 +276,9 @@ struct amdgpu_vm {
> >       /* per VM BOs moved, but not yet updated in the PT */
> >       struct list_head        moved;
> >
> > +     /* normal and per VM BOs that are not moved, but have new PT
> entries */
> > +     struct list_head        dirty;
> > +
> >       /* All BOs of this VM not currently in the state machine */
> >       struct list_head        idle;
> >
>
>

--0000000000009fe70d0609039289
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 2:57=E2=80=AF=
PM Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com">chr=
istian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:<br>
&gt; The current amdgpu_gem_va_update_vm only tries to perform updates for =
the<br>
&gt; BO specified in the GEM ioctl; however, when a binding is split, the<b=
r>
&gt; adjacent bindings also need to be updated. Such updates currently ends=
 up<br>
&gt; getting deferred until next submission which causes stalls.<br>
<br>
Yeah, that is a necessity. The hardware simply doesn&#39;t support what you=
 <br>
try to do here in all cases.<br></blockquote><div><br></div><div>What can t=
he hardware not do here? Is this just needing to wait for TLB flushes befor=
e we can free pagetables, can we just delay that?</div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
So this approach won&#39;t work in general.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Introduce a new state &quot;dirty&quot;, shared between per-VM BOs and=
 traditional<br>
&gt; BOs, containing all BOs that have pending updates in `invalids`.<br>
&gt; amdgpu_gem_va_update_vm will now simply flush any pending updates for =
BOs<br>
&gt; in the dirty state.<br>
&gt;<br>
&gt; Signed-off-by: Tatsuyuki Ishi &lt;<a href=3D"mailto:ishitatsuyuki@gmai=
l.com" target=3D"_blank">ishitatsuyuki@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c=C2=A0 | 66 ++++++++=
++++++++++-------<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h=C2=A0 |=C2=A0 3 ++<=
br>
&gt;=C2=A0 =C2=A03 files changed, 63 insertions(+), 24 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_gem.c<br>
&gt; index a1b15d0d6c48..01d3a97248b0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>
&gt; @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct drm_device *=
dev, void *data,<br>
&gt;=C2=A0 =C2=A0 * vital here, so they are not reported back to userspace.=
<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0static void amdgpu_gem_va_update_vm(struct amdgpu_device *=
adev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_vm *vm,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_bo_va *bo_va=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t operation)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_vm *vm)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct amdgpu_bo_va *bo_va;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!amdgpu_vm_ready(vm))<br>
&gt; @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct amdgp=
u_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (operation =3D=3D AMDGPU_VA_OP_MAP ||<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0operation =3D=3D AMDGPU_VA_OP_REPLA=
CE) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;vm-&gt;status_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (!list_empty(&amp;vm-&gt;dirty)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo_va =3D list_first_=
entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base.vm_sta=
tus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm-&=
gt;status_lock);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_vm_=
bo_update(adev, bo_va, false);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0goto error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;vm-&gt=
;status_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm-&gt;status_lock);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_vm_update_pdes(adev, vm, false)=
;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, vo=
id *data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!r &amp;&amp; !(args-&gt;flags &amp; AMD=
GPU_VM_DELAY_UPDATE) &amp;&amp; !amdgpu_vm_debug)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_gem_va_update_=
vm(adev, &amp;fpriv-&gt;vm, bo_va,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;ope=
ration);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_gem_va_update_=
vm(adev, &amp;fpriv-&gt;vm);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_exec_fini(&amp;exec);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm.c<br>
&gt; index dd6f72e2a1d6..01d31891cd05 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&gt; @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct amdgp=
u_vm_bo_base *vm_bo, bool evict<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_loc=
k);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * amdgpu_vm_bo_dirty - vm_bo is dirty<br>
&gt; + *<br>
&gt; + * @vm_bo: vm_bo which is dirty<br>
&gt; + *<br>
&gt; + * State for normal and per VM BOs that are not moved, but have new e=
ntries in<br>
&gt; + * bo_va-&gt;invalids.<br>
&gt; + */<br>
&gt; +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_lock(&amp;vm_bo-&gt;vm-&gt;status_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_move(&amp;vm_bo-&gt;vm_status, &amp;vm_bo-&g=
t;vm-&gt;dirty);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm_bo-&gt;vm-&gt;status_lock);<b=
r>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0/**<br>
&gt;=C2=A0 =C2=A0 * amdgpu_vm_bo_moved - vm_bo is moved<br>
&gt;=C2=A0 =C2=A0 *<br>
&gt; @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp, &amp;vm=
-&gt;evicted, base.eviction_status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_get=
_memory(bo_va, stats);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp, &amp;vm-&gt;=
dirty, base.vm_status)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_get_memo=
ry(bo_va, stats);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp, &amp;vm=
-&gt;relocated, base.vm_status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_get=
_memory(bo_va, stats);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct amdgpu_device=
 *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0dma_resv_unlock(resv);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;v=
m-&gt;status_lock);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (!list_empty(&amp;vm-&gt;dirty)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo_va =3D list_first_=
entry(&amp;vm-&gt;dirty, struct amdgpu_bo_va,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base.vm_sta=
tus);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm-&=
gt;status_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_vm_bo_up=
date(adev, bo_va, false);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return r;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock(&amp;vm-&gt=
;status_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;vm-&gt;status_lock);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; @@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct amd=
gpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_bo_va_=
mapping *mapping)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_vm *vm =3D bo_va-&gt;base.vm;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0struct amdgpu_bo *bo =3D bo_va-&gt;<a href=3D"htt=
p://base.bo" rel=3D"noreferrer" target=3D"_blank">base.bo</a>;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mapping-&gt;bo_va =3D bo_va;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add(&amp;mapping-&gt;list, &amp;bo_va-&=
gt;invalids);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_it_insert(mapping, &amp;vm-&gt;va)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!bo_va-&gt;base.moved)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_dirty(&a=
mp;bo_va-&gt;base);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (mapping-&gt;flags &amp; AMDGPU_PTE_PRT)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_prt_ge=
t(adev);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (bo &amp;&amp; bo-&gt;tbo.base.resv =3D=3D vm-=
&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!bo_va-&gt;base.moved) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_moved(&a=
mp;bo_va-&gt;base);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_amdgpu_vm_bo_map(bo_va, mapping);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_de=
vice *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0before-&gt;flags =3D tmp-&gt;flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0before-&gt;bo_va =3D tmp-&gt;bo_va;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0list_add(&amp;before-&gt;list, &amp;tmp-&gt;bo_va-&gt;invalids=
);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!tmp-&gt;bo_va-&gt;base.moved)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&g=
t;base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Remember mapp=
ing split at the end */<br>
&gt; @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_de=
vice *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0after-&gt;flags =3D tmp-&gt;flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0after-&gt;bo_va =3D tmp-&gt;bo_va;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0list_add(&amp;after-&gt;list, &amp;tmp-&gt;bo_va-&gt;invalids)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!tmp-&gt;bo_va-&gt;base.moved)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_bo_dirty(&amp;tmp-&gt;bo_va-&g=
t;base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;tm=
p-&gt;list);<br>
&gt; @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_=
device *adev,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert partial mapping before the range *=
/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!list_empty(&amp;before-&gt;list)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_bo *bo =
=3D before-&gt;bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferrer" targ=
et=3D"_blank">base.bo</a>;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_it_ins=
ert(before, &amp;vm-&gt;va);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (before-&gt;f=
lags &amp; AMDGPU_PTE_PRT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0amdgpu_vm_prt_get(adev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo &amp;&amp; bo-=
&gt;tbo.base.resv =3D=3D vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!before=
-&gt;bo_va-&gt;base.moved)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0amdgpu_vm_bo_moved(&amp;before-&gt;bo_va-&gt;base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(before);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Insert partial mapping after the range */=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!list_empty(&amp;after-&gt;list)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_bo *bo =
=3D after-&gt;bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferrer" targe=
t=3D"_blank">base.bo</a>;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vm_it_ins=
ert(after, &amp;vm-&gt;va);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (after-&gt;fl=
ags &amp; AMDGPU_PTE_PRT)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0amdgpu_vm_prt_get(adev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bo &amp;&amp; bo-=
&gt;tbo.base.resv =3D=3D vm-&gt;root.bo-&gt;tbo.base.resv &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!after-=
&gt;bo_va-&gt;base.moved)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0amdgpu_vm_bo_moved(&amp;after-&gt;bo_va-&gt;base);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(after);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, s=
truct amdgpu_vm *vm, int32_t xcp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;evicted);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;relocated);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;moved);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;dirty);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;idle);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_LIST_HEAD(&amp;vm-&gt;invalidated);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;vm-&gt;status_lock);<br>
&gt; @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_v=
m *vm, struct seq_file *m)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_bo_va *bo_va, *tmp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_idle =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u64 total_dirty =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_relocated =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_moved =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_invalidated =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 total_done =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_idle_objs =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned int total_dirty_objs =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_relocated_objs =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_moved_objs =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int total_invalidated_objs =3D 0;<b=
r>
&gt; @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm=
 *vm, struct seq_file *m)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0total_idle_objs =3D id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D 0;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0seq_puts(m, &quot;\tDirty BOs:\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp, &amp;vm-&gt;=
dirty, base.vm_status) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bo_va-&gt;<a hre=
f=3D"http://base.bo" rel=3D"noreferrer" target=3D"_blank">base.bo</a>)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_dirty +=3D amdg=
pu_bo_print_info(id++, bo_va-&gt;<a href=3D"http://base.bo" rel=3D"noreferr=
er" target=3D"_blank">base.bo</a>, m);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0total_dirty_objs =3D id;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0id =3D 0;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_puts(m, &quot;\tRelocated BOs:\n&quot;);=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry_safe(bo_va, tmp, &amp;vm=
-&gt;relocated, base.vm_status) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bo_va-&gt;<=
a href=3D"http://base.bo" rel=3D"noreferrer" target=3D"_blank">base.bo</a>)=
<br>
&gt; @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm =
*vm, struct seq_file *m)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal idle size:=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 %12lld\tobjs:\t%d\n&quot;, total_idle,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 total_id=
le_objs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal dirty size:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0%12lld\tobjs:\t%d\n&quot;, total_dirty,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 total_dirty_o=
bjs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal relocated size:=
=C2=A0 =C2=A0%12lld\tobjs:\t%d\n&quot;, total_relocated,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 total_re=
located_objs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0seq_printf(m, &quot;\tTotal moved size:=C2=
=A0 =C2=A0 =C2=A0 =C2=A0%12lld\tobjs:\t%d\n&quot;, total_moved,<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm.h<br>
&gt; index d9ab97eabda9..f91d4fcf80b8 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; @@ -276,6 +276,9 @@ struct amdgpu_vm {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* per VM BOs moved, but not yet updated in =
the PT */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
moved;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* normal and per VM BOs that are not moved, but =
have new PT entries */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=A0 dirty=
;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* All BOs of this VM not currently in the s=
tate machine */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
idle;<br>
&gt;=C2=A0 =C2=A0<br>
<br>
</blockquote></div></div>

--0000000000009fe70d0609039289--
