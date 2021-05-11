Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE41379E9C
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 06:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBBB6E9B0;
	Tue, 11 May 2021 04:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9BD6E9B0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 04:34:20 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id v13so16057439ilj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 21:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A/I5ZD1ncQP/PVS3uc11/1MXi9/3q76SHXYkN5zPqw0=;
 b=ghLy5Axa6iaQdEV9c7VqkEki0fGb6F1DYlIdkvpQwAkpQ8htzUaSeejBZ2FI5XdX2h
 g2HtcmjNpOKF+I9qbJLVx36iT0VgImevWoQsChSiNh3FuakovnQ6Vqpo6fNY0ctQtjKp
 wmxXQw1USIb5CYFlYQ5LccHjNgD7f7w089HK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A/I5ZD1ncQP/PVS3uc11/1MXi9/3q76SHXYkN5zPqw0=;
 b=oLmrOmwOqPcS13VtUbu9UWzyWjkeaSQ+UODwxQgk0R9/J6a8T/ZnBCcfbEArokEVDc
 qWSuOvxO+qjKu24HauAKwsqytHwecELEd5M+GEFl0ZIAdMgWARS9ggMOsBlnfkeGSjzR
 kNcHq30d72TxX3QBdPpElFUnLmTOnMSjN7cVczomnRUnh6mjyiFdg7wgAslyk5OHHmip
 5CGmDKppThZK4JsdzCbLC5aCx2I0o/uUvj9xzEd5E6mFXPNqllf7qk41FrbguEN3TILQ
 wMzkWX+edmtEk0xTEy0RIsIt8E9bzAmTp1XcE/2fE2iyfmTFn5vTmqC4jYJh1o9fGUSN
 kb5A==
X-Gm-Message-State: AOAM531qYLxStZmUDI+U8+rgyLltK37g9R4gjx3/jK0/UtTNt26MY8gl
 lBCNm2yrjLLUui/q/DWTqsL8dVe6sjB+kn7ybYwObw==
X-Google-Smtp-Source: ABdhPJy58zkkqM52Ut8rSf8mSX+TIkQeLn3FLxsEmYgPzlkJGmOZ2hedPCwAshnCMjHVeAEaK7tpvInA6+dMLEuTfXk=
X-Received: by 2002:a05:6e02:20ce:: with SMTP id
 14mr24698028ilq.102.1620707659286; 
 Mon, 10 May 2021 21:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210510053125.1595659-1-pihsun@chromium.org>
In-Reply-To: <20210510053125.1595659-1-pihsun@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 11 May 2021 12:33:53 +0800
Message-ID: <CAJMQK-inL42HDYhUu77+q4K8ykpUgT0GTgyXMetLM7MhFdPj7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/bridge: anx7625: refactor power control to use
 runtime PM framework
To: Pi-Hsun Shih <pihsun@chromium.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 1:31 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
>
> The driver originally use an atomic_t for keep track of the power
> status, which makes the driver more complicated than needed, and has
> some race condition as it's possible to have the power on and power off
> sequence going at the same time.
>
> This patch remove the usage of the atomic_t power_status, and use the
> kernel runtime power management framework instead.
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on a mt8183 juniper device.

> ---
>
> Changes from v2:
> * Add missing .pm field to anx7625_driver.
>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 149 ++++++++++------------
>  drivers/gpu/drm/bridge/analogix/anx7625.h |   1 -
>  2 files changed, 64 insertions(+), 86 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 23283ba0c4f9..e1bf31eafe22 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> @@ -1005,33 +1006,6 @@ static void anx7625_power_on_init(struct anx7625_data *ctx)
>         }
>  }
>
> -static void anx7625_chip_control(struct anx7625_data *ctx, int state)
> -{
> -       struct device *dev = &ctx->client->dev;
> -
> -       DRM_DEV_DEBUG_DRIVER(dev, "before set, power_state(%d).\n",
> -                            atomic_read(&ctx->power_status));
> -
> -       if (!ctx->pdata.low_power_mode)
> -               return;
> -
> -       if (state) {
> -               atomic_inc(&ctx->power_status);
> -               if (atomic_read(&ctx->power_status) == 1)
> -                       anx7625_power_on_init(ctx);
> -       } else {
> -               if (atomic_read(&ctx->power_status)) {
> -                       atomic_dec(&ctx->power_status);
> -
> -                       if (atomic_read(&ctx->power_status) == 0)
> -                               anx7625_power_standby(ctx);
> -               }
> -       }
> -
> -       DRM_DEV_DEBUG_DRIVER(dev, "after set, power_state(%d).\n",
> -                            atomic_read(&ctx->power_status));
> -}
> -
>  static void anx7625_init_gpio(struct anx7625_data *platform)
>  {
>         struct device *dev = &platform->client->dev;
> @@ -1061,9 +1035,6 @@ static void anx7625_stop_dp_work(struct anx7625_data *ctx)
>         ctx->hpd_status = 0;
>         ctx->hpd_high_cnt = 0;
>         ctx->display_timing_valid = 0;
> -
> -       if (ctx->pdata.low_power_mode == 0)
> -               anx7625_disable_pd_protocol(ctx);
>  }
>
>  static void anx7625_start_dp_work(struct anx7625_data *ctx)
> @@ -1105,49 +1076,26 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
>         int ret, val;
>         struct device *dev = &ctx->client->dev;
>
> -       if (atomic_read(&ctx->power_status) != 1) {
> -               DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
> -               return;
> -       }
> -
>         ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
>                                  ctx, val,
>                                  ((val & HPD_STATUS) || (val < 0)),
>                                  5000,
>                                  5000 * 100);
>         if (ret) {
> -               DRM_DEV_ERROR(dev, "HPD polling timeout!\n");
> -       } else {
> -               DRM_DEV_DEBUG_DRIVER(dev, "HPD raise up.\n");
> -               anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
> -                                 INTR_ALERT_1, 0xFF);
> -               anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> -                                 INTERFACE_CHANGE_INT, 0);
> +               DRM_DEV_ERROR(dev, "no hpd.\n");
> +               return;
>         }
>
> -       anx7625_start_dp_work(ctx);
> -}
> -
> -static void anx7625_disconnect_check(struct anx7625_data *ctx)
> -{
> -       if (atomic_read(&ctx->power_status) == 0)
> -               anx7625_stop_dp_work(ctx);
> -}
> -
> -static void anx7625_low_power_mode_check(struct anx7625_data *ctx,
> -                                        int state)
> -{
> -       struct device *dev = &ctx->client->dev;
> +       DRM_DEV_DEBUG_DRIVER(dev, "system status: 0x%x. HPD raise up.\n", val);
> +       anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
> +                         INTR_ALERT_1, 0xFF);
> +       anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +                         INTERFACE_CHANGE_INT, 0);
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "low power mode check, state(%d).\n", state);
> +       anx7625_start_dp_work(ctx);
>
> -       if (ctx->pdata.low_power_mode) {
> -               anx7625_chip_control(ctx, state);
> -               if (state)
> -                       anx7625_hpd_polling(ctx);
> -               else
> -                       anx7625_disconnect_check(ctx);
> -       }
> +       if (!ctx->pdata.panel_bridge && ctx->bridge_attached)
> +               drm_helper_hpd_irq_event(ctx->bridge.dev);
>  }
>
>  static void anx7625_remove_edid(struct anx7625_data *ctx)
> @@ -1180,9 +1128,6 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
>         int intr_vector, status;
>         struct device *dev = &ctx->client->dev;
>
> -       DRM_DEV_DEBUG_DRIVER(dev, "power_status=%d\n",
> -                            (u32)atomic_read(&ctx->power_status));
> -
>         status = anx7625_reg_write(ctx, ctx->i2c.tcpc_client,
>                                    INTR_ALERT_1, 0xFF);
>         if (status < 0) {
> @@ -1228,22 +1173,25 @@ static void anx7625_work_func(struct work_struct *work)
>                                                 struct anx7625_data, work);
>
>         mutex_lock(&ctx->lock);
> +
> +       if (pm_runtime_suspended(&ctx->client->dev))
> +               goto unlock;
> +
>         event = anx7625_hpd_change_detect(ctx);
> -       mutex_unlock(&ctx->lock);
>         if (event < 0)
> -               return;
> +               goto unlock;
>
>         if (ctx->bridge_attached)
>                 drm_helper_hpd_irq_event(ctx->bridge.dev);
> +
> +unlock:
> +       mutex_unlock(&ctx->lock);
>  }
>
>  static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
>  {
>         struct anx7625_data *ctx = (struct anx7625_data *)data;
>
> -       if (atomic_read(&ctx->power_status) != 1)
> -               return IRQ_NONE;
> -
>         queue_work(ctx->workqueue, &ctx->work);
>
>         return IRQ_HANDLED;
> @@ -1305,9 +1253,9 @@ static struct edid *anx7625_get_edid(struct anx7625_data *ctx)
>                 return (struct edid *)edid;
>         }
>
> -       anx7625_low_power_mode_check(ctx, 1);
> +       pm_runtime_get_sync(dev);
>         edid_num = sp_tx_edid_read(ctx, p_edid->edid_raw_data);
> -       anx7625_low_power_mode_check(ctx, 0);
> +       pm_runtime_put(dev);
>
>         if (edid_num < 1) {
>                 DRM_DEV_ERROR(dev, "Fail to read EDID: %d\n", edid_num);
> @@ -1611,10 +1559,7 @@ static void anx7625_bridge_enable(struct drm_bridge *bridge)
>
>         DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
>
> -       anx7625_low_power_mode_check(ctx, 1);
> -
> -       if (WARN_ON(!atomic_read(&ctx->power_status)))
> -               return;
> +       pm_runtime_get_sync(dev);
>
>         anx7625_dp_start(ctx);
>  }
> @@ -1624,14 +1569,11 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
>         struct anx7625_data *ctx = bridge_to_anx7625(bridge);
>         struct device *dev = &ctx->client->dev;
>
> -       if (WARN_ON(!atomic_read(&ctx->power_status)))
> -               return;
> -
>         DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
>
>         anx7625_dp_stop(ctx);
>
> -       anx7625_low_power_mode_check(ctx, 0);
> +       pm_runtime_put(dev);
>  }
>
>  static enum drm_connector_status
> @@ -1735,6 +1677,39 @@ static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
>         i2c_unregister_device(ctx->i2c.tcpc_client);
>  }
>
> +static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       mutex_lock(&ctx->lock);
> +
> +       anx7625_stop_dp_work(ctx);
> +       anx7625_power_standby(ctx);
> +
> +       mutex_unlock(&ctx->lock);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       mutex_lock(&ctx->lock);
> +
> +       anx7625_power_on_init(ctx);
> +       anx7625_hpd_polling(ctx);
> +
> +       mutex_unlock(&ctx->lock);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops anx7625_pm_ops = {
> +       SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
> +                          anx7625_runtime_pm_resume, NULL)
> +};
> +
>  static int anx7625_i2c_probe(struct i2c_client *client,
>                              const struct i2c_device_id *id)
>  {
> @@ -1778,8 +1753,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         }
>         anx7625_init_gpio(platform);
>
> -       atomic_set(&platform->power_status, 0);
> -
>         mutex_init(&platform->lock);
>
>         platform->pdata.intp_irq = client->irq;
> @@ -1809,9 +1782,11 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>                 goto free_wq;
>         }
>
> -       if (platform->pdata.low_power_mode == 0) {
> +       pm_runtime_enable(dev);
> +
> +       if (!platform->pdata.low_power_mode) {
>                 anx7625_disable_pd_protocol(platform);
> -               atomic_set(&platform->power_status, 1);
> +               pm_runtime_get_sync(dev);
>         }
>
>         /* Add work function */
> @@ -1847,6 +1822,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
>         if (platform->pdata.intp_irq)
>                 destroy_workqueue(platform->workqueue);
>
> +       if (!platform->pdata.low_power_mode)
> +               pm_runtime_put_sync_suspend(&client->dev);
> +
>         anx7625_unregister_i2c_dummy_clients(platform);
>
>         kfree(platform);
> @@ -1869,6 +1847,7 @@ static struct i2c_driver anx7625_driver = {
>         .driver = {
>                 .name = "anx7625",
>                 .of_match_table = anx_match_table,
> +               .pm = &anx7625_pm_ops,
>         },
>         .probe = anx7625_i2c_probe,
>         .remove = anx7625_i2c_remove,
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index e4a086b3a3d7..034c3840028f 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -369,7 +369,6 @@ struct anx7625_i2c_client {
>
>  struct anx7625_data {
>         struct anx7625_platform_data pdata;
> -       atomic_t power_status;
>         int hpd_status;
>         int hpd_high_cnt;
>         /* Lock for work queue */
>
> base-commit: e48661230cc35b3d0f4367eddfc19f86463ab917
> --
> 2.31.1.607.g51e8a6a459-goog
>
