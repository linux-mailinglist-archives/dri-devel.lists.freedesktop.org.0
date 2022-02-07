Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3124AC97C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 20:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2841C10F8E7;
	Mon,  7 Feb 2022 19:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D3510F8ED
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 19:27:36 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id n6so3910477qvk.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 11:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hm57uy/Nd677bwlIul9LMmgkSXxusznQLNZIk/zF7mk=;
 b=Z8P8BogEuGYrnQOsoaZo4FqgmKwU03E+LSzGVgvZsuwmIyb1YH+mOPncQpb3blKUe1
 49RwxUTTFVJo0yuIMg/Ff1ptJq36fP9L/y6CqnF6CBtJcTvxfeg1ubcKT4W3n0uJqrma
 IEiQCNi1EyxjkPRyxIQnI5IsV4/Nd2eCj7FI2bDfqa5LrPnXMKpFVI/IlDpMVukkOW5O
 Srt15QSykptppwxuXGyZ3jBhFQs5Ihe5DgRuQRG8MTqs5IB8LqYc6+OpP5x6ej9c7Azq
 HZMrwp3JP4c9F6CH+K3aevsTagwybc7h5z+xm/rT4/B+Z91JxflKgDnjbUFw8+5RZYYl
 Tx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hm57uy/Nd677bwlIul9LMmgkSXxusznQLNZIk/zF7mk=;
 b=dOTw13fx+PgmTzUntim+BAB21R8HSF45av0zN5dJDKd2aP1WKTAop7gZSaM9eWQ9Ui
 dYWc1GRCb9JpHVrK4x80aqr4QBdGiyZf+UdM6G+WFrCxySxQJ9nd5tmr1bgZPNiEN8SV
 vYxetXxTKBq1GpCSdb1zN84YdICZ5VfYQtnELC5UI4YtmoAWE9YjkfhREofBb4NYNuUl
 /kZhjvRQKG4sgkFHpBeNjpP+2crHUFQ6ffIuJtc8J+fr/QSouUKLlhS1ITwNsDsbpNYV
 qSHjwG1rNGtti/CgbxKzRthrTZgEzasdoLsi4oL8M655ly2iS5XZ0CPewQbCzPb52KeM
 KscQ==
X-Gm-Message-State: AOAM5337Y43/hlQ0ttUR3rLAXw+aS5T+ebx5MVlzk4utdn8HimE+t/Sl
 qP3EsvE0jcVOXESQWI5Ln42ld4VM/+hWi0mq/mmWoA==
X-Google-Smtp-Source: ABdhPJw2jSbMKuGGtQ/seo/5L11q90dX9vNtXHOrb1VOFzLLm2Y/rcbvKe0P0chACfB+SmYR9F3t5NoLBi8xnBja5os=
X-Received: by 2002:a05:6214:2aa2:: with SMTP id
 js2mr828371qvb.55.1644262055133; 
 Mon, 07 Feb 2022 11:27:35 -0800 (PST)
MIME-Version: 1.0
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-5-maxime@cerno.tech>
In-Reply-To: <20220207163515.1038648-5-maxime@cerno.tech>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 7 Feb 2022 22:27:24 +0300
Message-ID: <CAA8EJpr-dx5So=w+NvdtSeB4KBVMySc+KT54bMX9p_0ZV52jAg@mail.gmail.com>
Subject: Re: [PATCH 04/23] drm/msm/mdp5: Fix zpos initial value mismatch
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
Cc: Sean Paul <sean@poorly.run>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 7 Feb 2022 at 19:56, Maxime Ripard <maxime@cerno.tech> wrote:
>
> While the mdp5_plane_install_properties() function calls
> drm_plane_create_zpos_property() with an initial value of 1,
> mdp5_plane_reset() will force it to another value depending on the plane
> type.
>
> Fix the discrepancy by setting the initial zpos value to the same value
> in the drm_plane_create_zpos_property() call.

Could you please squash two msm/mdp5 patches into a single patch,
making it clear that the code is moved.

Also please add:
Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")

With that in place:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69afcbac8..d60982f4bd11 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -48,6 +48,8 @@ static void mdp5_plane_destroy(struct drm_plane *plane)
>  static void mdp5_plane_install_properties(struct drm_plane *plane,
>                 struct drm_mode_object *obj)
>  {
> +       unsigned int zpos;
> +
>         drm_plane_create_rotation_property(plane,
>                                            DRM_MODE_ROTATE_0,
>                                            DRM_MODE_ROTATE_0 |
> @@ -59,7 +61,12 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
>                         BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>                         BIT(DRM_MODE_BLEND_PREMULTI) |
>                         BIT(DRM_MODE_BLEND_COVERAGE));
> -       drm_plane_create_zpos_property(plane, 1, 1, 255);
> +
> +       if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +               zpos = STAGE_BASE;
> +       else
> +               zpos = STAGE0 + drm_plane_index(plane);
> +       drm_plane_create_zpos_property(plane, zpos, 1, 255);
>  }
>
>  static void
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
