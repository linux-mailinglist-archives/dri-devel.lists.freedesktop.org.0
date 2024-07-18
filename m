Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6A934A5C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 10:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B494F10E5F1;
	Thu, 18 Jul 2024 08:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P5DTu5/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6C10E5E8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 08:49:41 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2eebc76119aso6953321fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1721292579; x=1721897379;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=;
 b=P5DTu5/wzSS8zFaQ2oqL5Xc0QRdtWhM8vVtvRoqOchgZQFYWVumVXqksrqV+dTNysk
 jEZmKMQQTp0q0XUTozHR2H1cgtsza9zgcpMgPekTpgVm/A1sSgQDYVWrNANTtldEREYG
 eeHCv0jGnoYHAwYn9aqJyYRXVBM4QENco4Klc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721292579; x=1721897379;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P5XSGgt22gfhlNdwJOJsw/pH5jU2PiKPxPPeoeirhoI=;
 b=hF5NZGH5+PJG/as2g9M0ieajhtNn9a2+Auvyc+ewhpPOi0cVqJDs5ZW1tq3dH7iOeo
 7nsSQQ95zj3NDUCR26hWoyTzLER3o5S+nA/160ribtte18Waq4g+HnLRXaLWG9gaiSBS
 nzZCufWw/D1+2gLZd0MJFydXrgpkNVUxDiFpk9xHSUqCrOA4hcxV0nSxJbrF2Xy1h2lZ
 HcgOwv6ssKhzAimQvFh7nvIys2CK0gI8jUWe73KHxqy6aQppZoy4hxRI5vPDTaFtetX6
 N5mLT12TOtSD0xjeeZejnQC6TFDLqVzW6Klm+7LLqOHbNSmqyA8YQBV7WT+zP7XS59gY
 tkzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRwl9B92B3e6sl5wzalRx23iA0C4FwTogHnVhx+wUHvf13EisNhYGZAam3+zJ/+kYXJpFMcbsGGLzZvKXi0kKf3NpnGMu0rHGJwARuQ28p
X-Gm-Message-State: AOJu0YwhdIhNwndKVcOtEHWmF/Z0tyI8yZio4MnviapmynSukPfV9UbP
 tsupOwoMCv36Fw1LChdQ4v4Wic/2erxqB3dssZQcs1RfXmzO8cPgF7gha+lV5syvia7pmB5VXa0
 Xs9DW6XxclE+36/LSYv4AU27rMsatecr3P3na
X-Google-Smtp-Source: AGHT+IG2DjunGNz+AEb1WXabve2JGyl+FmIAwPg8sY9p8UhtyfkrR6meUMRp3lKB0WgoJmvcUUvoRzt5fDDJIVdF3V8=
X-Received: by 2002:a2e:9b89:0:b0:2ec:5945:6301 with SMTP id
 38308e7fff4ca-2ef05c79995mr11185471fa.18.1721292578930; Thu, 18 Jul 2024
 01:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240718082410.204459-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 18 Jul 2024 16:49:27 +0800
Message-ID: <CAGXv+5GBg73kWuiDt=9s7M4oJeHhWOF3bPY7Ju+qn1kJgNNaGw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set sensible cursor width/height values to
 fix crash
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 daniel@ffwll.ch, matthias.bgg@gmail.com, shawn.sung@mediatek.com, 
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Fei Shao <fshao@chromium.org>
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

(CC-ed Fei Shao)

On Thu, Jul 18, 2024 at 4:24=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Hardware-speaking, there is no feature-reduced cursor specific
> plane, so this driver reserves the last all Overlay plane as a
> Cursor plane, but sets the maximum cursor width/height to the
> maximum value that the full overlay plane can use.
>
> While this could be ok, it raises issues with common userspace
> using libdrm (especially Mutter, but other compositors too) which
> will crash upon performing allocations and/or using said cursor
> plane.
>
> Reduce the maximum width/height for the cursor to 512x512 pixels,
> value taken from IGT's maximum cursor size test, which succeeds.
>
> Fixes: a4c9410b31ca ("drm/mediatek: Set DRM mode configs accordingly")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index 6f0b415a978d..b96763664c4f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -540,8 +540,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         }
>
>         /* IGT will check if the cursor size is configured */
> -       drm->mode_config.cursor_width =3D drm->mode_config.max_width;
> -       drm->mode_config.cursor_height =3D drm->mode_config.max_height;
> +       drm->mode_config.cursor_width =3D 512;
> +       drm->mode_config.cursor_height =3D 512;

Fei already did the same (?) workaround downstream just recently.

OOTH, Intel recently added a feature for enumerating "suggested"
cursor sizes. See https://patchwork.freedesktop.org/patch/583299/

Not sure if other compositors will end up using it or not.

ChenYu

>         /* Use OVL device for all DMA memory allocations */
>         crtc =3D drm_crtc_from_index(drm, 0);
> --
> 2.45.2
>
