Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFB98F3B1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA35710E8A7;
	Thu,  3 Oct 2024 16:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IuZwHN29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3697E10E8A7
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 16:12:38 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42e82f7f36aso10370605e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 09:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727971956; x=1728576756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Nxjal9NLxsSrsdx2DROpNELieYh4/8tITxuoItEclxk=;
 b=IuZwHN29kSMfhDc7HCKv9NFB4vLFIBs2kcYiNImYsQdLnjzKkIQU4kVmV7pdjD6q/0
 ihV/TIlBfPyAwomHeE2bUIAHL1TYEtVI+tqhLohD1RYG2r7Y7tiNvgs1Y+ijU5P7wylF
 cEFwgvOMZ7GnNHZW0thOZRfEiBVDymWtzYLA5/stsFAbGllgiT38wnDPpiKMKJt6uSHR
 uJOPGKL6zryFimaZVmPCdftJQVGozr2j1IbvtQ/3BuP/Q7y7AUdOkehVvEwSfasZ/FBO
 s+rDNzw+LapqPW9EjheWr48Wjqugr785y5FOy/CF18C4TiVl3x5OBVfW8q+NqEC0C2f/
 0SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971956; x=1728576756;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Nxjal9NLxsSrsdx2DROpNELieYh4/8tITxuoItEclxk=;
 b=SnuuVCP7Ow2/7wl1+U6BAB5pIL3IvzhHcXuBC+d0Qi08TbkjQ7TDZUMtLtXhYtSsvM
 tK+eClsDT2LL2vDl6A7xczz/A90EjXBtvOprs6R2yQbP/7BU4lxKUX4agGY/MC0/UA+d
 oGbo4uS9NOQWw0mt/mZf4oelueXs0SatkXhOTEhFBssj6iYEIqdrGYWy2mXTgv/NCLL4
 2IHNGSEv7XNV2UDjW362hFjDPkq0dHT2bkeCsDhEax2YXodLAGn9x4Z4PhmM1OSwt4xp
 CQtHR9JZRPbtOW4WeEsGjgghbPvlYL/zVS5oWetuoa9qovgKoLK08C1m3510OiCRER03
 9zcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcx2/MlJ6+DboYD/aDtNy6gVcp7qLkhkFOsLqsvyc84tDy+Er3MJWQSvIDZFkjx9IRxPpyshM5zb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZtZNCpXFAALk/JxhSWsTVt+9VX/X+KgQaH+QW2clLTVxtDdAJ
 6gsRB3Jif2F+VfH2eBj694zXxDM6DusqI/yZEU9hqTGrpRLQH7qpNlxhk84ValY=
X-Google-Smtp-Source: AGHT+IFFl6f96MyLoOvbN+EXoMYpotmRTEsZw6HH9lEWLuCWHWMFwO37IdTl7WToRn7LoUvbJrF1uA==
X-Received: by 2002:a05:600c:1f0f:b0:42c:b22e:fbfa with SMTP id
 5b1f17b1804b1-42f819ff766mr16435075e9.21.1727971956492; 
 Thu, 03 Oct 2024 09:12:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e534:c027:e113:29a1?
 ([2a01:e0a:982:cbb0:e534:c027:e113:29a1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f802a01f2sm18982715e9.30.2024.10.03.09.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 09:12:36 -0700 (PDT)
Message-ID: <62bdc55b-8620-407b-a6b8-cce2f120a933@linaro.org>
Date: Thu, 3 Oct 2024 18:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: tc358768: switch to
 bus-width
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
In-Reply-To: <20241003133904.69244-1-krzysztof.kozlowski@linaro.org>
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
> duplicating "bus-width" from video-interfaces.yaml schema.  Deprecate
> "data-lines" and use the common property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/display/bridge/toshiba,tc358768.yaml  | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> index 779d8c57f854..bb5d3b543800 100644
> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
> @@ -60,6 +60,10 @@ properties:
>                 data-lines:
>                   $ref: /schemas/types.yaml#/definitions/uint32
>                   enum: [ 16, 18, 24 ]
> +                deprecated: true
> +
> +              bus-width:
> +                enum: [ 16, 18, 24 ]
>   
>         port@1:
>           $ref: /schemas/graph.yaml#/properties/port

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
