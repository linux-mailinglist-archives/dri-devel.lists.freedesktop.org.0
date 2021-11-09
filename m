Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2044AED5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:35:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96EC6E87A;
	Tue,  9 Nov 2021 13:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6146E87A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 13:35:49 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so33055321wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 05:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xB1EPUZ01+bR4Qy8k+6R9n9yzVkP7A0Pxo+11mupigk=;
 b=g5HU4zdHhyrtwC418bMyl19AjZiNDRMY1VUwCG63iDPjCGNerJodLsz4IK/XdWCmNr
 nUiSvHcbRnUWKBe1KOQDTChJNDFG3il13VB4lPMNROFUpQe76pJJLtNnM8I9kLoiGOMP
 RmsVteP2o5Xd8DosXLtafqfxJVBk/6meQmiOjTiBUjCSA//ynSdPw3OoGuwDP49o3YMb
 hWwXt7URKXE7goHLJq6hXe8sYPD8upqyRqXefKAe6gP0u/SD1KkWo6DZYlRlrCtP1izS
 sR6fFhnqTzCQDNkvXDNEAvMqxYpEunIZAc2g3/OtMEosXafooA4YXFzYyxGx+wwLJ/Ce
 bA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xB1EPUZ01+bR4Qy8k+6R9n9yzVkP7A0Pxo+11mupigk=;
 b=vxfug9nQywH3xXzO/Vw3Pqe82JgiVlRMdLWjT89qO9s6R1PQo5c7K01DGO9byZUVxE
 ifOXTBzgwyddr5MkiiZ86m9MAT5VGjiCeyD/1x/K3URqwx789u4fdcLlaPS/32hu1UxX
 gC0DPfp9hnkveTi9++AX+95woNQBWD4s18XkTQVVGtTZEBt65iK38KlR005L+Za0LVoI
 DmjysLzLwEgxc4ZE581YhJqh0dQv1Aeqyky5Bqgf2RFRhZO72huRDLPmfNDp3H/FHmWD
 ICSORyuPjGWnLcNPqPDkvtsMJUsg2zwW7ut2uwJssCHRMbUTeUc02wxLmXSuhOCiuB1B
 ZqXQ==
X-Gm-Message-State: AOAM533FLDkD79aRSZoJsrAMKR3oV5gNa1G+VclKLHpIEg8BAToamIY1
 hiJPyczShjHy9EbEUm2FuMNoyg==
X-Google-Smtp-Source: ABdhPJzcaBpDPkocXItj5BhODDI3y8fTdf3sZ4Ni6ES1Qg5qPT3LBcZQ6NDNLMJ439KYFzg5JSC+Yw==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr9074591wrm.269.1636464948082; 
 Tue, 09 Nov 2021 05:35:48 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:d284:de3f:b3d6:f714?
 ([2001:861:44c0:66c0:d284:de3f:b3d6:f714])
 by smtp.gmail.com with ESMTPSA id o25sm2649556wms.17.2021.11.09.05.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 05:35:47 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: dw-hdmi: handle ELD when
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
 robert.foss@linaro.org, jonas@kwiboo.se, jernej.skrabec@gmail.com
References: <20211029135947.3022875-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <ef00f841-c9ee-9866-e7c8-6e73ec6323d3@baylibre.com>
Date: Tue, 9 Nov 2021 14:35:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029135947.3022875-1-narmstrong@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi drm/bridge maintainers,

On 29/10/2021 15:59, Neil Armstrong wrote:
> The current ELD handling takes the internal connector ELD buffer and
> shares it to the I2S and AHB sub-driver.
> 
> But with DRM_BRIDGE_ATTACH_NO_CONNECTOR, the connector is created
> elsewhere (not not), and an eventual connector is known only
> if the bridge chain up to a connector is enabled.
> 
> The current dw-hdmi code gets the current connector from
> atomic_enable() so use the already stored connector pointer and
> replace the buffer pointer with a callback returning the current
> connector ELD buffer.
> 
> Since a connector is not always available, either pass an empty
> ELD to the alsa HDMI driver or don't call snd_pcm_hw_constraint_eld()
> in AHB driver.
> 
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 10 +++++++---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h     |  4 ++--
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c |  9 ++++++++-
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c           | 12 ++++++++++--
>  4 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> index d0db1acf11d7..7d2ed0ed2fe2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> @@ -320,13 +320,17 @@ static int dw_hdmi_open(struct snd_pcm_substream *substream)
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_dw_hdmi *dw = substream->private_data;
>  	void __iomem *base = dw->data.base;
> +	u8 *eld;
>  	int ret;
>  
>  	runtime->hw = dw_hdmi_hw;
>  
> -	ret = snd_pcm_hw_constraint_eld(runtime, dw->data.eld);
> -	if (ret < 0)
> -		return ret;
> +	eld = dw->data.get_eld(dw->data.hdmi);
> +	if (eld) {
> +		ret = snd_pcm_hw_constraint_eld(runtime, eld);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	ret = snd_pcm_limit_hw_rates(runtime);
>  	if (ret < 0)
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> index cb07dc0da5a7..f72d27208ebe 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-audio.h
> @@ -9,15 +9,15 @@ struct dw_hdmi_audio_data {
>  	void __iomem *base;
>  	int irq;
>  	struct dw_hdmi *hdmi;
> -	u8 *eld;
> +	u8 *(*get_eld)(struct dw_hdmi *hdmi);
>  };
>  
>  struct dw_hdmi_i2s_audio_data {
>  	struct dw_hdmi *hdmi;
> -	u8 *eld;
>  
>  	void (*write)(struct dw_hdmi *hdmi, u8 val, int offset);
>  	u8 (*read)(struct dw_hdmi *hdmi, int offset);
> +	u8 *(*get_eld)(struct dw_hdmi *hdmi);
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> index feb04f127b55..f50b47ac11a8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
> @@ -135,8 +135,15 @@ static int dw_hdmi_i2s_get_eld(struct device *dev, void *data, uint8_t *buf,
>  			       size_t len)
>  {
>  	struct dw_hdmi_i2s_audio_data *audio = data;
> +	u8 *eld;
> +
> +	eld = audio->get_eld(audio->hdmi);
> +	if (eld)
> +		memcpy(buf, eld, min_t(size_t, MAX_ELD_BYTES, len));
> +	else
> +		/* Pass en empty ELD if connector not available */
> +		memset(buf, 0, len);
>  
> -	memcpy(buf, audio->eld, min_t(size_t, MAX_ELD_BYTES, len));
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 62ae63565d3a..54d8fdad395f 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -757,6 +757,14 @@ static void hdmi_enable_audio_clk(struct dw_hdmi *hdmi, bool enable)
>  	hdmi_writeb(hdmi, hdmi->mc_clkdis, HDMI_MC_CLKDIS);
>  }
>  
> +static u8 *hdmi_audio_get_eld(struct dw_hdmi *hdmi)
> +{
> +	if (!hdmi->curr_conn)
> +		return NULL;
> +
> +	return hdmi->curr_conn->eld;
> +}
> +
>  static void dw_hdmi_ahb_audio_enable(struct dw_hdmi *hdmi)
>  {
>  	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
> @@ -3432,7 +3440,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  		audio.base = hdmi->regs;
>  		audio.irq = irq;
>  		audio.hdmi = hdmi;
> -		audio.eld = hdmi->connector.eld;
> +		audio.get_eld = hdmi_audio_get_eld;
>  		hdmi->enable_audio = dw_hdmi_ahb_audio_enable;
>  		hdmi->disable_audio = dw_hdmi_ahb_audio_disable;
>  
> @@ -3445,7 +3453,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  		struct dw_hdmi_i2s_audio_data audio;
>  
>  		audio.hdmi	= hdmi;
> -		audio.eld	= hdmi->connector.eld;
> +		audio.get_eld	= hdmi_audio_get_eld;
>  		audio.write	= hdmi_writeb;
>  		audio.read	= hdmi_readb;
>  		hdmi->enable_audio = dw_hdmi_i2s_audio_enable;
> 

Is there someone who can have a look at this ?

I won't push https://lore.kernel.org/r/20211020123947.2585572-1-narmstrong@baylibre.com until this is fixed
because with DRM_BRIDGE_ATTACH_NO_CONNECTOR we loose the ELD on the HDMI sound card,

Neil
