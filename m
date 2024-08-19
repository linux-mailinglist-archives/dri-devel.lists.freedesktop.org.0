Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C3E956D22
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:24:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E3A10E290;
	Mon, 19 Aug 2024 14:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="FBrsve7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F9110E290
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:24:24 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-81f94ce2272so177849139f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1724077464; x=1724682264;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxgTT1IpZFYiJXpyG2uWcjOtK+S8Pw31uEVG6TgL/po=;
 b=FBrsve7jBaexv5B37oSzZl/EP9r+V+obCNm56d/Z7q8ryV2+AR3kfJNPHTEdXUruYc
 JiFAou31z2+pO2fc94LSK+u8GkfbgyrlaYsJHMcqwDrKrdeJ7zWgLFflgpPB+ANSBy8+
 DHp6AN/eePMekJA9aqC7TFnu0Kap2LdR6A7vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724077464; x=1724682264;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZxgTT1IpZFYiJXpyG2uWcjOtK+S8Pw31uEVG6TgL/po=;
 b=vEK9jfV3p74/kgTJLAFqI0WjKmdRK8pQCU27AaDiRWQThUi5z7RrSJAcRbk/IVhhBS
 mg1wB2rylhY/XL9R3aC5ooxBufX50bC+H6tfr/FNkdTzRGLrao3aiG1mObczU9GAv0MY
 R23aGesH06wsIVb81YHBSkUy+X6xOvJ2OjNuMCwRaVTfQx2HAXqKuDcDLX9HF7FNgYvn
 MBzbvt8OKF7PIfO0AqtqF52GwxvJhHpQ6COMU7tjw0aZyjBYJVnbx8GMO+Ua4lHV6KV6
 u5dEDuT+Q6MbPWB4ygeM84BtMsCr2gRnce3Gjr4lVCkhP2gYdT4sEIHXm2XVdPJIMsgW
 a03w==
X-Gm-Message-State: AOJu0YyaEHgvD/BqsX3UkWUak2WhXF5/JOqRyYcJcqCtFaPoC8GstSZE
 81/g37QL6mIRvRv1tA+uuzHiqY2H1VRxkgnJNIEHm7EwKtqMv7lKlD+/0tZgMuqvO4ej4cxBYHO
 hiZE7KCnN4pj0VorUjWWFQBTiUnp/c8W1NejX
X-Google-Smtp-Source: AGHT+IEcpHwIv2FhdtsUJviEsdZLBqwTQ2gcAkPRgs568NXWSUyKyqPdSueVt8gZOM0MU2xot/2hSXht+Bnvc78hfFs=
X-Received: by 2002:a05:6602:634b:b0:824:eb09:5678 with SMTP id
 ca18e2360f4ac-824f26b0104mr1257622539f.12.1724077463847; Mon, 19 Aug 2024
 07:24:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240808200634.1074083-1-ian.forbes@broadcom.com>
In-Reply-To: <20240808200634.1074083-1-ian.forbes@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Mon, 19 Aug 2024 17:24:12 +0300
Message-ID: <CAKLwHdXrqYr-QX_F6qSbUnjQebe_PadxttiePEQ+LRwrughoAQ@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Limit display layout ioctl array size to
 VMWGFX_NUM_DISPLAY_UNITS
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com, zack.rusin@broadcom.com
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

On Thu, Aug 8, 2024 at 11:06=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
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

LGTM.

Reviewed-by: Martin Krastev <martin.krastev@broadcom.com>

Regards,
Martin
