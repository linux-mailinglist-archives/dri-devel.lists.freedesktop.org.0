Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB94A4C7B6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDF8410E269;
	Mon,  3 Mar 2025 16:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A6NMoaNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1321010E269
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:42:25 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso3068978f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741020143; x=1741624943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iFKFKTz3f/ODCWb43+xuXVSlIieWn0Rv+6AT+FvWruI=;
 b=A6NMoaNRAwYiXvWJWr5hfOsfU7YPQ0HIcVYp9ppRVJkZAhCYlrdCMJrx+Es215cxAd
 fWpsR+oLYBjwo/O714rRC1M8eanHEWLPYDYA4iZzi9/lBeZdm+9jxwGeTqjDAywqOGLs
 ef0+GGJiykb07WI7QHn2//rH9St/tkdAjmpoXE2KvojTHo8tqvtDqzZSS1+SyBpNH0tJ
 kZ9ZLt32Z7pz/vvW6fpjCrvHMrtYT3CeqCyHadO1d8CCE/9BrnHpUM8eraiyZ0erZIPv
 nj/bAp7VLLUlorgGZxBr4LVFnStLaPpndbIPF1KSDIg7Ai1nuMuQR6CJQYvrjmbnM/EB
 E9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741020143; x=1741624943;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iFKFKTz3f/ODCWb43+xuXVSlIieWn0Rv+6AT+FvWruI=;
 b=TG+y6RflJR45zX5R3ThNEtfzbUGP1xQk1VX/DRoXbE+W7N9yDvn6uCtuUgIihC2T/F
 kcD2OPDheXSr8zMqWfCklglAC9pj4mMyaDS+v7coVfKvUR5WcARmParqxQDflRRMRsQs
 GrJNkHQqJFxCLdwsQ+EKRxOBo3fhwiRK+nwmtNDHx7rcMY3ixhR6xR4KxSsie0f24uef
 cBJVDoUcNX4vLgyWOXJaML8n7zCVl05iIC1aVdMeRD616eD/CvX3+SJvZALzNe5ne4R7
 RHt/T7SvHKqD6V6RTY+Qyl61ivktVAwr2usNmSGyP9Ih9tXKa5NtEApg5Ypvr2KDxVz+
 pEKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqwKZ3TNa/Q7sgdki1KADNFeSbK6qhVJcRlseuqOjvt6+laYz9dgxq0sXHb10kekPeAWbt0qEa/NM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaFiQZMJ/bd7p/NoP9wWgd9vHEIvKaRNtExk/qNtRQQFgeOq0S
 xTOZ26NKgIRx86k9ICRR/+SiWcZugn2lKsrjT9ZGiWQMwng2w8KjHTCKlG43hMw=
X-Gm-Gg: ASbGncuFn7RpWBKSlmlwVTs3tmCOVL3hFKBQrf+lKxBhieKgIy6OelI8VrmTQOmNj5d
 DXLXAjb75L5zTXW3k1Er3e+ypiw61TMczQ+oPxKEEjk7Dq3mbR/3MnKovZifFTDY3uYkzW5OQt5
 m8xdM/bJO9sP4qUjBEJC2S6BwZlnn6eGgx6+SK+oQKIKA2gJt4j6LcjZ2jgb/wC81oTiJ/nVkHR
 kQcgxxTmFmHDERjuAAtLMLwvOv/N5IcWC9BxLkuKrCvSmB8iLkkSZ3gdsw2VVLRGTknVkA+yIBz
 tKWuKH0dk5acvdCvtsXpVoVR6CSmG37r2ulBAQfEpCXtfhFl7+pmcXzL87FqkUmj6Qj0lhYafGL
 50kp9s1kpMOACxXXQLrRk0Q==
X-Google-Smtp-Source: AGHT+IERr7trlQog+kaqqAb3/Ic3azfyefHYSZ50wtP9WNSBDS9iVBnCIw5D4hRIB3JQ4kfjJRTwFQ==
X-Received: by 2002:a05:6000:1fa9:b0:391:e1f:4c29 with SMTP id
 ffacd0b85a97d-3910e1f4d09mr3013310f8f.13.1741020143525; 
 Mon, 03 Mar 2025 08:42:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1c49:dea2:d749:5015?
 ([2a01:e0a:982:cbb0:1c49:dea2:d749:5015])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bc57529fasm28363735e9.31.2025.03.03.08.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 08:42:23 -0800 (PST)
Message-ID: <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
Date: Mon, 3 Mar 2025 17:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
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
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
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

On 17/02/2025 12:39, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v7:
> - No changes aside from adding r-b trailers, effectively a resend.
> - Link to v6: https://lore.kernel.org/r/20250206-adpdrm-v6-0-c8ab9348b853@gmail.com
> 
> Changes in v6:
> - Use the drm_connector_helper_get_modes_fixed helper.
> - Split out into a separate MAINTAINERS entry
> - Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com
> 
> Changes in v5:
> - Moved to using the component framework.
> - Other lifetime fixes
> - Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com
> 
> Changes in v4:
> - Fixed dt bindings.
> - Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com
> 
> Changes in v3:
> - Fixed building as module after splitting out mipi block
> - Addressing the review feedback.
> - Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09@gmail.com
> 
> Changes in v2:
> - Addressing the review feedback.
> - Split out the mipi part of the display controller into a separate device
> - Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com
> 
> ---
> Sasha Finkelstein (5):
>        dt-bindings: display: Add Apple pre-DCP display controller
>        drm: adp: Add Apple Display Pipe driver
>        drm: panel: Add a panel driver for the Summit display
>        arm64: dts: apple: Add touchbar screen nodes
>        MAINTAINERS: Add entries for touchbar display driver
> 
>   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>   .../bindings/display/panel/apple,summit.yaml       |  58 ++
>   MAINTAINERS                                        |  16 +
>   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>   drivers/gpu/drm/Kconfig                            |   2 +
>   drivers/gpu/drm/Makefile                           |   1 +
>   drivers/gpu/drm/adp/Kconfig                        |  17 +
>   drivers/gpu/drm/adp/Makefile                       |   5 +
>   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
>   drivers/gpu/drm/panel/Kconfig                      |   9 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>   17 files changed, 1489 insertions(+)
> ---
> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> change-id: 20241124-adpdrm-25fce3dd8a71
> 
> 

All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?

Neil

