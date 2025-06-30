Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEF4AEE26A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB8010E485;
	Mon, 30 Jun 2025 15:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZthwaPNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C03610E485
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:29:22 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-453066fad06so30625265e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297361; x=1751902161; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lyhLcg43dCZkOg3r9AJzjxtQxVvDwA6brW0xDWkXp7g=;
 b=ZthwaPNHwfbZXfucea6srAQFvzTsMqOlNVVl2qKs/fEzrxvzNz39VPkuZm0jrZ0GaJ
 E4/J5yh5khQ9oHyoxyOErOdd9Jf+HDaxSX9MtD7caj6jHHr/SUga9YEGtVmb9VD3FH0c
 eXaCmIcFiEa18ijlBvXZfvBgUFrlLIwzZ4ltran8ffPNz8vkOpqZdgdDmF/ciN2IH2/Q
 ncdRx7AN4BJVCbBFkq/AE7Ym1A4NVwCsN5r3r/goXUXoaqxeYkcQNpGjxiLoIxHMCI9K
 KnUOHXsU9YV3eT+sJLTnfRU1b5K4OE5Y2Gn+awVDHlbqDoHmmTCojz0AnvB9KYfW3TLS
 /I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297361; x=1751902161;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lyhLcg43dCZkOg3r9AJzjxtQxVvDwA6brW0xDWkXp7g=;
 b=K5pw9l/l13aNtGHMG+8jmRbsTkVFPFGlaW/VOQ5P3reCTqMWdgvLzN17JE0YRmwSkG
 PGkXSRbtuC+4FLJejameBYN3XKg4URAOfMxMv7ME2Tmmj9Fkh7zRMt2RSyjsIOqWw3rF
 h6dkBkNNjAljgNS54AWXpllUpBZ521iWjxCLLMFLXuEHtH3/nmKgqmg65KY2NubYq1ZT
 SjG+/TpNUFLqLz56WN6R6cn4IV1ekJOy6o6SzF2NtkDaYrjYx7eKT73I+xX248Xu3SXD
 vRNku0izF+TxKt5ItZAbzz2pcAFLbNnXELulAPZBez0ihApKuChzuvH6Nj6Xx81m2j7g
 E17A==
X-Gm-Message-State: AOJu0YyHIaLKFSxtoox2sx1FopdwEAi8CQ7TTBrHd4tr4zK8vWufq/fd
 xC6fo+RCXkF7C2SX9gHYKNhr3cUMPHQMRhLLGxox7uzo+5HDExQi5+pZBdhrmXMndCU=
X-Gm-Gg: ASbGncuDY33eRRwFtq0UIanwI7kx2w/x2XV90Z8fbu64gghwnE9SpL4ibq2hthm50tI
 f018xN5MsEhabFcDnvGFzDJ7f+jvbWdC92aSnBSrU0CCf8S9NnofZ6f9heO/hHLqkrF0LZwoH3/
 1X/xBC7jN9c3TArVDwh2oQIw20ORwJ+mICCsiY3tc7z7DdqxezPqRLvphfqyqa2hL80EvqQGAAu
 XbRY2SRqLrne0sM6dFPuD3ZlEDf+46uDjrY1lzH0Nr1EVaEE5QAzaeP+B0ucQnKSklUmGkhvUQp
 02oOy0hKPvqt5aXG/7D3lVG5vuItIEkorF8HxEq40glGCS6V3hryoiEHiczNLOI6ITQG7DeRw6e
 ySdfuXsljmO82LCWg/p3rqNgj1ob41D0drf+Rq6MI+GaccuFE2Q==
X-Google-Smtp-Source: AGHT+IEnqbd8jzud+AKyN7wsGShNV1AQfJKdXYzndE6kZZl0r0O6j/o8j4SrtXPzHfSflaQKjGC8rA==
X-Received: by 2002:a05:600c:3494:b0:453:5c30:a1fd with SMTP id
 5b1f17b1804b1-453a33d6fb9mr28079915e9.8.1751297360613; 
 Mon, 30 Jun 2025 08:29:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a72dasm138329335e9.16.2025.06.30.08.29.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:29:20 -0700 (PDT)
Message-ID: <80055981-3624-4165-af0c-3b60c345e8f8@linaro.org>
Date: Mon, 30 Jun 2025 17:29:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: document Samsung
 S6E8AA5X01 panel driver
To: Kaustabh Chakraborty <kauschluss@disroot.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250625-panel-samsung-s6e8aa5x01-v3-0-9a1494fe6c50@disroot.org>
 <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
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
In-Reply-To: <20250625-panel-samsung-s6e8aa5x01-v3-1-9a1494fe6c50@disroot.org>
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

On 25/06/2025 14:41, Kaustabh Chakraborty wrote:
> Samsung S6E8AA5X01 is an AMOLED MIPI DSI panel controller. Document the
> compatible and devicetree properties of this panel driver. Timings are
> provided through the devicetree node as panels are available in
> different sizes.

Wait, why ? Why not multiple compatibles ?

Neil

> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>   .../bindings/display/panel/samsung,s6e8aa5x01.yaml | 78 ++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..23dae6e961ae01c99de93bf4b4a067f2953f8edf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa5x01.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e8aa5x01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E8AA5X01 display panel controller
> +
> +maintainers:
> +  - Kaustabh Chakraborty <kauschluss@disroot.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e8aa5x01
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: core voltage supply
> +
> +  vci-supply:
> +    description: voltage supply for analog circuits
> +
> +  reset-gpios: true
> +  width-mm: true
> +  height-mm: true
> +  panel-timing: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - width-mm
> +  - height-mm
> +  - panel-timing
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@0 {
> +            compatible = "samsung,s6e8aa5x01";
> +            reg = <0>;
> +
> +            vdd-supply = <&panel_vdd_reg>;
> +            vci-supply = <&panel_vci_reg>;
> +
> +            reset-gpios = <&gpd3 4 GPIO_ACTIVE_HIGH>;
> +
> +            width-mm = <62>;
> +            height-mm = <128>;
> +
> +            panel-timing {
> +                clock-frequency = <73094400>;
> +
> +                hactive = <720>;
> +                hsync-len = <2>;
> +                hfront-porch = <62>;
> +                hback-porch = <26>;
> +
> +                vactive = <1480>;
> +                vsync-len = <2>;
> +                vfront-porch = <12>;
> +                vback-porch = <10>;
> +            };
> +        };
> +    };
> +
> +...
> 

