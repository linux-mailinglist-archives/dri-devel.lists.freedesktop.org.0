Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD9960556
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E370410E2B8;
	Tue, 27 Aug 2024 09:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="bFbWHobd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9CD10E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 09:17:10 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-829fbde1ee3so2357939f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724750229; x=1725355029;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdMODqh85uSFZ7j3d6O0gNItgJn+faeygZ7qlxL9/8E=;
 b=bFbWHobdZc5+WD5Prb9XcDUVO4zGAcc9mRhu41Z3NqEyGMeIf+S98zEdayxdIfIrp0
 hBH5QBRntSOooRx8JmMp5e8EKKRk7/SNYOm+XNl17CA8xvP26otrw2zUAOeV/bMfUBYT
 aUKqeHJ3E4rDSSRILZsRWvVV00BUfT8J7Wzpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724750229; x=1725355029;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdMODqh85uSFZ7j3d6O0gNItgJn+faeygZ7qlxL9/8E=;
 b=WjHwOUATMpcvGz7OeUX7+oMatYeEwx9UcQ2MD0gt+zen71jQ1x9i0qZlVKvjAD9are
 +83HpXVqjv1npplJusYWwZbdOx9zbdP5BAw989gkhnhkq79LQpguC1Ax5dPZJ+wjhBHM
 Xpc6qjyT7KLo6WgSmLFPM+Es/p36THoPvvaZwTZy/XIKCKrnQlkGy8Lc44Iy+5T6GDog
 61zBSTA/vL6x2GmfYH4N1Q0ZCnwsUSQI0axXXBfm3h4VhVcvE0SswpX6PA0Zst1G1wrF
 d9hwLf6ukUstoiLf6NUK/GsGvM/5/fi2BeX+Np7Bx3NJTlgctpKlNcHZSQtNDJRyeJzY
 HYxw==
X-Gm-Message-State: AOJu0YyDbgIk2R6xQ7znUHmdN1FIn7T/yPEO1+H6XRmnS2RnHJPVLIwt
 FYBW6ujRiFSpabZXYWj2cpmnF5c8TEQJAoCXYAKDuVFz2j3JF2WgQCc9S6B8uBlWOswNNNFJaaf
 ZQJ1Ozs2YX/AmKxyEwPaPpGOotv+U8pTXJVhh
X-Google-Smtp-Source: AGHT+IEF2B0KcCm8AcUmPhOOOimTQQOhUbMObYq1rz+SR4njavyaogDQUT2qrp8CiwU8zfuzCXWIZDvdom9e8SKDWKM=
X-Received: by 2002:a05:6602:1652:b0:81f:a54e:f1eb with SMTP id
 ca18e2360f4ac-827881c318emr1532937639f.17.1724750228971; Tue, 27 Aug 2024
 02:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240827043905.472825-1-zack.rusin@broadcom.com>
In-Reply-To: <20240827043905.472825-1-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Tue, 27 Aug 2024 12:16:58 +0300
Message-ID: <CAKLwHdVTFELspB7oqEBu+ZUbap=1QJLqNR=RLvmN1=gdN3FGAQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Cleanup kms setup without 3d
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, 
 maaz.mombasawala@broadcom.com, stable@vger.kernel.org
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

On Tue, Aug 27, 2024 at 7:39=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com=
> wrote:
>
> Do not validate format equality for the non 3d cases to allow xrgb to
> argb copies and make sure the dx binding flags are only used
> on dx compatible surfaces.
>
> Fixes basic 2d kms setup on configurations without 3d. There's little
> practical benefit to it because kms framebuffer coherence is disabled
> on configurations without 3d but with those changes the code actually
> makes sense.
>
> v2: Remove the now unused format variable
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.9+
> Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> Cc: Martin Krastev <martin.krastev@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c     | 29 -------------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |  9 +++++---
>  2 files changed, 6 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 288ed0bb75cb..282b6153bcdd 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1283,7 +1283,6 @@ static int vmw_kms_new_framebuffer_surface(struct v=
mw_private *dev_priv,
>  {
>         struct drm_device *dev =3D &dev_priv->drm;
>         struct vmw_framebuffer_surface *vfbs;
> -       enum SVGA3dSurfaceFormat format;
>         struct vmw_surface *surface;
>         int ret;
>
> @@ -1320,34 +1319,6 @@ static int vmw_kms_new_framebuffer_surface(struct =
vmw_private *dev_priv,
>                 return -EINVAL;
>         }
>
> -       switch (mode_cmd->pixel_format) {
> -       case DRM_FORMAT_ARGB8888:
> -               format =3D SVGA3D_A8R8G8B8;
> -               break;
> -       case DRM_FORMAT_XRGB8888:
> -               format =3D SVGA3D_X8R8G8B8;
> -               break;
> -       case DRM_FORMAT_RGB565:
> -               format =3D SVGA3D_R5G6B5;
> -               break;
> -       case DRM_FORMAT_XRGB1555:
> -               format =3D SVGA3D_A1R5G5B5;
> -               break;
> -       default:
> -               DRM_ERROR("Invalid pixel format: %p4cc\n",
> -                         &mode_cmd->pixel_format);
> -               return -EINVAL;
> -       }
> -
> -       /*
> -        * For DX, surface format validation is done when surface->scanou=
t
> -        * is set.
> -        */
> -       if (!has_sm4_context(dev_priv) && format !=3D surface->metadata.f=
ormat) {
> -               DRM_ERROR("Invalid surface format for requested mode.\n")=
;
> -               return -EINVAL;
> -       }
> -
>         vfbs =3D kzalloc(sizeof(*vfbs), GFP_KERNEL);
>         if (!vfbs) {
>                 ret =3D -ENOMEM;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 1625b30d9970..5721c74da3e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -2276,9 +2276,12 @@ int vmw_dumb_create(struct drm_file *file_priv,
>         const struct SVGA3dSurfaceDesc *desc =3D vmw_surface_get_desc(for=
mat);
>         SVGA3dSurfaceAllFlags flags =3D SVGA3D_SURFACE_HINT_TEXTURE |
>                                       SVGA3D_SURFACE_HINT_RENDERTARGET |
> -                                     SVGA3D_SURFACE_SCREENTARGET |
> -                                     SVGA3D_SURFACE_BIND_SHADER_RESOURCE=
 |
> -                                     SVGA3D_SURFACE_BIND_RENDER_TARGET;
> +                                     SVGA3D_SURFACE_SCREENTARGET;
> +
> +       if (vmw_surface_is_dx_screen_target_format(format)) {
> +               flags |=3D SVGA3D_SURFACE_BIND_SHADER_RESOURCE |
> +                        SVGA3D_SURFACE_BIND_RENDER_TARGET;
> +       }
>
>         /*
>          * Without mob support we're just going to use raw memory buffer
> --
> 2.43.0
>

LGTM.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
