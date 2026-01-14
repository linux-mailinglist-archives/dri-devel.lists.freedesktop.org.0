Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB59FD1D419
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE66E10E24F;
	Wed, 14 Jan 2026 08:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MNEyTEk5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74A310E24F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:52:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-432d256c2a9so4625317f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768380720; x=1768985520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=czF6PTDIQWWTPWMDuy3R+oHXMU3U5aJaxuYuzJaZsqw=;
 b=MNEyTEk5JZb0NFTyMe7xt86VUhtfeT3A45TvtebfQUYAisWRyBYxXlm89fU39sSIPb
 u652F2HNebrq6iUyPjJYAkand6bujsEG4BMc2/XT4L7tq7U8Eg3EZOePKykZxVgqWowr
 suCciYlu2lS2IyLmkJcczR774/DUEssLSTSGG+JD5MCIWgwo6C+N/POY5qPQD3RexKSP
 fUybCr0sZHKD69hOTk98ASUrq1zDZpC1GBUOnxJ3fGU0DDYmCT0QEFt86beu+fFOKI/y
 VXzzhjKoFMukxZu2Y218fvZBwi0x95xfJQpc8/rRw/9sMsftnBam47P82llWHVN7GrXa
 Prig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380720; x=1768985520;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=czF6PTDIQWWTPWMDuy3R+oHXMU3U5aJaxuYuzJaZsqw=;
 b=Qj0A9uxs3mmuT2b0eslYxkR0C7yJP5Z5X4XUVu7AOZZi+eW0h7uJxTlZakDcccD9lL
 8CTa3u3IuDuYkzhqJFkiNqGdxxodPf0aU6d7SIVmWQhaBkWL97+OFH2vTQsDZD+RlEmo
 HLsWANR8Y+/t9C/OOYkT7zjdCFQgUzV1U/N29X9+Cq6ml/5pJ42Pee/ayscjbNPOLZXQ
 Ui5kz+eQli0hHrDnIMOzR/O8gMxBCDtnhZqsrrd/SrPmIsdGadDrk6AQRj9c5lSsn8dR
 3Gcbq2RA0pljdepOw+TNjYKudT+KYFNPVIE8dJ/mNbyOwBY6FHD+qcYYukww8TbpIcx8
 pU0Q==
X-Gm-Message-State: AOJu0Yz5gEfafDyakWZLKEeY54iijdGTgUpDUUgLvdMxWxDLEFAL13F0
 kPpXdbpfu4ieQ1hClssgfy8tPvRrDSP9mk001R+DFp2gdWlcAODY2Hrdf4VnTZMliy4=
X-Gm-Gg: AY/fxX5qrT788SnBdPPlCnCXlNl9yJ0UqPMvaHiSeLpjFi6Zoa7Jy20/L6IOCqGI4s0
 pbUiBmBCCabuiJYq0957k5HSWYa1527znRi2+OZCerQQ4fBtHE1s4aIEspvdg7oS/xx7/uRMoFg
 3rrCcJqqKV/oruNsId4Ar2Cw/z3GeA3KQp8rjOHXR9J5UVubx5DxfDpP9IZW6H0OjTkUHVsol5d
 eYQaU7fU3HYIsSz0LvKBO8QCxkqYrJn7TXRf1wvCrxit+8WSMzO3xOBxckaI5iBD0p9BMWYKfYk
 5h/jqyrur6cEMq1I615+pNSas2x/NTBvs68rD3cqw5nT5ZvaQH8Xpusv/M5Tkr4TeZ0e6zuJpGj
 euuxs18lM4CRhh+oD6z9J8EDF68tJE84PZ6vcWASRTOQ6yf3g4fdd/k9AorFxzVRoo1V/IxpLYg
 SyTu/7bNhWPUr3V4NGe0S7bunht/lNGnz7oVrjMM9t3Oj6wBBt2GYYlSjKR6AcRyQ=
X-Received: by 2002:a5d:5d0a:0:b0:432:84ef:841f with SMTP id
 ffacd0b85a97d-4342c548710mr1806889f8f.38.1768380720110; 
 Wed, 14 Jan 2026 00:52:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450?
 ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df9afsm51750726f8f.24.2026.01.14.00.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 00:51:59 -0800 (PST)
Message-ID: <d5cc7760-95b4-4d46-91fa-d7266b0645d5@linaro.org>
Date: Wed, 14 Jan 2026 09:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: add EDT ET057023UDBA panel
To: Marco Felsch <m.felsch@pengutronix.de>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20260113-v6-18-topic-panel-simple-et057023udba-v1-0-54ad218ee52b@pengutronix.de>
 <20260113-v6-18-topic-panel-simple-et057023udba-v1-2-54ad218ee52b@pengutronix.de>
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
In-Reply-To: <20260113-v6-18-topic-panel-simple-et057023udba-v1-2-54ad218ee52b@pengutronix.de>
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

On 1/13/26 13:18, Marco Felsch wrote:
> Add support for the EDT ET057023UDBA 5.7" 24-bit 640x480 DPI panel.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0019de93be1b663f55b04160606363cd043ab38b..0f135eb35aa4302e9a33d91f29d1ad5c9959ced0 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2096,6 +2096,35 @@ static const struct panel_desc edt_et057090dhu = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct display_timing edt_et057023udba_timing = {
> +	.pixelclock = { 23200000, 24190000, 39640000 },
> +	.hactive = { 640, 640, 640 },
> +	.hfront_porch = { 20, 40, 200 },
> +	.hback_porch = { 87, 40, 1 },
> +	.hsync_len = { 1, 48, 87 },
> +	.vactive = { 480, 480, 480 },
> +	.vfront_porch = { 5, 13, 200 },
> +	.vback_porch = { 31, 31, 29 },
> +	.vsync_len = { 1, 1, 3 },
> +	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
> +};
> +
> +static const struct panel_desc edt_et057023udba = {
> +	.timings = &edt_et057023udba_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 115,
> +		.height = 86,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> +		     DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
> +};
> +
>   static const struct drm_display_mode edt_etm0700g0dh6_mode = {
>   	.clock = 33260,
>   	.hdisplay = 800,
> @@ -5112,6 +5141,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "edt,et057090dhu",
>   		.data = &edt_et057090dhu,
> +	}, {
> +		.compatible = "edt,et057023udba",
> +		.data = &edt_et057023udba,
>   	}, {
>   		.compatible = "edt,et070080dh6",
>   		.data = &edt_etm0700g0dh6,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
