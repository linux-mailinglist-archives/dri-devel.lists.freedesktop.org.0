Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6F80EDB6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F16C10E5C9;
	Tue, 12 Dec 2023 13:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 377 seconds by postgrey-1.36 at gabe;
 Tue, 12 Dec 2023 13:33:35 UTC
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E90A10E5C9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1702387641;
 bh=0tiP4C6j3nPpwwBDA8CElSa/FRmWHJ0rT18IdY5QwUo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d6g969f8omCxYQdo7HlUZUe7r1BUINP4N/LK2oyrCJY3EYRMUE+Nhhrd7W0qg84fp
 4m2d2fwgeXwcmQpbBibnm7wIyVSW4d6Q+QcB6B5UO7zJ3x+ECfot522PvvaAVENOoa
 1cQvXA7rKdHHjsudorhrWiR6X96x63GO3zYIbtDzXAYFZWLVBMy+LZrULd7DeRttph
 JpidxkyTHLk8/mUZZHD7kifEulhdhqZVMzACn9zqU0UnCMsUHza+30DsFPUnk54jsI
 tME/GkMS7y0So/KmuKZIhyBaTvzciSEM9VPqg/8XVeDmZPyb5u7RXWFIDFZ5n7shVR
 4au0sSFLcPXzQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 508853781462;
 Tue, 12 Dec 2023 13:27:20 +0000 (UTC)
Message-ID: <8f2c5728-0be2-415e-bccb-798c4a22e853@collabora.com>
Date: Tue, 12 Dec 2023 14:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] drm/mediatek: Set DRM mode configs accordingly
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-6-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-6-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> Set DRM mode configs limitation accroding to the
> hardware capabilities.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 28 ++++++++++++++++++--------
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h |  1 +
>   2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5d551bff6b3f..a4b740420ebb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -304,6 +304,7 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
>   	.conn_routes = mt8188_mtk_ddp_main_routes,
>   	.conn_routes_num = ARRAY_SIZE(mt8188_mtk_ddp_main_routes),
>   	.mmsys_dev_num = 2,
> +	.max_pitch = GENMASK(15, 0),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
> @@ -318,6 +319,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
>   	.main_path = mt8195_mtk_ddp_main,
>   	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
>   	.mmsys_dev_num = 2,
> +	.max_pitch = GENMASK(15, 0),
>   };
>   
>   static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
> @@ -325,6 +327,7 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
>   	.ext_len = ARRAY_SIZE(mt8195_mtk_ddp_ext),
>   	.mmsys_id = 1,
>   	.mmsys_dev_num = 2,
> +	.max_pitch = GENMASK(15, 0),
>   };
>   
>   static const struct of_device_id mtk_drm_of_ids[] = {
> @@ -463,16 +466,16 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   	if (ret)
>   		goto put_mutex_dev;
>   
> -	drm->mode_config.min_width = 64;
> -	drm->mode_config.min_height = 64;
> -
>   	/*
> -	 * set max width and height as default value(4096x4096).
> -	 * this value would be used to check framebuffer size limitation
> -	 * at drm_mode_addfb().
> +	 * Set default values for drm mode config
> +	 * these values will be referenced by drm_mode_addfb() as
> +	 * frame buffer size limitation.
>   	 */
> -	drm->mode_config.max_width = 4096;
> -	drm->mode_config.max_height = 4096;
> +	drm->mode_config.min_width = 1;
> +	drm->mode_config.min_height = 1;
> +	drm->mode_config.cursor_width = 512;
> +	drm->mode_config.cursor_height = 512;
> +
>   	drm->mode_config.funcs = &mtk_drm_mode_config_funcs;
>   	drm->mode_config.helper_private = &mtk_drm_mode_config_helpers;
>   
> @@ -502,6 +505,15 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>   		for (j = 0; j < private->data->mmsys_dev_num; j++) {
>   			priv_n = private->all_drm_private[j];
>   
> +			if (priv_n->data->max_pitch) {
> +				/* Save 4 bytes for the color depth (pitch = width x bpp) */

This comment is confusing. Did you mean 4 *bits*? Four bytes is 32 bits.

Also, I'd change the last part to "(pitch = [ width or height ] x bpp)"

> +				drm->mode_config.max_width  = priv_n->data->max_pitch >> 2;
> +				drm->mode_config.max_height = priv_n->data->max_pitch >> 2;
> +			} else {
> +				drm->mode_config.max_width = 4096;
> +				drm->mode_config.max_height = 4096;
> +			}
> +
>   			if (i == 0 && priv_n->data->main_len) {
>   				ret = mtk_drm_crtc_create(drm, priv_n->data->main_path,
>   							  priv_n->data->main_len, j,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> index d2efd715699f..3d6c1f58a7ec 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
> @@ -41,6 +41,7 @@ struct mtk_mmsys_driver_data {
>   	bool shadow_register;
>   	unsigned int mmsys_id;
>   	unsigned int mmsys_dev_num;
> +	u32 max_pitch;

Is it expected to have a max_pitch > 0xFFFF on newer SoCs?
If not, please change this to u16.

Regards,
Angelo
