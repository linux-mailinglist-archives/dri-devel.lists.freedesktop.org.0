Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242781B725
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 14:17:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F12E10E6CD;
	Thu, 21 Dec 2023 13:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB62910E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 13:17:43 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-dbdb124491cso612694276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703164662; x=1703769462; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yz4iMeRIk9TAyj97jIuOOIhseoq5SQwyyx45BqaJo/Y=;
 b=VMDf3cee5TSJiuF2SOFLvpWwxlwPZZuH7cGaHVgRJjZPluRz4pXZ5bQGVxCmHJoGoa
 wQ0ZXC9Y6zJvYzK1JSsMsUWYhY43QjOEgVPLeGeo1Dsj7h6xMAcyUvx9dulDwTB2Kcfe
 MNUOYADbr2PseGvSaLvySQ0c4QvTLB+j7w5dcunl94Uhxnnt3svYgtF/EPld1W2tJ56i
 MzbC3167JjbhQbXZ4Ui6s1oCUCDJV4F7w4TavPGOtxPaM9PxDi2IGdFqoyBoIQLaGN+h
 1EYTvaVvKN0jLLAoWm4Fsp/ub0LTMy88PDdyW2Z9ygD+zo3D0QbHDl+OhVmCtnGMcjP0
 LsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703164662; x=1703769462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yz4iMeRIk9TAyj97jIuOOIhseoq5SQwyyx45BqaJo/Y=;
 b=u0aT5/AWPvNQi43HQGUTuErylMyh3NDSFHX3zEOdfQn9t26//W2PW0QTzmR3TZOVMt
 iDgVZ3YMT9d+ofFOvUJRmQGOUGhjM6+2GguR5kzctz9OHpOSyeQ58bOa+hVW19HmCi+3
 8WJ+yV3L4KhNCfau1ozMzS8YS0tKsoBDRAuFWGrOUSAwtYJSJ0Iq9ZDs6gFIXPBeyIkS
 LEo9RLWnT+OpWTFWCEUz0MfFJBwHGAC+3iJrs51r7Dreh0VcbLj0ELyN4Nu9o+/gO4rm
 lPGut51Id1milV8QZqBPOgXFzFd/8BqTu7mtmS5sPI9qs1KCUs5wX54lV7vu4gIUk+dd
 Mcmw==
X-Gm-Message-State: AOJu0Yx8NP8y2+3EQmb+dymkiz16KfUS0nIHB34DJZY3qWCfzsr1Zfun
 3mmY5hL6WhEghYyWT+HicgVIuIA9PuZxDdxEcK/2D8c2GvxD7Q==
X-Google-Smtp-Source: AGHT+IE6C22+LNsiW2F843YHTth236QybUB1q3GOCwkhb/XTsX0HV0yBBuaiZlIIsroN5Kv3yXPy3tcoUpEyfVuKgWw=
X-Received: by 2002:a25:b312:0:b0:dbd:9a2f:be3d with SMTP id
 l18-20020a25b312000000b00dbd9a2fbe3dmr322201ybj.3.1703164662693; Thu, 21 Dec
 2023 05:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 15:17:31 +0200
Message-ID: <CAA8EJpq-NWUEe8QbUwDHu0BBSViWKh92PujD7PA84xgvSUsvhg@mail.gmail.com>
Subject: Re: [PATCH RESEND v1 4/8] drm/stm: ltdc: implement bus clock
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Sam Ravnborg <sam@ravnborg.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Dec 2023 at 14:45, Raphael Gallais-Pou
<raphael.gallais-pou@foss.st.com> wrote:
>
> From: Yannick Fertre <yannick.fertre@foss.st.com>
>
> The latest hardware version of the LTDC presents the addition of a bus
> clock, which contains the global configuration registers and the interrupt
> register.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>  drivers/gpu/drm/stm/ltdc.c | 8 ++++++++
>  drivers/gpu/drm/stm/ltdc.h | 1 +
>  2 files changed, 9 insertions(+)

I might be missing something, but I don't see this clock being set
(compare this patch to the patch 5/8)

>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 5576fdae4962..67064f47a4cb 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1896,6 +1896,8 @@ void ltdc_suspend(struct drm_device *ddev)
>
>         DRM_DEBUG_DRIVER("\n");
>         clk_disable_unprepare(ldev->pixel_clk);
> +       if (ldev->bus_clk)
> +               clk_disable_unprepare(ldev->bus_clk);
>  }
>
>  int ltdc_resume(struct drm_device *ddev)
> @@ -1910,6 +1912,12 @@ int ltdc_resume(struct drm_device *ddev)
>                 DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
>                 return ret;
>         }
> +       if (ldev->bus_clk) {
> +               if (clk_prepare_enable(ldev->bus_clk)) {
> +                       DRM_ERROR("Unable to prepare bus clock\n");
> +                       return -ENODEV;
> +               }
> +       }
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
> index 9d488043ffdb..155d8e4a7c6b 100644
> --- a/drivers/gpu/drm/stm/ltdc.h
> +++ b/drivers/gpu/drm/stm/ltdc.h
> @@ -44,6 +44,7 @@ struct ltdc_device {
>         void __iomem *regs;
>         struct regmap *regmap;
>         struct clk *pixel_clk;  /* lcd pixel clock */
> +       struct clk *bus_clk;    /* bus clock */
>         struct mutex err_lock;  /* protecting error_status */
>         struct ltdc_caps caps;
>         u32 irq_status;
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
