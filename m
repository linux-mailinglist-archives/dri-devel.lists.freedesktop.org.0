Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD067AC05B5
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7919BF38;
	Thu, 22 May 2025 07:27:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hBIX0Hx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA419A190
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:23:24 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so56200445e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747898603; x=1748503403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QZR2UmwyvYbkG1MeoeRYmbzrVJKOcssJezkUQpLtb9g=;
 b=hBIX0Hx1r4LpqkZ9qdxTJ8vfSaZ5P6GqdiFYQ+X6hZj+2Zzt9T8iM2ttoS6jrplUie
 5wHFqDwKnsFoF5QFoROCn+kRYnGDNc+jPvwUrcK5QjYoW26n9qhiMUhMWPumhuM1rwpn
 UdLz1jUZcDwycEFSF6/4INloOZYiO9QQE4JNd1/9ZRIyktEfTkwD/3jOO62roE+aXYVC
 mgtHZJbStA7zBdL7WG8nZIn7rQQ4ItknBhgwXqc7uGBpdwuyGIFcXAuu6FG172NcmHAt
 MbDyhF36azZ0jS3tYxw+8SIzqTS5cRnpyQBM9b3I97VIiyL4WN29HxTdNNuxzloua/Fs
 zIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898603; x=1748503403;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QZR2UmwyvYbkG1MeoeRYmbzrVJKOcssJezkUQpLtb9g=;
 b=k1KlD3vdClP1Oq1wgYCAtKvoLgvZfb6kOoDSqmjqwYGMtrjWhBN+7ti0cpnkPHO7NZ
 hQKtEPz20yIObHtjcXGZG13iHygDT0sZqLK9BGmUtQRCIwdhhbt55GfR3S/V/zbKTqkl
 0SSlsiZR78Nb/lMuNWr0F/+GwQ4tQ2VEAa7A/mjp3qQOOdxJqLAY+n39mj32nQvu5DUs
 4dXrhlIGl2p9C9QrxAngc/QexkJEBOdeIgSb7fpdjMmozHb/dASkSsVAr9Y4APySK/a6
 c37PgTc8nCJHIGYecQDiC/M/85Knqji7tAMNxZgh41pCKyOyMjLA099yasWenwbj0W00
 n1rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWId4mYo8Q07xpm0JMk6niKZY2Mn2DWFMetZ2JO4hzAW7er0U7FdF+7kDTKWR27uZWonG2ngYj5xDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxr1uD1vVIxHu2z10FkmxUhrsn2LgKBWOK4+eprm1RkpLPJa4CH
 6Fj9LXrK2G0pkhw1zmgETOkwO7BWBZ9FlzfD8UccqNk+/8rJz0XFsS/d+Dw7YMhyjqk=
X-Gm-Gg: ASbGncvDiex3HtT+SkcDoPwgTJy9STaDQPNe61zSAt2SYx/9UyBz1Ox3rGr82MfTx61
 JRPaw6PQMxZhKGbR3mFaohn9TtniPEjZatstGa4aMcv3xmZ2c9bSwuSYbPmYIbZdrVQWs47s7kE
 SIni0wDOuQfyMoHfZC0VpDiTpTwsldvYIkZIsutX9iLjxZ/2uE7AW+TnnaN/QSu+rhr15xGb0gr
 mRkfNjEJZ/B8l9TLU94KgkbxX9b0L2zbT7Sfq31oLkGyEJmImEGxj6W3pcTooo5NmXg7Qi7elRn
 mGyuvmMs1LIKSn0cM9hB90dhAfaf/NQ6AISbCSgbsG2MO8lOZ/zx8UVdXNY+quyzWbiKxKww5/z
 LXBMnfn814niX29U5q+4B8v/3uOZ2E0KFBGxDUK4=
X-Google-Smtp-Source: AGHT+IHIvSY7+qwnZ/QQdNvPjKupe5qhn5r92x/K597uQ+Eo6bTe2yY6F9VCdwYcPSbvThPcoAaNew==
X-Received: by 2002:a05:600c:3f07:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-442fd60b516mr239629295e9.4.1747898603150; 
 Thu, 22 May 2025 00:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5?
 ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd94f1sm97180205e9.35.2025.05.22.00.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:23:22 -0700 (PDT)
Message-ID: <86f5b662-db35-4a2b-83bf-841977d183dd@linaro.org>
Date: Thu, 22 May 2025 09:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 3/5] phy: qcom-uniphy: add more registers from display
 PHYs
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
 <20250520-fd-hdmi-phy-v4-3-fcbaa652ad75@oss.qualcomm.com>
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
In-Reply-To: <20250520-fd-hdmi-phy-v4-3-fcbaa652ad75@oss.qualcomm.com>
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
> Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
> PHY registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-uniphy.h | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> index e5b79a4dc270f25d8979f51bf4acd6c76998032e..ce782018124b5431ee647575289c963d8fd0de1f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> @@ -8,8 +8,19 @@
>   
>   /* PHY registers */
>   #define UNIPHY_PLL_REFCLK_CFG		0x000
> +#define UNIPHY_PLL_POSTDIV1_CFG		0x004
> +#define UNIPHY_PLL_CHGPUMP_CFG		0x008
> +#define UNIPHY_PLL_VCOLPF_CFG		0x00c
> +#define UNIPHY_PLL_VREG_CFG		0x010
>   #define UNIPHY_PLL_PWRGEN_CFG		0x014
> +#define UNIPHY_PLL_DMUX_CFG		0x018
> +#define UNIPHY_PLL_AMUX_CFG		0x01c
>   #define UNIPHY_PLL_GLB_CFG		0x020
> +#define UNIPHY_PLL_POSTDIV2_CFG		0x024
> +#define UNIPHY_PLL_POSTDIV3_CFG		0x028
> +#define UNIPHY_PLL_LPFR_CFG		0x02c
> +#define UNIPHY_PLL_LPFC1_CFG		0x030
> +#define UNIPHY_PLL_LPFC2_CFG		0x034
>   #define UNIPHY_PLL_SDM_CFG0		0x038
>   #define UNIPHY_PLL_SDM_CFG1		0x03c
>   #define UNIPHY_PLL_SDM_CFG2		0x040
> @@ -22,11 +33,33 @@
>   #define UNIPHY_PLL_LKDET_CFG0		0x05c
>   #define UNIPHY_PLL_LKDET_CFG1		0x060
>   #define UNIPHY_PLL_LKDET_CFG2		0x064
> +#define UNIPHY_PLL_TEST_CFG		0x068
>   #define UNIPHY_PLL_CAL_CFG0		0x06c
> +#define UNIPHY_PLL_CAL_CFG1		0x070
> +#define UNIPHY_PLL_CAL_CFG2		0x074
> +#define UNIPHY_PLL_CAL_CFG3		0x078
> +#define UNIPHY_PLL_CAL_CFG4		0x07c
> +#define UNIPHY_PLL_CAL_CFG5		0x080
> +#define UNIPHY_PLL_CAL_CFG6		0x084
> +#define UNIPHY_PLL_CAL_CFG7		0x088
>   #define UNIPHY_PLL_CAL_CFG8		0x08c
>   #define UNIPHY_PLL_CAL_CFG9		0x090
>   #define UNIPHY_PLL_CAL_CFG10		0x094
>   #define UNIPHY_PLL_CAL_CFG11		0x098
> +#define UNIPHY_PLL_EFUSE_CFG		0x09c
> +#define UNIPHY_PLL_DEBUG_BUS_SEL	0x0a0
> +#define UNIPHY_PLL_CTRL_42		0x0a4
> +#define UNIPHY_PLL_CTRL_43		0x0a8
> +#define UNIPHY_PLL_CTRL_44		0x0ac
> +#define UNIPHY_PLL_CTRL_45		0x0b0
> +#define UNIPHY_PLL_CTRL_46		0x0b4
> +#define UNIPHY_PLL_CTRL_47		0x0b8
> +#define UNIPHY_PLL_CTRL_48		0x0bc
>   #define UNIPHY_PLL_STATUS		0x0c0
> +#define UNIPHY_PLL_DEBUG_BUS0		0x0c4
> +#define UNIPHY_PLL_DEBUG_BUS1		0x0c8
> +#define UNIPHY_PLL_DEBUG_BUS2		0x0cc
> +#define UNIPHY_PLL_DEBUG_BUS3		0x0d0
> +#define UNIPHY_PLL_CTRL_54		0x0d4
>   
>   #endif
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
