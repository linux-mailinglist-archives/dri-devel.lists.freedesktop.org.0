Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3EBB0C17
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6110E717;
	Wed,  1 Oct 2025 14:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gwIrSxpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0312910E717
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:42:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso64561755e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759329768; x=1759934568;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ih1xYhPTI2Pg6at0k0iyDd7I8Muei6z7nZ9FDydSlKQ=;
 b=gwIrSxpXVgxR7MvLY6m1+V/AG+9gj/ZsUZfsXdaw2q/SZUvWMhScFfYQ2+Y27AIGwO
 DXcnJN2EM3yyxVFCgbxCXMoKXM4j68bbad4+cGkZL1veItJ7hVB7jiB762wbZnF4cuaS
 nB1w9AaKMvEGA/odk+R3ZA+gn09d07HKsPHy4/HcEGo4xf997JWc1jP0R/p0Wp5EGvM2
 lcKmqi1pM6UCCYrnDZ2Vg7mw/amw6d4GPuBCN9Z3RR5gVTdrA2yZopYM8Fmn5zlVHmvt
 IRBvuQHyMTHBI0P6g/8X83rIbNwOCXTdF0KT0+aqQ6OpcUense/OE+8wttXd9xDESBAT
 6PEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759329768; x=1759934568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ih1xYhPTI2Pg6at0k0iyDd7I8Muei6z7nZ9FDydSlKQ=;
 b=sSq0ZYDonYjrrr2iWCCLuOD9Bpmsvq4DEaya3SIeBBXPA6r7Yv/Mxtk7QPyIMvzkhG
 yOlRzhVgPhmyxnt/f8HbR4OiNYKyEDHWE6XlZWkoCXDnIb08C37De/cK8E8wYJ37k+WY
 t6PvCpV9kEmBziF0/oeqzS8QrJ3AIrGA8g+77/DHPtDb5DvHtU3bxGJsY83r8pZhvDqT
 HKhdVpUjEDXGXkbj+Xz/kRbosVm9tT4tD8OGuOtLqcscnLj5IuFL44CC1VLTd9MxTv7Y
 Ne8HcyWDUfwSt7k9Z5/YuGOofQEbmVUymfto6sYMr096+clHt8ZdyTGRD22heAjCzOfK
 CEEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiiEL8NQjooey+7UsCYEk6Gu7zv3+tYtn6LKg7xAm/DtIhcXPe4T5GDV29DxazGESh0g1Of7vUnws=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqU2r11iN2OBcm3GVbJWkAgCdqitUCL/NB7Zhy4DKj3hrHODS6
 0peoLUrVPyzMGrtRp5OSwcit58zsIeD3V+CaJdlvnV/xrsMHBs5elD90a0f8hUkHh+xS8EChzYt
 L5JAMLcyOskLWofbPAbgQI56AkCQguOQOo82earQ/
X-Gm-Gg: ASbGncvPgUIxf+3pvYgMtdl8nsEp9+v2CssXHoQJb2zZw+wQEHhaXZqXo0JDHSmtccn
 rNptSHzrfTciI41FieBp8gv5utyNFawXvAdMf6BxqG0iuJRUi3JVtAlrFJrBl60YWn8Kir7E1Gb
 XcrNJ0Og4IjJX3fi7vNPFAZadxeby/XPCaFTlfbBbWcqo03yLzipKocitrNUGBZPPFCaMRncPwQ
 SNyKZ/3v/khtGKGaG+1jt+v/CuVPAFK3ArIeoTTaqruoWq8e0s3n4/B0p52732CAXgb
X-Google-Smtp-Source: AGHT+IFUatLRxEXoWcw45KNVyfTjY6RcLlKmngKD+BI81xp+UKlY7uKof8qt5rhJEU/RR1lFFD2b41VrMEa9vHmBj9o=
X-Received: by 2002:a05:600c:8b47:b0:45b:6b57:5308 with SMTP id
 5b1f17b1804b1-46e6126a7d4mr31044865e9.7.1759329768313; Wed, 01 Oct 2025
 07:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
In-Reply-To: <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Oct 2025 16:42:35 +0200
X-Gm-Features: AS18NWCjBqGngM1fu15A6vZD0jZY9gu397gehPk2hk9lVzatXAXUNzz0NaO8hPs
Message-ID: <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org
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

On Wed, Oct 1, 2025 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote:
> > +/*
> > + * Must be called with GEM mutex held. After releasing GEM mutex,
> > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > + */
> > +static void
> > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > +{
> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuv=
m_bo,
> > +                                               kref);
> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > +
> > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > +     }
> > +
> > +     list_del(&vm_bo->list.entry.gem);
> > +}
> > +
> > +/*
> > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_free_lo=
cked().
> > + */
> > +static void
> > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > +{
> > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > +
> > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > +}
> > +
> > +static void
> > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > +{
> > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuv=
m_bo,
> > +                                               kref);
> > +
> > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > +     drm_gpuvm_bo_defer_free_locked(kref);
> > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > +
> > +     /*
> > +      * It's important that the GEM stays alive for the duration in wh=
ich we
> > +      * hold the mutex, but the instant we add the vm_bo to bo_defer,
> > +      * another thread might call drm_gpuvm_bo_deferred_cleanup() and =
put
> > +      * the GEM. Therefore, to avoid kfreeing a mutex we are holding, =
we add
> > +      * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> > +      */
> > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > +}
>
> So, you're splitting drm_gpuvm_bo_defer_free() into two functions, one do=
ing the
> work that is required to be called with the gpuva lock held and one that =
does
> the work that does not require a lock, which makes perfect sense.
>
> However, the naming chosen for the two functions, i.e.
> drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_locked() i=
s
> confusing:
>
> What you mean semantically mean is "do part 1 with lock held" and "do par=
t 2
> without lock held", but the the chosen names suggest that both functions =
are
> identical, with the only difference that one takes the lock internally an=
d the
> other one requires the caller to take the lock.
>
> It's probably better to name them after what they do and not what they're=
 part
> of. If you prefer the latter, that's fine with me too, but please choose =
a name
> that makes this circumstance obvious.

Fair point. Do you have naming suggestions? Otherwise I can name them
drm_gpuvm_bo_defer_free_part1() and drm_gpuvm_bo_defer_free_part2().
:)

Alice
