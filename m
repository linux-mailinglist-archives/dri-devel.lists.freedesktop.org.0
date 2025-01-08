Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330D5A0569E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 10:23:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A957810E6FA;
	Wed,  8 Jan 2025 09:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J/iPZDPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AE310E6FA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 09:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736328188;
 bh=qd19nRPwbCvUMi/KiQbuvAWtRBU4wH1adFt9H0ZLYm4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J/iPZDPdgXw2RBeEUVXQ1CswpShssY0E40y7+6XgOHC5JCgIeWxfXaA9zQRSNXwdk
 r8rwtOaovegOo6o1HUJCg/s9ui+ahQx8i81Ilep0lRCVM1YL5Ya7eLM3XPcall2wdr
 NEU3r2veQiMqBBTkAKxXV0Z0hGWMrQ49LZ2Oc9EIKIlmd8e/P96we3PJ3k+xm87Iyd
 PjqHluCtgI4TdG3aR74Bm4/HowFJphatSUb0uJtGrSjVvBG3tohnSstK/XswWd1Nlh
 LEF1e0LOWZZ8wy3N6EZs1+FE1mjDJfDt665eEig6JIIhluVghGUm8HKOL6Nfom89lU
 /iohHw7aGBnig==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B20B917E1544;
 Wed,  8 Jan 2025 10:23:07 +0100 (CET)
Message-ID: <9f8c2da3-8cce-4fb2-a863-4d79f524f58b@collabora.com>
Date: Wed, 8 Jan 2025 10:23:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/33] drm/mediatek: mtk_hdmi: Move audio params
 selection to new function
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
 <20241217154345.276919-15-angelogioacchino.delregno@collabora.com>
 <03d20d6d77b54c25b9d7e65899a67359fae6130a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <03d20d6d77b54c25b9d7e65899a67359fae6130a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Il 20/12/24 04:47, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-12-17 at 16:43 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for splitting common bits of this driver, move the
>> audio params (codec, sample rate/size, input type, i2s format, etc)
>> selection to a new function called mtk_hdmi_audio_params().
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 46 +++++++++++++++++------------
>>   1 file changed, 27 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index d2f1d6286fbc..8f5ab97a0261 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1479,12 +1479,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>>    * HDMI audio codec callbacks
>>    */
>>
>> -static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
>> -                                   struct hdmi_codec_daifmt *daifmt,
>> -                                   struct hdmi_codec_params *params)
>> +static int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi,
>> +                                struct hdmi_codec_daifmt *daifmt,
>> +                                struct hdmi_codec_params *params)
>>   {
>> -       struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> -       struct hdmi_audio_param hdmi_params;
>> +       struct hdmi_audio_param aud_params = { 0 };
>>          unsigned int chan = params->cea.channels;
>>
>>          dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
>> @@ -1495,16 +1494,16 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
>>
>>          switch (chan) {
>>          case 2:
>> -               hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> +               aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>>                  break;
>>          case 4:
>> -               hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
>> +               aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
>>                  break;
>>          case 6:
>> -               hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
>> +               aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
>>                  break;
>>          case 8:
>> -               hdmi_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
>> +               aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
>>                  break;
>>          default:
>>                  dev_err(hdmi->dev, "channel[%d] not supported!\n", chan);
>> @@ -1528,26 +1527,35 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
>>
>>          switch (daifmt->fmt) {
>>          case HDMI_I2S:
>> -               hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> -               hdmi_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> -               hdmi_params.aud_input_type = HDMI_AUD_INPUT_I2S;
>> -               hdmi_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> -               hdmi_params.aud_mclk = HDMI_AUD_MCLK_128FS;
>> +               aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> +               aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> +               aud_params.aud_input_type = HDMI_AUD_INPUT_I2S;
>> +               aud_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> +               aud_params.aud_mclk = HDMI_AUD_MCLK_128FS;
>>                  break;
>>          case HDMI_SPDIF:
>> -               hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> -               hdmi_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> -               hdmi_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
>> +               aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> +               aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> +               aud_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
>>                  break;
>>          default:
>>                  dev_err(hdmi->dev, "%s: Invalid DAI format %d\n", __func__,
>>                          daifmt->fmt);
>>                  return -EINVAL;
>>          }
>> +       memcpy(&aud_params.codec_params, params, sizeof(aud_params.codec_params));
> 
> You copy to local variable, so this function does nothing.
> 
>> +
>> +       return 0;
>> +}
>>
>> -       memcpy(&hdmi_params.codec_params, params,
>> -              sizeof(hdmi_params.codec_params));
>> +static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
>> +                                   struct hdmi_codec_daifmt *daifmt,
>> +                                   struct hdmi_codec_params *params)
>> +{
>> +       struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> +       struct hdmi_audio_param hdmi_params;
>>
>> +       mtk_hdmi_audio_params(hdmi, daifmt, params);
>>          mtk_hdmi_audio_set_param(hdmi, &hdmi_params);
> 
> hdmi_params has not been initialized.

That was done on purpose: we are anyway rewriting all fields of that structure
with the call to mtk_hdmi_audio_set_param(), so if that was stack-initialized
to zero, that would be a double initialization.

Cheers,
Angelo

