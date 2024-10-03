Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DB98F3AF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F60310E8A2;
	Thu,  3 Oct 2024 16:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OF2UPutZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BA810E8A2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 16:12:30 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42e7b7bef42so10623925e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727971948; x=1728576748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9x0kA6Y5xirU8ZKb3vd7ah9xp3oW+AcwIHY8MvPuPSw=;
 b=OF2UPutZ8zZCwor9q7DSRfksYP9K01tSb6oLa8g88Tqzqd1rd0MQNtxhqmf7ENIxC2
 PnQVuJygK1ZVq5PFNZU6ux9Wtiwe2k54J1JmWdRfazopNrG9Bm/8fotCb6MV69cqGtOJ
 Bw5XgGvAySpZz//MSrxvl7emtZ+j8vNvql9OpGNdWk+yQaAdOHgbtIWxaaH8wDEGH7TQ
 K+KKYeDRT+0JYGLYyujzc/XB3mToz9SwFzoSxzLsoC6P2L90mYbzRDkLfyRa78ef1uPC
 ZKSFjNHgCMrHI6LCuZpfYmjwcTiIyJHlDCOdGyTxYYFW2V4uBtoSYfGOs0pu5pgs1GFK
 hcgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971948; x=1728576748;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9x0kA6Y5xirU8ZKb3vd7ah9xp3oW+AcwIHY8MvPuPSw=;
 b=GkL+O7IakML6lSxcBmREF4bk134VaNiMd6NcFG6FBUc9V7HQkjL6HQAz912dWDzT4m
 eanD0QSL8MXjhlSKTSoc2dXLeHBbcYBhkctF1vjZm8nbvWUz4WvPWxtOMGU9lsd51MwN
 EJE3gGbDNLdT2ow+fg7tI5UGoFGq7s+Y5/1x98sK+IHGG4GNbRiBUu+9cx/KJRO/MNqm
 l/42CTqiJSKpGLMnL3iinA282zJEmj7WREjd1uMPCrXry2sWLgABNRxE9rqudK0D+5HU
 EGM2w3dhJtoRc3uIpk4lj1cc3zUroph1uatecdRO50VndGbQeeGhhecw/o1fKmc8nSOU
 A+4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPCKIvjWZfiRX9t/I5hiEXeHVZAvdluYdbLtpL8jOx6dSClk/9kxcZOMJLw+KRfMi5j7PCMJSD+cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL/+nX2Gj5ep+5b33Ax3s6EJWfUQtqujIJsJqO2Ls6FYMvpuYr
 xGimPjvpAv1tJ95tDKSyeDmLns83m/H4xIaf8dGwMc4xkYoUPy2IVTvnSrb52PE=
X-Google-Smtp-Source: AGHT+IH7XqoTZIRUQjlYMVABAzMAJKn3H7Cg1IhhW5+WLWmS66vcYeXzq7UpCoZZyE94HETXaXNryQ==
X-Received: by 2002:adf:a38a:0:b0:374:ba7a:7d46 with SMTP id
 ffacd0b85a97d-37cfba04204mr4360586f8f.43.1727971948300; 
 Thu, 03 Oct 2024 09:12:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e534:c027:e113:29a1?
 ([2a01:e0a:982:cbb0:e534:c027:e113:29a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d0822bc38sm1598885f8f.45.2024.10.03.09.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 09:12:27 -0700 (PDT)
Message-ID: <4caf21cd-2783-48d3-8e6d-159ad8e89113@linaro.org>
Date: Thu, 3 Oct 2024 18:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] drm/bridge: tc358768: switch to bus-width
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
 <20241003133904.69244-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20241003133904.69244-2-krzysztof.kozlowski@linaro.org>
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

On 03/10/2024 15:39, Krzysztof Kozlowski wrote:
> "data-lines" property is way too similar to "data-lanes".  It is also
> duplicating "bus-width" from video-interfaces.yaml schema.  "data-lines"
> was deprecated in the bindings and "bus-width" is preferred, so parse it
> instead while keeping things backwards compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpu/drm/bridge/tc358768.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 0e8813278a2f..fc96fa5aab54 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -443,7 +443,9 @@ static int tc358768_dsi_host_attach(struct mipi_dsi_host *host,
>   	ret = -EINVAL;
>   	ep = of_graph_get_endpoint_by_regs(host->dev->of_node, 0, 0);
>   	if (ep) {
> -		ret = of_property_read_u32(ep, "data-lines", &priv->pd_lines);
> +		ret = of_property_read_u32(ep, "bus-width", &priv->pd_lines);
> +		if (ret)
> +			ret = of_property_read_u32(ep, "data-lines", &priv->pd_lines);
>   
>   		of_node_put(ep);
>   	}

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
