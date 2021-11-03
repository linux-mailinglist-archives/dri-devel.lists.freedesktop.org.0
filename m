Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117A544495A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 21:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D656E833;
	Wed,  3 Nov 2021 20:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8F173303
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 20:08:50 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 c185-20020a4a4fc2000000b002bce4df242cso1191247oob.10
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=i0vvoL0JhDjXjmlIHE6wEDSwgLEUMmC4L6sOXE++DvA=;
 b=OCNGd+q5dLrcaeXvfMZPoj2sl8Ui0K32vkccOOvgJW8migkcTA+31y9+PzED/tD1cg
 0W8/d+/GyZz1n9bOn9si75yiVqxzFhGcOGra75hYKJQMp+4nKyPeqZQYR0QiqdXm0/6t
 kIP8GuzXcOXTiHTk04ep8LQN2K4H+B6rlXKT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=i0vvoL0JhDjXjmlIHE6wEDSwgLEUMmC4L6sOXE++DvA=;
 b=zz0CZFdZ87Yl5tbgNsaZEPnrF62DeuoKmSrtiQ9xLBvUwdD2kDzanHyBtfP2eKY7Gm
 YZWKTZAS18RKMBespolo1nrR/pL01X5318DdnayWYQW3fez1ICLD6t+/OSivaCYN3erX
 yY6Tz+oUQOiVmq5jIHx3Cz03H3znWjXgFnychS3l6KZKCKpETB7ms1HlR0kMV6xQ7Phe
 kXfjL4ciBqrbY7f1QyTaZEdDDPeEe7jOKnqIfAlvKRQEL4POhD7P6xDg+fehZK5KxJ2k
 CPgP7Kvy8Ih1rJgX3p0fVjLKcv8q/z+L1KPS+r0Wr7Ckkg40OBVNmF1QjizupTG6vT83
 6yyg==
X-Gm-Message-State: AOAM532mqiO1x0m4SuMqbZ2xzwz5QYwtUjS/DpfAUrXMVjTxTxMvSnSj
 AXYvnu8nP7nx5m6gvxmmGVUbR7Ld2W57ApF2QhugsA==
X-Google-Smtp-Source: ABdhPJwpDKi7fj37JCIaFQ9MwgdUsogP8lps/n9C0M3ER5GGOxkRQhnyXyOfPbGiXTOZj1hBKXu6kzYFvZKi14wJJRY=
X-Received: by 2002:a4a:4085:: with SMTP id n127mr477122ooa.8.1635970129585;
 Wed, 03 Nov 2021 13:08:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Nov 2021 13:08:48 -0700
MIME-Version: 1.0
In-Reply-To: <1635891224-16357-1-git-send-email-khsieh@codeaurora.org>
References: <1635891224-16357-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 3 Nov 2021 13:08:48 -0700
Message-ID: <CAE-0n50XL90kGi48LOmniuS5bfAAShctNOuOv+65E6ZtpsCCtA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: employ bridge mechanism for display enable
 and disable
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org, airlied@linux.ie, 
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-11-02 15:13:44)
> Current display mode_set, enable and disable functions are implemented
> as function called directly from drm encoder. This patch have display
> mode_set, enable and disable be implemented as callback function of drm
> bridge.

Why is it important? Please add those details here.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  21 ------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   8 ++
>  drivers/gpu/drm/msm/dp/dp_display.c         |  26 +++----
>  drivers/gpu/drm/msm/dp/dp_display.h         |   8 ++
>  drivers/gpu/drm/msm/dp/dp_drm.c             | 113 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/msm_drv.h               |  29 ++-----
>  6 files changed, 147 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 27d98b5..3bbd09c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -557,6 +557,14 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>                                   encoder->base.id, rc);
>                         return rc;
>                 }
> +
> +               rc = msm_dp_bridge_init(priv->dp[i], dev, encoder);

Use tabs?

> +                if (rc) {
> +                       DPU_ERROR("failed to setup DPU bridge %d: rc:%d\n",
> +                                 encoder->base.id, rc);
> +                       return rc;
> +                }
> +
>         }
>
>         return rc;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e41dd40..317f963 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -569,8 +569,8 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         return 0;
>  };
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data);
> -static int dp_display_disable(struct dp_display_private *dp, u32 data);
> +static int __dp_display_enable(struct dp_display_private *dp, u32 data);
> +static int __dp_display_disable(struct dp_display_private *dp, u32 data);
>
>  static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>  {
> @@ -855,7 +855,7 @@ static int dp_display_prepare(struct msm_dp *dp_display)
>         return 0;
>  }
>
> -static int dp_display_enable(struct dp_display_private *dp, u32 data)
> +static int __dp_display_enable(struct dp_display_private *dp, u32 data)
>  {
>         int rc = 0;
>
> @@ -898,7 +898,7 @@ static int dp_display_post_enable(struct msm_dp *dp_display)
>         return 0;
>  }
>
> -static int dp_display_disable(struct dp_display_private *dp, u32 data)
> +static int __dp_display_disable(struct dp_display_private *dp, u32 data)
>  {
>         struct msm_dp *dp_display = &dp->dp_display;
>
> @@ -1533,7 +1533,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>         return 0;
>  }
>
> -int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
> +int dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>  {
>         int rc = 0;
>         struct dp_display_private *dp_display;
> @@ -1569,12 +1569,12 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>         if (state == ST_DISPLAY_OFF)
>                 dp_display_host_init(dp_display, true);
>
> -       dp_display_enable(dp_display, 0);
> +       __dp_display_enable(dp_display, 0);
>
>         rc = dp_display_post_enable(dp);
>         if (rc) {
>                 DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -               dp_display_disable(dp_display, 0);
> +               __dp_display_disable(dp_display, 0);
>                 dp_display_unprepare(dp);
>         }
>
> @@ -1590,7 +1590,7 @@ int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
>         return rc;
>  }
>
> -int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
> +int dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>  {
>         struct dp_display_private *dp_display;
>
> @@ -1601,7 +1601,7 @@ int msm_dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>         return 0;
>  }
>
> -int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
> +int dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>  {
>         int rc = 0;
>         u32 state;
> @@ -1614,7 +1614,7 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>         /* stop sentinel checking */
>         dp_del_event(dp_display, EV_DISCONNECT_PENDING_TIMEOUT);
>
> -       dp_display_disable(dp_display, 0);
> +       __dp_display_disable(dp_display, 0);
>
>         rc = dp_display_unprepare(dp);
>         if (rc)
> @@ -1632,9 +1632,9 @@ int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
>         return rc;
>  }
>
> -void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
> -                               struct drm_display_mode *mode,
> -                               struct drm_display_mode *adjusted_mode)
> +void dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,

I enjoyed the msm_dp prefix before, please leave this alone. It will
make the patch much smaller too.

> +                               const struct drm_display_mode *mode,
> +                               const struct drm_display_mode *adjusted_mode)
>  {
>         struct dp_display_private *dp_display;
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 76f45f9..4fb6ada 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -13,6 +13,7 @@
>  struct msm_dp {
>         struct drm_device *drm_dev;
>         struct device *codec_dev;
> +       struct drm_bridge *bridge;
>         struct drm_connector *connector;
>         struct drm_encoder *encoder;
>         struct drm_panel *drm_panel;
> @@ -40,4 +41,11 @@ int dp_display_get_test_bpp(struct msm_dp *dp_display);
>  void dp_display_signal_audio_start(struct msm_dp *dp_display);
>  void dp_display_signal_audio_complete(struct msm_dp *dp_display);
>
> +int dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
> +int dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
> +int dp_display_pre_disable(struct msm_dp *dp, struct drm_encoder *encoder);
> +void dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
> +                               const struct drm_display_mode *mode,
> +                               const struct drm_display_mode *adjusted_mode);
> +
>  #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index f33e315..812a091 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -3,14 +3,25 @@
>   * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
>   */
>
> +#include <linux/platform_device.h>

Why is this include necessary?

> +
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>
>  #include "msm_drv.h"
>  #include "msm_kms.h"
>  #include "dp_drm.h"
>
> +
> +struct dp_bridge {

msm_dp_bridge?

> +        struct drm_bridge bridge;
> +        struct msm_dp *dp_display;
> +};
> +
> +#define to_dp_display(x)     container_of((x), struct dp_bridge, bridge)
> +
>  struct dp_connector {
>         struct drm_connector base;
>         struct msm_dp *dp_display;
> @@ -162,3 +173,105 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
>
>         return connector;
>  }
> +
> +
> +static int dp_bridge_attach(struct drm_bridge *dp_bridge,
> +                                enum drm_bridge_attach_flags flags)
> +{
> +       return 0;
> +}
> +
> +static bool dp_bridge_mode_fixup(struct drm_bridge *drm_bridge,
> +                                  const struct drm_display_mode *mode,
> +                                  struct drm_display_mode *adjusted_mode)
> +{
> +       return true;
> +}

Do we need these largely empty functions?

> +
> +static void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> +                                const struct drm_display_mode *mode,
> +                                const struct drm_display_mode *adjusted_mode)
> +{
> +       struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       dp_display_mode_set(dp_display, drm_bridge->encoder, mode, adjusted_mode);
> +}
> +
> +static void dp_bridge_pre_enable(struct drm_bridge *drm_bridge)
> +{
> +
> +}

Do we need this empty function?

> +
> +static void dp_bridge_enable(struct drm_bridge *drm_bridge)
> +{
> +       struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       dp_display_enable(dp_display, drm_bridge->encoder);
> +}
> +
> +static void dp_bridge_disable(struct drm_bridge *drm_bridge)
> +{
> +       struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       dp_display_pre_disable(dp_display, drm_bridge->encoder);
> +}
> +
> +static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
> +{
> +       struct dp_bridge *dp_bridge = to_dp_display(drm_bridge);
> +       struct msm_dp *dp_display = dp_bridge->dp_display;
> +
> +       dp_display_disable(dp_display, drm_bridge->encoder);
> +}
> +
> +static const struct drm_bridge_funcs dp_bridge_ops = {
> +        .attach       = dp_bridge_attach,
> +        .mode_fixup   = dp_bridge_mode_fixup,
> +        .pre_enable   = dp_bridge_pre_enable,
> +        .enable       = dp_bridge_enable,
> +        .disable      = dp_bridge_disable,
> +        .post_disable = dp_bridge_post_disable,
> +        .mode_set     = dp_bridge_mode_set,
> +};
> +
> +int msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> +                       struct drm_encoder *encoder)
> +{
> +       int rc = 0;

Use tabs?

> +        struct msm_drm_private *priv = NULL;

Please drop initialization of rc and priv.

> +        struct dp_bridge *dp_bridge;
> +       struct drm_bridge *bridge;

Use tabs?

> +
> +        dp_bridge = kzalloc(sizeof(*dp_bridge), GFP_KERNEL);
> +        if (!dp_bridge) {
> +                rc = -ENOMEM;
> +                goto error;

return -ENOMEM;

> +        }
> +
> +        dp_bridge->dp_display = dp_display;
> +
> +       bridge = &dp_bridge->bridge;

Use tabs?

> +        bridge->funcs = &dp_bridge_ops;
> +        bridge->encoder = encoder;
> +
> +        rc = drm_bridge_attach(encoder, bridge, NULL, 0);

We need DRM_BRIDGE_ATTACH_NO_CONNECTOR flag set as this driver makes a
connector, right?

> +        if (rc) {
> +                DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
> +                goto error_free_bridge;
> +        }
> +
> +        priv = dev->dev_private;
> +       priv->bridges[priv->num_bridges++] = bridge;
> +       dp_display->bridge = bridge;

More weird tabs.

> +
> +        return 0;
> +
> +error_free_bridge:
> +        kfree(bridge);
> +error:
> +        return rc;
> +
> +}
