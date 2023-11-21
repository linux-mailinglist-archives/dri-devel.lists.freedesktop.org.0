Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258737F2DC3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 13:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC11D10E48B;
	Tue, 21 Nov 2023 12:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0372D10E48B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 12:54:11 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A2106607314;
 Tue, 21 Nov 2023 12:54:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700571250;
 bh=/LVVlw8gLQB6ZTo1Kr0Z/aF5RSngTPxFRD7QwxrFOpY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KRoS6ryt/WYniBln8ggcPoFRpSf2hELuGwRk5vEKV57FaSF/OhaMn7pw6HATLUid0
 t3YnB5WzEoW5hv9xLGA1oov5MuXgkxJCboyVzaIFdZmNXlUDPopGWhi2clWveC5soS
 sw6x0W7q/qLT74sl0FnT8YQDYzuw5nhJ24a7mAR6oZfz192w6Qg1vw+9LxdxDV80ay
 SMxxGNOnZWeWM+X9TUqpxfNfR/sp5Hkz9JQqCK4Iy+YOmYdFZKo3HEUo5nQqO4PWMv
 exCr0IhXGrikqYZMHHAPMrV8gKlCqSQTg+JQZxtm9CVYK3/sJ5iuShaB+5REt/ovtb
 9xAnW2PErb8Vg==
Message-ID: <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
Date: Tue, 21 Nov 2023 13:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 3/3] drm/bridge: it6505: Add audio support
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, kuninori.morimoto.gx@renesas.com,
 nfraprado@collabora.com
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230730180803.22570-4-jiaxin.yu@mediatek.com>
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
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 30/07/23 20:08, Jiaxin Yu ha scritto:
> Add audio support for it6505
> 
> 1. Bridge to hdmi-codec to support audio feature. At the same time,
>     the function of automatically detecting audio is removed.
> 2. It is observed that some DP-to-HDMI dongles will get into bad
>     states if sending InfoFrame without audio data. Defer to enable
>     it6505's audio feature when PCM triggers START or RESUME.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,
this patch doesn't apply anymore (and it won't build anymore) upstream.

> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++---
>   1 file changed, 75 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 504d51c42f79..1cfcb0731288 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2162,7 +2162,6 @@ static void it6505_stop_link_train(struct it6505 *it6505)
>   
>   static void it6505_link_train_ok(struct it6505 *it6505)
>   {
> -	struct device *dev = &it6505->client->dev;

This is because this changed to `struct device *dev = it6505->dev;`

>   
>   	it6505->link_state = LINK_OK;
>   	/* disalbe mute enable avi info frame */
> @@ -2170,11 +2169,6 @@ static void it6505_link_train_ok(struct it6505 *it6505)
>   	it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
>   			EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
>   
> -	if (it6505_audio_input(it6505)) {
> -		DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> -		it6505_enable_audio(it6505);
> -	}
> -
>   	if (it6505->hdcp_desired)
>   		it6505_start_hdcp(it6505);
>   }
> @@ -2846,6 +2840,45 @@ static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
>   		it6505_disable_audio(it6505);
>   }
>   
> +static int it6505_audio_hw_params(struct device *dev, void *data,
> +				  struct hdmi_codec_daifmt *daifmt,
> +				  struct hdmi_codec_params *params)
> +{
> +	struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +	return it6505_audio_setup_hw_params(it6505, params);
> +}
> +
> +static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
> +{
> +	struct device *dev = &it6505->client->dev;

...and because you'll have to change this one, and other occurrences of that
as well.

Can you please respin this series?

Thanks,
Angelo


