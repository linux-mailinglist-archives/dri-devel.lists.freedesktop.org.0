Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE53A981A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A58D6E566;
	Wed, 16 Jun 2021 10:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6FF6E566
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 10:49:30 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id c84so985609wme.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bA8bsqrupYSnAqh0tIsts0fYr4yat05kU2FFTIr3l8Y=;
 b=l+CoA4GzVmHjEe18yALMSGdlxroaIRXA+mGWsTJEXzxmi4h/XJfwahB6BIE31NMC/W
 cLDRgn6zqexCXfxotxOmbuoWFBMJwF3IZDF/wUuUgHtZqv9hcE1PISLl6Ogz6YZdB5ck
 D9hxxAXPkIeSyjCP2Cbc4kYaPq0i3BdRAqec3ljhrShwX0cYp15bTe+W/P+HcsiaDU1l
 H6daBYehRM3CDZVrqUqLKPDnDkXAWR5AOAdiHNW2XrCX8kOkdJ7yV1cJEaGnmGt3md4W
 Hy8YoPlduo+kIhkOeNtlaaJBtlPuUAe2RKoLEJYQL4ZEFZPbodHSwRkEYfEpm0XcBZh9
 BOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bA8bsqrupYSnAqh0tIsts0fYr4yat05kU2FFTIr3l8Y=;
 b=qFAyVjzrltM/nQKP5RlatIdEKWKlLJLVBFPSAgmWE6vbygvsxCwc9gES74h32rySe8
 Rl5aViyp9lA+H4kxskVP/1SyyRZpNqKl5GmFS0YdMqfDxtdPwh/+PBTvt8RFQBJ4Hitb
 jp0cpxFkb6bPSCwCku6MbdEG6SsF6uHfv6d8sD7uUeX/qmBEIutYO96hzOoKQV1ERY9+
 BAOiAF4G2BGkT97FR0Il072JIiB6Naescouv1UCeXVDIONJZOUff0XAXz7daNFHkmmWM
 ZcZJF+XIaQum6Xz3LJA3T0oHtdd/SdAi9wk+jj1aHwnkDmNzR0VvDochrFOU9Xm3zMTz
 4+1w==
X-Gm-Message-State: AOAM532BH756tQCsHpa04PzPOY9kyD//3JwCUc94eup/lmO3jVj9o6VS
 Awzb2dc9pRe5AW+HFkr/1SX51DpAQqRKGLrFX+V9BQ==
X-Google-Smtp-Source: ABdhPJwhDIwIaJw1Oyz3AVz+ittcROb6mcknz6385wLKjGs9jysEoL6/JYl5zGz4bhFOIaoDkQVbuoeipVvKZKJjTKc=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr4328043wmh.183.1623840569148; 
 Wed, 16 Jun 2021 03:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210525091059.234116-1-maxime@cerno.tech>
 <20210525091059.234116-3-maxime@cerno.tech>
In-Reply-To: <20210525091059.234116-3-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 16 Jun 2021 11:49:13 +0100
Message-ID: <CAPY8ntBzDNwdQsyYzdHkCuZOARwWBmM9B7SEdzrYUQBYymKVOg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, Tim Gover <tim.gover@raspberrypi.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Tue, 25 May 2021 at 10:11, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to access the HDMI controller, we need to make sure the HSM
> clock is enabled. If we were to access it with the clock disabled, the
> CPU would completely hang, resulting in an hard crash.
>
> Since we have different code path that would require it, let's move that
> clock enable / disable to runtime_pm that will take care of the
> reference counting for us.

This does change the order of clk_set_rate vs clk_prepare_enable, so
the clock is already running during
vc4_hdmi_encoder_pre_crtc_configure when the pixel rate is known.
However the crtc and HDMI blocks won't be actively passing pixels at
that point, so I don't see an issue with changing the rate. The clock
manager block will sort out the rate change happily.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 41 +++++++++++++++++++++++++---------
>  1 file changed, 31 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index f9de8632a28b..867009a471e1 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -632,7 +632,6 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *encoder,
>                    HDMI_READ(HDMI_VID_CTL) & ~VC4_HD_VID_CTL_ENABLE);
>
>         clk_disable_unprepare(vc4_hdmi->pixel_bvb_clock);
> -       clk_disable_unprepare(vc4_hdmi->hsm_clock);
>         clk_disable_unprepare(vc4_hdmi->pixel_clock);
>
>         ret = pm_runtime_put(&vc4_hdmi->pdev->dev);
> @@ -943,13 +942,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                 return;
>         }
>
> -       ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> -       if (ret) {
> -               DRM_ERROR("Failed to turn on HSM clock: %d\n", ret);
> -               clk_disable_unprepare(vc4_hdmi->pixel_clock);
> -               return;
> -       }
> -
>         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
>
>         if (pixel_rate > 297000000)
> @@ -962,7 +954,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>         ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
>         if (ret) {
>                 DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> -               clk_disable_unprepare(vc4_hdmi->hsm_clock);
>                 clk_disable_unprepare(vc4_hdmi->pixel_clock);
>                 return;
>         }
> @@ -970,7 +961,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>         ret = clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
>         if (ret) {
>                 DRM_ERROR("Failed to turn on pixel bvb clock: %d\n", ret);
> -               clk_disable_unprepare(vc4_hdmi->hsm_clock);
>                 clk_disable_unprepare(vc4_hdmi->pixel_clock);
>                 return;
>         }
> @@ -2097,6 +2087,29 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
>         return 0;
>  }
>
> +#ifdef CONFIG_PM
> +static int vc4_hdmi_runtime_suspend(struct device *dev)
> +{
> +       struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> +
> +       clk_disable_unprepare(vc4_hdmi->hsm_clock);
> +
> +       return 0;
> +}
> +
> +static int vc4_hdmi_runtime_resume(struct device *dev)
> +{
> +       struct vc4_hdmi *vc4_hdmi = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = clk_prepare_enable(vc4_hdmi->hsm_clock);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +#endif
> +
>  static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>  {
>         const struct vc4_hdmi_variant *variant = of_device_get_match_data(dev);
> @@ -2353,11 +2366,19 @@ static const struct of_device_id vc4_hdmi_dt_match[] = {
>         {}
>  };
>
> +
> +static const struct dev_pm_ops vc4_hdmi_pm_ops = {
> +       SET_RUNTIME_PM_OPS(vc4_hdmi_runtime_suspend,
> +                          vc4_hdmi_runtime_resume,
> +                          NULL)
> +};
> +
>  struct platform_driver vc4_hdmi_driver = {
>         .probe = vc4_hdmi_dev_probe,
>         .remove = vc4_hdmi_dev_remove,
>         .driver = {
>                 .name = "vc4_hdmi",
>                 .of_match_table = vc4_hdmi_dt_match,
> +               .pm = &vc4_hdmi_pm_ops,
>         },
>  };
> --
> 2.31.1
>
