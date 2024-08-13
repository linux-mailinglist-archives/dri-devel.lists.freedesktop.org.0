Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9277E950B24
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE79A10E3AD;
	Tue, 13 Aug 2024 17:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="e0P6egwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A40110E3AD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:06:56 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3db1e21b0e4so3982054b6e.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723568815; x=1724173615;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o6e09VRm2OKY5x33KaRDjjiWD41l4fHab7nnWaopIts=;
 b=e0P6egwA3f784o4kdtiQPygUy19DwFQOeqhEMkLfI8OWGTaG80EIXzkQrgPQUaERoD
 3zjVg873TdQ0tCsGCMAEWtHnCv0ja6JWxfiT6hDYw2FVG7sebG/AYL1rXGDzurQVYJIT
 vQ9wQIf5oZ+nnvPmhWplaDzQs6FroBsVoHC3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723568815; x=1724173615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o6e09VRm2OKY5x33KaRDjjiWD41l4fHab7nnWaopIts=;
 b=DpwEsrCSbY1r2pRBHWBRKBxjdR75/cCgJ1X4EzL9aGSqNsqTQnbgI3WAMlFgIIDsgv
 QocdAljCP8qRsdFIJCWA3H+vOgeHlfNpvDd7qIbkmfEVIA629SUk41vDq3hU5MWwSaFC
 o9YefJ7zBZHk7HXfhz4cLAHmNHs+rS2yJFKMUGnZuwsGPBpPPivSuxI8wwQ81+UKGHi6
 T3xnvg6PUXN8aoC0n0GwucY5XzV6ZxC2Wx0YMOuI0ds5KRiAd5DJOstMzmerZfuAAI+K
 AcZckHlHifW+Nfd/VNTMoUx0LOeZJYZqwEMR3ueP6WiIjeoZ8ZtHUonctcMz8BRWlxah
 BChQ==
X-Gm-Message-State: AOJu0YyDy9oYlf9avdqIQPV30esCfBfgu2WVZec/BqwXpdruCagPvgu+
 ftgfWxJKaa3Y7dbCc8mncLf/R4kxh5Q8glwZlR8Q5LNvoZX1ko8pGS9TGCEk700sxAeqMnfJVqf
 43jOm6Rqa/l6cbo5f2HZfy3OAbDkRRWwCcU3x
X-Google-Smtp-Source: AGHT+IEgRprMFll8RcLA3H2hPMQfitzpwQ2FWJVpo6kc3Hr9U5KOQ+bYKw7E+9rypEV2nkab4Zz5p5aZwQjvFHzUACs=
X-Received: by 2002:a05:6808:4497:b0:3da:e007:9d5 with SMTP id
 5614622812f47-3dd29923fa7mr58123b6e.30.1723568815533; Tue, 13 Aug 2024
 10:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240808200634.1074083-1-ian.forbes@broadcom.com>
In-Reply-To: <20240808200634.1074083-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 13 Aug 2024 13:06:44 -0400
Message-ID: <CABQX2QORL0t+3y7Zvp-rwqa-wTdzHLqFu4+zaetM+7UAHUSMXg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Limit display layout ioctl array size to
 VMWGFX_NUM_DISPLAY_UNITS
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Thu, Aug 8, 2024 at 4:06=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> Currently the array size is only limited by the largest kmalloc size whic=
h
> is incorrect. This change will also return a more specific error message
> than ENOMEM to userspace.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 4 +++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h | 3 ---
>  3 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 32f50e595809..888349f2aac1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -62,7 +62,7 @@
>  #define VMWGFX_DRIVER_MINOR 20
>  #define VMWGFX_DRIVER_PATCHLEVEL 0
>  #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
> -#define VMWGFX_MAX_DISPLAYS 16
> +#define VMWGFX_NUM_DISPLAY_UNITS 8
>  #define VMWGFX_CMD_BOUNCE_INIT_SIZE 32768
>
>  #define VMWGFX_MIN_INITIAL_WIDTH 1280
> @@ -82,7 +82,7 @@
>  #define VMWGFX_NUM_GB_CONTEXT 256
>  #define VMWGFX_NUM_GB_SHADER 20000
>  #define VMWGFX_NUM_GB_SURFACE 32768
> -#define VMWGFX_NUM_GB_SCREEN_TARGET VMWGFX_MAX_DISPLAYS
> +#define VMWGFX_NUM_GB_SCREEN_TARGET VMWGFX_NUM_DISPLAY_UNITS
>  #define VMWGFX_NUM_DXCONTEXT 256
>  #define VMWGFX_NUM_DXQUERY 512
>  #define VMWGFX_NUM_MOB (VMWGFX_NUM_GB_CONTEXT +\
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 288ed0bb75cb..884804274dfb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2225,7 +2225,7 @@ int vmw_kms_update_layout_ioctl(struct drm_device *=
dev, void *data,
>         struct drm_mode_config *mode_config =3D &dev->mode_config;
>         struct drm_vmw_update_layout_arg *arg =3D
>                 (struct drm_vmw_update_layout_arg *)data;
> -       void __user *user_rects;
> +       const void __user *user_rects;
>         struct drm_vmw_rect *rects;
>         struct drm_rect *drm_rects;
>         unsigned rects_size;
> @@ -2237,6 +2237,8 @@ int vmw_kms_update_layout_ioctl(struct drm_device *=
dev, void *data,
>                                             VMWGFX_MIN_INITIAL_HEIGHT};
>                 vmw_du_update_layout(dev_priv, 1, &def_rect);
>                 return 0;
> +       } else if (arg->num_outputs > VMWGFX_NUM_DISPLAY_UNITS) {
> +               return -E2BIG;
>         }
>
>         rects_size =3D arg->num_outputs * sizeof(struct drm_vmw_rect);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.h
> index 6141fadf81ef..2a6c6d6581e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -199,9 +199,6 @@ struct vmw_kms_dirty {
>         s32 unit_y2;
>  };
>
> -#define VMWGFX_NUM_DISPLAY_UNITS 8
> -
> -
>  #define vmw_framebuffer_to_vfb(x) \
>         container_of(x, struct vmw_framebuffer, base)
>  #define vmw_framebuffer_to_vfbs(x) \
> --
> 2.34.1
>

Looks good. Thanks.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z
