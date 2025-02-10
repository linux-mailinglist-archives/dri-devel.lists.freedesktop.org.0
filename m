Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FEA2EAD6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 12:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D67110E059;
	Mon, 10 Feb 2025 11:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ESmPJunG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4482210E059
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739186129;
 bh=yghw6cquksN8zPqbgLipZY4BM8xR8DkXkhGUySC4WRA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ESmPJunGKo+yuyT+lTgsSKQkXws5Oh5vtwZRmhalZJPGz9I7fqqA1b5qZVgeScorm
 7fiHrJE9BW5p5by+M6fn++6G8oZZp16w+p+0puAsBVg0drC36ANH0wqBpmez62KFz7
 U/2nXk7Bg7CokDrDbVCEGM9y1xZsPTIrn4rGMvVKsyY/RN5V/eRJjdoO4sF5ybqdzg
 vV9FGtZz+Co5iGC1twH5yDOfNG3gsXGQbIwjW0UUAnQOjQfGR/7Mg/JdUhfQSZT6zq
 P5kFUrMn3pteKxxx7JLw0nZPSPCdNyBhww+p+UUE0vQaNSi76MZXeSP7LDMP0778/m
 gn1No4pdI4JfQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9548817E014F;
 Mon, 10 Feb 2025 12:15:28 +0100 (CET)
Message-ID: <98caee8a-b78e-4dcb-96d9-37fd4f279e68@collabora.com>
Date: Mon, 10 Feb 2025 12:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/34] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
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
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-24-angelogioacchino.delregno@collabora.com>
 <1d5a94f3b974d4617a58f2d9dfc54d5dc889f18a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1d5a94f3b974d4617a58f2d9dfc54d5dc889f18a.camel@mediatek.com>
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

Il 07/02/25 06:46, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> In preparation for moving the common bits of this driver, merge the
>> contents of mtk_hdmi_output_init in mtk_hdmi_register_audio_driver
>> function to aggregate all of the initial audio setup together in
>> the same function and to make it clear that all of the setup that
>> is performed in mtk_hdmi_output_init is specifically related only
>> to audio and not video.
>>
>> While at it, also remove the "%s driver bound to HDMI" debugging
>> print disguised as informative.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 28 ++++++++--------------------
>>   1 file changed, 8 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index e2393f7558f9..4345c91e92e7 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1025,20 +1025,6 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>>          return 0;
>>   }
>>
>> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
>> -{
>> -       struct hdmi_audio_param *aud_param = &hdmi->aud_param;
>> -
>> -       aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> -       aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> -       aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
>> -       aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> -       aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
>> -       aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> -
>> -       return 0;
>> -}
>> -
>>   static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
>>   {
>>          mtk_hdmi_hw_send_aud_packet(hdmi, true);
>> @@ -1616,6 +1602,7 @@ static void mtk_hdmi_unregister_audio_driver(void *data)
>>   static int mtk_hdmi_register_audio_driver(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> +       struct hdmi_audio_param *aud_param = &hdmi->aud_param;
>>          struct hdmi_codec_pdata codec_data = {
>>                  .ops = &mtk_hdmi_audio_codec_ops,
>>                  .max_i2s_channels = 2,
>> @@ -1625,6 +1612,13 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
>>          };
>>          int ret;
>>
>> +       aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> +       aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> +       aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
>> +       aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> +       aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
>> +       aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> +
>>          hdmi->audio_pdev = platform_device_register_data(dev,
>>                                                           HDMI_CODEC_DRV_NAME,
>>                                                           PLATFORM_DEVID_AUTO,
>> @@ -1638,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
>>          if (ret)
>>                  return ret;
>>
>> -       DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
> 
> This modification is not related to the title. If necessary, separate this to another patch.
> But I don't know why remove this. Could you explain more?
> 

It's a cleanup... if every driver in the kernel said "bound to" or "registered",
the kernel log would be extremely long and unreadable... so that's why this print
was removed.

I can separate this to a different patch if you want, even though that'd be
overkill, imo.

Cheers,
Angelo

> Regards,
> CK
> 
>>          return 0;
>>   }
>>
>> @@ -1667,11 +1660,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
>>          mutex_init(&hdmi->update_plugged_status_lock);
>>          platform_set_drvdata(pdev, hdmi);
>>
>> -       ret = mtk_hdmi_output_init(hdmi);
>> -       if (ret)
>> -               return dev_err_probe(dev, ret,
>> -                                    "Failed to initialize hdmi output\n");
>> -
>>          ret = mtk_hdmi_register_audio_driver(dev);
>>          if (ret)
>>                  return dev_err_probe(dev, ret,
>> --
>> 2.47.0
>>
> 

