Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7870BF07
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35C510E310;
	Mon, 22 May 2023 13:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB79E10E30F;
 Mon, 22 May 2023 13:02:32 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-ba81031424dso9135298276.2; 
 Mon, 22 May 2023 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684760551; x=1687352551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oz4bQfIt7cNLLI3/bZ4OW8kbHhUS+fQ0VE6AH/7bMg4=;
 b=lYD92GRkYdjfbP3e8fwuaSxDduqy48npOK4Yg9ZaOEmHqS/JPtCrce+EnaTh9VmSna
 RHT7GBkDPyiY/W1+jvLGjxkh51jn+zxmI9OqgHEoEtA6ZjAC30eCAWTw4zIpfk4rWBWy
 A1qvHTQQwDt/NDBe21ApIde4nz/UtIN9QIixfms/Elp7oFDo+K/CLz+WFH9CtzPzcwlv
 rzv+9GIwfuw+VDp4MMJbBA5/iN9yQMMF+KMxRFF3Ge3uNa1QastQ+/BM0jUqgxWGYyfz
 cZTsz43RMk9g0VkTvoP1GJLBnZ9NmdVPAanL5bVUqBvc4fFhRPHb/wZFuV7qE7SuuDXI
 bn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684760551; x=1687352551;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oz4bQfIt7cNLLI3/bZ4OW8kbHhUS+fQ0VE6AH/7bMg4=;
 b=FtzCfe6g+2++bwRX7walXl8KQal522BhJBw765YEWPz9Zo4stP1rvG/t3cKn7LNQ1v
 i8o1ZkrR6lgx2Urxvcc+GvJySFFANymwvhxj6c+x+c+R9LHmn25VOmh+wRDo+AVqON4w
 6P9ivh9QCJCuJY2fpjv1rFhrANq3G++Fz3K43H1lwkcnXw5QNG5u1/C5jhZPVU3JMu/W
 c9KItLeQziENNmst2nXvtD9TXvvdvHHIuKFvDW3o3AJXsqLbCfLPEAIkw20TFlTOJEqr
 QBIQl0FapJqY5kUd8eIfsApW8Nc7EBiozV974D3q0gWKDCmqqmU3OdZrsFKs0feWscv4
 g2+A==
X-Gm-Message-State: AC+VfDwTOrSDnN4SxM+zRXQHBV6r3ni2867Ry5APaE6DIeUsSUkwVXnI
 dbi9hBpEUGtz1rJh5r9sAm0Y1vPBDu5HNz93B74=
X-Google-Smtp-Source: ACHHUZ6H/V3aromhsm0WeKkw3qoE/viYGpCdWeB7qDuWQFt6qRv5I58EjllHW4obHGmBc+ZmdwVtPh7vvXJ6Cb4sGGM=
X-Received: by 2002:a25:cdc5:0:b0:ba6:a445:3317 with SMTP id
 d188-20020a25cdc5000000b00ba6a4453317mr9276789ybf.39.1684760551555; Mon, 22
 May 2023 06:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230521205112.150206-1-dmitry.osipenko@collabora.com>
 <20230521205112.150206-7-dmitry.osipenko@collabora.com>
In-Reply-To: <20230521205112.150206-7-dmitry.osipenko@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 22 May 2023 14:02:19 +0100
Message-ID: <CACvgo52QvmZw5k_9dmBHPB25rTdLZJzVG_vNFr8or+3f5sVO=Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/shmem-helper: Switch to reservation lock
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 kernel@collabora.com, Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomi Valkeinen <tomba@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Tomasz Figa <tfiga@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Saw v3 fly by, so I had a quick look. Original RB still stands,
although I noticed a couple of non-blocking nitpicks.

On Sun, 21 May 2023 at 22:00, Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:

> -static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_get_pages(struct drm_gem_shmem_object *shmem)
>  {

Should this getter have a dma_resv_assert_held(shmem->base.resv); like
it's put brethren?


> -void drm_gem_shmem_put_pages(struct drm_gem_shmem_object *shmem)
> +static int drm_gem_shmem_pin_locked(struct drm_gem_shmem_object *shmem)
> +{
> +       int ret;
> +
> +       dma_resv_assert_held(shmem->base.resv);
> +
> +       ret = drm_gem_shmem_get_pages(shmem);
> +
> +       return ret;

With the assert_held in the getter, it would be less confusing to
inline this and the unpin_locked functions.

> +}
> +
> +static void drm_gem_shmem_unpin_locked(struct drm_gem_shmem_object *shmem)
>  {
> -       mutex_lock(&shmem->pages_lock);
> -       drm_gem_shmem_put_pages_locked(shmem);
> -       mutex_unlock(&shmem->pages_lock);
> +       dma_resv_assert_held(shmem->base.resv);
> +
> +       drm_gem_shmem_put_pages(shmem);

Side note: the putter has an assert_held so the extra one here seems quite odd.

As said at the top - with or w/o these nitpicks, the original RB still stands.

HTH o/
-Emil
