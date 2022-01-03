Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1436482D7A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 02:50:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B1B89E0C;
	Mon,  3 Jan 2022 01:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B9789E0C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 01:50:04 +0000 (UTC)
X-UUID: 11844147ef6c48bebd9061073bfff0da-20220103
X-UUID: 11844147ef6c48bebd9061073bfff0da-20220103
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 145615203; Mon, 03 Jan 2022 09:50:00 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 3 Jan 2022 09:49:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Jan 2022 09:49:59 +0800
Message-ID: <11b7a01889d9e0c5c3598f173be823e1e39ed397.camel@mediatek.com>
Subject: Re: [PATCH v7 7/8] drm/mediatek: Add mt8195 DisplayPort driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Mon, 3 Jan 2022 09:49:58 +0800
In-Reply-To: <20211217150854.2081-8-granquet@baylibre.com>
References: <20211217150854.2081-1-granquet@baylibre.com>
 <20211217150854.2081-8-granquet@baylibre.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

This is a big patch, so I give you some comment first, and I would
continue to review this patch.

On Fri, 2021-12-17 at 16:08 +0100, Guillaume Ranquet wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> 
> It supports the mt8195, the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with
> up
> to 4 lanes.
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
>  drivers/gpu/drm/mediatek/mtk_dp.c      | 3028
> ++++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h  |  568 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h |    1 +
>  6 files changed, 3607 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig
> b/drivers/gpu/drm/mediatek/Kconfig
> index 2976d21e9a34a..029b94c716131 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -28,3 +28,10 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> +
> +config MTK_DPTX_SUPPORT
> +	tristate "DRM DPTX Support for Mediatek SoCs"
> +	depends on DRM_MEDIATEK
> +	select PHY_MTK_DP
> +	help
> +	  DRM/KMS Display Port driver for Mediatek SoCs.
> diff --git a/drivers/gpu/drm/mediatek/Makefile
> b/drivers/gpu/drm/mediatek/Makefile
> index 29098d7c8307c..d86a6406055e6 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -21,3 +21,5 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> +
> +obj-$(CONFIG_MTK_DPTX_SUPPORT) += mtk_dp.o
> 

[snip]

> +
> +enum mtk_dp_train_state {
> +	MTK_DP_TRAIN_STATE_STARTUP = 0,
> +	MTK_DP_TRAIN_STATE_CHECKCAP,
> +	MTK_DP_TRAIN_STATE_CHECKEDID,
> +	MTK_DP_TRAIN_STATE_TRAINING_PRE,
> +	MTK_DP_TRAIN_STATE_TRAINING,
> +	MTK_DP_TRAIN_STATE_CHECKTIMING,
> +	MTK_DP_TRAIN_STATE_NORMAL,
> +	MTK_DP_TRAIN_STATE_POWERSAVE,

Never be this state, so remove it.

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
> +	int link_rate;
> +	int lane_count;
> +
> +	int irq_status;
> +	int check_cap_count;
> +};
> +
> 

[snip]

> 
> +
> +static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
> +{
> +	u32 irq_status = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_35D0) &
> +			 SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK;
> +
> +	if (irq_status) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C8,
> irq_status,
> +				   SW_IRQ_CLR_DP_TRANS_P0_MASK);

SW_IRQ_CLR_DP_TRANS_P0_MASK is already set, so this setting is
redundant, so remove this.


> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C8, 0,
> +				   SW_IRQ_CLR_DP_TRANS_P0_MASK);
> +	}
> +
> +	return irq_status;
> +}
> +
> +static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
> +{
> +	u8 irq_status = (mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
> +			 IRQ_STATUS_DP_TRANS_P0_MASK) >>
> +			IRQ_STATUS_DP_TRANS_P0_SHIFT;
> +
> +	if (irq_status) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418,
> irq_status,
> +				   IRQ_CLR_DP_TRANS_P0_MASK);

IRQ_CLR_DP_TRANS_P0_MASK is already set, so this setting is redundant,
so remove this.


> +		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, 0,
> +				   IRQ_CLR_DP_TRANS_P0_MASK);
> +	}
> +
> +	return irq_status;
> +}
> +
> +static void mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	u32 val = 0;
> +
> +	if (!enable)
> +		val = IRQ_MASK_DP_TRANS_P0_DISC_IRQ |
> +		      IRQ_MASK_DP_TRANS_P0_CONN_IRQ |
> +		      IRQ_MASK_DP_TRANS_P0_INT_IRQ;
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418, val,
> +			   IRQ_MASK_DP_TRANS_P0_MASK);
> +}
> +
> +void mtk_dp_initialize_settings(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_342C,
> +			   XTAL_FREQ_DP_TRANS_P0_DEFAULT,
> +			   XTAL_FREQ_DP_TRANS_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3540,
> +			   BIT(FEC_CLOCK_EN_MODE_DP_TRANS_P0_SHIFT),
> +			   FEC_CLOCK_EN_MODE_DP_TRANS_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_31EC,
> +			   BIT(AUDIO_CH_SRC_SEL_DP_ENC0_P0_SHIFT),
> +			   AUDIO_CH_SRC_SEL_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_304C, 0,
> +			   SDP_VSYNC_RISING_MASK_DP_ENC0_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_IRQ_MASK,
> IRQ_MASK_AUX_TOP_IRQ,
> +			   IRQ_MASK_AUX_TOP_IRQ);
> +}
> +
> +static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp
> *mtk_dp)
> +{
> +	// Debounce threshold

/* ... */

> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> +			   8 << HPD_DEB_THD_DP_TRANS_P0_SHIFT,
> +			   HPD_DEB_THD_DP_TRANS_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> +			   (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
> +			    HPD_INT_THD_DP_TRANS_P0_UPPER_1100US)
> +				   << HPD_INT_THD_DP_TRANS_P0_SHIFT,
> +			   HPD_INT_THD_DP_TRANS_P0_MASK);
> +
> +	// Connect threshold 1.5ms + 5 x 0.1ms = 2ms
> +	// Disconnect threshold 1.5ms + 5 x 0.1ms = 2ms
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> +			   (5 << HPD_DISC_THD_DP_TRANS_P0_SHIFT) |
> +				   (5 <<
> HPD_CONN_THD_DP_TRANS_P0_SHIFT),
> +			   HPD_DISC_THD_DP_TRANS_P0_MASK |
> +				   HPD_CONN_THD_DP_TRANS_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3430,
> +			   HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT,
> +			   HPD_INT_THD_ECO_DP_TRANS_P0_MASK);
> +}
> +
> 

[snip]

> +
> +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> +{
> +	int ret = 0;
> +
> +	if (mtk_dp->train_state == MTK_DP_TRAIN_STATE_NORMAL)
> +		return ret;
> +
> +	switch (mtk_dp->train_state) {
> +	case MTK_DP_TRAIN_STATE_STARTUP:
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
> +		break;
> +
> +	case MTK_DP_TRAIN_STATE_CHECKCAP:
> +		if (mtk_dp_parse_capabilities(mtk_dp)) {
> +			mtk_dp->train_info.check_cap_count = 0;
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_CHECKEDID;
> +		} else {
> +			mtk_dp->train_info.check_cap_count++;
> +
> +			if (mtk_dp->train_info.check_cap_count >
> +			    MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT) {
> +				mtk_dp->train_info.check_cap_count = 0;
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_DPIDLE;
> +				ret = -ETIMEDOUT;
> +			}
> +		}
> +		break;
> +
> +	case MTK_DP_TRAIN_STATE_CHECKEDID: {
> +		int caps_found =
> mtk_dp_edid_parse_audio_capabilities(mtk_dp,
> +			&mtk_dp->info.audio_caps);
> +		mtk_dp->audio_enable = caps_found > 0;
> +		if (!mtk_dp->audio_enable)
> +			memset(&mtk_dp->info.audio_caps, 0,
> +			       sizeof(mtk_dp->info.audio_caps));
> +	}
> +
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;
> +		break;
> +
> +	case MTK_DP_TRAIN_STATE_TRAINING_PRE:
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
> +		break;
> +
> +	case MTK_DP_TRAIN_STATE_TRAINING:
> +		ret = mtk_dp_train_start(mtk_dp);
> +		if (!ret) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp_audio_mute(mtk_dp, true);
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_CHECKTIMING;
> +			mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);
> +		} else if (ret != -EAGAIN) {
> +			mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_DPIDLE;
> +		}
> +
> +		ret = 0;
> +		break;
> +
> +	case MTK_DP_TRAIN_STATE_CHECKTIMING:
> +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;

If MTK_DP_TRAIN_STATE_CHECKTIMING does nothing,I think we should drop
state MTK_DP_TRAIN_STATE_CHECKTIMING.

> +		break;
> +	case MTK_DP_TRAIN_STATE_NORMAL:
> +		break;
> +	case MTK_DP_TRAIN_STATE_POWERSAVE:
> +		break;
> +	case MTK_DP_TRAIN_STATE_DPIDLE:
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> 

[snip]

> +
> +static void mtk_dp_video_config(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_mn_overwrite_disable(mtk_dp);
> +
> +	mtk_dp_set_msa(mtk_dp);
> +
> +	mtk_dp_set_color_depth(mtk_dp, mtk_dp->info.depth);
> +	mtk_dp_set_color_format(mtk_dp, mtk_dp->info.format);
> +}
> +
> +static int mtk_dp_state_handler(struct mtk_dp *mtk_dp)

Always return 0, so change to void.

> +{
> +	int ret = 0;
> +
> +	switch (mtk_dp->state) {
> +	case MTK_DP_STATE_INITIAL:
> +		mtk_dp_video_mute(mtk_dp, true);
> +		mtk_dp_audio_mute(mtk_dp, true);
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
> +		if (mtk_dp->audio_enable) {
> +			mtk_dp_audio_setup(mtk_dp, &mtk_dp-
> >info.audio_caps);
> +			mtk_dp_audio_mute(mtk_dp, false);
> +		}
> +
> +		mtk_dp->state = MTK_DP_STATE_NORMAL;
> +		break;
> +
> +	case MTK_DP_STATE_NORMAL:
> +		if (mtk_dp->train_state != MTK_DP_TRAIN_STATE_NORMAL) {
> +			mtk_dp_video_mute(mtk_dp, true);
> +			mtk_dp_audio_mute(mtk_dp, true);
> +			mtk_dp_sdp_stop_sending(mtk_dp);
> +			mtk_dp->state = MTK_DP_STATE_IDLE;
> +		}
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_set_idle_pattern(mtk_dp, true);
> +	mtk_dp_initialize_priv_data(mtk_dp);
> +
> +	mtk_dp_initialize_settings(mtk_dp);
> +	mtk_dp_initialize_aux_settings(mtk_dp);
> +	mtk_dp_initialize_digital_settings(mtk_dp);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_P0_3690,
> +			   BIT(RX_REPLY_COMPLETE_MODE_AUX_TX_P0_SHIFT),
> +			   RX_REPLY_COMPLETE_MODE_AUX_TX_P0_MASK);
> +	mtk_dp_initialize_hpd_detect_settings(mtk_dp);
> +
> +	mtk_dp_digital_sw_reset(mtk_dp);
> +}
> +
> +static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev;
> +	int event;

event is useless, do drop it.

> +	u8 buf[DP_RECEIVER_CAP_SIZE] = {};
> +
> +	event = mtk_dp_plug_state(mtk_dp) ? connector_status_connected
> :
> +						  connector_status_disc
> onnected;
> +
> +	if (event < 0)

Never happen, drop it.

> +		return IRQ_HANDLED;
> +
> +	if (mtk_dp->drm_dev) {
> +		dev_info(mtk_dp->dev, "drm_helper_hpd_irq_event\n");
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
> +			mtk_dp_audio_mute(mtk_dp, true);
> +
> +			mtk_dp_initialize_priv_data(mtk_dp);
> +			mtk_dp_set_idle_pattern(mtk_dp, true);
> +			if (mtk_dp->has_fec)
> +				mtk_dp_fec_enable(mtk_dp, false);
> +			mtk_dp_sdp_stop_sending(mtk_dp);
> +
> +			mtk_dp_edid_free(mtk_dp);
> +			mtk_dp_update_bits(mtk_dp,
> MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL,
> +					   DP_PWR_STATE_MASK);
> +		} else {
> +			mtk_dp_update_bits(mtk_dp,
> MTK_DP_TOP_PWR_STATE,
> +					   DP_PWR_STATE_BANDGAP_TPLL_LA
> NE,
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

mtk_dp_sw_irq_get_clear() and mtk_dp_hwirq_get_clear() is called once
here, so I would like to merge that two function into this function.

> +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> +
> +	train_info->irq_status |= hwirq_status | swirq_status;
> +
> +	if (!train_info->irq_status)
> +		return IRQ_HANDLED;
> +

Drop below algorithm, and call mtk_dp_plug_state() in
mtk_dp_hpd_event_thread(), and directly compare connected with
train_info->cable_plugged_in.

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

mtk_dp_hpd_isr_handler() is called once here,
so I would like to merge
mtk_dp_hpd_isr_handler() into this function,
and change mtk_dp_hpd_event() to mtk_dp_hpd_isr_handler().


> +
> +	return IRQ_HANDLED;
> +}
> +
> 

[snip]

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

In intel_dp_aux_transfer() [1], it is 

switch (msg->request & ~DP_AUX_I2C_MOT) {

Would that be a better statement?


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/i915/display/intel_dp_aux.c?h=v5.16-rc6#n413

> +	case DP_AUX_I2C_MOT:
> +	case DP_AUX_I2C_WRITE:
> +	case DP_AUX_NATIVE_WRITE:
> +	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
> +	case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
> +		request = msg->request &
> ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
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
> +		mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> +				       msg->address + accessed_bytes,
> +				       msg->buffer + accessed_bytes,
> 0);
> +	} else {
> +		while (accessed_bytes < msg->size) {
> +			size_t to_access =
> +				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
> +				      msg->size - accessed_bytes);
> +			retry = 3;
> +			while (retry--) {
> +				ret = mtk_dp_aux_do_transfer(mtk_dp,
> +							     is_read,
> request,
> +							     msg-
> >address + accessed_bytes,
> +							     msg-
> >buffer + accessed_bytes,
> +							     to_access)
> ;
> +				if (ret == 0)
> +					break;
> +				usleep_range(50, 100);
> +			}
> +			if (!retry && ret) {
> +				drm_info(mtk_dp->drm_dev,
> +					 "Failed to do AUX transfer:
> %d\n",
> +					 ret);
> +				break;
> +			}
> +			accessed_bytes += to_access;
> +		}
> +	}
> +err:
> +	if (ret) {
> +		msg->reply = DP_AUX_NATIVE_REPLY_NACK |
> DP_AUX_I2C_REPLY_NACK;
> +		return err;
> +	}
> +
> +	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
> +	return msg->size;
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
> +	int ret = 0;
> +	int i;
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
> +	mutex_lock(&mtk_dp->eld_lock);
> +	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld,
> MAX_ELD_BYTES);
> +	mutex_unlock(&mtk_dp->eld_lock);
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
> +	if (!mtk_dp_parse_capabilities(mtk_dp)) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as nothing is plugged
> in\n");
> +		return;
> +	}
> +
> +	/* Training */
> +	for (i = 0; i < 50; i++) {
> +		ret = mtk_dp_train_handler(mtk_dp);

Why do you call mtk_dp_train_handler() many times? Call
mtk_dp_train_handler() once and let all retry inside
mtk_dp_train_handler().

> +		if (ret) {
> +			drm_err(mtk_dp->drm_dev, "Train handler failed
> %d\n",
> +				ret);
> +			return;
> +		}
> +
> +		ret = mtk_dp_state_handler(mtk_dp);
> +		if (ret) {
> +			drm_err(mtk_dp->drm_dev, "State handler failed
> %d\n",
> +				ret);
> +			return;
> +		}
> +	}
> +
> +	mtk_dp->enabled = true;
> +	mtk_dp_update_plugged_status(mtk_dp);
> +}
> +
> 

[snip]

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
> +	if (irq_num < 0) {
> +		dev_err(dev, "failed to request dp irq resource\n");
> +		return -EPROBE_DEFER;

return irq_num;

> +	}
> +
> +	mtk_dp->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 
> 1, 0);
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
> +					IRQ_TYPE_LEVEL_HIGH,
> dev_name(dev),
> +					mtk_dp);
> +	if (ret) {
> +		dev_err(dev, "failed to request mediatek dptx irq\n");
> +		return -EPROBE_DEFER;

return ret;

> +	}
> +
> +	mutex_init(&mtk_dp->dp_lock);
> +	mutex_init(&mtk_dp->edid_lock);
> +	mutex_init(&mtk_dp->eld_lock);
> +
> +	platform_set_drvdata(pdev, mtk_dp);
> +
> +	mutex_init(&mtk_dp->update_plugged_status_lock);
> +	ret = mtk_dp_register_audio_driver(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register audio driver: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-
> dp-phy",
> +							PLATFORM_DEVID_
> AUTO,
> +							&mtk_dp->regs,
> +							sizeof(struct
> regmap *));
> +	if (IS_ERR(mtk_dp->phy_dev)) {
> +		dev_err(dev, "Failed to create device mediatek-dp-phy:
> %ld\n",
> +			PTR_ERR(mtk_dp->phy_dev));
> +		return PTR_ERR(mtk_dp->phy_dev);
> +	}
> +
> +	mtk_dp_get_calibration_data(mtk_dp);
> +
> +	mtk_dp->phy = devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> +	if (IS_ERR(mtk_dp->phy)) {
> +		dev_err(dev, "Failed to get phy: %ld\n",
> PTR_ERR(mtk_dp->phy));
> +		platform_device_unregister(mtk_dp->phy_dev);
> +		return PTR_ERR(mtk_dp->phy);
> +	}
> +
> +	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
> +	mtk_dp->bridge.of_node = dev->of_node;
> +	mtk_dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> +
> +	mtk_dp->bridge.ops =
> +		DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> DRM_BRIDGE_OP_HPD;
> +	drm_bridge_add(&mtk_dp->bridge);
> +
> +	pm_runtime_enable(dev);
> +	pm_runtime_get_sync(dev);
> +
> +	return 0;
> +}
> +
> 



