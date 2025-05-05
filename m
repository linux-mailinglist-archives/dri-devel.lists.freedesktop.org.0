Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF5DAA94F3
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 15:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E83089EF7;
	Mon,  5 May 2025 13:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q/z0O9qe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C250689EF7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 13:57:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso18994295e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 06:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746453432; x=1747058232; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tpOfCpy36Um39vuzOQ53zo4WM5KtHq+wPwA/g9psN6k=;
 b=Q/z0O9qerLUOeU/tsS45X4lKrvDfLzdyrXwzP5QUIpj9VnTQdxuqST7HXCClZ3BnJp
 OjCl+0MtEIcuww4tKc+RWApC0nH4uTnL7iuaKG9Iympr6h3haMYfqXS5yyVv7sgpClOt
 gk/q1PF1GEgW3gkIo9+SUGRYplPcnO2ZiZRYiH/GFSCRuvdL1Ml0Yv6PFYn+owixnmPg
 0JdoXbMN47fKLWR+A1qOFFZBvw4Px+Y5EWMbx9YEJqyDGRRPJR7hO3MXmabcPKvTzqD1
 /lnSUVJH0bpOPp+3E1PL/WT8J3T4/TCLXMwxprLXmT/z8MaxPZAqmsDFtZFk+byjmbUc
 tQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746453432; x=1747058232;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tpOfCpy36Um39vuzOQ53zo4WM5KtHq+wPwA/g9psN6k=;
 b=MSpg0BLPlMIuh/zA23z/74LGSXX3XJDdiePk2fsiqFZLXwnSD+RLDEAUxAfqEX29QS
 Ev7LVT7jGFF++UzFIsZRnEGhFtCeji8dyRfnrZbeb2p3du5Z+iCITfYTJ/JBtMocCGR1
 SdNYW4aSjC1ZlAFFtUz2EUmy2jizuX7ocahtsNTyyObfAvdH42auew72KqQVRkJqXBfl
 MzeR/9N0AYY/gz625xRXWsdqa2VySnbXoIxJqU2o/7eGt/Op1G4wl23NgyV3Cvw7BB50
 uvaDYKWfYFEv88OvREdW3qEjLRQ6XARoWim0ZjLr9Ijlafge5ti27b0czWaMPeB5J2Kx
 weKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhdSIebYQR9zg/2FxDCm691S1grwB8mCe9MC8nLlp0AFfgtp3Pp2Fa6PkNaI+ClKPBfzcQKQ4o1g8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb8TpRCZxzTDUqVVg46Uqejk7T/uojr7ryw/1gvQ+v9t2+Jyt+
 7s+WnPsVWtEHOjlSR7Sk94R1LfgJ32coNdJB57pVp9SYcSblqb0jdb9CcJ26fUI=
X-Gm-Gg: ASbGncsY0ARS7QNlUeQAF9Y68eFtUa7+etKb138tTkrMicjOUD/HjO1BkLEjeRramJY
 9GOQlg6mp5oQZj4Pqp6HT2Ca8RxkCYoLpKaNSEkoelEWoU6UloLE1Cvr3D6KqRDgzG8Zgx5beFk
 OhCKpH1sJl65u93Zf4rhptK2BHpYrT20jCdq60+jFxLOSqOGbeYn36Mp3UT+s/o3NW+5iTh5Kc5
 xB6jWwTF0QknoMjGTOXYIhhkAVVCvjkYOe1r+D2OuX5MAR5QmmndajVGh3zbs3Hx8zjIP9kZ39g
 JxF/c+B1ky+D2Ir3geZ+Kc0OsR+tODN1ucMsi8j1gBQLNLECwi1HFgFeo3NCOXeibe2pBfrXbzI
 KWEx6PwgLr8C7dGmdzQ==
X-Google-Smtp-Source: AGHT+IERbb85euZHYXgiYa/TxvOEZ/vOaHxMeVPrrX0S12v3xDTa50lnxHqFU0pSGJ3Idq6PuA6aDA==
X-Received: by 2002:a05:6000:c8b:b0:3a0:9fe1:c2ac with SMTP id
 ffacd0b85a97d-3a09fe1c507mr4152470f8f.22.1746453431630; 
 Mon, 05 May 2025 06:57:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3?
 ([2a01:e0a:3d9:2080:88d3:1ad7:3ae1:56e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b17260sm10778567f8f.98.2025.05.05.06.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 06:57:11 -0700 (PDT)
Message-ID: <861acd58-5eed-4291-bae2-965bfb5fe2bb@linaro.org>
Date: Mon, 5 May 2025 15:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] drm: panel: Add support for Renesas R61307 based
 MIPI DSI panel
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250503094149.29201-1-clamor95@gmail.com>
 <20250503094149.29201-3-clamor95@gmail.com>
 <ffac4a1b-5dfa-48e9-8ac4-37939b6a9347@linaro.org>
 <CAPVz0n3i7=jM9GB-CggFOJEN7B+oBWvyqsSn8UXav3MH0BQJ5g@mail.gmail.com>
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
In-Reply-To: <CAPVz0n3i7=jM9GB-CggFOJEN7B+oBWvyqsSn8UXav3MH0BQJ5g@mail.gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2025 13:41, Svyatoslav Ryhel wrote:
> пн, 5 трав. 2025 р. о 10:50 Neil Armstrong <neil.armstrong@linaro.org> пише:
>>
>> On 03/05/2025 11:41, Svyatoslav Ryhel wrote:
>>> R61307 is liquid crystal driver for high-definition amorphous silicon
>>> (a-Si) panels and is ideal for tablets and smartphones.
>>>
>>> Supported compatibles are:
>>> - hit,tx13d100vm0eaa
>>> - koe,tx13d100vm0eaa
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> ---
>>>    drivers/gpu/drm/panel/Kconfig                |  13 +
>>>    drivers/gpu/drm/panel/Makefile               |   1 +
>>>    drivers/gpu/drm/panel/panel-renesas-r61307.c | 327 +++++++++++++++++++
>>>    3 files changed, 341 insertions(+)
>>>    create mode 100644 drivers/gpu/drm/panel/panel-renesas-r61307.c
>>>
>>
>> <snip>
>>
>>> +static int renesas_r61307_probe(struct mipi_dsi_device *dsi)
>>> +{
>>> +     struct device *dev = &dsi->dev;
>>> +     struct renesas_r61307 *priv;
>>> +     int ret;
>>> +
>>> +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     priv->vcc_supply = devm_regulator_get(dev, "vcc");
>>> +     if (IS_ERR(priv->vcc_supply))
>>> +             return dev_err_probe(dev, PTR_ERR(priv->vcc_supply),
>>> +                                  "Failed to get vcc-supply\n");
>>> +
>>> +     priv->iovcc_supply = devm_regulator_get(dev, "iovcc");
>>> +     if (IS_ERR(priv->iovcc_supply))
>>> +             return dev_err_probe(dev, PTR_ERR(priv->iovcc_supply),
>>> +                                  "Failed to get iovcc-supply\n");
>>> +
>>> +     priv->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>>> +                                                GPIOD_OUT_HIGH);
>>> +     if (IS_ERR(priv->reset_gpio))
>>> +             return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
>>> +                                  "Failed to get reset gpios\n");
>>> +
>>> +     if (device_property_read_bool(dev, "renesas,inversion"))
>>> +             priv->inversion = true;
>>> +
>>> +     if (device_property_read_bool(dev, "renesas,contrast"))
>>> +             priv->dig_cont_adj = true;
>>> +
>>> +     priv->gamma = 0;
>>> +     device_property_read_u32(dev, "renesas,gamma", &priv->gamma);
>>> +
>>> +     priv->dsi = dsi;
>>> +     mipi_dsi_set_drvdata(dsi, priv);
>>> +
>>> +     dsi->lanes = 4;
>>> +     dsi->format = MIPI_DSI_FMT_RGB888;
>>> +     dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>>> +                       MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
>>> +
>>> +     drm_panel_init(&priv->panel, dev, &renesas_r61307_panel_funcs,
>>> +                    DRM_MODE_CONNECTOR_DSI);
>>
>> Please switch to devm_drm_panel_alloc()
>>
> 
> This helper is not available as for 6.15-rc5

Please rebase on on drm-misc-next or linux-next:

https://cgit.freedesktop.org/drm/drm-misc/

Thanks,
Neil

> 
>>> +
>>> +     ret = drm_panel_of_backlight(&priv->panel);
>>> +     if (ret)
>>> +             return dev_err_probe(dev, ret, "Failed to get backlight\n");
>>> +
>>> +     drm_panel_add(&priv->panel);
>>> +
>> <snip>
>>
>> With that:
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

