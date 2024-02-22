Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84786027B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 20:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9798E10E977;
	Thu, 22 Feb 2024 19:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PMhTpCUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2210E977
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 19:18:16 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a3eafbcb1c5so11678966b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 11:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708629495; x=1709234295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aKmv8VA9qwrVjGnHU1RMltzYyr4GiBIOxbbvEQt4SA4=;
 b=PMhTpCUyDnkV39Njzx2Tq7/v8sH1YtbU0LkYcHXaVV/Sd0DDwnWMIBELRbWhUXVlGq
 pRHI02evgM5VsRGlm/LyoejlIo8PWb1+mv2s00yaALdAjT023QUGYaD1SSU9DVaZFmvd
 Pv0AZb3Ci9hHKIwxzCQJ8QGsygFp+4NKUFFpTtQarFAw5p7+5P/QuwNyR9TCa2UKa2oD
 I/NY1yvbpiyQKyfpQOkzcUwDNW+hj1b0iCHzanCSzTp5d/MC46vTu0RUbOfHXHoVxhQn
 E7GMgvMU0mjKdIiOuP9OcDtyJbxWX5+S4pNvpEVA+AOjF8yotfgLTeMiq1xl03igjsmC
 mxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708629495; x=1709234295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aKmv8VA9qwrVjGnHU1RMltzYyr4GiBIOxbbvEQt4SA4=;
 b=dK887OoF6CWraTnOU3E9YksSzlMtAMPAXvXwZbQLKbeRv/KhUTrWsE30ZGWfaEa38X
 fpC7wXnmOxevR0F+fBu2PHXWbXL361I0jN/XTDFRvEaCf2DAneBVvqWnx64t+68gm3Yy
 Z6bvu5ZszC9y7Qu17v/ub271ggS6DvoJOi8g0MRvT38o6L2Jk+Ev/bzeRe/I/+XP8vjO
 tR/RfOSUg4FT9b0v5pPVhOcQXiR7PkpgMz8gvpapMN2u/DGiI6ectV7YrPBk1NKrbpdT
 Vr+KLF2cMTcMS//ge6AQ0qvjVAe/KyVIEEZj1SGQwcVPsgjxxtZLqbBNqrtgJutYySin
 Oxow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVul2pXVLofeMpgPo9ff6ANGkbzb4IJdAXFQBBLnCgHnbgLGTqhf6UZ87CgGkw2ejGwFdLfxPj8ENdejdQxpr8MZLn33lvQXU9lzFx0NJJk
X-Gm-Message-State: AOJu0Yxn7rSrgEMDhS4NxyclcfLCtvhxRrl+fzWbSOcTGqRei0+cVVsH
 tIbudvjn04Reai6rdi+8Aqc5m4ceIMS8VLWtjzfEUFaiWrJL1eUd
X-Google-Smtp-Source: AGHT+IGgtYpDu1X4LtE8dy25QBXvH7D+LGd/bcwDqJXyxCvF0xkzXLXvaCPTDclOjmCat6T4CZzXoA==
X-Received: by 2002:a17:906:1854:b0:a3e:73c8:d383 with SMTP id
 w20-20020a170906185400b00a3e73c8d383mr10308795eje.49.1708629494886; 
 Thu, 22 Feb 2024 11:18:14 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 vu2-20020a170907a64200b00a3fa275de38sm425296ejc.162.2024.02.22.11.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 11:18:14 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/sun4i: Add more parameters to sunxi_engine commit
 callback
Date: Thu, 22 Feb 2024 20:18:13 +0100
Message-ID: <9236885.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240216190430.1374132-3-megi@xff.cz>
References: <20240216190430.1374132-1-megi@xff.cz>
 <20240216190430.1374132-3-megi@xff.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Dne petek, 16. februar 2024 ob 20:04:25 CET je Ond=C5=99ej Jirman napisal(a=
):
> From: Ondrej Jirman <megi@xff.cz>
>=20
> These will be needed later on when we move layer configuration to
> crtc update.
>=20
> Signed-off-by: Ondrej Jirman <megi@xff.cz>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/gpu/drm/sun4i/sun4i_backend.c |  4 +++-
>  drivers/gpu/drm/sun4i/sun4i_crtc.c    |  2 +-
>  drivers/gpu/drm/sun4i/sun8i_mixer.c   |  5 ++++-
>  drivers/gpu/drm/sun4i/sunxi_engine.h  | 13 ++++++++++---
>  4 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4=
i/sun4i_backend.c
> index 335fd0edb904..e89eb96d3131 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -69,7 +69,9 @@ static void sun4i_backend_disable_color_correction(stru=
ct sunxi_engine *engine)
>  			   SUN4I_BACKEND_OCCTL_ENABLE, 0);
>  }
> =20
> -static void sun4i_backend_commit(struct sunxi_engine *engine)
> +static void sun4i_backend_commit(struct sunxi_engine *engine,
> +				 struct drm_crtc *crtc,
> +				 struct drm_atomic_state *state)
>  {
>  	DRM_DEBUG_DRIVER("Committing changes\n");
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/s=
un4i_crtc.c
> index c06d7cd45388..18e74047b0f5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
> @@ -91,7 +91,7 @@ static void sun4i_crtc_atomic_flush(struct drm_crtc *cr=
tc,
> =20
>  	DRM_DEBUG_DRIVER("Committing plane changes\n");
> =20
> -	sunxi_engine_commit(scrtc->engine);
> +	sunxi_engine_commit(scrtc->engine, crtc, state);
> =20
>  	if (event) {
>  		crtc->state->event =3D NULL;
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 1e681314e379..bdeb9b80e038 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_framebuffer.h>
> @@ -249,7 +250,9 @@ int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_=
format)
>  	return -EINVAL;
>  }
> =20
> -static void sun8i_mixer_commit(struct sunxi_engine *engine)
> +static void sun8i_mixer_commit(struct sunxi_engine *engine,
> +			       struct drm_crtc *crtc,
> +			       struct drm_atomic_state *state)
>  {
>  	DRM_DEBUG_DRIVER("Committing changes\n");
> =20
> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i=
/sunxi_engine.h
> index ec8cf9b2bda4..ec0c4932f15c 100644
> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
> @@ -7,6 +7,7 @@
>  #define _SUNXI_ENGINE_H_
> =20
>  struct drm_plane;
> +struct drm_crtc;
>  struct drm_device;
>  struct drm_crtc_state;
>  struct drm_display_mode;
> @@ -59,7 +60,9 @@ struct sunxi_engine_ops {
>  	 *
>  	 * This function is optional.
>  	 */
> -	void (*commit)(struct sunxi_engine *engine);
> +	void (*commit)(struct sunxi_engine *engine,
> +		       struct drm_crtc *crtc,
> +		       struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @layers_init:
> @@ -144,12 +147,16 @@ struct sunxi_engine {
>  /**
>   * sunxi_engine_commit() - commit all changes of the engine
>   * @engine:	pointer to the engine
> + * @crtc:	pointer to crtc the engine is associated with
> + * @state:	atomic state
>   */
>  static inline void
> -sunxi_engine_commit(struct sunxi_engine *engine)
> +sunxi_engine_commit(struct sunxi_engine *engine,
> +		    struct drm_crtc *crtc,
> +		    struct drm_atomic_state *state)
>  {
>  	if (engine->ops && engine->ops->commit)
> -		engine->ops->commit(engine);
> +		engine->ops->commit(engine, crtc, state);
>  }
> =20
>  /**
>=20




