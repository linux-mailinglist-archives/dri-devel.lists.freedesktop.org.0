Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B39A4C806
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36BE10E3D6;
	Mon,  3 Mar 2025 16:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cea/g+7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B3610E3D6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:48:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso30126475e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741020517; x=1741625317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=f6twUH0//ksDRm2f064XsJv+UZF+J+plN/dZHzNZ8hs=;
 b=Cea/g+7TwuaXCoIKfRn2mKOYFp1helmaUkZqBQVNotqe1CuolmPEU0pORc6DEXH6gH
 Fgof6qLjg+TFeb5u6VLlgAoJ+A43o55SL787WSLderTfCQfw/Fap+TMFFImYVcJO37cX
 zJDq/GB5gpL05VLNnefWyARA1Z4Ymxw0A9mS8oSF7qaDYLnlN7IreJtLz4Hg8jyaMR2m
 CuncTPglSdDxdG3O2DDZDtkAq75cG3nkL22g0u2Bh0CLE+jkZNy2XI4At7M4w4MDvAXJ
 LfPJI31IsEt7O59jU0dM0d/OWzxSRjQ3nMcYGYALrmsRTHV42sJ1Uz63F9B0ImB2y5aG
 lhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741020517; x=1741625317;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=f6twUH0//ksDRm2f064XsJv+UZF+J+plN/dZHzNZ8hs=;
 b=SdcpyYfLi3X41SxbSAO8xbldSYdVLjeOwQ+rzDe9RTWTwsak8Byhq50IYfNgWXg/8P
 6tZKn/0LeBkxQeNf8Yso+gM0rRk1E05V+kaTXhqiQT99Fn1OGghFLOqH0/EliHebV1Bc
 WD/vH7+suFqrXicsti1VMJQEAdP1YZNppmTtmmGQeanLu1Uf8AMYoDH7oIr5z+8xAjOH
 pAI+8ie0RY/flusKV5XkxV3E2ikZnLxvL+dy2btONKbspUojtpqBPDR6nAGn9RcNrmtU
 j/jtVUjuXFYRvuaaO/ccI8ZRHoGz3fbl5/t1+i885zHwvnYBX0nLtz43SIOmNHDnBS29
 K+cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8efp4BVEjX9e+Y1+Q/egFNoZafTlCP8X0r3VYQyZcS2RRkmVqVT8wCB4z61Ke0EvYGw6/teQAHsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHkegWRkZjdhwVYRtoPZXkqsUQrFZOdy26KGT+/Dw2cYKN+KaW
 hGJr+B24oM+ZaErhYI/kKVjLK8rO9HQCFJ6kP9BszgVZIyweo7L10kEhQyDnOEo=
X-Gm-Gg: ASbGncuo2aftEw332Osvf0vzFLTD1LRbZw323yE0bC/bYy1ZsudGl0EtEE+jM2osvLb
 oScXL7wLrSo1bE+LaMJLlyWBc5zqjBdEf+lpqVjBn4AKB4175Iujb4+RbC7ajePl9G/BOAFPNgD
 qhK+zDj5TQP6EsarUe7Tty57tDzZPK97O7xACfZxARr3IMFWF8hKg30VP8dr2A2sp3K1P0uQxnd
 1fVS71zLy2KzkISInM1hZ8rEUazl9vKaMTkYKvXfFqbfhKsBO+KzIWF3cn3UCLncF3PX0fgJcdH
 7GelN/CJGOao6DAmlUqWtFWDaUDhY1SqCAvne/ryJJZNc7DFSWwb1nuUQXMeW0Bc6yv6o+XikLs
 iYR1l0Xw5nuzdoDt81pvkxQ==
X-Google-Smtp-Source: AGHT+IHuX0Dyyj2drftfOnysc3kce8KOWtX0dSt1AKvY/DMf+bm0V8XjPV4RbCnMrW3lKy8qr5E0yQ==
X-Received: by 2002:a05:600c:1387:b0:439:a138:20 with SMTP id
 5b1f17b1804b1-43ba675d737mr105069055e9.20.1741020516721; 
 Mon, 03 Mar 2025 08:48:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1c49:dea2:d749:5015?
 ([2a01:e0a:982:cbb0:1c49:dea2:d749:5015])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bbf2edf84sm52318185e9.40.2025.03.03.08.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 08:48:36 -0800 (PST)
Message-ID: <7a84f5fa-7128-4b51-8b05-e557e21663d8@linaro.org>
Date: Mon, 3 Mar 2025 17:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org> <Z8XcH7xoDC7TA7ZC@blossom>
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
In-Reply-To: <Z8XcH7xoDC7TA7ZC@blossom>
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

On 03/03/2025 17:43, Alyssa Rosenzweig wrote:
>>> Sasha Finkelstein (5):
>>>         dt-bindings: display: Add Apple pre-DCP display controller
>>>         drm: adp: Add Apple Display Pipe driver
>>>         drm: panel: Add a panel driver for the Summit display
>>>         arm64: dts: apple: Add touchbar screen nodes
>>>         MAINTAINERS: Add entries for touchbar display driver
>>>
>>>    .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>>>    .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>>>    .../bindings/display/panel/apple,summit.yaml       |  58 ++
>>>    MAINTAINERS                                        |  16 +
>>>    arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>>>    arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>>>    arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>>>    arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>>>    drivers/gpu/drm/Kconfig                            |   2 +
>>>    drivers/gpu/drm/Makefile                           |   1 +
>>>    drivers/gpu/drm/adp/Kconfig                        |  17 +
>>>    drivers/gpu/drm/adp/Makefile                       |   5 +
>>>    drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>>>    drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
>>>    drivers/gpu/drm/panel/Kconfig                      |   9 +
>>>    drivers/gpu/drm/panel/Makefile                     |   1 +
>>>    drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>>>    17 files changed, 1489 insertions(+)
>>> ---
>>> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
>>> change-id: 20241124-adpdrm-25fce3dd8a71
>>>
>>>
>>
>> All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> 
> I'm planning to do so today, just need to get dim setup first :)

Nice, go ahead then !

Neil
