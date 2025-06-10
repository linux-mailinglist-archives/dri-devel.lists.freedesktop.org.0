Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE84AD2E8C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9E910E243;
	Tue, 10 Jun 2025 07:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FbSbHfCi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB65910E243
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:23:08 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-441ab63a415so52879595e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749540187; x=1750144987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=pMeFbqWSelBjQeRhda/8MDNAHw2IH4aC9na4wSNAaDA=;
 b=FbSbHfCiyhGueMc/C82kEIv71o1irCTs83H9ifsMxFkQFMu2C2Kngz2piSEVrMgkLL
 gFHAcgc+UG7ct63MTBptI5RMAHsFJQFIN2Z7o21an39GDBVjP27v5fLsC21BFfyTlG8e
 gK3e6eX1dG4n+k6Z0NTvSwLF0+Pf7E4NO2dML0IkJDJ2gNFgZzdOYMnJqe2vK77Aty98
 IcLEqcpGqRBZWJRMoQHBYbwrwrQVXAycA1z65BsaHmi8VnL5915CEMDTHM3iVkfXtMAe
 NEssIiA1GpUJTFqGT9bsrPxegwW7tM8b0qOOplhsS4eyqFV4bxlWZ9RFQVtarDslQ11F
 tulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749540187; x=1750144987;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pMeFbqWSelBjQeRhda/8MDNAHw2IH4aC9na4wSNAaDA=;
 b=GYCXN3N4xJHj5wjuPw21bykIFsaZmXrF5V2VPzPY4xeyKqIw3OPpIpeXHoYcHSqXXX
 AaNvOLRRpVVC7ny73prscA8Kades9yg7aGe8xJb+gX28t7FrtERIp5tzuLberKoFZM2R
 BbMMA0D8WcJA/eVk8PrWaA4+v2nII2KbEUrWoa5rJXiUkLLWuq4LUb7Qhll1GE4OSXoG
 PtQpXnA8sL0GFjBlYYxwy4IehTIzQsSjlXc4qPRBSwY0X0CO0Z8y/YpModmPgZBfwivE
 UrtgBKSMf+X591lpG6eoeShjb4E/kUewNFH3NwcZHNzaq1T949/233HM39pvyBgwqdol
 +XXQ==
X-Gm-Message-State: AOJu0YzQDeeVwMMM1KcI4uHRv5dFjWGBhbys1GNBTYeVd1cN43uAr1OZ
 eelc70KFkCKuLS0zX0k268v0LOWAccNNqnFms6+BdR8l4JZK2cNmDUMaQYiiLxkH/kQ=
X-Gm-Gg: ASbGncu4cULVSKzd1zYRvWw9xnzimPR4+sX5fSjeZlIQldJh6pTlg3GXWBmfjjmVVMa
 8ptlM1kOhJlaUWNiIXV4IdtD8HI9RR4MlMw2DshYu9HwjHLhFwPVUB6b6ZNgH8lKNuO4YW7m/dX
 vSy9gBZGfpwIXxSxsfUponqydxDg5bh3K/C2U+TFKuKccB5V++Wfv1HibaCnqQalsMaQ3bv3xHp
 iE6tLllK+WZdP6HbqLPPeKv7IuZ810qtIgGxsAZVcYxKit8RVT+nkmy11k/OrzEJ+4KwO49+5mK
 Bi/ApS3v0hAne4LthRzC6oJsahI9nl7q9f6+cMC212U0hIiDxH/9b1DVUiGsmcMNmurb/kdxAXR
 VwCDJ5QX0zIlt7qjB5W+0JtYyTDBHOo4PbCID
X-Google-Smtp-Source: AGHT+IFZ5n5bVF9PbhERIWR1Ra4W0m2ESVyC1hgWyc2zbm5xEWzBTEhyEkeAeXb/Bmv+Pqp7qYAYvQ==
X-Received: by 2002:a05:600c:a02:b0:43d:745a:5a50 with SMTP id
 5b1f17b1804b1-4531de70ff8mr11777095e9.19.1749540187289; 
 Tue, 10 Jun 2025 00:23:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14?
 ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229ddf6sm11314064f8f.2.2025.06.10.00.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:23:06 -0700 (PDT)
Message-ID: <94c0c7ca-d604-4aed-83ec-cfdf196dfd7f@linaro.org>
Date: Tue, 10 Jun 2025 09:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/2] drm/panel: st7701: Add Winstar wf40eswaa6mnn0
 panel support
To: Stefan Eichenberger <eichest@gmail.com>, jagan@amarulasolutions.com,
 quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250606114644.105371-1-eichest@gmail.com>
 <20250606114644.105371-2-eichest@gmail.com>
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
In-Reply-To: <20250606114644.105371-2-eichest@gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2025 13:45, Stefan Eichenberger wrote:
> The Winstar wf40eswaa6mnn0 panel is a square 4.0" TFT LCD with a
> resolution of 480x480 pixels.
> 
> This panel is driven by the Sitronix ST7701 controller and uses a MIPI
> DSI interface. The settings are based on the panel's datasheet and the
> init sequence provided by Winstar.
> 
> It was tested on a Verdin iMX8MP from Toradex with a Carrier Board
> providing a MIPI DSI interface.
> 
> Signed-off-by: Stefan Eichenberger <eichest@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7701.c | 124 ++++++++++++++++++
>   1 file changed, 124 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> index 1f72ef7ca74c9..cf42281393dd9 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -520,6 +520,28 @@ static void rg28xx_gip_sequence(struct st7701 *st7701)
>   	st7701_switch_cmd_bkx(st7701, false, 0);
>   }
>   
> +static void wf40eswaa6mnn0_gip_sequence(struct st7701 *st7701)
> +{
> +	ST7701_WRITE(st7701, 0xE0, 0x00, 0x28, 0x02);
> +	ST7701_WRITE(st7701, 0xE1, 0x08, 0xA0, 0x00, 0x00, 0x07, 0xA0, 0x00,
> +		   0x00, 0x00, 0x44, 0x44);
> +	ST7701_WRITE(st7701, 0xE2, 0x11, 0x11, 0x44, 0x44, 0xED, 0xA0, 0x00,
> +		   0x00, 0xEC, 0xA0, 0x00, 0x00);
> +	ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x11, 0x11);
> +	ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
> +	ST7701_WRITE(st7701, 0xE5, 0x0A, 0xE9, 0xD8, 0xA0, 0x0C, 0xEB, 0xD8,
> +		   0xA0, 0x0E, 0xED, 0xD8, 0xA0, 0x10, 0xEF, 0xD8, 0xA0);
> +	ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x11, 0x11);
> +	ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
> +	ST7701_WRITE(st7701, 0xE8, 0x09, 0xE8, 0xD8, 0xA0, 0x0B, 0xEA, 0xD8,
> +		   0xA0, 0x0D, 0xEC, 0xD8, 0xA0, 0x0F, 0xEE, 0xD8, 0xA0);
> +	ST7701_WRITE(st7701, 0xEB, 0x00, 0x00, 0xE4, 0xE4, 0x88, 0x00, 0x40);
> +	ST7701_WRITE(st7701, 0xEC, 0x3C, 0x00);
> +	ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x02, 0xFF, 0xFF,
> +		   0xFF, 0xFF, 0xFF, 0xFF, 0x20, 0x45, 0x67, 0x98, 0xBA);
> +	ST7701_WRITE(st7701, MIPI_DCS_SET_ADDRESS_MODE, 0);
> +}
> +
>   static int st7701_prepare(struct drm_panel *panel)
>   {
>   	struct st7701 *st7701 = panel_to_st7701(panel);
> @@ -1135,6 +1157,107 @@ static const struct st7701_panel_desc rg28xx_desc = {
>   	.gip_sequence = rg28xx_gip_sequence,
>   };
>   
> +static const struct drm_display_mode wf40eswaa6mnn0_mode = {
> +	.clock		= 18306,
> +
> +	.hdisplay	= 480,
> +	.hsync_start	= 480 + 2,
> +	.hsync_end	= 480 + 2 + 45,
> +	.htotal		= 480 + 2 + 45  + 13,
> +
> +	.vdisplay	= 480,
> +	.vsync_start	= 480 + 2,
> +	.vsync_end	= 480 + 2 + 70,
> +	.vtotal		= 480 + 2 + 70 + 13,
> +
> +	.width_mm	= 72,
> +	.height_mm	= 70,
> +
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct st7701_panel_desc wf40eswaa6mnn0_desc = {
> +	.mode = &wf40eswaa6mnn0_mode,
> +	.lanes = 2,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.panel_sleep_delay = 0,
> +
> +	.pv_gamma = {
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC0_MASK, 0x1),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x08),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x10),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0c),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x10),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x08),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x10),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x0c),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x08),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x04),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0x14),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x12),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0xb3),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x3a),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x1f)
> +	},
> +	.nv_gamma = {
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x13),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC4_MASK, 0x19),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC8_MASK, 0x1f),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC16_MASK, 0x0f),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC24_MASK, 0x14),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC52_MASK, 0x07),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC80_MASK, 0x07),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC108_MASK, 0x08),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC147_MASK, 0x07),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC175_MASK, 0x22),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC203_MASK, 0x02),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC231_MASK, 0xf),
> +
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC239_MASK, 0x0f),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC247_MASK, 0xa3),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC251_MASK, 0x29),
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_AJ_MASK, 0) |
> +		CFIELD_PREP(ST7701_CMD2_BK0_GAMCTRL_VC255_MASK, 0x0d)
> +	},
> +	.nlinv = 3,
> +	.vop_uv = 4737500,
> +	.vcom_uv = 662500,
> +	.vgh_mv = 15000,
> +	.vgl_mv = -10170,
> +	.avdd_mv = 6600,
> +	.avcl_mv = -4600,
> +	.gamma_op_bias = OP_BIAS_MIDDLE,
> +	.input_op_bias = OP_BIAS_MIDDLE,
> +	.output_op_bias = OP_BIAS_MIN,
> +	.t2d_ns = 1600,
> +	.t3d_ns = 10400,
> +	.eot_en = true,
> +	.gip_sequence = wf40eswaa6mnn0_gip_sequence,
> +};
> +
>   static void st7701_cleanup(void *data)
>   {
>   	struct st7701 *st7701 = (struct st7701 *)data;
> @@ -1265,6 +1388,7 @@ static const struct of_device_id st7701_dsi_of_match[] = {
>   	{ .compatible = "densitron,dmt028vghmcmi-1a", .data = &dmt028vghmcmi_1a_desc },
>   	{ .compatible = "elida,kd50t048a", .data = &kd50t048a_desc },
>   	{ .compatible = "techstar,ts8550b", .data = &ts8550b_desc },
> +	{ .compatible = "winstar,wf40eswaa6mnn0", .data = &wf40eswaa6mnn0_desc },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, st7701_dsi_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
