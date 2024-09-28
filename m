Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BE39891FC
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 01:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2952A10E0C6;
	Sat, 28 Sep 2024 23:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OK9Ev3TJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C44010E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 23:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727565422;
 bh=h4DKK5Kn1M8Ox46FJ7S1xsMtXvsnUtHHTW79/6gY6PQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OK9Ev3TJu62sEB1hX8w0VTmYS5wD1p/8k5yBJFbo5RVvzjOIUc/+ndcoXopVezomn
 W91Rtc0fuGjgMc2PRPKtobg5wtdwyUjcQiqLPh3HUA2/oaUPL2R6aSPsKoqr+jCx3q
 XNRlyL0o6Mg+2HAT38PjbTV/WHMEUVnjjxPpdNv5hjTQFvJthwvXiZA2IwG15sbhTo
 L/2AnNKt+ZFacF4FlPOPnuYfmO31VmwN7b4S9twSwfL/imZz5C2tIJnOC1Yvz9Rju0
 Deoe6P7m+nOXG2tj1pfWOvm09rtkaNOVrSbXmvk/s95v1K0q735K7kIhkGAg3IVmGO
 FPaCWwOb8Jguw==
Received: from [192.168.1.207] (100.121.120.78.rev.sfr.net [78.120.121.100])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D4DA117E0DE9;
 Sun, 29 Sep 2024 01:17:01 +0200 (CEST)
Message-ID: <60bd659a-08d3-4e87-abff-a127101dbc18@collabora.com>
Date: Sun, 29 Sep 2024 02:17:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/rockchip: Add basic RK3588 HDMI output support
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
References: <20240914-b4-rk3588-bridge-upstream-v7-0-2b1348137123@collabora.com>
 <20240914-b4-rk3588-bridge-upstream-v7-3-2b1348137123@collabora.com>
 <20240924-ubiquitous-festive-rabbit-55cdb0@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20240924-ubiquitous-festive-rabbit-55cdb0@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Maxime,

On 9/24/24 5:02 PM, Maxime Ripard wrote:
> Hi,
> 
> On Sat, Sep 14, 2024 at 09:56:53PM GMT, Cristian Ciocaltea wrote:
>> The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
>> Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
>> Samsung IP block.
>>
>> Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
>> without audio, CEC or any of the HDMI 2.1 specific features.
>>
>> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/Kconfig               |   9 +
>>  drivers/gpu/drm/rockchip/Makefile              |   1 +
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 436 +++++++++++++++++++++++++
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |   2 +
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h    |   1 +
>>  5 files changed, 449 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index 23c49e91f1cc..448fadd4ba15 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
>>  	select VIDEOMODE_HELPERS
>>  	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
>>  	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>> +	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
>>  	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
>>  	select GENERIC_PHY if ROCKCHIP_DW_MIPI_DSI
>>  	select GENERIC_PHY_MIPI_DPHY if ROCKCHIP_DW_MIPI_DSI
>> @@ -63,6 +64,14 @@ config ROCKCHIP_DW_HDMI
>>  	  enable HDMI on RK3288 or RK3399 based SoC, you should select
>>  	  this option.
>>  
>> +config ROCKCHIP_DW_HDMI_QP
>> +	bool "Rockchip specific extensions for Synopsys DW HDMI QP"
>> +	select DRM_BRIDGE_CONNECTOR
>> +	help
>> +	  This selects support for Rockchip SoC specific extensions
>> +	  for the Synopsys DesignWare HDMI QP driver. If you want to
>> +	  enable HDMI on RK3588 based SoC, you should select this option.
>> +
>>  config ROCKCHIP_DW_MIPI_DSI
>>  	bool "Rockchip specific extensions for Synopsys DW MIPI DSI"
>>  	select GENERIC_PHY_MIPI_DPHY
>> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
>> index 3ff7b21c0414..3eab662a5a1d 100644
>> --- a/drivers/gpu/drm/rockchip/Makefile
>> +++ b/drivers/gpu/drm/rockchip/Makefile
>> @@ -11,6 +11,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_VOP) += rockchip_drm_vop.o rockchip_vop_reg.o
>>  rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
>>  rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
>>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
>> +rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI_QP) += dw_hdmi_qp-rockchip.o
>>  rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
>>  rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
>>  rockchipdrm-$(CONFIG_ROCKCHIP_LVDS) += rockchip_lvds.o
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> new file mode 100644
>> index 000000000000..19d407c926bd
>> --- /dev/null
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -0,0 +1,436 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021-2022 Rockchip Electronics Co., Ltd.
>> + * Copyright (c) 2024 Collabora Ltd.
>> + *
>> + * Author: Algea Cao <algea.cao@rock-chips.com>
>> + * Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/phy/phy.h>
>> +#include <linux/regmap.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include <drm/bridge/dw_hdmi_qp.h>
>> +#include <drm/drm_bridge_connector.h>
>> +#include <drm/drm_of.h>
>> +#include <drm/drm_probe_helper.h>
>> +#include <drm/drm_simple_kms_helper.h>
>> +
>> +#include "rockchip_drm_drv.h"
>> +
>> +#define RK3588_GRF_SOC_CON2		0x0308
>> +#define RK3588_HDMI0_HPD_INT_MSK	BIT(13)
>> +#define RK3588_HDMI0_HPD_INT_CLR	BIT(12)
>> +#define RK3588_GRF_SOC_CON7		0x031c
>> +#define RK3588_SET_HPD_PATH_MASK	GENMASK(13, 12)
>> +#define RK3588_GRF_SOC_STATUS1		0x0384
>> +#define RK3588_HDMI0_LEVEL_INT		BIT(16)
>> +#define RK3588_GRF_VO1_CON3		0x000c
>> +#define RK3588_SCLIN_MASK		BIT(9)
>> +#define RK3588_SDAIN_MASK		BIT(10)
>> +#define RK3588_MODE_MASK		BIT(11)
>> +#define RK3588_I2S_SEL_MASK		BIT(13)
>> +#define RK3588_GRF_VO1_CON9		0x0024
>> +#define RK3588_HDMI0_GRANT_SEL		BIT(10)
>> +
>> +#define HIWORD_UPDATE(val, mask)	((val) | (mask) << 16)
>> +
>> +struct rockchip_hdmi_qp {
>> +	struct device *dev;
>> +	struct regmap *regmap;
>> +	struct regmap *vo_regmap;
>> +	struct rockchip_encoder encoder;
>> +	struct clk *ref_clk;
>> +	struct dw_hdmi_qp *hdmi;
>> +	struct phy *phy;
>> +	struct gpio_desc *enable_gpio;
>> +	struct delayed_work hpd_work;
>> +};
>> +
>> +static struct rockchip_hdmi_qp *to_rockchip_hdmi_qp(struct drm_encoder *encoder)
>> +{
>> +	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>> +
>> +	return container_of(rkencoder, struct rockchip_hdmi_qp, encoder);
>> +}
>> +
>> +static void
>> +dw_hdmi_qp_rockchip_encoder_mode_set(struct drm_encoder *encoder,
>> +				     struct drm_display_mode *mode,
>> +				     struct drm_display_mode *adj_mode)
>> +{
>> +	struct rockchip_hdmi_qp *hdmi = to_rockchip_hdmi_qp(encoder);
>> +
>> +	clk_set_rate(hdmi->ref_clk, adj_mode->clock * 1000);
>> +}
> 
> I'm not sure you can do that. mode_set can be called multiple times
> while the connector is enabled. It would be better to drop the mode_set
> implementation, and just put it in the encoder enable.
I dropped this in v8 [1], as the ref_clk rate adjustment has been already 
handled via the encoder enable.

Thanks for the review,
Cristian

[1] https://lore.kernel.org/all/20240929-b4-rk3588-bridge-upstream-v8-0-83538c2cc325@collabora.com/
