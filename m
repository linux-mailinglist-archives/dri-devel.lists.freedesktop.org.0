Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A97511EA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 22:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D8710E14E;
	Wed, 12 Jul 2023 20:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE0B10E14E;
 Wed, 12 Jul 2023 20:40:13 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b71ae5fa2fso68276741fa.0; 
 Wed, 12 Jul 2023 13:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689194411; x=1691786411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cb7REX25ihGsi9NwAVFjKMBpYTxy+Tpy2z9YDG2DrUQ=;
 b=KZmAKonaBRhlKHpLudMe+VioF1dWuyaJKm5+U6Yp2D7Rin9mudUsXqQGd6lEhxk7lo
 zaVXs/etTUCK6bLDrrTay5yQbAnYphyFB4xK0OXAIxlfZdQ/hpC/L8PLnBb9i5TjJnVC
 lYfJ84aDeOlBkmYSjE/LZFKidcnAmtfWrLOcaGpPnCU73+9cTIpi5+HkWHEIs3Z9sF0c
 PanXJK9TdkTCIVi1l501AK0u7uB+/n5JPpQQWQjYD7ULY7phyRGoHqZnhtUYYTm2qM0w
 bQgrgL6PfSDdl3ZktrKOB+tj8T+U07dkUUyiJKdUp1ubqMObPW6OHfUUB2K58/HHy8sw
 VIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689194411; x=1691786411;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cb7REX25ihGsi9NwAVFjKMBpYTxy+Tpy2z9YDG2DrUQ=;
 b=E1YyfbOCbMXmFQEwLWomljDZVykrgUUTE7uTUlI5dEJRmYJTVGrfnLahlKRYlQ6hbO
 mI6PTGN0h8J1Bi0DL9XWHwFsIRZM1ZgvG0k3xaORJKPiGuHnYlVirjIbbp7+fQ1Q4q++
 GiA6KkJzZMIoV1LOcmSqPAIg14vvVhLm7LVYPQ6N9w+ZxACXlD6fgFCSNDdDQbrvgnX4
 06bsWo6ySe1a/3SF7WwQ+LXFMp6DT3M4Nyiw5iczU73DIjfFvrX92S3va3OMlMIgPzXe
 6e4m2gr3vNqFckUzxmtbpvsWa/+uEy/uGMd9pRqACG09caYYv2v7vh899ofALR/wu7d5
 2WGA==
X-Gm-Message-State: ABy/qLZE5UHtPWeA1qbf4RBabFxVA3jEgXKo251yeX6aJwnBWf/mYLgR
 UGwNOVRuoVh7aej4Il38NkwtxGZQy6FR/ujAMXQ=
X-Google-Smtp-Source: APBJJlHJB1H8w3zvgGfX75TocAy24yIenkwzbczqn0FqjF7UskV/7KgpemLLo1pwJdEkcwRO1e4GyvNNjQWJtjQYqFo=
X-Received: by 2002:a2e:9807:0:b0:2b6:e2aa:8fc2 with SMTP id
 a7-20020a2e9807000000b002b6e2aa8fc2mr15795067ljj.46.1689194410815; Wed, 12
 Jul 2023 13:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230526091052.2169044-1-kherbst@redhat.com>
In-Reply-To: <20230526091052.2169044-1-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 13 Jul 2023 06:39:59 +1000
Message-ID: <CACAvsv7aGU0nkj-_HuGHFcX0STLNYHU5vHtnrrnfJvJqo=d-_w@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: bring back blit subchannel for
 pre nv50 GPUs
To: Karol Herbst <kherbst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 26 May 2023 at 19:11, Karol Herbst <kherbst@redhat.com> wrote:
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
Reviewed-by: Ben Skeggs <bskeggs@redhat.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c |  1 +
>  drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c  | 20 +++++++++++++++++---
>  3 files changed, 19 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
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
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
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
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index cc7c5b4a05fd..9512f1c2f871 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -369,15 +369,29 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
>                 ret = nvif_object_ctor(&drm->channel->user, "drmNvsw",
>                                        NVDRM_NVSW, nouveau_abi16_swclass(drm),
>                                        NULL, 0, &drm->channel->nvsw);
> +
> +               if (ret == 0 && device->info.chipset >= 0x11) {
> +                       ret = nvif_object_ctor(&drm->channel->user, "drmBlit",
> +                                              0x005f, 0x009f,
> +                                              NULL, 0, &drm->channel->blit);
> +               }
> +
>                 if (ret == 0) {
>                         struct nvif_push *push = drm->channel->chan.push;
> -                       ret = PUSH_WAIT(push, 2);
> -                       if (ret == 0)
> +                       ret = PUSH_WAIT(push, 8);
> +                       if (ret == 0) {
> +                               if (device->info.chipset >= 0x11) {
> +                                       PUSH_NVSQ(push, NV05F, 0x0000, drm->channel->blit.handle);
> +                                       PUSH_NVSQ(push, NV09F, 0x0120, 0,
> +                                                              0x0124, 1,
> +                                                              0x0128, 2);
> +                               }
>                                 PUSH_NVSQ(push, NV_SW, 0x0000, drm->channel->nvsw.handle);
> +                       }
>                 }
>
>                 if (ret) {
> -                       NV_ERROR(drm, "failed to allocate sw class, %d\n", ret);
> +                       NV_ERROR(drm, "failed to allocate sw or blit class, %d\n", ret);
>                         nouveau_accel_gr_fini(drm);
>                         return;
>                 }
> --
> 2.40.1
>
