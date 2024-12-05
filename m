Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7989E559A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 13:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A1F10EE2E;
	Thu,  5 Dec 2024 12:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oBL2+fFJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A1E10EE2E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733402179;
 bh=te7Fq4Bo3HG2cZ3InWv7OJj4fVdLIRE8o0P8loWm+X0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oBL2+fFJd7Uue7s+sKucSheC+bCKoHl/qx4RzhjKclRVRd1npg9MpzC3TgYxh69r0
 Q3X8VV2vqYcOUMh/KwpnLaCNWRvVmTNlUqIgAbHM0GAtHuazRSnVNDnKYR1xsrSZQR
 tCf+CpVzMffcpmhxGRcAekrGP6xc1MbNEukU3SoDjLJ2wsosEbLW2x04VlUFWlyqua
 pmyHaGZGV2UyROHl4NfynSLi4R+o4N2TwDQjusAFI3sIp1v2zZBBALrxsD2xgwQg09
 8u9QqC6fr9CKERkKZPDZTjAZdMTt07MZYRjrGR5p4lW5UvkHrYPIRz/06bn7qONJRP
 mDOc4ZokWgniQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 054A617E366D;
 Thu,  5 Dec 2024 13:36:18 +0100 (CET)
Message-ID: <f2862790-f613-4583-bec5-302e06c77d8d@collabora.com>
Date: Thu, 5 Dec 2024 13:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com, jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
 <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
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

Il 05/12/24 13:29, Dmitry Baryshkov ha scritto:
> On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
>> In preparation for adding a new driver for the HDMI TX v2 IP,
>> split out the functions that will be common between the already
>> present mtk_hdmi (v1) driver and the new one.
>>
>> Since the probe flow for both drivers is 90% similar, add a common
>> probe function that will be called from each driver's .probe()
>> callback, avoiding lots of code duplication.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>>   drivers/gpu/drm/mediatek/Makefile          |   1 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
>>   5 files changed, 729 insertions(+), 635 deletions(-)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>>
>> @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>>   	return 0;
>>   }
>>   
>> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
>> +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
>> +				    u8 *buffer_avi, size_t bufsz_avi,
>> +				    struct drm_display_mode *mode)
>>   {
>> -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
>> -
>> -	hdmi->csp = HDMI_COLORSPACE_RGB;
>> -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
>> -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
>> -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
>> -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
>> -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
>> -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
>> -
>> -	return 0;
>> +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
>> +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
> 
> Please use the HDMI Connector framework instead of handling everything
> on your own.
> 

Dmitry, my plan is to get the MediaTek HDMIv2 driver upstreamed *with* using
the HDMI helpers - this commit is only splitting the old HDMI v1 driver in
common parts and v1 handling.

This "handling everything on my own" is something that was already present
into the old v1 driver, I am *not adding* this code, but *moving it around*.

I cannot migrate the v1 driver to the HDMI helpers right now because in this
moment I have no way to test that and I don't want to break any functionality.

If you check patch 15, you'll see that I am indeed using all of the helper
goodies - but for now only on the new driver, and not on the old one.

I do plan to migrate the v1 driver to the new helpers as well, but I would
(please) really prefer to do that only after the v2 driver is upstreamed.

Is that okay for you?

Cheers,
Angelo

>>   }
>>   
>>   static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
> 



