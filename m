Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA93D203AA5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8BC6E829;
	Mon, 22 Jun 2020 15:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720E36E829
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 15:20:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id r9so15257802wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bvM9454sRyA92BdNMIYVPsWeTtYzc5gscpDaZUrZXIM=;
 b=hiN6V5fYiV42xZzkshiJzCPOup3DMGX/aE+Org/kcuCAhPN+c17r5f53SNVsKPtzto
 R01HBTBg8CJwAeAApPlU2GucRPaUgoalhvObh14ZrrdEZmnXzKU/T65mEXz58pPpGBfH
 qx8G5Ho41ica8wIzh+bEmk8UXvVnzV9ydEzdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bvM9454sRyA92BdNMIYVPsWeTtYzc5gscpDaZUrZXIM=;
 b=sIAr1mj1Ufku/d7ZBmZhuwFiZLDxHG+HPqPGh4SEC2sK+OXuo3tdD+s2S9IKCTejrW
 5uzemiBk6FFC1GvLRrGXcD0z5HkoLZEskDoNQJRH+90UEhm+TrKaKLI8eGiOqufP6+8s
 j4HY5mWZLPq/0wMi9278lhSIX09aKlL58G0Tc8rQdVA66/gfefWkYEhzAdWoGlGSRXxZ
 dHxuDdKIpOi+K19vfnSQ67Si448w0ub8boUmG884LDNBMIjlQ+T0YQ+q0vC1lG3E95j6
 mCSMqn8qNljzjBasLjADrU/TrxpcmUI03u31VKAEshWqM3zSMoGFf5klzFJKaJPn4eXH
 C40Q==
X-Gm-Message-State: AOAM530OYFrFbC8jGdOgxl+J2LDCF4kcBHms4QAZUSDKkbCO8PmIslYN
 fMs+kDVC8qjjBqgaaSrhdMAc+w==
X-Google-Smtp-Source: ABdhPJzuBniBAoKdpG7zL5Yjc2gC4M7NaH//NmLtjnw9ouao4w7jITuLZrfsFG4STEoZTaEt2XSUzw==
X-Received: by 2002:a1c:308:: with SMTP id 8mr18004734wmd.125.1592839216124;
 Mon, 22 Jun 2020 08:20:16 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id t5sm11677978wmj.37.2020.06.22.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 08:20:15 -0700 (PDT)
Date: Mon, 22 Jun 2020 15:20:14 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v2] drm/mediatek: check plane visibility in atomic_update
Message-ID: <20200622152014.GA260716@chromium.org>
References: <20200622150109.91205-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200622150109.91205-1-hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

On Mon, Jun 22, 2020 at 11:01:09PM +0800, Hsin-Yi Wang wrote:
> Disable the plane if it's not visible. Otherwise mtk_ovl_layer_config()
> would proceed with invalid plane and we may see vblank timeout.
> 
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
> v2: Add fixes tag
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 

Thank you for the patch. Please see my comments inline.

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index c2bd683a87c8..74dc71c7f3b6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -164,6 +164,16 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  						   true, true);
>  }
>  
> +static void mtk_plane_atomic_disable(struct drm_plane *plane,
> +				     struct drm_plane_state *old_state)
> +{
> +	struct mtk_plane_state *state = to_mtk_plane_state(plane->state);
> +
> +	state->pending.enable = false;
> +	wmb(); /* Make sure the above parameter is set before update */
> +	state->pending.dirty = true;
> +}
> +
>  static void mtk_plane_atomic_update(struct drm_plane *plane,
>  				    struct drm_plane_state *old_state)
>  {
> @@ -178,6 +188,9 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>  	if (!crtc || WARN_ON(!fb))
>  		return;
>  
> +	if (!plane->state->visible)
> +		return mtk_plane_atomic_disable(plane, old_state);

nit: Both this function and mtk_plane_atomic_disable() have the void return
type. Perhaps we should rather move the return, without a value, to a
separate statement?

Best regards,
Tomasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
