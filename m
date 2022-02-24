Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3611F4C2DAB
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 14:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B03710E4D7;
	Thu, 24 Feb 2022 13:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D4510E4D7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 13:57:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7CFBE1F4520E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645711034;
 bh=FU23JamNvvn6c127qa/j3ThUY5jmoMZZrJoFmPK46lk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j9j905lQZJV6y6Q+ixrGg1d5bX0EWryPbz0rqodSFAm/E1N89Di2GwfyVXuAK4CD/
 risj/WhwnIVEOq7nucZuGfLQ8YMgWH3n0gBke9gATVqtNrfSjazSWRlo6h+IG9IeZJ
 udW+un6ZncU4ehSOA7rYZyOP5dwafIK7P02F2mkkm62uPDPl711zJAOeQB4g7sw96r
 YkMXzt6CePkHxPKyL1hAI+ykjsIXQEKmpkWX3zEtid4R7SvgDjX6DzQtTSdcRR8OqJ
 qC4G5tyRmYV+p7C9xa2EG500xHtMtBrSrgtMvCyeXEXOFLD0Mq3ePM8TW44k1t7rz1
 pb4HzXsgSufXQ==
Message-ID: <03a5591a-574f-ec07-68c8-0e3f97a0c68f@collabora.com>
Date: Thu, 24 Feb 2022 14:57:11 +0100
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


Sorry for the double review, but I've just noticed something critical:

the new version of mtk_dp_train_handler is severely misbehaving, producing

non-functional display.

I also went on with some effort to give you a solution for this,
which implies to also tick the DP_STATE with the DP_TRAIN_STATE;

This is my take on it:

static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)

{

	bool training_done = false;

	short max_retry = 50;

	int ret = 0;



	do {

		switch (mtk_dp->train_state) {

		case MTK_DP_TRAIN_STATE_STARTUP:

			mtk_dp_state_handler(mtk_dp);

			mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;

			break;



		case MTK_DP_TRAIN_STATE_CHECKCAP:

			if (mtk_dp_parse_capabilities(mtk_dp)) {

				mtk_dp->train_info.check_cap_count = 0;

				mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKEDID;

			} else {

				mtk_dp->train_info.check_cap_count++;



				if (mtk_dp->train_info.check_cap_count >

				    MTK_DP_CHECK_SINK_CAP_TIMEOUT_COUNT) {

					mtk_dp->train_info.check_cap_count = 0;

					mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;

					ret = -ETIMEDOUT;

				}

			}

			break;



		case MTK_DP_TRAIN_STATE_CHECKEDID:

			mtk_dp->audio_enable =

					!mtk_dp_edid_parse_audio_capabilities(

						mtk_dp, &mtk_dp->info.audio_caps);



			if (!mtk_dp->audio_enable)

				memset(&mtk_dp->info.audio_caps, 0,

				       sizeof(mtk_dp->info.audio_caps));



			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING_PRE;

			break;



		case MTK_DP_TRAIN_STATE_TRAINING_PRE:

			mtk_dp_state_handler(mtk_dp);

			mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;

			break;



		case MTK_DP_TRAIN_STATE_TRAINING:

			ret = mtk_dp_train_start(mtk_dp);

			if (ret == 0) {

				mtk_dp_video_mute(mtk_dp, true);

				mtk_dp_audio_mute(mtk_dp, true);

				mtk_dp->train_state = MTK_DP_TRAIN_STATE_NORMAL;

				mtk_dp_fec_enable(mtk_dp, mtk_dp->has_fec);

			} else if (ret != -EAGAIN) {

				mtk_dp->train_state = MTK_DP_TRAIN_STATE_DPIDLE;

			}

			break;

		case MTK_DP_TRAIN_STATE_NORMAL:

			mtk_dp_state_handler(mtk_dp);

			training_done = true;

			break;

		case MTK_DP_TRAIN_STATE_DPIDLE:

			break;

		default:

			break;

		}



		if (ret) {

			if (ret == -EAGAIN)

				continue;

			/*

			 * If we get any other error number, it doesn't

			 * make any sense to keep iterating.

			 */

			break;

		}

	} while (!training_done || --max_retry);



	return ret;

}

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
> +}
> +
> +static void mtk_dp_video_enable(struct mtk_dp *mtk_dp, bool enable)
> +{
> +	if (enable) {
> +		mtk_dp_set_tx_out(mtk_dp);
> +		mtk_dp_video_mute(mtk_dp, false);
> +	} else {
> +		mtk_dp_video_mute(mtk_dp, true);
> +	}
> +}
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
> +		break;
> +	}
> +}
> +

Move mtk_dp_train_handler() here.....


> +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> +					struct drm_bridge_state *old_state)
> +{
> +	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;

	int ret;

> +
> +	mtk_dp->conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
> +								bridge->encoder);
> +	if (!mtk_dp->conn) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector is missing\n");
> +		return;
> +	}
> +
> +	memcpy(mtk_dp->connector_eld, mtk_dp->conn->eld, MAX_ELD_BYTES);
> +
> +	conn_state =
> +		drm_atomic_get_new_connector_state(old_state->base.state, mtk_dp->conn);
> +	if (!conn_state) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state is missing\n");
> +		return;
> +	}
> +
> +	crtc = conn_state->crtc;
> +	if (!crtc) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as connector state doesn't have a crtc\n");
> +		return;
> +	}
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(old_state->base.state, crtc);
> +	if (!crtc_state) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as crtc state is missing\n");
> +		return;
> +	}
> +
> +	mtk_dp_parse_drm_mode_timings(mtk_dp, &crtc_state->adjusted_mode);
> +	if (!mtk_dp_parse_capabilities(mtk_dp)) {
> +		drm_err(mtk_dp->drm_dev,
> +			"Can't enable bridge as nothing is plugged in\n");
> +		return;
> +	}
> +
> +	/* Training */

The following is very similar to your previous version of this function:

	ret = mtk_dp_train_handler(mtk_dp);

	if (ret) {

		drm_err(mtk_dp->drm_dev, "Train handler failed %d\n", ret);

		return;

	}



	mtk_dp->enabled = true;

	mtk_dp_update_plugged_status(mtk_dp)
}


> +	mtk_dp_train_handler(mtk_dp);
> +	mtk_dp_state_handler(mtk_dp);
> +	mtk_dp->enabled = true;
> +}

Regards,
Angelo
