Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E887E6D6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 11:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C403110E3F1;
	Mon, 18 Mar 2024 10:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="3NTy04CC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2F310E3F1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710756646;
 bh=vNcOM4WmDvXVUR5M6HphO7eli9upH40kK4nrr3dJVd8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=3NTy04CCWD2+LQwm0MGE6B6dMMSEPHqqOSYeA36i7gPuNZ+7P3k14oKDmE0xJq6g5
 wdtRB6XuZeWLAWOSDQgI81+CaMekWKjr4BGS+Lg1TnVaRPJUGP//pM8F4LoGHPpmJB
 M/kMSB+bu6axufG2OQaRVoHqpbaz5ssDit5YNxYEH4PL5bysBx9qb0zUrw4phir48c
 Ub1EySBjwNNx59kwXEVZ5w0uLqGqEbaY5VY8Lq2Plc19QrsKX57kXEGlMkKbVP2pzg
 te6RhRlN+r7SoBEDkUhh1gfT2sKAOOdbIWKVmbKL1qsVjCRUloBFMryyXFjF+Qoq/s
 p7o6spxF1qN3A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F50E3781FCD;
 Mon, 18 Mar 2024 10:10:45 +0000 (UTC)
Message-ID: <5abc673e-b3d2-4a33-9b18-17a073b8315c@collabora.com>
Date: Mon, 18 Mar 2024 11:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] drm/mediatek/ dp: Adjust bandwidth limit for DP
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, mac.shen@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240315015233.2023-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240315015233.2023-1-liankun.yang@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/03/24 02:52, Liankun Yang ha scritto:
> By adjusting the order of link training and relocating it to HPD,
> link training can identify the usability of each lane in the current link.
> 
> It also supports handling signal instability and weakness due to
> environmental issues, enabling the acquisition of a stable bandwidth
> for the current link. Subsequently, DP work can proceed based on
> the actual maximum bandwidth.
> 
> It should training in the hpd event thread.
> Check the mode with lane count and link rate of training.
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

This patch breaks both the internal eDP display *and* external DP on
at least the MT8195 Cherry Tomato Chromebook.

Regards,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 57 +++++++++++++++----------------
>   1 file changed, 28 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2136a596efa1..14da6077f947 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1870,6 +1870,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   	struct mtk_dp *mtk_dp = dev;
>   	unsigned long flags;
>   	u32 status;
> +	int ret;
>   
>   	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
>   		msleep(100);
> @@ -1888,9 +1889,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   			memset(&mtk_dp->info.audio_cur_cfg, 0,
>   			       sizeof(mtk_dp->info.audio_cur_cfg));
>   
> +			mtk_dp->enabled = false;
> +			/* power off aux */
> +			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			       DP_PWR_STATE_BANDGAP_TPLL,
> +			       DP_PWR_STATE_MASK);
> +
>   			mtk_dp->need_debounce = false;
>   			mod_timer(&mtk_dp->debounce_timer,
>   				  jiffies + msecs_to_jiffies(100) - 1);
> +		} else {
> +			mtk_dp_aux_panel_poweron(mtk_dp, true);
> +
> +			ret = mtk_dp_parse_capabilities(mtk_dp);
> +			if (ret)
> +				drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
> +
> +			/* Training */
> +			ret = mtk_dp_training(mtk_dp);
> +			if (ret)
> +				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
> +
> +			mtk_dp->enabled = true;
>   		}
>   	}
>   
> @@ -2057,16 +2077,6 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
>   
>   	new_edid = drm_get_edid(connector, &mtk_dp->aux.ddc);
>   
> -	/*
> -	 * Parse capability here to let atomic_get_input_bus_fmts and
> -	 * mode_valid use the capability to calculate sink bitrates.
> -	 */
> -	if (mtk_dp_parse_capabilities(mtk_dp)) {
> -		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
> -		kfree(new_edid);
> -		new_edid = NULL;
> -	}
> -
>   	if (new_edid) {
>   		struct cea_sad *sads;
>   
> @@ -2243,14 +2253,10 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   		return;
>   	}
>   
> -	mtk_dp_aux_panel_poweron(mtk_dp, true);
> -
> -	/* Training */
> -	ret = mtk_dp_training(mtk_dp);
> -	if (ret) {
> -		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
> -		goto power_off_aux;
> -	}
> +	/* power on aux */
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +			   DP_PWR_STATE_MASK);
>   
>   	ret = mtk_dp_video_config(mtk_dp);
>   	if (ret)
> @@ -2269,7 +2275,6 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   		       sizeof(mtk_dp->info.audio_cur_cfg));
>   	}
>   
> -	mtk_dp->enabled = true;
>   	mtk_dp_update_plugged_status(mtk_dp);
>   
>   	return;
> @@ -2284,16 +2289,10 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>   {
>   	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>   
> -	mtk_dp->enabled = false;
>   	mtk_dp_update_plugged_status(mtk_dp);
>   	mtk_dp_video_enable(mtk_dp, false);
>   	mtk_dp_audio_mute(mtk_dp, true);
>   
> -	if (mtk_dp->train_info.cable_plugged_in) {
> -		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
> -		usleep_range(2000, 3000);
> -	}
> -
>   	/* power off aux */
>   	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
>   			   DP_PWR_STATE_BANDGAP_TPLL,
> @@ -2310,10 +2309,10 @@ mtk_dp_bridge_mode_valid(struct drm_bridge *bridge,
>   {
>   	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>   	u32 bpp = info->color_formats & DRM_COLOR_FORMAT_YCBCR422 ? 16 : 24;
> -	u32 rate = min_t(u32, drm_dp_max_link_rate(mtk_dp->rx_cap) *
> -			      drm_dp_max_lane_count(mtk_dp->rx_cap),
> -			 drm_dp_bw_code_to_link_rate(mtk_dp->max_linkrate) *
> -			 mtk_dp->max_lanes);
> +
> +	u32 lane_count_min = mtk_dp->train_info.lane_count;
> +	u32 rate = drm_dp_bw_code_to_link_rate(mtk_dp->train_info.link_rate) *
> +			 lane_count_min;
>   
>   	if (rate < mode->clock * bpp / 8)
>   		return MODE_CLOCK_HIGH;

