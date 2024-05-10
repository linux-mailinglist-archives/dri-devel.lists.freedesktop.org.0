Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB938C2194
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECA110E2E1;
	Fri, 10 May 2024 10:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="2IQqdwqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4144310E918
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715335550;
 bh=vtrYm/vQSHim3jgRX04nOQj9guH68BZEvaolheL2Xv0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=2IQqdwqPtoZkkk19USWWt8xgqlcwa+gPD66JC9VAEpwOYIPtXk4CcL340IG3zLdxP
 nzVp/rwU70UIPRcxvhfHIAobSvLl++PUysKOpB++6Q2BiGJvL4zoPGhKuK52g3RbCJ
 sUcfDpqiOIe43x1vzTgceS5gGHgqIdDsvw1WuhyHTjzO8LQJRL3MdvPT8U5xiYubn/
 l7/HEJNl93y2U8hJN0yc7i6GMo1sFCkhbR2EQJA8v4P7sMAAZyG1tVvGCrU5ew6Ew/
 WxdygCOQ+rLS/K6NZCU7LvPUAHPqq/v+4+UKcbchzpBVRKRbRfkdTqHhcvOm39v6x9
 olb7rHKz8B05g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 92DD6378217A;
 Fri, 10 May 2024 10:05:49 +0000 (UTC)
Message-ID: <8d624845-7450-485c-8000-0194bcf56458@collabora.com>
Date: Fri, 10 May 2024 12:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] Support YUV422 for DPTX.
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, mac.shen@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240510021810.19302-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510021810.19302-1-liankun.yang@mediatek.com>
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

Il 10/05/24 04:15, Liankun Yang ha scritto:
> Adjust the training sequence.Detects the actual link condition
> and calculates the bandwidth where the relevant resolution resides.
> 
> The bandwidth is recalculated and modes that exceed the bandwidth are
> filtered.
> 
> Example Modify bandwidth filtering requirements.
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 81 ++++++++++++++++++-------------
>   1 file changed, 46 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2136a596efa1..3e645bd6fe27 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -66,6 +66,13 @@ enum {
>   	MTK_DP_CAL_MAX,
>   };
>   
> +enum mtk_dp_color_format {
> +	MTK_DP_COLOR_FORMAT_RGB = 0,
> +	MTK_DP_COLOR_FORMAT_YUV422 = 0x1,
> +	MTK_DP_COLOR_FORMAT_YUV444 = 0x2,
> +	MTK_DP_COLOR_FORMAT_YUV420 = 0x3,
> +};

This is giving the same values as drm_dp.h, hence unneeded.

> +
>   struct mtk_dp_train_info {
>   	bool sink_ssc;
>   	bool cable_plugged_in;
> @@ -84,7 +91,7 @@ struct mtk_dp_audio_cfg {
>   };
>   
>   struct mtk_dp_info {
> -	enum dp_pixelformat format;
> +	enum mtk_dp_color_format format;
>   	struct videomode vm;
>   	struct mtk_dp_audio_cfg audio_cur_cfg;
>   };
> @@ -457,7 +464,7 @@ static void mtk_dp_set_msa(struct mtk_dp *mtk_dp)

..snip..

> @@ -1888,9 +1896,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
>   			memset(&mtk_dp->info.audio_cur_cfg, 0,
>   			       sizeof(mtk_dp->info.audio_cur_cfg));
>   
> +			mtk_dp->enabled = false;
> +			/* power off aux */
> +			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			       DP_PWR_STATE_BANDGAP_TPLL,
> +			       DP_PWR_STATE_MASK);
> +

This commit is not even based on upstream, so you haven't even tested it upstream.

Don't send untested commits.
There's nothing to review here.

Regards,
Angelo
