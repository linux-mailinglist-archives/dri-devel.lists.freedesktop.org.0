Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347E584AD41
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 05:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF2D112601;
	Tue,  6 Feb 2024 04:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MPt/eZln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF932112601
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 04:05:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB0AECE125E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 04:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17819C43399
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 04:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707192323;
 bh=JZvK1LfT5W3Amj1bFNL00t+yJLMnxNwR1b1VLR65yOs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MPt/eZlnYkp7bEhcsAHjYYnbGoM/wPjspUhU7heNAHm7nvAt9wh2CeSZy4W9VlOCo
 JdlwMPZIwUNvsteUDmdJfk0oOk8jCt+NQ/o3uJ0Ll8kOdIg5NCCF0/uAFCXJfx/UWT
 6COn1OGda5RkobnxXhcck246EA3IlA5pwv5hn9kHADqot4Y0Lh7eTj40wEx0aSOPBe
 T8BfbY+Aa0bk5cBQ2lwaw9Ff2O2YbxNXBrFJFhZ1T9vYKeltosDkKJSguxoGt5aE+B
 inC7gHHhiMul6SvSUUoHaxnk877iCHN+I+mUv/707T+PQEEB5735k2EMrnTcXtUiU+
 sRX3fSnf6pU0Q==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so7296376a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 20:05:23 -0800 (PST)
X-Gm-Message-State: AOJu0YwXcqhlAE7i/FL0pxZ/a66lgzDzYE+komaQv2Jlgp9PMl9lxJdb
 TmkJNbKGzek1+VGgNa9zHxJZLMzNCoxkFjl8h+0rFfL2C/kTolKe9frqEBIxZOItVEKEUfnIR0H
 m3dQwyc/7tgLsB7G656wJQUEolL4=
X-Google-Smtp-Source: AGHT+IHen3DDjJn65TycqVtQ2JRpfTPFrv8QvbyYNgZL27B8U8cm8R2yFgc08uMVz331GpNdpcOu8eqBdOwxRr82YhQ=
X-Received: by 2002:aa7:d98d:0:b0:560:1372:d950 with SMTP id
 u13-20020aa7d98d000000b005601372d950mr769977eds.22.1707192321526; Mon, 05 Feb
 2024 20:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20240119104049.335449-1-chenhuacai@loongson.cn>
 <081b4b16-0e39-4ab0-9b80-c967e635b909@linux.dev>
In-Reply-To: <081b4b16-0e39-4ab0-9b80-c967e635b909@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 6 Feb 2024 12:05:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6z_qwiqtbbnbvBeJT0mqnPhw68_ik33vYwTqYbKf5Www@mail.gmail.com>
Message-ID: <CAAhV-H6z_qwiqtbbnbvBeJT0mqnPhw68_ik33vYwTqYbKf5Www@mail.gmail.com>
Subject: Re: drm/loongson: Error out if no VRAM detected
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Sat, Feb 3, 2024 at 1:24=E2=80=AFAM Sui Jingfeng <sui.jingfeng@linux.dev=
> wrote:
>
>
> On 2024/1/19 18:40, Huacai Chen wrote:
> > If there is no VRAM (it is true if there is a discreted card), we get
> > such an error and Xorg fails to start:
> >
> > [  136.401131] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  137.444342] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  138.871166] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  140.444078] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  142.403993] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  143.970625] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> > [  145.862013] loongson 0000:00:06.1: [drm] *ERROR* Requesting(0MiB) fa=
iled
> >
> > So in lsdc_get_dedicated_vram() we error out if no VRAM (or VRAM is les=
s
> > than 1MB which is also an unusable case) detected.
> >
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >   drivers/gpu/drm/loongson/lsdc_drv.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loon=
gson/lsdc_drv.c
> > index 89ccc0c43169..d8ff60b46abe 100644
> > --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> > +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> > @@ -184,7 +184,7 @@ static int lsdc_get_dedicated_vram(struct lsdc_devi=
ce *ldev,
> >       drm_info(ddev, "Dedicated vram start: 0x%llx, size: %uMiB\n",
> >                (u64)base, (u32)(size >> 20));
> >
> > -     return 0;
> > +     return (size > SZ_1M) ? 0 : -ENODEV;
>
>
> I forget to tell you that you probably should return ENOSPC at here,
> which stand for no space left on device, not the ENODEV.
Make sense, will do.

Huacai
>
