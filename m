Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561344A8849
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 17:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A156C10E252;
	Thu,  3 Feb 2022 16:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD70E10E2F8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:04:22 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:45850.886286331
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id B0734100199;
 Fri,  4 Feb 2022 00:04:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 2637270b75c940a69ca20338fa5b705f for maxime@cerno.tech; 
 Fri, 04 Feb 2022 00:04:21 CST
X-Transaction-ID: 2637270b75c940a69ca20338fa5b705f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <11ac5696-29e3-fefa-31c0-b7b86c88bbdc@189.cn>
Date: Fri, 4 Feb 2022 00:04:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220203085851.yqstkfgt4dz7rcnw@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



>> diff --git a/drivers/gpu/drm/lsdc/Makefile b/drivers/gpu/drm/lsdc/Makefile
>> new file mode 100644
>> index 000000000000..342990654478
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/Makefile
>> @@ -0,0 +1,15 @@
>> +#
>> +# Makefile for the lsdc drm device driver.
>> +#
>> +
>> +lsdc-y := \
>> +	lsdc_drv.o \
>> +	lsdc_crtc.o \
>> +	lsdc_irq.o \
>> +	lsdc_plane.o \
>> +	lsdc_pll.o \
>> +	lsdc_i2c.o \
>> +	lsdc_encoder.o \
>> +	lsdc_connector.o
>> +
>> +obj-$(CONFIG_DRM_LSDC) += lsdc.o
>> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc/lsdc_connector.c
>> new file mode 100644
>> index 000000000000..ae5fc0c90961
>> --- /dev/null
>> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
>> @@ -0,0 +1,443 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2020 Loongson Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the
>> + * "Software"), to deal in the Software without restriction, including
>> + * without limitation the rights to use, copy, modify, merge, publish,
>> + * distribute, sub license, and/or sell copies of the Software, and to
>> + * permit persons to whom the Software is furnished to do so, subject to
>> + * the following conditions:
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
>> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
>> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
>> + *
>> + * The above copyright notice and this permission notice (including the
>> + * next paragraph) shall be included in all copies or substantial portions
>> + * of the Software.
>> + */
> That's the MIT license, yet you claim the driver to be licensed under
> the GPLv2 or later?

I just copy then paste it blindly, sorry about that.
I do not know the difference, we want open the source anyway.
I will correct it in next version, thanks.

>> +
>> +/*
>> + * Authors:
>> + *      Sui Jingfeng <suijingfeng@loongson.cn>
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_connector.h>
>> +
>> +#include <video/videomode.h>
>> +#include <video/of_display_timing.h>
>> +
>> +#include "lsdc_drv.h"
>> +#include "lsdc_i2c.h"
>> +#include "lsdc_connector.h"
>> +
>> +
>> +static int lsdc_get_modes_from_edid(struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = connector->dev;
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +	struct edid *edid_p = (struct edid *)lconn->edid_data;
>> +	int num = drm_add_edid_modes(connector, edid_p);
>> +
>> +	if (num)
>> +		drm_connector_update_edid_property(connector, edid_p);
>> +
>> +	drm_dbg_kms(ddev, "%d modes added\n", num);
>> +
>> +	return num;
>> +}
>> +
>> +
>> +static int lsdc_get_modes_from_timings(struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = connector->dev;
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +	struct display_timings *disp_tim = lconn->disp_tim;
>> +	unsigned int num = 0;
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < disp_tim->num_timings; i++) {
>> +		const struct display_timing *dt = disp_tim->timings[i];
>> +		struct drm_display_mode *mode;
>> +		struct videomode vm;
>> +
>> +		videomode_from_timing(dt, &vm);
>> +		mode = drm_mode_create(ddev);
>> +		if (!mode) {
>> +			drm_err(ddev, "failed to add mode %ux%u\n",
>> +					dt->hactive.typ, dt->vactive.typ);
>> +			continue;
>> +		}
>> +
>> +		drm_display_mode_from_videomode(&vm, mode);
>> +
>> +		mode->type |= DRM_MODE_TYPE_DRIVER;
>> +
>> +		if (i == disp_tim->native_mode)
>> +			mode->type |= DRM_MODE_TYPE_PREFERRED;
>> +
>> +		drm_mode_probed_add(connector, mode);
>> +		num++;
>> +	}
>> +
>> +	drm_dbg_kms(ddev, "%d modes added\n", num);
>> +
>> +	return num;
>> +}
>> +
>> +
>> +static int lsdc_get_modes_from_ddc(struct drm_connector *connector,
>> +				   struct i2c_adapter *ddc)
>> +{
>> +	unsigned int num = 0;
>> +	struct edid *edid;
>> +
>> +	edid = drm_get_edid(connector, ddc);
>> +	if (edid) {
>> +		drm_connector_update_edid_property(connector, edid);
>> +		num = drm_add_edid_modes(connector, edid);
>> +		kfree(edid);
>> +	}
>> +
>> +	return num;
>> +}
>> +
>> +
>> +static int lsdc_get_modes(struct drm_connector *connector)
>> +{
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +	unsigned int num = 0;
>> +
>> +	if (lconn->has_edid)
>> +		return lsdc_get_modes_from_edid(connector);
>> +
>> +	if (lconn->has_disp_tim)
>> +		return lsdc_get_modes_from_timings(connector);
>> +
>> +	if (IS_ERR_OR_NULL(lconn->ddc) == false)
>> +		return lsdc_get_modes_from_ddc(connector, lconn->ddc);
>> +
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL) {
>> +		num = drm_add_modes_noedid(connector,
>> +				     connector->dev->mode_config.max_width,
>> +				     connector->dev->mode_config.max_height);
>> +
>> +		drm_set_preferred_mode(connector, 1024, 768);
>> +
>> +		return num;
>> +	}
>> +
>> +
>> +	/*
>> +	 * In case we cannot retrieve the EDIDs (broken or missing i2c
>> +	 * bus), fallback on the XGA standards, because we are for board
>> +	 * bringup.
>> +	 */
>> +	num = drm_add_modes_noedid(connector, 1920, 1200);
>> +
>> +	/* And prefer a mode pretty much anyone can handle */
>> +	drm_set_preferred_mode(connector, 1024, 768);
>> +
>> +	return num;
>> +
>> +}
>> +
>> +
>> +static enum drm_connector_status
>> +lsdc_connector_detect(struct drm_connector *connector, bool force)
>> +{
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +
>> +	if (lconn->has_edid == true)
>> +		return connector_status_connected;
>> +
>> +	if (lconn->has_disp_tim == true)
>> +		return connector_status_connected;
>> +
>> +	if (IS_ERR_OR_NULL(lconn->ddc) == false)
>> +		return drm_probe_ddc(lconn->ddc);
>> +
>> +	if (lconn->ddc && drm_probe_ddc(lconn->ddc))
>> +		return connector_status_connected;
>> +
>> +	if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
>> +		return connector_status_connected;
>> +
>> +	if ((connector->connector_type == DRM_MODE_CONNECTOR_DVIA) ||
>> +	    (connector->connector_type == DRM_MODE_CONNECTOR_DVID) ||
>> +	    (connector->connector_type == DRM_MODE_CONNECTOR_DVII))
>> +		return connector_status_disconnected;
>> +
>> +	if ((connector->connector_type == DRM_MODE_CONNECTOR_HDMIA) ||
>> +	    (connector->connector_type == DRM_MODE_CONNECTOR_HDMIB))
>> +		return connector_status_disconnected;
>> +
>> +	return connector_status_unknown;
>> +}
>> +
>> +
>> +/*
>> + * @connector: point to the drm_connector structure
>> + *
>> + * Clean up connector resources
>> + */
>> +static void lsdc_connector_destroy(struct drm_connector *connector)
>> +{
>> +	struct drm_device *ddev = connector->dev;
>> +	struct lsdc_connector *lconn = to_lsdc_connector(connector);
>> +
>> +	if (lconn) {
>> +		if (lconn->ddc)
>> +			lsdc_destroy_i2c(connector->dev, lconn->ddc);
>> +
>> +		drm_info(ddev, "destroying connector%u\n", lconn->index);
>> +
>> +		devm_kfree(ddev->dev, lconn);
>> +	}
>> +
>> +	drm_connector_cleanup(connector);
>> +}
>> +
>> +
>> +static const struct drm_connector_helper_funcs lsdc_connector_helpers = {
>> +	.get_modes = lsdc_get_modes,
>> +};
>> +
>> +/*
>> + * These provide the minimum set of functions required to handle a connector
>> + *
>> + * Control connectors on a given device.
>> + *
>> + * Each CRTC may have one or more connectors attached to it.
>> + * The functions below allow the core DRM code to control
>> + * connectors, enumerate available modes, etc.
>> + */
>> +static const struct drm_connector_funcs lsdc_connector_funcs = {
>> +	.dpms = drm_helper_connector_dpms,
>> +	.detect = lsdc_connector_detect,
>> +	.fill_modes = drm_helper_probe_single_connector_modes,
>> +	.destroy = lsdc_connector_destroy,
>> +	.reset = drm_atomic_helper_connector_reset,
>> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +
>> +/* Get the simple EDID data from the device tree
>> + * the length must be EDID_LENGTH, since it is simple.
>> + *
>> + * @np: device node contain edid data
>> + * @edid_data: where the edid data to store to
>> + */
>> +static bool lsdc_get_edid_from_dtb(struct device_node *np,
>> +				   unsigned char *edid_data)
>> +{
>> +	int length;
>> +	const void *prop;
>> +
>> +	if (np == NULL)
>> +		return false;
>> +
>> +	prop = of_get_property(np, "edid", &length);
>> +	if (prop && (length == EDID_LENGTH)) {
>> +		memcpy(edid_data, prop, EDID_LENGTH);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
> You don't have a device tree binding for that driver, this is something
> that is required. And it's not clear to me why you'd want EDID in the
> DTB?

1) It is left to the end user of this driver.

The downstream motherboard maker may use a dpi(XRGB888) or LVDS panel
which don't have DDC support either, doing this way allow them put a
EDID property into the dc device node in the DTS. Then the entire system works.
Note those panel usually support only one display mode.

2) That is for the display controller in ls2k1000 SoC.

Currently, the upstream kernel still don't have GPIO, PWM and I2C driver support
for LS2K1000 SoC.

How dose you read EDID from the monitor without a I2C driver?

without reading EDID the device tree support, the screen just black,
the lsdc driver just stall. With reading EDID from device tree support
we do not need a i2c driver to light up the monitor.

This make lsdc drm driver work on various ls2k1000 development board
before I2C driver and GPIO driver and PWM backlight driver is upstream.

I have many local private dts with the bindings, those local change just can not
upstream at this time, below is an example.

3) Again, doing this way is for graphic environment bring up.

&lsdc {

     output-ports = <&dvo0 &dvo1>;
     #address-cells = <1>;
     #size-cells = <0>;
     dvo0: dvo@0 {
         reg = <0>;

         connector = "dpi-connector";
         encoder = "none";
         status = "ok";

         display-timings {
             native-mode = <&mode_0_1024x600_60>;

             mode_0_1024x600_60: panel-timing@0 {
                 clock-frequency = <51200000>;
                 hactive = <1024>;
                 vactive = <600>;
                 hsync-len = <4>;
                 hfront-porch = <160>;
                 hback-porch = <156>;
                 vfront-porch = <11>;
                 vback-porch = <23>;
                 vsync-len = <1>;
             };

             mode_1_800x480_60: panel-timing@1 {
                 clock-frequency = <30066000>;
                 hactive = <800>;
                 vactive = <480>;
                 hfront-porch = <50>;
                 hback-porch = <70>;
                 hsync-len = <50>;
                 vback-porch = <0>;
                 vfront-porch = <0>;
                 vsync-len = <50>;
             };
         };
     };

     dvo1: dvo@1 {
         reg = <1>;

         connector = "hdmi-connector";
         type = "a";
         encoder = "sil9022";

         edid = [ 00 ff ff ff ff ff ff 00 1e 6d 54 5b 0b cc 04 00
              02 1c 01 03 6c 30 1b 78 ea 31 35 a5 55 4e a1 26
              0c 50 54 a5 4b 00 71 4f 81 80 95 00 b3 00 a9 c0
              81 00 81 c0 90 40 02 3a 80 18 71 38 2d 40 58 2c
              45 00 e0 0e 11 00 00 1e 00 00 00 fd 00 38 4b 1e
              53 0f 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c
              47 20 46 55 4c 4c 20 48 44 0a 20 20 00 00 00 ff
              00 38 30 32 4e 54 43 5a 39 38 33 37 39 0a 00 35 ];

         status = "ok";
     };
};


