Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3FB42A24
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242F510E1FD;
	Wed,  3 Sep 2025 19:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JA78r5jj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE35510E1FD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 19:46:54 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-71d603b62adso3237137b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 12:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756928813; x=1757533613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5od74mLFZlQQf0hFrtRdWyouIXaQ5M3HxcPQ0ujElI=;
 b=JA78r5jjGYDNwI272t3Ai7fyh8GyEpWWYUBR7WoFMXZqoiPczeMwTqM9X/z5Q5q3vb
 aVQw7c98lxR6UmX7r1z4sWIB2HEqw/TmzZq7+wPqB5ikYHQvvp4qud8qUdrkxaMmfK8p
 ktUm0kcBiJThAy0IOa6wnOHcanDZ7KcQvy37MAz1A30VsVIzCWt1gs3gnd/zybMPRwwz
 Z0Vw2v9rAYRgMLqJITU26V/jaX0Rb1vaJiCbKIc8lzNx18qhkXyaJTe/dK6CljdlwkH+
 y8Zcf9yyeK5J+48NUFCD7DlaotdrsZlrpFU4i0JR+JVDRcNWzwWzOgFsy7fmlfaCGnCM
 9NDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756928813; x=1757533613;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5od74mLFZlQQf0hFrtRdWyouIXaQ5M3HxcPQ0ujElI=;
 b=UTEkNmWVgYXp+DR3TGzxC5gtjsohrFFU9xlRLTb/qd4WNYfi96diF6Z4eOo1UPsTDI
 7i3RKZyoyYWRVUhYnV8JMO0BIQaINHQ1JpJMPkwTlQOzt9cG5dvnc8ScXnf/UYclkyCg
 Fkbt3LsRlgUOVDOQS2ac/S1NjfGFC+u/luo63fNuhnMXKAmiFr4Pt8aZ4oT3QGRdWoWq
 03k52Dl74jsaA8QdrHatQeZ/y9U9TeDJM8LdZxm8ygF1TpUyn7C1Iyo+y0wtXczu7NhF
 jUXducU7+Iz+/rk10IWvfQz+nshVdb0QlDORo9PKKOxXP7OKtabzIPr+e/2VEyGwxVCV
 fAqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3WhoSxcguyTX2zK0Ex79Rl0ChMTpzZ8jHuKZ5UonvHnGW/mCcTCh/yXlyWGTtmxc+l6JNFNzlSTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvDwGRYPN1MsaTpsq1cEnkcub0w+rMFh/yzIXT6vqForHJFfQD
 v7tpLO02GAluc5w4JB3eBlGbdadNzXhJHqepEY7xAFSy7I2x1fEvGaK4X7GJbK1awqI52i00sTt
 2pf3OnHJx3S9Xh4SL6F+ukLOlN0y5/x8=
X-Gm-Gg: ASbGnctG3+rr2D+pRIFb6FVu0+mWtn6kYBj//O4cOb5QlL5yC0xBnfhb2abjh14fbt7
 LnwDKdGjfNGB7A3RNDHijz6iaoWDayuI6glA4SF1fmzKjs72MC2I6tMEM4L5TXtfbsBiFy2d4ln
 mEy/15RZ7lHj5hqdw6NCYq5leyNUUSdZJp9iD53Nt72B8zIvjZgLnnkLiKvQ+La1edp3QNJBSQ/
 ImUi98uMG7Ww7KYjMBmToV8p+19oD2LSI5bAdNw8AkWcJPzw+EfbcsCQJErOQP1p6qLxgrvk6GF
 8W9LwcQ=
X-Google-Smtp-Source: AGHT+IHW/zzUlUw7jVKGPf5C0aeJ3GH+vA7Bnv7W8RJK4G9Zh/iWqclj0Mq4xg+/rSEnU15kMtnjVt9kU4oXenhl2pI=
X-Received: by 2002:a05:690c:6089:b0:71e:7d37:9ab6 with SMTP id
 00721157ae682-7227635ccafmr177468437b3.5.1756928813410; Wed, 03 Sep 2025
 12:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250828200116.3532255-1-olvaffe@gmail.com>
 <20250903184642.62183125@fedora>
In-Reply-To: <20250903184642.62183125@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 3 Sep 2025 12:46:42 -0700
X-Gm-Features: Ac12FXyAGfht-Rm7pLSHobH_nH7S-PexPoJxgWfFenJTwLUYifftYfrNrqSozIM
Message-ID: <CAPaKu7ROxE-7bSp3q1Nf0rz-gVUGL7v-QPXWEhB4EQhjqvP1WQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: check bo offset alignment in vm bind
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Wed, Sep 3, 2025 at 9:46=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 28 Aug 2025 13:01:16 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > Fail early from panthor_vm_bind_prepare_op_ctx instead of late from
> > ops->map_pages.
> >
> > Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pa=
nthor/panthor_mmu.c
> > index bad720f23eb70..6dec4354e3789 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1222,7 +1222,7 @@ static int panthor_vm_prepare_map_op_ctx(struct p=
anthor_vm_op_ctx *op_ctx,
> >           (flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) !=3D DRM_PANTHOR_V=
M_BIND_OP_TYPE_MAP)
> >               return -EINVAL;
> >
> > -     /* Make sure the VA and size are aligned and in-bounds. */
> > +     /* Make sure the VA and size are in-bounds. */
> >       if (size > bo->base.base.size || offset > bo->base.base.size - si=
ze)
> >               return -EINVAL;
> >
> > @@ -2447,7 +2447,7 @@ panthor_vm_bind_prepare_op_ctx(struct drm_file *f=
ile,
> >       int ret;
> >
> >       /* Aligned on page size. */
> > -     if (!IS_ALIGNED(op->va | op->size, vm_pgsz))
> > +     if (!IS_ALIGNED(op->va | op->size | op->bo_offset, vm_pgsz))
> >               return -EINVAL;
>
> Now that I look at this, I think we'd be better moving this alignment
> check to panthor_vm_prepare_[un]map_op_ctx() to cover the in-kernel
> users.
Yeah, it would be nice for this to validate for both, but it looks
like the patch has been pushed.

panthor_vm_alloc_va already validates for kernel space so the
suggested change is not urgent. Besides, I feel there might be other
missing validations. Perhaps we can wait for igt tests[1], expand
them, and improve our validation story more systematically.

[1] https://lists.freedesktop.org/archives/dri-devel/2025-August/521887.htm=
l


>
> >
> >       switch (op->flags & DRM_PANTHOR_VM_BIND_OP_TYPE_MASK) {
>
