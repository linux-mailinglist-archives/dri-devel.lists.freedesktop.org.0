Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB356998FC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 16:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6D410EDDD;
	Thu, 16 Feb 2023 15:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34C110EDDC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 15:35:13 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-16346330067so2964548fac.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 07:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ioF/xYzGNQ9HWTwjq17Gz1ixsYLfM4BwYPZHajLvwZA=;
 b=XubF9IpgMUfiaY9LgzOVd0JUI4jSbJbo4k+ayOa1s5YmF/LT/cuDsR4RAsbEHSF85p
 GVcc1hdNSJViDfRCo83WKrWJGW+IhNAovrbGGdTllTHVadQeLKKCvUk95S3X0VQVLghm
 T6OpcaOxdhHqEJ4fd86AkB1gJvFF29uNMDI2GHawG+Tw+2NPr7Y5ijjoxXrhL/LauHbc
 6wREDh0EjLnKXMRMtfwjBeJpC5q6ZooWQHsQjYYjBjOkPOvuoTfnrl2E1h09lgwN7Dyg
 m+7lUatd2WuDDe7l4O44lcVGeJa0xpmymgR2KPIbNQNfBwv2BdSIZnDw+KrQy1q+9jqG
 A2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ioF/xYzGNQ9HWTwjq17Gz1ixsYLfM4BwYPZHajLvwZA=;
 b=tc7Xew0Vpvy7wo0ErHRiNWYZHkeuQe1iQT3SXxnQwSdvQRblvDVolH1eGIo6m7o46e
 A1gdni/UQ1DMmMw92Ox3tHLXfI+7KOMiZGHJcy2y1+mzuwOdzXeQgo7B1qFIp4Tvnpeh
 UwZQxUEEmvdKg3pukDy56o44vuFlSuwNjBOpvP7On87WTQTExh30ZnLp8Rxfc25rwYnv
 NflaiXc45NIFKZr+h76EcCwL/BwagKHrU4xO6mw+y+n57zN7Az5EIMvGIUGEuNBmF7HE
 BcxVLm1maxvIrWnYNHAzi0FOCmSJbDy+6xXbnVzyX2PvN+vUoJDIMD3IKJLi1j7eNkCv
 N9ZA==
X-Gm-Message-State: AO0yUKWvudxpltavsr0FETVzBS1I0+dGlOIxGPU6G45QIFMggvTwR+3n
 PmqYhxgQbOklxAvJg2rutZ4PnJyYuvUU8aBPP2w=
X-Google-Smtp-Source: AK7set/288VGegqAcXYDVWUGpg0Co0DIG8CEILOv8kQkp24cT9DVZw9MDpt+HBi4O1fbHgFlBuhdpKFJwfba7uvGIRA=
X-Received: by 2002:a05:6870:808d:b0:16e:8a56:d0d2 with SMTP id
 q13-20020a056870808d00b0016e8a56d0d2mr36507oab.38.1676561712824; Thu, 16 Feb
 2023 07:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20230108211311.3950107-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20230108211311.3950107-1-dmitry.osipenko@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 16 Feb 2023 07:35:32 -0800
Message-ID: <CAF6AEGtU_Af=2TJiZytTx3GHryFiefJNkmKzwk569RcJKD+9BA@mail.gmail.com>
Subject: Re: [PATCH v1] drm/shmem-helper: Remove another errant put in error
 path
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jan 8, 2023 at 1:13 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> drm_gem_shmem_mmap() doesn't own reference in error code path, resulting
> in the dma-buf shmem GEM object getting prematurely freed leading to a
> later use-after-free.
>
> Fixes: f49a51bfdc8e ("drm/shme-helpers: Fix dma_buf_mmap forwarding bug")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index f21f47737817..8b20b41497e8 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -624,11 +624,14 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>         int ret;
>
>         if (obj->import_attach) {
> -               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> -               drm_gem_object_put(obj);
>                 vma->vm_private_data = NULL;
> +               ret = dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> +               if (!ret)
> +                       drm_gem_object_put(obj);
>
> -               return dma_buf_mmap(obj->dma_buf, vma, 0);
> +               return ret;
>         }
>
>         ret = drm_gem_shmem_get_pages(shmem);
> --
> 2.38.1
>
