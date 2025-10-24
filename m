Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65CFC06C4A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 16:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3245610EAB1;
	Fri, 24 Oct 2025 14:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JEBuUOTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA4710EAB1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 14:48:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso16815975e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761317293; x=1761922093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=A1Hx5nLLV2Jg5MZCp9AF1ElKQLvEIm2+dthQoOXPOnI=;
 b=JEBuUOTruqx8yTXBqXp4zBj6/kpZh4qV48Mi0cDNTqtZK/6TDcpny8/nNl1GgXkOxW
 ZzANxAdHuqgsmojDDXq87x7b8+bxElMyfdOw4guOLoipANkRB1wg3lrmOTpw5mBm+7Tp
 zL03GX+258XNyaqnjxMUr+8TTjMIs/+xQsvG3IUqqEfL6iTYGM4wnuhK33N15cnB1Hoo
 jqxl60V6MlkAp/o7VFUVZhWOt1MBM0raXui99gGXC99qUu7AwsDpHY1S6KikNFC7wznd
 3oovNK6/3Dzttvm+nO5Yw5C3h6c+RTuMzDGCSv3wc48D4lmHpkzCQz/RkvNTOPmvAWyN
 i7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761317293; x=1761922093;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=A1Hx5nLLV2Jg5MZCp9AF1ElKQLvEIm2+dthQoOXPOnI=;
 b=tqmasHNG4YBlW5F+kYsoFC8SxvLHpnCHJIGT4bSouShrzu7+/UMso84qyQ0ayxTIqZ
 Q5qvoQ2LjFmCqMzjJaxeH3dz/ZLVQOjNzmu17VXIM6uTOsZJP2XyseKfrmpjUsxhg9RW
 FTAS5yLoS+VKq+GlnlrhoYdCIjtlBwjAZvCC/uUAqSI0w5np83HcA2Y/g8QtwcMH6DI2
 +z00XXAgxw2krRA95I6wLyXqBp2xXd8ObfZpa/K0CcEvFTM4bnKPapADp6vbdZQJBJcC
 FH0OW/1UwspHp52Km+azUaHFN1rHora/gXxCP98br2siQUnZd8uWPOkImTeIJk+V+H3P
 8ziA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Sxbg0/Ld45cDZYPThUrF7NZrfIbhK4UJlIu1NmKX+4MxRyzxoOYvjOHUZ2qsQhujleB00vVXJf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOoEtl0XGfQ/wiuRefBvxaACX6zfWOpoUgZFELCDq3jFsFn1Kg
 lcJwmxYFjtKQek5Qkrc8ATUN6H22S78NI0X7PUjWDZsdJ7yy3rZ4ttey9Q7ncHp2/qA=
X-Gm-Gg: ASbGnctObJ/83W/fAs00Fs2fd/XRthfeudq47EyNTRZa9XwnbRbKdt7oCP81XIt5bQB
 7D5cTNdOFyaGLsQte8nonApPCGlexnIjvnKowH9WSPVwk0j+4QHvkfg3Ks+p/ZxlsWOjFmrH1Ph
 KxgIIVN75knaintIuIFDDjADRp9JH/fJZWjOzafcA+rafnQSRmoyudmgFayrokbE+vzMj4J4Q61
 ktnMXKefHRy0W7vsMNzAfRBxwCAeDAQ+/S0Rvi2FMDckwabC4WKmJCUc7bSq6Xqup43xXi0S8ey
 5XNTpAOEHzafLyLsE0Dtnb5RV+dHIlK0v2vpOBm6ExnqaZ8gvpMjMHVNigcdwuKyt0R4enkeEZx
 SwisWfWRa9H/jaxahhLDhjdbDfrhllZVKsffC+Lc9ZX4x83EUWKnJvQWxlDujBfi76O27cUJfS+
 gTjz6uryK8/lqNv0ooLV6D9mBv4jgCl6tBDEo2jH3ptuXfmMJFihipUNOQWOmF8KQ=
X-Google-Smtp-Source: AGHT+IEVOj5qtIK9SZlpsAuRM/0uGNxmJtS/Z+rrAuP/YjslZpEI5RN54V/lFTwvhArOAWWIiCnq5Q==
X-Received: by 2002:a05:600c:6309:b0:46e:4499:ba30 with SMTP id
 5b1f17b1804b1-475d2ed1ba5mr21582565e9.30.1761317293064; 
 Fri, 24 Oct 2025 07:48:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b4ee:479d:354c:6970?
 ([2a01:e0a:3d9:2080:b4ee:479d:354c:6970])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae924a1sm120723715e9.2.2025.10.24.07.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 07:48:11 -0700 (PDT)
Message-ID: <7d8e9395-d2e4-413c-9058-fe22e3d2d68f@linaro.org>
Date: Fri, 24 Oct 2025 16:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
 <50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org>
 <05d6ea2a-c1ae-422d-b178-5d2a306f3669@linaro.org>
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
In-Reply-To: <05d6ea2a-c1ae-422d-b178-5d2a306f3669@linaro.org>
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

On 10/24/25 16:34, Krzysztof Kozlowski wrote:
> On 24/10/2025 14:43, Neil Armstrong wrote:
>> Hi,
>>
>> On 9/8/25 11:49, Krzysztof Kozlowski wrote:
>>> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
>>> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
>>> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
>>> were called on unprepared PLL, driver read values of zero leading to all
>>> sort of further troubles, like failing to set pixel and byte clock
>>> rates.
>>>
>>> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
>>> corresponding dsi_pll_disable_pll_bias()) which are called through the
>>> code, including from PLL .prepare() and .unprepare() callbacks.
>>>
>>> The .set_rate() and .recalc_rate() can be called almost anytime from
>>> external users including times when PLL is or is not prepared, thus
>>> driver should not interfere with the prepare status.
>>>
>>> Implement simple reference counting for the PLL bias, so
>>> set_rate/recalc_rate will not change the status of prepared PLL.
>>>
>>> Issue of reading 0 in .recalc_rate() did not show up on existing
>>> devices, but only after re-ordering the code for SM8750.
>>
>> It happens this breaks the bonded DSI use-case, mainly because both PHYs
>> uses the same PLL, and trying to enable the DSI0 PHY PLL from the DSI1
>> PHY fails because the DSI0 PHY enable_count == 0.
> 
> 
> If it is ==0, the check you removed would not be hit and enable would
> work. I don't quite get the analysis.
> 
>>
>> Reverting part the the patch makes the bonded work again:
>> ===================><===============================
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 32f06edd21a9..24811c52d34c 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>>    	u32 data;
>>
>>    	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>> -	if (pll->pll_enable_cnt++) {
>> -		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>> -		WARN_ON(pll->pll_enable_cnt == INT_MAX);
>> -		return;
>> -	}
>> +	pll->pll_enable_cnt++;
>> +	WARN_ON(pll->pll_enable_cnt == INT_MAX);
>>
>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>    	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>> @@ -965,10 +962,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>    	u32 const delay_us = 5;
>>    	u32 const timeout_us = 1000;
>>    	struct msm_dsi_dphy_timing *timing = &phy->timing;
>> -	struct dsi_pll_7nm *pll = phy->pll_data;
>>    	void __iomem *base = phy->base;
>>    	bool less_than_1500_mhz;
>> -	unsigned long flags;
>>    	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>>    	u32 glbl_pemph_ctrl_0;
>>    	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
>> @@ -1090,13 +1085,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>    		glbl_rescode_bot_ctrl = 0x3c;
>>    	}
>>
>> -	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> 
> This should not be removed.
> 
>> -	pll->pll_enable_cnt = 1;
> 
> So you basically remoevd pll_enable_cnt everywhere and reverted entirely
> my commit. How is this patch different than revert?

No I did not, I kept the dsi_pll_disable_pll_bias() refcounting and call from
all the clock ops, which is basically needed here to never access PLL without
PLL_SHUTDOWNB and DIGTOP_PWRDN_B being asserted.

I only removed the pll_enable_cnt from dsi_7nm_phy_enable/disable because the
PHY code is designed to allow setting the PLL rate while the PHY is disabled.
And the bonded DSI hits this use case by setting the DSI0 PHY PLL rate while
configuring the PLL1 PHY.

So I wonder why it was added in the beginning because since you call dsi_pll_disable_pll_bias()
in each clk op, the Hardware Programming Guide for DSI PHY is satisfied ?

The commit message doesn't say anything related to dsi_7nm_phy_enable/disable.

Neil

> 
> Best regards,
> Krzysztof

