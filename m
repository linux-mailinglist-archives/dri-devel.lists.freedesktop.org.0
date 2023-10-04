Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888967B7A1E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 10:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E93610E0E1;
	Wed,  4 Oct 2023 08:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03FD110E348
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 08:34:04 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5048156976cso2147863e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1696408443; x=1697013243;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wfmW3coigpVfgSMijltIl7QADja7SAFkOQQrbcYexQk=;
 b=hkoxOI25kg179bOvbCOCfbfm44gIy4M5lb13Pmp6gQ1vqiSBsXJ2/tDD52PIzzF+Ks
 nznO+jM2I991iujoQmBb8Y2kL7vGeKRNEZjg2qAyS9HgXYnPeakDA8mDv2ryvc74LkKR
 zI4BDvwJSd37fnCg7mJcJxt6m7WEqH1Cp4fD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696408443; x=1697013243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wfmW3coigpVfgSMijltIl7QADja7SAFkOQQrbcYexQk=;
 b=Cc0iK3Or31tWUIi310dvcqTqCRe1EjvUVNgbiid9Q+/0qqd18MCJYmcu2ydSM+/u1T
 Ez+lg75tkpi2evlY8X92hwK7X5x+JLJMbIQFrE9BH6Z6tvcsZcEEqPWnHGVNaVP5++K9
 ka7fX5c1Xh6w+oVKNpwTgASzsY786EMj0L3wHFBgvC4nKsa8PjA0z/eFmCYLwPo/g27c
 4Bsj8nRLRQZteTDruYLxpQnC5moF60ZQ2mGCJQtC4JzeSjmdUc6XJ/ogqRMFLKo2Srzc
 vJEPbOoJTnjjQg5TmEKC7UZuuWAYu9lyYifTvsS4NhTiEzLR3Sm0KJ4OlXuPkT3nt03z
 o9rg==
X-Gm-Message-State: AOJu0YxesfEoxKNnEjDc7qckZhHcOar1TCG1iXYilZX2wi4QTzizKL6v
 rH8Qzz8NcabgyGUciBNpOmaLZNlFpvXMkexmN2h+JiHCZqB36oms
X-Google-Smtp-Source: AGHT+IF9sR2Cj+7e97L/FPexpqaBojFR/xX2jui4Z8uoOZLn5ebZKHpYgKEeRaYNH0lTMRLG8ectez6G8uh/TNsdVuw=
X-Received: by 2002:a19:e015:0:b0:500:94c3:8e3b with SMTP id
 x21-20020a19e015000000b0050094c38e3bmr1344729lfg.57.1696408442607; Wed, 04
 Oct 2023 01:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231004083226.1940055-1-wenst@chromium.org>
In-Reply-To: <20231004083226.1940055-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 Oct 2023 16:33:51 +0800
Message-ID: <CAGXv+5GiN22ObkB8P_w7ftVsWkRfOvoq3dAT4OtoUw3TTpUtaw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Correctly free sg_table in gem prime vmap
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 4, 2023 at 4:32=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The MediaTek DRM driver implements GEM PRIME vmap by fetching the
> sg_table for the object, iterating through the pages, and then
> vmapping them. In essence, unlike the GEM DMA helpers which vmap
> when the object is first created or imported, the MediaTek version
> does it on request.
>
> Unfortunately, the code never correctly frees the sg_table contents.
> This results in a kernel memory leak. On a Hayato device with a text
> console on the internal display, this results in the system running
> out of memory in a few days from all the console screen cursor updates.
>
> Add sg_free_table() to correctly free the contents of the sg_table. This
> was missing despite explicitly required by mtk_gem_prime_get_sg_table().
>
> Also move the "out" shortcut label to after the kfree() call for the
> sg_table. Having sg_free_table() together with kfree() makes more sense.
> The shortcut is only used when the object already has a kernel address,
> in which case the pointer is NULL and kfree() does nothing. Hence this
> change causes no functional change.
>
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap funct=
ion")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Changes since v1:
- Move "out" shortcut label to after sg_free_table() and kfree()

> Please merge for v6.6 fixes.
>
> Also, I was wondering why the MediaTek DRM driver implements a lot of
> the GEM functionality itself, instead of using the GEM DMA helpers.
> From what I could tell, the code closely follows the DMA helpers, except
> that it vmaps the buffers only upon request.
>
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9f364df52478..0e0a41b2f57f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj=
, struct iosys_map *map)
>         npages =3D obj->size >> PAGE_SHIFT;
>         mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP_K=
ERNEL);
>         if (!mtk_gem->pages) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 return -ENOMEM;
>         }
> @@ -248,12 +249,15 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
>         mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
>                                pgprot_writecombine(PAGE_KERNEL));
>         if (!mtk_gem->kvaddr) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 kfree(mtk_gem->pages);
>                 return -ENOMEM;
>         }
> -out:
> +       sg_free_table(sgt);
>         kfree(sgt);
> +
> +out:
>         iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>
>         return 0;
> --
> 2.42.0.582.g8ccd20d70d-goog
>
