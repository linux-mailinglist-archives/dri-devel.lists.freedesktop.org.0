Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0C060F9E3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8858D10E644;
	Thu, 27 Oct 2022 13:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D1D10E646
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 13:58:47 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n12so4793513eja.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H9twCSyGmHCfZTs1VqmLobwiwtuvoOis8W3XsKIxLx8=;
 b=B8yOwFyva/x37BSg5YDwe/WTfn4Dy+OrYCl6yAd0D663EOKU10TTXX8ypPceVKOQQU
 WY5R0qdFqm87oaw6Kk/HgZWE+b93ELqsR/67egZ41eYecVTXylNCRrYJDMsq2am/USo1
 6zOYJXNTJGCwjZa93uQA6i4+k2VGkojOf1NK7Cw37b3PtWI24ZMohrhW0zhL6vsyLWry
 Kahv2nEBm7gxo4D/PdPJZGXpQr6qQegXrhvjJWKCIyiYoFW+DWEV4FdYp7njscxE0Xuz
 hKQNglNp2/mpEWnl6QRo8g+FgoOG6v/JfXwHTIYpHe+FC/WfNr+pl7j39QBAsn0axctO
 dhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H9twCSyGmHCfZTs1VqmLobwiwtuvoOis8W3XsKIxLx8=;
 b=IlVX+obCURw9AaT/iMRvL23D4zPoZNsWQDjgL2XCs4/I/j4SctOqWrOU0aXccy9YAR
 Ew29j83gj7etk02W1MeWeFTJBqPktf6q6M7quDsydDcDRDkvPc/ooNw/bN2CX2Fq4QUn
 IXtxC5VW5U1Z9Ur+XgGCoGI3899cYNtG8H8g6KWo2EM1FS6jhusa6knbAT2T58taJmEI
 vPraq2L/mPmM0tKuJqTVhJy8IrTVoATn8TdTifHdcNEBFIzPonkzUKmDups7Hf5aSHDR
 /n44TV4jxtA3zFw+kmZiaPluwpLYX2gBoyYdvoR8P33cE2KWXzHw41hGA5kY+hPMf+9D
 7Hpw==
X-Gm-Message-State: ACrzQf02N6BJqgVs8OaIg3m9zK40vfZ1mdEwjvK52NZN0VWkLYEbFwic
 tLknUv0NF74Dca1d7KWPWv5qWejXPJRuBEZRM+lWnQ==
X-Google-Smtp-Source: AMsMyM4V4CJCvWjZUc/wuUPnShNPdQnD1fPVocjSK9OtmP7BhvowApGpOFwkw7Gvj2mgE8ZRTqrzyxI6fUECIDlD/m4=
X-Received: by 2002:a17:907:1c98:b0:78d:3b08:33ef with SMTP id
 nb24-20020a1709071c9800b0078d3b0833efmr43344625ejc.175.1666879125532; Thu, 27
 Oct 2022 06:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v5-0-fe9e7ac8b111@cerno.tech>
 <20220815-rpi-fix-4k-60-v5-5-fe9e7ac8b111@cerno.tech>
In-Reply-To: <20220815-rpi-fix-4k-60-v5-5-fe9e7ac8b111@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 27 Oct 2022 14:58:30 +0100
Message-ID: <CAPY8ntCft8_8TimHVs9LJk11Z6PEKtZynCfSUz_3g6-saVyzPQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
 code
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
Cc: dri-devel@lists.freedesktop.org, Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Scott Branden <sbranden@broadcom.com>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Oct 2022 at 13:53, Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to support higher HDMI frequencies, users have to set the
> hdmi_enable_4kp60 parameter in their config.txt file.
>
> This will have the side-effect of raising the maximum of the core clock,
> tied to the HVS, and managed by the HVS driver.
>
> However, we are querying this in the HDMI driver by poking into the HVS
> structure to get our struct clk handle.
>
> Let's make this part of the HVS bind implementation to have all the core
> clock related setup in the same place.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for the rename of the variable - pulling scrambling into it
made it confusing.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_drv.h  | 10 ++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 --------
>  drivers/gpu/drm/vc4/vc4_hvs.c  | 23 +++++++++++++++++++++++
>  4 files changed, 37 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 418a8242691f..8da2b80fdbd3 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -326,6 +326,8 @@ struct vc4_hvs {
>
>         struct clk *core_clk;
>
> +       unsigned long max_core_rate;
> +
>         /* Memory manager for CRTCs to allocate space in the display
>          * list.  Units are dwords.
>          */
> @@ -337,6 +339,14 @@ struct vc4_hvs {
>         struct drm_mm_node mitchell_netravali_filter;
>
>         struct debugfs_regset32 regset;
> +
> +       /*
> +        * Even if HDMI0 on the RPi4 can output modes requiring a pixel
> +        * rate higher than 297MHz, it needs some adjustments in the
> +        * config.txt file to be able to do so and thus won't always be
> +        * available.
> +        */
> +       bool vc5_hdmi_enable_hdmi_20;
>  };
>
>  struct vc4_plane {
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 3acc1858c55f..98a6643821bb 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -46,7 +46,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/rational.h>
>  #include <linux/reset.h>
> -#include <soc/bcm2835/raspberrypi-clocks.h>
>  #include <sound/dmaengine_pcm.h>
>  #include <sound/hdmi-codec.h>
>  #include <sound/pcm_drm_eld.h>
> @@ -460,6 +459,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
>  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>  {
>         struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> +       struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
>         int ret = 0;
>         struct edid *edid;
>
> @@ -483,7 +483,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>         ret = drm_add_edid_modes(connector, edid);
>         kfree(edid);
>
> -       if (vc4_hdmi->disable_4kp60) {
> +       if (!vc4->hvs->vc5_hdmi_enable_hdmi_20) {
>                 struct drm_device *drm = connector->dev;
>                 const struct drm_display_mode *mode;
>
> @@ -1757,11 +1757,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
>  {
>         const struct drm_connector *connector = &vc4_hdmi->connector;
>         const struct drm_display_info *info = &connector->display_info;
> +       struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
>
>         if (clock > vc4_hdmi->variant->max_pixel_clock)
>                 return MODE_CLOCK_HIGH;
>
> -       if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
> +       if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_14_MAX_TMDS_CLK)
>                 return MODE_CLOCK_HIGH;
>
>         if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
> @@ -3428,14 +3429,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi->disable_wifi_frequencies =
>                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
>
> -       if (variant->max_pixel_clock == 600000000) {
> -               struct vc4_dev *vc4 = to_vc4_dev(drm);
> -               unsigned int max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
> -
> -               if (max_rate < 550000000)
> -                       vc4_hdmi->disable_4kp60 = true;
> -       }
> -
>         ret = devm_pm_runtime_enable(dev);
>         if (ret)
>                 return ret;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index db823efb2563..e3619836ca17 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -156,14 +156,6 @@ struct vc4_hdmi {
>          */
>         bool disable_wifi_frequencies;
>
> -       /*
> -        * Even if HDMI0 on the RPi4 can output modes requiring a pixel
> -        * rate higher than 297MHz, it needs some adjustments in the
> -        * config.txt file to be able to do so and thus won't always be
> -        * available.
> -        */
> -       bool disable_4kp60;
> -
>         struct cec_adapter *cec_adap;
>         struct cec_msg cec_rx_msg;
>         bool cec_tx_ok;
> diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> index 4ac9f5a2d5f9..fc4b7310bf63 100644
> --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> @@ -28,6 +28,8 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_vblank.h>
>
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
>  #include "vc4_drv.h"
>  #include "vc4_regs.h"
>
> @@ -791,12 +793,33 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
>         hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
>
>         if (vc4->is_vc5) {
> +               struct rpi_firmware *firmware;
> +               struct device_node *node;
> +               unsigned int max_rate;
> +
> +               node = rpi_firmware_find_node();
> +               if (!node)
> +                       return -EINVAL;
> +
> +               firmware = rpi_firmware_get(node);
> +               of_node_put(node);
> +               if (!firmware)
> +                       return -EPROBE_DEFER;
> +
>                 hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
>                 if (IS_ERR(hvs->core_clk)) {
>                         dev_err(&pdev->dev, "Couldn't get core clock\n");
>                         return PTR_ERR(hvs->core_clk);
>                 }
>
> +               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> +                                                        RPI_FIRMWARE_CORE_CLK_ID);
> +               rpi_firmware_put(firmware);
> +               if (max_rate >= 550000000)
> +                       hvs->vc5_hdmi_enable_hdmi_20 = true;
> +
> +               hvs->max_core_rate = max_rate;
> +
>                 ret = clk_prepare_enable(hvs->core_clk);
>                 if (ret) {
>                         dev_err(&pdev->dev, "Couldn't enable the core clock\n");
>
> --
> b4 0.11.0-dev-99e3a
