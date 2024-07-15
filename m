Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE2C931491
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6477710E39A;
	Mon, 15 Jul 2024 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KcIV3E8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2B310E39A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:42:15 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2eede876fcbso21952581fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721047334; x=1721652134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=k+EQHqWsk3KyTfpZcgFPziNWV1GVC9Hoip1sZmqcTgg=;
 b=KcIV3E8Wmp0cZVGIUYHy6yjEhyS0hRksdUjwMfK9A3r9xFR2lykvKVp10n1Nfgw8kX
 hYOTIQGJld3aD76hsUiySThottvRECYrAVbdl2uxrk0bJUBxIeyw/B9UizTQ4j1X354n
 b9fbVRvLEXw0GS3zpmxrCckVh1RhurSWBgTP6J8+0GErAhA+27cASojU/S9/X2B9crxK
 Kr6B0wa8xZgNwqA6W1wmzbOiysJ5lxwYYM6nPJnwdbdkEOiHhQtBfKGYp8LbkxercRG5
 LemsrApo6S8MZwobX9XJfqHPiNEWOyVW1nT6Qp5CXH+3B5S2OEgZRnUpC9ILxxcHIjFF
 617A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721047334; x=1721652134;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=k+EQHqWsk3KyTfpZcgFPziNWV1GVC9Hoip1sZmqcTgg=;
 b=A9XhfmwvBDqfb+cigIAfyNK0qMp6zTLKV1rDXjKIGOiAaDeuWVtJ+5LI9ng/zenD9Z
 LlzdFCCRpJ9j9HazlOWh/lxRWOSBEeDyz5Ldcf6wVoPupOS8sKtDN2hk5UEKLLLCM0jv
 lHmF56lGCwtRZSjUpwI9tTlse4GlJUoAlTaAiifVMZCVXxMcEeJ4Po5OEkULL3j3xBhV
 G/svmaUR7An3z0OKWzUu0tpFSFeFJEsmtbJMzwJIDwjOKn+gaFVcQwb1aVS311G5y5kA
 SCBaBq+DwzcZXxG2QbwsjorTqY7BZYlsCGk7QHAN65aPXHNazd4epkru+yOJPaQeGPY/
 M77Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxw8hy+GYzlTm4UDo79yoIM/7O29lbqoJLsFkMaEcQWHHLsAfD9bJXh0cmQcMtqnxsww625YC4o7jESOXuyfzDvkXdQxAQii/JnZVck76H
X-Gm-Message-State: AOJu0Yz1DFyV/WX/AFhwbNWkC+jR8pzmhIXX7ZRmduyL3uVNQt6veaj+
 TTEUtUp2nE0wjb3wxpyQmJzO9YTyCChX5t3uNlextwOF4lYFHKxBV7HWZrqvRL8=
X-Google-Smtp-Source: AGHT+IFiuC6l6e4W15chCpGMEHC8U71AzWjph63xnUIfCY9cb8EqCei/7BgC+gL95yvQZ5BUSuVCUw==
X-Received: by 2002:a2e:8710:0:b0:2ee:6cda:6380 with SMTP id
 38308e7fff4ca-2eeb30e3cbbmr121814191fa.18.1721047333411; 
 Mon, 15 Jul 2024 05:42:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4?
 ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafb877sm6342646f8f.69.2024.07.15.05.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 05:42:13 -0700 (PDT)
Message-ID: <7daa3c0d-cecf-4f50-be32-ae116b920db0@linaro.org>
Date: Mon, 15 Jul 2024 14:42:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/4] Revert "drm/panel-edp: Add SDC ATNA45AF01"
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
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
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-2-31b7f2f658a3@linaro.org>
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

Hi,

On 15/07/2024 14:15, Stephan Gerhold wrote:
> This reverts commit 8ebb1fc2e69ab8b89a425e402c7bd85e053b7b01.
> 
> The panel should be handled through the samsung-atna33xc20 driver for
> correct power up timings. Otherwise the backlight does not work correctly.
> 
> We have existing users of this panel through the generic "edp-panel"
> compatible (e.g. the Qualcomm X1E80100 CRD), but the screen works only
> partially in that configuration: It works after boot but once the screen
> gets disabled it does not turn on again until after reboot. It behaves the
> same way with the default "conservative" timings, so we might as well drop
> the configuration from the panel-edp driver. That way, users with old DTBs
> will get a warning and can move to the new driver.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-edp.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 3a574a9b46e7..d2d682385e89 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1960,8 +1960,6 @@ static const struct edp_panel_entry edp_panels[] = {
>   	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05af, &delay_200_500_e200_d200, "Unknown"),
>   	EDP_PANEL_ENTRY('L', 'G', 'D', 0x05f1, &delay_200_500_e200_d200, "Unknown"),
>   
> -	EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "ATNA45AF01"),
> -
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1511, &delay_200_500_e50, "LQ140M1JW48"),
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
>   	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
> 

How will we handle current/old crd DT with new kernels ?

Same question for patch 3, thie serie introduces a bindings that won't be valid
if we backport patch 3. I don't think patch should be backported, and this patch
should be dropped.

Neil
