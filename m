Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D4B45047
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 09:52:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE3510EB32;
	Fri,  5 Sep 2025 07:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YnGtSeH1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87BC10EB32
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 07:52:02 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b047f28a83dso268242766b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Sep 2025 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757058721; x=1757663521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=j4E83VLTbZuo4TED6hhJNmBQMvXhzoltxNMk8h1UZoM=;
 b=YnGtSeH1qGdeLlCAf284/PWBvZL3iDfYQ6g899HMVasR76LFtCfuZOce7wo0hOVBYz
 x6KTSJjU2qyI55EPHAmfoBFLArKX+YfacTf79pxY0Sy9SGHyGuvL50r9xF2SmJMd4qNH
 ZyOqyccimomF8nNFR5AaQP0BQxVemIwx2LJlxFgr3sCn3Q6XN4CDjMu0S06c35/a2ZJ/
 t9amKV8rmhGmKefQ5NPx841w9EBNxh7g7Zxx2XYRf/Df/3u2RbChWiEqGYC1OT7LAT/6
 NPxYOeY/3W6DqGKaGcNuSz77igEXQQbkuJ3nMNEp+KDwvOIdA2o/xljlmsgFsFA4h4+H
 OuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757058721; x=1757663521;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j4E83VLTbZuo4TED6hhJNmBQMvXhzoltxNMk8h1UZoM=;
 b=YCsfsSEIatQp8W3m+h8IU1KLGrqJLtFVp2veAruK2N3YGKxFmiMxzPf4XgE/mzlQuq
 BzWKsvUmmokKhza2QY4p7tLDp4gb98eDV+/YpSCGZ8LJpCiSuWy0FKgp+Ky+zG5N9UEN
 /7SlLER5PHO0cEEtKsZPEsUGvzUU/vviNfCtra3V1MMIFpyla4JvaWgkV6BOcSagQw3l
 jv4Jx3ZZRLq3DGU1vo9XQLe7BH/dqqjNgPgK0b4DutAw/Wg14SZX7wWlexk6/rdJhUZP
 cFsP6tMGjLESD9UG+dW1q6kye+zvJpKtTd/XoczE4oV9xp6bYKt/YgwRKZinyvXn+as7
 6VeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsnU+pFVCix8wXV3cMBQOUlx1771tSTP7cTxI8zJGey8MjrsEDVTF8+G5TmD7T2fLziKbdj0DvCbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzukmKDDFjZMEHY4bzgKNVTy6dvlZJExCwDyIECSrQpSs+McK5w
 GolKhgGaKEStqewXjeMOZP/7sQTwZhAsq041zL4F9h6/Ed7O+EEwM0iZ7axxRlpya1E=
X-Gm-Gg: ASbGncsxcR99+Y2rI7Pk02RLh71e1wwf7KstjopZbkXPGvCa7eVWAYs/AMl/2E6UC+6
 JAY5mLHgT+HO8ugYmmKgkP7O5gl1izsRSfM8QD2ph+AvyrVzOdTfbHoTTi9cec7D1kzMlKuqeFv
 E//spEVkacUSFl/U0Az51fhXIgcrDLafyVt9FoEPOlB84u+rpgN8Cdx1+VBzAdHz4+hc8h3hBXm
 FdhG+mfDqy4CFY2qRW32APBCXgYrp/UKzMV26SHp9nuUCScyicil2/4WqRkSwrL7mwUOHAJZ1Hd
 7yhpGBxAspFieE3bX+y17b3Al2eNlcA/9I1JETmlxhvM9Wk3zHixUMfbldx4q03mKEJ2IIg443p
 7OR7XT3cTYJzr3vaA3SepsAILonEXdSne5BgI0BI92P6a
X-Google-Smtp-Source: AGHT+IHsHBWDnFjesrZD6VYm2HqLWgZJEdj/4+1B9i/v95Owxo2vQm0P5+OMAD6AEwvVb81pp3XbuA==
X-Received: by 2002:a17:907:7fa0:b0:b04:3a9c:33ac with SMTP id
 a640c23a62f3a-b043a9c3bb5mr1567058366b.50.1757058721357; 
 Fri, 05 Sep 2025 00:52:01 -0700 (PDT)
Received: from [192.168.7.190] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047b61cf00sm383193466b.15.2025.09.05.00.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Sep 2025 00:52:01 -0700 (PDT)
Message-ID: <d7553808-7713-4ee2-8a4d-10102c01e297@linaro.org>
Date: Fri, 5 Sep 2025 09:52:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi
 720x1280
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
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

On 04/09/2025 22:56, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: No change
> ---
>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> index cf0aa996e072d..34a612705e8c4 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> @@ -20,6 +20,7 @@ properties:
>             - bananapi,lhr050h41
>             - bestar,bsd1218-a101kl68
>             - feixin,k101-im2byl02
> +          - raspberrypi,dsi-5inch
>             - raspberrypi,dsi-7inch
>             - startek,kd050hdfia020
>             - tdo,tl050hdv35

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
