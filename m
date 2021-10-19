Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A37E433238
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC346E165;
	Tue, 19 Oct 2021 09:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084966E165
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 09:27:56 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id y4so13304403plb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 02:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WqQuigPQkG7yIJnoURmwHOZ7CYWB7+IfTh42MrwnNsA=;
 b=HgX0s/Pmlc/k5zz3N/9Rz1+xZgFix7E3aZtwr7ii6m5YGE6II1pdsylJDHgE3SYIFx
 QsnmdcjwNrozuscdBbI9oIJEQPZ0U+ExW6GHDxOlF3sEzP3LXAMvCpun74Cd4v0BuLJu
 JR/sJtnKHJXNeSfaCS0bTxYUo2rFEzwjVsU4WjOqtIkBQJIWE9wLdZG2yoo+IxEoXuOS
 8fw3kHVoMQ5dzBAxlyQVeRYM796JtvP/ipqutDWZiJefoZ7GkGZvB/cfk5z+cWk4pH9Q
 6Lh/0oCqrvq1xERjNJWQ378uDfdS2r2+X/CTWXCqT8+wn+Ie1IZSGbi/z0B47kefVM6w
 nS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WqQuigPQkG7yIJnoURmwHOZ7CYWB7+IfTh42MrwnNsA=;
 b=NpyF/j7b240OayvYmLOwlyQQa0zUG4s+KZECEqqMS0JT2DlerV4s4gTnFlJoNglskY
 uDoM1ammgViBbJOsesRFvfUO7hlauLI89MCiNuc9GELDFjrRbxsmxqMXb9e9C7PLQSlM
 gpjT0BmIqzv2wIz9hSqFSXqkumx7Xu1WBFFMXweEbaRvdbsZIrA9vUt0GofaJEcADDOB
 ASZh2KIQimQmfM3eIj+95rhojsSXYgxVlS795PMkeKrBD8CK3i9v4yAT7GTA6A1v4gnQ
 Tan/Bxj4xYvcpAcr4/NGLNwexVlrGVF4E8/AGfW7NuKKvwdCTAAGDavtHKD2Fn7i8p/z
 IWFg==
X-Gm-Message-State: AOAM5311gf1GIVsdg4Ft/qOiwglJ8x5D+Grs8h9gMQ2AUmz9f/vc3VBK
 5XdrWBP5/IiwbUiSLcVcT7tqnab0ljY8idIokZiYeQ==
X-Google-Smtp-Source: ABdhPJwrhmSxlRtYdBf+1xoIqYntrpTC3t1Cb9/54BAEeKiXHf4bI6D9JM/OrpP2k//fY9NFIe2XMN+J+V15C1C83K8=
X-Received: by 2002:a17:90b:1644:: with SMTP id
 il4mr5260442pjb.179.1634635675569; 
 Tue, 19 Oct 2021 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211002233447.1105-1-digetx@gmail.com>
 <20211002233447.1105-4-digetx@gmail.com>
In-Reply-To: <20211002233447.1105-4-digetx@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Oct 2021 11:27:44 +0200
Message-ID: <CAG3jFytqbBqucgT2g76Us-8JV-d-RWo8ErHF0z28WCzhU9nTSw@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] drm/bridge: tc358768: Calculate video start delay
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-tegra@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Sun, 3 Oct 2021 at 01:35, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Calculate video start delay based on the display timing instead
> of hardcoding it to a default value. This fixes "trembling" display
> output on Asus Transformer TF700T which uses Panasonic VVX10F004B00
> display panel.
>
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
> Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/bridge/tc358768.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 10ebd0621ad3..5b3f8723bd3d 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -634,7 +634,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         u32 val, val2, lptxcnt, hact, data_type;
>         const struct drm_display_mode *mode;
>         u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
> -       u32 dsiclk, dsibclk;
> +       u32 dsiclk, dsibclk, video_start;
> +       const u32 internal_delay = 40;
>         int ret, i;
>
>         tc358768_hw_enable(priv);
> @@ -663,23 +664,27 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         case MIPI_DSI_FMT_RGB888:
>                 val |= (0x3 << 4);
>                 hact = mode->hdisplay * 3;
> +               video_start = (mode->htotal - mode->hsync_start) * 3;
>                 data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
>                 break;
>         case MIPI_DSI_FMT_RGB666:
>                 val |= (0x4 << 4);
>                 hact = mode->hdisplay * 3;
> +               video_start = (mode->htotal - mode->hsync_start) * 3;
>                 data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
>                 break;
>
>         case MIPI_DSI_FMT_RGB666_PACKED:
>                 val |= (0x4 << 4) | BIT(3);
>                 hact = mode->hdisplay * 18 / 8;
> +               video_start = (mode->htotal - mode->hsync_start) * 18 / 8;
>                 data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
>                 break;
>
>         case MIPI_DSI_FMT_RGB565:
>                 val |= (0x5 << 4);
>                 hact = mode->hdisplay * 2;
> +               video_start = (mode->htotal - mode->hsync_start) * 2;
>                 data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
>                 break;
>         default:
> @@ -690,7 +695,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>         }
>
>         /* VSDly[9:0] */
> -       tc358768_write(priv, TC358768_VSDLY, 1);
> +       video_start = max(video_start, internal_delay + 1) - internal_delay;
> +       tc358768_write(priv, TC358768_VSDLY, video_start);
>
>         tc358768_write(priv, TC358768_DATAFMT, val);
>         tc358768_write(priv, TC358768_DSITX_DT, data_type);
> --
> 2.32.0
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
