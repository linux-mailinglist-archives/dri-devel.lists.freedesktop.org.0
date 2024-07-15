Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966A931484
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B4110E395;
	Mon, 15 Jul 2024 12:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OqkdEBIR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCE710E395
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:39:49 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52ea2ce7abaso7255679e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721047187; x=1721651987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=7gH55ZBRG1kDzYX17Z1m8ISO+nPg0AynWe+Z1hnLOVc=;
 b=OqkdEBIR/Cfg83pLkGPVqQpHamGLDQICNmVwcs7quqfXACNjF5ZkSuiQIAB6UT1k2r
 hBvP7JEFCRS3aSUeytJHJyS0VL4xcZuUp0dp5gZhGzLIqxtV31HbqtGRb3NqAhaocyLQ
 A0juQkEJog+maPxpK2RIqoFSx3nxCb6RZiHIWQ12hyvk8dvOZsmmbh/qbMQ8+A2nRsUi
 aDlKTJht9H67mLN9H0dbH0NMMB2nl/C355906ILB7+5XN7sALbqsxDpxIwXueU8FXYUh
 1DNU75w2ghbtWU35xPYOjh3jFFGIUFtCCJ3kR71pOy+MpmCknUQzE6H22TDMaOTKVaMJ
 DIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721047187; x=1721651987;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=7gH55ZBRG1kDzYX17Z1m8ISO+nPg0AynWe+Z1hnLOVc=;
 b=gNwzD3HlXezyFsMsA0LBEGJA3Xu1zsZTnjUSABbBcLl8ZS2Sz7pRVw9YWEa50M38XB
 n6KWzX6dTejnVDSN2Ysz0gMMVHFQ0IBCxaIR1i7MABdQZmXvjbzbpx9ny3BOoNt3g8tB
 iQSiGnEseTjBZmLKpr/yDBZfNyOdSmIKF03J9SrS4fJiRvkVoIE/NeV8u/NnseslR1fr
 vk/lM/2DhqFa0Z+fAjbN4BB4QEv5E3dKQPKlCr1s8IjqZk3lZmitW3DrYbWL+Uym2pm1
 ad1JDrQ6u8B+YLKHJ+RTd5zVRfuocB9626SxM6TNSW2zwUB7CcKlY8Pzgk6ThnoADbbt
 LXAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3KQ22Oy3Ha7uTi3mELrX25snHqEiJRhbkARIvkjjNf2k9mJkqxp0vCZ3MZq7Z7Xb39P5O1EVZJ/o2mb+iTbHjNOv5VTOjvht21tKdhCt+
X-Gm-Message-State: AOJu0YwRADG/fTNByVWDBtiAZgJFrjJPn6gFaFJwpgl785+29ftcEhOo
 rMBsYH62Fc5SlhzWKsfO0LSZbEbMwHKzZkaSdnI5OqQtT8YC51v/Vl+bEHiYm6g=
X-Google-Smtp-Source: AGHT+IG0OXfQcLipSf48llRoOX15EzCz04BwPMChxyFZ3PVdA0NZhLC9CpVnnmVec+TrtGS/z/xXIQ==
X-Received: by 2002:a05:6512:3d8e:b0:52c:e00c:21cb with SMTP id
 2adb3069b0e04-52ebc808107mr14069102e87.62.1721047185571; 
 Mon, 15 Jul 2024 05:39:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4?
 ([2a01:e0a:982:cbb0:79bb:5f59:8e51:52d4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5ef4617sm84793345e9.41.2024.07.15.05.39.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 05:39:45 -0700 (PDT)
Message-ID: <123237c7-17a3-4235-8f30-821f31c1fdbf@linaro.org>
Date: Mon, 15 Jul 2024 14:39:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
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
 <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
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
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-1-31b7f2f658a3@linaro.org>
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

On 15/07/2024 14:15, Stephan Gerhold wrote:
> The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> control over the DP AUX channel. While it works almost correctly with the
> generic "edp-panel" compatible, the backlight needs special handling to
> work correctly. It is similar to the existing ATNA33XC20 panel, just with
> a larger resolution and size.
> 
> Add a new "samsung,atna45af01" compatible to describe this panel in the DT.
> Use the existing "samsung,atna33xc20" as fallback compatible since existing
> drivers should work as-is, given that resolution and size are discoverable
> through the eDP link.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml     | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> index 765ca155c83a..5192c93fbd67 100644
> --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> @@ -14,7 +14,13 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: samsung,atna33xc20
> +    oneOf:
> +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> +      - const: samsung,atna33xc20
> +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> +      - items:
> +          - const: samsung,atna45af01
> +          - const: samsung,atna33xc20
>   
>     enable-gpios: true
>     port: true
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
