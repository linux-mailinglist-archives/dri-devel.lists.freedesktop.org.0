Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC47A2AAB1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D8310E864;
	Thu,  6 Feb 2025 14:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xZEHGVZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B93D10E868
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 14:06:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-436202dd730so6522035e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738850804; x=1739455604; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
 b=xZEHGVZDPruy8egHH43L3ob4wdA+i5j3d1GBZIvU0eajhXKsx1qt+EcbZbzIjCkfM5
 xL80qy/ZVJr6QLNBU641JzI6ezS66tmumcWv8CXreHkZtdb2GYlfaAI9TCMNc1gnRC0c
 zpJbmho6R68SJeOC2vMFVuoBMQYNBNoRC2yxng25FCsKdPpY/s1oUpLeLp70zxRkAM+d
 P/fadKVexFypgRBeJjhD645FEQ2OGS8b9caAv79zoQ++TxRMO5lXIBRZ5KtNvp+YpUAR
 pUERAmtdkZhTuV5GQzjCjEW9oh22XYZJ+EaiOkjVG5t5xflMSlyhHhuwtElUGFfqfIel
 PQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738850804; x=1739455604;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
 b=GCY6lkDIWn5R7CYhbsXspS7/Y6mrzMUKYPlcRw88iiPhw1MW5/wXjByV/P0wRUA7l3
 HlvugGdmcw9Ge4VQLSwymz4cCxM+wfe+l8GS6dzvz6PAmVRMol9sTuU2V3+22lh7+VI6
 B8UaZ5RfPNvHHHQdhsBqppc9CObo+gjLcE/aDUXcrCAwS9tMS5RQM8oAEOnLBkbsrdl7
 06Y8mfJXH1PT1ciXEF8kWqdfSU+YUPtiyiKijAcgJJMY69l++ETZUFYdpHDy7S0VTpQe
 rkmbiXmbmzdFVRAks7vbaJnSuORqDY8qVE1+b1OfTp87aXJrQLFT3LBV6q7HlhJQGMIj
 /Z1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHuJjDXvuGjJH4BQmLEttv3efs2WMGYsBiwW61FxoUUUYWO8N7J18f0pslGle+B7CamiwFHbVU298=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5OV1ry0w+ZBfBLbt561yRmRn/YOUek3pTTpLjdlwXOrYobzCk
 n7tSK1dfxG6RmlHKl7NwJzNS5E4OqzvBg6Jlmz2yFDch3wNE7DvX/jTPV1Rcqiw=
X-Gm-Gg: ASbGncspjsVcUPq72m+Ltg3wZ1hP4+vURCN0sTLceij16vm0M4/IAfoghKIcsdb2wKy
 WNEV6x8dFpkxTp4SZJ+QkfxdFOXmx+cmdskN++QOzOSuvfUL4M8JO2SzorkvSLVhurTyrZpjVf5
 nVq2zoOP/8L0EWn7wi2CJT4wPuXPlGkf/cEm+DfB81na5G3m7fOPlY8qUz+q56uOWCtN4OVcpV0
 MDfEPLw/liWBfondhqsnQVceIFhcfOLnWjmWQCXuCPZrmGTrd9FudC9OOnc2D+rPiK8FFVm18Kj
 KmABy0HPgsLJJILHVVn1eVZFamMJjdRlV9Esg36wzdGwATrlFtXZ2AUQuH5qD6OcZ90O
X-Google-Smtp-Source: AGHT+IHs1VOvbH74HBC3VcwOcN7MOCMT0bodbdljyOmjoFYNhPQCucKzp9v30TbevBnlEmQ683kP3g==
X-Received: by 2002:a05:600c:5254:b0:438:a913:a99 with SMTP id
 5b1f17b1804b1-4390d5b2fa8mr64022775e9.31.1738850803080; 
 Thu, 06 Feb 2025 06:06:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6?
 ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbf6e4a4bsm1444844f8f.92.2025.02.06.06.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 06:06:42 -0800 (PST)
Message-ID: <cd9b99b0-0a63-4c6c-8064-e48f98fa7c02@linaro.org>
Date: Thu, 6 Feb 2025 15:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 5/5] MAINTAINERS: Add entries for touchbar display
 driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
 <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
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
In-Reply-To: <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
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

On 06/02/2025 15:01, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   MAINTAINERS | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..895d682bcf4e351971b04c6515ebf685fd39b662 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7746,6 +7746,22 @@ F:	drivers/gpu/host1x/
>   F:	include/linux/host1x.h
>   F:	include/uapi/drm/tegra_drm.h
>   
> +DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
> +M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
> +R:	Janne Grunau <j@jannau.net>
> +L:	dri-devel@lists.freedesktop.org
> +L:	asahi@lists.linux.dev
> +S:	Maintained
> +W:	https://asahilinux.org
> +B:	https://github.com/AsahiLinux/linux/issues
> +C:	irc://irc.oftc.net/asahi-dev
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> +F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> +F:	drivers/gpu/drm/adp/
> +F:	drivers/gpu/drm/panel/panel-summit.c
> +
>   DRM DRIVERS FOR RENESAS R-CAR
>   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
