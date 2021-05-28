Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C924394B8F
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 12:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EC76E1B8;
	Sat, 29 May 2021 10:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46AB6F627
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 20:41:44 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d16so4091779pfn.12
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dWylf11sBI6NHMXAlL1Myy7IBhthqrQbFB/TTGfNsu4=;
 b=QTT7CKfOBctf/QklY+VuaKaCG4W+5fRQrs+7pOENtX0AgzqNXNBxApAzYHVpDp4po3
 cUJq+wSmes5qa6GSR+MQXCVW6TSs77BWVBxy9Te97vFRCJaC44yFEAkFkvIHXVCKNqmj
 vUfZkY8m2iMOGQ+OWqcw7A0qgMMo5E4Ky6yx/PPmHXnwsta4UvCeYZyAipiiGYmbiucj
 XSd59Zeloe0SWWbcgjk0n3LkTPjP38L27WiM44/9YJp3ZJ4Ml154RS7lH8iC3kgEwS17
 Jtwpth7nQ9FJsvtfNRLyFEqU79bCoGWKL9RPF69hwReojyw9RS0t0lZS90ciofwsWq5L
 Os8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dWylf11sBI6NHMXAlL1Myy7IBhthqrQbFB/TTGfNsu4=;
 b=qaTo4Z0q6Iac3VP4p44dIFcqQLiZhfWUi/ZCnbv1MRCRjOGT0aFLfGMVsGUiDmyaxf
 kH1hMgNLxFrYFCOsBRfZzlra/Sk5o5qcVSF+hCaf/g0TdfL1o4aT/TwDUTzW7PvuUS7Q
 UPN7RBwOJtEkqMkaCuY5jcK2p2LBWtsrrFO8x8O6n0weGceANHN4esish3v2HyF5aIgh
 U7L6A2KfFGezpJKWVVF75sXgfIAhK44J3zMw/7t87nlpcloZZL9piKndbyWNvO/Le+2y
 WaJho3eFVhyW9qF/XKR6X1F8rv7D+Vz2SPAfVd04jBZc1RtTh5k/kDrE9ch3+v15TUxN
 G1sw==
X-Gm-Message-State: AOAM532Mdb6OOXllNrmQJCiHVGwha+aVOuQ3xNTdi67XxAoCHp408I0C
 oOshVxdmftDPbQ/+Z2LsXqAP/R/3S12BfqT8gyc=
X-Google-Smtp-Source: ABdhPJxjKySbjQC4dWE1MMsyN1uUqOjnZnRWr7dwYle9MVt4Kp7uSzKwgCMg/s3bFYJ9BvjdQ3WvpuXHg6qqTGr/YLg=
X-Received: by 2002:a65:4d03:: with SMTP id i3mr10776572pgt.422.1622234504448; 
 Fri, 28 May 2021 13:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210528203036.17999-1-r.stratiienko@gmail.com>
 <20210528203036.17999-3-r.stratiienko@gmail.com>
In-Reply-To: <20210528203036.17999-3-r.stratiienko@gmail.com>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Fri, 28 May 2021 23:41:33 +0300
Message-ID: <CAGphcdk8Zg0PbG+dNmaXa8db0QWFXED7X5vQNURe2R7aEo_TRA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/sun4i: Use CRTC size instead of primary plane
 size as mixer frame
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 29 May 2021 10:14:11 +0000
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
Cc: Ondrej Jirman <megous@megous.com>, linux-sunxi@googlegroups.com,
 jernej.skrabec@gmail.com, wens@csie.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+CC: jernej.skrabec@gmail.com

=D0=BF=D1=82, 28 =D0=BC=D0=B0=D1=8F 2021 =D0=B3. =D0=B2 23:31, Roman Strati=
ienko <r.stratiienko@gmail.com>:
>
> Fixes corrupted display picture when primary plane isn't full-screen.
>
> Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 28 ++++++++++++++++++++++++
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 30 --------------------------
>  2 files changed, 28 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 5b42cf25cc86..810c731566c0 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -248,6 +248,33 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw=
_format)
>         return -EINVAL;
>  }
>
> +static void sun8i_mode_set(struct sunxi_engine *engine,
> +                          struct drm_display_mode *mode)
> +{
> +       u32 size =3D SUN8I_MIXER_SIZE(mode->crtc_hdisplay, mode->crtc_vdi=
splay);
> +       struct sun8i_mixer *mixer =3D engine_to_sun8i_mixer(engine);
> +       u32 bld_base =3D sun8i_blender_base(mixer);
> +       u32 val;
> +
> +       DRM_DEBUG_DRIVER("Mode change, updating global size W: %u H: %u\n=
",
> +                        mode->crtc_hdisplay, mode->crtc_vdisplay);
> +       regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
> +       regmap_write(mixer->engine.regs,
> +                    SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
> +
> +       if (mode->flags & DRM_MODE_FLAG_INTERLACE)
> +               val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> +       else
> +               val =3D 0;
> +
> +       regmap_update_bits(mixer->engine.regs,
> +                          SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> +                          SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> +                          val);
> +       DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
> +                        val ? "on" : "off");
> +}
> +
>  static void sun8i_mixer_commit(struct sunxi_engine *engine)
>  {
>         DRM_DEBUG_DRIVER("Committing changes\n");
> @@ -301,6 +328,7 @@ static struct drm_plane **sun8i_layers_init(struct dr=
m_device *drm,
>  static const struct sunxi_engine_ops sun8i_engine_ops =3D {
>         .commit         =3D sun8i_mixer_commit,
>         .layers_init    =3D sun8i_layers_init,
> +       .mode_set       =3D sun8i_mode_set,
>  };
>
>  static const struct regmap_config sun8i_mixer_regmap_config =3D {
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_ui_layer.c
> index 0db164a774a1..d66fff582278 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -120,36 +120,6 @@ static int sun8i_ui_layer_update_coord(struct sun8i_=
mixer *mixer, int channel,
>         insize =3D SUN8I_MIXER_SIZE(src_w, src_h);
>         outsize =3D SUN8I_MIXER_SIZE(dst_w, dst_h);
>
> -       if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> -               bool interlaced =3D false;
> -               u32 val;
> -
> -               DRM_DEBUG_DRIVER("Primary layer, updating global size W: =
%u H: %u\n",
> -                                dst_w, dst_h);
> -               regmap_write(mixer->engine.regs,
> -                            SUN8I_MIXER_GLOBAL_SIZE,
> -                            outsize);
> -               regmap_write(mixer->engine.regs,
> -                            SUN8I_MIXER_BLEND_OUTSIZE(bld_base), outsize=
);
> -
> -               if (state->crtc)
> -                       interlaced =3D state->crtc->state->adjusted_mode.=
flags
> -                               & DRM_MODE_FLAG_INTERLACE;
> -
> -               if (interlaced)
> -                       val =3D SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
> -               else
> -                       val =3D 0;
> -
> -               regmap_update_bits(mixer->engine.regs,
> -                                  SUN8I_MIXER_BLEND_OUTCTL(bld_base),
> -                                  SUN8I_MIXER_BLEND_OUTCTL_INTERLACED,
> -                                  val);
> -
> -               DRM_DEBUG_DRIVER("Switching display mixer interlaced mode=
 %s\n",
> -                                interlaced ? "on" : "off");
> -       }
> -
>         /* Set height and width */
>         DRM_DEBUG_DRIVER("Layer source offset X: %d Y: %d\n",
>                          state->src.x1 >> 16, state->src.y1 >> 16);
> --
> 2.30.2
>
