Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE73A8B41E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 10:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851F210E891;
	Wed, 16 Apr 2025 08:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UHAdCRoN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BEB10E891
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744792938;
 bh=lBq+nRsAwNOh1FOg8HmYIAR/otlL7MDWorrjN+gny2k=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=UHAdCRoNpe6xnsz03yNwkmjsAvBE4UncSzV6MfjTAj0qn0y2GmFKJDOUHh3d3agXY
 RjEU99oOURiGS/3eLifOAWqN6i2JtXyzHoxIDP3zGJU2eqGT7ROtfrznm5yrQQy0LW
 tlIQBIRV6I+q85o/IQGahvzn5/hHUIpqqBwJjFfkDLLsjPXQ99Tv3GaSyZ7ycISjrm
 hZhcwpuctL1o+OggrbQduSuOOS3rccvDtuqL06nF4n6HXdn0Cp/07va4QNtFcKyyw6
 mklmsDhT3kcmCM1WPRXK26BPPSea+1C1TgrJ27BOJ6VUbJvF76bpHk2/lwv60VdDnt
 uQK+kr1+uhNjg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9354417E0B2D;
 Wed, 16 Apr 2025 10:42:17 +0200 (CEST)
Message-ID: <bd60aae8-2df3-45d7-9db6-9d21d15a079c@collabora.com>
Date: Wed, 16 Apr 2025 10:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Adjust bandwidth limit for DP
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, mac.shen@mediatek.com,
 peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250318140236.13650-1-liankun.yang@mediatek.com>
 <20250318140236.13650-2-liankun.yang@mediatek.com>
Content-Language: en-US
In-Reply-To: <20250318140236.13650-2-liankun.yang@mediatek.com>
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

Il 18/03/25 15:02, Liankun Yang ha scritto:
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

This patch still breaks the internal eDP display on MT8195 Tomato,
but DP is fine.

Please test your patches on that machine before sending again.

Regards,
Angelo

> ---
> Change in V3:
> - Remove 'mtk_dp->enabled = false" in atomic disable.
> - Remove 'mtk_dp->enabled = true" in atomic enable.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241025083036.8829-4-liankun.yang@mediatek.com/
> 
> Change in V2:
> - Adjust DP training timing.
> - Adjust parse capabilities timing.
> - Add power on/off for connect/disconnect.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240315015233.2023-1-liankun.yang@mediatek.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 39 ++++++++++++++++---------------
>   1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 3d4648d2e15f..fb76fc1bf497 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1976,6 +1976,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   	struct mtk_dp *mtk_dp = dev;
>   	unsigned long flags;
>   	u32 status;
> +	int ret;
>   
>   	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
>   		msleep(100);
> @@ -1994,9 +1995,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
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
> @@ -2162,16 +2182,6 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
>   
>   	drm_edid = drm_edid_read_ddc(connector, &mtk_dp->aux.ddc);
>   
> -	/*
> -	 * Parse capability here to let atomic_get_input_bus_fmts and
> -	 * mode_valid use the capability to calculate sink bitrates.
> -	 */
> -	if (mtk_dp_parse_capabilities(mtk_dp)) {
> -		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
> -		drm_edid_free(drm_edid);
> -		drm_edid = NULL;
> -	}
> -
>   	if (drm_edid) {
>   		/*
>   		 * FIXME: get rid of drm_edid_raw()
> @@ -2365,13 +2375,6 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   
>   	mtk_dp_aux_panel_poweron(mtk_dp, true);
>   
> -	/* Training */
> -	ret = mtk_dp_training(mtk_dp);
> -	if (ret) {
> -		drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
> -		goto power_off_aux;
> -	}
> -
>   	ret = mtk_dp_video_config(mtk_dp);
>   	if (ret)
>   		goto power_off_aux;
> @@ -2389,7 +2392,6 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
>   		       sizeof(mtk_dp->info.audio_cur_cfg));
>   	}
>   
> -	mtk_dp->enabled = true;
>   	mtk_dp_update_plugged_status(mtk_dp);
>   
>   	return;
> @@ -2404,7 +2406,6 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
>   {
>   	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
>   
> -	mtk_dp->enabled = false;
>   	mtk_dp_update_plugged_status(mtk_dp);
>   	mtk_dp_video_enable(mtk_dp, false);
>   	mtk_dp_audio_mute(mtk_dp, true);


