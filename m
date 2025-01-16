Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D56A13B16
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 14:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0810E974;
	Thu, 16 Jan 2025 13:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RaBDcjHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36810E974
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 13:47:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38789e5b6a7so544644f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737035252; x=1737640052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=p/AX6eQPKtX9jroOzUszK/RT8Fxx1tBXv1Tj+2dY1hM=;
 b=RaBDcjHmOG4WW+J+5zMcSHbT3DtHSccEjIqazU5DXijtYcKVsGbj5CCGiB62w91Dvl
 YK+Bp0LagOCitOsSzzxW6yFdLdLIdCJuc1Uao3yzc3mCFnVJcCvSZbK+Vz02mnpphX74
 IMrd2+7TftcVoO1oaZbXMFNW/1w4XmKpS9QMOkx8p6t2WeuacWc0djzUz7Ymbek6nAji
 4qplah4I72rgcOJcIgUWZrRdIGZSuMV7RZH5+WqC7qTNRIWXbuoXRS0FPXrGHGVN5HNY
 ADR8Kg9ZNsq4LOMmifpheL2VxMYTuG02RqONRApiGt48hSUXfAoCZeZE39xITtKAmKiB
 Ie/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737035252; x=1737640052;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=p/AX6eQPKtX9jroOzUszK/RT8Fxx1tBXv1Tj+2dY1hM=;
 b=Tvgyq0C7K0zkbHsGfh1kGAJ9I0sYS1fqYTHvMpL4ACYcnBacbWw/VjZ/4CREHDPA10
 0caj/5Glnr8dxRROzfuN55PVk+9yLFOxgKGOD0uB2Voxn4vqec540+khAx22US/WV/Sj
 b60cqmUHujWrKpTXYNgk1dXG5iM8/KEEtMiLWEj8IUQ36peQHIZXYQOU5S0wrfnPeTv+
 9wDgsxa2dL3+DhfWych/G+aZViMpF5IGZL2PT/efzAPLLQzOWXQJvro/ak2wFS9XvPWX
 MQDVwPghCB+/kU8qNGmL4TvlVA8UeV4VFhffRnv+sawzoIAW6ZE09h2E4nEWE74ZgMeH
 hDvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTDB0JzWLrJyZ8sxpbQxlyugi9p+zrOEA1jSOa1MnzwXadJy0xsViBynBbJNUAVu88Ofxi9mSuUKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvdBj1Y+kByMyl6Mymlfdnmzxe0WtXseEgqxezDRCDizaUBR4M
 dMG6fl2l/E89G8GuJaKdrxBlQsOat8ySWu2QTgmyFDsa4mkaF+HyCA0eoM3SeHY=
X-Gm-Gg: ASbGncsuGJeeUewhBrHhcAy6rlE4XX0wRA9Gx+1jCqkCoqQ1WCrwjHE4a8hK4cCP+YJ
 08EkORHJebuGvUu+wwYQfVa3/MN7lueA9l29OPljsy0oeI1gVJyV2de8dfWbc+bPF1rmibmA2xE
 PZmDH/53FlNqsMZFCU3WWJiMTBCIWEwg6AhMC8nhMyhTEaw0tnfmg8Esxr+sQUSNGCdP6yO62qZ
 HeW0d+FEdsH1wdaOUHcWxmdvNl5y1n7LJf1veh+eRMFWtbFh45EFwvqz49AeeCOQs4iNDJ2vxl0
 zRnCLHfEaq3IM9wf2fXQDXu4CIds415sCA==
X-Google-Smtp-Source: AGHT+IGmY9a1YckwUusvqJ9gZEUMy27Kp3a+1Ts8kmvcQNaE5OsPGHpKiIqOrBPy3AuscVrOm/Vgmg==
X-Received: by 2002:a05:6000:4607:b0:386:380d:2cac with SMTP id
 ffacd0b85a97d-38a8730a7bdmr25351217f8f.26.1737035251955; 
 Thu, 16 Jan 2025 05:47:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d?
 ([2a01:e0a:982:cbb0:4adf:8d3f:1419:e65d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74d8cddsm60268335e9.30.2025.01.16.05.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 05:47:31 -0800 (PST)
Message-ID: <71e80688-0ebb-4ef4-bedb-350c67ad0e2d@linaro.org>
Date: Thu, 16 Jan 2025 14:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 2/2] drm/panel: boe-tv101wum-nl6: support for
 starry-2082109qfh040022-50e MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250116130633.3012433-1-yelangyan@huaqin.corp-partner.google.com>
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
In-Reply-To: <20250116130633.3012433-1-yelangyan@huaqin.corp-partner.google.com>
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
> The starry-2082109qfh040022-50e is a 10.95" TFT panel.
> which fits in nicely with the existing panel-boe-tv101wum-nl6 driver.
>  From the datasheet, MIPI needs to keep the LP11 state before the
> lcm_reset pin is pulled high, so increase lp11_before_reset flag.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 148 ++++++++++++++++++
>   1 file changed, 148 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 72fa0f6a5cb6..d45321cece55 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1400,6 +1400,123 @@ static int kingdisplay_kd110n11_51ie_init(struct boe_panel *boe)
>   	return 0;
>   }
>   
> +static int starry_2082109qfh040022_50e_init(struct boe_panel *boe)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = boe->dsi };
> +
> +	msleep(50);
> +
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x83, 0x10, 0x21, 0x55, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD9, 0xD1);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x2C, 0xB5, 0xB5, 0x31, 0xF1, 0x33, 0xC3, 0x57,
> +		0x36, 0x36, 0x36, 0x36, 0x1A, 0x8B, 0x11, 0x65, 0x00, 0x88, 0xFA, 0xFF, 0xFF,
> +		0x8F, 0xFF, 0x08, 0x3C, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB2, 0x00, 0x47, 0xB0, 0x80, 0x00, 0x22, 0x70, 0x3C,
> +		0xA1, 0x22, 0x00, 0x00, 0x00, 0x88, 0xF4);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x14, 0x16, 0x14, 0x50, 0x14, 0x50, 0x0D, 0x6A,
> +		0x0D, 0x6A, 0x01, 0x9E);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB6, 0x34, 0x34, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB8, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCD);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x84);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBC, 0x1B, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBE, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xFC, 0xC4);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC0, 0x38, 0x38, 0x22, 0x11, 0x33, 0xA0, 0x61, 0x08,
> +		0xF5, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC7, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC6);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC8, 0x97);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xC9, 0x00, 0x1E, 0x30, 0xD4, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x08, 0x13, 0x07, 0x00, 0x0F, 0x16);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCC, 0x02, 0x03, 0x44);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD0, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD1, 0x37, 0x06, 0x00, 0x02, 0x04, 0x2C, 0xFF);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x3B, 0x03, 0x73, 0x3B, 0x21, 0x21, 0x03, 0x03, 0x98, 0x10, 0x1D, 0x00,
> +		0x1D, 0x32, 0x17, 0xA1, 0x07, 0xA1, 0x43, 0x17, 0xA6, 0x07, 0xA6, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD5, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x40, 0x40,
> +		0x18, 0x18, 0x18, 0x18, 0x2A, 0x2B, 0x1F, 0x1F, 0x1E, 0x1E, 0x24, 0x25, 0x26,
> +		0x27, 0x28, 0x29, 0x2A, 0x2B, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +		0x08, 0x09, 0x0A, 0x0B, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x02, 0xAA, 0xEA, 0xAA, 0xAA, 0x00, 0x02, 0xAA,
> +		0xEA, 0xAA, 0xAA, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x07, 0x10, 0x10, 0x2A, 0x32, 0x9F, 0x01, 0x5A,
> +		0x91, 0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12, 0x05, 0x02, 0x02, 0x10, 0x33,
> +		0x02, 0x04, 0x18, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB1, 0x01, 0x7F, 0x11, 0xFD);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x86);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x3D);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC5);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x00, 0x00, 0x00, 0x80, 0x80, 0x0C, 0xA1);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x03, 0xFF,
> +		0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0x02, 0x00, 0x2D, 0x01, 0x7F, 0x0F, 0x7C, 0x10,
> +		0xA0, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBF, 0xF2);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xCB, 0x02, 0x00, 0x00, 0x10, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD2, 0x0A, 0x0A, 0x05, 0x03, 0x0A, 0x0A, 0x01, 0x03,
> +		0x01, 0x01, 0x05, 0x0E);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD3, 0x03, 0x1F, 0xE0, 0x11, 0x70);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xAB, 0xFF, 0xFF, 0xFF, 0xFF, 0xA0, 0xAB, 0xFF,
> +		0xFF, 0xFF, 0xFF, 0xA0);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE7, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0x00, 0x00,
> +		0x00, 0x03, 0x00, 0x03, 0x81, 0x02, 0x40, 0x00, 0x20, 0x9E, 0x02, 0x01, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC6);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB4, 0x03, 0xFF, 0xF8);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xD8, 0xAA, 0xAB, 0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xAB,
> +		0xEA, 0xAA, 0xAA, 0xA0, 0xAA, 0xBF, 0xFF, 0xFF, 0xFE, 0xA0, 0xAA, 0xBF, 0xFF,
> +		0xFF, 0xFE, 0xA0, 0xAA, 0xAA, 0xAA, 0xAA, 0xAA, 0xA0, 0xAA, 0xAA, 0xAA, 0xAA,
> +		0xAA, 0xA0);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE1, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC4);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x96);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xC5);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x4F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0xCC);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBA, 0x84);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xE9, 0x3F);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xBD, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, 0xB9, 0x00, 0x00, 0x00, 0x00);
> +
> +	msleep(110);
> +
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
> @@ -1761,6 +1878,34 @@ static const struct panel_desc kingdisplay_kd110n11_51ie_desc = {
>   	.lp11_before_reset = true,
>   };
>   
> +static const struct drm_display_mode starry_2082109qfh040022_50e_default_mode = {
> +	.clock = (1200 + 160 + 66 + 120) * (1920 + 115 + 8 + 28) * 60 / 1000,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 160,
> +	.hsync_end = 1200 + 160 + 66,
> +	.htotal = 1200 + 160 + 66 + 120,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 115,
> +	.vsync_end = 1920 + 115 + 8,
> +	.vtotal = 1920 + 115 + 8 + 28,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc starry_2082109qfh040022_50e_desc = {
> +	.modes = &starry_2082109qfh040022_50e_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 147,
> +		.height_mm = 235,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init = starry_2082109qfh040022_50e_init,
> +	.lp11_before_reset = true,
> +};
> +
>   static int boe_panel_get_modes(struct drm_panel *panel,
>   			       struct drm_connector *connector)
>   {
> @@ -1929,6 +2074,9 @@ static const struct of_device_id boe_of_match[] = {
>   	{ .compatible = "kingdisplay,kd110n11-51ie",
>   	  .data = &kingdisplay_kd110n11_51ie_desc
>   	},
> +	{ .compatible = "starry,2082109qfh040022-50e",
> +	  .data = &starry_2082109qfh040022_50e_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, boe_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
