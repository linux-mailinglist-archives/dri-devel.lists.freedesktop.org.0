Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769554B4EA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 17:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137621127BA;
	Tue, 14 Jun 2022 15:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98211127BF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 15:42:53 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gl15so17995832ejb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCcwcfOJ12pm+gzrryCFOszbvk4JlPOC3UPDeSOXNZ8=;
 b=S34tQ7JU4QwtT0IovN5Y0xphI2dnKGJY0g7bw0C3CfYSAgDl5DC1IvMohcSwwRtX3g
 XKjySgDdXBGwvmgtrZomIZZLoBhMgE24JvEnHxkLDgFrrDu0E33J0qNNO5q24oX3rRcD
 D1cQbKKIPUvRx2wuh3yVCpWgPGYYKLMwViljU6G2q2WN27yx7ZPFfJvISmI5x+vac7RO
 u0SCjIu35AS1gOQ67WXy6veDMvZs5d5trMytTmpv3GrZnXX9F24Ps3F5mnbxM0i09qH9
 m7Ccy8GFOUL0Nkgf3gj+pBSAeL1l7oOb0Dh6RIYBBnCfoQyeZxWC5yAi+DYhFvwM+RDt
 Mm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCcwcfOJ12pm+gzrryCFOszbvk4JlPOC3UPDeSOXNZ8=;
 b=T8214dU9tnytB6UED3weFLmCXymefzO3e2rJVzecvD5CeUE/iTXz5lbb/YWhjR2/my
 zbXXpNkRCwetpI7f88aWXJe81i7gNdtkSmBjzWUU4OnS/cSkYOgqtDwQcfsV5TadJuD5
 LqjFtUX/an+GY+jyIQRlxHmrr59ljTNwaOQGPpUuDA7oLSR5VQAlfwhwX83eHsZmecBQ
 U4Sxu47fwpxBAjd3FWjiPTW8tr2d6O17/Ob6ZYqDmwYggybQgl2AHxcFSMlRN6u/pcme
 bITE30kt3wANyBNnztnwf2LPaPut0p5Psn3pYxBvQCleDVzHZQt1td85l6/sAoTqXQA1
 K3+g==
X-Gm-Message-State: AJIora9LhmXDVbhyU0GYElX3aBjWHJ86/BYmV8TkaP4VKbR9Guz4E1PL
 vKOiNbFP80VadvudE90ibwb6uhph75jflDNaeSyBvA==
X-Google-Smtp-Source: AGRyM1sd/M/l+6HE3/ChK+7o+EVU6O9FTVIIviYSlX+X/7TizS0iWcmy4O1MPlE5djvmeBEkeAvqynnh3/g6elReAAk=
X-Received: by 2002:a17:906:5055:b0:6ff:1dfb:1e2c with SMTP id
 e21-20020a170906505500b006ff1dfb1e2cmr4884773ejk.200.1655221372202; Tue, 14
 Jun 2022 08:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-17-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-17-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 16:42:36 +0100
Message-ID: <CAPY8ntDf0qPHY0AfWab17riRPHQHtEFOaz3tg4RV1XojcT0e9A@mail.gmail.com>
Subject: Re: [PATCH 16/64] drm/vc4: plane: Switch to
 drmm_universal_plane_alloc()
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Let's switch to drmm_universal_plane_alloc() for our plane allocation and
> initialisation to make the driver a bit simpler.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c  | 12 +-----------
>  drivers/gpu/drm/vc4/vc4_plane.c | 23 ++++++++---------------
>  2 files changed, 9 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 840a93484bb1..7163f924b48b 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -1176,7 +1176,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
>         const struct vc4_pv_data *pv_data;
>         struct vc4_crtc *vc4_crtc;
>         struct drm_crtc *crtc;
> -       struct drm_plane *destroy_plane, *temp;
>         int ret;
>
>         vc4_crtc = devm_kzalloc(dev, sizeof(*vc4_crtc), GFP_KERNEL);
> @@ -1211,7 +1210,7 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
>                                IRQF_SHARED,
>                                "vc4 crtc", vc4_crtc);
>         if (ret)
> -               goto err_destroy_planes;
> +               return ret;
>
>         platform_set_drvdata(pdev, vc4_crtc);
>
> @@ -1219,15 +1218,6 @@ static int vc4_crtc_bind(struct device *dev, struct device *master, void *data)
>                                  &vc4_crtc->regset);
>
>         return 0;
> -
> -err_destroy_planes:
> -       list_for_each_entry_safe(destroy_plane, temp,
> -                                &drm->mode_config.plane_list, head) {
> -               if (destroy_plane->possible_crtcs == drm_crtc_mask(crtc))
> -                   destroy_plane->funcs->destroy(destroy_plane);
> -       }
> -
> -       return ret;
>  }
>
>  static void vc4_crtc_unbind(struct device *dev, struct device *master,
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 17dab470ecdf..673c963f5c5a 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1442,8 +1442,6 @@ static bool vc4_format_mod_supported(struct drm_plane *plane,
>  static const struct drm_plane_funcs vc4_plane_funcs = {
>         .update_plane = drm_atomic_helper_update_plane,
>         .disable_plane = drm_atomic_helper_disable_plane,
> -       .destroy = drm_plane_cleanup,
> -       .set_property = NULL,
>         .reset = vc4_plane_reset,
>         .atomic_duplicate_state = vc4_plane_duplicate_state,
>         .atomic_destroy_state = vc4_plane_destroy_state,
> @@ -1454,11 +1452,10 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>                                  enum drm_plane_type type,
>                                  unsigned int possible_crtcs)
>  {
> -       struct drm_plane *plane = NULL;
> +       struct drm_plane *plane;
>         struct vc4_plane *vc4_plane;
>         u32 formats[ARRAY_SIZE(hvs_formats)];
>         int num_formats = 0;
> -       int ret = 0;
>         unsigned i;
>         bool hvs5 = of_device_is_compatible(dev->dev->of_node,
>                                             "brcm,bcm2711-vc5");
> @@ -1471,11 +1468,6 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>                 DRM_FORMAT_MOD_INVALID
>         };
>
> -       vc4_plane = devm_kzalloc(dev->dev, sizeof(*vc4_plane),
> -                                GFP_KERNEL);
> -       if (!vc4_plane)
> -               return ERR_PTR(-ENOMEM);
> -
>         for (i = 0; i < ARRAY_SIZE(hvs_formats); i++) {
>                 if (!hvs_formats[i].hvs5_only || hvs5) {
>                         formats[num_formats] = hvs_formats[i].drm;
> @@ -1483,13 +1475,14 @@ struct drm_plane *vc4_plane_init(struct drm_device *dev,
>                 }
>         }
>
> +       vc4_plane = drmm_universal_plane_alloc(dev, struct vc4_plane, base,
> +                                              possible_crtcs,
> +                                              &vc4_plane_funcs,
> +                                              formats, num_formats,
> +                                              modifiers, type, NULL);
> +       if (IS_ERR(vc4_plane))
> +               return ERR_CAST(vc4_plane);
>         plane = &vc4_plane->base;
> -       ret = drm_universal_plane_init(dev, plane, possible_crtcs,
> -                                      &vc4_plane_funcs,
> -                                      formats, num_formats,
> -                                      modifiers, type, NULL);
> -       if (ret)
> -               return ERR_PTR(ret);
>
>         drm_plane_helper_add(plane, &vc4_plane_helper_funcs);
>
> --
> 2.36.1
>
