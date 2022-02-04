Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B054A9C2B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 16:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B45C89E0D;
	Fri,  4 Feb 2022 15:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625A289DBF;
 Fri,  4 Feb 2022 15:44:01 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id s185so8959851oie.3;
 Fri, 04 Feb 2022 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t++Sl3/j9Xw1ZOybdNpwLGb8KZHNprMyq9fgMdYyV9Q=;
 b=ofKsXST+b78YnNo0vRwalFJF2rIg7y5RCr7b9iXGySPvbCIYvtI01v9ap6ua4x5oke
 NwBCnlQccFSJSnTXSEDJgSyWVW/KbJinpFXvYg0jxFNSl7DUXVA1Zd0lFmW5sMrwVizV
 ufn7WgEa19jmXJ0tUnxgsBfZt1hNuR79QsIgz7IV6IFlFCDLnoDPP2QNsKuJ2APkJ6zT
 XydlsfogysNCo6+3J0PD3+ksqUtglHHeZtxM6C29PTpe7GnYYY3M30ZFeYlOAsxMqNf5
 1JegMB7YgYlsDLDhR4Af1Ffgq6MhtefT/MtmdyBKr4pKv5bphOptoQiLrUn1MV2HiSaL
 H1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t++Sl3/j9Xw1ZOybdNpwLGb8KZHNprMyq9fgMdYyV9Q=;
 b=EZEFIbSxPNs39QdO7FQwmHVWnqXC4weXwal3tjm2I4vkqgq63xOz5IxIk4zMLJeauD
 3DX7GuUXRZ23AnhEFHp0xty9twzBVivrWHTYAIE2Udyamw/KEOZfaremdmhGtfq7r+hd
 Ri6Tg0t4rgh+vBPldKx6Q2opTF4maxGKqDI3nXyn0Tuj9F2wRcSlEVvT3hJrSSiQAyol
 uQ6cbA06YTTsBSfOPDkoNIfZ+CrG5b1nTbLMrnjm65MGg+oqUOuv0Gnh4XQcWTuU72ch
 Ak23nlNTE63z3pz+HSEqYTY67LfOcURk+GV4hzECzRPX9c7qUQvBoH0SCUBqW9w4aNo7
 Fj4g==
X-Gm-Message-State: AOAM530t7PWn7rNwiB5uHF7mV8QtLZ5DMbLtizqOWkWY5wvXDYyrDxte
 X0zUGqmp0zs0mc6f2Frhu0UP4Y0Uq7/zo36PuHc=
X-Google-Smtp-Source: ABdhPJwE0RukyciYykgWOgQCk6YO79c6zVGxWgzIhrxIabmvpOMl2SShp7Q8g9oV5Xn5V8VohXG14WqBPssjZxCgz3c=
X-Received: by 2002:a05:6808:159e:: with SMTP id
 t30mr1555187oiw.132.1643989440616; 
 Fri, 04 Feb 2022 07:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <20220204100429.2049-7-christian.koenig@amd.com>
In-Reply-To: <20220204100429.2049-7-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Feb 2022 10:43:49 -0500
Message-ID: <CADnq5_Myswp9hJF3eFY3MEYhxrM-NMPRaF9=RUTBtMoRLhkEAg@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/amdgpu: use dma_fence_chain_contained
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 4, 2022 at 5:04 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Instead of manually extracting the fence.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sync.c
> index f7d8487799b2..40e06745fae9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -261,10 +261,9 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, str=
uct amdgpu_sync *sync,
>
>         dma_resv_for_each_fence(&cursor, resv, true, f) {
>                 dma_fence_chain_for_each(f, f) {
> -                       struct dma_fence_chain *chain =3D to_dma_fence_ch=
ain(f);
> +                       struct dma_fence *tmp =3D dma_fence_chain_contain=
ed(f);
>
> -                       if (amdgpu_sync_test_fence(adev, mode, owner, cha=
in ?
> -                                                  chain->fence : f)) {
> +                       if (amdgpu_sync_test_fence(adev, mode, owner, tmp=
)) {
>                                 r =3D amdgpu_sync_fence(sync, f);
>                                 dma_fence_put(f);
>                                 if (r)
> --
> 2.25.1
>
