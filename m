Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B97BAC05C6
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEC79A095;
	Thu, 22 May 2025 07:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bnAkY0oz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3433B9A095
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:23:13 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso58401865e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747898592; x=1748503392; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
 b=bnAkY0ozx2JD7KKOiwdOjPS8CSz+CdFAAwAa68PfTbTr7F/H2a2SLC0geoIH7wtgRG
 ey7o7YqCa8+WmzkIj1u8ZXPFUt9Hejzd/IDj9UODGNk1T6SoWH+TuO51QKWkTGd6iN3g
 j0/BWXzWWYshtPHq87XUrLKTPcNdKh+VPlntz9zCchQL6H3AVVGIRzfHHqceK5xIeN6U
 68nWAPKSeNixMIpjxsc5sbb2tz8HbfpDrArl14e0Uoou2tMqeCzyITOK+RM4SXSxiLo0
 cWg0yLUQDUtiRqNrC+qmcSXVLbMTSILOFvkNh1OLsxRE+QDtOOk+oEArnw034MMMOA/m
 eyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898592; x=1748503392;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
 b=lkt8wCVW06phIIOo7O7J7wLY5ZuB+xPotmhRFjFSiTWyeHq2SSI/rn/+xioFdmobt0
 Wf3Wcrh/FQFpdnEKOi8qtMMzxlrspYDjlPsXvFKS1Cgd2iK3WjMLdQBA/atmllMIpnlf
 t0NDrZa7PSUno4Zk4TSEz0B64FEywhAuR8lY8YSRU9kIhD8Mqkvle1pIKCslrRPnc7et
 wy2tVvrDOcL/g9kqAgztMTtDwSmfaBiPM2Pr60W33WuJj3aXbsIaZV1XGOueGzfLgtrS
 Hsll7q+Z6+sRqVKYbu/hg8x6B6UhMdvx8lGMLYA+xTfMh9d8VX9KRCZBqLXcjhpxKxGg
 DaOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9JJVPrbUCGfQnyGdnh1Tf725CsEJ9w6Db4aRWrGs8KpqyioUvCCqU79zPi4Wqk9RzvXxHGefNCFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmt6qPqYDdXkkjO1Pyf/dLyZvigeevVbZfiaFsxkeZhwfq/ATP
 DI9pBhfBl5WM7FcXWA2JIaK3ZO0PKsBS1NIRAT2zuCmWp/W3Znf9waZ/vR6NuWI+fr0=
X-Gm-Gg: ASbGncsRHIPPmQBN02tHx5mPT5/1KbqyIhlHddulFkX7t8Ycrgys2O9AxJ3XN9U3Z34
 RUIZVfUXSKpf/vMu5Ld+8oGJoVVo867Mqaoub/o6pmS5Ox8BzE5XE2lw0uTJDh4yNyfkUwGuXNg
 LqGK8RD3IMo1tXX/ZomJrp+8PRNwVui0TJeXZxt4UdqSzXehO5qluGCPXA/mOS1WunNpNHdYqu8
 Ej5Mx35RzPBXer9ErMnJGv+WzmAer6wOfx0uUwWPMEL+9U8jDb8XZc47lo9X3EsMbLWyUIK3ZXI
 +OOHyWqVKbtTV4bR/XKKy5GZ6PGmAbozxFK5IXJimX2Qd9iZOTltVohjwbTyVl9ST+vdWBA2z42
 8B9Jnu7DYbQhLCkRrVTwcU0elHNyL
X-Google-Smtp-Source: AGHT+IHts0eteY4PlR1SQN/PyYMswWNwfgjzZcpYKjCK25ZDntVHx3kCGx8YLO7OAaDj+8ppdM5vmg==
X-Received: by 2002:a05:600c:548d:b0:442:f44f:678 with SMTP id
 5b1f17b1804b1-442ff03c63emr240517275e9.31.1747898591652; 
 Thu, 22 May 2025 00:23:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5?
 ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd94f1sm97174725e9.35.2025.05.22.00.23.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:23:11 -0700 (PDT)
Message-ID: <fa65b2bf-b76e-428a-8110-325a6191752e@linaro.org>
Date: Thu, 22 May 2025 09:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 2/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
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
In-Reply-To: <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
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

On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The "uni" PLL is shared between several PHYS: APQ8064's SATA,
> MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
>   drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> index cae290a6e19fcb7fd68fe6cd0229b9b00d47131c..dd9929429f9a0e2f265180e8d3f390451d91adde 100644
> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> @@ -15,28 +15,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy/phy.h>
>   
> -/* PHY registers */
> -#define UNIPHY_PLL_REFCLK_CFG		0x000
> -#define UNIPHY_PLL_PWRGEN_CFG		0x014
> -#define UNIPHY_PLL_GLB_CFG		0x020
> -#define UNIPHY_PLL_SDM_CFG0		0x038
> -#define UNIPHY_PLL_SDM_CFG1		0x03C
> -#define UNIPHY_PLL_SDM_CFG2		0x040
> -#define UNIPHY_PLL_SDM_CFG3		0x044
> -#define UNIPHY_PLL_SDM_CFG4		0x048
> -#define UNIPHY_PLL_SSC_CFG0		0x04C
> -#define UNIPHY_PLL_SSC_CFG1		0x050
> -#define UNIPHY_PLL_SSC_CFG2		0x054
> -#define UNIPHY_PLL_SSC_CFG3		0x058
> -#define UNIPHY_PLL_LKDET_CFG0		0x05C
> -#define UNIPHY_PLL_LKDET_CFG1		0x060
> -#define UNIPHY_PLL_LKDET_CFG2		0x064
> -#define UNIPHY_PLL_CAL_CFG0		0x06C
> -#define UNIPHY_PLL_CAL_CFG8		0x08C
> -#define UNIPHY_PLL_CAL_CFG9		0x090
> -#define UNIPHY_PLL_CAL_CFG10		0x094
> -#define UNIPHY_PLL_CAL_CFG11		0x098
> -#define UNIPHY_PLL_STATUS		0x0C0
> +#include "phy-qcom-uniphy.h"
>   
>   #define SATA_PHY_SER_CTRL		0x100
>   #define SATA_PHY_TX_DRIV_CTRL0		0x104
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5b79a4dc270f25d8979f51bf4acd6c76998032e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef PHY_QCOM_UNIPHY_H
> +#define PHY_QCOM_UNIPHY_H
> +
> +/* PHY registers */
> +#define UNIPHY_PLL_REFCLK_CFG		0x000
> +#define UNIPHY_PLL_PWRGEN_CFG		0x014
> +#define UNIPHY_PLL_GLB_CFG		0x020
> +#define UNIPHY_PLL_SDM_CFG0		0x038
> +#define UNIPHY_PLL_SDM_CFG1		0x03c
> +#define UNIPHY_PLL_SDM_CFG2		0x040
> +#define UNIPHY_PLL_SDM_CFG3		0x044
> +#define UNIPHY_PLL_SDM_CFG4		0x048
> +#define UNIPHY_PLL_SSC_CFG0		0x04c
> +#define UNIPHY_PLL_SSC_CFG1		0x050
> +#define UNIPHY_PLL_SSC_CFG2		0x054
> +#define UNIPHY_PLL_SSC_CFG3		0x058
> +#define UNIPHY_PLL_LKDET_CFG0		0x05c
> +#define UNIPHY_PLL_LKDET_CFG1		0x060
> +#define UNIPHY_PLL_LKDET_CFG2		0x064
> +#define UNIPHY_PLL_CAL_CFG0		0x06c
> +#define UNIPHY_PLL_CAL_CFG8		0x08c
> +#define UNIPHY_PLL_CAL_CFG9		0x090
> +#define UNIPHY_PLL_CAL_CFG10		0x094
> +#define UNIPHY_PLL_CAL_CFG11		0x098
> +#define UNIPHY_PLL_STATUS		0x0c0
> +
> +#endif
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
