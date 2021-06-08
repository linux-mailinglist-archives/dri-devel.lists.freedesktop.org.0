Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AF139FD64
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60C36E237;
	Tue,  8 Jun 2021 17:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2486E40D;
 Tue,  8 Jun 2021 17:17:40 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id a15so1622633qtx.13;
 Tue, 08 Jun 2021 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aznicPYlWzblYwpbBQxJra26vLS9OcvKLIk8mTyre7o=;
 b=M+gLlTp/qwD+dj27MsNYAxUaPqORbjyMwsCk6NduTST1d5WKsdVU4sZPeowicI5skX
 vkCzJewXKDFC3B4bc+X8fJG3ECSx+D9iYEN1iX1P/VQoV5g5GbA6SYyDNSsVBEorAq/S
 Et5EwSiAMEWQslNrkG5E2HNU4TTOkzh3B1o64WDQoVrprkETZSLayntr3YewGeoq33B4
 gE494gwYTu5GaCwWI/p1P6s0mZjkx5Gd7eKrRg2QfCf5Drnuy6XLGPsUh7KoQ+T/sEct
 EHahk+dHOI0qIRzvrcVXocND73LbekhT4x3jTvoNXD5YUg4V999lvCRL3vaKT+mcdWMS
 J83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aznicPYlWzblYwpbBQxJra26vLS9OcvKLIk8mTyre7o=;
 b=mh62AEvqkdLP9JDCBuGKWnW95Zs+bo8jQQaX1cKeV3P7uDjHDsi6CG5/ogYZ31iGJi
 jjsz7D5h7z9WweQJefb1p7yfVl6G0QXXyR7E4ZVJpO47hB2o1bqqsGiv1cpTeTn/U+Es
 Lmz+jfNf+E9hMtlQO4a/AlK7EfJZ+YWhomkSNboWSe02YvUbY8aGd2FTmeAcYcz2Ph4m
 Mapm3/m+41soYslnkzstkBZ2mdoz+bU4KFfs+CQ26tZVJTDRZaDq5WNUA6bCwnO0b3RC
 WIJEavLc4s05ZqpjvalOogcZhunsu5iNK1ReGCB2pjgGzJ4Oi55xIX0Htj3CAj0S1bub
 38kQ==
X-Gm-Message-State: AOAM530Nu0IW5lQFBcAaVtWNB4YbsbEJ0nRnFuk0jbF34FU9kWHVjN9j
 xvAvYKDcrFnPbwylgpD+diwVcXiAvS+b2k25W4xySFDJaW31BQ==
X-Google-Smtp-Source: ABdhPJxISsogEgFxZLQo8/XNk3Oh9HabC19tq78iwVb/OUjQIJv7QSOI3pTEakFfbW9qcQPHcafHWSCUPhZAu6dVOps=
X-Received: by 2002:ac8:5c8c:: with SMTP id r12mr3256414qta.265.1623172660137; 
 Tue, 08 Jun 2021 10:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
 <20210608092846.64198-4-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210608092846.64198-4-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 8 Jun 2021 18:17:12 +0100
Message-ID: <CAM0jSHOyOtORECkqjYuiCncj=rFrgUeoXP4DNvxBxkF2nBmFpg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 3/9] drm/i915: Introduce a ww transaction
 helper
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Jun 2021 at 10:29, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Introduce a for_i915_gem_ww(){} utility to help make the code
> around a ww transaction more readable.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_gem_ww.h | 31 +++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i9=
15_gem_ww.h
> index f2d8769e4118..f6b1a796667b 100644
> --- a/drivers/gpu/drm/i915/i915_gem_ww.h
> +++ b/drivers/gpu/drm/i915/i915_gem_ww.h
> @@ -11,11 +11,40 @@ struct i915_gem_ww_ctx {
>         struct ww_acquire_ctx ctx;
>         struct list_head obj_list;
>         struct drm_i915_gem_object *contended;
> -       bool intr;
> +       unsigned short intr;
> +       unsigned short loop;

Why are these now unsigned short?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>  };
>
>  void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
>  void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
>  int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
>  void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
> +
> +/* Internal functions used by the inlines! Don't use. */
> +static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err=
)
> +{
> +       ww->loop =3D 0;
> +       if (err =3D=3D -EDEADLK) {
> +               err =3D i915_gem_ww_ctx_backoff(ww);
> +               if (!err)
> +                       ww->loop =3D 1;
> +       }
> +
> +       if (!ww->loop)
> +               i915_gem_ww_ctx_fini(ww);
> +
> +       return err;
> +}
> +
> +static inline void
> +__i915_gem_ww_init(struct i915_gem_ww_ctx *ww, bool intr)
> +{
> +       i915_gem_ww_ctx_init(ww, intr);
> +       ww->loop =3D 1;
> +}
> +
> +#define for_i915_gem_ww(_ww, _err, _intr)                      \
> +       for (__i915_gem_ww_init(_ww, _intr); (_ww)->loop;       \
> +            _err =3D __i915_gem_ww_fini(_ww, _err))
> +
>  #endif
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
