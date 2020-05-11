Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0020E1CD876
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54E89857;
	Mon, 11 May 2020 11:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A600989824
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:31:18 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id t8so3254153uap.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 04:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+Zv0++TVDvxF3xoCmnjHlgSePa05xkuBLsnjTZYh4c=;
 b=lNT2+YUw6cPy/74Cb1tOsf59oT4FKIk+H19gHX1WcIj2W9PGd9n1sLmTO9a7xNuOgt
 8vvD3v2nGqt3Z0WPCByqiBeujm3sS2j5+me+5q5BEGnMMFqdBvRhTQhTRf3OdvAqdT1f
 N8cUCCjzWN6YySlBMCb3Ai0O+QPfWHRmV1u/06m15JBPWE9MsHqSbtAdSlaLjaDQG62M
 tvr+44say3vHiGLAwqDyPX1Ngx9jAdfIqJkoIPCTRJTapAUwi0WKjpbMifechZmJ0ms8
 LFw5qZpFnvYSEPscNhNNDIx4xpPWqYGq2ChXk8WGFlLuLEqIfXEEKUy0J1rqVjYuYjQf
 nCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+Zv0++TVDvxF3xoCmnjHlgSePa05xkuBLsnjTZYh4c=;
 b=pe4EngfQzXdd7kz5T4HXQShFMK5XxJCrsiu9X7CwjynaCBBnBUCscTzO6EfnBf+HOE
 wKrKLyxaHPGVMz/Z2Z5TyM/MzWcGngHFjE3V0Wh/KIamVwQ/O7HEbJD0x+J1hhjU9Uqy
 hI2kKTPF24VA3/dsq/Rf4KMRVKt3WUs+IhIjWGbCBM0+Q5o24STe4NVfx1t3Es36s86e
 GmxRCGiXrpO1318S9yS9h0ENFyJKPPs0zQvPehzhIzbXcmqM9ivky8uy9maH1xAwf3nj
 uVQt0M2M9Va0TxeX5HMvSvxRJ2D3IgZ3QiLUjlkGbrZe14FjGboQkk3zdWIZro7bw1f3
 VoLA==
X-Gm-Message-State: AGi0PubTx533Ql6WBOQiplyq+QILnwWGEAnibQMZmTCep0pSVQSJ1KJH
 OGq8slEP8Ymr6cMP071OzbYjcrgT8MDzk/AqOdM16Gpk
X-Google-Smtp-Source: APiQypIWJI+taFxaNCnyZ0fq8UVh4xlV54xLlQgsek6SWGUFOWZjXnIxsAuM/j/MUwfOX3xgM48UYu0u3fE65WKZnMg=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr11374226ual.106.1589196677443; 
 Mon, 11 May 2020 04:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
 <20200505160329.2976059-2-emil.l.velikov@gmail.com>
In-Reply-To: <20200505160329.2976059-2-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 11 May 2020 12:28:40 +0100
Message-ID: <CACvgo51qzvmf9oTxx_dXWPJEz8VN5VuBGaBJL-JMbbLwSoEDCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/panel: use mipi_dsi_dcs_write_buffer where
 possible
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 5 May 2020 at 17:05, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> From: Emil Velikov <emil.velikov@collabora.com>
>
> A few of the new panels create a local macro wrapping around
> mipi_dsi_dcs_write. At the same time, they don't really care about the
> command/payload split.
>
> mipi_dsi_dcs_write does a kmalloc/memcpy/kfree for payload > 7 bytes.
> kmalloc - avoid that all together by using the _buffer function.
>
Seems like I've left an extra word here - will fix in v2, alongside
any review feedback.
s/kmalloc - avoid/Avoid/

> Aside:
> panel-xinpeng-xpp055c272.c calls its wrapper "generic" although it
> should be "dcs". But that for another day/patch.
>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c       | 4 ++--
>  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 4 ++--
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index 711ded453c44..00e3d67af812 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -52,9 +52,9 @@ static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
>  }
>
>  #define dsi_dcs_write_seq(dsi, cmd, seq...) do {                       \
> -               static const u8 d[] = { seq };                          \
> +               static const u8 b[] = { cmd, seq };                     \
>                 int ret;                                                \
> -               ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
>                 if (ret < 0)                                            \
>                         return ret;                                     \
>         } while (0)
> diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> index 5a7a31c8513e..eaa9da3ebbea 100644
> --- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> +++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
> @@ -246,9 +246,9 @@ struct ltk050h3146w *panel_to_ltk050h3146w(struct drm_panel *panel)
>  }
>
>  #define dsi_dcs_write_seq(dsi, cmd, seq...) do {                       \
> -               static const u8 d[] = { seq };                          \
> +               static const u8 b[] = { cmd, seq };                     \
>                 int ret;                                                \
> -               ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
>                 if (ret < 0)                                            \
>                         return ret;                                     \
>         } while (0)
> diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> index 1645aceab597..9e07d7e86807 100644
> --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> @@ -62,9 +62,9 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
>  }
>
>  #define dsi_generic_write_seq(dsi, cmd, seq...) do {                   \
> -               static const u8 d[] = { seq };                          \
> +               static const u8 b[] = { cmd, seq };                     \
>                 int ret;                                                \
> -               ret = mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));   \
> +               ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b)); \
>                 if (ret < 0)                                            \
>                         return ret;                                     \
>         } while (0)
> --
> 2.25.1
>

Humble poke?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
