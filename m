Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA8C4BDA3E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA6710E4DF;
	Mon, 21 Feb 2022 14:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBDF10E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:32:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A32611F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453921;
 bh=pcz8oOGrjFh2SVFZ3n6Adko0dAh6zVyh/J9fnbJ4Auc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Che/z3JTxL9NeFhQWgGMG6VP55mMJssmnk/1LW1qVlDIwslXDzuJk80xLi1QuH9Gt
 9y+LXL1xghJIAchjjSYZAq/fTtSAkroO4IdqbFKSnULCZERIbVXWn6tAg7zic4VgRz
 Bug9iYsg3HFdK7fjBxuuWdSHF9mXynX27XPl5Q1DDOdyFo0U+dCuRvYThjFGP/5DKE
 S9LZBUG42hrCYd6ZYwuA88zJHJ9Tx+cbc75N8/t1wqGwSvT5ihbUc6T1gl3EvHnht0
 km9/b4x9hu5RpuqtDbhJPdO1aGKwx5/j9+S8yef8hjntALT0MPY9i2BJtImWIO4jOR
 6xOvdkM/VuORw==
Message-ID: <6681c4a1-501f-a220-4997-f5d04a399b8a@collabora.com>
Date: Mon, 21 Feb 2022 15:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 15/19] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-16-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-16-granquet@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
> hot-plug-detection and DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>   drivers/gpu/drm/mediatek/Kconfig       |    7 +
>   drivers/gpu/drm/mediatek/Makefile      |    2 +
>   drivers/gpu/drm/mediatek/mtk_dp.c      | 2358 ++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>   6 files changed, 2937 insertions(+)
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index 2976d21e9a34a..029b94c716131 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,3 +28,10 @@ config DRM_MEDIATEK_HDMI
>   	select PHY_MTK_HDMI
>   	help
>   	  DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config MTK_DPTX_SUPPORT
> +	tristate "DRM DPTX Support for Mediatek SoCs"
> +	depends on DRM_MEDIATEK
> +	select PHY_MTK_DP
> +	help
> +	  DRM/KMS Display Port driver for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index 29098d7c8307c..d86a6406055e6 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>   			  mtk_hdmi_ddc.o
>   
>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> +
> +obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> new file mode 100644
> index 0000000000000..5b60293ecc0d3
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -0,0 +1,2358 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_dp_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/kernel.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <sound/hdmi-codec.h>
> +#include <video/videomode.h>
> +
> +#include "mtk_dp_reg.h"
> +
> +#define MTK_DP_AUX_WAIT_REPLY_COUNT 20
> +#define MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT 3
> +
> +#define MTK_DP_MAX_LANES 4
> +#define MTK_DP_MAX_LINK_RATE MTK_DP_LINKRATE_HBR3

DP_MAX_LANES and DP_MAX_LINK_RATE should be SoC-specific properties and
not definitions, as newer SoCs may support a lower, or higher (which is
right now impossible but future-proofing the driver looks right).

> +
> +#define MTK_DP_TBC_BUF_READ_START_ADDR 0x08
> +
> +#define MTK_DP_TRAIN_RETRY_LIMIT 8
> +#define MTK_DP_TRAIN_MAX_ITERATIONS 5
> +
> +#define MTK_DP_AUX_WRITE_READ_WAIT_TIME_US 20
> +
> +#define MTK_DP_DP_VERSION_11 0x11
> +
> +enum mtk_dp_state {
> +	MTK_DP_STATE_INITIAL,
> +	MTK_DP_STATE_IDLE,
> +	MTK_DP_STATE_PREPARE,
> +	MTK_DP_STATE_NORMAL,
> +};
> +
> +enum mtk_dp_train_state {
> +	MTK_DP_TRAIN_STATE_STARTUP = 0,
> +	MTK_DP_TRAIN_STATE_CHECKCAP,
> +	MTK_DP_TRAIN_STATE_CHECKEDID,
> +	MTK_DP_TRAIN_STATE_TRAINING_PRE,
> +	MTK_DP_TRAIN_STATE_TRAINING,
> +	MTK_DP_TRAIN_STATE_NORMAL,
> +	MTK_DP_TRAIN_STATE_DPIDLE,
> +};
> +
> +struct mtk_dp_timings {
> +	struct videomode vm;
> +
> +	u16 htotal;
> +	u16 vtotal;
> +	u8 frame_rate;
> +	u32 pix_rate_khz;
> +};
> +
> +struct mtk_dp_train_info {
> +	bool tps3;
> +	bool tps4;
> +	bool sink_ssc;
> +	bool cable_plugged_in;
> +	bool cable_state_change;
> +	bool cr_done;
> +	bool eq_done;
> +
> +	// link_rate is in multiple of 0.27Gbps

C-style comments please:

	/* link_rate is in multiples of 0.27Gbps */

> +	int link_rate;
> +	int lane_count;
> +
> +	int irq_status;
Can irq_status ever be < 0?

> +	int check_cap_count;
> +};
> +

C-style comments please. Here and everywhere else.

> +// Same values as used by the DP Spec for MISC0 bits 1 and 2
> +enum mtk_dp_color_format {
> +	MTK_DP_COLOR_FORMAT_RGB_444 = 0,
> +	MTK_DP_COLOR_FORMAT_YUV_422 = 1,
> +	MTK_DP_COLOR_FORMAT_YUV_444 = 2,
> +	MTK_DP_COLOR_FORMAT_YUV_420 = 3,
> +	MTK_DP_COLOR_FORMAT_YONLY = 4,
> +	MTK_DP_COLOR_FORMAT_RAW = 5,
> +	MTK_DP_COLOR_FORMAT_RESERVED = 6,
> +	MTK_DP_COLOR_FORMAT_DEFAULT = MTK_DP_COLOR_FORMAT_RGB_444,
> +	MTK_DP_COLOR_FORMAT_UNKNOWN = 15,
> +};
> +
> +// Multiple of 0.27Gbps
> +enum mtk_dp_linkrate {
> +	MTK_DP_LINKRATE_RBR = 0x6,
> +	MTK_DP_LINKRATE_HBR = 0xA,
> +	MTK_DP_LINKRATE_HBR2 = 0x14,
> +	MTK_DP_LINKRATE_HBR25 = 0x19,
> +	MTK_DP_LINKRATE_HBR3 = 0x1E,
> +};
> +
> +// Same values as used for DP Spec MISC0 bits 5,6,7
> +enum mtk_dp_color_depth {
> +	MTK_DP_COLOR_DEPTH_6BIT = 0,
> +	MTK_DP_COLOR_DEPTH_8BIT = 1,
> +	MTK_DP_COLOR_DEPTH_10BIT = 2,
> +	MTK_DP_COLOR_DEPTH_12BIT = 3,
> +	MTK_DP_COLOR_DEPTH_16BIT = 4,
> +	MTK_DP_COLOR_DEPTH_UNKNOWN = 5,
> +};
> +
> +struct mtk_dp_info {
> +	enum mtk_dp_color_depth depth;
> +	enum mtk_dp_color_format format;
> +	struct mtk_dp_timings timings;
> +};
> +
> +struct dp_cal_data {
> +	unsigned int glb_bias_trim;
> +	unsigned int clktx_impse;
> +

I would propose:

	u32 tx_impsel_nmos_ln[MTK_DP_MAX_LANES];
	u32 tx_impsel_pmos_ln[MTK_DP_MAX_LANES];

> +	unsigned int ln0_tx_impsel_pmos;
> +	unsigned int ln0_tx_impsel_nmos;
> +	unsigned int ln1_tx_impsel_pmos;
> +	unsigned int ln1_tx_impsel_nmos;
> +	unsigned int ln2_tx_impsel_pmos;
> +	unsigned int ln2_tx_impsel_nmos;
> +	unsigned int ln3_tx_impsel_pmos;
> +	unsigned int ln3_tx_impsel_nmos;
> +};
> +
> +struct mtk_dp {
> +	struct device *dev;
> +	struct platform_device *phy_dev;
> +	struct phy *phy;
> +	struct dp_cal_data cal_data;
> +
> +	struct drm_device *drm_dev;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct drm_dp_aux aux;
> +
> +	/* Protects edid as it is used in both bridge ops and IRQ handler */
> +	struct mutex edid_lock;
> +	struct edid *edid;
> +
> +	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
> +
> +	struct mtk_dp_info info;
> +	enum mtk_dp_state state;
> +
> +	struct mtk_dp_train_info train_info;
> +	enum mtk_dp_train_state train_state;
> +	unsigned int input_fmt;
> +
> +	struct regmap *regs;
> +	struct clk *dp_tx_clk;
> +
> +	bool enabled;
> +
> +	bool has_fec;
> +	/* Protects the mtk_dp struct */
> +	struct mutex dp_lock;
> +
> +	hdmi_codec_plugged_cb plugged_cb;
> +	struct device *codec_dev;
> +	u8 connector_eld[MAX_ELD_BYTES];
> +	struct drm_connector *conn;
> +};
> +
> +static struct regmap_config mtk_dp_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = SEC_OFFSET + 0x90,
> +	.name = "mtk-dp-registers",
> +};
> +
> +static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
> +{
> +	return container_of(b, struct mtk_dp, bridge);
> +}
> +
> +static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
> +{
> +	u32 read_val;
> +	int ret;
> +
> +	ret = regmap_read(mtk_dp->regs, offset, &read_val);
> +	if (ret) {
> +		dev_err(mtk_dp->dev, "Failed to read register 0x%x: %d\n",
> +			offset, ret);
> +		return 0;
> +	}
> +
> +	return read_val;
> +}
> +
> +static void mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
> +{
> +	int ret;
> +
> +	ret = regmap_write(mtk_dp->regs, offset, val);
> +	if (ret)
> +		dev_err(mtk_dp->dev,
> +			"Failed to write register 0x%x with value 0x%x: %d\n",
> +			offset, val, ret);

You should return the error for the caller to take action.

> +}
> +
> +static void mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset, u32 val,
> +			       u32 mask)
> +{
> +	int ret;
> +
> +	ret = regmap_update_bits(mtk_dp->regs, offset, mask, val);
> +	if (ret)
> +		dev_err(mtk_dp->dev,
> +			"Failed to update register 0x%x with value 0x%x, mask 0x%x: %d\n",
> +			offset, val, mask, ret);

Same here.

> +}
> +
> +static void mtk_dp_bulk_16bit_write(struct mtk_dp *mtk_dp, u32 offset, u8 *buf,
> +				    size_t length)
> +{
> +	int i;
> +	int num_regs = (length + 1) / 2;
> +

C-style comments please.

> +	// 2 bytes per register
> +	for (i = 0; i < num_regs; i++) {
> +		u32 val = buf[i * 2] |
> +			  (i * 2 + 1 < length ? buf[i * 2 + 1] << 8 : 0);
> +
> +		mtk_dp_write(mtk_dp, offset + i * 4, val);

Does it really make sense to keep writing if some write fails?

> +	}
> +}
> +
> +static unsigned long mtk_dp_sip_atf_call(unsigned int cmd, unsigned int para)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32, cmd, para, 0, 0, 0, 0, 0,
> +		      &res);
> +
> +	pr_debug("[DPTX]%s cmd 0x%x, p1 0x%x, ret 0x%lx-0x%lx", __func__, cmd,
> +		 para, res.a0, res.a1);
> +	return res.a1;
> +}
> +
> +static void mtk_dp_msa_bypass_disable(struct mtk_dp *mtk_dp)
> +{
> +	const u16 bits_to_set =
> +		BIT(HTOTAL_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VTOTAL_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(HSTART_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VSTART_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(HWIDTH_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VHEIGHT_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(HSP_SEL_DP_ENC0_P0_SHIFT) | BIT(HSW_SEL_DP_ENC0_P0_SHIFT) |
> +		BIT(VSP_SEL_DP_ENC0_P0_SHIFT) | BIT(VSW_SEL_DP_ENC0_P0_SHIFT);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3030, bits_to_set,
> +			   bits_to_set);
> +}
> +
> +static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)
> +{
> +	struct mtk_dp_timings *timings = &mtk_dp->info.timings;
> +

If you really don't expect (I don't) the following writes to error out, then
it makes sense to simply call regmap_update_bits here instead of using that
helper...

...otherwise, you should check if anything went wrong on each call, and
make this function to eventually return the error to the caller.

> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3010, timings->htotal,
> +			   HTOTAL_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3018,
> +			   timings->vm.hsync_len + timings->vm.hback_porch,
> +			   HSTART_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3028,
> +			   timings->vm.hsync_len << HSW_SW_DP_ENC0_P0_SHIFT,
> +			   HSW_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3028, 0,
> +			   HSP_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3020, timings->vm.hactive,
> +			   HWIDTH_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3014, timings->vtotal,
> +			   VTOTAL_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_301C,
> +			   timings->vm.vsync_len + timings->vm.vback_porch,
> +			   VSTART_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_302C,
> +			   timings->vm.vsync_len << VSW_SW_DP_ENC0_P0_SHIFT,
> +			   VSW_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_302C, 0,
> +			   VSP_SW_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3024, timings->vm.vactive,
> +			   VHEIGHT_SW_DP_ENC0_P0_MASK);
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3064, timings->vm.hactive,
> +			   HDE_NUM_LAST_DP_ENC0_P0_MASK);
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3154, timings->htotal,
> +			   PGEN_HTOTAL_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3158,
> +			   timings->vm.hfront_porch,
> +			   PGEN_HSYNC_RISING_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_315C, timings->vm.hsync_len,
> +			   PGEN_HSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3160,
> +			   timings->vm.hback_porch + timings->vm.hsync_len,
> +			   PGEN_HFDE_START_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3164, timings->vm.hactive,
> +			   PGEN_HFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3168, timings->vtotal,
> +			   PGEN_VTOTAL_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_316C,
> +			   timings->vm.vfront_porch,
> +			   PGEN_VSYNC_RISING_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3170, timings->vm.vsync_len,
> +			   PGEN_VSYNC_PULSE_WIDTH_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3174,
> +			   timings->vm.vback_porch + timings->vm.vsync_len,
> +			   PGEN_VFDE_START_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3178, timings->vm.vactive,
> +			   PGEN_VFDE_ACTIVE_WIDTH_DP_ENC0_P0_MASK);
> +}
> +
> +static void mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
> +				    enum mtk_dp_color_format color_format)
> +{
> +	u32 val;
> +
> +	mtk_dp->info.format = color_format;
> +

C-style comments!
Also, check return value, or avoid helper function usage.

> +	// Update MISC0
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +			   color_format << DP_TEST_COLOR_FORMAT_SHIFT,
> +			   DP_TEST_COLOR_FORMAT_MASK);
> +
> +	switch (color_format) {
> +	case MTK_DP_COLOR_FORMAT_YUV_422:
> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR422;
> +		break;
> +	case MTK_DP_COLOR_FORMAT_YUV_420:
> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_YCBCR420;
> +		break;
> +	case MTK_DP_COLOR_FORMAT_YONLY:
> +	case MTK_DP_COLOR_FORMAT_RAW:
> +	case MTK_DP_COLOR_FORMAT_RESERVED:
> +	case MTK_DP_COLOR_FORMAT_UNKNOWN:
> +		drm_warn(mtk_dp->drm_dev, "Unsupported color format: %d\n",
> +			 color_format);
> +		fallthrough;
> +	case MTK_DP_COLOR_FORMAT_RGB_444:
> +	case MTK_DP_COLOR_FORMAT_YUV_444:
> +		val = PIXEL_ENCODE_FORMAT_DP_ENC0_P0_RGB;
> +		break;
> +	}
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
> +			   PIXEL_ENCODE_FORMAT_DP_ENC0_P0_MASK);
> +}
> +
> +static void mtk_dp_set_color_depth(struct mtk_dp *mtk_dp,
> +				   enum mtk_dp_color_depth color_depth)
> +{
> +	u32 val;
> +
> +	mtk_dp->info.depth = color_depth;
> +
> +	// Update MISC0

ditto.

> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3034,
> +			   color_depth << DP_TEST_BIT_DEPTH_SHIFT,
> +			   DP_TEST_BIT_DEPTH_MASK);
> +
> +	switch (color_depth) {
> +	case MTK_DP_COLOR_DEPTH_6BIT:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_6BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_8BIT:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_8BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_10BIT:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_10BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_12BIT:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_16BIT:
> +		val = VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT;
> +		break;
> +	case MTK_DP_COLOR_DEPTH_UNKNOWN:
> +		drm_warn(mtk_dp->drm_dev, "Unsupported color depth %d\n",
> +			 color_depth);
> +		return;
> +	}
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_303C, val,
> +			   VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK);
> +}
> +
> +static void mtk_dp_mn_overwrite_disable(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
> +			   VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK);

also here........ and everywhere else.

> +}
> +

..snip..

> +static void mtk_dp_aux_set_length(struct mtk_dp *mtk_dp, size_t length)
> +{
> +	if (length > 0) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3650,
> +				   (length - 1)
> +					   << MCU_REQ_DATA_NUM_AUX_TX_P0_SHIFT,
> +				   MCU_REQ_DATA_NUM_AUX_TX_P0_MASK);
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C, 0,
> +				   AUX_NO_LENGTH_AUX_TX_P0_MASK |
> +					   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
> +					   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);
> +	} else {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_362C,
> +				   BIT(AUX_NO_LENGTH_AUX_TX_P0_SHIFT),
> +				   AUX_NO_LENGTH_AUX_TX_P0_MASK |
> +					   AUX_TX_AUXTX_OV_EN_AUX_TX_P0_MASK |
> +					   AUX_RESERVED_RW_0_AUX_TX_P0_MASK);

Something in this function needs an indentation fix :))

> +	}
> +}
> +
> +static int mtk_dp_aux_wait_for_completion(struct mtk_dp *mtk_dp, bool is_read)
> +{
> +	int wait_reply = MTK_DP_AUX_WAIT_REPLY_COUNT;
> +
> +	while (--wait_reply) {
> +		u32 aux_irq_status;
> +
> +		if (is_read) {
> +			u32 fifo_status =
> +				mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3618);

Fits in one line, 83 cols is ok.

> +
> +			if (fifo_status &
> +			    (AUX_RX_FIFO_WRITE_POINTER_AUX_TX_P0_MASK |
> +			     AUX_RX_FIFO_FULL_AUX_TX_P0_MASK)) {
> +				return 0;
> +			}
> +		}
> +
> +		aux_irq_status = mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3640);
> +		if (aux_irq_status & AUX_RX_RECV_COMPLETE_IRQ_TX_P0_MASK)
> +			return 0;
> +
> +		if (aux_irq_status & AUX_400US_TIMEOUT_IRQ_AUX_TX_P0_MASK)
> +			return -ETIMEDOUT;
> +

Please describe the reason for this sleep.

> +		usleep_range(100, 500);
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +

..snip..

> +
> +static void mtk_dp_initialize_aux_settings(struct mtk_dp *mtk_dp)
> +{

More C-style comments to fix, here and everywhere else.

> +	// modify timeout threshold = 1595 [12 : 8]
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_360C, 0x1595,
> +			   AUX_TIMEOUT_THR_AUX_TX_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3658, 0,
> +			   AUX_TX_OV_EN_AUX_TX_P0_MASK);
> +	// 25 for 26M
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3634,
> +			   25 << AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_SHIFT,
> +			   AUX_TX_OVER_SAMPLE_RATE_AUX_TX_P0_MASK);
> +	// 13 for 26M
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3614,
> +			   13 << AUX_RX_UI_CNT_THR_AUX_TX_P0_SHIFT,
> +			   AUX_RX_UI_CNT_THR_AUX_TX_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_37C8,
> +			   BIT(MTK_ATOP_EN_AUX_TX_P0_SHIFT),
> +			   MTK_ATOP_EN_AUX_TX_P0_MASK);
> +}
> +
> +static void mtk_dp_initialize_digital_settings(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
> +			   VBID_VIDEO_MUTE_DP_ENC0_P0_MASK);
> +	mtk_dp_set_color_format(mtk_dp, MTK_DP_COLOR_FORMAT_RGB_444);
> +	mtk_dp_set_color_depth(mtk_dp, MTK_DP_COLOR_DEPTH_8BIT);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3368,
> +			   1 << BS2BS_MODE_DP_ENC1_P0_SHIFT,
> +			   BS2BS_MODE_DP_ENC1_P0_MASK);
> +
> +	// dp tx encoder reset all sw
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004,
> +			   BIT(DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_SHIFT),
> +			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK);

Please describe the reason for this sleep.

> +	usleep_range(1000, 5000);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3004, 0,
> +			   DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0_MASK);
> +}
> +
> +static void mtk_dp_digital_sw_reset(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_340C,
> +			   BIT(DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_SHIFT),
> +			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK);

Same here.

> +	usleep_range(1000, 5000);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_340C, 0,
> +			   DP_TX_TRANSMITTER_4P_RESET_SW_DP_TRANS_P0_MASK);
> +}
> +

..snip..

> +
> +static int mtk_dp_phy_configure(struct mtk_dp *mtk_dp,
> +				enum mtk_dp_linkrate link_rate, int lane_count)
> +{
> +	int ret;
> +	union phy_configure_opts
> +		phy_opts = { .dp = {
> +				     .link_rate =
> +					link_rate_to_mb_per_s(mtk_dp, link_rate),
> +				     .set_rate = 1,
> +				     .lanes = lane_count,
> +				     .set_lanes = 1,
> +				     .ssc = mtk_dp->train_info.sink_ssc,
> +			     } };

This one looks a bit odd with this kind of style, let's do:

	union phy_configure_opts phy_opts = {

		.dp = {

			.link_rate = link_rate_to_mb_per_s(mtk_dp, link_rate),

			.set_rate = 1,

			.lanes = lane_count,

			.set_lanes = 1,

			.ssc = mtk_dp->train_info.sink_ssc,

		},

	};


> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE, DP_PWR_STATE_BANDGAP,
> +			   DP_PWR_STATE_MASK);
> +
> +	ret = phy_configure(mtk_dp->phy, &phy_opts);
> +

Does it really make sense to mtk_dp_set_cal_data(), etc, if phy_configure() fails?

> +	mtk_dp_set_cal_data(mtk_dp);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL_LANE, DP_PWR_STATE_MASK);
> +	return ret;
> +}
> +
> +static void mtk_dp_set_idle_pattern(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	const u32 val = POST_MISC_DATA_LANE0_OV_DP_TRANS_P0_MASK |
> +			POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK |
> +			POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK |
> +			POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK;
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3580, enable ? val : 0, val);
> +}
> +
> +static void mtk_dp_train_set_pattern(struct mtk_dp *mtk_dp, int pattern)
> +{
> +	if (pattern < 0 || pattern > 4) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Implementation error, no such pattern %d\n", pattern);
> +		return;

...I think that the caller should care about that failure, and do something about
it to either execute a recovery sequence, or fix this situation somehow, or just
return this to DRM.

I would say that if the link doesn't correctly execute/finish training, the output
will suffer (random corruption, permanent corruption, or simply not working link).

> +	}
> +
> +	if (pattern == 1) // TPS1
> +		mtk_dp_set_idle_pattern(mtk_dp, false);
> +
> +	mtk_dp_update_bits(mtk_dp,
> +			   MTK_DP_TRANS_P0_3400,
> +			   pattern ? BIT(pattern - 1) << PATTERN1_EN_DP_TRANS_P0_SHIFT : 0,
> +			   PATTERN1_EN_DP_TRANS_P0_MASK | PATTERN2_EN_DP_TRANS_P0_MASK |
> +			   PATTERN3_EN_DP_TRANS_P0_MASK |
> +			   PATTERN4_EN_DP_TRANS_P0_MASK);
> +}
> +

...snip...

> +
> +static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
> +{
> +	u32 sram_read_start = MTK_DP_TBC_BUF_READ_START_ADDR;

Define this variable inside of the if branch and, while at it, remove the
redundant assignment. This value is never used, as you're initializing it
right after.

> +
> +	if (mtk_dp->train_info.lane_count > 0) {
> +		sram_read_start = min_t(u32,
> +					MTK_DP_TBC_BUF_READ_START_ADDR,
> +					mtk_dp->info.timings.vm.hactive /
> +					(mtk_dp->train_info.lane_count * 4 * 2 * 2));
> +		mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
> +	}
> +
> +	mtk_dp_setup_encoder(mtk_dp);
> +}
> +

..snip..

> +
> +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> +{
> +	ssize_t ret;
> +	u8 sink_count;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +	u32 sink_count_reg;
> +	u32 link_status_reg;

Since you're initializing these immediately after - just initialize them in
the declaration instead: it's simply shorter.

If you have instead plans for varying these register offsets on a per-SoC
basis, then... same thing: we'd expect that data to be available for sure
if we reach this function, as the existance of it would be validated during
probe.

> +	bool locked;
> +
> +	sink_count_reg = DP_SINK_COUNT_ESI;
> +	link_status_reg = DP_LANE0_1_STATUS;
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, sink_count_reg, &sink_count);
> +	if (ret < 0) {
> +		drm_info(mtk_dp->drm_dev, "Read sink count failed: %ld\n", ret);

You're returning (and imo, you should return an error to the caller), yet this is
a drm_info message and not a drm_err.

"by nose", this doesn't smell right :-)

> +		return;
> +	}
> +
> +	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);

This is duplicated (and overwriting sink_count).

> +	if (ret < 0) {
> +		drm_info(mtk_dp->drm_dev,
> +			 "Read DP_SINK_COUNT_ESI failed: %ld\n", ret);
> +		return;
> +	}
> +
> +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg, link_status,
> +			       sizeof(link_status));
> +	if (!ret) {
> +		drm_info(mtk_dp->drm_dev, "Read link status failed: %ld\n",
> +			 ret);
> +		return;
> +	}
> +
> +	locked = drm_dp_channel_eq_ok(link_status,
> +				      mtk_dp->train_info.lane_count);
> +	if (!locked && mtk_dp->train_state > MTK_DP_TRAIN_STATE_TRAINING_PRE)
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +
> +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DEVICE_SERVICE_IRQ_VECTOR,
> +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> +
> +	if (DP_GET_SINK_COUNT(sink_count) &&
> +	    (link_status[2] & DP_DOWNSTREAM_PORT_STATUS_CHANGED)) {
> +		mtk_dp_edid_free(mtk_dp);
> +		mtk_dp->train_info.check_cap_count = 0;
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;

For long sleeps (20ms is very long!) it is not just nice, but *mandatory* to
provide an explaination. Please add a comment to explain why.

> +		msleep(20);
> +	}
> +}
> +

..snip..

> +static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, int target_link_rate,
> +			     int target_lane_count)
> +{
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +	u8 lane_adjust[2] = {};
> +	bool pass_tps1 = false;
> +	bool pass_tps2_3 = false;
> +	int train_retries;
> +	int status_control;
> +	int iteration_count;
> +	u8 prev_lane_adjust;
> +	u8 val;
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET, target_link_rate);
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> +			   target_lane_count | DP_LANE_COUNT_ENHANCED_FRAME_EN);
> +
> +	if (mtk_dp->train_info.sink_ssc)
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
> +				   DP_SPREAD_AMP_0_5);
> +
> +	train_retries = 0;
> +	status_control = 0;
> +	iteration_count = 1;
> +	prev_lane_adjust = 0xFF;
> +
> +	mtk_dp_set_lanes(mtk_dp, target_lane_count / 2);
> +	mtk_dp_phy_configure(mtk_dp, target_link_rate, target_lane_count);
> +
> +	dev_dbg(mtk_dp->dev,
> +		"Link train target_link_rate = 0x%x, target_lane_count = 0x%x\n",
> +		target_link_rate, target_lane_count);
> +
> +	do {
> +		train_retries++;
> +		if (!mtk_dp->train_info.cable_plugged_in ||
> +		    ((mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) !=
> +		     0x0)) {
> +			return -ENODEV;
> +		}
> +
> +		if (mtk_dp->train_state < MTK_DP_TRAIN_STATE_TRAINING)
> +			return -EAGAIN;
> +
> +		if (!pass_tps1) {
> +			mtk_dp_training_set_scramble(mtk_dp, false);
> +
> +			if (status_control == 0) {
> +				status_control = 1;
> +				mtk_dp_train_set_pattern(mtk_dp, 1);
> +				val = DP_LINK_SCRAMBLING_DISABLE |
> +				      DP_TRAINING_PATTERN_1;
> +				drm_dp_dpcd_writeb(&mtk_dp->aux,
> +						   DP_TRAINING_PATTERN_SET,
> +						   DP_LINK_SCRAMBLING_DISABLE |
> +						   DP_TRAINING_PATTERN_1);
> +				drm_dp_dpcd_read(&mtk_dp->aux,
> +						 DP_ADJUST_REQUEST_LANE0_1,
> +						 lane_adjust,
> +						 sizeof(lane_adjust));
> +				iteration_count++;
> +
> +				mtk_dp_train_update_swing_pre(mtk_dp,
> +							      target_lane_count, lane_adjust);
> +			}
> +
> +			drm_dp_link_train_clock_recovery_delay(&mtk_dp->aux,
> +							       mtk_dp->rx_cap);
> +			mtk_dp_read_link_status(mtk_dp, link_status);
> +
> +			if (drm_dp_clock_recovery_ok(link_status,
> +						     target_lane_count)) {
> +				mtk_dp->train_info.cr_done = true;
> +				pass_tps1 = true;
> +				train_retries = 0;
> +				iteration_count = 1;
> +				dev_dbg(mtk_dp->dev, "Link train CR pass\n");
> +			} else if (prev_lane_adjust == link_status[4]) {
> +				iteration_count++;
> +				if (prev_lane_adjust &
> +				    DP_ADJUST_VOLTAGE_SWING_LANE0_MASK)
> +					break;
> +			} else {
> +				prev_lane_adjust = link_status[4];
> +			}
> +			dev_dbg(mtk_dp->dev, "Link train CQ fail\n");
> +		} else if (pass_tps1 && !pass_tps2_3) {
> +			if (status_control == 1) {
> +				status_control = 2;
> +				if (mtk_dp->train_info.tps4) {
> +					mtk_dp_train_set_pattern(mtk_dp, 4);
> +					val = DP_TRAINING_PATTERN_4;
> +				} else if (mtk_dp->train_info.tps3) {
> +					mtk_dp_train_set_pattern(mtk_dp, 3);
> +					val = DP_LINK_SCRAMBLING_DISABLE |
> +					      DP_TRAINING_PATTERN_3;
> +				} else {
> +					mtk_dp_train_set_pattern(mtk_dp, 2);
> +					val = DP_LINK_SCRAMBLING_DISABLE |
> +					      DP_TRAINING_PATTERN_2;
> +				}
> +				drm_dp_dpcd_writeb(&mtk_dp->aux,
> +						   DP_TRAINING_PATTERN_SET,
> +						   val);
> +
> +				drm_dp_dpcd_read(&mtk_dp->aux,
> +						 DP_ADJUST_REQUEST_LANE0_1,
> +						 lane_adjust,
> +						 sizeof(lane_adjust));
> +
> +				iteration_count++;
> +				mtk_dp_train_update_swing_pre(mtk_dp,
> +							      target_lane_count, lane_adjust);
> +			}
> +
> +			drm_dp_link_train_channel_eq_delay(&mtk_dp->aux,
> +							   mtk_dp->rx_cap);
> +
> +			mtk_dp_read_link_status(mtk_dp, link_status);
> +
> +			if (!drm_dp_clock_recovery_ok(link_status,
> +						      target_lane_count)) {
> +				mtk_dp->train_info.cr_done = false;
> +				mtk_dp->train_info.eq_done = false;
> +				dev_dbg(mtk_dp->dev, "Link train EQ fail\n");
> +				break;
> +			}
> +
> +			if (drm_dp_channel_eq_ok(link_status,
> +						 target_lane_count)) {
> +				mtk_dp->train_info.eq_done = true;
> +				pass_tps2_3 = true;
> +				dev_dbg(mtk_dp->dev, "Link train EQ pass\n");
> +				break;
> +			}
> +
> +			if (prev_lane_adjust == link_status[4])
> +				iteration_count++;
> +			else
> +				prev_lane_adjust = link_status[4];
> +		}
> +
> +		drm_dp_dpcd_read(&mtk_dp->aux, DP_ADJUST_REQUEST_LANE0_1,
> +				 lane_adjust, sizeof(lane_adjust));
> +		mtk_dp_train_update_swing_pre(mtk_dp, target_lane_count,
> +					      lane_adjust);
> +	} while (train_retries < MTK_DP_TRAIN_RETRY_LIMIT &&
> +		 iteration_count < MTK_DP_TRAIN_MAX_ITERATIONS);
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
> +			   DP_TRAINING_PATTERN_DISABLE);
> +	mtk_dp_train_set_pattern(mtk_dp, 0);
> +

I would do instead:

	if (!pass_tps2_3)
		return -ETIMEDOUT;

	mtk_dp->train_info.link_....blah

	return 0;
}

> +	if (pass_tps2_3) {
> +		mtk_dp->train_info.link_rate = target_link_rate;
> +		mtk_dp->train_info.lane_count = target_lane_count;
> +
> +		mtk_dp_training_set_scramble(mtk_dp, true);
> +
> +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> +				   target_lane_count |
> +					   DP_LANE_COUNT_ENHANCED_FRAME_EN);
> +		mtk_dp_set_enhanced_frame_mode(mtk_dp, true);
> +
> +		return 0;
> +	}
> +
> +	return -ETIMEDOUT;
> +}
> +

..snip..

> +
> +static int mtk_dp_train_start(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +	int lane_count;
> +	int link_rate;
> +	int train_limit;
> +	int max_link_rate;
> +	int plug_wait;
> +
> +	for (plug_wait = 7; !mtk_dp_plug_state(mtk_dp) && plug_wait > 0;
> +	     --plug_wait)
> +		usleep_range(1000, 5000);
> +	if (plug_wait == 0) {
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
> +		return -ENODEV;
> +	}
> +
> +	link_rate = mtk_dp->rx_cap[1];
> +	lane_count = mtk_dp->rx_cap[2] & 0x1F;
> +
> +	mtk_dp->train_info.link_rate = min(MTK_DP_MAX_LINK_RATE, link_rate);
> +	mtk_dp->train_info.lane_count = min(MTK_DP_MAX_LANES, lane_count);
> +	link_rate = mtk_dp->train_info.link_rate;
> +	lane_count = mtk_dp->train_info.lane_count;
> +
> +	switch (link_rate) {
> +	case MTK_DP_LINKRATE_RBR:
> +	case MTK_DP_LINKRATE_HBR:
> +	case MTK_DP_LINKRATE_HBR2:
> +	case MTK_DP_LINKRATE_HBR25:
> +	case MTK_DP_LINKRATE_HBR3:
> +		break;
> +	default:
> +		mtk_dp->train_info.link_rate = MTK_DP_LINKRATE_HBR3;
> +		break;
> +	};
> +
> +	max_link_rate = link_rate;
> +	for (train_limit = 0; train_limit <= 6; ++train_limit) {

I would say that train_limit should be 6, and you should decrement instead.

	for (train_limit = 6; train_limit > 0; train_limit--) {

> +		mtk_dp->train_info.cr_done = false;
> +		mtk_dp->train_info.eq_done = false;
> +
> +		mtk_dp_train_change_mode(mtk_dp);
> +		ret = mtk_dp_train_flow(mtk_dp, link_rate, lane_count);
> +		if (ret == -ENODEV || ret == -EAGAIN)

This function returns 0 for success, negative number for error; so, it is
sufficient here to simply check

		if (ret)

> +			return ret;
> +
> +		if (!mtk_dp->train_info.cr_done) {
> +			switch (link_rate) {
> +			case MTK_DP_LINKRATE_RBR:
> +				lane_count = lane_count / 2;
> +				link_rate = max_link_rate;
> +				if (lane_count == 0x0) {

				if (lane_count == 0) {

> +					mtk_dp->train_state =
> +						MTK_DP_TRAIN_STATE_DPIDLE;
> +					return -EIO;
> +				}
> +				break;
> +			case MTK_DP_LINKRATE_HBR:
> +				link_rate = MTK_DP_LINKRATE_RBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR2:
> +				link_rate = MTK_DP_LINKRATE_HBR;
> +				break;
> +			case MTK_DP_LINKRATE_HBR3:
> +				link_rate = MTK_DP_LINKRATE_HBR2;
> +				break;
> +			default:
> +				return -EINVAL;
> +			};
> +		} else if (!mtk_dp->train_info.eq_done) {
> +			lane_count /= 2;
> +			if (lane_count == 0)
> +				return -EIO;

Please reorder the following as such:

			if (lane_count == 0)
				return -EIO;
			lane_count /= 2;

Obviously, 0 divided by anything is still zero.

> +		} else {

I would do:
			break;

> +			return 0;
> +		}
> +	}

	if (train_limit == 0)
		return -ETIMEDOUT;

	return 0;
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static void mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +	int i = 50;
> +
> +	do {

This is a for loop, masked as a while loop... so please use a for loop.

> +		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +			continue;
> +
> +		switch (mtk_dp->train_state) {
> +		case MTK_DP_TRAIN_STATE_STARTUP:
> +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKCAP:
> +			if (mtk_dp_parse_capabilities(mtk_dp)) {
> +				mtk_dp->train_info.check_cap_count = 0;
> +				mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;
> +			} else {
> +				mtk_dp->train_info.check_cap_count++;
> +
> +				if (mtk_dp->train_info.check_cap_count >
> +					MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT) {
> +					mtk_dp->train_info.check_cap_count = 0;
> +					mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
> +					ret = -ETIMEDOUT;
> +				}
> +			}
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKEDID:
> +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING_PRE:
> +			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING:
> +			ret = mtk_dp_train_start(mtk_dp);
> +			if (!ret) {
> +				mtk_dp_video_mute(mtk_dp, true);
> +				mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;
> +				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
> +			} else if (ret != -EAGAIN) {
> +				mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;
> +			}
> +
> +			ret = 0;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_NORMAL:
> +			break;
> +		case MTK_DP_TRAIN_STATE_DPIDLE:
> +			break;
> +		default:
> +			break;
> +		}
> +	} while (ret && i--);
> +
> +	if (ret)
> +		drm_err(mtk_dp->drm_dev, "Train handler failed %d\n", ret);

You should return an error.

> +}
> +

..snip..

> +static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	int event;
> +	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> +
> +	event = mtk_dp_plug_state(mtk_dp) ? connector_status_connected :
> +						  connector_status_disconnected;
> +
> +	if (event < 0)
> +		return IRQ_HANDLED;
> +
> +	if (mtk_dp->drm_dev) {
> +		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");

This is a debugging message: dev_dbg() here.

> +		drm_helper_hpd_irq_event(mtk_dp->bridge.dev);
> +	}
> +
> +	if (mtk_dp->train_info.cable_state_change) {
> +		mtk_dp->train_info.cable_state_change = false;
> +
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
> +
> +		if (!mtk_dp->train_info.cable_plugged_in ||
> +		    !mtk_dp_plug_state(mtk_dp)) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
> +			if (mtk_dp->has_fec)
> +				mtk_dp_fec_enable(mtk_dp, false);
> +
> +			mtk_dp_edid_free(mtk_dp);
> +			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL,
> +					   DP_PWR_STATE_MASK);
> +		} else {
> +			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +					   DP_PWR_STATE_MASK);
> +			drm_dp_read_dpcd_caps(&mtk_dp->aux, buf);
> +			mtk_dp->train_info.link_rate =
> +				min_t(int, MTK_DP_MAX_LINK_RATE,
> +				      buf[DP_MAX_LINK_RATE]);
> +			mtk_dp->train_info.lane_count =
> +				min_t(int, MTK_DP_MAX_LANES,
> +				      drm_dp_max_lane_count(buf));
> +		}
> +	}
> +
> +	if (mtk_dp->train_info.irq_status & MTK_DP_HPD_INTERRUPT) {
> +		dev_info(mtk_dp->dev, "MTK_DP_HPD_INTERRUPT\n");

dev_dbg()

> +		mtk_dp->train_info.irq_status &= ~MTK_DP_HPD_INTERRUPT;
> +		mtk_dp_hpd_sink_event(mtk_dp);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
> +{
> +	bool connected;
> +	u16 swirq_status = mtk_dp_swirq_get_clear(mtk_dp);
> +	u8 hwirq_status = mtk_dp_hwirq_get_clear(mtk_dp);
> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	train_info->irq_status |= hwirq_status | swirq_status;
> +
> +	if (!train_info->irq_status)
> +		return IRQ_HANDLED;
> +
> +	connected = mtk_dp_plug_state(mtk_dp);
> +	if (connected || !train_info->cable_plugged_in)
> +		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
> +	else if (!connected || train_info->cable_plugged_in)
> +		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
> +
> +	if (!(train_info->irq_status &
> +	      (MTK_DP_HPD_CONNECT | MTK_DP_HPD_DISCONNECT)))
> +		return IRQ_HANDLED;
> +
> +	if (train_info->irq_status & MTK_DP_HPD_CONNECT) {
> +		train_info->irq_status &= ~MTK_DP_HPD_CONNECT;
> +		train_info->cable_plugged_in = true;
> +	} else {
> +		train_info->irq_status &= ~MTK_DP_HPD_DISCONNECT;
> +		train_info->cable_plugged_in = false;
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
> +	}
> +	train_info->cable_state_change = true;
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	u32 irq_status;
> +
> +	irq_status = mtk_dp_read(mtk_dp, MTK_DP_TOP_IRQ_STATUS);
> +
> +	if (!irq_status)
> +		return IRQ_HANDLED;
> +
> +	if (irq_status & RGS_IRQ_STATUS_TRANSMITTER)
> +		return mtk_dp_hpd_isr_handler(mtk_dp);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
> +			   struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;
> +	void __iomem *base;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	mtk_dp->regs = devm_regmap_init_mmio(dev, base, &mtk_dp_regmap_config);
> +	if (IS_ERR(mtk_dp->regs))
> +		return PTR_ERR(mtk_dp->regs);
> +
> +	mtk_dp->dp_tx_clk = devm_clk_get(dev, "faxi");
> +	if (IS_ERR(mtk_dp->dp_tx_clk)) {
> +		ret = PTR_ERR(mtk_dp->dp_tx_clk);
> +		dev_info(dev, "Failed to get dptx clock: %d\n", ret);

Is this an optional clock? If so, devm_clk_get_optional(), otherwise, please
return an error.

In either case, the print would be dev_err().

> +		mtk_dp->dp_tx_clk = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> +{
> +	return connector_status_connected;
> +}
> +
> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> +				    struct drm_connector *connector)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	bool enabled = mtk_dp->enabled;
> +	struct edid *new_edid = NULL;
> +
> +	if (!enabled)
> +		drm_bridge_chain_pre_enable(bridge);
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D0);
> +	usleep_range(2000, 5000);
> +
> +	if (mtk_dp_plug_state(mtk_dp))
> +		new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
> +
> +	if (!enabled)
> +		drm_bridge_chain_post_disable(bridge);
> +
> +	mutex_lock(&mtk_dp->edid_lock);
> +	kfree(mtk_dp->edid);
> +	mtk_dp->edid = NULL;
> +
> +	if (!new_edid) {
> +		mutex_unlock(&mtk_dp->edid_lock);
> +		return NULL;
> +	}
> +
> +	mtk_dp->edid = drm_edid_duplicate(new_edid);
> +	mutex_unlock(&mtk_dp->edid_lock);
> +
> +	return new_edid;
> +}
> +
> +static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
> +				   struct drm_dp_aux_msg *msg)
> +{
> +	ssize_t err = -EAGAIN;
> +	struct mtk_dp *mtk_dp;
> +	bool is_read;
> +	u8 request;
> +	size_t accessed_bytes = 0;
> +	int retry = 3, ret = 0;
> +
> +	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
> +
> +	if (!mtk_dp->train_info.cable_plugged_in ||
> +	    mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) {
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
> +		err = -EAGAIN;
> +		goto err;
> +	}
> +
> +	switch (msg->request) {
> +	case DP_AUX_I2C_MOT:
> +	case DP_AUX_I2C_WRITE:
> +	case DP_AUX_NATIVE_WRITE:
> +	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
> +	case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
> +		request = msg->request & ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
> +		is_read = false;
> +		break;
> +	case DP_AUX_I2C_READ:
> +	case DP_AUX_NATIVE_READ:
> +	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
> +		request = msg->request;
> +		is_read = true;
> +		break;
> +	default:
> +		drm_err(mtk_aux->drm_dev, "invalid aux cmd = %d\n",
> +			msg->request);
> +		err = -EINVAL;
> +		goto err;
> +	}
> +
> +	if (msg->size == 0) {
> +		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> +					     msg->address + accessed_bytes,
> +					     msg->buffer + accessed_bytes, 0);
> +		}

Have you tried to build this driver before submitting it?!
I say that this won't compile.

> +	} else {
> +		while (accessed_bytes < msg->size) {
> +			size_t to_access =
> +				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
> +				      msg->size - accessed_bytes);
> +			while (retry--) {
> +				ret = mtk_dp_aux_do_transfer(mtk_dp,
> +							     is_read, request,
> +							     msg->address + accessed_bytes,
> +							     msg->buffer + accessed_bytes,
> +							     to_access);
> +				if (ret == 0)
> +					break;
> +				usleep_range(50, 100);
> +			}
> +			if (!retry && ret) {

This should be:
			if (!retry || ret) {
				drm_err(.....

> +				drm_info(mtk_dp->drm_dev,
> +					 "Failed to do AUX transfer: %d\n",
> +					 ret);
> +				break;
> +			}
> +			accessed_bytes += to_access;
> +		}
> +	}
> +err:
> +	if (ret) {
> +		msg->reply = DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
> +		return err;
> +	}
> +
> +	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
> +	return msg->size;
> +}
> +
> +static void mtk_dp_aux_init(struct mtk_dp *mtk_dp)
> +{

I don't see any advantage in putting these three lines in a helper,
called just once.

> +	drm_dp_aux_init(&mtk_dp->aux);
> +	mtk_dp->aux.name = "aux_mtk_dp";
> +	mtk_dp->aux.transfer = mtk_dp_aux_transfer;
> +}
> +
> +static void mtk_dp_poweroff(struct mtk_dp *mtk_dp)
> +{
> +	mutex_lock(&mtk_dp->dp_lock);
> +
> +	mtk_dp_hwirq_enable(mtk_dp, false);
> +	mtk_dp_power_disable(mtk_dp);
> +	phy_exit(mtk_dp->phy);
> +	clk_disable_unprepare(mtk_dp->dp_tx_clk);
> +
> +	mutex_unlock(&mtk_dp->dp_lock);
> +}
> +
> +static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&mtk_dp->dp_lock);
> +
> +	ret = clk_prepare_enable(mtk_dp->dp_tx_clk);
> +	if (ret < 0) {
> +		dev_err(mtk_dp->dev, "Fail to enable clock: %d\n", ret);
> +		goto err;
> +	}
> +	ret = phy_init(mtk_dp->phy);
> +	if (ret) {
> +		dev_err(mtk_dp->dev, "Failed to initialize phy: %d\n", ret);
> +		goto err_phy_init;
> +	}
> +	ret = mtk_dp_phy_configure(mtk_dp, MTK_DP_LINKRATE_RBR, 1);
> +	if (ret) {
> +		dev_err(mtk_dp->dev, "Failed to configure phy: %d\n", ret);
> +		goto err_phy_config;
> +	}
> +
> +	mtk_dp_init_port(mtk_dp);
> +	mtk_dp_power_enable(mtk_dp);
> +	mtk_dp_hwirq_enable(mtk_dp, true);
> +
> +err_phy_config:
> +	phy_exit(mtk_dp->phy);
> +err_phy_init:
> +	clk_disable_unprepare(mtk_dp->dp_tx_clk);
> +err:
> +	mutex_unlock(&mtk_dp->dp_lock);
> +	return ret;
> +}
> +
> +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> +				enum drm_bridge_attach_flags flags)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	int ret;
> +
> +	ret = mtk_dp_poweron(mtk_dp);
> +	if (ret)
> +		return ret;
> +
> +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> +		dev_err(mtk_dp->dev, "Driver does not provide a connector!");
> +		return -EINVAL;
> +	}
> +
> +	if (mtk_dp->next_bridge) {
> +		ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
> +					&mtk_dp->bridge, flags);
> +		if (ret) {
> +			drm_warn(mtk_dp->drm_dev,
> +				 "Failed to attach external bridge: %d\n", ret);
> +			goto err_bridge_attach;

You are simply returning ret on your "err_bridge_attach" label, so you can as
well remove the label and simply `return ret` here.

> +		}
> +	}
> +
> +	mtk_dp->drm_dev = bridge->dev;
> +
> +	return 0;
> +
> +err_bridge_attach:
> +	return ret;
> +}
> +
> +static void mtk_dp_bridge_detach(struct drm_bridge *bridge)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +
> +	mtk_dp->drm_dev = NULL;
> +}
> +
> +static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_state)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +
> +	mtk_dp_video_mute(mtk_dp, true);
> +	mtk_dp->state = MTK_DP_STATE_IDLE;
> +	mtk_dp->train_state = MTK_DP_TRAIN_STATE_STARTUP;
> +
> +	mtk_dp->enabled = false;

Big sleeps mandate a comment to explain why.

> +	msleep(100);
> +	mtk_dp_poweroff(mtk_dp);
> +}
> +

..snip..

> +
> +static enum drm_mode_status
> +mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
> +			 const struct drm_display_info *info,
> +			 const struct drm_display_mode *mode)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	u32 rx_linkrate;
> +	u32 bpp;
> +
> +	bpp = info->color_formats & DRM_COLOR_FORMAT_YCRCB422 ? 16 : 24;

	rx_linkrate = (u32)mtk_dp->train_info.link_rate;

	/* The link rate selector is in steps of 0.27Gbps */
	rx_linkrate *= 27000;

	/* Finally, multiply by number of lanes to get the current (bw) rate */
	rx_linkrate *= mtk_dp->train_info.lane_count;

	if ((mode->clock > 600000) ||
	    (rx_linkrate < (mode->clock * bpp) / 8) ||
	    ((mode->clock * 1000) / (mode->htotal * mode->vtotal) > 62))
		return MODE_CLOCK_HIGH;

	return MODE_OK;

Besides, what's that 62? Looks like a magic number that comes out of the nowhere.
Please explain that with a comment in the code.

> +	rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
> +	if (rx_linkrate * mtk_dp->train_info.lane_count < mode->clock * bpp / 8)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (mode->clock > 600000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if ((mode->clock * 1000) / (mode->htotal * mode->vtotal) > 62)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static u32 *mtk_dp_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +						     struct drm_bridge_state *bridge_state,
> +						     struct drm_crtc_state *crtc_state,
> +						     struct drm_connector_state *conn_state,
> +						     unsigned int *num_output_fmts)
> +{
> +	u32 *output_fmts;
> +
> +	*num_output_fmts = 0;
> +	output_fmts = kcalloc(1, sizeof(*output_fmts), GFP_KERNEL);

A stack allocation looks more appropriate...

.....and easier, as well, here: if you did that,
you would've also avoided a comment reminding you that you're
initializing the only member of the array right after an allocation that
sets the memory to zero, which would be unnecessary in this case :-P

P.S.: Just stack allocate it... :-)

> +	if (!output_fmts)
> +		return NULL;
> +	*num_output_fmts = 1;
> +	output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +	return output_fmts;
> +}
> +
> +static const u32 mt8195_input_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_YUV8_1X24,
> +	MEDIA_BUS_FMT_YUYV8_1X16,
> +};
> +
> +static u32 *mtk_dp_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +						    struct drm_bridge_state *bridge_state,
> +						    struct drm_crtc_state *crtc_state,
> +						    struct drm_connector_state *conn_state,
> +						    u32 output_fmt,
> +						    unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	struct drm_display_info *display_info =
> +		&conn_state->connector->display_info;
> +	u32 rx_linkrate;
> +	u32 bpp;
> +
> +	bpp = (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB422) ? 16 :
> +										24;

Why is this '24' on a new line?
Please fix.

> +	rx_linkrate = (u32)mtk_dp->train_info.link_rate * 27000;
> +	*num_input_fmts = 0;
> +	input_fmts = kcalloc(ARRAY_SIZE(mt8195_input_fmts), sizeof(*input_fmts),
> +			     GFP_KERNEL);

You're copying the entire mt8195_input_fmts in here, so a kmalloc is fine.

> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = ARRAY_SIZE(mt8195_input_fmts);
> +
> +	memcpy(input_fmts, mt8195_input_fmts,
> +	       sizeof(*input_fmts) * ARRAY_SIZE(mt8195_input_fmts));
> +
> +	if (((rx_linkrate * mtk_dp->train_info.lane_count) <
> +	     (mode->clock * 24 / 8)) &&
> +	    ((rx_linkrate * mtk_dp->train_info.lane_count) >
> +	     (mode->clock * 16 / 8)) &&
> +	    (display_info->color_formats & DRM_COLOR_FORMAT_YCRCB422)) {
> +		kfree(input_fmts);
> +		input_fmts = kcalloc(1, sizeof(*input_fmts), GFP_KERNEL);
> +		*num_input_fmts = 1;
> +		input_fmts[0] = MEDIA_BUS_FMT_YUYV8_1X16;
> +	}
> +
> +	return input_fmts;
> +}
> +
> +static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	unsigned int input_bus_format;
> +
> +	input_bus_format = bridge_state->input_bus_cfg.format;
> +
> +	dev_info(mtk_dp->dev, "input format 0x%04x, output format 0x%04x\n",

dev_dbg() here, please.

> +		 bridge_state->input_bus_cfg.format,
> +		 bridge_state->output_bus_cfg.format);
> +
> +	mtk_dp->input_fmt = input_bus_format;
> +	if (mtk_dp->input_fmt == MEDIA_BUS_FMT_YUYV8_1X16)
> +		mtk_dp->info.format = MTK_DP_COLOR_FORMAT_YUV_422;
> +	else
> +		mtk_dp->info.format = MTK_DP_COLOR_FORMAT_RGB_444;
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> +	.atomic_check = mtk_dp_bridge_atomic_check,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_output_bus_fmts = mtk_dp_bridge_atomic_get_output_bus_fmts,
> +	.atomic_get_input_bus_fmts = mtk_dp_bridge_atomic_get_input_bus_fmts,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.attach = mtk_dp_bridge_attach,
> +	.detach = mtk_dp_bridge_detach,
> +	.atomic_enable = mtk_dp_bridge_atomic_enable,
> +	.atomic_disable = mtk_dp_bridge_atomic_disable,
> +	.mode_valid = mtk_dp_bridge_mode_valid,
> +	.get_edid = mtk_dp_get_edid,
> +	.detect = mtk_dp_bdg_detect,
> +};
> +
> +static int mtk_dp_probe(struct platform_device *pdev)
> +{
> +	struct mtk_dp *mtk_dp;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	int irq_num = 0;
> +
> +	mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
> +	if (!mtk_dp)
> +		return -ENOMEM;
> +
> +	mtk_dp->dev = dev;
> +
> +	irq_num = platform_get_irq(pdev, 0);

	if (irq_num < 0)
		return dev_err_probe(dev, irq_num, "failed to...blah");

> +	if (irq_num < 0) {
> +		dev_err(dev, "failed to request dp irq resource\n");
> +		return irq_num;
> +	}
> +
> +	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);

	if (IS_ERR(mtk_dp->next_bridge))
		return dev_err_probe(dev, PTR_ERR(mtk_dp->next_bridge),
				     "Failed to get bridge\n");

> +	if (IS_ERR(mtk_dp->next_bridge)) {
> +		ret = PTR_ERR(mtk_dp->next_bridge);
> +		dev_err_probe(dev, ret, "Failed to get bridge\n");
> +		return ret;
> +	}
> +
> +	ret = mtk_dp_dt_parse(mtk_dp, pdev);
> +	if (ret)
> +		return ret;
> +
> +	mtk_dp_aux_init(mtk_dp);
> +
> +	ret = devm_request_threaded_irq(dev, irq_num, mtk_dp_hpd_event,
> +					mtk_dp_hpd_event_thread,
> +					IRQ_TYPE_LEVEL_HIGH, dev_name(dev),
> +					mtk_dp);
> +	if (ret) {
> +		dev_err(dev, "failed to request mediatek dptx irq\n");

dev_err_probe() here and everywhere else.

> +		return -EPROBE_DEFER;
> +	}
> +
> +	mutex_init(&mtk_dp->dp_lock);
> +	mutex_init(&mtk_dp->edid_lock);
> +
> +	platform_set_drvdata(pdev, mtk_dp);
> +
> +	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
> +							PLATFORM_DEVID_AUTO,
> +							&mtk_dp->regs,
> +							sizeof(struct regmap *));
> +	if (IS_ERR(mtk_dp->phy_dev)) {
> +		dev_err(dev, "Failed to create device mediatek-dp-phy: %ld\n",
> +			PTR_ERR(mtk_dp->phy_dev));
> +		return PTR_ERR(mtk_dp->phy_dev);
> +	}

You won't need to do that if you follow my advice about using device-tree to
register mediatek-dp-phy...

> +
> +	mtk_dp_get_calibration_data(mtk_dp);
> +
> +	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> +	if (IS_ERR(mtk_dp->phy)) {
> +		dev_err(dev, "Failed to get phy: %ld\n", PTR_ERR(mtk_dp->phy));
> +		platform_device_unregister(mtk_dp->phy_dev);

... and you will be able to use dev_err_probe here as well.

> +		return PTR_ERR(mtk_dp->phy);
> +	}
> +
> +	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
> +	mtk_dp->bridge.of_node = dev->of_node;
> +	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_eDP;
> +
> +	mtk_dp->bridge.ops =
> +		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> +	drm_bridge_add(&mtk_dp->bridge);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	return 0;
> +}
> +

...snip...

> +
> +static const struct of_device_id mtk_dp_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt8195-edp-tx",
> +	},

This fits on a single line:
	{ .compatible = "mediatek,mt8195-edp-tx" },

> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> +
> +struct platform_driver mtk_dp_driver = {
> +	.probe = mtk_dp_probe,
> +	.remove = mtk_dp_remove,
> +	.driver = {
> +		.name = "mediatek-drm-dp",
> +		.of_match_table = mtk_dp_of_match,
> +		.pm = &mtk_dp_pm_ops,
> +	},
> +};
> +
> +MODULE_AUTHOR("Jason-JH.Lin <jason-jh.lin@mediatek.com>");
> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> +MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> new file mode 100644
> index 0000000000000..79952ac30e9e6
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -0,0 +1,568 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + * Copyright (c) 2021 BayLibre
> + */
> +#ifndef _MTK_DP_REG_H_
> +#define _MTK_DP_REG_H_
> +
> +#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
> +#define MTK_DP_SIP_ATF_VIDEO_UNMUTE 0x20
> +#define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE 0x21
> +
> +#define DP_PHY_GLB_BIAS_GEN_00 0x0000

This is just zero, but being a register offset definition, it's fine
if you write it as 0x0.

> +#define RG_XTP_GLB_BIAS_INTR_CTRL (0x1f << 16)

This is GENMASK(20, 16)
... and also please use GENMASK() for all of the others.

> +
> +#define DP_PHY_GLB_DPAUX_TX 0x0008

This is 0x8

> +#define RG_CKM_PT0_CKTX_IMPSEL (0xf << 20)
> +

..snip..

> +#define MTK_DP_ENC0_P0_3000 (ENC0_OFFSET + 0x000)
> +#define LANE_NUM_DP_ENC0_P0_MASK 0x3
> +#define VIDEO_MUTE_SW_DP_ENC0_P0_MASK 0x4
> +#define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT 2

At least some of these *_SHIFT definitions are, in reality, register bits that
are used to enable/disable something...
In these cases, remove _SHIFT and directly define them as BIT(x).

Also, please, for all the _MASK you should be using GENMASK().

Example for this one:

#define VIDEO_MUTE_SW_DP_ENC0_P0	BIT(2)

> +#define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK 0x8
> +#define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT 3
> +#define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK 0x10
> +#define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT 4

..snip..

> +#define MTK_DP_ENC0_P0_303C (ENC0_OFFSET + 0x03C)
> +#define SRAM_START_READ_THRD_DP_ENC0_P0_MASK 0x3f
> +#define SRAM_START_READ_THRD_DP_ENC0_P0_SHIFT 0
> +#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_MASK 0x700
> +#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT 8
> +#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_16BIT                                     \
> +	(0 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)

This (and not only) fits in one line... but also, 0 shifted by a million bits is
still zero, so this is just zero.

> +#define VIDEO_COLOR_DEPTH_DP_ENC0_P0_12BIT                                     \
> +	(1 << VIDEO_COLOR_DEPTH_DP_ENC0_P0_SHIFT)

..snip..

> +#define MTK_DP_AUX_P0_3704 (AUX_OFFSET + 0x104)
> +#define AUX_TX_FIFO_WRITE_DATA_NEW_MODE_TOGGLE_AUX_TX_P0_MASK 0x2
> +#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_MASK 0x4
> +#define AUX_TX_FIFO_NEW_MODE_EN_AUX_TX_P0_SHIFT 2
> +
> +#define MTK_DP_AUX_P0_3708 (AUX_OFFSET + 0x108)
> +
> +#define MTK_DP_AUX_P0_37C8 (AUX_OFFSET + 0x1C8)

Please, lower case hex.

> +#define MTK_ATOP_EN_AUX_TX_P0_MASK 0x1
> +#define MTK_ATOP_EN_AUX_TX_P0_SHIFT 0
> +

Regards,
Angelo
