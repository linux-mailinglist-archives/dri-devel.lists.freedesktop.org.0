Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC42FD0F6
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 14:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B706E140;
	Wed, 20 Jan 2021 13:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF2D6E140
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 13:01:37 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id r189so15263369oih.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 05:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=evwLpKMs/Q04HfoyBMd6+/dktMNHRP3J0svCExuNnHQ=;
 b=gjoMlQDXxoLKyVqfmWYc+fQsUBlfTlV9o5PJnH+Fw3wT6GK9N8OlzvgssUU0vb0fZH
 lnyuUY13b3P8wylC1s1XZ51WGymbIFWbcPL/0lXA0Z7SliOOw3K8jFrpKcp+79daAMjG
 3G0usdR1gu6MsBvz81d0Wq6+o038KK/qKvaQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=evwLpKMs/Q04HfoyBMd6+/dktMNHRP3J0svCExuNnHQ=;
 b=CFPi6oeaWQgUr2FWFPPwBSJOkBREib3A2hs/DV11U+c6JNPJBopBHGnVvkfBi8hBpE
 C29RTvD1aXtGR7JBeKsmwuWweoVX5rLJLurFv7heXMvTzJ4ysYqKl7PdaGi1FXo9iv8q
 Dm+kj5Wqgy1qOZ9utzBz/6jUvUKyhTZeBVwQ//7ID/B3mI3YBOSP148xxGAUbB4osTyk
 cEK3/S0NEfMTUDfDbp88zZZb9MBZ1+2kWruiVTO7Swt2LjqomIO2YFVmsb+98t8Ru5yK
 /+khPfi/BZRxODeKJlM9+t4zA0n+35kIiukQfRJN/BLX/QZFsErOxDlc81JuLi7Swq7S
 F0kA==
X-Gm-Message-State: AOAM532H7q4VIfNVkZCxa6Etb9KqhU4ZTBaifDrW2fRHtarU7P6GrHUS
 d3242hPQ9Oz4+Wm73coT9LZHr1N5JFugYwD3z5XyM/IKc9c=
X-Google-Smtp-Source: ABdhPJysT1Qy1MoMTRm8ql1bbsTkrvfGzeuP7tdOfKNPpJBmNa21UPEZGnfc3jKm9tHnbkwY1t4S/wSfEQIfR+Gs4/k=
X-Received: by 2002:aca:1906:: with SMTP id l6mr2714101oii.101.1611147697279; 
 Wed, 20 Jan 2021 05:01:37 -0800 (PST)
MIME-Version: 1.0
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-3-paul@crapouillou.net>
In-Reply-To: <20210120123535.40226-3-paul@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 14:01:26 +0100
Message-ID: <CAKMK7uFaP7xcw90=KqiGJd7Mt-gD-spvcxvOZr2Txhyv5vcBvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/ingenic: Register devm action to cleanup
 encoders
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 1:36 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Since the encoders have been devm-allocated, they will be freed way
> before drm_mode_config_cleanup() is called. To avoid use-after-free
> conditions, we then must ensure that drm_encoder_cleanup() is called
> before the encoders are freed.
>
> v2: Use the new __drmm_simple_encoder_alloc() function
>
> Fixes: c369cb27c267 ("drm/ingenic: Support multiple panels/bridges")
> Cc: <stable@vger.kernel.org> # 5.8+
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>
> Notes:
>     Use the V1 of this patch to fix v5.11 and older kernels. This V2 only
>     applies on the current drm-misc-next branch.
>
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 7bb31fbee29d..158433b4c084 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1014,20 +1014,18 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>                         bridge = devm_drm_panel_bridge_add_typed(dev, panel,
>                                                                  DRM_MODE_CONNECTOR_DPI);
>
> -               encoder = devm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
> -               if (!encoder)
> -                       return -ENOMEM;
> +               encoder = __drmm_simple_encoder_alloc(drm, sizeof(*encoder), 0,

Please don't use the __ prefixed functions, those are the internal
ones. The official one comes with type checking and all that included.
Otherwise lgtm.
-Daniel

> +                                                     DRM_MODE_ENCODER_DPI);
> +               if (IS_ERR(encoder)) {
> +                       ret = PTR_ERR(encoder);
> +                       dev_err(dev, "Failed to init encoder: %d\n", ret);
> +                       return ret;
> +               }
>
>                 encoder->possible_crtcs = 1;
>
>                 drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
>
> -               ret = drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DPI);
> -               if (ret) {
> -                       dev_err(dev, "Failed to init encoder: %d\n", ret);
> -                       return ret;
> -               }
> -
>                 ret = drm_bridge_attach(encoder, bridge, NULL, 0);
>                 if (ret) {
>                         dev_err(dev, "Unable to attach bridge\n");
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
