Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A31847B8B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:32:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A92E10E865;
	Fri,  2 Feb 2024 21:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QW3gpsqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2F510E865
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:32:13 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40fb63c40c0so21797435e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 13:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706909531; x=1707514331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=W5Hc9mSNGHRmqMuX3vLv6BjyMkdxw/6pVnK77OZ+Opw=;
 b=QW3gpsqFTqIU60+vFiI+qOj1Gicoj1kYWFWJ0GzF6386OCpddwexrzjQLXj73sJzAH
 568nJrKu+eKI8L089amIXfXnSDYlp+bJA+91r2MNDW5Xj3IRKM/pIaryjS0eMM1CIpNf
 rxm5365FTQsHAnYop0PRKZOWZAUXIjDp+gW+u2QnPNKNHW2dRXh6JgKjmmjFt7keGGiG
 w8LZCQmTSM6/8EpFqMsyHon3PTa+XpngsCGBY9hBToSKU0cxMzkMundUsGWg8rPLDzUU
 zq087mE5HoQaRYC2Dpc6dvzpd0DK7x1nzvCF4MEDr1owxHZCN6sQNhO6TsmdfjXog9Wi
 gcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706909531; x=1707514331;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=W5Hc9mSNGHRmqMuX3vLv6BjyMkdxw/6pVnK77OZ+Opw=;
 b=KkgRZc3EQO8mDzofQ65cljxomcvJTs3My684QGoC5eSN/7HbN2olHOx2QpoYpHXcMy
 ngSjMVTceH9i+Mmr50qDL1x2mQvZ1tV7y7XoXBsCPSN0NRis5o1EgjLevE9JW8aQytnZ
 kXPPbwJi/hGXjcF1220qESCn0eVRDkD1nfnDjC9NtRt5Rj4u+/9/E7ItAI7FU3BmREs9
 hK1j8is28m56eghiklx0WMk2HN8kK3F7aMbRzrUZnbJLvMa5ez35GcqHZkQiF0Vt69Kr
 fmNk1KE5xKnLWYbX8djpJVwaCvlRnY6YKbnZKRVSUN+t5NRblKBHUGh2PsElQCdLp0Lc
 Q9KA==
X-Gm-Message-State: AOJu0Yw86d4SxV+BEdcdwiPQ7YGLZGbWuXDlawVSpmjWVgslTt+EO7+o
 fBPmEpVEx0Rjv/vaRikQ9hpe+SREjw2aHtf+FG8QX34QVpMl3s0z44tImyZRTLM=
X-Google-Smtp-Source: AGHT+IGyPixWYoi+L4/ukaGBHlcrE3M3qeKjP8naEQzcqadDPDsfbwSTPYGe0HluOek3vr3B35Am3w==
X-Received: by 2002:a05:600c:1550:b0:40e:fb8f:76b2 with SMTP id
 f16-20020a05600c155000b0040efb8f76b2mr7592084wmg.12.1706909531281; 
 Fri, 02 Feb 2024 13:32:11 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVcz30ZwoH/5xCYeuEkyULtPjnugcNsrZooblZ7+o777yvjaEWQrcqbShcYM4dWmclsHEVB/1TNGAGbLTGQCCQX6Oz67KeLrqoMYb+dE37zKDXBA99J6ReiSRhz/Zhx27tbSpG5cCbraq3CbZ1ixBa7OrNl+p4VLRcJrmGHiD+qRbnOOU5ugn6RY/9JVf4M2TD3KZhWDNUIByvv7JwneXD2fYnSC4t1RxEGFgx2lEfu1Jg6xKiz6FGtZjYTLpMMzwFxzTrg9EN6kRNJ+JLUft1+Cd7E5w+OEXMl0x1J5xdofOSF3y5JTfj4Af6TMGe1JDafwvpEx1Ye+0OGQwZxmaxeAqzYxoiVI0AZD9MxAMtPvMaIUk6BJmrliqUv6Afqc5v0hBRGXxHtB7UqAQzmG2OmJnmMkK2UWRxBakzsOx1lqMOu01kDQSNGYd5IfbEH4s9obOyc7VP/6hz+HwqLNiMqjqdueeeG1XnKHEGhaSJzeh8xWY9WNRM0CyjBJQnSAtqIlONjlBbX4w7yVOGAbXV8FRLFH5pUBXUK5Us6xZv0nXCMFTpyzKkpryKTVIX8/i9ucNWekWlsh1oeczrLOcRf3dJqktVGTJtV4KXAGrXiyk+kUe2COFPTQ00Y6qn1N8rpCDEvS8qJewZqPNp7bVkRS9TmVApJrOwh
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c314600b0040fb7695620sm1020943wmo.0.2024.02.02.13.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 13:32:10 -0800 (PST)
Message-ID: <b8a5e5dd-e018-4305-9fb8-88f4ddc49a2f@linaro.org>
Date: Fri, 2 Feb 2024 22:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi86: Fix bouncing
 @codeaurora address
Content-Language: en-US, fr
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dianders@chromium.org,
 andrzej.hajda@intel.com, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 quic_bjorande@quicinc.com
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
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
In-Reply-To: <20240202202329.4172917-1-quic_jhugo@quicinc.com>
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

On 02/02/2024 21:23, Jeffrey Hugo wrote:
> The servers for the @codeaurora domain are long retired and any messages
> sent there bounce.  Sandeep Panda's email address is no longer valid and
> should be repleaced.  However Sandeep has left the company and has not
> been active sice, therefore it looks like this binding is orphaned.
> 
> Doug is listed as the reviewer for this file in MAINTAINERS and has
> volunteered to be listed within the file as the binding maintainer.
> Therefore replace Sandeep with Doug to make the documentation current.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>   .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 6ec6d287bff4..c93878b6d718 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: SN65DSI86 DSI to eDP bridge chip
>   
>   maintainers:
> -  - Sandeep Panda <spanda@codeaurora.org>
> +  - Douglas Anderson <dianders@chromium.org>
>   
>   description: |
>     The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs eDP.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
