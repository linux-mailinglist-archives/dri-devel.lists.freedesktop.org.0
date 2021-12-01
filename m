Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6694650F5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10EE6E927;
	Wed,  1 Dec 2021 15:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C5F6E927;
 Wed,  1 Dec 2021 15:07:59 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id l8so24310371qtk.6;
 Wed, 01 Dec 2021 07:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uHBn4fMc9zNgwGNibCQstuDT+KOctW9FPdsBc/74IZA=;
 b=R7W5cQVmOzkCy4vdezVw2fD+Usma4S/vh1hIsgcHho9rNfCQNvYpqNP342lmKoQV7R
 E6znTHanuK11XQG8OMvCIXKiS2CeNFrrNh9eaTC9NHyMUY4k/4BRTO7MegsypHmnKsk6
 FnKeLlS0xfJK/RBzKX950nIP1dQD3tR+K2qOieGLSDAJBpwOUD4I/UFKhBst2GGbsATm
 xEty9IUdelaj8RcEOXMDm/n/WpQWcwPg7913/uS2DCcEKw0ITCcMNiD9q0zNSuvDn+ui
 WqOvaToopg90Pv76fKd4g2dTaqys6Pgzl3p9AiKoqJwPcn1KpwCp8579Wjo4GQ0ap40y
 g9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uHBn4fMc9zNgwGNibCQstuDT+KOctW9FPdsBc/74IZA=;
 b=RvR+NrPKKa3/fPKY11Gq5Jkh1ZpVJc3nd0Qk6menZ2/UmDatUXmfcvWk64aifTf471
 m+uC6tzAlPvbRvCAA9dUTjAIBPNVWC4UYIM6WC3pDbfJ4ISwZEqESsKGkDrQd1z9IU5p
 oi6EbH+YSs+WH1W4IxaJZuxzMZm/ur5TQqk/Qe0VxX2BjVTnOnh2i5IWTKVhJot4Zaca
 Irypi9U5CKSYfALiB6SRnKhDmn2PT9GAn7iHYpzRtPtb3/1ECiwfCiLf1m0mkOKW/6MJ
 ZQgKZX8/ue5VtWMVC4tEOj2gp54h5Eul88/Wy7eu8ME3SJEIjlWaA06txoAdV4tLWXuv
 YMIw==
X-Gm-Message-State: AOAM532BvnnKZSO/B1kdSqfSxWcGirsnuItNUo84wCG0c9bYeWQ75oa9
 GxjcWCGPwAiJPS7+RAF/lXtIht8iWAGR+HhHwPbkRkH7+3g=
X-Google-Smtp-Source: ABdhPJyXXQJPA8CW8ybB9dUwY17jKVYrdqMukindK+W3MKGmdTURUt14UFIpLaJR0cSRlFVua9eCcCScXRsVJE2F4BM=
X-Received: by 2002:ac8:5bd6:: with SMTP id b22mr7371239qtb.231.1638371278684; 
 Wed, 01 Dec 2021 07:07:58 -0800 (PST)
MIME-Version: 1.0
References: <20211129134735.628712-6-maarten.lankhorst@linux.intel.com>
 <20211130092055.679740-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20211130092055.679740-1-maarten.lankhorst@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 1 Dec 2021 15:07:32 +0000
Message-ID: <CAM0jSHNfQZpT-mQpqohNGgunbtxh_tsibQRM1H-Yp2XcyUT4zQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Force ww lock for i915_gem_object_ggtt_pin_ww,
 v2.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 30 Nov 2021 at 09:21, Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> We will need the lock to unbind the vma, and wait for bind to complete.
> Remove the special casing for the !ww path, and force ww locking for all.
>
> Changes since v1:
> - Pass err to for_i915_gem_ww handling for -EDEADLK handling.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_drv.h |  7 ++-----
>  drivers/gpu/drm/i915/i915_gem.c | 30 ++++++++++++++++++++++++++----
>  2 files changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 1bfadd9127fc..8322abe194da 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1842,13 +1842,10 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>                             const struct i915_ggtt_view *view,
>                             u64 size, u64 alignment, u64 flags);
>
> -static inline struct i915_vma * __must_check
> +struct i915_vma * __must_check
>  i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
>                          const struct i915_ggtt_view *view,
> -                        u64 size, u64 alignment, u64 flags)
> -{
> -       return i915_gem_object_ggtt_pin_ww(obj, NULL, view, size, alignment, flags);
> -}
> +                        u64 size, u64 alignment, u64 flags);
>
>  int i915_gem_object_unbind(struct drm_i915_gem_object *obj,
>                            unsigned long flags);
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 527228d4da7e..6002045bd194 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -877,6 +877,8 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>         struct i915_vma *vma;
>         int ret;
>
> +       GEM_WARN_ON(!ww);

Return something here, or GEM_BUG_ON()? I assume it's going to crash
and burn anyway?

> +
>         if (flags & PIN_MAPPABLE &&
>             (!view || view->type == I915_GGTT_VIEW_NORMAL)) {
>                 /*
> @@ -936,10 +938,7 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>                         return ERR_PTR(ret);
>         }
>
> -       if (ww)
> -               ret = i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
> -       else
> -               ret = i915_vma_pin(vma, size, alignment, flags | PIN_GLOBAL);
> +       ret = i915_vma_pin_ww(vma, ww, size, alignment, flags | PIN_GLOBAL);
>
>         if (ret)
>                 return ERR_PTR(ret);
> @@ -959,6 +958,29 @@ i915_gem_object_ggtt_pin_ww(struct drm_i915_gem_object *obj,
>         return vma;
>  }
>
> +struct i915_vma * __must_check
> +i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
> +                        const struct i915_ggtt_view *view,
> +                        u64 size, u64 alignment, u64 flags)
> +{
> +       struct i915_gem_ww_ctx ww;
> +       struct i915_vma *ret;
> +       int err;
> +
> +       for_i915_gem_ww(&ww, err, true) {
> +               err = i915_gem_object_lock(obj, &ww);
> +               if (err)
> +                       continue;
> +
> +               ret = i915_gem_object_ggtt_pin_ww(obj, &ww, view, size,
> +                                                 alignment, flags);
> +               if (IS_ERR(ret))
> +                       err = PTR_ERR(ret);

Maybe s/ret/vma/ ? Seeing ret makes me think it's an integer.

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +       }
> +
> +       return err ? ERR_PTR(err) : ret;
> +}
> +
>  int
>  i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
>                        struct drm_file *file_priv)
> --
> 2.34.1
>
