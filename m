Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB757419F08
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA18B6E02D;
	Mon, 27 Sep 2021 19:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2274F6E02D;
 Mon, 27 Sep 2021 19:20:24 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 a17-20020a4a6851000000b002b59bfbf669so2332904oof.9; 
 Mon, 27 Sep 2021 12:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DxxDnArAuqMzLOKrnNqBxORaTd+7/JcrK9bDcFPx9BQ=;
 b=E9fwq5bTre/IrnXwZ/2oEJhk10H+KaHc08PWNXgjOdhLuUJdU3V/PDBPGGcH4aB6EG
 vbqUjNv9ClfzM9n9n8OdWHiQaBYKlO6riTNMumO2z35RshxodLeNmh7FEphBSza23fvF
 /RW6yO5Y0JV916oTome5iBE3PMnJ8aCKZ1Y4XPDKv5YQH18GO90n97xXLlEQrSgNK6Pi
 /P2EQmG63tM/8mFlDUzWK5I3KY9XTT6C9zdrUQTveO3EcOCxrHQIHB2omyozhfaGhKo9
 XQFrYfgyss99y3+08WWPCMBbbsvy8SoaCiwiXiBYZNmvO7Wkm/vzlC6JgSRNAiofslBs
 IsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DxxDnArAuqMzLOKrnNqBxORaTd+7/JcrK9bDcFPx9BQ=;
 b=k0SsEez2ljqAAQsxoiIY8/7GQ18A9XQvznbiy+nfDWqteXrR9Nj/uwRzcBLcHRzTpp
 TrdJV4QnRtdIXB5rK8Cr7AUnrOXzGKAkGoFrzcxfCSI2vObE4Zecdubg7Nqg11rwQYHZ
 9hciFBOmud3CJDzkDisIfJu1sGpGYsMarY3KotlCsPlQjEoq5S49nvQ8jx27623e5MYG
 S90Jp/7rs3OkPjLW/PxUfq+x3/GFE/iGHyE8//91M86CXk0oAtBp0RjRhkH3NWkPiSth
 VkGGJFBNdBsn+dShrwd3O5ECP5uDEZNICou9eJRWuYkHq+5/PLMp3pXg5GaY+N9JjBsY
 ox2Q==
X-Gm-Message-State: AOAM532/1dBSP/p5lDq9QPH528ezrQ0d3RdPvCgxfwvvJB1IZ5owTUp0
 jp0NrvUOj35+qdcvo9d7LD5jeRUrB1Uc7gluCD0=
X-Google-Smtp-Source: ABdhPJxK9Pl7nDDrEjCckoKhzIkfsziDqe9p0oskMIry7aZ1ewD2rkdZK6eZm+ZpzCPRqBiNvG4eBEMomJ0BLTdG8Ws=
X-Received: by 2002:a4a:e899:: with SMTP id g25mr1334984ooe.68.1632770423330; 
 Mon, 27 Sep 2021 12:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210927125824.1583474-1-arnd@kernel.org>
 <a27a9db3-1186-8fea-8952-fca4171bcee5@amd.com>
In-Reply-To: <a27a9db3-1186-8fea-8952-fca4171bcee5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Sep 2021 15:20:12 -0400
Message-ID: <CADnq5_NcRQO=VAGONoBBebZAXXaNDshUZk9=RpLVu3LdGnztXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix warning for overflow check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunming Zhou <david1.zhou@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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

Applied.  Thanks!

On Mon, Sep 27, 2021 at 9:07 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 27.09.21 um 14:58 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The overflow check in amdgpu_bo_list_create() causes a warning with
> > clang-14 on 64-bit architectures, since the limit can never be
> > exceeded.
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c:74:18: error: result of com=
parison of constant 256204778801521549 with expression of type 'unsigned in=
t' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
> >          if (num_entries > (SIZE_MAX - sizeof(struct amdgpu_bo_list))
> >              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > The check remains useful for 32-bit architectures, so just avoid the
> > warning by using size_t as the type for the count.
> >
> > Fixes: 920990cb080a ("drm/amdgpu: allocate the bo_list array after the =
list")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.c
> > index 15c45b2a3983..714178f1b6c6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > @@ -61,7 +61,7 @@ static void amdgpu_bo_list_free(struct kref *ref)
> >
> >   int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file=
 *filp,
> >                         struct drm_amdgpu_bo_list_entry *info,
> > -                       unsigned num_entries, struct amdgpu_bo_list **r=
esult)
> > +                       size_t num_entries, struct amdgpu_bo_list **res=
ult)
> >   {
> >       unsigned last_entry =3D 0, first_userptr =3D num_entries;
> >       struct amdgpu_bo_list_entry *array;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.h
> > index c905a4cfc173..044b41f0bfd9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > @@ -61,7 +61,7 @@ int amdgpu_bo_create_list_entry_array(struct drm_amdg=
pu_bo_list_in *in,
> >   int amdgpu_bo_list_create(struct amdgpu_device *adev,
> >                                struct drm_file *filp,
> >                                struct drm_amdgpu_bo_list_entry *info,
> > -                              unsigned num_entries,
> > +                              size_t num_entries,
> >                                struct amdgpu_bo_list **list);
> >
> >   static inline struct amdgpu_bo_list_entry *
>
