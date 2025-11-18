Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F71C683CC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:41:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBAA910E13A;
	Tue, 18 Nov 2025 08:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F9e9N1nk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2748910E13A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:41:19 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42b32a5494dso3054867f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763455277; x=1764060077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=yq4vFOa6PyL7QNMnAmGQxCezFFACJ7a135Nb6zfyyV0=;
 b=F9e9N1nkn97avB0oI898wW0r/Cuwy70Ao3fcqlXdCeIKuJXU/qepJ1kW8L2B7mSndE
 epuSBLaQ2YDBRzO+V1wQnnmFVvFzQdqEk8vQssx2Sc7SID/F+KDUtuaN2ZQTszdWMKvR
 P7+HC558T2jBcgt/iLH4GUFM+P1VXjTsE69HO92IFCI+kS2iuM30K1RXmeUqmbn+5MDn
 +C/tqzlfwyUH9mioxWf2+XADQ9gzIjS3r/maH10ERecKxuGKbi3xRYD9BtrCqLHUuaIO
 OLG5FFRRACpytMbUaupXz4TFvaeNexz2hNJ7eWaferaOemmK5WxJULVtgDK+KWwdtlQ0
 Ll0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455277; x=1764060077;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yq4vFOa6PyL7QNMnAmGQxCezFFACJ7a135Nb6zfyyV0=;
 b=hvbdNJMMPLweCB1HcPtUkfMwXyQRD+C6fyyMN1A7HmBPPtoJp48KY0DW6Vm4OWrNMl
 dr7h6G2oF7/nhmroDxufcJ+U/x1GIwFXW9Y1D8mjX9CZFeK2Ugo1J+v92DacYNaLs+fD
 YqKDuD0u6sTYFOKrJ+f38PG4iFMSSATSz9c4OZ04vwhLPedKBTuBWiJjTWY5m9JNWZND
 tR7gnq0a0mVNaMK7HKx38RS+MEKFm9Y1tZviTW8ZUDHKqSxv/sIToOvtjB4DF6jG1lYA
 jc4a5xsQSD/5dDSBvGgm1DQqXI08a2hz0sBf058zgp6obdUxqSE9ks5/wGxA59OKjoOv
 +QGg==
X-Gm-Message-State: AOJu0Ywsklcv+Y/E2Ia03dfh7gaI/dyLxOIapvbZbqjXLeq9t7Ac1ECM
 IhdY9V5oHQtSMZm4zZ2RhFj8P+cAh0W8qHl8r/yTwTTX5Nfei8RlgFjWxiOMvld86Yw=
X-Gm-Gg: ASbGnctT7RwFNmHtWpnt3tWysCzmiwPdGSNHSiKUbw2T6A4JWZbDVd1eNO+DriYqiBU
 ZywcZh+rU6kCv86C7Xq+ghGszbsyVIn6GjE2KoPFb8QFk+y+ACl+O0JL8r46qxzwNPE+izXWs9I
 IsSozr2M6J8NoQPzojZpX/d1Jr4CGRbTcW8pwDa37Eedxbu2rRhM8N0462nUKibCZoLqq1+CEHB
 Kn01DIAbQqlCbjgovWQ62PVBqy6NudAGUoY02Q9BSWsrzvTv3OZI8M7RbGnCbZLpkRYn6QbAJMd
 Wl0UfAedOIWwfeL9137NtwZJc9zGpGhreJnfHulnfpKnrnL7u0wd4ln5kH4UWdgaPOuFadayEw1
 f+QmHzCUkQ2LpT2Hb3VzcDluMXm0DMPA40dio7SYzIgishXYJ5MLTsFDP/l79d8JShEi/tYtRmN
 OdnxYu2ph3BojTI6KbbPHzHgwBLSj1kjMs0TeCYgdeuhU2tdVwq16D541RqbGPA0TZTEtKser4x
 A==
X-Google-Smtp-Source: AGHT+IH41RiGPHEXbxH0nSlq5WI8s9kpwlJS/lHBgfJ72O2j5qeoTLetkMeucm/wWN5c+EHRHiOcTw==
X-Received: by 2002:a05:6000:2087:b0:42b:3bee:a7ff with SMTP id
 ffacd0b85a97d-42b5933b831mr14592311f8f.24.1763455277412; 
 Tue, 18 Nov 2025 00:41:17 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49?
 ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b5ce849ddsm24329515f8f.14.2025.11.18.00.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:41:15 -0800 (PST)
Message-ID: <8c2069c4-54ef-4cb2-8277-a807d08b472c@linaro.org>
Date: Tue, 18 Nov 2025 09:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/7 RESEND] gpu/drm: panel: simple-panel: add Samsung
 LTL106AL01 LVDS panel support
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251110091440.5251-1-clamor95@gmail.com>
 <20251110091440.5251-6-clamor95@gmail.com>
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
In-Reply-To: <20251110091440.5251-6-clamor95@gmail.com>
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

On 11/10/25 10:14, Svyatoslav Ryhel wrote:
> Samsung LTL106AL01 is a 10.6" FWXGA (1366x768) simple LVDS panel found in
> Microsoft Surface RT tablet.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 34 ++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6369e5828189..bdb53824e3ed 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -4223,6 +4223,37 @@ static const struct panel_desc samsung_ltl101al01 = {
>   	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
> +static const struct display_timing samsung_ltl106al01_timing = {
> +	.pixelclock = { 71980000, 71980000, 71980000 },
> +	.hactive = { 1366, 1366, 1366 },
> +	.hfront_porch = { 56, 56, 56 },
> +	.hback_porch = { 106, 106, 106 },
> +	.hsync_len = { 14, 14, 14 },
> +	.vactive = { 768, 768, 768 },
> +	.vfront_porch = { 3, 3, 3 },
> +	.vback_porch = { 6, 6, 6 },
> +	.vsync_len = { 1, 1, 1 },
> +	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW,
> +};
> +
> +static const struct panel_desc samsung_ltl106al01 = {
> +	.timings = &samsung_ltl106al01_timing,
> +	.num_timings = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 235,
> +		.height = 132,
> +	},
> +	.delay = {
> +		.prepare = 5,
> +		.enable = 10,
> +		.disable = 10,
> +		.unprepare = 5,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct drm_display_mode samsung_ltn101nt05_mode = {
>   	.clock = 54030,
>   	.hdisplay = 1024,
> @@ -5390,6 +5421,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "samsung,ltl101al01",
>   		.data = &samsung_ltl101al01,
> +	}, {
> +		.compatible = "samsung,ltl106al01",
> +		.data = &samsung_ltl106al01,
>   	}, {
>   		.compatible = "samsung,ltn101nt05",
>   		.data = &samsung_ltn101nt05,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
