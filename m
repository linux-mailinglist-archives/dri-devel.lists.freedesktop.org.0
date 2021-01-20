Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8D2FD57D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 17:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4357B6E3B7;
	Wed, 20 Jan 2021 16:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C673C6E3B7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 16:26:13 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id v21so6131618otj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 08:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TR4A8q6K02DxTiaXZ3lXiS7PoGiZ905DDYVFaKV6hJs=;
 b=X+6XC27e9NvRxAXSFcJCX7sBLTclDZaFZztT0rBtKNzuYzjxhbDoOceu3gLmc7RRCG
 jJYxKFy0VDUwRGiSiNWileQMSufEJIZvnv2Lm7VGg7bRZF63rBoiyNMPWnVjrdckTwIc
 bBeX+A5PFbrlPkTNtMd6QGzwA2TjoCRzbkA1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR4A8q6K02DxTiaXZ3lXiS7PoGiZ905DDYVFaKV6hJs=;
 b=E/iBWd97xLkjfECGVUJ/WjRYFkHftXRa65a40eSCoS14tlgIZcwq79X1z2Vc8bt9og
 BN1M8rtdSu3cgBwGEGNpmW7MLigaj7n1MDrrRKh+P9LE6eheWwJSJloSCkqn/XV/hdy5
 uCSPkD4dWm9tfBQNeOwIqGyyguSTrTTGkogAvmMXbJtsMuCJ8D7yqLdGubfnEJHTr9fc
 gTqUXUA5zlb8TxbXpNjRQ2ttmXIEX8HuknKTufRLY0E1qzJRNgS3tlST9e6CF13fwzrK
 k+orEVHEYQXttTIy7Bpj3a6GNPjxiwOQ2eOJgOjab5AVVVFNSjn8+MMFD3BIzZHbYBd3
 F+LQ==
X-Gm-Message-State: AOAM532mnm5CUWMmclLr5DzM2okZqq+kRKhALjfAIPVIpcHPbC6xVkbe
 Q9mvAt3APlwbLEcoLAmJdzUlHDVs+qWQg1ejUjDFZQ==
X-Google-Smtp-Source: ABdhPJyqk40fmfS7gqlnqy6/UClYuooRH8LNmG2/KUb4n6AFXeVUr0ep1ChY8yMP9+rjQYw6gpo15Az+wTN1pS5m+oA=
X-Received: by 2002:a05:6830:1bef:: with SMTP id
 k15mr7418547otb.303.1611159973120; 
 Wed, 20 Jan 2021 08:26:13 -0800 (PST)
MIME-Version: 1.0
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-4-paul@crapouillou.net>
In-Reply-To: <20210120123535.40226-4-paul@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 17:26:02 +0100
Message-ID: <CAKMK7uFWUWtsOK-tcnon5p6-8ek3ZD2HeexUE7s7vUKKNXFXkg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/ingenic: Fix non-OSD mode
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 1:36 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Even though the JZ4740 did not have the OSD mode, it had (according to
> the documentation) two DMA channels, but there is absolutely no
> information about how to select the second DMA channel.
>
> Make the ingenic-drm driver work in non-OSD mode by using the
> foreground0 plane (which is bound to the DMA0 channel) as the primary
> plane, instead of the foreground1 plane, which is the primary plane
> when in OSD mode.
>
> Fixes: 3c9bea4ef32b ("drm/ingenic: Add support for OSD mode")
> Cc: <stable@vger.kernel.org> # v5.8+
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Does what it says on the tin^Wcommit message.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 158433b4c084..963dcbfeaba2 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -554,7 +554,7 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>                 height = state->src_h >> 16;
>                 cpp = state->fb->format->cpp[0];
>
> -               if (priv->soc_info->has_osd && plane->type == DRM_PLANE_TYPE_OVERLAY)
> +               if (!priv->soc_info->has_osd || plane->type == DRM_PLANE_TYPE_OVERLAY)
>                         hwdesc = &priv->dma_hwdescs->hwdesc_f0;
>                 else
>                         hwdesc = &priv->dma_hwdescs->hwdesc_f1;
> @@ -826,6 +826,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>         const struct jz_soc_info *soc_info;
>         struct ingenic_drm *priv;
>         struct clk *parent_clk;
> +       struct drm_plane *primary;
>         struct drm_bridge *bridge;
>         struct drm_panel *panel;
>         struct drm_encoder *encoder;
> @@ -940,9 +941,11 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>         if (soc_info->has_osd)
>                 priv->ipu_plane = drm_plane_from_index(drm, 0);
>
> -       drm_plane_helper_add(&priv->f1, &ingenic_drm_plane_helper_funcs);
> +       primary = priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
>
> -       ret = drm_universal_plane_init(drm, &priv->f1, 1,
> +       drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
> +
> +       ret = drm_universal_plane_init(drm, primary, 1,
>                                        &ingenic_drm_primary_plane_funcs,
>                                        priv->soc_info->formats_f1,
>                                        priv->soc_info->num_formats_f1,
> @@ -954,7 +957,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>
>         drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
>
> -       ret = drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
> +       ret = drm_crtc_init_with_planes(drm, &priv->crtc, primary,
>                                         NULL, &ingenic_drm_crtc_funcs, NULL);
>         if (ret) {
>                 dev_err(dev, "Failed to init CRTC: %i\n", ret);
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
