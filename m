Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C099CF73DD
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91A410E141;
	Tue,  6 Jan 2026 08:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rEF6hIDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A3A10E141
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:14:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so338328f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687253; x=1768292053; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ii+U2kkmENl7Q+lGbfXTTObE1dsXq26X88+iH+JNQ8k=;
 b=rEF6hIDJmvSlsAyUp+ijb+ajEG1JbR3DiPt6rx0qzLbZTnYq5Zw2UP13UA2UqWdINj
 SXotmlqOLku48Z0CgtU4uo38QvKSm/nrluxPzAEtbe29l9o068f6h0RX+I6EfalyPfF9
 YD/oNyUY/TF98Bo7AqZYhJxpx1v4mLDMhz0tw6PDbhPcQRmeQOHK6/1sebW8XvfqZrXn
 X2xIQlq5u8WOsBPdyX0gFo8TLAQNwOJ0RK45NjjrB5gTeeVBCEp699SpNkNsagzDQCoK
 snanYIfYJkZlneMIs6YtDP4FVGX1JkpwX1dR1i6pasAJdY60g62vjJl0M1qF3BvAxe9P
 PyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687253; x=1768292053;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ii+U2kkmENl7Q+lGbfXTTObE1dsXq26X88+iH+JNQ8k=;
 b=gEOKemwYgL0mA6tEqizxmf3wepdXe7xjTUUJnxXG7e5IiegBfTojknjQ+bQArhQsUc
 KrEQ7FRlCII0xQo9kt8ZkzPcTlZdv5tbLhd5OaThJffRi3gWtlaqV1FwtVPjHEuSZoPY
 T6Y5hNG4WklzXL55SFylR2Qmj9jFMo7dsEdmkldBAW4HJnMS9e/zvmqWD+li/ZRNTeqW
 SblmA4TiEwtaBKjI9HoKxV3OuvuhTL44IIl53NEsverdDRFrzQVaH3F7vOS+ZvqkZ5Pt
 n504Xck4hg5fhJPQ2exuzanDYBmNtpakWmSWSHF+ryBmVuyedHOSZi4hPmLmxzgtt9vI
 p+KA==
X-Gm-Message-State: AOJu0YzExqqYXGPht3n5saV+FmaZOFe3e0Zpy7M6y5r204Dq7XT4AHZZ
 Nil8luqTccYE9uEv2sixiChV+dt8koorSW+KrFc7Op2xBzv14jU2hEbD/wnNmkkmWbI=
X-Gm-Gg: AY/fxX6cu9K4MxrmXdxkNk2qC+z9VmLWq1/sVstugdZCmJaLE3MMQbn2Uak2zZeZgDM
 tACp5mkReP5aclimjgDMdqDj/oENnNp11oT+UgWupKs9dEOPGxpqsm3lAUmxsizgpC2MbSJwu2h
 ouuhVf3lsXAtHhbWdvMLlb53TrvFhrv1vq1MLOEep9MpqGz9ihj4Agd+XET7s6/ZOxssTGkEnnz
 SUKWhLXjqxJC8nf7SWaeas5mAmDUhBD1vYYYJJUkEmqdP0vBnsyaaeOBhjDfh9z97lWmQOsfcLZ
 gAPpVGXX15v0hSDh6PBgPEn2GLm5h5MuVOKOsHRLQTEAYiaj3oiuBHjVt5KH5/zHbdcqHz+0Q5C
 b8zvq0lWz240/RNuT6BuluI4jyuFowpFYtWhGY00MHJyQ0ENdvFoMZ42VmT1PttLrwfE8KmxRBG
 6UBm9mInkox/3W0DS9GOK/GuBRcRGds/w7l/9c4hKxr8wxJZaOImdENaSAzF1R+Co=
X-Google-Smtp-Source: AGHT+IHATq5uwiN4VzeFS6tPgDXNO8esPfEdaC8X8JSwF4+EbYYQv2Zto5bR9hPaGaQleXIeGbsubw==
X-Received: by 2002:a05:6000:2881:b0:430:fd60:940f with SMTP id
 ffacd0b85a97d-432bc9d295dmr2891120f8f.14.1767687253356; 
 Tue, 06 Jan 2026 00:14:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e6784sm2922640f8f.19.2026.01.06.00.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:14:13 -0800 (PST)
Message-ID: <14a9191f-8b2f-45ee-bbb4-32eb577bacc4@linaro.org>
Date: Tue, 6 Jan 2026 09:14:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/5] drm/panel: mantix: Enable DSI LPM
To: sebastian.krzyszkowiak@puri.sm, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
 <20260105-mantix-halo-fixes-v1-1-1ebc9b195a34@puri.sm>
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
In-Reply-To: <20260105-mantix-halo-fixes-v1-1-1ebc9b195a34@puri.sm>
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

On 1/5/26 21:24, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> This improves reliability of sending DSI commands.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 55664f5d5aa5..fafd80f3e952 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -258,7 +258,7 @@ static int mantix_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM |
>   		MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
>   
>   	ctx->avdd = devm_regulator_get(dev, "avdd");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
