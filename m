Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6393B03F7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 14:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A4A6E113;
	Tue, 22 Jun 2021 12:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4526E113
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 12:12:54 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id 14so858383oir.11
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 05:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=c5eBbc+xgF27k8H0ilHkCqMocxb86guzViKCakUNopI=;
 b=ZPWGqpHISM3LIVZ0T5UasKFCc9L/spSOSwNjIQzsQVqqX8AZcT5VkVtqEhI53D8veE
 rbswikcM5qyis76np0mEW2bBeuNYXAm4EoxmUeQDZyC2U2CatM5NX8+ldPBAGOKjQOTk
 ovBYQWh7nvyncbkmquPhxue7K45lz2n28hq8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c5eBbc+xgF27k8H0ilHkCqMocxb86guzViKCakUNopI=;
 b=eidg1AOtFZyciBvM6U8q+RqexzSO6NtpMryDgQXeXozfBxx9j7wFDa0K9U2TL4T+Qa
 TX6jO5ORFlaQHQMMz2cz3XV1yDkUdMQbtWLfzAcDUICKcBr3NPzeNKzZJUmbS5gTPjIT
 8ds/lL4MS4xrqOhJ2Za9WE8FjZ7WtaUBcFmRZgW0vm3bFIsyo9ftsMf5Mtd2OmZo8qNq
 jb8+2UAx/VQT+V9qm/F5mNSaLrhUCIwOKJACH087xCBuL7rps6UkHryGm+GMT9ijxPnV
 t8ueG2l1cDIGHcwRpDCp1PFPqIwF15nUnoUkU7L8KRA9IODuINbsF9G1c2pUofJNNmm5
 LLJw==
X-Gm-Message-State: AOAM530vdNMwPqMp9xTnxLATWVLrVtTxaGaPK5n21LwRPJkHzMlEq8eX
 Hj/aGYaPYf+zbBZWcLxdBiXkKqICOuQjMLrCYOoQjw==
X-Google-Smtp-Source: ABdhPJwiQD6NUcQ0iG9Jd4DGL/QOrNLNzUDgi+ZGq3as40jacZHCpUigA1LaQ8UGlSEW//WCcZ1WkJOB02Vdy2Hq8ac=
X-Received: by 2002:aca:530f:: with SMTP id h15mr2974657oib.128.1624363974172; 
 Tue, 22 Jun 2021 05:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210622114506.106349-1-christian.koenig@amd.com>
In-Reply-To: <20210622114506.106349-1-christian.koenig@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Jun 2021 14:12:43 +0200
Message-ID: <CAKMK7uHSZWSonyT4h=7uv2gi5PkQYw_Ojy-Rq7FGxP-bQ+nPsA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau: wait for moving fence after pinning v2
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 1:45 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> We actually need to wait for the moving fence after pinning
> the BO to make sure that the pin is completed.
>
> v2: grab the lock while waiting
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> References: https://lore.kernel.org/dri-devel/20210621151758.2347474-1-da=
niel.vetter@ffwll.ch/
> CC: stable@kernel.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_prime.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/no=
uveau/nouveau_prime.c
> index 347488685f74..60019d0532fc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -93,7 +93,22 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>         if (ret)
>                 return -EINVAL;
>
> -       return 0;
> +       ret =3D ttm_bo_reserve(&nvbo->bo, false, false, NULL);
> +       if (ret)
> +               goto error;
> +
> +       if (nvbo->bo.moving)
> +               ret =3D dma_fence_wait(nvbo->bo.moving, true);
> +
> +       ttm_bo_unreserve(&nvbo->bo);
> +       if (ret)
> +               goto error;
> +
> +       return ret;
> +
> +error:
> +       nouveau_bo_unpin(nvbo);
> +       return ret;
>  }
>
>  void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> --
> 2.25.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
