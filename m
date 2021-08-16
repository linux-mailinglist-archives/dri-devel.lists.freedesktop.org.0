Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097493ED6CF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DE889E32;
	Mon, 16 Aug 2021 13:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CBD89E32;
 Mon, 16 Aug 2021 13:26:12 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 22so9629179qkg.2;
 Mon, 16 Aug 2021 06:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ax8I8rYKM4hKa/LJED1Fy41aTKRfXHhWe2ILaJfWVR4=;
 b=kyOtCZzQ9+Yf16rjneW6/pL2LgDn9LjKkdQj0lXNoz9WM0ZdSaeYiLdXOJerXHnIQn
 yKKUpzETD1NvRQwzkIbrAkImTQ4frv7Y3aMSPZFtHAieGg5hRczpJ1SiXzQo/qLdx1Vf
 LczNyqXhNMsg2yVZA2kAmxbOQ63RGooAUyrPFH5wS+Hn8wuGHeZqPcwE64t9LtNq97Ya
 y1gEBx2+p0wpBFR7EjjNpESj+tTvWkRE9M8/ucS3KjRAyM6r+yjDhSnYWEzLT2yrRyXF
 p/J9arPPsM4AEIiXpHAaonPB4b+qIaskiEwdmfkvIqwsEdyhk7JBYhmbWxKwD+UdMvft
 36VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ax8I8rYKM4hKa/LJED1Fy41aTKRfXHhWe2ILaJfWVR4=;
 b=exFnaIVb5e9qstMPHgyGSgW0eENCq4/I/tw3bK0gqCNLiLCMlh3Q5mWQx4ckuTe7VU
 FwJ1iYqQXYnn+3yeYQflX60qE0z0lsv72y6IMfnL2wt2bsMnKP3CZrU3RmPAZNgWeyTW
 amKpmfcU6aks2Lj7Suz3HP5rJz76bvqZ7WFF3Xq2Dc+EodFIurkNG6bUADQ9zl7wUZU3
 bykGIaGzU+cZVZEh3E8uUmq0JlhnNmnvGpb9M6/CwCA9jdiFfIEsl+aIMxxHdcYV1TcL
 ZKFhPHYyUePAJLumVgVy4PjR70DtNUMpgFmlQhjHX1VmuD2lu6V1/84WoCeeLlsGaEG7
 t7gQ==
X-Gm-Message-State: AOAM5338ZGtJgpwioOsqK63oBhqv2496igdYxxdspAg3yAS5MDXBoB8N
 3Kf4dQiOVbVQ2EfinkfFrGmk3sCmypbw4wQ+9gA=
X-Google-Smtp-Source: ABdhPJyxL8OyMPJYvzvMlDr0XYYcY2x1Tv7C9KMybtcsAaF9gQnsB4XxLBtakgDqQihuf0MsE4J7nI15YeTslVyiML0=
X-Received: by 2002:a05:620a:29d0:: with SMTP id
 s16mr15509411qkp.460.1629120371183; 
 Mon, 16 Aug 2021 06:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210816084855.75586-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210816084855.75586-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 16 Aug 2021 14:25:44 +0100
Message-ID: <CAM0jSHPLAtyYofaLzMsrPsyLX=13UAfw3tzbAQoW+F5+XJgrfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Ditch the i915_gem_ww_ctx loop member
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 ML dri-devel <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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

On Mon, 16 Aug 2021 at 09:49, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> It's only used by the for_i915_gem_ww() macro and we can use
> the (typically) on-stack _err variable in its place.
>
> While initially setting the _err variable to -EDEADLK to enter the
> loop, we clear it before actually entering using fetch_and_zero() to
> avoid empty loops or code not setting the _err variable running forever.
>
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_gem_ww.h | 23 ++++++++---------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i9=
15_gem_ww.h
> index f6b1a796667b..98348b1e6182 100644
> --- a/drivers/gpu/drm/i915/i915_gem_ww.h
> +++ b/drivers/gpu/drm/i915/i915_gem_ww.h
> @@ -7,12 +7,13 @@
>
>  #include <drm/drm_drv.h>
>
> +#include "i915_utils.h"
> +
>  struct i915_gem_ww_ctx {
>         struct ww_acquire_ctx ctx;
>         struct list_head obj_list;
>         struct drm_i915_gem_object *contended;
> -       unsigned short intr;
> -       unsigned short loop;
> +       bool intr;
>  };
>
>  void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
> @@ -23,28 +24,20 @@ void i915_gem_ww_unlock_single(struct drm_i915_gem_ob=
ject *obj);
>  /* Internal functions used by the inlines! Don't use. */
>  static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err=
)
>  {
> -       ww->loop =3D 0;
>         if (err =3D=3D -EDEADLK) {
>                 err =3D i915_gem_ww_ctx_backoff(ww);
>                 if (!err)
> -                       ww->loop =3D 1;
> +                       err =3D -EDEADLK;
>         }
>
> -       if (!ww->loop)
> +       if (err !=3D -EDEADLK)
>                 i915_gem_ww_ctx_fini(ww);
>
>         return err;
>  }
>
> -static inline void
> -__i915_gem_ww_init(struct i915_gem_ww_ctx *ww, bool intr)
> -{
> -       i915_gem_ww_ctx_init(ww, intr);
> -       ww->loop =3D 1;
> -}
> -
> -#define for_i915_gem_ww(_ww, _err, _intr)                      \
> -       for (__i915_gem_ww_init(_ww, _intr); (_ww)->loop;       \
> +#define for_i915_gem_ww(_ww, _err, _intr)                        \
> +       for (i915_gem_ww_ctx_init(_ww, _intr), (_err) =3D -EDEADLK; \
> +            fetch_and_zero(&_err) =3D=3D -EDEADLK;                   \

Doesn't this now hide "normal" errors, like say get_pages() returning
-ENOSPC or so?

>              _err =3D __i915_gem_ww_fini(_ww, _err))
> -
>  #endif
> --
> 2.31.1
>
