Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7E8A793C9
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2A10E869;
	Wed,  2 Apr 2025 17:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OReP0Cu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D8110E869
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 17:24:27 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6ecfbf8fa76so293856d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743614667; x=1744219467; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=;
 b=OReP0Cu3Y90IKWSgMkx//ov4ecK4lVgudZEuiR22pYpwfay2dznbve22jUromGTYoF
 aTU8rH8jKln/jzSjek3YQyl+XWCoe7L6YkZ2cUrBbGXWgnAXWxUIo7YEBTS6m1xQ9PVI
 spQuU36zz23aLM48pr0nbErlAt07scqelMz9Ghf7xC4H+lbzfXpQlBT92Hi/5gcH5lV0
 anu+I2KhJkD04LDuVbWaIz5C/x3yB85zsPZyJKp8nzdJCZWSg+DanFYsXoemy4JfJryM
 u3v0XwSuaxWNeiLAjoHFaloVm0V8sXiIRK2zDVijxyfyOQzgOFppde8YpFd9fe6XZwRW
 DUyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743614667; x=1744219467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=;
 b=c4rVDEob/CUjAqSbn/30mUjKxfCBXjAH3L4KB4bfN+qCEZpX5kIqJ/XmdGmigbRpBt
 /DjBKqeAKEYibYz+z8K/RkXfq8TfUBWU7DOlphv0PKY/0Vxr507036FPrmpZSSjOZ8nS
 z/tNNzsCxb0enTBoVLtnsVQDQCRXsUAT8haawyKkh/iJT2l6OZ4S1bWJ3iFMtrL/UEN/
 TjvIpKDOsO+DVjmr8Jj80Pk062cZGSONryPf346nqCM/3gnWKM4IJq9e5H1uXtFSbG1Q
 YZrDlC4zzDKuCdNHr0LIjUP0ubmM9tPvbS53lMNnmih2TArVHfjmV/DyI5CtJaCwa/kC
 Egtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3U4WpiUUcDUl5grGSknfm05mQWfGRtxZl41T+HP+Y2NY3mw/+9Bz/NUaZtpQAjb/xcH+fohKcp7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2WkgdWTnvfRy2ISvoZANVKtaZZLyFYLfF+fi59IX3WMeqQJQO
 vhzkBx+ZXGLeI5MSQEQWnZr/IfkmXRzyysJkIHtWTlC1tkUzC1c=
X-Gm-Gg: ASbGncvxTUfgCZLwMJzj1v+n4qUeIjzxfwyDXiNh8qEW9He6rZjEKCWN9Dc64NcT+J/
 dux4VseIvodAAAf3zAIyLgf7edSqpcDS3WgIYJp9eDx6qBva3/KJMVCHGpx4bqFEgvAmWRudWSP
 QIwz6YW2nYG/1TLLZrnuOL99PIgsfufDHFMP/ZuBbtmnCcxueFsmCG3KpJWogE+s6v3w/HM7tGO
 ScrARaqluT75EO6wqyEtWJaOYR7mlyLV4+M2FNaoVApEFERNMw0LzpQl1SHvPdNVj+cEkoVQpAh
 SqDCm2naiGEw7kejgyvXsOKScct5vLarHIG/aNRy4S6vZYIIDHHEOAhtVJtRUbwnaSxFx44MkbD
 iO44fbXW5UfY7
X-Google-Smtp-Source: AGHT+IFMVDYLTn3P+AqF4w5EM6NFHR4DM/rUbBAs9Vcoe+DJhPsyf1ed5wxi6pxvZTB9jpF+/uNqvQ==
X-Received: by 2002:a05:6214:258f:b0:6e8:f770:5045 with SMTP id
 6a1803df08f44-6eed6271744mr284133846d6.28.1743614666448; 
 Wed, 02 Apr 2025 10:24:26 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:edfc:c609:ae5:4b2c?
 ([2a02:810b:f13:8500:edfc:c609:ae5:4b2c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eec9643d6asm77042556d6.28.2025.04.02.10.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 10:24:26 -0700 (PDT)
Message-ID: <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
Date: Wed, 2 Apr 2025 19:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/rockchip: inno-hdmi: Convert to drm bridge
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-8-andyshrk@163.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250402123150.238234-8-andyshrk@163.com>
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


Hi Andy,

> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First included in v3
> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> 
>   drivers/gpu/drm/bridge/Kconfig                |   7 +
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   .../inno_hdmi.c => bridge/inno-hdmi.c}        | 924 ++++++++++--------
>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
>   drivers/gpu/drm/rockchip/Makefile             |   2 +-
>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
>   drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
>   include/drm/bridge/inno_hdmi.h                |  33 +
>   8 files changed, 741 insertions(+), 763 deletions(-)
>   rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
>   create mode 100644 include/drm/bridge/inno_hdmi.h
>

...

> +#define m_RX_DONE			(1 << 0)
> +
> +#define HDMI_CEC_TX_INT			0xda
> +#define HDMI_CEC_RX_INT			0xdb
> +#define HDMI_CEC_BUSFREETIME_L		0xdc
> +#define HDMI_CEC_BUSFREETIME_H		0xdd
> +#define HDMI_CEC_LOGICADDR		0xde
> +
>   struct inno_hdmi_i2c {
>   	struct i2c_adapter adap;
>   
> @@ -68,41 +395,18 @@ struct inno_hdmi_i2c {
>   
>   struct inno_hdmi {
>   	struct device *dev;
> -
> +	struct drm_bridge bridge;
>   	struct clk *pclk;
>   	struct clk *refclk;
>   	void __iomem *regs;
>   	struct regmap *grf;
>   
> -	struct drm_connector	connector;
> -	struct rockchip_encoder	encoder;
> -
>   	struct inno_hdmi_i2c *i2c;
>   	struct i2c_adapter *ddc;
> -
> -	const struct inno_hdmi_variant *variant;
> +	const struct inno_hdmi_plat_data *plat_data;
> +	unsigned int colorimetry;

thanks a lot for doing the bridge conversion for this driver.
Please keep the custom connector state which was introduced after Maxim's
review during the last rework of this [0] driver. The colorimetry is not
part of the device, but of the connector and thus should not be part of the
device struct.
It's, however, likely that the common (hdmi-)connector framework will once
hold its own colorimetry property and then the custom connector state in
this driver can go away, but until than we have to keep it here.

Thanks,
Alex

[0]
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ceeb0f0104a62c867656c2730a51df47e7350b8f


>   };
>   
> -struct inno_hdmi_connector_state {
> -	struct drm_connector_state	base;
> -	unsigned int			colorimetry;
> -};
> -
> -static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
> -{
> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> -
> -	return container_of(rkencoder, struct inno_hdmi, encoder);
> -}
> -
> -static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
...
