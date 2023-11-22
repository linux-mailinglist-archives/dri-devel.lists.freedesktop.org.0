Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928897F4EAB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 18:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D848510E0D4;
	Wed, 22 Nov 2023 17:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com
 [95.215.58.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BAF10E0D4;
 Wed, 22 Nov 2023 17:50:50 +0000 (UTC)
Message-ID: <09a78110-99d7-44ca-8558-dd300c353632@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1700675447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOw+hHrA4r+TfdEE+WVDT6I3vzKD2GREfHEw4jCowto=;
 b=NNY0P3nkEdXIvTFdZgaEspupWc3C0vtePf8nbykCdgIOtMGqvdds/UkMdKZrFnfRkqAJpa
 yGRvRmyTeKle8rm7TxjZmNjkEsL4OYQ2TSRxg/KLwyB+510LT+j1uOjTAtigWzypkOzmnG
 TtGHevd26yRWoajYzSxHzQSQVkcjYOc=
Date: Thu, 23 Nov 2023 01:50:37 +0800
MIME-Version: 1.0
Subject: Re: [v6,1/6] drm/bridge: add transparent bridge helper
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>
References: <20231103230414.1483428-2-dmitry.baryshkov@linaro.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231103230414.1483428-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/4 07:03, Dmitry Baryshkov wrote:
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector.

As far as I can tell, traditionally, transparent display bridges are
used to refer to the hardware encoders which transform the video signals.
Such as ADV7123/ADV7125(RGB888 to VGA), TFP410 (RGB888 to DVI) etc.
Which can be used without the need of software configuration. TFP410
is a little bit special, it can be configured by I2C interface, but
TFP410 don't support read edid for the monitor. But at the least,
there do has a corresponding *hardware entity* working in the chains.
It is just that it don't need a driver to configure.

Does the "simple transparent bridges" you created has a corresponding
hardware entity? Are you trying to solve software side problems by
abusing the device-driver model?

I'm afraid that the written "simple transparent bridges" is not a
accurate description if you don't really has a hardware entity to
corresponding with. Because all of the classic drm display bridges
are able to transform transfer/consume video(and/or audio) data.
Well, the device you create just can't. Probably, you should call
it as "simple auxiliary device".


> This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/bridge/Kconfig      |   9 ++
>   drivers/gpu/drm/bridge/Makefile     |   1 +
>   drivers/gpu/drm/bridge/aux-bridge.c | 140 ++++++++++++++++++++++++++++
>   include/drm/bridge/aux-bridge.h     |  19 ++++
>   4 files changed, 169 insertions(+)
>   create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
>   create mode 100644 include/drm/bridge/aux-bridge.h
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index ba82a1142adf..f12eab62799f 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -12,6 +12,15 @@ config DRM_PANEL_BRIDGE
>   	help
>   	  DRM bridge wrapper of DRM panels
>   
> +config DRM_AUX_BRIDGE
> +	tristate
> +	depends on DRM_BRIDGE && OF
> +	select AUXILIARY_BUS
> +	select DRM_PANEL_BRIDGE
> +	help
> +	  Simple transparent bridge that is used by several non-DRM drivers to
> +	  build bridges chain.
> +
>   menu "Display Interface Bridges"
>   	depends on DRM && DRM_BRIDGE
>   
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 2b892b7ed59e..918e3bfff079 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_DRM_AUX_BRIDGE) += aux-bridge.o
>   obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>   obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
>   obj-$(CONFIG_DRM_CROS_EC_ANX7688) += cros-ec-anx7688.o
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> new file mode 100644
> index 000000000000..6245976b8fef
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -0,0 +1,140 @@
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
> +#include <drm/bridge/aux-bridge.h>
> +
> +static DEFINE_IDA(drm_aux_bridge_ida);
> +
> +static void drm_aux_bridge_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	ida_free(&drm_aux_bridge_ida, adev->id);
> +
> +	kfree(adev);
> +}
> +
> +static void drm_aux_bridge_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;

It seems that the single underscore(prefix) at here is a little bit
not good in looking, please replace it with 'void *data'.


> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +/**
> + * drm_aux_bridge_register - Create a simple bridge device to link the chain
> + * @parent: device instance providing this bridge
> + *
> + * Creates a simple DRM bridge that doesn't implement any drm_bridge
> + * operations. Such bridges merely fill a place in the bridge chain linking
> + * surrounding DRM bridges.
> + *
> + * Return: zero on success, negative error code on failure
> + */
> +int drm_aux_bridge_register(struct device *parent)
> +{
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> +	if (!adev)
> +		return -ENOMEM;
> +
> +	ret = ida_alloc(&drm_aux_bridge_ida, GFP_KERNEL);
> +	if (ret < 0) {
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	adev->id = ret;
> +	adev->name = "aux_bridge";
> +	adev->dev.parent = parent;
> +	adev->dev.of_node = parent->of_node;
> +	adev->dev.release = drm_aux_bridge_release;
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret) {
> +		ida_free(&drm_aux_bridge_ida, adev->id);
> +		kfree(adev);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {

kfree(adev)

> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
> +}
> +EXPORT_SYMBOL_GPL(drm_aux_bridge_register);


Yet still coupling. Since you choose to export this function symbol,
then dose this means that the provided approach is still to solve the
problem by allowing static linking? If so, sorry, I think this does
not make a difference with my it66121 series.


> +
> +struct drm_aux_bridge_data {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +};
> +
> +static int drm_aux_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct drm_aux_bridge_data *data;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> +		return -EINVAL;

Does this flags really useful in practice?

Since this bridge is a identity bridge, intend to be used on middle of the whole
chain. Display controller drivers which this module work with should definitely
set the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag. It is definitely a bug if not set.
It should be found during code review stage, I mean that the enum drm_bridge_attach_flags
is a compile-time thing, not a runtime thing anymore, Am I correct?
  

> +	data = container_of(bridge, struct drm_aux_bridge_data, bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, data->next_bridge, bridge,
> +				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +}
> +
> +static const struct drm_bridge_funcs drm_aux_bridge_funcs = {
> +	.attach	= drm_aux_bridge_attach,
> +};
> +
> +static int drm_aux_bridge_probe(struct auxiliary_device *auxdev,
> +				   const struct auxiliary_device_id *id)
> +{
> +	struct drm_aux_bridge_data *data;
> +
> +	data = devm_kzalloc(&auxdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = &auxdev->dev;
> +	data->next_bridge = devm_drm_of_get_bridge(&auxdev->dev, auxdev->dev.of_node, 0, 0);
> +	if (IS_ERR(data->next_bridge))
> +		return dev_err_probe(&auxdev->dev, PTR_ERR(data->next_bridge),
> +				     "failed to acquire drm_bridge\n");
> +
> +	data->bridge.funcs = &drm_aux_bridge_funcs;
> +	data->bridge.of_node = data->dev->of_node;
> +
> +	return devm_drm_bridge_add(data->dev, &data->bridge);
> +}
> +
> +static const struct auxiliary_device_id drm_aux_bridge_table[] = {
> +	{ .name = KBUILD_MODNAME ".aux_bridge" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, drm_aux_bridge_table);
> +
> +static struct auxiliary_driver drm_aux_bridge_drv = {
> +	.name = "aux_bridge",
> +	.id_table = drm_aux_bridge_table,
> +	.probe = drm_aux_bridge_probe,
> +};
> +module_auxiliary_driver(drm_aux_bridge_drv);


Sorry, I don't understand. In effect, this is still works by export function symbol.
Why the kernel module related stuff at here make sense in the end?
Since we are a helper, why we deserve a driver? satisfy the component?


> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("DRM transparent bridge");
> +MODULE_LICENSE("GPL");
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> new file mode 100644
> index 000000000000..441ab3f0e920
> --- /dev/null
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2023 Linaro Ltd.
> + *
> + * Author: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> + */
> +#ifndef DRM_AUX_BRIDGE_H
> +#define DRM_AUX_BRIDGE_H
> +
> +#if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
> +int drm_aux_bridge_register(struct device *parent);
> +#else
> +static inline int drm_aux_bridge_register(struct device *parent)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif
