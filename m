Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7411762B4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 19:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA256E7D7;
	Mon,  2 Mar 2020 18:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA9B6E7D7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 18:30:14 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id t12so561096vso.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 10:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fhVwHI4m+NKWdq6UEqPXB0tScwvkrZZVfitMyB5ousc=;
 b=V+d+kvG4Xs946xPXOO9vu1l1j4QPYW+StJFdPGouLeZzguRNcFs0a3Ik2oZ1Pc36+d
 j6kDk3qbNqXp5x0YNJWGOmypJdg8Dguc1+U4LKyvRjpWody7zXQV26s3A9mdGUjRr449
 GyWLsPDn1VvifXkhRQL2JrzK/dro2kKqvq8XNC1tZkLrB8E0A3ZXMbteaQtUmOUczqWc
 jxyXcWENv2uY7nY2M83VQ4sBM+MI0cHtHzXrcdiPxqgWIm5ZounAyzqwIQaWfr5Otm2r
 eSs2sgVtwo9w2xvvzNYy1kXwQUvJEsl8teBJL87jcvcg1HaXEBeWhLwFsxRp/GKlHx6j
 q/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fhVwHI4m+NKWdq6UEqPXB0tScwvkrZZVfitMyB5ousc=;
 b=dNtzB5S+V7AkGz4fGs71KWNQhOrC9SVMhQl4QocIl17MwPyPzX9cJhornUqqttq85i
 wU+/KIoGVI3zQeNNa8Lvcn1CdJMDJ8jF3Rr859NV5+qnw118wzCWIfYOxMB59z9aK0L/
 FQGnc91y3ghmiq+QR3BvdpphFnfkYic3vJUrsYbkFtkG0+LeaU0INFVFoa0/qdK/kAZj
 rgHehTLv6f/nbopd6n5zSntFqqt25e5KtRVyhM3WYjWX3WIl/PZeSvAZrdP92epexBOV
 5xvCp7PBydBViBp55lgM0kQaGgOqGnTa55B0jTbD2b+1eed0uEDCn3zFIsO5fbEOhG+R
 JalA==
X-Gm-Message-State: ANhLgQ1cG285pdtq6slU9PXDok7TnkEFafYtfHTWciBTS+mS3n+yePiy
 8JB1cfoSx6xTmSqjJ0cmckTxyGFPaaxJFD3fBN+Rfq1Y
X-Google-Smtp-Source: ADFU+vsJ/7K4vYIDdzEKXt8TKME+KoPzdxCOSNyQTXXDg2vLmceRf2vV8+Ak8UuZ1rmCp9pdfSF8NNqJER24ZS4LUXQ=
X-Received: by 2002:a67:8d43:: with SMTP id p64mr156299vsd.37.1583173813631;
 Mon, 02 Mar 2020 10:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219132728.64083-1-emil.l.velikov@gmail.com>
In-Reply-To: <20200219132728.64083-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 2 Mar 2020 18:29:42 +0000
Message-ID: <CACvgo52MOoRzZjZ_mvmehpachB+Y0D+pXWtd5US6Q1o0JddQsw@mail.gmail.com>
Subject: Re: [PATCH] drm: rework SET_MASTER and DROP_MASTER perm handling
To: ML dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Feb 2020 at 13:27, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> From: Emil Velikov <emil.velikov@collabora.com>
>
> This commit reworks the permission handling of the two ioctls. In
> particular it enforced the CAP_SYS_ADMIN check only, if:
>  - we're issuing the ioctl from process other than the one which opened
> the node, and
>  - we are, or were master in the past
>
> This ensures that we:
>  - do not regress the systemd-logind style of DRM_MASTER arbitrator
>  - allow applications which do not use systemd-logind to drop their
> master capabilities (and regain them at later point) ... w/o running as
> root.
>
> See the comment above drm_master_check_perm() for more details.
>
> v1:
>  - Tweak wording, fixup all checks, add igt test
>
> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Testcase: igt/core_setmaster/master-drop-set-user
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/drm_auth.c  | 62 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_ioctl.c |  4 +--
>  include/drm/drm_file.h      | 11 +++++++
>  3 files changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index cc9acd986c68..b26986bca271 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -135,6 +135,7 @@ static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
>                 }
>         }
>
> +       fpriv->was_master = (ret == 0);
>         return ret;
>  }
>
> @@ -179,12 +180,67 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>         return ret;
>  }
>
> +/*
> + * In the olden days the SET/DROP_MASTER ioctls used to return EACCES when
> + * CAP_SYS_ADMIN was not set. This was used to prevent rogue applications
> + * from becoming master and/or failing to release it.
> + *
> + * At the same time, the first client (for a given VT) is _always_ master.
> + * Thus in order for the ioctls to succeed, one had to _explicitly_ run the
> + * application as root or flip the setuid bit.
> + *
> + * If the CAP_SYS_ADMIN was missing, no other client could become master...
> + * EVER :-( Leading to a) the graphics session dying badly or b) a completely
> + * locked session.
> + *
> + *
> + * As some point systemd-logind was introduced to orchestrate and delegate
> + * master as applicable. It does so by opening the fd and passing it to users
> + * while in itself logind a) does the set/drop master per users' request and
> + * b)  * implicitly drops master on VT switch.
> + *
> + * Even though logind looks like the future, there are a few issues:
> + *  - using it is not possible on some platforms
> + *  - applications may not be updated to use it,
> + *  - any client which fails to drop master* can DoS the application using
> + * logind, to a varying degree.
> + *
> + * * Either due missing CAP_SYS_ADMIN or simply not calling DROP_MASTER.
> + *
> + *
> + * Here we implement the next best thing:
> + *  - ensure the logind style of fd passing works unchanged, and
> + *  - allow a client to drop/set master, iff it is/was master at a given point
> + * in time.
> + *
> + * As a result this fixes, the following when using root-less build w/o logind
> + * - startx - some drivers work fine regardless
> + * - weston
> + * - various compositors based on wlroots
> + */
> +static int
> +drm_master_check_perm(struct drm_device *dev, struct drm_file *file_priv)
> +{
> +       if (file_priv->pid == task_pid(current) && file_priv->was_master)
> +               return 0;
> +
> +       if (!capable(CAP_SYS_ADMIN))
> +               return -EACCES;
> +
> +       return 0;
> +}
> +
>  int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>                         struct drm_file *file_priv)
>  {
>         int ret = 0;
>
>         mutex_lock(&dev->master_mutex);
> +
> +       ret = drm_master_check_perm(dev, file_priv);
> +       if (ret)
> +               goto out_unlock;
> +
>         if (drm_is_current_master(file_priv))
>                 goto out_unlock;
>
> @@ -229,6 +285,12 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>         int ret = -EINVAL;
>
>         mutex_lock(&dev->master_mutex);
> +
> +       ret = drm_master_check_perm(dev, file_priv);
> +       if (ret)
> +               goto out_unlock;
> +
> +       ret = -EINVAL;
>         if (!drm_is_current_master(file_priv))
>                 goto out_unlock;
>
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 9e41972c4bbc..73e31dd4e442 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -599,8 +599,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SET_SAREA_CTX, drm_legacy_setsareactx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_GET_SAREA_CTX, drm_legacy_getsareactx, DRM_AUTH),
>
> -       DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, DRM_ROOT_ONLY),
> -       DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, DRM_ROOT_ONLY),
> +       DRM_IOCTL_DEF(DRM_IOCTL_SET_MASTER, drm_setmaster_ioctl, 0),
> +       DRM_IOCTL_DEF(DRM_IOCTL_DROP_MASTER, drm_dropmaster_ioctl, 0),
>
>         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_ADD_CTX, drm_legacy_addctx, DRM_AUTH|DRM_ROOT_ONLY),
>         DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_RM_CTX, drm_legacy_rmctx, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 19df8028a6c4..c4746c9d3619 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -201,6 +201,17 @@ struct drm_file {
>          */
>         bool writeback_connectors;
>
> +       /**
> +        * @was_master:
> +        *
> +        * This client has or had, master capability. Protected by struct
> +        * &drm_device.master_mutex.
> +        *
> +        * This is used to ensure that CAP_SYS_ADMIN is not enforced, if the
> +        * client is or was master in the past.
> +        */
> +       bool was_master;
> +
>         /**
>          * @is_master:
>          *
> --
> 2.25.0
>

Humble poke?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
