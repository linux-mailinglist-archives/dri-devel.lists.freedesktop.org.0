Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D036544E391
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A74E6EC3E;
	Fri, 12 Nov 2021 09:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4E46EC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 09:01:33 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id i12so6293440wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 01:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6zeYKv3UUBY47fsPaTEYjO4IJtTKePNyCptB9i6Qx6Q=;
 b=5roulA2RPyDqYkQQOois0Vwc2MUfueT2BMNXq/h1K9U8zOvM2wweKLg2jdeuF3qEdz
 hNA/HZX1YOzV7kwfTS/7yXzFtxlxEWY1swr6wK9lW6qa7IMOBb2PC88Bg4aXgJ4xYUKI
 h+yw40BCJHAfr4DGfZfewvly3EvvptH22j2NmDPp9LONDpAUfIJdVqn/XwdsxxDjH4lp
 NFD6DhMTEwTTysi+nCdljFq9kGpx7h/cEbtQxcDm5eWzHhl0LU8e2NkGARI8I2Rl9Mq3
 y+/WBKaC+dEgSCX7KsFs8V8fFZc4TlDZFu+Ng9JZeBSDUguy0CuNJnQPpP2yzduKXEuN
 4QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=6zeYKv3UUBY47fsPaTEYjO4IJtTKePNyCptB9i6Qx6Q=;
 b=snEqrrd4/K9GUi6OqSC7Twn9lJoYejdioQYvux3z82GFwFnezmLQ5hwIQKWBItVtna
 c1OjyoJ+tcD1dw4VrUZZHYHSE56fzNL6VSAIkmzT3OiCE/5mbtfyjaqi1f9rSOLRG+ch
 iUFG+zYFn1EPLlo2cIU6W79xeZXccWj7AFM7dCsgnMDZo+M6roZ84hEwtvY1clHfZLyE
 HQ0bsnogngslh7uE/vvd08ohvu2d/IPU+WlroTRgQBYJxcPDdW1fdWmLWqQsMRyLnG9T
 BKOOifiPrcIp01Yh6A9eo8YyeMZ8eQyiyzB4zHPXKbZJO57TLmMXEOVmstZmqLboVbib
 Gnog==
X-Gm-Message-State: AOAM533WkU0MMIKHWvooQLguyGhDfq5kkE++xz4dwaeTblDpSFa95jB6
 gSHu14h1zW7En+Ns1f0BuDXwNw==
X-Google-Smtp-Source: ABdhPJz6bTGxdajoaeMUPV93t2bbfAlMXb+J0jsSds0VxHFXOBwH8fjF9tZgdC/VafO1uJySMTDKbw==
X-Received: by 2002:a05:600c:1f13:: with SMTP id
 bd19mr16669651wmb.9.1636707691963; 
 Fri, 12 Nov 2021 01:01:31 -0800 (PST)
Received: from [172.20.10.7] ([37.165.179.130])
 by smtp.gmail.com with ESMTPSA id e12sm6363948wrq.20.2021.11.12.01.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 01:01:31 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: handle ELD when
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se
References: <20211029135947.3022875-1-narmstrong@baylibre.com>
 <5763693.lOV4Wx5bFT@kista>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fa1e0e69-bb37-272b-cfb4-4f45df8a0fa1@baylibre.com>
Date: Fri, 12 Nov 2021 10:01:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5763693.lOV4Wx5bFT@kista>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jernej,

On 10/11/2021 20:20, Jernej Škrabec wrote:
> Hi Neil,
> 
> sorry for late response.
> 
> Dne petek, 29. oktober 2021 ob 15:59:47 CET je Neil Armstrong napisal(a):
>> The current ELD handling takes the internal connector ELD buffer and
>> shares it to the I2S and AHB sub-driver.
>>
>> But with DRM_BRIDGE_ATTACH_NO_CONNECTOR, the connector is created
>> elsewhere (not not), and an eventual connector is known only
> 
> ^ typo, 2x "not"

thx, fixing while applying !

> 
> Other than that, it looks good.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applying to drm-misc-next

Thanks,
Neil

> 
> Best regards,
> Jernej
> 
>> if the bridge chain up to a connector is enabled.
>>
>> The current dw-hdmi code gets the current connector from
>> atomic_enable() so use the already stored connector pointer and
>> replace the buffer pointer with a callback returning the current
>> connector ELD buffer.
>>
>> Since a connector is not always available, either pass an empty
>> ELD to the alsa HDMI driver or don't call snd_pcm_hw_constraint_eld()
>> in AHB driver.
>>
>> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 10 +++++++---
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h     |  4 ++--
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c |  9 ++++++++-
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 12 ++++++++++--
>>  4 files changed, 27 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/
> gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
>> index d0db1acf11d7..7d2ed0ed2fe2 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
>> @@ -320,13 +320,17 @@ static int dw_hdmi_open(struct snd_pcm_substream 
> *substream)
>>  	struct snd_pcm_runtime *runtime = substream->runtime;
>>  	struct snd_dw_hdmi *dw = substream->private_data;
>>  	void __iomem *base = dw->data.base;
>> +	u8 *eld;
>>  	int ret;
>>  
>>  	runtime->hw = dw_hdmi_hw;
>>  
>> -	ret = snd_pcm_hw_constraint_eld(runtime, dw->data.eld);
>> -	if (ret < 0)
>> -		return ret;
>> +	eld = dw->data.get_eld(dw->data.hdmi);
>> +	if (eld) {
>> +		ret = snd_pcm_hw_constraint_eld(runtime, eld);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>>  
>>  	ret = snd_pcm_limit_hw_rates(runtime);
>>  	if (ret < 0)
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/
> drm/bridge/synopsys/dw-hdmi-audio.h
>> index cb07dc0da5a7..f72d27208ebe 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
>> @@ -9,15 +9,15 @@ struct dw_hdmi_audio_data {
>>  	void __iomem *base;
>>  	int irq;
>>  	struct dw_hdmi *hdmi;
>> -	u8 *eld;
>> +	u8 *(*get_eld)(struct dw_hdmi *hdmi);
>>  };
>>  
>>  struct dw_hdmi_i2s_audio_data {
>>  	struct dw_hdmi *hdmi;
>> -	u8 *eld;
>>  
>>  	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
>>  	u8 (*read)(struct dw_hdmi *hdmi, int offset);
>> +	u8 *(*get_eld)(struct dw_hdmi *hdmi);
>>  };
>>  
>>  #endif
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/
> gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> index feb04f127b55..f50b47ac11a8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
>> @@ -135,8 +135,15 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void 
> *data, uint8_t *buf,
>>  			       size_t len)
>>  {
>>  	struct dw_hdmi_i2s_audio_data *audio = data;
>> +	u8 *eld;
>> +
>> +	eld = audio->get_eld(audio->hdmi);
>> +	if (eld)
>> +		memcpy(buf, eld, min_t(size_t, MAX_ELD_BYTES, len));
>> +	else
>> +		/* Pass en empty ELD if connector not available */
>> +		memset(buf, 0, len);
>>  
>> -	memcpy(buf, audio->eld, min_t(size_t, MAX_ELD_BYTES, len));
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/
> bridge/synopsys/dw-hdmi.c
>> index 62ae63565d3a..54d8fdad395f 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -757,6 +757,14 @@ static void hdmi_enable_audio_clk(struct dw_hdmi *hdmi, 
> bool enable)
>>  	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
>>  }
>>  
>> +static u8 *hdmi_audio_get_eld(struct dw_hdmi *hdmi)
>> +{
>> +	if (!hdmi->curr_conn)
>> +		return NULL;
>> +
>> +	return hdmi->curr_conn->eld;
>> +}
>> +
>>  static void dw_hdmi_ahb_audio_enable(struct dw_hdmi *hdmi)
>>  {
>>  	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
>> @@ -3432,7 +3440,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device 
> *pdev,
>>  		audio.base = hdmi->regs;
>>  		audio.irq = irq;
>>  		audio.hdmi = hdmi;
>> -		audio.eld = hdmi->connector.eld;
>> +		audio.get_eld = hdmi_audio_get_eld;
>>  		hdmi->enable_audio = dw_hdmi_ahb_audio_enable;
>>  		hdmi->disable_audio = dw_hdmi_ahb_audio_disable;
>>  
>> @@ -3445,7 +3453,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device 
> *pdev,
>>  		struct dw_hdmi_i2s_audio_data audio;
>>  
>>  		audio.hdmi	= hdmi;
>> -		audio.eld	= hdmi->connector.eld;
>> +		audio.get_eld	= hdmi_audio_get_eld;
>>  		audio.write	= hdmi_writeb;
>>  		audio.read	= hdmi_readb;
>>  		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
>> -- 
>> 2.25.1
>>
>>
> 
> 

