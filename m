Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE5A574C62
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 13:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517210E17F;
	Thu, 14 Jul 2022 11:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C7310E17F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 11:43:06 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E0796601A3B;
 Thu, 14 Jul 2022 12:43:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657798984;
 bh=Jmgt9B9vmIXfJJid7XgjYdDGJLAKYu4OfWn1P8yPhOw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I1CQX9JcrHhIziX/KiYO9NOOGL291FYxJwbHYiXpoaNjzvl1ZdrDpbLmEFvlzuQ3H
 MEzRivcgfXjr/hoKURjQRYeZfURGYj+XIf5d9vBNOX0X7+HoA6ny3pnput1vOafAXl
 mCElQXJhyaHq2Ae8y+dx2ZLIDHt0XlZl2HGEDrlISiZIiJJgIESDtGUBZ4rX0WErJ2
 Y/qJA3pEKKn4JOmXvubSbOx3QoIIuu5bQR5EOt1uqStlUszcCeU4byTQEzr1M6hGaA
 55H5s7UTvKlWH5UhC2xzDPk+0SWasoBJTlWQpbtW/+VfjHsBI+ncvutMUKhfYQ5SGG
 PgIsLtQDqItZg==
Message-ID: <32ae9ba6-55aa-1663-05f6-20a637604f70@collabora.com>
Date: Thu, 14 Jul 2022 13:43:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 09/10] drm/mediatek: DP audio support for MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
References: <20220712111223.13080-1-rex-bc.chen@mediatek.com>
 <20220712111223.13080-10-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220712111223.13080-10-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 12/07/22 13:12, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> This patch adds audio support to the DP driver for MT8195 with up to 8
> channels.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 723 ++++++++++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h |   2 +
>   2 files changed, 725 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 5ab646bd2bc4..fa7bb102a105 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c

..snip..

> @@ -2082,6 +2693,104 @@ static void mtk_dp_debounce_timer(struct timer_list *t)
>   	mtk_dp->need_debounce = true;
>   }
>   
> +/*
> + * HDMI audio codec callbacks
> + */
> +static int mtk_dp_audio_hw_params(struct device *dev, void *data,
> +				  struct hdmi_codec_daifmt *daifmt,
> +				  struct hdmi_codec_params *params)
> +{
> +	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
> +	struct mtk_dp_audio_cfg cfg;
> +
> +	if (!mtk_dp->enabled) {
> +		pr_err("%s, DP is not ready!\n", __func__);

drm_err() here please.

> +		return -ENODEV;
> +	}
> +
> +	cfg.channels = params->cea.channels;
> +	cfg.sample_rate = params->sample_rate;
> +	cfg.word_length_bits = 24;
> +
> +	mtk_dp_audio_setup(mtk_dp, &cfg);
> +
> +	return 0;
> +}
> +

..snip..

> +
> +static int mtk_dp_register_audio_driver(struct device *dev)
> +{
> +	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
> +	struct hdmi_codec_pdata codec_data = {
> +		.ops = &mtk_dp_audio_codec_ops,
> +		.max_i2s_channels = 8,
> +		.i2s = 1,
> +		.data = mtk_dp,
> +	};
> +	struct platform_device *pdev;
> +
> +	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> +					     PLATFORM_DEVID_AUTO, &codec_data,
> +					     sizeof(codec_data));
> +	if (IS_ERR(pdev))
> +		return PTR_ERR(pdev);

You're never unregistering this device, which is unacceptable.

Please add a platform device pointer in struct mtk_dp, so that this function
becomes, simply:

	mtk_dp->audio_pdev = platform_device_register_data(dev,
						HDMI_CODEC_DRV_NAME,
						PLATFORM_DEVID_AUTO, &codec_data,
						sizeof(codec_data));
	return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);

> +
> +	return 0;
> +}
> +
>   static int mtk_dp_probe(struct platform_device *pdev)
>   {
>   	struct mtk_dp *mtk_dp;
> @@ -2127,8 +2836,21 @@ static int mtk_dp_probe(struct platform_device *pdev)
>   		return dev_err_probe(dev, -EPROBE_DEFER,
>   				     "failed to request mediatek dptx irq\n");
>   
> +	mutex_init(&mtk_dp->edid_lock);
> +	mutex_init(&mtk_dp->eld_lock);
> +	mutex_init(&mtk_dp->update_plugged_status_lock);
> +
>   	platform_set_drvdata(pdev, mtk_dp);
>   
> +	if (!mtk_dp_is_edp(mtk_dp)) {
> +		ret = mtk_dp_register_audio_driver(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to register audio driver: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
>   	mtk_dp->phy_dev = platform_device_register_data(dev, "mediatek-dp-phy",
>   							PLATFORM_DEVID_AUTO,
>   							&mtk_dp->regs,
> @@ -2174,6 +2896,7 @@ static int mtk_dp_remove(struct platform_device *pdev)
>   
>   	platform_device_unregister(mtk_dp->phy_dev);

... and unregister it here:

	if (mtk_dp->audio_pdev)
		platform_device_unregister(mtk_dp->audio_pdev);

>   	mtk_dp_video_mute(mtk_dp, true);
> +	mtk_dp_audio_mute(mtk_dp, true);
>   	del_timer_sync(&mtk_dp->debounce_timer);
>   
>   	pm_runtime_disable(&pdev->dev);

Regards,
Angelo
