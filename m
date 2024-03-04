Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EF8870E57
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A08112611;
	Mon,  4 Mar 2024 21:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EoTvg5VZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF08112611
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 21:43:04 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-412dda84216so15397085e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 13:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709588583; x=1710193383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y0WV0jwQBZsJcLmuwWex956CkPmkwWx0VAGntPbjYM8=;
 b=EoTvg5VZTXNDdYLFr9FMEp7H0Wl5O3zXmpJZPMtPsGv/q03PSkHJ5+h97yJe5o5bfT
 nsc0HoxE48t8g8Pg+g7zpxtN1njVvEchCcgv9OdxmzkRIxo5y9cxOyMP3nCPkuUasrFx
 JUjhB0gc0S4aITH83v9NR5T762nDK5bzid/rdh8rprUDkGj2e+1u5QCaQbTdeEHxItHx
 x8s9Nj52mTRtj+GwRBzZxhoe/QO67HpA2zig0h5/89BN9KcH8CL3ZcGI/jGDYXOnRr/P
 FWweQ3fyga7AFyR792XK78WtI5VkB/gsQKFaJWtro/UwfVqARD8JNh0lvR/s9Z69U2h3
 bH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709588583; x=1710193383;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0WV0jwQBZsJcLmuwWex956CkPmkwWx0VAGntPbjYM8=;
 b=cCjFs0+RmcyVsP+jyamtqHK0xWF/Bgui1LoN5OkJmHYuesnpWkPB4Og+dOfrFa44GD
 InPtHr+XB2S+ZA4r5F0oMi7iEccnJyJ5r6ilCFb1J3zAfl5iEoYgrF1Mdp9ETxtCN1qV
 93ElJH22XnbbEfnKH1jUB1wKCza4Rv/5OBDaSJKgNpKz4+bDrw9lmqttIcX/b591c/BE
 yj0Qe+TsbsWa9BzR0rfEx2swAQ9hZTuHBjH4ZLWeWl0qgN77FTKkQxdfpj+9Ge/Wth6l
 2d9K834LmdOnlS3OjQ7gV/7c/RUBzwTtOFx3d1c9ZDWjiLgDyps77RyCdH7aatP+XBZ3
 sOog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHAhJOKVInZEhId5p6oHw6Zh9MURIcYyuR0c2a0VoSfSi4HlyHonBhuuQ0oLTM+Bo/nVHYsOB5VM1HgltFNWKvKn8ZHazf6hwkjizZYF77
X-Gm-Message-State: AOJu0YzwVF07HvR1okmzgunntsxi844kKAyg8XhF6qYlZnA9+kdqP+Ai
 rMp6EeYupwnEiLeLyaJ01vvwZtEruoma77DzRGuHBVunpvrzEstUSAW5KiJFpUA=
X-Google-Smtp-Source: AGHT+IGdwPbU6QcEbB9P7le+/pUg8GqOczNkE8PcfWYyj6AsotD06BnVYlD9+IEm8fNe+f0ObiXcGw==
X-Received: by 2002:a5d:594b:0:b0:33d:f30:5689 with SMTP id
 e11-20020a5d594b000000b0033d0f305689mr7000761wri.30.1709588582788; 
 Mon, 04 Mar 2024 13:43:02 -0800 (PST)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c314600b00412e8c645a1sm1753289wmo.46.2024.03.04.13.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 13:43:02 -0800 (PST)
Message-ID: <3d8bcab2-70d3-432e-ad18-150230006223@linaro.org>
Date: Mon, 4 Mar 2024 21:43:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panel: add samsung s6e3fa7 panel driver
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Richard Acayan <mailingradian@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240209001639.387374-6-mailingradian@gmail.com>
 <20240209001639.387374-8-mailingradian@gmail.com>
 <daf91db8-c03c-412b-9f0e-8134a7a6e8d5@linaro.org>
In-Reply-To: <daf91db8-c03c-412b-9f0e-8134a7a6e8d5@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 04/03/2024 21:41, Caleb Connolly wrote:
> 
> 
> On 09/02/2024 00:16, Richard Acayan wrote:
>> The S6E3FA7 display controller is enabled in every Pixel 3a (non-XL)
>> variant. Add the driver for it, generated by
>> linux-mdss-dsi-panel-driver-generator.
>>
>> There are other panels connected to the same S6E3FA7 display controller,
>> such as the AMS604NL01 panel, which are incompatible with this driver.
>> Name the device tree compatible after the panel model according to
>> iFixit.
>>
>> Link: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
>> Link: https://android.googlesource.com/kernel/msm/+/7fda1cd7b64710dafac5f34899611c6d35eb4cd2/arch/arm64/boot/dts/google/dsi-panel-s6e3fa7-1080p-cmd.dtsi
>> Link: https://github.com/msm8953-mainline/linux/blob/v6.6.12-r0/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> Link: https://www.ifixit.com/Guide/Image/meta/muyjtLQTHu6MDkhK
>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>> ---
>>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>>  drivers/gpu/drm/panel/Makefile                |   1 +
>>  drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c | 285 ++++++++++++++++++
>>  3 files changed, 295 insertions(+)
>>  create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>>
> 
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> new file mode 100644
>> index 000000000000..10bc8fb5f1f9
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3fa7.c
>> @@ -0,0 +1,285 @@
> 
> [snip]
>> +
>> +static int s6e3fa7_panel_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct device *dev = &dsi->dev;
>> +	struct s6e3fa7_panel *ctx;
>> +	int ret;
>> +
>> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>> +	if (!ctx)
>> +		return -ENOMEM;
>> +
>> +	ctx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	if (IS_ERR(ctx->reset_gpio))
>> +		return dev_err_probe(dev, PTR_ERR(ctx->reset_gpio),
>> +				     "Failed to get reset-gpios\n");
>> +
>> +	ctx->dsi = dsi;
>> +	mipi_dsi_set_drvdata(dsi, ctx);
>> +
>> +	dsi->lanes = 4;
>> +	dsi->format = MIPI_DSI_FMT_RGB888;
>> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST |
> This flag is only used for video mode panels, you can drop it.

Nevermind, I should really check the dates before hitting reply :/
> 
> With that,
> 
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
>> +			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>> +
>> +	drm_panel_init(&ctx->panel, dev, &s6e3fa7_panel_funcs,
>> +		       DRM_MODE_CONNECTOR_DSI);
>> +	ctx->panel.prepare_prev_first = true;
>> +
>> +	ctx->panel.backlight = s6e3fa7_panel_create_backlight(dsi);
>> +	if (IS_ERR(ctx->panel.backlight))
>> +		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),
>> +				     "Failed to create backlight\n");
>> +
>> +	drm_panel_add(&ctx->panel);
>> +
>> +	ret = mipi_dsi_attach(dsi);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
>> +		drm_panel_remove(&ctx->panel);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void s6e3fa7_panel_remove(struct mipi_dsi_device *dsi)
>> +{
>> +	struct s6e3fa7_panel *ctx = mipi_dsi_get_drvdata(dsi);
>> +	int ret;
>> +
>> +	ret = mipi_dsi_detach(dsi);
>> +	if (ret < 0)
>> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
>> +
>> +	drm_panel_remove(&ctx->panel);
>> +}
>> +
>> +static const struct of_device_id s6e3fa7_panel_of_match[] = {
>> +	{ .compatible = "samsung,s6e3fa7-ams559nk06" },
>> +	{ /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, s6e3fa7_panel_of_match);
>> +
>> +static struct mipi_dsi_driver s6e3fa7_panel_driver = {
>> +	.probe = s6e3fa7_panel_probe,
>> +	.remove = s6e3fa7_panel_remove,
>> +	.driver = {
>> +		.name = "panel-samsung-s6e3fa7",
>> +		.of_match_table = s6e3fa7_panel_of_match,
>> +	},
>> +};
>> +module_mipi_dsi_driver(s6e3fa7_panel_driver);
>> +
>> +MODULE_AUTHOR("Richard Acayan <mailingradian@gmail.com>");
>> +MODULE_DESCRIPTION("DRM driver for Samsung S6E3FA7 command mode DSI panel");
>> +MODULE_LICENSE("GPL");
> 

-- 
// Caleb (they/them)
