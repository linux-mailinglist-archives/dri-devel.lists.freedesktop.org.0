Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046238902AF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABAD112484;
	Thu, 28 Mar 2024 15:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Bhgao8tf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A03010F955
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:10:26 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-60a0599f6e5so9929757b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711638625; x=1712243425; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=99Mo/V68HXd+sz5mhFpevV6sd2JzgGnAsHv1MLNMKAI=;
 b=Bhgao8tflLya++fW2IAYsW1QExxZ3KpN1dmx//1q8LyVyOlUWb6B8PLzr2alBC30uR
 fMiBaG9iXSnpbMKJW90zCXAZbsREAbYaRTmk9EYnA9KsZQq8i0nZxlT5NEgJAw59DQtE
 N5GY1JXV6BOL3xV6fTyy/cf/KAL5LPtBI4pZxBCOz2NJt60r15+G4IBF3G/785dTZ3TJ
 flCr5RJ6x+vYuig9lKPvOKWNCsmn8vKLg1R+Y+m6C1S8oL+og8OI4SdAcX8i05onbyj+
 mAvZIj7NX3U9s9MVLYDY2b1NNw/NyZsH8Id0LTGSPKc6rJ/mE8q9+ZQ1JVFsAoRIYHGD
 IK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711638625; x=1712243425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=99Mo/V68HXd+sz5mhFpevV6sd2JzgGnAsHv1MLNMKAI=;
 b=ZuCJJFKbmqjPtTOKLvU5MY+WyJ01TQJKLYRNHKcGk9VwjOvCOHLgakLr6ByLYebIUX
 CMRSJvuHF+zVSOwMB5NDrmLLEjz1oLdUroJ94RXJF8+OiEY7fNsMBNC+tkIh1gZOGEHp
 IfVXXMsPZRkJjJ+5VnBMeMydS88XiCED1y2KF6mk9JpcB4PWJmDkhPthghN9L7FlLyVy
 TgojWIFy81g9Ws9+FK/d/i5yVdKuCFqo45RVFGZEffoF0X2ItSNLtxwgcrLnEWH6IjsK
 VT4fHwPOAtJNiPeltqTwZXZ/KskESXrzzFqrLmJjvQ6c238dSYPgsUUMyy9mx0/grY44
 Y/TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzx8rrc9aHZMIuBRDXPxA3S+GCYWmZLYDW7af5NOL4qzLMxVTEgGNwdIR1LMgdR8DfsDSGNL96ptrqwSU3vlTlWrVTnpXDPXF+Sc8lxyJT
X-Gm-Message-State: AOJu0YzePqX14LT5wUXeKno9PG2z0olT2oitStRzCCg3nboXxDVLm3u/
 rDGU3KsYgtQ7wOBPh94RDsafrISreqhSbX6B41Rg/ue5pPDLAWGZpH/srlAW8ii1xARCQ08ZRNp
 8BhXI1yDDcE+Ms2Gcwfwy3BYk+O4oQPAjC4pzqQ==
X-Google-Smtp-Source: AGHT+IGuA+4cx73FJucI79bJNmTxWLp9SJ6WHwW9pxoOqq2SDliWPzccRf/ZrY5es961w3mun8AqdWA4kSgWxOoQM+0=
X-Received: by 2002:a25:aae6:0:b0:dcc:2f94:591a with SMTP id
 t93-20020a25aae6000000b00dcc2f94591amr2639484ybi.12.1711638624863; Thu, 28
 Mar 2024 08:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org>
 <20240328111158.2074351-3-jun.nie@linaro.org>
In-Reply-To: <20240328111158.2074351-3-jun.nie@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Mar 2024 17:10:13 +0200
Message-ID: <CAA8EJpphXsj6JCqT7k5NoeXvn7cgvW7otEXEq7h2rPyu1xP6gA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/panel: Enable DSC for Visionox VTDR6130 panel
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 marijn.suijten@somainline.org, sean@poorly.run
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

On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
>
> Enable display compression (DSC v1.2) for 1080x2400 Visionox
> VTDR6130 AMOLED DSI panel. DTS property is needed to enable DSC.
> Default configuration is video mode + non-DSC for any back
> compatibility.

The changelog talks about the DSC only, while the changes also include
the CMD mode support. This should be split to a separate patch.

>
> Below modes works on SM8650. While cmd mode does not work yet.
> - video mode + DSC
> - video mode
> - cmd mode + DSC
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 58 ++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index 540099253e1b..d6c44816cdd0 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>
>  #include <drm/display/drm_dsc.h>
> +#include <drm/display/drm_dsc_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_panel.h>
> @@ -17,9 +18,12 @@
>
>  struct visionox_vtdr6130 {
>         struct drm_panel panel;
> +       struct drm_dsc_config dsc;
>         struct mipi_dsi_device *dsi;
>         struct gpio_desc *reset_gpio;
>         struct regulator_bulk_data supplies[3];
> +       bool cmd_mode;
> +       bool dsc_enable;
>  };
>
>  static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
> @@ -49,12 +53,20 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
>         if (ret)
>                 return ret;
>
> +       if (ctx->dsc_enable)
> +               mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);

It it really MIPI_DCS_GET_COMPRESSION_MODE?
> +
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
>         mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
>         mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
>         mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
>         mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
> -       mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +
> +       if (ctx->cmd_mode)
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
> +       else
> +               mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
> +
>         mipi_dsi_dcs_write_seq(dsi, 0x70,
>                                0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
>                                0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
> @@ -205,6 +217,26 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
>         .height_mm = 157,
>  };
>
> +static int visionox_vtdr6130_enable(struct drm_panel *panel)
> +{
> +       struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
> +       struct mipi_dsi_device *dsi = ctx->dsi;
> +       struct drm_dsc_picture_parameter_set pps;
> +       int ret;
> +
> +       if (!dsi->dsc)
> +               return 0;
> +
> +       drm_dsc_pps_payload_pack(&pps, dsi->dsc);
> +       ret = mipi_dsi_picture_parameter_set(dsi, &pps);
> +       if (ret) {
> +               dev_err(&dsi->dev, "Failed to set PPS\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
>                                        struct drm_connector *connector)
>  {
> @@ -228,6 +260,7 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
>         .prepare = visionox_vtdr6130_prepare,
>         .unprepare = visionox_vtdr6130_unprepare,
>         .get_modes = visionox_vtdr6130_get_modes,
> +       .enable = visionox_vtdr6130_enable,
>  };
>
>  static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
> @@ -260,12 +293,32 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>  {
>         struct device *dev = &dsi->dev;
>         struct visionox_vtdr6130 *ctx;
> +       struct drm_dsc_config *dsc;
>         int ret;
>
>         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>         if (!ctx)
>                 return -ENOMEM;
>
> +       ctx->cmd_mode = of_property_read_bool(dev->of_node, "enforce-cmd-mode");
> +       ctx->dsc_enable = of_property_read_bool(dev->of_node, "enable-dsc");
> +
> +       /* Set DSC params */
> +       if (ctx->dsc_enable) {
> +               dsc = &ctx->dsc;
> +               dsc->dsc_version_major = 0x1;
> +               dsc->dsc_version_minor = 0x2;
> +               dsc->slice_height = 40;
> +               dsc->slice_width = 540;
> +               dsc->slice_count = 2;
> +               dsc->slice_per_pkt = 1;
> +               dsc->bits_per_component = 8;
> +               dsc->bits_per_pixel = 8 << 4;
> +               dsc->block_pred_enable = true;
> +
> +               dsi->dsc = dsc;
> +       }
> +
>         ctx->supplies[0].supply = "vddio";
>         ctx->supplies[1].supply = "vci";
>         ctx->supplies[2].supply = "vdd";
> @@ -306,6 +359,9 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>                 return ret;
>         }
>
> +       dev_err(&dsi->dev, "discovered with %s mode %s\n",
> +               ctx->cmd_mode ? "cmd" : "video",
> +               ctx->dsc_enable ? "and DSC enabled" : "");
>         return 0;
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
