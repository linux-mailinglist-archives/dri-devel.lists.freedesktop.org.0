Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15C713A42
	for <lists+dri-devel@lfdr.de>; Sun, 28 May 2023 16:59:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD2710E18D;
	Sun, 28 May 2023 14:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3280B10E1CB;
 Fri, 26 May 2023 15:20:56 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-42c38a6daf3so527210137.3; 
 Fri, 26 May 2023 08:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685114454; x=1687706454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+SOwkMnAYLUhEyDhUUgTK3i7OucfEXqIXWQlJcLoVU=;
 b=PuzLeEcfvg/LdSchneMYTd0vUpYvTU6YZvM2Y3o1q0AsC9FK8+Nkw/5MNFR+dIZXnU
 lkFEzO03ZQJ93LbRiV8biz7XAYN9l5UYCzWcA+U2ADY6AnKR6H4hSOhLo7HYqlRUsvsv
 nKa6muV1DoL+sYLAz1o3pGgtGu5Rm28lsmNWFNCvDuFVdjbk7qjzZuthKkvwIxrN1RyF
 QSR2i8AJ2mgEy4/JnoKpJpflO2UQm4uxRLD2TPRbsPVSRYXle30AklVRmartoXxxengG
 8bn7OTwbq0DAnaPjEAkfc/nfkUpeRQXl76X4ijTTXJgMad0akJ5se72Ko9M8KO57XMr7
 +O4w==
X-Gm-Message-State: AC+VfDyKLGrtB3aNB2Hps4KEt4L+MhhN5bgMD2kAwfuhNmMJdFclw0pc
 KCLr/N2XDieE1s+qI+hLDeBsCrQd4W6GOxSOqw8=
X-Google-Smtp-Source: ACHHUZ6ZlhFY7AADiHbWA1tNcXhU9OhjLGRqgcDbeU13+spfQOI9Yck0GdZSs3V5xPT9GKA0itjGIYseaGK56N8MAdk=
X-Received: by 2002:a67:fb0c:0:b0:436:c4a:bcc4 with SMTP id
 d12-20020a67fb0c000000b004360c4abcc4mr644960vsr.21.1685114454682; Fri, 26 May
 2023 08:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230526091052.2169044-1-kherbst@redhat.com>
In-Reply-To: <20230526091052.2169044-1-kherbst@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 26 May 2023 11:20:43 -0400
Message-ID: <CAKb7Uvha74HOvny25aqnwzvvRLpc7+DNQm6QEAk4oxfTa1urJg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: bring back blit subchannel for
 pre nv50 GPUs
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 28 May 2023 14:59:32 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 5:11=E2=80=AFAM Karol Herbst <kherbst@redhat.com> w=
rote:
>
> 1ba6113a90a0 removed a lot of the kernel GPU channel, but method 0x128
> was important as otherwise the GPU spams us with `CACHE_ERROR` messages.
>
> We use the blit subchannel inside our vblank handling, so we should keep
> at least this part.
>
> v2: Only do it for NV11+ GPUs
>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/201
> Fixes: 4a16dd9d18a0 ("drm/nouveau/kms: switch to drm fbdev helpers")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c |  1 +
>  drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c  | 20 +++++++++++++++++---
>  3 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nou=
veau/nouveau_chan.c
> index e648ecd0c1a0..3dfbc374478e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -90,6 +90,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
>                 if (cli)
>                         nouveau_svmm_part(chan->vmm->svmm, chan->inst);
>
> +               nvif_object_dtor(&chan->blit);
>                 nvif_object_dtor(&chan->nvsw);
>                 nvif_object_dtor(&chan->gart);
>                 nvif_object_dtor(&chan->vram);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nou=
veau/nouveau_chan.h
> index e06a8ffed31a..bad7466bd0d5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
> @@ -53,6 +53,7 @@ struct nouveau_channel {
>         u32 user_put;
>
>         struct nvif_object user;
> +       struct nvif_object blit;
>
>         struct nvif_event kill;
>         atomic_t killed;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index cc7c5b4a05fd..9512f1c2f871 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -369,15 +369,29 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
>                 ret =3D nvif_object_ctor(&drm->channel->user, "drmNvsw",
>                                        NVDRM_NVSW, nouveau_abi16_swclass(=
drm),
>                                        NULL, 0, &drm->channel->nvsw);
> +
> +               if (ret =3D=3D 0 && device->info.chipset >=3D 0x11) {

Can you double-check that this is needed on NV15? IIRC there's some
non-linearity of chipsets here which is why we had (some long time
ago, not sure if it's still there), a chip class which would simplify
such checks.

Cheers,

  -ilia
