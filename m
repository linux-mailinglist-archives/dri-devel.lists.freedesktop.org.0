Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F11DE895213
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9FE10E2EA;
	Tue,  2 Apr 2024 11:42:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="NgQ6QOHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982C510EF1D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 11:42:19 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dcd9e34430cso5204463276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 04:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712058138; x=1712662938;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZnYF4UfGLCh+Y8E2jvRjQxWa7YOn+StguAvSxaRv7k=;
 b=NgQ6QOHlOuVZxyQhVoKO0ql4sWADMOYlt1meAVFZhcrUa+SLvn7Ua+ek437M2UklG+
 ZtbgD1x7wd7dXSkF9ckzYTsGRNqch0ekNbV10Pz+Nfpxnm2E7ByqRxz/dyNz7m+MTwBm
 9HoXNv8DKjss4NHMcgpTTUsHOHVqRLdetHuBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712058138; x=1712662938;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZnYF4UfGLCh+Y8E2jvRjQxWa7YOn+StguAvSxaRv7k=;
 b=L2E+iKL+/IujfH1ti5W7w0ASH+U8W1183qEDrjoPJnycy76HGo9ynLn47dUQmU3utr
 NaYRVWNjo9OVigorpscLjcol5Mgk2H81V1oJuc2QvWwhpRMvePCmDPIqzz3uckifhJWZ
 v7nGHMilnWBq3J/gft95tapAw8F9sWVMjVkabqTmGGiuK7hvP4/dryENb0Nu5Ly7b/V2
 MGwRTYClb7mddZP6srCUlx6Ey9GZt8DBPa7FqIzVTvKUJLmITRD5ZIK90wQLZhTkHYAr
 xGSr3sYsDAE8edRxs7rlW3IvQHXyVcAcnTcMRC+KS2FfAOk6R9osbcuC4QwWK3hvM6Xx
 6aZw==
X-Gm-Message-State: AOJu0Yy89XPoqNGDk3Ph8SJ7hupKsV8Fs3cao3zv5T5SZjw9y13z+HCn
 TFe2bXGIGq+Bfoul1iJj7vRmq60GbCi8pDxaDNtyhTCkjd5bODk5s6fU91gmisfPm/wnw8XoN5P
 /Ef+A6/BTK2j88wWr8lHJmXYc/imaSJUhekYr
X-Google-Smtp-Source: AGHT+IGS6NzgmIb/w6Q4p7Pu5KYgz3wVFln14nfpFvI62veR2dbgVv4iGyVJbkSNLaSu86cv+KwNpT+pcCxnCe7nHSk=
X-Received: by 2002:a25:8187:0:b0:dbd:c442:9e60 with SMTP id
 p7-20020a258187000000b00dbdc4429e60mr10335769ybk.36.1712058138345; Tue, 02
 Apr 2024 04:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240401195645.31081-1-ian.forbes@broadcom.com>
In-Reply-To: <20240401195645.31081-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 2 Apr 2024 07:42:07 -0400
Message-ID: <CABQX2QPgpZ4fz-3W4E3nNSck0k8CumQBTdKuWzjdvxo0j5sQhg@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed graphics memory
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

On Mon, Apr 1, 2024 at 4:35=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com>=
 wrote:
>
> SVGA requires individual surfaces to fit within graphics memory
> (max_mob_pages) which means that modes with a final buffer size that woul=
d
> exceed graphics memory must be pruned otherwise creation will fail.
>
> This fixes an issue where VMs with low graphics memory (< 64MiB) configur=
ed
> with high resolution mode boot to a black screen because surface creation
> fails.
>
> Fixes: d947d1b71deb ("drm/vmwgfx: Add and connect connector helper functi=
on")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 32 +++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 3c8414a13dba..49583b186a7d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -830,7 +830,37 @@ static void vmw_stdu_connector_destroy(struct drm_co=
nnector *connector)
>         vmw_stdu_destroy(vmw_connector_to_stdu(connector));
>  }
>
> +static enum drm_mode_status
> +vmw_stdu_connector_mode_valid(struct drm_connector *connector,
> +                             struct drm_display_mode *mode)
> +{
> +       enum drm_mode_status ret;
> +       struct drm_device *dev =3D connector->dev;
> +       struct vmw_private *dev_priv =3D vmw_priv(dev);
> +       u64 assumed_cpp =3D dev_priv->assume_16bpp ? 2 : 4;
> +       u64 required_mem =3D mode->hdisplay * assumed_cpp * mode->vdispla=
y;
> +
> +       ret =3D drm_mode_validate_size(mode, dev_priv->stdu_max_width,
> +                                    dev_priv->stdu_max_height);
> +       if (ret !=3D MODE_OK)
> +               return ret;
> +
> +       ret =3D drm_mode_validate_size(mode, dev_priv->texture_max_width,
> +                                    dev_priv->texture_max_height);
> +       if (ret !=3D MODE_OK)
> +               return ret;
>
> +       if (required_mem > dev_priv->max_primary_mem)
> +               return MODE_MEM;
> +
> +       if (required_mem > dev_priv->max_mob_pages * PAGE_SIZE)
> +               return MODE_MEM;
> +
> +       if (required_mem > dev_priv->max_mob_size)
> +               return MODE_MEM;
> +
> +       return MODE_OK;
> +}
>
>  static const struct drm_connector_funcs vmw_stdu_connector_funcs =3D {
>         .dpms =3D vmw_du_connector_dpms,
> @@ -846,7 +876,7 @@ static const struct drm_connector_funcs vmw_stdu_conn=
ector_funcs =3D {
>  static const struct
>  drm_connector_helper_funcs vmw_stdu_connector_helper_funcs =3D {
>         .get_modes =3D vmw_connector_get_modes,
> -       .mode_valid =3D vmw_connector_mode_valid
> +       .mode_valid =3D vmw_stdu_connector_mode_valid
>  };
>
>
> --
> 2.34.1
>

This looks like a great start. Some improvements that I'd suggest is
to take a look at
bora/vmcore/frobos/test/common/svga/1523068-svga-screen-limits/main.c
where those computations are spelled out a bit more verbose. I'd
suggest following them because those are being tested all the time.
It'd be great if we also covered the multimon case here, but it's not
our main concern.

The second thing that we'd want to adjust is that if we're not using
vmw_connector_mode_valid then we need to remove the stdu paths from
it.

Finally I'd suggest making this a series, i.e. include all the changes
we've talked about like fixing all of the display technologies,
disabling 3d etc iirc we talked about priority list among those at
some time.

z
