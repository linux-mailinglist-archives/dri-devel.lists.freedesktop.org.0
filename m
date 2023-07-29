Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C87682AB
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jul 2023 01:06:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E13610E22D;
	Sat, 29 Jul 2023 23:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3C010E22D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 23:06:41 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-57045429f76so34951167b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 16:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690672000; x=1691276800;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/muLVJBTfJy4sEvxdsnx9X7USkoLQCDic9wXkkLaYLo=;
 b=EUky0LpvnqGuKIAsZ4/Q6MwcK/oPUJQC6q/iXjbf8Mg/pImKd95kWvfIvEoz0hjLEl
 IDXq6IC002x/oVA1v19llsx/AJZsCMpX4KdhEWR+RHKVInItdfa6g1pwhUlVOblZaG3m
 3LFeP4FrVFxJCXV6ecsVTeKv8JQHVFA0hYK5T6MKpLPFQZ0YyfrIivxYM6ozsjN4kpen
 Fvr2BbaHQ3fqzz6bhKaHHVahcs+Zt4iCFRO7V/hVufjjXrC92l1U3UojUzV4Kx2hPefE
 saNsrBLvXxn5PSDP7SPxBiG+gLpk1rpeMTi8G4wiiU8RN+fH8Tu0gXdMIlIFonhMweIo
 vzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690672000; x=1691276800;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/muLVJBTfJy4sEvxdsnx9X7USkoLQCDic9wXkkLaYLo=;
 b=JRWh8O10e9TlfGNyH172s3Uta3QncdyN6jLZvMOkOnmp4ktm9fjeJ0IoUNu61wZoez
 E3o+tdVi0F++/XNg1sQeHJazXp7gLMIloFPcUY4Cxb4MAS8oC4cCvl9Df6pWwx0oo1i8
 Ejt3CVVikwlpgtSYJk6eWDvG8ga2CXDCw2iivityo7kR/fA+EAqVsh9T/gILpiVWKVzi
 mb02B/9uXrl8exOtW6Jf2sBcU6JVl+Siy3Hbv5oewpssi1GJZPiimwf1sT8SKtf24nfR
 7GsgmctR50CDx4b1AFXD5eM0WpVohbNbCNi+VT7T5MpW1nSzTuADoErB60+BwHFqB0bS
 ZXQA==
X-Gm-Message-State: ABy/qLZikIadu71dJ739oQc20LmiJZ4kvfrls3lKo4Ie0HAlI6V8nF4o
 +6VGCXmlmPUlITnfsfBIuKS0EFYjlVq+zXlcD747dQ==
X-Google-Smtp-Source: APBJJlHfoZ6Xr5CfW8PPzNE3Z2CdpsPRR8CNcc4mp0BoZINPljqKuxiyat6ToSqKHdkQb6SoyH8yqJ3XSgeBvRSNF9A=
X-Received: by 2002:a81:4607:0:b0:576:9ec8:db68 with SMTP id
 t7-20020a814607000000b005769ec8db68mr6302219ywa.18.1690672000514; Sat, 29 Jul
 2023 16:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
 <20230729204307.268587-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230729204307.268587-2-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 30 Jul 2023 02:06:29 +0300
Message-ID: <CAA8EJpryy39EPqf23OjWNWVtO98vx+G-exJStqstwJZErKkMBw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/display: add transparent bridge helper
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Jul 2023 at 23:43, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector. This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/Kconfig             |   9 ++
>  drivers/gpu/drm/display/Makefile            |   2 +
>  drivers/gpu/drm/display/drm_simple_bridge.c | 120 ++++++++++++++++++++
>  include/drm/display/drm_simple_bridge.h     |  19 ++++
>  4 files changed, 150 insertions(+)
>  create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
>  create mode 100644 include/drm/display/drm_simple_bridge.h
>
> diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> index 09712b88a5b8..a6132984b9e3 100644
> --- a/drivers/gpu/drm/display/Kconfig
> +++ b/drivers/gpu/drm/display/Kconfig
> @@ -49,3 +49,12 @@ config DRM_DP_CEC
>
>           Note: not all adapters support this feature, and even for those
>           that do support this they often do not hook up the CEC pin.
> +
> +config DRM_SIMPLE_BRIDGE
> +       tristate
> +       depends on DRM
> +       select AUXILIARY_BUS
> +       select DRM_PANEL_BRIDGE
> +       help
> +         Simple transparent bridge that is used by several drivers to build
> +         bridges chain.
> diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> index 17ac4a1006a8..6e2b0d7f24b3 100644
> --- a/drivers/gpu/drm/display/Makefile
> +++ b/drivers/gpu/drm/display/Makefile
> @@ -16,3 +16,5 @@ drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
>  drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
>
>  obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
> +
> +obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += drm_simple_bridge.o
> diff --git a/drivers/gpu/drm/display/drm_simple_bridge.c b/drivers/gpu/drm/display/drm_simple_bridge.c
> new file mode 100644
> index 000000000000..c9966691efb1
> --- /dev/null
> +++ b/drivers/gpu/drm/display/drm_simple_bridge.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/module.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/display/drm_simple_bridge.h>
> +
> +static DEFINE_IDA(simple_bridge_ida);
> +
> +static void drm_simple_bridge_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       kfree(adev);
> +}
> +
> +static void drm_simple_bridge_unregister_adev(void *_adev)
> +{
> +       struct auxiliary_device *adev = _adev;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +
> +int drm_simple_bridge_register(struct device *parent)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       ret = ida_alloc(&simple_bridge_ida, GFP_KERNEL);
> +       if (ret < 0)
> +               return ret;
> +
> +       adev->id = ret;
> +       adev->name = "simple_bridge";
> +       adev->dev.parent = parent;
> +       adev->dev.of_node = parent->of_node;
> +       adev->dev.release = drm_simple_bridge_release;
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               kfree(adev);
> +               return ret;
> +       }
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(parent, drm_simple_bridge_unregister_adev, adev);
> +}

Forgot EXPORT_SYMBOL_GPL, MODULE_LICENSE, etc. I'll fix that for v2 if
the overall idea is found to be acceptable.

> +
> +struct drm_simple_bridge_data {
> +       struct drm_bridge bridge;
> +       struct drm_bridge *next_bridge;
> +       struct device *dev;
> +};
> +
> +static int drm_simple_bridge_attach(struct drm_bridge *bridge,
> +                                   enum drm_bridge_attach_flags flags)
> +{
> +       struct drm_simple_bridge_data *data;
> +
> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +               return -EINVAL;
> +
> +       data = container_of(bridge, struct drm_simple_bridge_data, bridge);
> +
> +       return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> +                                DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static const struct drm_bridge_funcs drm_simple_bridge_funcs = {
> +       .attach = drm_simple_bridge_attach,
> +};
> +
> +static int drm_simple_bridge_probe(struct auxiliary_device *auxdev,
> +                                  const struct auxiliary_device_id *id)
> +{
> +       struct drm_simple_bridge_data *data;
> +
> +       data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->dev = &auxdev->dev;
> +       data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
> +       if (IS_ERR(data->next_bridge))
> +               return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
> +                                    "failed to acquire drm_bridge\n");
> +
> +       data->bridge.funcs = &drm_simple_bridge_funcs;
> +       data->bridge.of_node = data->dev->of_node;
> +
> +       return devm_drm_bridge_add(data->dev, &data->bridge);
> +}
> +
> +static const struct auxiliary_device_id drm_simple_bridge_table[] = {
> +       { .name = KBUILD_MODNAME ".simple_bridge" },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, drm_simple_bridge_table);
> +
> +struct auxiliary_driver drm_simple_bridge_drv = {
> +       .name = "simple_bridge",
> +       .id_table = drm_simple_bridge_table,
> +       .probe = drm_simple_bridge_probe,
> +};
> +module_auxiliary_driver(drm_simple_bridge_drv);
> diff --git a/include/drm/display/drm_simple_bridge.h b/include/drm/display/drm_simple_bridge.h
> new file mode 100644
> index 000000000000..3da8e1fb1137
> --- /dev/null
> +++ b/include/drm/display/drm_simple_bridge.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#ifndef DRM_SIMPLE_BRIDGE_H
> +#define DRM_SIMPLE_BRIDGE_H
> +
> +#if IS_ENABLED(CONFIG_DRM_SIMPLE_BRIDGE)
> +int drm_simple_bridge_register(struct device *parent);
> +#else
> +static inline int drm_simple_bridge_register(struct device *parent)
> +{
> +       return 0;
> +}
> +#endif
> +
> +#endif
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
