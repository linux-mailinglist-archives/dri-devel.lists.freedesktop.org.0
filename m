Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F557FAC36
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 22:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0F10E3F6;
	Mon, 27 Nov 2023 21:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF75610E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 21:06:03 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1fa1ec476f1so1677829fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701119163; x=1701723963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t9/UWsX1mLIrdnCN2kgzp4miGSGL5hAGEZ7AwjlRB+0=;
 b=cOTL7mq8Rl/g8NHmvyfdCIdcPxohb+sA+iWJWtzqmRSkY+rnqwBy8Jqx1pjRj4+Pfc
 AwRrRJOe9oYK5NHibh1b9HPngqYQxUeTKSGcdVHvsCFvpGd5n4VR/mdUP43t5Lf0PwIr
 IS565XwG0LbqPD8EMuwrMumBCBYD+EGRcy40Tm+jFCOGZh1YLHMmdmIHXRP82gBq2oTw
 OaG8q3WoOPjmK4La+FqhIYez+5KjGWciVLhAokkVqhhVMjaW6fRMe/J8d2b9+qE3sJxM
 PyjfTY4hR1Lbw6vTP3gsgaQeduZzA362giJzwD5FDY1v9hxh0UPIzJ0amwsnnAgDo8uF
 82Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701119163; x=1701723963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t9/UWsX1mLIrdnCN2kgzp4miGSGL5hAGEZ7AwjlRB+0=;
 b=wAyirH7M5H0M4LPC7idUbIx8W2A3c0uh+FjT2QVK7rv99DF/7CecuvF6tv3EKKDLIr
 Cn9sb49mtfruzJeXSOsvHpwaCfg9vkTXAkpKk0Xonzd9UHsoZq6/EJr8+LiYEIKPOijp
 tSdA8FgjsY7BSPm2P6gLLlCK9e9fSJRCcXgme/lslot0c9Q/j6JJzY3Y2R6r/iu/iXMG
 UB53yiR3h7yl5r4HZutQv9wA1UXJDpM5rXi6DKMhFlY68po/KufoqAV6t7M2L08ZO99x
 bCfKrPvlHRHGTFvDciPYGHZ7lXI5n8NaVsvL+h5K+tAjUr2cp8UFLhi2pkg352B/x7gW
 ofOw==
X-Gm-Message-State: AOJu0Yzh2JVvNNu/bFx/9AWcE3PuqqQWvrwhjHVAtzJ1bwH4nzYWhBU6
 6A2tq36pDcI0Zv9V8VEEuFh81TiCiiOU5fT32uA=
X-Google-Smtp-Source: AGHT+IEQXyjVp3uUE7UqAToyZxZ9fJgQpadluncJ/DIMh+Xk9pSz29tAQc0Fw2uIr1QOQXgacctIF4vrptHL+eY3mP0=
X-Received: by 2002:a05:6870:d911:b0:1f9:48fb:1835 with SMTP id
 gq17-20020a056870d91100b001f948fb1835mr19020764oab.46.1701119163115; Mon, 27
 Nov 2023 13:06:03 -0800 (PST)
MIME-Version: 1.0
References: <20231122122449.11588-1-tzimmermann@suse.de>
 <20231122122449.11588-12-tzimmermann@suse.de>
In-Reply-To: <20231122122449.11588-12-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Nov 2023 16:05:51 -0500
Message-ID: <CADnq5_OMZbNOD-GY8aek+4sL6fKqTbHpoU81cS3vtb6GAC3pHw@mail.gmail.com>
Subject: Re: [PATCH 11/14] drm: Remove locking for legacy ioctls and
 DRM_UNLOCKED
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, cai.huoqing@linux.dev, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 7:25=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Modern DRM drivers acquire ioctl locks by themselves. Legacy ioctls
> for user-space mode setting used to acquire drm_global_mutex. After
> removing the ioctl entry points, also remove the locking code. The only
> legacy ioctl without global locking was VBLANK_WAIT, which has been
> removed as well. Hence remove the related DRM_UNLOCKED flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_ioc32.c |  2 +-
>  drivers/gpu/drm/drm_ioctl.c | 23 +++++++----------------
>  include/drm/drm_ioctl.h     | 11 -----------
>  3 files changed, 8 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
> index 910cadf14756e..129e2b91dbfe7 100644
> --- a/drivers/gpu/drm/drm_ioc32.c
> +++ b/drivers/gpu/drm/drm_ioc32.c
> @@ -273,7 +273,7 @@ static int compat_drm_wait_vblank(struct file *file, =
unsigned int cmd,
>         req.request.type =3D req32.request.type;
>         req.request.sequence =3D req32.request.sequence;
>         req.request.signal =3D req32.request.signal;
> -       err =3D drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_U=
NLOCKED);
> +       err =3D drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, 0);
>
>         req32.reply.type =3D req.reply.type;
>         req32.reply.sequence =3D req.reply.sequence;
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 9c6326b908e74..1cf1de342d6aa 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -583,7 +583,7 @@ static const struct drm_ioctl_desc drm_ioctls[] =3D {
>
>         DRM_IOCTL_DEF(DRM_IOCTL_FINISH, drm_noop, DRM_AUTH),
>
> -       DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, DRM_U=
NLOCKED),
> +       DRM_IOCTL_DEF(DRM_IOCTL_WAIT_VBLANK, drm_wait_vblank_ioctl, 0),
>
>         DRM_IOCTL_DEF(DRM_IOCTL_UPDATE_DRAW, drm_noop, DRM_AUTH|DRM_MASTE=
R|DRM_ROOT_ONLY),
>
> @@ -716,7 +716,7 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_t =
*func, void *kdata,
>  {
>         struct drm_file *file_priv =3D file->private_data;
>         struct drm_device *dev =3D file_priv->minor->dev;
> -       int retcode;
> +       int ret;
>
>         /* Update drm_file owner if fd was passed along. */
>         drm_file_update_pid(file_priv);
> @@ -724,20 +724,11 @@ long drm_ioctl_kernel(struct file *file, drm_ioctl_=
t *func, void *kdata,
>         if (drm_dev_is_unplugged(dev))
>                 return -ENODEV;
>
> -       retcode =3D drm_ioctl_permit(flags, file_priv);
> -       if (unlikely(retcode))
> -               return retcode;
> -
> -       /* Enforce sane locking for modern driver ioctls. */
> -       if (likely(!drm_core_check_feature(dev, DRIVER_LEGACY)) ||
> -           (flags & DRM_UNLOCKED))
> -               retcode =3D func(dev, kdata, file_priv);
> -       else {
> -               mutex_lock(&drm_global_mutex);
> -               retcode =3D func(dev, kdata, file_priv);
> -               mutex_unlock(&drm_global_mutex);
> -       }
> -       return retcode;
> +       ret =3D drm_ioctl_permit(flags, file_priv);
> +       if (unlikely(ret))
> +               return ret;
> +
> +       return func(dev, kdata, file_priv);
>  }
>  EXPORT_SYMBOL(drm_ioctl_kernel);
>
> diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
> index 6ed61c371f6ce..171760b6c4a14 100644
> --- a/include/drm/drm_ioctl.h
> +++ b/include/drm/drm_ioctl.h
> @@ -109,17 +109,6 @@ enum drm_ioctl_flags {
>          * This is equivalent to callers with the SYSADMIN capability.
>          */
>         DRM_ROOT_ONLY           =3D BIT(2),
> -       /**
> -        * @DRM_UNLOCKED:
> -        *
> -        * Whether &drm_ioctl_desc.func should be called with the DRM BKL=
 held
> -        * or not. Enforced as the default for all modern drivers, hence =
there
> -        * should never be a need to set this flag.
> -        *
> -        * Do not use anywhere else than for the VBLANK_WAIT IOCTL, which=
 is the
> -        * only legacy IOCTL which needs this.
> -        */
> -       DRM_UNLOCKED            =3D BIT(4),
>         /**
>          * @DRM_RENDER_ALLOW:
>          *
> --
> 2.42.1
>
