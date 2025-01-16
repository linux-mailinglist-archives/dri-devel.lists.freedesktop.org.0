Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EEA13B1B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25A910E97A;
	Thu, 16 Jan 2025 13:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j2HiOhOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C6410E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:48:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so8697015e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737035247; x=1737640047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=XV0ypA+ConBNXrSgc6FhhVnY1kemZc5wMJWK62MyCuU=;
 b=j2HiOhOZq8clOKfxFYbrPTfh2GdZGkEqOHU0r3G/GZ7ZF7R4ussYYeOhN35SYDDW0b
 3nCf70ZBpD+mhs4ROjC4fus4oGir1SvKtGV7efJTME69sFjmc5J72w7ZQpRPfp1q1Dx4
 18G/3O7lO5kH727f2uk+F1a9UbjLT3JBtgeXbPh4zFR9BupviwPu0ad75QLXKcdYU/Xq
 E12EpdwElCOV7RtXF3cIo7/3tv8sBLZuv2Ftgup9Onwo5GCFQaKBAj+i1VMA1+9mi1wK
 vorO2ccqHmDlOWS+2gqhqQX0kTHT9nKSV9heOqLG3kKx4jC1Hfd4BzeJx1dxdaREKGEb
 6I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737035247; x=1737640047;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=XV0ypA+ConBNXrSgc6FhhVnY1kemZc5wMJWK62MyCuU=;
 b=Ip57da9LxJ8S/VEipJ70KOnbCvDmciyqdsvm0E9CZKjjcWkmWVbzXZbtlWuqge2P33
 vuMEXO070KranXncBUbXZxwC3Pswz4LLwE+iOSswW5l958oDT9WGDElJMQTN2vypPxtq
 M5jgK6PPYNg52jaXJIxj5jDCMPPKsc8aPsOGRef3P6S5YpyyRNdUI9RT2LwFis1WIfvS
 PhtTFg2vaqiZuaButngPl+zEgbzKHfwlklrA6baqxtZgLfxVfuzbpYAbQB43BmRELCuH
 Cj3KkQ4Wf5UDkt1WT4K7OUepBX+1Nl1bZ+o29S8EgZWra6ERhddD41EUGR2+OEfNxGil
 TAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjNJ2WC1M9Ra2nqatKadZzrQpzUoR6/rd8NapY6m/HUyJBt8y2EPllNvyItFyTtUJ9jIIo5DKH53U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD9ID0s/NwvUwzdy5izPQo/T5sGt5Zi28xYOv0AKUsVPlR6rSh
 9BiZOWtYVKLGKZJ2JBG6svSIOxUZJ9qNJMVs5+Ms7f+QPfS/GRKE28CTvhai/ho=
X-Gm-Gg: ASbGncvAPjLgewxjzZ/bURKcvp3kdCs+hIsNFvGvrNsZ5QwRoUwQ7+8+RCN4sPzoDnT
 nr4K4Vl00vRkBTZZZ94PF+c1szqlunDEo7eTXnsS1aDMvXneAhZDgY8LRj+Rvm5f6tiXS09JyUe
 fMYvIeyB47Ucvb8lGMo8lYkhqtMh/Hp8HdF3Tldb9gRDDNvwRdk2nAY0gKlph1s2Cc6LaFPtl0s
 l2MiXq/X5oZa1RftyXcNYN2pF9K0iyvgCFo8u0WqibJO5FUSd/MMwD/1m0VVOXKs0ffy4a0K+4J
 1+n1UPBprUdfgPDey4unEGd1C2rzoQ+UbA==
X-Google-Smtp-Source: AGHT+IG5+gXyBEzdGuSpFXAc0h6h49px0KgsF9Bknfqn75YMip2uvq0CueBHRdw892UGfvsWIrZrng==
X-Received: by 2002:a05:600c:1e09:b0:436:e751:e445 with SMTP id
 5b1f17b1804b1-436e751e61fmr323605555e9.5.1737035246887; 
 Thu, 16 Jan 2025 05:47:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d?
 ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74d8cddsm60268335e9.30.2025.01.16.05.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 05:47:26 -0800 (PST)
Message-ID: <2ce0b8fe-6ae6-40a3-b357-1965dcd0cdfd@linaro.org>
Date: Thu, 16 Jan 2025 14:47:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 1/2] drm/panel: boe-tv101wum-nl6: support for
 kingdisplay-kd110n11-51ie MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250116130609.3011530-1-yelangyan@huaqin.corp-partner.google.com>
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
In-Reply-To: <20250116130609.3011530-1-yelangyan@huaqin.corp-partner.google.com>
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

On 16/01/2025 14:06, Langyan Ye wrote:
> The kingdisplay-kd110n11-51ie is a 10.95" TFT panel.
> which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.
>  From the datasheet, MIPI needs to keep the LP11 state before the
> lcm_reset pin is pulled high, so increase lp11_before_reset flag.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 122 ++++++++++++++++++
>   1 file changed, 122 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 3e5b0d8636d0..72fa0f6a5cb6 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1309,6 +1309,97 @@ static int starry_qfh032011_53g_init(struct boe_panel *boe)
>   	return 0;
>   };
>   
> +static int kingdisplay_kd110n11_51ie_init(struct boe_panel *boe)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = boe->dsi };
> +
> +	msleep(50);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x83, 0x10, 0x21, 0x55, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD9, 0xD1);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x2C, 0xB3, 0xB3, 0x31, 0xF1, 0x33, 0xE0, 0x54,
> +		0x36, 0x36, 0x3A, 0x3A, 0x32, 0x8B, 0x11, 0xE5, 0x98);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xD9);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x8B, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x2C, 0x80, 0x3C,
> +		0x9F, 0x22, 0x20, 0x00, 0x00, 0x98, 0x51);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x64, 0x64, 0x64, 0x64, 0x64, 0x64, 0x40, 0x84,
> +		0x64, 0x84, 0x01, 0x9D, 0x01, 0x02, 0x01, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBC, 0x1B, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBE, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xFC, 0xC4, 0x80, 0x9C, 0x36, 0x00, 0x0D, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x32, 0x32, 0x22, 0x11, 0x22, 0xA0, 0x31, 0x08,
> +		0xF5, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC7, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC6);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC8, 0x97);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC9, 0x00, 0x1E, 0x13, 0x88, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x02, 0x03, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD1, 0x07, 0x06, 0x00, 0x02, 0x04, 0x2C, 0xFF);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x06, 0x00, 0x00, 0x00, 0x40, 0x04, 0x08, 0x04,
> +		0x08, 0x37, 0x07, 0x44, 0x37, 0x2B, 0x2B, 0x03, 0x03, 0x32,
> +		0x10, 0x22, 0x00, 0x25, 0x32, 0x10, 0x29, 0x00, 0x29, 0x32,
> +		0x10, 0x08, 0x00, 0x08, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD5, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +		0x18, 0x18, 0x07, 0x06, 0x07, 0x06, 0x05, 0x04, 0x05, 0x04,
> +		0x03, 0x02, 0x03, 0x02, 0x01, 0x00, 0x01, 0x00, 0x18, 0x18,
> +		0x25, 0x24, 0x25, 0x24, 0x1F, 0x1F, 0x1F, 0x1F, 0x1E, 0x1E,
> +		0x1E, 0x1E, 0x20, 0x20, 0x20, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x0A, 0x2A, 0xAA, 0x8A, 0xAA, 0xA0, 0x0A, 0x2A,
> +		0xAA, 0x8A, 0xAA, 0xA0);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0xE0, 0x10, 0x10, 0x0D, 0x1E, 0x9D, 0x02, 0x52,
> +		0x9D, 0x14, 0x14);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x01, 0x7F, 0x11, 0xFD);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC5);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x4F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x86);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x64);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC5);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x0A, 0x2A, 0xAA, 0x8A, 0xAA, 0xA0, 0x0A, 0x2A,
> +		0xAA, 0x8A, 0xAA, 0xA0, 0x05, 0x15, 0x55, 0x45, 0x55, 0x50,
> +		0x05, 0x15, 0x55, 0x45, 0x55, 0x50);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x02, 0x00, 0x24, 0x01, 0x7E, 0x0F, 0x7C, 0x10,
> +		0xA0, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x03, 0x07, 0x00, 0x10, 0x7B);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x0F, 0x3F, 0xFF, 0xCF, 0xFF, 0xF0, 0x0F, 0x3F,
> +		0xFF, 0xCF, 0xFF, 0xF0);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0x00, 0x00,
> +		0x00, 0x23, 0x00, 0x23, 0x81, 0x02, 0x40, 0x00, 0x20, 0x9D,
> +		0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x66, 0x81);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC6);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x03, 0xFF, 0xF8);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x0A, 0x2A, 0xAA, 0x8A, 0xAA, 0xA0, 0x0A, 0x2A,
> +		0xAA, 0x8A, 0xAA, 0xA0, 0x0F, 0x2A, 0xAA, 0x8A, 0xAA, 0xF0,
> +		0x0F, 0x2A, 0xAA, 0x8A, 0xAA, 0xF0, 0x0A, 0x2A, 0xAA, 0x8A,
> +		0xAA, 0xA0, 0x0A, 0x2A, 0xAA, 0x8A, 0xAA, 0xA0);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x11);
> +
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0x29);
> +
> +	mipi_dsi_msleep(&ctx, 20);
> +
> +	return 0;
> +}
> +
>   static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct boe_panel, base);
> @@ -1642,6 +1733,34 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
>   	.lp11_before_reset = true,
>   };
>   
> +static const struct drm_display_mode kingdisplay_kd110n11_51ie_default_mode = {
> +	.clock = (1200 + 124 + 80 + 80) * (1920 + 88 + 8 + 38) * 60 / 1000,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 124,
> +	.hsync_end = 1200 + 124 + 80,
> +	.htotal = 1200 + 124 + 80 + 80,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 88,
> +	.vsync_end = 1920 + 88 + 8,
> +	.vtotal = 1920 + 88 + 8 + 38,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc kingdisplay_kd110n11_51ie_desc = {
> +	.modes = &kingdisplay_kd110n11_51ie_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 147,
> +		.height_mm = 235,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = kingdisplay_kd110n11_51ie_init,
> +	.lp11_before_reset = true,
> +};
> +
>   static int boe_panel_get_modes(struct drm_panel *panel,
>   			       struct drm_connector *connector)
>   {
> @@ -1807,6 +1926,9 @@ static const struct of_device_id boe_of_match[] = {
>   	{ .compatible = "starry,2081101qfh032011-53g",
>   	  .data = &starry_qfh032011_53g_desc
>   	},
> +	{ .compatible = "kingdisplay,kd110n11-51ie",
> +	  .data = &kingdisplay_kd110n11_51ie_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, boe_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
