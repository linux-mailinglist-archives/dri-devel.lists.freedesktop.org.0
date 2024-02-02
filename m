Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07790847B7D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1955F10E850;
	Fri,  2 Feb 2024 21:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S5X2EuZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8FF10E850
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:26:17 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40fccd090c2so2538525e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 13:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706909176; x=1707513976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TmB9on2Qyd1/EoIwQXgbQR2FlMtBTSI1mKzg7M+hgpA=;
 b=S5X2EuZnzd/OBcI00CCJbskuPCuqO2f5oDF4VnTMyYayawhQp0VYwhujgtpJ4HvD4B
 WwKrgz8WeJWFUkMxYfYcH1iYsLpQLXKpLndYRrdTZFHjTK222DohE/dfgKeZ3DvBQTRi
 xo2NFhWXZfnsSzgEqbKZvYqhnN8HphyGlutWAKelTek6SiCN/LXCshg7SWQqEYjQUo3x
 WulfVqLOL25M95lUt3SapAwEAC7H2zWoXdQpmREWxfpdB3XJOHXfOYwGZ+61Jnuqz4yL
 OAVJWUYY5mtpBpkN1lWLUU3vOgdsbscexCvfYbNjVAEb6wI9lL8CcSU0iFHFzAPjAYSR
 aBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706909176; x=1707513976;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TmB9on2Qyd1/EoIwQXgbQR2FlMtBTSI1mKzg7M+hgpA=;
 b=j1oOnk3SgVxXCvzC8pkv3zZVDGpODyiBEbllI2zNtfVeif5geo7ZZlVv5yhehvoufY
 fdk3OGqevIFpk/zm6NeGfta79icou2ENN3303NgYsZ/tbjZ25KFlEa+5KciVGlFrkHwB
 GiFeJ21OvGNqeCPBD1Ew9WDOpkGqQi0aLAh84RMns+X/Bws3q7V/+KLZeFH66P0T64hl
 SfhziezJUejHwyVPpntr08Kl/zuGsvBQgAvpH/hC2t1aB4Dp2Pn1dVjmEW8ZmTQ/Hf4n
 0cUW7bI6i0V0UVtRGbpvVCGvKVzglUrCTYqNschIT69Ni4gCygjBsizsV1/wAG40MsDC
 1WYg==
X-Gm-Message-State: AOJu0Yx97TVobkt1qkBrsD7gaxY/DAsbqtq4IDs5ilZ7eZTMXQOfgLlT
 svQ9ItZW9FclvYv2xkPmcscTjxGGR0DtwiaDMUKDo2Z5bSgza+gja9T1agjeVgU=
X-Google-Smtp-Source: AGHT+IH5Vuk3yI8JNNLTuPlyb8tEfqYbcmNEYXqaI+D+1WXqokwDXjT4X6Qkm//NaQnNSShWgrOopQ==
X-Received: by 2002:a05:600c:3b83:b0:40e:facf:c05b with SMTP id
 n3-20020a05600c3b8300b0040efacfc05bmr5969062wms.23.1706909175694; 
 Fri, 02 Feb 2024 13:26:15 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWe8738tc8wMiy3xXs1CNNQ5rM3MZmMLoYuaT2zNs+o0GN014Y5tIp62SXPsA7CKl3z8KfbeB8FqDjTJTm/HN+oXxloioKDJpJHlwv943sr8/UKCfyw6nUcbOYOxyArs5LS6GHOcmpZd73rZKKY15wpqseVswbMmEkgMRJqpx0Bj8KB9R/XufW+3kIOo7dt/jNsRSxBUrKV7JPVQugW0OeQ8ekn7gvSngZV/LESVdkR1JogStqmAgZO1TthSIIWQlWpr9jg9u4/AvVoiUCCLDXys1EjNQgnrl37wXoOS2NUjsWmjhP0like0fBWSyYzCxOktLEgWWMvWBLBVMBfYLMxUexfhNB6KrWC3ijvNpqEnzmhQgfdjHyeDfj23tlAVp50IvOjuC9HamBJ+EjUEJUxnfD0vOF2a/L9aKjACnbJ6L4VeU8v0GxhMcgM5NVp8ngEizzW16k+jjyHssayxf7OjK7wPYFSmJ9Ytp20qbYO
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 fa18-20020a05600c519200b0040f22171921sm976140wmb.3.2024.02.02.13.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 13:26:15 -0800 (PST)
Message-ID: <4992bea2-f22b-4953-8b14-d2810d47fb8a@linaro.org>
Date: Fri, 2 Feb 2024 22:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: visionox-rm69299: Update maintainers
Content-Language: en-US, fr
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: quic_abhinavk@quicinc.com, Bjorn Andersson <quic_bjorande@quicinc.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240202-rm69299-maintainers-v1-1-423aa40f344f@quicinc.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240202-rm69299-maintainers-v1-1-423aa40f344f@quicinc.com>
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

On 02/02/2024 19:03, Jessica Zhang wrote:
> The current maintainer (Harigovindan P) is no longer reachable through
> the listed email. Update maintainers list to be Abhinav and I.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> index fa745a6f4456c..7723990675158 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Visionox model RM69299 Panels
>   
>   maintainers:
> -  - Harigovindan P <harigovi@codeaurora.org>
> +  - Abhinav Kumar <quic_abhinavk@quicinc.com>
> +  - Jessica Zhang <quic_jesszhan@quicinc.com>
>   
>   description: |
>     This binding is for display panels using a Visionox RM692999 panel.
> 
> ---
> base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
> change-id: 20240202-rm69299-maintainers-7e069f78334f
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
