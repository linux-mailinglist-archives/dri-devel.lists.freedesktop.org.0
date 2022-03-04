Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC394CCBE3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 03:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC2D10E2E2;
	Fri,  4 Mar 2022 02:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1F810E2E2
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 02:43:02 +0000 (UTC)
X-UUID: ddcd53243d804e7dac19bd61d4c6cad4-20220304
X-UUID: ddcd53243d804e7dac19bd61d4c6cad4-20220304
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1831687328; Fri, 04 Mar 2022 10:42:55 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 10:42:53 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 10:42:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Mar 2022 10:42:53 +0800
Message-ID: <5c86954704df2c4e71cca2ce10c35641b65c78f1.camel@mediatek.com>
Subject: Re: [PATCH v8 15/19] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <chunfeng.yun@mediatek.com>, <kishon@ti.com>, <vkoul@kernel.org>,
 <deller@gmx.de>, <jitao.shi@mediatek.com>,
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 4 Mar 2022 10:42:53 +0800
In-Reply-To: <20220218145437.18563-16-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-16-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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

Hi, Guillaume:

On Fri, 2022-02-18 at 15:54 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the embedded DisplayPort units. It offers
> hot-plug-detection and DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig       |    7 +
>  drivers/gpu/drm/mediatek/Makefile      |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c      | 2358
> ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>  6 files changed, 2937 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 
> 

[snip]

> +
> +struct mtk_dp_train_info {
> +	bool tps3;
> +	bool tps4;
> +	bool sink_ssc;
> +	bool cable_plugged_in;

Move to external display port patch.

> +	bool cable_state_change;

Move to external display port patch.

> +	bool cr_done;
> +	bool eq_done;
> +
> +	// link_rate is in multiple of 0.27Gbps
> +	int link_rate;
> +	int lane_count;
> +
> +	int irq_status;

Move to external display port patch.

> +	int check_cap_count;
> +};
> +
> 

[snip]

> +
> +// Same values as used for DP Spec MISC0 bits 5,6,7
> +enum mtk_dp_color_depth {
> +	MTK_DP_COLOR_DEPTH_6BIT = 0,
> +	MTK_DP_COLOR_DEPTH_8BIT = 1,

Only 8bits is used, so drop other definition.

> +	MTK_DP_COLOR_DEPTH_10BIT = 2,
> +	MTK_DP_COLOR_DEPTH_12BIT = 3,
> +	MTK_DP_COLOR_DEPTH_16BIT = 4,
> +	MTK_DP_COLOR_DEPTH_UNKNOWN = 5,
> +};
> +
> 

[snip]

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
> +	/* Protects edid as it is used in both bridge ops and IRQ
> handler */
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

Move this to dp audio patch.

> +	struct drm_connector *conn;
> +};
> +
> 

[snip]

> +
> +static void mtk_dp_set_color_format(struct mtk_dp *mtk_dp,
> +				    enum mtk_dp_color_format
> color_format)
> +{
> +	u32 val;
> +
> +	mtk_dp->info.format = color_format;

When call into this function from mtk_dp_video_config(), it calls

mtk_dp_set_color_format(mtk_dp, mtk_dp->info.format);

It looks weird that you pass mtk_dp->info.format into this function and
set it to it. So I would like this function to be pure register
setting, and move this variable keeping out of this function.


> +
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
> +		drm_warn(mtk_dp->drm_dev, "Unsupported color format:
> %d\n",
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
> 

[snip]

> +
> +static void mtk_dp_pg_disable(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3038, 0,
> +			   VIDEO_SOURCE_SEL_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31B0,
> +			   4 << PGEN_PATTERN_SEL_SHIFT,
> PGEN_PATTERN_SEL_MASK);
> +}
> +
> +static bool mtk_dp_plug_state(struct mtk_dp *mtk_dp)

Move this function to external dp patch.

> +{
> +	return !!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
> +		  HPD_DB_DP_TRANS_P0_MASK);
> +}
> +
> 

[snip]

> +
> +static void mtk_dp_train_set_pattern(struct mtk_dp *mtk_dp, int
> pattern)
> +{
> +	if (pattern < 0 || pattern > 4) {

Never happen, remove this checking.

> +		drm_err(mtk_dp->drm_dev,
> +			"Implementation error, no such pattern %d\n",
> pattern);
> +		return;
> +	}
> +
> +	if (pattern == 1) // TPS1
> +		mtk_dp_set_idle_pattern(mtk_dp, false);
> +
> +	mtk_dp_update_bits(mtk_dp,
> +			   MTK_DP_TRANS_P0_3400,
> +			   pattern ? BIT(pattern - 1) <<
> PATTERN1_EN_DP_TRANS_P0_SHIFT : 0,
> +			   PATTERN1_EN_DP_TRANS_P0_MASK |
> PATTERN2_EN_DP_TRANS_P0_MASK |
> +			   PATTERN3_EN_DP_TRANS_P0_MASK |
> +			   PATTERN4_EN_DP_TRANS_P0_MASK);
> +}
> +
> 

[snip]

> +
> +static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
> +{
> +	u32 sram_read_start = MTK_DP_TBC_BUF_READ_START_ADDR;

It's not necessary to have a initial value.

> +
> +	if (mtk_dp->train_info.lane_count > 0) {
> +		sram_read_start = min_t(u32,
> +					MTK_DP_TBC_BUF_READ_START_ADDR,
> +					mtk_dp->info.timings.vm.hactive 
> /
> +					(mtk_dp->train_info.lane_count
> * 4 * 2 * 2));
> +		mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
> +	}
> +
> +	mtk_dp_setup_encoder(mtk_dp);
> +}
> +
> 

[snip]

> +static void mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +	int i = 50;
> +
> +	do {
> +		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +			continue;
> +
> +		switch (mtk_dp->train_state) {
> +		case MTK_DP_TRAIN_STATE_STARTUP:
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_CHECKCAP;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKCAP:
> +			if (mtk_dp_parse_capabilities(mtk_dp)) {
> +				mtk_dp->train_info.check_cap_count = 0;
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_CHECKEDID;
> +			} else {
> +				mtk_dp->train_info.check_cap_count++;
> +
> +				if (mtk_dp->train_info.check_cap_count
> >
> +					MTK_DP_CHECK_SINK_CAP_TIMEOUT_C
> OUNT) {
> +					mtk_dp-
> >train_info.check_cap_count = 0;
> +					mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_DPIDLE;
> +					ret = -ETIMEDOUT;
> +				}
> +			}
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_CHECKEDID:
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING_PRE:
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_TRAINING;
> +			break;
> +
> +		case MTK_DP_TRAIN_STATE_TRAINING:
> +			ret = mtk_dp_train_start(mtk_dp);
> +			if (!ret) {
> +				mtk_dp_video_mute(mtk_dp, true);
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_NORMAL;
> +				mtk_dp_fec_enable(mtk_dp, mtk_dp-
> >has_fec);
> +			} else if (ret != -EAGAIN) {
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_DPIDLE;
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

You have list all 7 states, why need default?

> +			break;
> +		}
> +	} while (ret && i--);

Why keep in this loop while error happen?

> +
> +	if (ret)
> +		drm_err(mtk_dp->drm_dev, "Train handler failed %d\n",
> ret);
> +}
> +
> 

[snip]

> +static void mtk_dp_state_handler(struct mtk_dp *mtk_dp)
> +{
> +	switch (mtk_dp->state) {
> +	case MTK_DP_STATE_INITIAL:
> +		mtk_dp_video_mute(mtk_dp, true);
> +		mtk_dp->state = MTK_DP_STATE_IDLE;
> +		break;
> +
> +	case MTK_DP_STATE_IDLE:
> +		if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +			mtk_dp->state = MTK_DP_STATE_PREPARE;
> +		break;
> +
> +	case MTK_DP_STATE_PREPARE:
> +		mtk_dp_video_config(mtk_dp);
> +		mtk_dp_video_enable(mtk_dp, true);
> +
> +		mtk_dp->state = MTK_DP_STATE_NORMAL;
> +		break;
> +
> +	case MTK_DP_STATE_NORMAL:
> +		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp->state = MTK_DP_STATE_IDLE;
> +		}
> +		break;
> +
> +	default:

There is no default case, so remove this.

> +		break;
> +	}
> +}
> +
> 

[snip]

> +
> +static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
> +				    struct drm_connector *connector)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	bool enabled = mtk_dp->enabled;
> +	struct edid *new_edid = NULL;
> +
> +	if (!enabled)

Would DRM core make this happen?

> +		drm_bridge_chain_pre_enable(bridge);
> +
> +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER,
> DP_SET_POWER_D0);
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
> 

[snip]

> +
> +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state
> *old_state)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +
> +	mtk_dp->conn =
> drm_atomic_get_new_connector_for_encoder(old_state->base.state,
> +								bridge-
> >encoder);
> +	if (!mtk_dp->conn) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector is
> missing\n");
> +		return;
> +	}
> +
> +	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld,
> MAX_ELD_BYTES);
> +
> +	conn_state =
> +		drm_atomic_get_new_connector_state(old_state-
> >base.state, mtk_dp->conn);
> +	if (!conn_state) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state is
> missing\n");
> +		return;
> +	}
> +
> +	crtc = conn_state->crtc;
> +	if (!crtc) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state doesn't
> have a crtc\n");
> +		return;
> +	}
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(old_state-
> >base.state, crtc);
> +	if (!crtc_state) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as crtc state is
> missing\n");
> +		return;
> +	}
> +
> +	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state-
> >adjusted_mode);

I think this bridge should implement mode_set() and these code is moved
to mode_set().

Regards,
CK

> +	if (!mtk_dp_parse_capabilities(mtk_dp)) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as nothing is plugged
> in\n");
> +		return;
> +	}
> +
> +	/* Training */
> +	mtk_dp_train_handler(mtk_dp);
> +	mtk_dp_state_handler(mtk_dp);
> +	mtk_dp->enabled = true;
> +}
> +
> 

