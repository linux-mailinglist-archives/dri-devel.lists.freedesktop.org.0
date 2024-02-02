Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5698479A8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 20:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FA410F0FA;
	Fri,  2 Feb 2024 19:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="fbab5I6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74E910F0FA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 19:29:22 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc6e080c1f0so1802641276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 11:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1706902162; x=1707506962;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOL4zZGY/mUgB0Dr0bfWMcbd1E1z6AWMt9k4NhhmZlQ=;
 b=fbab5I6IRoFgWEMJXqLLtEDc1po/WMCZFrU1QQiOXLvoFTx2uJdy66oZajXjYTvQ3S
 3EPj7jcds27JdwH0n2wzCaSeoF1qazc7mjF+zEhF6zSxtCMZEPAbzl3mwbUH0u3gqrlj
 bHntQtCsBI85B13dYy0UhtJmAD5gAUCTBR3+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706902162; x=1707506962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QOL4zZGY/mUgB0Dr0bfWMcbd1E1z6AWMt9k4NhhmZlQ=;
 b=U/CUO0JILGbv6J88x3UQmrF1MqhbOk9i0F72a/pbDYsXUOMHHkOfvGs0qdDnW3I2nU
 MuxIpy2rfLEMMZC/IeFiZ8FyVSyggxq5fQIXiredPq9RxMIUU8mhqZ9605zzQPkkzK3L
 l+7A4Vgkd/Yv+BPPcPeVRScNyMTAdpJA98T9t9yC29tt1eoEt7eMsEtXJbZOHnjDIG4W
 /g++FIq1moBEE+JkHpOQth0SnxQgEjbNCeXK/xPUmG+ujxEyi+PwU/gTdrrvIwr0D8lW
 4wnXS2Q2e+/P04WQDQC4D1yCZu0nU50L7yoK6E1O4LgaZWlwQQVfSBDnBdWGZDKHpurc
 spCw==
X-Gm-Message-State: AOJu0YzmBXifGfAmSF6kKyX9dkCbiG9bI2+Yj7uR+Ezh51H5Tl3zkDm/
 I84jseLurE4rxjtWgjl3npr2uxntf0IoXi8tEwZrZOGUfCdg/uzgm7BJK71dvM23uOWi4OOkHm9
 ULxXMJ8HQmu25e1zRHXtSbdpwwWBQDwGK9UCR
X-Google-Smtp-Source: AGHT+IEaGq1dp5q6aVxmWqeK3PHn88vdj2JeH0kPuLy0NurUNesD+WFY/MVdbm6KYkSzAWfgRiEJPScKnML0YCEev/c=
X-Received: by 2002:a25:d88d:0:b0:dc6:a8c6:c9e5 with SMTP id
 p135-20020a25d88d000000b00dc6a8c6c9e5mr9876194ybg.26.1706902161690; Fri, 02
 Feb 2024 11:29:21 -0800 (PST)
MIME-Version: 1.0
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <20240201051343.9936-1-ian.forbes@broadcom.com>
In-Reply-To: <20240201051343.9936-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 2 Feb 2024 14:29:10 -0500
Message-ID: <CABQX2QPru=0O2nWinQEC-GrpvDpvNkECDKQT_CDJGhqnf_mGpw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com
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

On Fri, Feb 2, 2024 at 11:58=E2=80=AFAM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> SVGA requires surfaces to fit within graphics memory (max_mob_pages) whic=
h
> means that modes with a final buffer size that would exceed graphics memo=
ry
> must be pruned otherwise creation will fail.

Sorry, I didn't notice this originally but that's not quite true. svga
doesn't require all mob memory to stay within max_mob_pages (which is
SVGA_REG_GBOBJECT_MEM_SIZE_KB). max_mob_pages is really max resident
memory or suggested-guest-memory-for-best-performance. we can grow
that memory (and we do). I think what's causing problems on systems
with low memory is that cursor mobs and the fb's need to be both
resident but can't. Now SVGA_REG_MAX_PRIMARY_MEM is the max memory in
which our topology needs to fit in (which is max_primary_mem on
vmwgfx) but afaict that's not the issue here and it's checked later in
vmw_kms_validate_mode_vram

> Additionally, device commands which use multiple graphics resources must
> have all their resources fit within graphics memory for the duration of t=
he
> command. Thus we need a small carve out of 1/4 of graphics memory to ensu=
re
> commands likes surface copies to the primary framebuffer for cursor
> composition or damage clips can fit within graphics memory.

Yes, we should probably rename max_mob_pages to max_resident_memory
instead to make this obvious.

> This fixes an issue where VMs with low graphics memory (< 64MiB) configur=
ed
> with high resolution mode boot to a black screen because surface creation
> fails.

Does this work if you disable gbobjects? Without gbobject's we won't
have screen targets and thus won't be offsetting by 1/4 so I wonder if
4mb vram with legacy display would work with 1280x800 resolution.

Also, you want to add a "V2" section to your change to describe what
changed in v2 vs v1 (and same for any subsequent change).

>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index cd4925346ed4..84e1b765cda3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -2858,12 +2858,17 @@ enum drm_mode_status vmw_connector_mode_valid(str=
uct drm_connector *connector,
>         struct vmw_private *dev_priv =3D vmw_priv(dev);
>         u32 max_width =3D dev_priv->texture_max_width;
>         u32 max_height =3D dev_priv->texture_max_height;
> -       u32 assumed_cpp =3D 4;
> -
> -       if (dev_priv->assume_16bpp)
> -               assumed_cpp =3D 2;
> +       u32 assumed_cpp =3D dev_priv->assume_16bpp ? 2 : 4;
> +       u32 pitch =3D mode->hdisplay * assumed_cpp;
> +       u64 total =3D mode->vdisplay * pitch;
> +       bool using_stdu =3D dev_priv->active_display_unit =3D=3D vmw_du_s=
creen_target;
> +       u64 max_mem_for_st =3D dev_priv->max_mob_pages * PAGE_SIZE * 3 / =
4;
> +       /* ^^^ Max memory for the mode fb when using Screen Target / MOBs=
.
> +        * We need a carveout (1/4) to account for other gfx resources th=
at are
> +        * required in gfx mem for an fb update to complete with low gfx =
mem (<64MiB).
> +        */

Same wording issue as mentioned above and lets use normal comment
style (i.e. comments attach to the code below). max_mem_for_st should
probably be max_mem_for_mode or max_mem_for_mode_st.

> -       if (dev_priv->active_display_unit =3D=3D vmw_du_screen_target) {
> +       if (using_stdu) {
>                 max_width  =3D min(dev_priv->stdu_max_width,  max_width);
>                 max_height =3D min(dev_priv->stdu_max_height, max_height)=
;
>         }
> @@ -2874,9 +2879,10 @@ enum drm_mode_status vmw_connector_mode_valid(stru=
ct drm_connector *connector,
>         if (max_height < mode->vdisplay)
>                 return MODE_BAD_VVALUE;
>
> -       if (!vmw_kms_validate_mode_vram(dev_priv,
> -                                       mode->hdisplay * assumed_cpp,
> -                                       mode->vdisplay))
> +       if (using_stdu && (total > max_mem_for_st || total > dev_priv->ma=
x_mob_size))
> +               return MODE_MEM;
> +
> +       if (!vmw_kms_validate_mode_vram(dev_priv, pitch, mode->vdisplay))
>                 return MODE_MEM;

It might make sense to just reuse vmw_kms_validate_mode_vram , it does
what we're claiming to do here and even though it's called
vmw_kms_validate_mode_vram it does actually validate st primary
memory.

z
