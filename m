Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9BBB04EB
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 14:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F71E10E6ED;
	Wed,  1 Oct 2025 12:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LoDcNPJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF79310E066
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 12:22:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3ee12a63af1so4702829f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759321339; x=1759926139;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4k2YPnYpTeocGDnPW4kRnjX7clgQT+hRQcscQ/Gjw0I=;
 b=LoDcNPJYvN7ruNSd953I/Z7UMqi6DeiP4Cf4zgDzf5cqakksHN4BU2S32I3aefqQC0
 j64qhvdzFtBchZ903NiXBEfpJNHgyPT7uf5vWEAX8gwmi2Li6YhM0eF2wzLfc121lOKb
 8wPoAhA8S0pc9QjkMLflKdnEwLzQEyghZb8iE0cpLzFqEDponynvc4mhjmGBrakTyHAg
 y65qgVvEGG1Bd6bida1/tgglxVKZixK7mcRvHfE77l9ln1FJK3/HTVTzkOcia7xFKip2
 27k3c21avw9Z9w/i90fYqzCIlaiDAzWHpOUB0jWafzBaUKUvGE3a9NyXk+oALNPcBQ3Y
 ViQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759321339; x=1759926139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4k2YPnYpTeocGDnPW4kRnjX7clgQT+hRQcscQ/Gjw0I=;
 b=nkJS+whKN/lieRD9qjM3XosrDUqDO0Ljcd5YA8SE3710O/bnivBPzV0QIEEcqB6Ews
 6qUlAYU7IFk27jKzT9UiSq/t4vbpWZunHgGqjwOvfnp/tATLkwtjYJ8GqOCcoBWGLkp3
 3HKU8GgAnBFcLAdyO2xNgrMfn0iWUHmBCktakwV6Iyj/4OrVzafJbxNXB3zssXTCfjCU
 OpQO0ibHjJvzt2FEzG+LXHJfqjvuZ2tp/QhkPP4LAKqfR05BDYay+SGnOYbA5zA1IWNE
 dnZRF54rAwwbqNhm3tUDD801Dxn2F6Dvd4kFF7LON/z5+LlYaThAM1ZTD5aziOZI/f+4
 zg3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3crwLseaPbJzj7S5OIOnJvWikTVVW06mByRYnNrf2K+uSTNdsd/XxPX+LE32wi3aJWKBOYvWsAkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxnpeo7HJiej+I+Zvtvs+acvei1rLir9CC6hfiX7xV1lHkBqdkv
 LvQpT9eRpziIG6lkRzXS9mYZa2DUA3+XK/zkrwkAV3GF+ok94xNB9W0gZtEvZ2yd+xgIuW9RXsg
 bKRil7vlsfH9NtzVEKgIN8L1i3lq4bq6JDpYNtyk3
X-Gm-Gg: ASbGncurHv8NaM4Oq39NvzdBoBWUXPh1aXFFePJ5RO+M9mSo7PO6nt/JoH/EAwajmFR
 nhMipWPQebWC4uG15kVU3djgaJChlGY4ZctJJ+/LyNdlgr0GFrFWCZ9ZIEbIm+shOg/ILv7LpGD
 sa1FO2VzAHzW3rkFO/MakTYHHhkAZtGU1Dhm/Z9hWG0k94Vd3I0BRfFVbhLgnNy7m4ojD9nWoo6
 f94FIyLHG48A/DdSiG6jhJMaabbAgXhmkxyEX461ZyA5Qf2fOtta+GtVFcrLRKzb1vWi/oByshD
 SsU=
X-Google-Smtp-Source: AGHT+IG3VCIk2R7VMbnmr1LhtSsLbPQ7zDpOcSwc4OpQG4SjIFUGOQm+gSNB3kJAFjanSa5xTlLcIMLhvGepghxbaXI=
X-Received: by 2002:a05:6000:4312:b0:3ee:1118:df81 with SMTP id
 ffacd0b85a97d-425577ee8b5mr2278669f8f.13.1759321338841; Wed, 01 Oct 2025
 05:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <20251001132739.41575fa5@fedora>
 <CAH5fLghp+4dx6-JAfbSWDLz7WOdwtnLeuxdGhmVPax+HKbTv3w@mail.gmail.com>
 <20251001140418.57fb21f1@fedora> <20251001141310.0817a6c7@fedora>
In-Reply-To: <20251001141310.0817a6c7@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 14:22:06 +0200
X-Gm-Features: AS18NWA7BS6q7-t3jyQcR-z-MICVMgzBJOLG-P-oeqz_y5Sd-FpSBw2OYVPI4bc
Message-ID: <CAH5fLghu01gTnLe1Z0Z-7354QF_YMRfe5w2VG7NKTwkj+eESkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Wed, Oct 1, 2025 at 2:13=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 1 Oct 2025 14:04:18 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>
> > On Wed, 1 Oct 2025 13:45:36 +0200
> > Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > > On Wed, Oct 1, 2025 at 1:27=E2=80=AFPM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:
> > > >
> > > > On Wed, 01 Oct 2025 10:41:36 +0000
> > > > Alice Ryhl <aliceryhl@google.com> wrote:
> > > >
> > > > > When using GPUVM in immediate mode, it is necessary to call
> > > > > drm_gpuvm_unlink() from the fence signalling critical path. Howev=
er,
> > > > > unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> > > > >
> > > > > 1. drm_gpuvm_bo_put() often requires you to take resv locks, whic=
h you
> > > > >    can't do from the fence signalling critical path.
> > > > > 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often =
going
> > > > >    to be unsafe to call from the fence signalling critical path.
> > > > >
> > > > > To solve these issues, add a deferred version of drm_gpuvm_unlink=
() that
> > > > > adds the vm_bo to a deferred cleanup list, and then clean it up l=
ater.
> > > > >
> > > > > The new methods take the GEMs GPUVA lock internally rather than l=
etting
> > > > > the caller do it because it also needs to perform an operation af=
ter
> > > > > releasing the mutex again. This is to prevent freeing the GEM whi=
le
> > > > > holding the mutex (more info as comments in the patch). This mean=
s that
> > > > > the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> > > > >
> > > > > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > >
> > > > > +/*
> > > > > + * Must be called with GEM mutex held. After releasing GEM mutex=
,
> > > > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > > > + */
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > > > +{
> > > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct dr=
m_gpuvm_bo,
> > > > > +                                               kref);
> > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +
> > > > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > > > +     }
> > > > > +
> > > > > +     list_del(&vm_bo->list.entry.gem);
> > > > > +}
> > > > > +
> > > > > +/*
> > > > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_f=
ree_locked().
> > > > > + */
> > > > > +static void
> > > > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > > > +{
> > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > +
> > > > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > >
> > > > Could we simply move this line to drm_gpuvm_bo_defer_free_locked()?
> > > > I might be missing something, but I don't really see a reason to
> > > > have it exposed as a separate operation.
> > >
> > > No, if drm_gpuvm_bo_deferred_cleanup() is called in parallel (e.g.
> > > from a workqueue as we discussed), then this can lead to kfreeing the
> > > GEM while we hold the mutex. We must not add the vm_bo until it's saf=
e
> > > to kfree the GEM. See the comment on
> > > drm_gpuvm_bo_defer_free_unlocked() below.
> >
> > Uh, right, I forgot that the lock was embedded in the BO, which we're
> > releasing a ref on in the cleanup path.
>
> Would be good to document the race in the comment saying that
> gpuva.lock shouldn't be held though.

I can move the comment in drm_gpuvm_bo_defer_free() to the function comment=
.

Alice
