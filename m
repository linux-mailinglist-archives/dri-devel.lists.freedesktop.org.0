Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 411957DCF57
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6C610E0CA;
	Tue, 31 Oct 2023 14:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF21B10E503;
 Tue, 31 Oct 2023 14:39:40 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6bf20d466cdso1257277b3a.1; 
 Tue, 31 Oct 2023 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698763180; x=1699367980; darn=lists.freedesktop.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eRtvqgxIrnJg2426DcZbBOGQBfG5F+DAUM5fzzx9UGU=;
 b=GRvCSJZHKzXmCNenqjfPGXKWxv0oiYEcodE1NCHrZF6tCpvcgmrH5XnXyx58dHW8zo
 iUWsfujpWG6MMYBLLbxZ9ogqBBWYikdbgw9JL3glWg5GA1Y7fvhWFn57YsSXzW5+QVie
 R+gyZCtwtpCer8xLCBHMv/L/Vu8PFsrbphyzqZcUDMet9Cvkgzybzv3L6CAV8p8Hggxc
 8aOrp4ZAIZD/d1H5rkCa8ZwojpLv4fN16UZEswgWNgvBo3IwMZJ+35DzNgtppOiHgMVs
 GVAXoCF2KLr8fkpYnlXdYC/PIIxXdJ54ragmC0Ecpa/sByI+A2Ky9W/DhqWbLHMPjC6B
 GFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698763180; x=1699367980;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eRtvqgxIrnJg2426DcZbBOGQBfG5F+DAUM5fzzx9UGU=;
 b=d3sB8p7Cwu6x448TXRrmnlQ+uidrMqaCNv7A6HiTmXZX6EnW3xCc54Q4QH11y7MeGs
 a37crJGZpMBiS6p82Hric9FCrRUqJgbk5KC13JZELdtWEljoWBO0Mu52wblXZbrP7fTK
 R63vrcv2weJ3suz8UpVtvzQcX15LijXn4+sn8cjijrsj95KGyUYH86yNXH3V8CT7VA+F
 2WfU3Rkm34NanZQqkQoZhvE4+XLttBWJa+/9PC0KQUKB5wbt8p5p07M1yjmLghyquGiP
 OGg1Fy7DTgg4A8UDnJcqJcEBsYP5G/AjBMB+rH/5e87vYaU2498fivyaLlzCk3Jeu5W8
 ZXNA==
X-Gm-Message-State: AOJu0YyIhErYzx/mu6MYd3wk5WAzakFg234Njx7pAIr8ziVoN5aHxCWM
 9kkt3yZeT0/E1/cA8nm4aqbJh/Ph4sqVriOm
X-Google-Smtp-Source: AGHT+IHw2fIskh82s4bAX0RHffZ3cgOPRFAF4PHETeD2wRfeAGPDUai+qClSxJRa2Moq59+TAscvCw==
X-Received: by 2002:a05:6a20:4281:b0:163:d382:ba99 with SMTP id
 o1-20020a056a20428100b00163d382ba99mr17955070pzj.5.1698763180112; 
 Tue, 31 Oct 2023 07:39:40 -0700 (PDT)
Received: from smtpclient.apple (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 w15-20020a170902e88f00b001cc20dd8825sm1398165plg.213.2023.10.31.07.39.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Oct 2023 07:39:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
In-Reply-To: <CAP+8YyEbi=mz5WiPjZynMT5ePAXEOydxZKfm-9KT1Y_cmVPujw@mail.gmail.com>
Date: Tue, 31 Oct 2023 23:39:27 +0900
Content-Transfer-Encoding: quoted-printable
Message-Id: <20671C3F-A8C6-4731-9685-1A4609B3EF8C@gmail.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
 <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
 <CAP+8YyFEKDGPCvA-puUBHNXcrEX4rXOJz=WkBpJyJrmqZ=rtMA@mail.gmail.com>
 <ffafa427-e755-4f86-8aab-8e69ef63325a@amd.com>
 <CAP+8YyEbi=mz5WiPjZynMT5ePAXEOydxZKfm-9KT1Y_cmVPujw@mail.gmail.com>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: amd-gfx@lists.freedesktop.org,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Oct 31, 2023, at 23:17, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl> =
wrote:
>=20
>=20
>=20
> On Tue, Oct 31, 2023 at 3:08=E2=80=AFPM Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
> Am 31.10.23 um 14:59 schrieb Bas Nieuwenhuizen:
>>=20
>>=20
>> On Tue, Oct 31, 2023 at 2:57=E2=80=AFPM Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>> Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
>> > The current amdgpu_gem_va_update_vm only tries to perform updates =
for the
>> > BO specified in the GEM ioctl; however, when a binding is split, =
the
>> > adjacent bindings also need to be updated. Such updates currently =
ends up
>> > getting deferred until next submission which causes stalls.
>>=20
>> Yeah, that is a necessity. The hardware simply doesn't support what =
you=20
>> try to do here in all cases.
>>=20
>> What can the hardware not do here? Is this just needing to wait for =
TLB flushes before we can free pagetables, can we just delay that?
>=20
> On some hardware generations (especially Navi1x, but also everything =
older than Polaris) you can't invalidate the TLB while it is in use.
>=20
> For Polaris and older it just means that you don't have a guarantee =
that the shader can't access the memory any more. So delaying the free =
operation helps here.
>=20
> But for Navi1x it's a workaround for a hardware bug. If you try to =
invalidate the TLB while it is in use you can potentially triggering =
memory accesses to random addresses.
>=20
> That's why we still delay TLB invalidation's to the next CS and use a =
new VMID for each submission instead of invalidating the old one.
>=20
> I'm currently working on changing that for Navi2x and newer (maybe =
Vega as well), but this is something you can really only do on some hw =
generations after validating that it works.
>=20
> I think as long as we make sure all significant work gets done =
asynchronously, doing the TLB flushing on the next submit (/submissions, =
one per queue?) is fine for our purposes.

For a bit more of context, the performance / frame timing in Forza with =
just patch 5 wasn=E2=80=99t quite right. As Bas said, ideally we want to =
perform all the PT updates right away, and only defer the TLB flush.

For now the state machine part of this patch doesn=E2=80=99t seem to be =
going in the right direction so I=E2=80=99ll consider dropping this =
change.

Tatsuyuki.

>=20
> (As an aside after thinking some more I *think* we also need some work =
to make these maps/unmaps (VALID->PRT and PRT->VALID) atomic, as I think =
it is valid Vulkan to make these race. As such I'm speculating we'd need =
a bit more reworking there too, not just a late free of the lower level =
pagetables)
>=20
> - Bas=20
>=20
> Regards,
> Christian.=20
>=20
>> =20
>>=20
>> So this approach won't work in general.
>>=20
>> Regards,
>> Christian.
>>=20
>> >
>> > Introduce a new state "dirty", shared between per-VM BOs and =
traditional
>> > BOs, containing all BOs that have pending updates in `invalids`.
>> > amdgpu_gem_va_update_vm will now simply flush any pending updates =
for BOs
>> > in the dirty state.
>> >
>> > Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>> > ---
>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66 =
++++++++++++++++++-------
>> >   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
>> >   3 files changed, 63 insertions(+), 24 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > index a1b15d0d6c48..01d3a97248b0 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> > @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct =
drm_device *dev, void *data,
>> >    * vital here, so they are not reported back to userspace.
>> >    */
>> >   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>> > -                                 struct amdgpu_vm *vm,
>> > -                                 struct amdgpu_bo_va *bo_va,
>> > -                                 uint32_t operation)
>> > +                                 struct amdgpu_vm *vm)
>> >   {
>> > +     struct amdgpu_bo_va *bo_va;
>> >       int r;
>> >  =20
>> >       if (!amdgpu_vm_ready(vm))
>> > @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct =
amdgpu_device *adev,
>> >       if (r)
>> >               goto error;
>> >  =20
>> > -     if (operation =3D=3D AMDGPU_VA_OP_MAP ||
>> > -         operation =3D=3D AMDGPU_VA_OP_REPLACE) {
>> > +     spin_lock(&vm->status_lock);
>> > +     while (!list_empty(&vm->dirty)) {
>> > +             bo_va =3D list_first_entry(&vm->dirty, struct =
amdgpu_bo_va,
>> > +                                      base.vm_status);
>> > +             spin_unlock(&vm->status_lock);
>> > +
>> >               r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>> >               if (r)
>> >                       goto error;
>> > +             spin_lock(&vm->status_lock);
>> >       }
>> > +     spin_unlock(&vm->status_lock);
>> >  =20
>> >       r =3D amdgpu_vm_update_pdes(adev, vm, false);
>> >  =20
>> > @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, =
void *data,
>> >               break;
>> >       }
>> >       if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && =
!amdgpu_vm_debug)
>> > -             amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
>> > -                                     args->operation);
>> > +             amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>> >  =20
>> >   error:
>> >       drm_exec_fini(&exec);
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> > index dd6f72e2a1d6..01d31891cd05 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> > @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct =
amdgpu_vm_bo_base *vm_bo, bool evict
>> >       spin_unlock(&vm_bo->vm->status_lock);
>> >   }
>> >  =20
>> > +/**
>> > + * amdgpu_vm_bo_dirty - vm_bo is dirty
>> > + *
>> > + * @vm_bo: vm_bo which is dirty
>> > + *
>> > + * State for normal and per VM BOs that are not moved, but have =
new entries in
>> > + * bo_va->invalids.
>> > + */
>> > +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
>> > +{
>> > +     spin_lock(&vm_bo->vm->status_lock);
>> > +     list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
>> > +     spin_unlock(&vm_bo->vm->status_lock);
>> > +}
>> > +
>> >   /**
>> >    * amdgpu_vm_bo_moved - vm_bo is moved
>> >    *
>> > @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm =
*vm,
>> >       list_for_each_entry_safe(bo_va, tmp, &vm->evicted, =
base.eviction_status)
>> >               amdgpu_vm_bo_get_memory(bo_va, stats);
>> >  =20
>> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, =
base.vm_status)
>> > +             amdgpu_vm_bo_get_memory(bo_va, stats);
>> > +
>> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated, =
base.vm_status)
>> >               amdgpu_vm_bo_get_memory(bo_va, stats);
>> >  =20
>> > @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct =
amdgpu_device *adev,
>> >                       dma_resv_unlock(resv);
>> >               spin_lock(&vm->status_lock);
>> >       }
>> > +
>> > +     while (!list_empty(&vm->dirty)) {
>> > +             bo_va =3D list_first_entry(&vm->dirty, struct =
amdgpu_bo_va,
>> > +                                      base.vm_status);
>> > +             spin_unlock(&vm->status_lock);
>> > +
>> > +             r =3D amdgpu_vm_bo_update(adev, bo_va, false);
>> > +             if (r)
>> > +                     return r;
>> > +             spin_lock(&vm->status_lock);
>> > +     }
>> >       spin_unlock(&vm->status_lock);
>> >  =20
>> >       return 0;
>> > @@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct =
amdgpu_device *adev,
>> >                                   struct amdgpu_bo_va_mapping =
*mapping)
>> >   {
>> >       struct amdgpu_vm *vm =3D bo_va->base.vm;
>> > -     struct amdgpu_bo *bo =3D bo_va->base.bo;
>> >  =20
>> >       mapping->bo_va =3D bo_va;
>> >       list_add(&mapping->list, &bo_va->invalids);
>> >       amdgpu_vm_it_insert(mapping, &vm->va);
>> > +     if (!bo_va->base.moved)
>> > +             amdgpu_vm_bo_dirty(&bo_va->base);
>> >  =20
>> >       if (mapping->flags & AMDGPU_PTE_PRT)
>> >               amdgpu_vm_prt_get(adev);
>> >  =20
>> > -     if (bo && bo->tbo.base.resv =3D=3D vm->root.bo->tbo.base.resv =
&&
>> > -         !bo_va->base.moved) {
>> > -             amdgpu_vm_bo_moved(&bo_va->base);
>> > -     }
>> >       trace_amdgpu_vm_bo_map(bo_va, mapping);
>> >   }
>> >  =20
>> > @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>> >                       before->flags =3D tmp->flags;
>> >                       before->bo_va =3D tmp->bo_va;
>> >                       list_add(&before->list, =
&tmp->bo_va->invalids);
>> > +                     if (!tmp->bo_va->base.moved)
>> > +                             =
amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>> >               }
>> >  =20
>> >               /* Remember mapping split at the end */
>> > @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>> >                       after->flags =3D tmp->flags;
>> >                       after->bo_va =3D tmp->bo_va;
>> >                       list_add(&after->list, =
&tmp->bo_va->invalids);
>> > +                     if (!tmp->bo_va->base.moved)
>> > +                             =
amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>> >               }
>> >  =20
>> >               list_del(&tmp->list);
>> > @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>> >  =20
>> >       /* Insert partial mapping before the range */
>> >       if (!list_empty(&before->list)) {
>> > -             struct amdgpu_bo *bo =3D before->bo_va->base.bo;
>> > -
>> >               amdgpu_vm_it_insert(before, &vm->va);
>> >               if (before->flags & AMDGPU_PTE_PRT)
>> >                       amdgpu_vm_prt_get(adev);
>> > -
>> > -             if (bo && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv &&
>> > -                 !before->bo_va->base.moved)
>> > -                     amdgpu_vm_bo_moved(&before->bo_va->base);
>> >       } else {
>> >               kfree(before);
>> >       }
>> >  =20
>> >       /* Insert partial mapping after the range */
>> >       if (!list_empty(&after->list)) {
>> > -             struct amdgpu_bo *bo =3D after->bo_va->base.bo;
>> > -
>> >               amdgpu_vm_it_insert(after, &vm->va);
>> >               if (after->flags & AMDGPU_PTE_PRT)
>> >                       amdgpu_vm_prt_get(adev);
>> > -
>> > -             if (bo && bo->tbo.base.resv =3D=3D =
vm->root.bo->tbo.base.resv &&
>> > -                 !after->bo_va->base.moved)
>> > -                     amdgpu_vm_bo_moved(&after->bo_va->base);
>> >       } else {
>> >               kfree(after);
>> >       }
>> > @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device =
*adev, struct amdgpu_vm *vm, int32_t xcp
>> >       INIT_LIST_HEAD(&vm->evicted);
>> >       INIT_LIST_HEAD(&vm->relocated);
>> >       INIT_LIST_HEAD(&vm->moved);
>> > +     INIT_LIST_HEAD(&vm->dirty);
>> >       INIT_LIST_HEAD(&vm->idle);
>> >       INIT_LIST_HEAD(&vm->invalidated);
>> >       spin_lock_init(&vm->status_lock);
>> > @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>> >   {
>> >       struct amdgpu_bo_va *bo_va, *tmp;
>> >       u64 total_idle =3D 0;
>> > +     u64 total_dirty =3D 0;
>> >       u64 total_relocated =3D 0;
>> >       u64 total_moved =3D 0;
>> >       u64 total_invalidated =3D 0;
>> >       u64 total_done =3D 0;
>> >       unsigned int total_idle_objs =3D 0;
>> > +     unsigned int total_dirty_objs =3D 0;
>> >       unsigned int total_relocated_objs =3D 0;
>> >       unsigned int total_moved_objs =3D 0;
>> >       unsigned int total_invalidated_objs =3D 0;
>> > @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>> >       total_idle_objs =3D id;
>> >       id =3D 0;
>> >  =20
>> > +     seq_puts(m, "\tDirty BOs:\n");
>> > +     list_for_each_entry_safe(bo_va, tmp, &vm->dirty, =
base.vm_status) {
>> > +             if (!bo_va->base.bo)
>> > +                     continue;
>> > +             total_dirty +=3D amdgpu_bo_print_info(id++, =
bo_va->base.bo, m);
>> > +     }
>> > +     total_dirty_objs =3D id;
>> > +     id =3D 0;
>> > +
>> >       seq_puts(m, "\tRelocated BOs:\n");
>> >       list_for_each_entry_safe(bo_va, tmp, &vm->relocated, =
base.vm_status) {
>> >               if (!bo_va->base.bo)
>> > @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct =
amdgpu_vm *vm, struct seq_file *m)
>> >  =20
>> >       seq_printf(m, "\tTotal idle size:        =
%12lld\tobjs:\t%d\n", total_idle,
>> >                  total_idle_objs);
>> > +     seq_printf(m, "\tTotal dirty size:       =
%12lld\tobjs:\t%d\n", total_dirty,
>> > +                total_dirty_objs);
>> >       seq_printf(m, "\tTotal relocated size:   =
%12lld\tobjs:\t%d\n", total_relocated,
>> >                  total_relocated_objs);
>> >       seq_printf(m, "\tTotal moved size:       =
%12lld\tobjs:\t%d\n", total_moved,
>> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> > index d9ab97eabda9..f91d4fcf80b8 100644
>> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> > @@ -276,6 +276,9 @@ struct amdgpu_vm {
>> >       /* per VM BOs moved, but not yet updated in the PT */
>> >       struct list_head        moved;
>> >  =20
>> > +     /* normal and per VM BOs that are not moved, but have new PT =
entries */
>> > +     struct list_head        dirty;
>> > +
>> >       /* All BOs of this VM not currently in the state machine */
>> >       struct list_head        idle;
>> >  =20


