Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7B842D14
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBD9113256;
	Tue, 30 Jan 2024 19:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FBC1134EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 19:39:55 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc236729a2bso4366325276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706643535; x=1707248335;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+q4HVa8nO6BQUK0XxYQguyiZ4iDvZ28t4BKenxpRfI=;
 b=PruPwUcNvRlkHKXpD/aCO/yez9J64g/cTHS76Nb2SczwPw2tX9jOF5THvdUdSIC6lV
 4qcP08SInG9tumXtFUJruU4KCu1r9ih7noJ04igrGhkOWF+Rhksg/mvn8wB3CbQ9zU0E
 iK1BtW+gUpwmMssEM4TgMquRfiM9THz0aLdyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706643535; x=1707248335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C+q4HVa8nO6BQUK0XxYQguyiZ4iDvZ28t4BKenxpRfI=;
 b=ElOeIC2mSJpP/m2aNJI12rjdiDgzLNuHHAsXW5H14Ovr5d5Hcq7VRNR5Yig6VB9Qro
 MEL/scws3sELtAPRUJDAGmNfRyoQZA2qTrqX+s9zlkMA4R8Et9Hy2zb+V/CgA1dZPzcS
 3vdI16bLEGXUrUwVIBe67LwgReC4dVchSYd0XdIjU1dXXTHkdO7hmQQke+yqF92EXQkz
 LCQWlQGukJcPSq5uqT3P5s9yN1OKa4qLbDihUoQzxf8/mQpPWOwOladMjga+7TcrTcyo
 o9BFIEkESBkSmKAt7fdf4P4jioV8OENqPttBg1hj0hMYjhYem069gEu4cZpouZlPzEnS
 fqbQ==
X-Gm-Message-State: AOJu0YxhRAN+PWTAZM2ph5Ak33DHHhbvpFXe2eEZmnWQsFQMPIH3oqUy
 tNPvmHqKZ5au5TnI51X04MLJf+2xFVkzri0DF/ZDji9mPvxuPie5UtNol0Sf24HbJrp5YQhw8QM
 GhMRTp0ljRnPRZz0V6gjbKjp0vbWXeTreLBte
X-Google-Smtp-Source: AGHT+IGX7rGNN8+oHGFq9EWQ3pyyZdsrlR69ED6uYK+Mhar7Bfp9aKJgUCp/blWNC3LkswJCICNLBiXMd4HorLldj9I=
X-Received: by 2002:a25:2b42:0:b0:dc6:6307:d194 with SMTP id
 r63-20020a252b42000000b00dc66307d194mr4574264ybr.48.1706643534831; Tue, 30
 Jan 2024 11:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
In-Reply-To: <20240112203803.6421-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 30 Jan 2024 14:38:43 -0500
Message-ID: <CABQX2QOgXiEtRCXPjqOcM-YtPSV6fnzqw02c8LS_1Dh44TjSbg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Ian Forbes <ian.forbes@broadcom.com>
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
Cc: martin.krastev@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, maaz.mombasawala@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 12, 2024 at 4:20=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> SVGA requires surfaces to fit within graphics memory (max_mob_pages) whic=
h
> means that modes with a final buffer size that would exceed graphics memo=
ry
> must be pruned otherwise creation will fail.
>
> Additionally, device commands which use multiple graphics resources must
> have all their resources fit within graphics memory for the duration of t=
he
> command. Thus we need a small carve out of 1/4 of graphics memory to ensu=
re
> commands likes surface copies to the primary framebuffer for cursor
> composition or damage clips can fit within graphics memory.
>
> This fixes an issue where VMs with low graphics memory (< 64MiB) configur=
ed
> with high resolution mode boot to a black screen because surface creation
> fails.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index 28ff30e32fab..39d6d17fc488 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2854,12 +2854,12 @@ enum drm_mode_status vmw_connector_mode_valid(str=
uct drm_connector *connector,
>         struct vmw_private *dev_priv =3D vmw_priv(dev);
>         u32 max_width =3D dev_priv->texture_max_width;
>         u32 max_height =3D dev_priv->texture_max_height;
> -       u32 assumed_cpp =3D 4;
> +       u32 assumed_cpp =3D dev_priv->assume_16bpp ? 2 : 4;
> +       u32 pitch =3D mode->hdisplay * assumed_cpp;
> +       u64 total =3D mode->vdisplay * pitch;
> +       bool using_stdu =3D dev_priv->active_display_unit =3D=3D vmw_du_s=
creen_target;
>
> -       if (dev_priv->assume_16bpp)
> -               assumed_cpp =3D 2;
> -
> -       if (dev_priv->active_display_unit =3D=3D vmw_du_screen_target) {
> +       if (using_stdu) {
>                 max_width  =3D min(dev_priv->stdu_max_width,  max_width);
>                 max_height =3D min(dev_priv->stdu_max_height, max_height)=
;
>         }
> @@ -2870,9 +2870,13 @@ enum drm_mode_status vmw_connector_mode_valid(stru=
ct drm_connector *connector,
>         if (max_height < mode->vdisplay)
>                 return MODE_BAD_VVALUE;
>
> -       if (!vmw_kms_validate_mode_vram(dev_priv,
> -                       mode->hdisplay * assumed_cpp,
> -                       mode->vdisplay))
> +       if (using_stdu &&
> +               (total > (dev_priv->max_mob_pages * PAGE_SIZE * 3 / 4) ||

Could you export that computation somewhere where we could document
why we're doing this? Just to not leave the awkward "* 3 /4" that
everyone reading this code will wonder about?
And also make sure you indent this correctly, "dim checkpatch" should
warn about this.

z
