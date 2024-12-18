Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F99F62BA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 11:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF41310EB47;
	Wed, 18 Dec 2024 10:22:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q7fKzTvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878DB10EB47
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 10:22:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so32708385e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 02:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734517373; x=1735122173; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=RZGs7Y66+td6OqVHaSIclRCB7zumQQqsxzXpa2zyvVQ=;
 b=Q7fKzTvj4a6as92QmQNaY7V/jkBUawApUiAtlTG6igVaNRq2j8qnfUWtoqEcOEq/gJ
 Asx3DKhcApk53kItV3uXahIKpBjE5bLEhHwqIYaZvNghzAtd3IIBu4LKFZB2J8lrv92D
 r9avGX2QA/3HxDeKBW6a6PiyU6q52/fU2w+anR5x09yxeneEQjpK4JxddphFJNk1Ct+e
 b/ysyLVarZDGVeEfSBwDMi+hMNuPyXH6JdKYb+erhrXC7B7eR7t3PT906iXjTLqt3YZK
 p/JzA0qx+LdD0wtEBbVX46r07laFihs10/uqPGbndqpc+EBKPIS9BEu3Cw1I1YoM8cJb
 i//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734517373; x=1735122173;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RZGs7Y66+td6OqVHaSIclRCB7zumQQqsxzXpa2zyvVQ=;
 b=kKbzep/w09fGaNJqj1+qP/zTSIp3dAbSpGCqzAoojJqrBAVTcqUh/h0pT/j2cMsXjF
 o26OcyGqWWe8nzvxg4gsObZ7gsP6ke6XeqPuq+pl/DygJ6zC6Q9Ek6InuLefKWahOE3o
 HdTYA+Z34hpR/CgYc36u0PTcsXfrakIscrAhzYyt8xmdbjy0/VSYA9H7J2ex39G3erzD
 t1m13DvV2ot+/GMsl8lFfjFBds8qat6RA+gu5/d2PW2CtXzW5leScrgY4+jduWjF9m8C
 KpdnMb1RfKgYYdPKV8Dt2Jj+mOKVLTxnaPklv5C3iXZfmIxA5tu1Fm1FTmVbaDMS6Ydq
 HnqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjpY/+ZMGt4S8Y1LIXffJSgIWF1r8CiS55NsKZ/D/lmj3Bm2qfsHYwGS/i2jw81YCllPwSI+0PSms=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+j/EUAWAWyDoOSaPhN/ENG2cvCV3SW1ZmGXaa3LWT9Gd+HDN0
 W2qqlGWy+FT0j3qU2p+awQMrlXAAwHfqs7HzLk5vAohm6RJ/mAAPfO5OUAftmV0=
X-Gm-Gg: ASbGncvrI1gi+lgH/p3KgP3L72aTrig+eBGoNgkzngMAd88/OhM1hxt3feihy3paBdH
 cfvHs6oJXtGUqhYBEnE8p5Ua5/ImleGI3H3CuIqEmfCRpQb8UsyMXth3qhyEMzoyzYGOUwcFp+U
 uCv0Mjrx7glGBh+jx1EIqD0/mdPFqW8WceSk2TqM+RXi1Em6/CA+Xgkm+i/lBD8ma8wI3A/PGRH
 No/7D/b5lmLx7yDcOFN18y87i2hpCq1z+jVuTtJdulJUsGuXof7x6GmTr7Bo2lOSIg1tFO/cHy4
 QZhx9GS8Ax+pWCNY0K+/+66GSi4QnF4=
X-Google-Smtp-Source: AGHT+IFgP/8IN1QuIOTy/xgV92NDu3DdLi4jkcpMDZGLpnVCK4EHeQqLf+BtnvjiFM8k8omeri7SUQ==
X-Received: by 2002:a05:600c:468e:b0:431:3bf9:3ebb with SMTP id
 5b1f17b1804b1-436553f4d28mr17417405e9.24.1734517372986; 
 Wed, 18 Dec 2024 02:22:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:e596:468d:657e:c30?
 ([2a01:e0a:982:cbb0:e596:468d:657e:c30])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656afd57esm15715435e9.5.2024.12.18.02.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 02:22:52 -0800 (PST)
Message-ID: <4e7f0951-4b83-4d5c-b4e6-8d7327614840@linaro.org>
Date: Wed, 18 Dec 2024 11:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/12/2024 12:09, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). Thus it should be residing together with the other
> DRM bridge drivers under drivers/gpu/drm/bridge/.
> 
> TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
> and TDA19989 chips, so it is being instantiated by the TDA998x driver.
> Move it together with the TDA998x under bridge drivers subdir.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   MAINTAINERS                                       |  2 +-
>   drivers/gpu/drm/arm/Kconfig                       |  1 +
>   drivers/gpu/drm/bridge/Kconfig                    |  2 ++
>   drivers/gpu/drm/bridge/Makefile                   |  1 +
>   drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
>   drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
>   drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
>   drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
>   drivers/gpu/drm/i2c/Kconfig                       | 13 -------------
>   drivers/gpu/drm/i2c/Makefile                      |  4 ----
>   10 files changed, 22 insertions(+), 18 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a23e80abf309cbd918a74683895f8dbe0507a6e..a4c7afd564e721e14aebaf828b75776e50760a45 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16982,7 +16982,7 @@ M:	Russell King <linux@armlinux.org.uk>
>   S:	Maintained
>   T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-devel
>   T:	git git://git.armlinux.org.uk/~rmk/linux-arm.git drm-tda998x-fixes
> -F:	drivers/gpu/drm/i2c/tda998x_drv.c
> +F:	drivers/gpu/drm/bridge/tda/tda998x_drv.c

I'd rather move the entry it to drm-misc in the same move, I don't think
we want externally maintained bridge drivers mixed in the other bridges.

Russell, so you agree ?

Apart that:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil

>   F:	include/dt-bindings/display/tda998x.h
>   K:	"nxp,tda998x"
>   
> diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
> index c901ac00c0c3a8f356bd53d97305c6b39b3e6662..ed3ed617c6884876368c8bd072c53f1b710df443 100644
> --- a/drivers/gpu/drm/arm/Kconfig
> +++ b/drivers/gpu/drm/arm/Kconfig
> @@ -9,6 +9,7 @@ config DRM_HDLCD
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER
>   	select DRM_GEM_DMA_HELPER
> +	select DRM_BRIDGE # for TDA998x
>   	help
>   	  Choose this option if you have an ARM High Definition Colour LCD
>   	  controller.
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 6b4664d91faa80f096ac6a0548ed342e802ae68b..1ef16dcc2ae53eb172604de2d6899004c080a979 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -438,4 +438,6 @@ source "drivers/gpu/drm/bridge/imx/Kconfig"
>   
>   source "drivers/gpu/drm/bridge/synopsys/Kconfig"
>   
> +source "drivers/gpu/drm/bridge/tda/Kconfig"
> +
>   endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 97304b429a530c108dcbff906965cda091b0a7a2..52e6c9b3094bba0fd6aaf28af1b58f4bd8bf26d0 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -43,3 +43,4 @@ obj-y += analogix/
>   obj-y += cadence/
>   obj-y += imx/
>   obj-y += synopsys/
> +obj-y += tda/
> diff --git a/drivers/gpu/drm/bridge/tda/Kconfig b/drivers/gpu/drm/bridge/tda/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..5f13e4ffc24eeaa8dd0015c7e84d0dbac93e170c
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/tda/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DRM_I2C_NXP_TDA998X
> +	tristate "NXP Semiconductors TDA998X HDMI encoder"
> +	default m if DRM_TILCDC
> +	select CEC_CORE if CEC_NOTIFIER
> +	select SND_SOC_HDMI_CODEC if SND_SOC
> +	help
> +	  Support for NXP Semiconductors TDA998X HDMI encoders.
> +
> +config DRM_I2C_NXP_TDA9950
> +	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> +	select CEC_NOTIFIER
> +	select CEC_CORE
> diff --git a/drivers/gpu/drm/bridge/tda/Makefile b/drivers/gpu/drm/bridge/tda/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..31fd35527d99d7eb23851d290175a3ff0c756772
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/tda/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +tda998x-y := tda998x_drv.o
> +obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> +obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/bridge/tda/tda9950.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/tda9950.c
> rename to drivers/gpu/drm/bridge/tda/tda9950.c
> diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/bridge/tda/tda998x_drv.c
> similarity index 100%
> rename from drivers/gpu/drm/i2c/tda998x_drv.c
> rename to drivers/gpu/drm/bridge/tda/tda998x_drv.c
> diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
> index 6f19e1c35e30b0e595c1a60628a6b8cf313fcabc..3205cdb827b95209a4bba9fb126ad2df27ddbdfb 100644
> --- a/drivers/gpu/drm/i2c/Kconfig
> +++ b/drivers/gpu/drm/i2c/Kconfig
> @@ -20,17 +20,4 @@ config DRM_I2C_SIL164
>   	  when used in pairs) TMDS transmitters, used in some nVidia
>   	  video cards.
>   
> -config DRM_I2C_NXP_TDA998X
> -	tristate "NXP Semiconductors TDA998X HDMI encoder"
> -	default m if DRM_TILCDC
> -	select CEC_CORE if CEC_NOTIFIER
> -	select SND_SOC_HDMI_CODEC if SND_SOC
> -	help
> -	  Support for NXP Semiconductors TDA998X HDMI encoders.
> -
> -config DRM_I2C_NXP_TDA9950
> -	tristate "NXP Semiconductors TDA9950/TDA998X HDMI CEC"
> -	select CEC_NOTIFIER
> -	select CEC_CORE
> -
>   endmenu
> diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
> index a962f6f085686674ed33010345730db776815ebe..1df3869491e277ca210368c4e48efe6d11af62b6 100644
> --- a/drivers/gpu/drm/i2c/Makefile
> +++ b/drivers/gpu/drm/i2c/Makefile
> @@ -4,7 +4,3 @@ obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
>   
>   sil164-y := sil164_drv.o
>   obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
> -
> -tda998x-y := tda998x_drv.o
> -obj-$(CONFIG_DRM_I2C_NXP_TDA998X) += tda998x.o
> -obj-$(CONFIG_DRM_I2C_NXP_TDA9950) += tda9950.o
> 

