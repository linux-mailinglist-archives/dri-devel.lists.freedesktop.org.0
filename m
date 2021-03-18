Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFFB33FE27
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 05:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BF26E08A;
	Thu, 18 Mar 2021 04:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC02A6E08A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 04:26:54 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id f19so918580ion.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 21:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ql2dgaEyzlxz1rnlLy2Wg/nnnp7tmOxMWx8bJq2EFZU=;
 b=W8cx8DyHSkSFRXpWsBNRnLfWNZxWBaqqHtgHrd/WpU0n2AEAEWHPGDzYqFXwZW576h
 EcVKZzyxSb3zHtDCDhhYE4iNDuWSd50c4Pvl1YOJtIE6BKhTjwNRAddrDPPyJdHLDLVM
 491KnMySN0siPXOHZisSPMAhdy2AKATWs/m0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ql2dgaEyzlxz1rnlLy2Wg/nnnp7tmOxMWx8bJq2EFZU=;
 b=Yc2N2O/9SbMZCW3dPzEXo5CEFbzLyekIBcp/HPQxB4RUVp31t4jP/2YXushVG32f1a
 YJKRMHFoGqvgimikyuUcKCEvxm6HBoIAH1sdS3WuTrkZVVofpH6nU9rs3unplExRUvQ5
 314cE563C6+sN3sZaPCPg+M7c75QqKBsn08PXGkH+1yfgI5Tjb2uPfX3KZ1b25KUKoTa
 QHej2/TlwXtDO2hxkQqkbD8xEDFxln32DxTdvvn71qfnhclnjM4zTYac0K/u05bTE7e4
 bahRY1kENM/b/ihK4hLAzVQ94JZLGjFxXOS0OIyiMIXXRX38cL+wTVVzbiaCVjjZqq6X
 AV3Q==
X-Gm-Message-State: AOAM532gIcCWxcal1BNFe+h4Jjp/xzbDr6ZpVELR1kJiVffUmQYeyPbp
 uTXBO/rd+MFxPbeMiX9xoUnb5WWcrdGo45Rdg11dBw==
X-Google-Smtp-Source: ABdhPJyiT+pK5YW1/xho4IDNMJd1L9KoZwDrKi/f2JRgrLZDLUc4ArB1kHW9DAPXHK1IuoyC3hGih7UIy39ozt/dTSQ=
X-Received: by 2002:a05:6638:43:: with SMTP id
 a3mr5366562jap.102.1616041612173; 
 Wed, 17 Mar 2021 21:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210224061409.3996755-1-hsinyi@chromium.org>
 <20210224061409.3996755-2-hsinyi@chromium.org>
In-Reply-To: <20210224061409.3996755-2-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 18 Mar 2021 12:26:25 +0800
Message-ID: <CAJMQK-ho9Ncqd=muCv-aMsHSRhgKtC3H6asxR=+3CODpeiWQWQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/bridge: anx7625: disable regulators when power
 off
To: Xin Ji <xji@analogixsemi.com>, dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 2:14 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> When suspending the driver, anx7625_power_standby() will be called to
> turn off reset-gpios and enable-gpios. However, power supplies are not
> disabled. To save power, the driver can get the power supply regulators
> and turn off them in anx7625_power_standby().
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> ---

Ping on the thread, thanks.

>  drivers/gpu/drm/bridge/analogix/anx7625.c | 34 +++++++++++++++++++++++
>  drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f826..23283ba0c4f93 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> @@ -875,12 +876,25 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
>  static void anx7625_power_on(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
> +       int ret, i;
>
>         if (!ctx->pdata.low_power_mode) {
>                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
>                 return;
>         }
>
> +       for (i = 0; i < ARRAY_SIZE(ctx->pdata.supplies); i++) {
> +               ret = regulator_enable(ctx->pdata.supplies[i].consumer);
> +               if (ret < 0) {
> +                       DRM_DEV_DEBUG_DRIVER(dev, "cannot enable supply %d: %d\n",
> +                                            i, ret);
> +                       goto reg_err;
> +               }
> +               usleep_range(2000, 2100);
> +       }
> +
> +       usleep_range(4000, 4100);
> +
>         /* Power on pin enable */
>         gpiod_set_value(ctx->pdata.gpio_p_on, 1);
>         usleep_range(10000, 11000);
> @@ -889,11 +903,16 @@ static void anx7625_power_on(struct anx7625_data *ctx)
>         usleep_range(10000, 11000);
>
>         DRM_DEV_DEBUG_DRIVER(dev, "power on !\n");
> +       return;
> +reg_err:
> +       for (--i; i >= 0; i--)
> +               regulator_disable(ctx->pdata.supplies[i].consumer);
>  }
>
>  static void anx7625_power_standby(struct anx7625_data *ctx)
>  {
>         struct device *dev = &ctx->client->dev;
> +       int ret;
>
>         if (!ctx->pdata.low_power_mode) {
>                 DRM_DEV_DEBUG_DRIVER(dev, "not low power mode!\n");
> @@ -904,6 +923,12 @@ static void anx7625_power_standby(struct anx7625_data *ctx)
>         usleep_range(1000, 1100);
>         gpiod_set_value(ctx->pdata.gpio_p_on, 0);
>         usleep_range(1000, 1100);
> +
> +       ret = regulator_bulk_disable(ARRAY_SIZE(ctx->pdata.supplies),
> +                                    ctx->pdata.supplies);
> +       if (ret < 0)
> +               DRM_DEV_DEBUG_DRIVER(dev, "cannot disable supplies %d\n", ret);
> +
>         DRM_DEV_DEBUG_DRIVER(dev, "power down\n");
>  }
>
> @@ -1742,6 +1767,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
>         platform->client = client;
>         i2c_set_clientdata(client, platform);
>
> +       pdata->supplies[0].supply = "vdd10";
> +       pdata->supplies[1].supply = "vdd18";
> +       pdata->supplies[2].supply = "vdd33";
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pdata->supplies),
> +                                     pdata->supplies);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "fail to get power supplies: %d\n", ret);
> +               return ret;
> +       }
>         anx7625_init_gpio(platform);
>
>         atomic_set(&platform->power_status, 0);
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
> index 193ad86c54503..e4a086b3a3d7b 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -350,6 +350,7 @@ struct s_edid_data {
>  struct anx7625_platform_data {
>         struct gpio_desc *gpio_p_on;
>         struct gpio_desc *gpio_reset;
> +       struct regulator_bulk_data supplies[3];
>         struct drm_bridge *panel_bridge;
>         int intp_irq;
>         u32 low_power_mode;
> --
> 2.30.1.766.gb4fecdf3b7-goog
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
