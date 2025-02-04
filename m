Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FBFA26917
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 01:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED42210E1FD;
	Tue,  4 Feb 2025 00:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LFQwE6kz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AA910E1FD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 00:53:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-543d8badc30so5325001e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Feb 2025 16:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738630431; x=1739235231; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n6vuKBBYDtQlrKgG61Z1x3H3QFhGAszRb9TzwuI7sqo=;
 b=LFQwE6kzxF3IWt0TpSaeOExwbUpP7rlh6T/x7FDrMfNpSys4WV0CaROruYO3Gh2OHA
 lycGQvqt4f5OiJ3hRLwZIUjagdTpFKs4AYPUVItlwx8RM2FXYdyePY9ulmzfOvqFF04Y
 4Nn2gGFqWdNuAk31UmpeGmdqMBXtxs0Vrdt48+Q8TeL2zBU0KH1WG/dTJS3iTLRaLKRn
 ekiBC0SdEHO1oSvyOLcUX1E3P+g38jEEHhLv0F61qJOMlBUhyqovyERumWDViIp3wKsO
 f7anoYWd6E0msGynJ7lGr9bNWrPOTdKpiCJwW7t/epnWn5InwYy/IiXS2AB35eZpFbgV
 bmow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738630431; x=1739235231;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n6vuKBBYDtQlrKgG61Z1x3H3QFhGAszRb9TzwuI7sqo=;
 b=ML85Gcgk/iOMg9+JluNGAGHZCUH6bEtVIFDMfdRWvgw4PeEQyDo8gnUH2CeYCqdVor
 kLs1TzqnzysAL5KTyp77AKJS4S8OHV3LvkxNNlUt0+7QXJwDNXycFfDXrHOgLAmxzEfi
 9RTRz52i/NdAENHwM53vxGguAM+nUHVAwMXcfWwSgAwEWrZt3ipR36caDkf0EWgF5go2
 I+x2F+3JYrnExdhz4KCHAOt8AxH3cvE7HrbdPSdziDmgKQD3Z1cRgW5leditzIPUj0Sf
 ql7GeokIXGAYZSz8W10zNoH4hemkKFnz/zwaGsKbcXPDQR7B6unujHS7O2Ermlo2HTL/
 oHjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgza3QDdZqFcftXHrGLbPSkftjEswNOOWZ1FtA25KUHZoBG8XjkhrMoTWFJEDuR49lZuUAMJmU0EU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw052xy1B+jYuazaSu5q6R6YT+cZZH3ICAY+sCgVPdQQPDtvn5X
 FI1y+X7tvkJ/DM4TFvH54VJgjRD4ZwR+pkqMMHXPbLtv/qM7v1pr1f+s+0CIEho=
X-Gm-Gg: ASbGncui2X5taxOhGbgac47iGU6+UjK3UshHFKkld4zK5M5sjFz5YLabMKp1d1vdMvP
 Uv/aM6mk/jjBzKI/uS1sL9g3sy5czGZjFbWPh4viZXnmHQ2qdM8wMLG/i7q1VVHzMw8T5CotuTI
 4nbLH7EwsmJwzxPFBjbHpYZk1UEMc66ci3eIopniqdR8704osVICI3zz0u1YlfVFN7s5kVU+1bN
 MId+7s0lk2Q44MC+ZpM7mCMqlFOkyRNN2FXTfKk6JJlX/0GH67kF/cZQgtrkRvjKSkTJcMCbX+N
 0qZZF1B+G9cRqNvL8UZXbMiC5exkd7DzNIklmlkxYkj7rgHNezsHRDdaWFZfxZoNswv/F7Y=
X-Google-Smtp-Source: AGHT+IFIPKJEQNA5tK1YiM+VNhZ5WPU2MCgZV77JwlTQH8IKAw7+yQkyR1eqXdmPkWOKHrIkKOF0rg==
X-Received: by 2002:a05:6512:e85:b0:542:97b9:89e8 with SMTP id
 2adb3069b0e04-543e4c00dccmr7600330e87.23.1738630431219; 
 Mon, 03 Feb 2025 16:53:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebeb7f20sm1432933e87.164.2025.02.03.16.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 16:53:50 -0800 (PST)
Date: Tue, 4 Feb 2025 02:53:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: rafael@beims.me
Cc: Adrien Grassein <adrien.grassein@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Rafael Beims <rafael.beims@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/bridge: lt8912b: Add support for audio
Message-ID: <jqvns5poyixrbg7ql6txyqltyi5shi45a2npier4f5lgsnjkas@5ljhotjsk2y7>
References: <20250203192401.244651-1-rafael@beims.me>
 <20250203192401.244651-3-rafael@beims.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250203192401.244651-3-rafael@beims.me>
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

On Mon, Feb 03, 2025 at 04:23:56PM -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Add support for HDMI codec with audio coming from the I2S input.
> Support 48kHz and 96kHz sample rate, with 16 bits word size.
> 
> Co-developed-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>

Please turn the bridge to support DRM_BRIDGE_OP_HDMI and then use
drm_hdmi_audio_helper features to provide audio support. Your
implementations misses ELD, plugged callback, etc.

> ---
>  drivers/gpu/drm/bridge/Kconfig           |   1 +
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 107 ++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa..489ce1041203 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -117,6 +117,7 @@ config DRM_ITE_IT6505
>  
>  config DRM_LONTIUM_LT8912B
>  	tristate "Lontium LT8912B DSI/HDMI bridge"
> +	select SND_SOC_HDMI_CODEC if SND_SOC
>  	depends on OF
>  	select DRM_PANEL_BRIDGE
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> index 52da204f5740..2100b41e5f61 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -8,6 +8,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  
>  #include <drm/drm_probe_helper.h>
> @@ -16,6 +18,8 @@
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  
> +#include <sound/hdmi-codec.h>
> +
>  #include <video/videomode.h>
>  
>  #define I2C_MAIN 0
> @@ -24,7 +28,10 @@
>  #define I2C_CEC_DSI 1
>  #define I2C_ADDR_CEC_DSI 0x49
>  
> -#define I2C_MAX_IDX 2
> +#define I2C_AUDIO 2
> +#define I2C_ADDR_AUDIO 0x4a
> +
> +#define I2C_MAX_IDX 3
>  
>  struct lt8912 {
>  	struct device *dev;
> @@ -38,6 +45,7 @@ struct lt8912 {
>  	struct drm_bridge *hdmi_port;
>  
>  	struct mipi_dsi_device *dsi;
> +	struct platform_device *audio_pdev;
>  
>  	struct gpio_desc *gp_reset;
>  
> @@ -226,6 +234,7 @@ static int lt8912_init_i2c(struct lt8912 *lt, struct i2c_client *client)
>  	struct i2c_board_info info[] = {
>  		{ I2C_BOARD_INFO("lt8912p0", I2C_ADDR_MAIN), },
>  		{ I2C_BOARD_INFO("lt8912p1", I2C_ADDR_CEC_DSI), },
> +		{ I2C_BOARD_INFO("lt8912p2", I2C_ADDR_AUDIO), },
>  	};
>  
>  	if (!lt)
> @@ -754,6 +763,97 @@ static int lt8912_put_dt(struct lt8912 *lt)
>  	return 0;
>  }
>  
> +static int lt8912_hdmi_hw_params(struct device *dev, void *data,
> +				 struct hdmi_codec_daifmt *fmt,
> +				 struct hdmi_codec_params *hparms)
> +{
> +	struct lt8912 *lt = data;
> +	unsigned int audio_params = 0x08; /* 16 bit word size */
> +
> +	if (hparms->sample_width != 16)
> +		return -EINVAL;
> +
> +	if (hparms->sample_rate == 48000)
> +		audio_params |= 0x20;
> +	else if (hparms->sample_rate == 96000)
> +		audio_params |= 0xa0;
> +	else
> +		return -EINVAL;
> +
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x0f, audio_params);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x35, 0x00);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x36, 0x18);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x37, 0x00);
> +
> +	return 0;
> +}
> +
> +static int lt8912_audio_startup(struct device *dev, void *data)
> +{
> +	struct lt8912 *lt = data;
> +
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x34, 0xe2);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x3c, 0x60);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x07, 0xf0);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x06, 0x08);
> +
> +	return 0;
> +}
> +
> +static void lt8912_audio_shutdown(struct device *dev, void *data)
> +{
> +	struct lt8912 *lt = data;
> +
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x06, 0x00);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x07, 0x00);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x34, 0x52);
> +	regmap_write(lt->regmap[I2C_AUDIO], 0x3c, 0x40);
> +}
> +
> +static int lt8912_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
> +				      struct device_node *endpoint)
> +{
> +	struct of_endpoint of_ep;
> +	int ret;
> +
> +	ret = of_graph_parse_endpoint(endpoint, &of_ep);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (of_ep.port != 2)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static const struct hdmi_codec_ops lt8912_codec_ops = {
> +	.hw_params = lt8912_hdmi_hw_params,
> +	.audio_shutdown = lt8912_audio_shutdown,
> +	.audio_startup = lt8912_audio_startup,
> +	.get_dai_id = lt8912_hdmi_i2s_get_dai_id,
> +};
> +
> +static int lt8912_audio_init(struct device *dev, struct lt8912 *lt)
> +{
> +	struct hdmi_codec_pdata codec_data = {
> +		.ops = &lt8912_codec_ops,
> +		.max_i2s_channels = 2,
> +		.i2s = 1,
> +		.data = lt,
> +	};
> +
> +	lt->audio_pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
> +						       PLATFORM_DEVID_AUTO,
> +						       &codec_data, sizeof(codec_data));
> +
> +	return PTR_ERR_OR_ZERO(lt->audio_pdev);
> +}
> +
> +static void lt8912_audio_exit(struct lt8912 *lt)
> +{
> +	platform_device_unregister(lt->audio_pdev);
> +}
> +
>  static int lt8912_probe(struct i2c_client *client)
>  {
>  	static struct lt8912 *lt;
> @@ -788,6 +888,10 @@ static int lt8912_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_attach;
>  
> +	ret = lt8912_audio_init(dev, lt);
> +	if (ret)
> +		goto err_attach;
> +
>  	return 0;
>  
>  err_attach:
> @@ -803,6 +907,7 @@ static void lt8912_remove(struct i2c_client *client)
>  {
>  	struct lt8912 *lt = i2c_get_clientdata(client);
>  
> +	lt8912_audio_exit(lt);
>  	drm_bridge_remove(&lt->bridge);
>  	lt8912_free_i2c(lt);
>  	lt8912_put_dt(lt);
> -- 
> 2.47.2
> 

-- 
With best wishes
Dmitry
