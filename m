Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA271CF43E3
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 15:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB16110E41D;
	Mon,  5 Jan 2026 14:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t3d0dFhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D1210E41D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 14:52:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso133701665e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 06:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767624733; x=1768229533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=o4f2DQ1WSbAm2u31CVo+GntDagSQYTjRfPhTR4DZPJI=;
 b=t3d0dFhY6Pm/7WRJOmunf4zbcqRLPiiqFuW3/nk0abtzW7ommw3dCCo3DDvzrbhHwp
 dDPgXXE4jqwgcGDn1vgLkp+y22RyRvIkWoGUvR97BAU6yqp7u8pTdQvWuOkJ1Zl5nZC9
 9NFnv/gzOpahI2VrwHIA+Pu2T9G3NJXfY2F42obSshRU7wpEzTS/udYlz/llTDgH4CcF
 cc+a3OPDLr99yLKGHq5u+QgS2w3/YdXKPU/o4FJyIavnALCKat104v6WWiUfYZXBQiy/
 00xcdTFCHEtk/q4Xl/Zq+T0aK5/bd43Ptn7eERt7DMo8aA+nczaaoCifpI7uK1YfYx/C
 kIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767624733; x=1768229533;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o4f2DQ1WSbAm2u31CVo+GntDagSQYTjRfPhTR4DZPJI=;
 b=Jgxn41bQgljv561IIOwFC2Bcy0/0mFLGAvuHRs7Bnr6yu9+m7gWDmaYu9HJqbsM26I
 HFharuhetCYIaIvEte4pzoSfmJyTFFiK8qYCpd/IDcvv56RveqQ1Wjry0/uDtJMAJp4R
 NZiF0oDEPBLe/9F11sJBddG/OPAbqbFxBOoes0LRRTs+C5f5DFuONebNX2p9jsHuVtBE
 M7LuQiTKviPmIfUxaTPsWc4aVzo1Kt5PExqLSAuHKQeharBlDZvLMomvvF9kk0dzkITt
 NJ8dMXfg8jKzQkuPTgBEwgPYYZUlzyGV7jeEA+RD2tmQupicLHD1LzneMLY7EnmSj1cw
 0yIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXa1emUmy4RAd4MLGpZB8EI9QN7p6BSKhuiNY4LRuyRYLatHGcfASFQH2B61cdvzrDKsptX69FK2g4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm8zhqln8BNJDlOKieRNgvByjxb4OU1NAVW3XeIPbXP7L4UB7u
 j9eTaJk6qW8xDMxVyH0R81igdwegp8Te4cOskwFuGnUwiub3NpEN7NegK9pmpGeM2Zw=
X-Gm-Gg: AY/fxX7iO5+C6Sk5aGgx5dS2AFndqnLHyfl0pn36HaOxLQ0gjWNqM8xRqiTxN1sseTl
 dLvzPeCTNQ6M0ZaZEjXVC48NmiuOJJtOl/xO4smIsCdT1lMoAeXWq799tYYg2qwyArUoLq2P7B7
 w4JsbEI29ohRJzcGpDep+wjSkZyHWfU+IKLZ3igmqhS8PK0eeZ7MC3+Nb9wAbE0MZd9rj0eTL/D
 eS4Vy4kVMGF/HDTRrEC3jjdaIUGFVhSuHXLWKOrYuO3+jeLexPj2xVEQBPFMnEgxu+/6Wh0Z9Ho
 wikYUynEP4krVeEV4l2xZnefxVG8sNDtLlXQ+l5IAkaNaZV99eZcDlNG7JwIpcCjezEMNT9Ycws
 Y96LAZsIrPvHsoX+Zul+DEvYhEaY2L6dJV1W8ao8nPcwuhjrzM0LpWvuUjCELVuF/pEJw7wX8QX
 LGsrLjBq0vn1yfk9hvlWcNiNX50yQ9aWo4dunq0ObIX+MZLOrQR+YP52LGg/wRFO8=
X-Google-Smtp-Source: AGHT+IF04xwY7BPXpJXoTEi+h7FZBuYpUNOJ0m3AYz1i2MW5UInfMvTq40PaR8bkTy9F4e2TmhOFXw==
X-Received: by 2002:a05:6000:2c0f:b0:432:aa5a:3916 with SMTP id
 ffacd0b85a97d-432bc9eddbdmr31074f8f.40.1767624733256; 
 Mon, 05 Jan 2026 06:52:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033?
 ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa0908sm100780184f8f.31.2026.01.05.06.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:52:12 -0800 (PST)
Message-ID: <aac69070-d000-460f-a1fc-4ac5c097c7e5@linaro.org>
Date: Mon, 5 Jan 2026 15:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up
 to 3840x2160
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 tobetter@gmail.com, christianshewitt@gmail.com
References: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
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

On 11/8/25 14:42, Martin Blumenstingl wrote:
> Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
> for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
> the code is using the DMT code-path, which ends up in
> meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.
> 
> The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
> clear whether "4K" here means 3840 or 4096 pixels.
> 
> Allow resolutions up to 3840x2160 pixels (including middle steps, such
> as WQHD at 2560x1440 pixels) so they can be used with computer monitors
> (using the DMT code-path in the driver).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> I'm sending this as RFC as I'm hoping to get some comments on the
> "4Kx2K@60" note from the datasheets.
> 
> I have tested it myself on a GXL Le Potato board using a computer
> monitor at 2560x1440 pixels.
> 
> This is the spiritual successor of a patch titled "drm/meson: add
> support for 2560x1440 resolution output" from [0]
> 
> [0] https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshewitt@gmail.com/
> 
> 
>   drivers/gpu/drm/meson/meson_venc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 3bf0d6e4fc30..4abd0c09b442 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
>   			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
>   		return MODE_BAD;
>   
> -	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
> +	if (mode->hdisplay < 400 || mode->hdisplay > 3840)
>   		return MODE_BAD_HVALUE;
>   
> -	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
> +	if (mode->vdisplay < 480 || mode->vdisplay > 2160)
>   		return MODE_BAD_VVALUE;
>   
>   	return MODE_OK;

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
