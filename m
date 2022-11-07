Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467E61F189
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 12:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCC310E2DA;
	Mon,  7 Nov 2022 11:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1760110E2DA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 11:09:39 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4AC4B6601FAA;
 Mon,  7 Nov 2022 11:09:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667819377;
 bh=et1Jk5J0RJuKh02K+IugMlrxsiloJw26YAWzuRtvXjo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UrnsMhIgjMtKW4rENetK+bxFEC3FL/aNIbsYpIwEp8+m3dTXkvTEXCRhpMM3YXdUY
 /p0bqsQFgCk8UihV7pWEy+C67PDxYlsm1Jc8vpr1Ov2wQsjXEJRrmYQcBslWsgRyWi
 k8Tdhv6AUuGwVlZVVwRnlGs7lM9LxWfz1kSSYMk3bRGO9imZBlrvUrZ5NDRmOg6Yid
 zlDixmJiXjRQS9SCeZgS57w3jNWK+x8u6/IXeKIJ0G3eeCogbX1eYSANsLLGshkzDj
 Ued5OqcezuIuxQrwjCRWgOclFdo3PICckeKyjurTQJ6yQ78zq/nt3TycQGWk7m35qv
 DInXP294aLzpA==
Message-ID: <5895f15f-44ae-6164-77dd-c9bae5436a47@collabora.com>
Date: Mon, 7 Nov 2022 12:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 08/12] drm/mediatek: hdmi: v2: add audio support
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-8-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-8-a803f2660127@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mac.shen@mediatek.com,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> Add HDMI audio support for v2
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c |   1 +
>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c |   2 +-
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 213 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.h     |   2 +
>   4 files changed, 217 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> index e43c938a9aa5..1ea91f8bb6c7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -386,6 +386,7 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_v2 = {
>   	.mtk_hdmi_output_init = mtk_hdmi_output_init_v2,
>   	.mtk_hdmi_clk_disable = mtk_hdmi_clk_disable_v2,
>   	.mtk_hdmi_clk_enable = mtk_hdmi_clk_enable_v2,
> +	.set_hdmi_codec_pdata = set_hdmi_codec_pdata_v2,

Keep naming consistent please:

	.mtk_hdmi_set_codec_pdata = mtk_hdmi_set_codec_pdata_v2,

>   	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_v2,
>   	.num_clocks = MTK_HDMIV2_CLK_COUNT,
>   };
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> index 61696d255e51..26456802a5c4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
> @@ -309,7 +309,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
>   	ddc->regs = device_node_to_regmap(hdmi);
>   	of_node_put(hdmi);
>   	if (IS_ERR(ddc->regs))
> -		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get mt8195-hdmi syscon");
> +		return dev_err_probe(dev, PTR_ERR(ddc->regs), "Unable to get hdmi syscon");

You might as well do the rename in the commit that actually introduces this file,
since you're doing that in the same series.

Please do so.

>   
>   	ddc->clk = devm_clk_get_enabled(dev, "ddc");
>   	if (IS_ERR(ddc->clk))
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> index e8457429964d..b391b22fa9f5 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -211,6 +211,26 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>   		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
>   }
>   
> +static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
> +{
> +	u32 val;
> +
> +	val = mtk_hdmi_read(hdmi, AIP_CTRL, &val);
> +
> +	if (val & DSD_EN)
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN,

I think I already gave you some advice to shorten this in an earlier
series version.

Besides, you can also use the FIELD_PREP() macro here, and please use it.

P.S.:
val = FIELD_PREP(... something AUD_MUTE_FIFO_EN);
if (val & DSD_EN)
	val |= FIELD_PREP( ... something DSD_MUTE_DATA)

mtk_hdmi_mask(hdmi, AIP_TXCTRL, val, val);

> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN);
> +	else
> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_FIFO_EN,
> +			      AUD_MUTE_FIFO_EN);
> +}
> +
> +static void mtk_hdmi_hw_aud_unmute(struct mtk_hdmi *hdmi)
> +{
> +	mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_DIS, AUD_MUTE_FIFO_EN);
> +}
> +
>   static void mtk_hdmi_hw_reset(struct mtk_hdmi *hdmi)
>   {
>   	mtk_hdmi_mask(hdmi, HDMITX_CONFIG, 0x0, HDMITX_SW_RSTB);
> @@ -889,6 +909,7 @@ static void mtk_hdmi_audio_reset(struct mtk_hdmi *hdmi, bool rst)

..snip..

> @@ -935,6 +957,28 @@ static void mtk_hdmi_reset_colorspace_setting(struct mtk_hdmi *hdmi)
>   	hdmi->ycc_quantization_range = HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
>   }
>   
> +static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)

These two functions are used only in one function (each)... so you don't
need them. Just move the two lines in mtk_hdmi_audio_startup() ...

> +{
> +	mtk_hdmi_aud_enable_packet(hdmi, true);
> +	hdmi->audio_enable = true;
> +}
> +
> +static void mtk_hdmi_audio_disable(struct mtk_hdmi *hdmi)
> +{

... and in mtk_hdmi_audio_shutdown().

> +	mtk_hdmi_aud_enable_packet(hdmi, false);
> +	hdmi->audio_enable = false;
> +}
> +
> +static void mtk_hdmi_audio_set_param(struct mtk_hdmi *hdmi,
> +				     struct hdmi_audio_param *param)
> +{
> +	if (!hdmi->audio_enable)
> +		return;
> +
> +	memcpy(&hdmi->aud_param, param, sizeof(*param));
> +	mtk_hdmi_aud_output_config(hdmi, &hdmi->mode);
> +}
> +
>   static void mtk_hdmi_change_video_resolution(struct mtk_hdmi *hdmi)
>   {
>   	bool is_over_340M = false;

..snip..


> +
> +static int mtk_hdmi_audio_mute(struct device *dev, void *data, bool enable,
> +			       int direction)
> +{
> +	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
> +
> +	if (direction != SNDRV_PCM_STREAM_PLAYBACK)

Why aren't you returning an error here?

If this is really supposed to be like that, please add a comment in the code
explaining the reason, so that the next person reading this won't mistakenly
change that.

> +		return 0;
> +
> +	if (enable)
> +		mtk_hdmi_hw_aud_mute(hdmi);
> +	else
> +		mtk_hdmi_hw_aud_unmute(hdmi);
> +
> +	return 0;
> +}
> +

Regards,
Angelo


