Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59493F82E6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 09:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B33D6E52E;
	Thu, 26 Aug 2021 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5156E52D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 07:13:54 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id n27so3586435oij.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 00:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xA0ubHokPyf55ptZxKnHdu1jkSa6dOYXCAUZPWsSxfM=;
 b=aJ49fu0jLIWCwX6QwAF1UuzaVuZkxmlFOpZaGg6nQL13VH/9n5Cugh2AyNQ2pU8qIL
 02cRUnKeAKokXlkWZEzlvh+01U53TZ8iquZW1XvYUAm7RRkWtQzLPTNsIFPyKHCTzWss
 oFNWGIZ7J4yngsA9MTgxyfFMZCHAWIszgTQGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xA0ubHokPyf55ptZxKnHdu1jkSa6dOYXCAUZPWsSxfM=;
 b=Y9+yBhCxFGDX25FgrYjDd9VVm6LZ1Jb1BxM+q7O60wZ5ejV9ZMcOcpLjzR5xTx54sm
 JI5BmiAlknWa/nvPWKJs6qcvqYzw7ATiTHwN+Kk9YYdkLrRIS4Lp4bX/MvH4e8mOVfu2
 Y52ZCrICKLEKtUhF3GKHvWBdSirYKGd2C7UeSJtvtIjxF/tDu45/nl3A9+hlioJIWPvH
 tvnvVm9LLXuymq0cR6UxJEgBpQUq4LXUy015GEi4HEbnHo/0zey+Jlwp07JqJxCc1gfZ
 dM3ax7C9XDjRt99bbixzu0xwT2xsCU1jH9ipcSFxMMT7VBmmzMrDu8UhAQVhZ6aQLqQ0
 wEcw==
X-Gm-Message-State: AOAM530S2SnPnhzoT1brsMmCdVSAkEB6VJ41WaXjrGYojOS8YjJYM5rz
 I5LLUzIEiY8+zT/yWHNOQeJ4W5mDkciqGfWARGNFpw==
X-Google-Smtp-Source: ABdhPJxBbbO7G//Q2O+ANJV8n2gAGuxxyu1rCbl4jfaW+n/fxUhkiJ/Xf4do2ZEEPRQ4hcXIFfwebrrqPQFwsDJz0kQ=
X-Received: by 2002:a05:6808:180e:: with SMTP id
 bh14mr1396999oib.19.1629962033632; 
 Thu, 26 Aug 2021 00:13:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Aug 2021 07:13:53 +0000
MIME-Version: 1.0
In-Reply-To: <20210825234233.1721068-4-bjorn.andersson@linaro.org>
References: <20210825234233.1721068-1-bjorn.andersson@linaro.org>
 <20210825234233.1721068-4-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 26 Aug 2021 07:13:53 +0000
Message-ID: <CAE-0n50JXw6KL-u70csWS-9F6YhZy0pNah91h4e9a_9MnjJzmA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm/msm/dp: Support up to 3 DP controllers
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-08-25 16:42:31)
> Based on the removal of the g_dp_display and the movement of the
> priv->dp lookup into the DP code it's now possible to have multiple
> DP instances.
>
> In line with the other controllers in the MSM driver, introduce a
> per-compatible list of base addresses which is used to resolve the
> "instance id" for the given DP controller. This instance id is used as
> index in the priv->dp[] array.
>
> Then extend the initialization code to initialize struct drm_encoder for
> each of the registered priv->dp[] and update the logic for associating
> each struct msm_dp with the struct dpu_encoder_virt.
>
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Update dpu_encoder_setup() to store the reference to the msm_dp in our dpu_enc
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 60 +++++++++++--------
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c           | 51 ++++++++++++++--
>  drivers/gpu/drm/msm/msm_drv.h                 |  2 +-
>  5 files changed, 90 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b7f33da2799c..9cd9539a1504 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2173,7 +2173,7 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
>                                 dpu_encoder_vsync_event_handler,
>                                 0);
>         else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> -               dpu_enc->dp = priv->dp;
> +               dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
>
>         INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>                         dpu_encoder_off_work);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f655adbc2421..a793cc8a007e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -188,6 +188,7 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>         struct dentry *entry;
>         struct drm_device *dev;
>         struct msm_drm_private *priv;
> +       int i;
>
>         if (!p)
>                 return -EINVAL;
> @@ -203,8 +204,8 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>         dpu_debugfs_vbif_init(dpu_kms, entry);
>         dpu_debugfs_core_irq_init(dpu_kms, entry);
>
> -       if (priv->dp)
> -               msm_dp_debugfs_init(priv->dp, minor);
> +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> +               msm_dp_debugfs_init(priv->dp[i], minor);

Does this need the same if (!priv->dp) continue check like the other
loops over priv->dp?

>
>         return dpu_core_perf_debugfs_init(dpu_kms, entry);
>  }
> @@ -545,33 +546,40 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
>         int rc = 0;
> +       int i;
>
> -       if (!priv->dp)
> -               return rc;
> +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> +               if (!priv->dp[i])
> +                       continue;

Like this one.

>
> -       encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
> -       if (IS_ERR(encoder)) {
> -               DPU_ERROR("encoder init failed for dsi display\n");
> -               return PTR_ERR(encoder);
> -       }
> +               encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
> +               if (IS_ERR(encoder)) {
> +                       DPU_ERROR("encoder init failed for dsi display\n");
> +                       return PTR_ERR(encoder);
> +               }
>
> -       memset(&info, 0, sizeof(info));
> -       rc = msm_dp_modeset_init(priv->dp, dev, encoder);
> -       if (rc) {
> -               DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> -               drm_encoder_cleanup(encoder);
> -               return rc;
> -       }
> +               memset(&info, 0, sizeof(info));
> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> +               if (rc) {
> +                       DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> +                       drm_encoder_cleanup(encoder);
> +                       return rc;
> +               }
>
> -       priv->encoders[priv->num_encoders++] = encoder;
> +               priv->encoders[priv->num_encoders++] = encoder;
> +
> +               info.num_of_h_tiles = 1;
> +               info.h_tile_instance[0] = i;
> +               info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> +               info.intf_type = encoder->encoder_type;
> +               rc = dpu_encoder_setup(dev, encoder, &info);
> +               if (rc) {
> +                       DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +                                 encoder->base.id, rc);
> +                       return rc;
> +               }
> +       }
>
> -       info.num_of_h_tiles = 1;
> -       info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> -       info.intf_type = encoder->encoder_type;
> -       rc = dpu_encoder_setup(dev, encoder, &info);
> -       if (rc)
> -               DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> -                         encoder->base.id, rc);
>         return rc;
>  }
>
> @@ -792,6 +800,7 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>  {
>         struct msm_drm_private *priv;
>         struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +       int i;
>
>         if (!dpu_kms || !dpu_kms->dev)
>                 return -EINVAL;
> @@ -800,7 +809,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>         if (!priv)
>                 return -EINVAL;
>
> -       msm_dp_irq_postinstall(priv->dp);
> +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> +               msm_dp_irq_postinstall(priv->dp[i]);

This one too? Or maybe those gained NULL pointer checks.

>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2c7de43f655a..4a6132c18e57 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -78,6 +78,8 @@ struct dp_display_private {
>         char *name;
>         int irq;
>
> +       int id;

unsigned int?

> +
>         /* state variables */
>         bool core_initialized;
>         bool hpd_irq_on;
> @@ -115,8 +117,19 @@ struct dp_display_private {
>         struct dp_audio *audio;
>  };
>
> +
> +struct msm_dp_config {
> +       phys_addr_t io_start[3];
> +       size_t num_dp;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +       .io_start = { 0x0ae90000 },
> +       .num_dp = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
> -       {.compatible = "qcom,sc7180-dp"},
> +       { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>         {}
>  };
>
> @@ -211,7 +224,7 @@ static int dp_display_bind(struct device *dev, struct device *master,
>
>         dp->dp_display.drm_dev = drm;
>         priv = drm->dev_private;
> -       priv->dp = &(dp->dp_display);
> +       priv->dp[dp->id] = &(dp->dp_display);
>
>         rc = dp->parser->parse(dp->parser);
>         if (rc) {
> @@ -233,8 +246,11 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
> +
>
>  end:
>         return rc;
> @@ -249,7 +265,7 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
> -       priv->dp = NULL;
> +       priv->dp[dp->id] = NULL;
>  }
>
>  static const struct component_ops dp_display_comp_ops = {
> @@ -1180,6 +1196,26 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         return 0;
>  }
>
> +static int dp_display_get_id(struct platform_device *pdev)
> +{
> +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> +       struct resource *res;
> +       int i;
> +
> +

Nitpick: Drop double newline.

> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
> +
> +       for (i = 0; i < cfg->num_dp; i++) {
> +               if (cfg->io_start[i] == res->start)
> +                       return i;
> +       }

Nitpick: drop braces

> +
> +       dev_err(&pdev->dev, "unknown displayport instance\n");
> +       return -EINVAL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>         int rc = 0;
> @@ -1194,6 +1230,10 @@ static int dp_display_probe(struct platform_device *pdev)
>         if (!dp)
>                 return -ENOMEM;
>
> +       dp->id = dp_display_get_id(pdev);

Ah ok, it's signed for this error check. Maybe assign dp->id in the
function and return 0 instead of assigning it here?
dp_display_assign_id()

> +       if (dp->id < 0)
> +               return -EINVAL;
> +
>         dp->pdev = pdev;
>         dp->name = "drm_dp";
>
> @@ -1388,6 +1428,9 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>         struct device *dev;
>         int rc;
>
> +       if (!dp_display)
> +               return;

Alright that's one.

> +
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>         dev = &dp->pdev->dev;
>
