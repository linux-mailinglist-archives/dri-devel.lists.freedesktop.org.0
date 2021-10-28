Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653B43E7EF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 20:02:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A956E40F;
	Thu, 28 Oct 2021 18:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B28C6E40F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 18:02:36 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 131so5876709ybc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2uiIypE/+8TVb/sCs984vpjhJkpOY4sqofcRYAKxCf8=;
 b=WnkSErxT3CMA5V7E05YRtxmYRLV8E7qH600P7eMUsJBEwHUiArVBT5l8qxc8VZvyZF
 wlmfAUWcxWihATsBp+k2D96Q4FyTV3xBb1MLBpcBR9hTtIM8vPvzRPibTeROWLX1I9bI
 ibla+BY+jz68aEZ+gj5S1QvqR6h+ThQGkw5Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2uiIypE/+8TVb/sCs984vpjhJkpOY4sqofcRYAKxCf8=;
 b=reMCxIxJlXCPEnNssk1UqndsWkvFQeZbDRS0iwftPcEBXnTw5jz+d+lLsdknxQf2+n
 yWThK4UfBsasOQ64tvx7FxDbPgbLSIMkDSMw2t6/df/MmNwm+6nTxhVQqWwadxkFCKxT
 l95t3Wj6OCxnMlL8pLY/bSrzuKw3OdBqlt1HUUJVMOT2Bff9gS7EcPVpZ2embpM5R/ai
 s0SgBghROFtnVINHWYkkAQln8Hz1ItyQh7lmX/SMXCkK+qqmnCAVdrqgoFtj1JZqaJzq
 sWnl/fYCJ9IdB31ri2c57adW9notpWNIXapbxBcIqszDA+D+Xm2E1o/wdffRmreJjWjW
 8whQ==
X-Gm-Message-State: AOAM531fmVPilq7NIcZpCGh/a47OcbaBG386p0Y6z4maiAYj7+TFjIZ1
 I05MABbe7uyuNal2wkFEBZNaPrEPrMoQR79mSRiMzA==
X-Google-Smtp-Source: ABdhPJw475TCqONeP6HavHw6WhGwowH6F418SuJ/DlsFDsRzbtXGGI0KWdnPhbB4a1iM1Fj3mYzgpOHx/Por2oKxEGk=
X-Received: by 2002:a25:cf07:: with SMTP id f7mr6064388ybg.100.1635444155025; 
 Thu, 28 Oct 2021 11:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
In-Reply-To: <20211028105754.v5.1.I828f5db745535fb7e36e8ffdd62d546f6d08b6d1@changeid>
From: Philip Chen <philipchen@chromium.org>
Date: Thu, 28 Oct 2021 11:02:24 -0700
Message-ID: <CA+cxXh=VOkRnkgfxq8DVes=xCvR=691eY-ViQxME2fHMgt1q8Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
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

Add "Sam Ravnborg <sam@ravnborg.org>" to cc list for vis.
Remove "Andrzej Hajda <a.hajda@samsung.com>" from cc list as the
address can't be found.

On Thu, Oct 28, 2021 at 10:58 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Fit ps8640 driver into runtime power management framework:
>
> First, break _poweron() to 3 parts: (1) turn on power and wait for
> ps8640's internal MCU to finish init (2) check panel HPD (which is
> proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> called before panel is powered, we only add (1) to _resume() and leave
> (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> to ensure panel HPD is asserted before we start AUX CH transactions.
>
> Second, the original driver has a mysterious delay of 50 ms between (2)
> and (3). Since Parade's support can't explain what the delay is for,
> and we don't see removing the delay break any boards at hand, remove
> the delay to fit into this driver change.
>
> In addition, rename "powered" to "pre_enabled" and don't check for it
> in the pm_runtime calls. The pm_runtime calls are already refcounted
> so there's no reason to check there. The other user of "powered",
> _get_edid(), only cares if pre_enable() has already been called.
>
> Lastly, change some existing DRM_...() logging to dev_...() along the
> way, since DRM_...() seem to be deprecated in [1].
>
> [1] https://patchwork.freedesktop.org/patch/454760/
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> In v3, I added pm_suspend_ignore_children() in ps8640_probe().
> Also, I moved the change of "put_sync_suspend" from patch 2/2 to here.
> But I forgot to mention both changes. So edit v3 change log retroactively.
>
> In v4, I moved the change of "ps8640_ensure_hpd" return data type
> from patch 2/2 to here. But I forgot to mention it. So edit v4 change log
> retroactively.
>
> Changes in v5:
> - Move the implementation of _runtime_disable() around to resolve merge
>   conflict when rebasing.
> - Improve the document for how autosuspend_delay is picked.
>
> Changes in v4:
> - Make ps8640_ensure_hpd() return int (This change was mis-added to
>   patch 2/2 in this patch series).
>
> Changes in v3:
> - Fix typo/wording in the commit message.
> - Add ps8640_aux_transfer_msg() for AUX operation. In
>   ps8640_aux_transfer(), wrap around ps8640_aux_transfer_msg()
>   with PM operations and HPD check.
> - Document why autosuspend_delay is set to 500ms.
> - Add pm_suspend_ignore_children() in ps8640_probe()
> - Replace _put_sync() with _put_sync_suspend() in ps8640_post_disable()
>   (The change was mis-added to patch 2/2 in this patch series.)
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 190 ++++++++++++++++---------
>  1 file changed, 119 insertions(+), 71 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 4b36e4dc78f1..63a817d92c1d 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -9,6 +9,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>
> @@ -100,7 +101,7 @@ struct ps8640 {
>         struct regulator_bulk_data supplies[2];
>         struct gpio_desc *gpio_reset;
>         struct gpio_desc *gpio_powerdown;
> -       bool powered;
> +       bool pre_enabled;
>  };
>
>  static const struct regmap_config ps8640_regmap_config[] = {
> @@ -148,8 +149,29 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
>         return container_of(aux, struct ps8640, aux);
>  }
>
> -static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> -                                  struct drm_dp_aux_msg *msg)
> +static int ps8640_ensure_hpd(struct ps8640 *ps_bridge)
> +{
> +       struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> +       struct device *dev = &ps_bridge->page[PAGE2_TOP_CNTL]->dev;
> +       int status;
> +       int ret;
> +
> +       /*
> +        * Apparently something about the firmware in the chip signals that
> +        * HPD goes high by reporting GPIO9 as high (even though HPD isn't
> +        * actually connected to GPIO9).
> +        */
> +       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> +                               status & PS_GPIO9, 20 * 1000, 200 * 1000);
> +
> +       if (ret < 0)
> +               dev_warn(dev, "HPD didn't go high: %d\n", ret);
> +
> +       return ret;
> +}
> +
> +static ssize_t ps8640_aux_transfer_msg(struct drm_dp_aux *aux,
> +                                      struct drm_dp_aux_msg *msg)
>  {
>         struct ps8640 *ps_bridge = aux_to_ps8640(aux);
>         struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
> @@ -274,38 +296,49 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>         return len;
>  }
>
> -static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
> -                                    const enum ps8640_vdo_control ctrl)
> +static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> +                                  struct drm_dp_aux_msg *msg)
> +{
> +       struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> +       struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
> +       int ret;
> +
> +       pm_runtime_get_sync(dev);
> +       ret = ps8640_ensure_hpd(ps_bridge);
> +       if (!ret)
> +               ret = ps8640_aux_transfer_msg(aux, msg);
> +       pm_runtime_mark_last_busy(dev);
> +       pm_runtime_put_autosuspend(dev);
> +
> +       return ret;
> +}
> +
> +static void ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
> +                                     const enum ps8640_vdo_control ctrl)
>  {
>         struct regmap *map = ps_bridge->regmap[PAGE3_DSI_CNTL1];
> +       struct device *dev = &ps_bridge->page[PAGE3_DSI_CNTL1]->dev;
>         u8 vdo_ctrl_buf[] = { VDO_CTL_ADD, ctrl };
>         int ret;
>
>         ret = regmap_bulk_write(map, PAGE3_SET_ADD,
>                                 vdo_ctrl_buf, sizeof(vdo_ctrl_buf));
>
> -       if (ret < 0) {
> -               DRM_ERROR("failed to %sable VDO: %d\n",
> -                         ctrl == ENABLE ? "en" : "dis", ret);
> -               return ret;
> -       }
> -
> -       return 0;
> +       if (ret < 0)
> +               dev_err(dev, "failed to %sable VDO: %d\n",
> +                       ctrl == ENABLE ? "en" : "dis", ret);
>  }
>
> -static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
> +static int __maybe_unused ps8640_resume(struct device *dev)
>  {
> -       struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> -       int ret, status;
> -
> -       if (ps_bridge->powered)
> -               return;
> +       struct ps8640 *ps_bridge = dev_get_drvdata(dev);
> +       int ret;
>
>         ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
>                                     ps_bridge->supplies);
>         if (ret < 0) {
> -               DRM_ERROR("cannot enable regulators %d\n", ret);
> -               return;
> +               dev_err(dev, "cannot enable regulators %d\n", ret);
> +               return ret;
>         }
>
>         gpiod_set_value(ps_bridge->gpio_powerdown, 0);
> @@ -314,86 +347,78 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>         gpiod_set_value(ps_bridge->gpio_reset, 0);
>
>         /*
> -        * Wait for the ps8640 embedded MCU to be ready
> -        * First wait 200ms and then check the MCU ready flag every 20ms
> +        * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
> +        * this is truly necessary since the MCU will already signal that
> +        * things are "good to go" by signaling HPD on "gpio 9". See
> +        * ps8640_ensure_hpd(). For now we'll keep this mystery delay just in
> +        * case.
>          */
>         msleep(200);
>
> -       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> -                                      status & PS_GPIO9, 20 * 1000, 200 * 1000);
> -
> -       if (ret < 0) {
> -               DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
> -               goto err_regulators_disable;
> -       }
> -
> -       msleep(50);
> -
> -       /*
> -        * The Manufacturer Command Set (MCS) is a device dependent interface
> -        * intended for factory programming of the display module default
> -        * parameters. Once the display module is configured, the MCS shall be
> -        * disabled by the manufacturer. Once disabled, all MCS commands are
> -        * ignored by the display interface.
> -        */
> -
> -       ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
> -       if (ret < 0) {
> -               DRM_ERROR("failed write PAGE2_MCS_EN: %d\n", ret);
> -               goto err_regulators_disable;
> -       }
> -
> -       /* Switch access edp panel's edid through i2c */
> -       ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
> -       if (ret < 0) {
> -               DRM_ERROR("failed write PAGE2_I2C_BYPASS: %d\n", ret);
> -               goto err_regulators_disable;
> -       }
> -
> -       ps_bridge->powered = true;
> -
> -       return;
> -
> -err_regulators_disable:
> -       regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
> -                              ps_bridge->supplies);
> +       return 0;
>  }
>
> -static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
> +static int __maybe_unused ps8640_suspend(struct device *dev)
>  {
> +       struct ps8640 *ps_bridge = dev_get_drvdata(dev);
>         int ret;
>
> -       if (!ps_bridge->powered)
> -               return;
> -
>         gpiod_set_value(ps_bridge->gpio_reset, 1);
>         gpiod_set_value(ps_bridge->gpio_powerdown, 1);
>         ret = regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
>                                      ps_bridge->supplies);
>         if (ret < 0)
> -               DRM_ERROR("cannot disable regulators %d\n", ret);
> +               dev_err(dev, "cannot disable regulators %d\n", ret);
>
> -       ps_bridge->powered = false;
> +       return ret;
>  }
>
> +static const struct dev_pm_ops ps8640_pm_ops = {
> +       SET_RUNTIME_PM_OPS(ps8640_suspend, ps8640_resume, NULL)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                               pm_runtime_force_resume)
> +};
> +
>  static void ps8640_pre_enable(struct drm_bridge *bridge)
>  {
>         struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +       struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> +       struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
>         int ret;
>
> -       ps8640_bridge_poweron(ps_bridge);
> +       pm_runtime_get_sync(dev);
> +       ps8640_ensure_hpd(ps_bridge);
> +
> +       /*
> +        * The Manufacturer Command Set (MCS) is a device dependent interface
> +        * intended for factory programming of the display module default
> +        * parameters. Once the display module is configured, the MCS shall be
> +        * disabled by the manufacturer. Once disabled, all MCS commands are
> +        * ignored by the display interface.
> +        */
> +
> +       ret = regmap_update_bits(map, PAGE2_MCS_EN, MCS_EN, 0);
> +       if (ret < 0)
> +               dev_warn(dev, "failed write PAGE2_MCS_EN: %d\n", ret);
>
> -       ret = ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> +       /* Switch access edp panel's edid through i2c */
> +       ret = regmap_write(map, PAGE2_I2C_BYPASS, I2C_BYPASS_EN);
>         if (ret < 0)
> -               ps8640_bridge_poweroff(ps_bridge);
> +               dev_warn(dev, "failed write PAGE2_MCS_EN: %d\n", ret);
> +
> +       ps8640_bridge_vdo_control(ps_bridge, ENABLE);
> +
> +       ps_bridge->pre_enabled = true;
>  }
>
>  static void ps8640_post_disable(struct drm_bridge *bridge)
>  {
>         struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>
> +       ps_bridge->pre_enabled = false;
> +
>         ps8640_bridge_vdo_control(ps_bridge, DISABLE);
> -       ps8640_bridge_poweroff(ps_bridge);
> +       pm_runtime_put_sync_suspend(&ps_bridge->page[PAGE0_DP_CNTL]->dev);
>  }
>
>  static int ps8640_bridge_attach(struct drm_bridge *bridge,
> @@ -426,7 +451,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>                                            struct drm_connector *connector)
>  {
>         struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> -       bool poweroff = !ps_bridge->powered;
> +       bool poweroff = !ps_bridge->pre_enabled;
>         struct edid *edid;
>
>         /*
> @@ -456,6 +481,12 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>         return edid;
>  }
>
> +static void ps8640_runtime_disable(void *data)
> +{
> +       pm_runtime_dont_use_autosuspend(data);
> +       pm_runtime_disable(data);
> +}
> +
>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>         .attach = ps8640_bridge_attach,
>         .detach = ps8640_bridge_detach,
> @@ -586,6 +617,22 @@ static int ps8640_probe(struct i2c_client *client)
>         ps_bridge->aux.transfer = ps8640_aux_transfer;
>         drm_dp_aux_init(&ps_bridge->aux);
>
> +       pm_runtime_enable(dev);
> +       /*
> +        * Powering on ps8640 takes ~300ms. To avoid wasting time on power
> +        * cycling ps8640 too often, set autosuspend_delay to 500ms to ensure
> +        * the bridge wouldn't suspend in between each _aux_transfer_msg() call
> +        * during EDID read (~20ms in my experiment) and in between the last
> +        * _aux_transfer_msg() call during EDID read and the _pre_enable() call
> +        * (~100ms in my experiment).
> +        */
> +       pm_runtime_set_autosuspend_delay(dev, 500);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_suspend_ignore_children(dev, true);
> +       ret = devm_add_action_or_reset(dev, ps8640_runtime_disable, dev);
> +       if (ret)
> +               return ret;
> +
>         drm_bridge_add(&ps_bridge->bridge);
>
>         ret = ps8640_bridge_host_attach(dev, ps_bridge);
> @@ -620,6 +667,7 @@ static struct i2c_driver ps8640_driver = {
>         .driver = {
>                 .name = "ps8640",
>                 .of_match_table = ps8640_match,
> +               .pm = &ps8640_pm_ops,
>         },
>  };
>  module_i2c_driver(ps8640_driver);
> --
> 2.33.0.1079.g6e70778dc9-goog
>
