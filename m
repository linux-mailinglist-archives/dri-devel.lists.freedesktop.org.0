Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FAFA66D98
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7068110E451;
	Tue, 18 Mar 2025 08:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xFEZ5h2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B484D10E44D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:12:33 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so4527698f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 01:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742285552; x=1742890352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ekU0V/TxaNd7IwpxOyskUtDxhInPM+KcMXnEVWAgd0g=;
 b=xFEZ5h2Rh4xUOD4L/OG65CL5Y+gCY4c8roleLlwFx+a2vQTNtoEQi25orvwsZOWtCi
 1+i+NdsI/Rg1/4JmmXfTmrkeNckEMO6YO538VhZp+l6jqwzvhyh8II+0D/dZVNolVTcR
 Z3gZ9H9x5HsnzQjmb8UNvwkL7v+tpvMK6AM1VM/g4rmlFM9Y4sykMpEUhxIUZTfcHric
 6mK0FyjsJ0g39kqldcqRiACrOC0Ne3USBLTsbC0utHchan/fNzz4MFgatP4PX4rgaHYg
 IDTmMJcO7s5P8zUV0EI7bOfvWFzFSlatPfNGcUupYn/4Pah1djaaSlS84PIvYGS0xLfO
 ROmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742285552; x=1742890352;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ekU0V/TxaNd7IwpxOyskUtDxhInPM+KcMXnEVWAgd0g=;
 b=eYWRQreprjyiZU5ZPttZu3B9CAjK/+RZIMgk41+au7qHRVXCNgXUKxb4HdqxOkTf4y
 SaK5uqQBRl5NdlJMojlZfdEQKOP1/TClL9RvkewmZgh5GKveCNfQiHp+YcMOpmeg8L5k
 wu9I48tN6ViZU9ra3qtePkQYVVXmVLXgVMzpE09XgHTxRXIcTSvJ/pRa5EDn6PoEtpqM
 /1MbBsCtrhzjKYxbCqypuw9d5no2H8VwKB21iflw0Ow1QH8+zQZd7ZPvWnWRvD4dhsMR
 OYQjBnKKXfVGgTOR3P5oDI610dG1se7HWXie97Zyo79vuLx0jan7padr3sFSGCRS0igT
 0gcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7XSeDDoC6m+kD2bSBeesVYzzym5JS4BfzVVLW1metCk6cIzCLGdReC6JkyIBUTnsyDg62aGIz7CQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHCt7OtR3+OYlH3vaSNFlAawkyBoGRGO9drWVhgvsIkOwuBpvT
 5g8SrQHlq/DWpiWIMPGTLI/sdFUwb6L8iTAX9CQDlzF+jzb9rDMx1PfhIuNSi98=
X-Gm-Gg: ASbGncvi/Coan15SsYmO19l82VmVdkxnW9z+TuCfRJII5O9Zge5n2qABH3GFOtZgYWy
 A/6EKltl09QTcJzUoPoZD4aAN5i+jLR6a9+ZQ1EoAnf6GFE8eaJHSoPI7BNTzOlnVhPMI2R1zgs
 4iKT61tztguJjblB32u7n8diIYUgZvNOwjyfDmxMmjqIKE6sHISQnxaAma4/TnHncMsq9SppteY
 1Mfd5wcPmmS5HksCRX7s/lARJFFDL6APu5/GTsDICq40y+aThtRjStiEsDvi8odgNDSatCLxJH9
 zoKFEuhYhjzqCd3/3+WiBOuNCAwjcho+ZZckDCCCSJOf3OIixPocxeLPHIV9WBaqsoWFhk2RY84
 g8LqM+W6oWpayNmePoLugCQ==
X-Google-Smtp-Source: AGHT+IHKV1aaXGeWrW0acEVO2zpsKeS9iOAKguINbKbDjBpEJdqSE+HZOWe+tVFPCJYy6aSPNPr9Zg==
X-Received: by 2002:a05:6000:156b:b0:397:3900:ef83 with SMTP id
 ffacd0b85a97d-3973900f0a4mr15899999f8f.32.1742285552144; 
 Tue, 18 Mar 2025 01:12:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff?
 ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318af0sm17456499f8f.73.2025.03.18.01.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 01:12:31 -0700 (PDT)
Message-ID: <74bf5ef4-3d55-417e-b365-94e234c5505f@linaro.org>
Date: Tue, 18 Mar 2025 09:12:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add NLT NL13676BC25-03F panel entry
To: Antonin Godard <antonin.godard@bootlin.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
 <20250318-b4-add-nlt-nl13676bc25-03f-v1-2-67e0f8cf2e6f@bootlin.com>
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
In-Reply-To: <20250318-b4-add-nlt-nl13676bc25-03f-v1-2-67e0f8cf2e6f@bootlin.com>
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

On 18/03/2025 08:58, Antonin Godard wrote:
> Add support for the NLT NL13676BC25-03F 15.6" LCD-TFT LVDS panel.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 9b2f128fd309..96e8569d97ca 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3469,6 +3469,30 @@ static const struct panel_desc newhaven_nhd_43_480272ef_atxl = {
>   	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   };
>   
> +static const struct drm_display_mode nlt_nl13676bc25_03f_mode = {
> +	.clock = 75400,
> +	.hdisplay = 1366,
> +	.hsync_start = 1366 + 14,
> +	.hsync_end = 1366 + 14 + 56,
> +	.htotal = 1366 + 14 + 56 + 64,
> +	.vdisplay = 768,
> +	.vsync_start = 768 + 1,
> +	.vsync_end = 768 + 1 + 3,
> +	.vtotal = 768 + 1 + 3 + 22,
> +};
> +
> +static const struct panel_desc nlt_nl13676bc25_03f = {
> +	.modes = &nlt_nl13676bc25_03f_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 363,
> +		.height = 215,
> +	},
> +	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +};
> +
>   static const struct display_timing nlt_nl192108ac18_02d_timing = {
>   	.pixelclock = { 130000000, 148350000, 163000000 },
>   	.hactive = { 1920, 1920, 1920 },
> @@ -5056,6 +5080,9 @@ static const struct of_device_id platform_of_match[] = {
>   	}, {
>   		.compatible = "newhaven,nhd-4.3-480272ef-atxl",
>   		.data = &newhaven_nhd_43_480272ef_atxl,
> +	}, {
> +		.compatible = "nlt,nl13676bc25-03f",
> +		.data = &nlt_nl13676bc25_03f,
>   	}, {
>   		.compatible = "nlt,nl192108ac18-02d",
>   		.data = &nlt_nl192108ac18_02d,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
