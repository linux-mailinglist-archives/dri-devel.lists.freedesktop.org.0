Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 205157FE7F5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 05:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CB410E6A8;
	Thu, 30 Nov 2023 04:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7077110E211
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 04:01:25 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so482714276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 20:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701316884; x=1701921684; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rc2jjMOCHQsvZRAal248ZAZheNBol7xmmTaeE09J2to=;
 b=Q04pV3YGYsGDLD2fZwRmkCogSWVG69jw8znyvKB+eWXuhQNZIdHVX9ujtRtm1min5O
 8+eq4jfr9+8zEredxdL0rG4ND7HsLBoPLhfYJMsBu0VTu7di4HczBewGA2qaPJMKjj/3
 DUX5VrDbJ2HqvvOuMa1L2i+eRedwQyB/fEeu/GoQwX1kXGj4s4vWqcWSWzcnDaJKTYWO
 haHhg/oVvea6gn8KUjLTZoOyaYBoPLKPZYPu0hN683RnzEgVWDyQL/7a1ri5wbQZSWIZ
 LgRtkfeqKap7OFeZmvQRlPx3kFx1fi2lnj7geJKsPshGEwJ9izEsCuJrzCDmE+lnNPL2
 K0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701316884; x=1701921684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rc2jjMOCHQsvZRAal248ZAZheNBol7xmmTaeE09J2to=;
 b=N0b/XxbXLhpTg1HCmLBNH3YFb3G07FjyalwbfBGjWn5TNoagqMWcya2ArKBxOL8pNq
 1pXrlIUW6RKzMal1ONAy+JDKYo8F1w81onOT+yHmyxw9y7WEFifOyh4w4qSl8L3J3Bhq
 SBShtcSd8F0XT8AI5DLIgMq+uTKZYIO2lkHiUFYa0T/3LeUfNoRZWXBOMB5JszImwmMJ
 Phms/lxasvfQTxHzx8lKVIAE3zaGDK/b0UoUimoTjjIz8talv5BE+lLVf+FdXNmwwMvy
 kfO2nZtBgW//t0taQcPGvZSGDRkGcjcwjZOtwdj+s9EaK+XfbtbDIWBn9VRLfsFAycxO
 VK4Q==
X-Gm-Message-State: AOJu0Yy7tDM0lMVAOQMk3fFQnRgOCik+/l6qH70oKkKtcZWgu+GHNbiK
 EoEgte1+VFCwdDAnGMkAdVx5NjUWm8J+RhCg4Hupzg==
X-Google-Smtp-Source: AGHT+IGQGb+o4eeHJcI+kAqRCa2OqIMR+tNt5W/xRNGbppDywvDH1GUjcsTqNeD34hVFIU6neKWZ5X7wj0ZA6Pr9m1s=
X-Received: by 2002:a25:d30c:0:b0:da0:50e6:12c5 with SMTP id
 e12-20020a25d30c000000b00da050e612c5mr19455444ybf.62.1701316884306; Wed, 29
 Nov 2023 20:01:24 -0800 (PST)
MIME-Version: 1.0
References: <1701280010-32476-1-git-send-email-quic_khsieh@quicinc.com>
 <1701280010-32476-6-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1701280010-32476-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 06:01:13 +0200
Message-ID: <CAA8EJpr3O6H5xkjt6Qx8umfn9LCpVtJwzGVZN9L8pyK3U8TCcA@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] drm/msm/dp: incorporate pm_runtime framework into
 DP driver
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Nov 2023 at 19:47, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently DP driver is executed independent of PM runtime framework.
> This leads msm eDP panel can not being detected by edp_panel driver
> during generic_edp_panel_probe() due to AUX DPCD read failed at
> edp panel driver. Incorporate PM runtime framework into DP driver so
> that host controller's power and clocks are enable/disable through
> PM runtime mechanism.  Once PM runtime framework is incorporated into
> DP driver, waking up device from power up path is not necessary. Hence
> remove it.
>
> After incorporating pm_runtime framework into eDP/DP driver,
> dp_pm_suspend() to handle power off both DP phy and controller during
> suspend and dp_pm_resume() to handle power on both DP phy and controller
> during resume are not necessary. Therefore both dp_pm_suspend() and
> dp_pm_resume() are dropped and replace with dp_pm_runtime_suspend() and
> dp_pm_runtime_resume() respectively.

There were comments for v7 of this patch that were not handled in this
revision. Please take care of them.

>
> Changes in v7:
> -- add comments to dp_pm_runtime_resume()
> -- add comments to dp_bridge_hpd_enable()
> -- delete dp->hpd_state = ST_DISCONNECTED from dp_bridge_hpd_notify()
>
> Changes in v6:
> -- delete dp_power_client_deinit(dp->power);
> -- remove if (!dp->dp_display.is_edp) condition checkout at plug_handle()
> -- remove if (!dp->dp_display.is_edp) condition checkout at unplug_handle()
> -- add IRQF_NO_AUTOEN to devm_request_irq()
> -- add enable_irq() and disable_irq() to pm_runtime_resume()/suspend()
> -- del dp->hpd_state = ST_DISCONNECTED from dp_bridge_hpd_disable()
>
> Changes in v5:
> -- remove pm_runtime_put_autosuspend feature, use pm_runtime_put_sync()
> -- squash add pm_runtime_force_suspend()/resume() patch into this patch
>
> Changes in v4:
> -- reworded commit text to explain why pm_framework is required for
>    edp panel
> -- reworded commit text to explain autosuspend is choiced
> -- delete EV_POWER_PM_GET and PM_EV_POWER_PUT from changes #3
> -- delete dp_display_pm_get() and dp_display_pm_Put() from changes #3
> -- return value from pm_runtime_resume_and_get() directly
> -- check return value of devm_pm_runtime_enable()
> -- delete pm_runtime_xxx from dp_display_remove()
> -- drop dp_display_host_init() from EV_HPD_INIT_SETUP
> -- drop both dp_pm_prepare() and dp_pm_compete() from this change
> -- delete ST_SUSPENDED state
> -- rewording commit text to add more details regrading the purpose
>    of this change
>
> Changes in v3:
> -- incorporate removing pm_runtime_xx() from dp_pwer.c to this patch
> -- use pm_runtime_resume_and_get() instead of pm_runtime_get()
> -- error checking pm_runtime_resume_and_get() return value
> -- add EV_POWER_PM_GET and PM_EV_POWER_PUT to handle HPD_GPIO case
> -- replace dp_pm_suspend() with pm_runtime_force_suspend()
> -- replace dp_pm_resume() with pm_runtime_force_resume()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     |   5 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 181 ++++++++++++++----------------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |  16 ----
>  drivers/gpu/drm/msm/dp/dp_power.h   |  11 ---
>  4 files changed, 75 insertions(+), 138 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 8e3b677..10b6eeb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -291,6 +291,10 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>                 return -EINVAL;
>         }
>
> +       ret = pm_runtime_resume_and_get(dp_aux->dev);
> +       if (ret)
> +               return  ret;
> +
>         mutex_lock(&aux->mutex);
>         if (!aux->initted) {
>                 ret = -EIO;
> @@ -364,6 +368,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>
>  exit:
>         mutex_unlock(&aux->mutex);
> +       pm_runtime_put_sync(dp_aux->dev);
>
>         return ret;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a99a786..9520d83 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -49,7 +49,6 @@ enum {
>         ST_CONNECTED,
>         ST_DISCONNECT_PENDING,
>         ST_DISPLAY_OFF,
> -       ST_SUSPENDED,
>  };
>
>  enum {
> @@ -309,10 +308,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct dp_display_private *dp = dev_get_dp_display_private(dev);
>         struct msm_drm_private *priv = dev_get_drvdata(master);
>
> -       /* disable all HPD interrupts */
> -       if (dp->core_initialized)
> -               dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> -
>         kthread_stop(dp->ev_tsk);
>
>         of_dp_aux_depopulate_bus(dp->aux);
> @@ -542,6 +537,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>  {
>         u32 state;
>         int ret;
> +       struct platform_device *pdev = dp->dp_display.pdev;
>
>         mutex_lock(&dp->event_mutex);
>
> @@ -549,7 +545,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>         drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>                         dp->dp_display.connector_type, state);
>
> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> +       if (state == ST_DISPLAY_OFF) {
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
>         }
> @@ -566,7 +562,13 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       ret = dp_display_usbpd_configure_cb(&dp->dp_display.pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret) {
> +               DRM_ERROR("failed to pm_runtime_resume\n");
> +               return ret;
> +       }
> +
> +       ret = dp_display_usbpd_configure_cb(&pdev->dev);
>         if (ret) {      /* link train failed */
>                 dp->hpd_state = ST_DISCONNECTED;
>         } else {
> @@ -598,6 +600,7 @@ static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>  static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>  {
>         u32 state;
> +       struct platform_device *pdev = dp->dp_display.pdev;
>
>         mutex_lock(&dp->event_mutex);
>
> @@ -648,6 +651,7 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
>                         dp->dp_display.connector_type, state);
>
>         /* uevent will complete disconnection part */
> +       pm_runtime_put_sync(&pdev->dev);
>         mutex_unlock(&dp->event_mutex);
>         return 0;
>  }
> @@ -663,7 +667,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>         drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>                         dp->dp_display.connector_type, state);
>
> -       if (state == ST_DISPLAY_OFF || state == ST_SUSPENDED) {
> +       if (state == ST_DISPLAY_OFF) {
>                 mutex_unlock(&dp->event_mutex);
>                 return 0;
>         }
> @@ -1076,7 +1080,6 @@ static int hpd_event_thread(void *data)
>
>                 switch (todo->event_id) {
>                 case EV_HPD_INIT_SETUP:
> -                       dp_display_host_init(dp_priv);
>                         break;
>                 case EV_HPD_PLUG_INT:
>                         dp_hpd_plug_handle(dp_priv, todo->data);
> @@ -1168,7 +1171,9 @@ static int dp_display_request_irq(struct dp_display_private *dp)
>         }
>
>         rc = devm_request_irq(&pdev->dev, dp->irq, dp_display_irq_handler,
> -                       IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
> +                             IRQF_TRIGGER_HIGH|IRQF_NO_AUTOEN,
> +                             "dp_display_isr", dp);
> +
>         if (rc < 0) {
>                 DRM_ERROR("failed to request IRQ%u: %d\n",
>                                 dp->irq, rc);
> @@ -1254,6 +1259,10 @@ static int dp_display_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, &dp->dp_display);
>
> +       rc = devm_pm_runtime_enable(&pdev->dev);
> +       if (rc)
> +               goto err;
> +
>         rc = dp_display_request_irq(dp);
>         if (rc)
>                 goto err;
> @@ -1276,115 +1285,52 @@ static void dp_display_remove(struct platform_device *pdev)
>         struct dp_display_private *dp = dev_get_dp_display_private(&pdev->dev);
>
>         component_del(&pdev->dev, &dp_display_comp_ops);
> -       dp_power_client_deinit(dp->power);
>         dp_display_deinit_sub_modules(dp);
>
>         platform_set_drvdata(pdev, NULL);
>  }
>
> -static int dp_pm_resume(struct device *dev)
> +static int dp_pm_runtime_suspend(struct device *dev)
>  {
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
> -       struct dp_display_private *dp;
> -       int sink_count = 0;
> -
> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> -
> -       mutex_lock(&dp->event_mutex);
> -
> -       drm_dbg_dp(dp->drm_dev,
> -               "Before, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> -               dp->dp_display.connector_type, dp->core_initialized,
> -               dp->phy_initialized, dp_display->power_on);
> -
> -       /* start from disconnected state */
> -       dp->hpd_state = ST_DISCONNECTED;
> -
> -       /* turn on dp ctrl/phy */
> -       dp_display_host_init(dp);
> -
> -       if (dp_display->is_edp)
> -               dp_catalog_ctrl_hpd_enable(dp->catalog);
> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>
> -       if (dp_catalog_link_is_connected(dp->catalog)) {
> -               /*
> -                * set sink to normal operation mode -- D0
> -                * before dpcd read
> -                */
> -               dp_display_host_phy_init(dp);
> -               dp_link_psm_config(dp->link, &dp->panel->link_info, false);
> -               sink_count = drm_dp_read_sink_count(dp->aux);
> -               if (sink_count < 0)
> -                       sink_count = 0;
> +       disable_irq(dp->irq);
>
> +       if (dp->dp_display.is_edp) {
>                 dp_display_host_phy_exit(dp);
> +               dp_catalog_ctrl_hpd_disable(dp->catalog);
>         }
> -
> -       dp->link->sink_count = sink_count;
> -       /*
> -        * can not declared display is connected unless
> -        * HDMI cable is plugged in and sink_count of
> -        * dongle become 1
> -        * also only signal audio when disconnected
> -        */
> -       if (dp->link->sink_count) {
> -               dp->dp_display.link_ready = true;
> -       } else {
> -               dp->dp_display.link_ready = false;
> -               dp_display_handle_plugged_change(dp_display, false);
> -       }
> -
> -       drm_dbg_dp(dp->drm_dev,
> -               "After, type=%d sink=%d conn=%d core_init=%d phy_init=%d power=%d\n",
> -               dp->dp_display.connector_type, dp->link->sink_count,
> -               dp->dp_display.link_ready, dp->core_initialized,
> -               dp->phy_initialized, dp_display->power_on);
> -
> -       mutex_unlock(&dp->event_mutex);
> +       dp_display_host_deinit(dp);
>
>         return 0;
>  }
>
> -static int dp_pm_suspend(struct device *dev)
> +static int dp_pm_runtime_resume(struct device *dev)
>  {
> -       struct platform_device *pdev = to_platform_device(dev);
> -       struct msm_dp *dp_display = platform_get_drvdata(pdev);
> -       struct dp_display_private *dp;
> -
> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> -
> -       mutex_lock(&dp->event_mutex);
> -
> -       drm_dbg_dp(dp->drm_dev,
> -               "Before, type=%d core_inited=%d  phy_inited=%d power_on=%d\n",
> -               dp->dp_display.connector_type, dp->core_initialized,
> -               dp->phy_initialized, dp_display->power_on);
> -
> -       /* mainlink enabled */
> -       if (dp_power_clk_status(dp->power, DP_CTRL_PM))
> -               dp_ctrl_off_link_stream(dp->ctrl);
> -
> -       dp_display_host_phy_exit(dp);
> -
> -       /* host_init will be called at pm_resume */
> -       dp_display_host_deinit(dp);
> -
> -       dp->hpd_state = ST_SUSPENDED;
> -
> -       drm_dbg_dp(dp->drm_dev,
> -               "After, type=%d core_inited=%d phy_inited=%d power_on=%d\n",
> -               dp->dp_display.connector_type, dp->core_initialized,
> -               dp->phy_initialized, dp_display->power_on);
> +       struct dp_display_private *dp = dev_get_dp_display_private(dev);
>
> -       mutex_unlock(&dp->event_mutex);
> +       /*
> +        * for eDP, host cotroller, HPD block and PHY are enabled here
> +        * but with HPD irq disabled
> +        *
> +        * for DP, only host controller is enabled here.
> +        * HPD block is enabled at dp_bridge_hpd_enable()
> +        * PHY will be enabled at plugin handler later
> +        */
> +       dp_display_host_init(dp);
> +       if (dp->dp_display.is_edp) {
> +               dp_catalog_ctrl_hpd_enable(dp->catalog);
> +               dp_display_host_phy_init(dp);
> +       }
>
> +       enable_irq(dp->irq);
>         return 0;
>  }
>
>  static const struct dev_pm_ops dp_pm_ops = {
> -       .suspend = dp_pm_suspend,
> -       .resume =  dp_pm_resume,
> +       SET_RUNTIME_PM_OPS(dp_pm_runtime_suspend, dp_pm_runtime_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
>  };
>
>  static struct platform_driver dp_display_driver = {
> @@ -1467,10 +1413,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>         aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
>
>         if (aux_bus && dp->is_edp) {
> -               dp_display_host_init(dp_priv);
> -               dp_catalog_ctrl_hpd_enable(dp_priv->catalog);
> -               dp_display_host_phy_init(dp_priv);
> -
>                 /*
>                  * The code below assumes that the panel will finish probing
>                  * by the time devm_of_dp_aux_populate_ep_devices() returns.
> @@ -1567,6 +1509,11 @@ void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>                 dp_hpd_plug_handle(dp_display, 0);
>
>         mutex_lock(&dp_display->event_mutex);
> +       if (pm_runtime_resume_and_get(&dp->pdev->dev)) {
> +               DRM_ERROR("failed to pm_runtime_resume\n");
> +               mutex_unlock(&dp_display->event_mutex);
> +               return;
> +       }
>
>         state = dp_display->hpd_state;
>         if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> @@ -1631,10 +1578,9 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>         mutex_lock(&dp_display->event_mutex);
>
>         state = dp_display->hpd_state;
> -       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED) {
> -               mutex_unlock(&dp_display->event_mutex);
> -               return;
> -       }
> +       if (state != ST_DISCONNECT_PENDING && state != ST_CONNECTED)
> +               drm_dbg_dp(dp->drm_dev, "type=%d wrong hpd_state=%d\n",
> +                          dp->connector_type, state);
>
>         dp_display_disable(dp_display);
>
> @@ -1647,6 +1593,8 @@ void dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
>         }
>
>         drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
> +
> +       pm_runtime_put_sync(&dp->pdev->dev);
>         mutex_unlock(&dp_display->event_mutex);
>  }
>
> @@ -1685,7 +1633,21 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>         struct msm_dp *dp_display = dp_bridge->dp_display;
>         struct dp_display_private *dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> +       /*
> +        * this is for external DP with hpd irq enabled case,
> +        * step-1: dp_pm_runtime_resume() enable dp host only
> +        * step-2: enable hdp block and have hpd irq enabled here
> +        * step-3: waiting for plugin irq while phy is not initialized
> +        * step-4: DP PHY is initialized at plugin handler before link training
> +        *
> +        */
>         mutex_lock(&dp->event_mutex);
> +       if (pm_runtime_resume_and_get(&dp_display->pdev->dev)) {
> +               DRM_ERROR("failed to resume power\n");
> +               mutex_unlock(&dp->event_mutex);
> +               return;
> +       }
> +
>         dp_catalog_ctrl_hpd_enable(dp->catalog);
>
>         /* enable HDP interrupts */
> @@ -1707,6 +1669,8 @@ void dp_bridge_hpd_disable(struct drm_bridge *bridge)
>         dp_catalog_ctrl_hpd_disable(dp->catalog);
>
>         dp_display->internal_hpd = false;
> +
> +       pm_runtime_put_sync(&dp_display->pdev->dev);
>         mutex_unlock(&dp->event_mutex);
>  }
>
> @@ -1721,11 +1685,6 @@ void dp_bridge_hpd_notify(struct drm_bridge *bridge,
>         if (dp_display->internal_hpd)
>                 return;
>
> -       if (!dp->core_initialized) {
> -               drm_dbg_dp(dp->drm_dev, "not initialized\n");
> -               return;
> -       }
> -
>         if (!dp_display->link_ready && status == connector_status_connected)
>                 dp_add_event(dp, EV_HPD_PLUG_INT, 0, 0);
>         else if (dp_display->link_ready && status == connector_status_disconnected)
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
> index 5cb84ca..863c766 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.c
> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> @@ -152,20 +152,9 @@ int dp_power_client_init(struct dp_power *dp_power)
>
>         power = container_of(dp_power, struct dp_power_private, dp_power);
>
> -       pm_runtime_enable(power->dev);
> -
>         return dp_power_clk_init(power);
>  }
>
> -void dp_power_client_deinit(struct dp_power *dp_power)
> -{
> -       struct dp_power_private *power;
> -
> -       power = container_of(dp_power, struct dp_power_private, dp_power);
> -
> -       pm_runtime_disable(power->dev);
> -}
> -
>  int dp_power_init(struct dp_power *dp_power)
>  {
>         int rc = 0;
> @@ -173,11 +162,7 @@ int dp_power_init(struct dp_power *dp_power)
>
>         power = container_of(dp_power, struct dp_power_private, dp_power);
>
> -       pm_runtime_get_sync(power->dev);
> -
>         rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> -       if (rc)
> -               pm_runtime_put_sync(power->dev);
>
>         return rc;
>  }
> @@ -189,7 +174,6 @@ int dp_power_deinit(struct dp_power *dp_power)
>         power = container_of(dp_power, struct dp_power_private, dp_power);
>
>         dp_power_clk_enable(dp_power, DP_CORE_PM, false);
> -       pm_runtime_put_sync(power->dev);
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
> index a3dec20..55ada51 100644
> --- a/drivers/gpu/drm/msm/dp/dp_power.h
> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
> @@ -81,17 +81,6 @@ int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
>  int dp_power_client_init(struct dp_power *power);
>
>  /**
> - * dp_power_clinet_deinit() - de-initialize clock and regulator modules
> - *
> - * @power: instance of power module
> - * return: 0 for success, error for failure.
> - *
> - * This API will de-initialize the DisplayPort's clocks and regulator
> - * modules.
> - */
> -void dp_power_client_deinit(struct dp_power *power);
> -
> -/**
>   * dp_power_get() - configure and get the DisplayPort power module data
>   *
>   * @parser: instance of parser module
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
