Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA0C0CFA7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 11:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1708F10E44D;
	Mon, 27 Oct 2025 10:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YheRZalW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD8E10E448
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 10:35:46 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4770e0b0b7dso431275e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761561345; x=1762166145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1eC2sjSfHiIWN4j8w+yh7atvloipy18ZE5R0r29G0js=;
 b=YheRZalWxW4sR4gs/ZARTg2UjQRlkH0bv8G5ZaGC+RyPUcCMX+iW7lW/OUZIiJ+DEL
 pExVHI31pBLIAiun41AyKDfCKcNNzva1ZCLQE6DNbD0xku2sUGKtfLAUoKn24xv78zuL
 oUIu7+e34akDcIy5xDb48N0bAHbp/RXnOmElxVdA3Yq9sQmADBvvnoAX9555p5kwLnmM
 Rml4OGJYbqrDtNrA4QJzgB3t/7KNkTKvucwIz4nxGgys4QODSTmu2buR88sKXRGsx7d0
 8Z3MeJz+co+Oh7iF1QKvoLcd05rEMZLoY6ttW+xOAsqSDuij8xB8URCWvDWASm6Ju/xX
 hsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761561345; x=1762166145;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1eC2sjSfHiIWN4j8w+yh7atvloipy18ZE5R0r29G0js=;
 b=dfQ5MTKnil95upZXeM1arlxasSj371Qz5hfhcGTuRsfmc9yUc3jkGsH2SfeHvw9tdt
 drHbHeDTqjyPzeDqVyI9do8mca7nSSpdl6M1l77lAI9diCO13RB6XoJvZxDAJfJH111F
 sgZ21YLgBqP/Odz5iYgSe7ie4BU6xg4iReGCaJMqQ7bex/WyfhkeC/PTzf8egSrj+O8l
 eRFUCP/TQ6CaQNxI1S9pHzI/ijEHxqQN4kfyFmwxaoFgR3zYv8tOBGtp/e+Dz+JbX0ND
 /xiaUMfXYAC8ELo5bgOBtFU+fAV17i2W4JyTyMPaMi9ZRADiw+KHc7UaAYBtEk4SbIP/
 xo6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfCfFqY2lCr8pvesJHU82dV++WvlP864ZtbW4AqOlY/PACfm2DeS6KbgZAQrMA4zPn9iLaB9PnkfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc4x8Ih2qfScDdAdH/S2WdXi4eeRXbxlKuX8DFLzKjKLOj8Np9
 67mPd5z5/795oNxx6PxJSd/ujLZh5wjsPaU/0VRzswVjTj/moyLXXaG23vYOGaDx4qc=
X-Gm-Gg: ASbGncu0n2A08zUnOmbrGv6F7FMLpYS7G7x/onxVe2E9IuI3SDqDHzVb+qsLCgL5qha
 t3vrOzNpNCERmDwHLf40DCh077PztYxf62eKliLD6Y3Gwrn+PEIfEfBhD8fEbVwG0tXeI3850e0
 j1AuChStiq+sdCFyhqwh9T2ltHfPN+rxSZeo339Hkc7i8lAsXY3BtvcE/JU1etBdQzySurTDC67
 Bywel3EkUTfL1f5oZU4/03DHvvk4nNYL4iiuKYKKSDez4tfB7gzcgl1AQM/1cmGp0R8gi93fFe0
 slOmQZ7P3iAJTf0nL681WCxh4qk1X8VVoD7pTSuLV7gXz9WQpNVSTwNYAceqNY5XrwgfarzIc/D
 fS9mDyGMSc7XbVu0a3eHzP5b3Zmis6fLrq6JtziJrjRPV9ZQn18YNF5AEJmFYlsDuQKeYBYmLgm
 uz/vljrJUWzFHY39bGM8H0
X-Google-Smtp-Source: AGHT+IHoKMtB0k7tD+QS9RPEtlM0Hd0nVYHf0+EztHHBmQYdUIcuy9l+kJwZ92M2NezWHb90uo3n5g==
X-Received: by 2002:a05:600c:4449:b0:475:dca0:d457 with SMTP id
 5b1f17b1804b1-475dca0d543mr29474985e9.8.1761561344933; 
 Mon, 27 Oct 2025 03:35:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd035e05sm128895305e9.7.2025.10.27.03.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 03:35:44 -0700 (PDT)
Message-ID: <f2c9d3f8-f63b-4645-9899-49f2abb1ff3f@linaro.org>
Date: Mon, 27 Oct 2025 11:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <7d8e9395-d2e4-413c-9058-fe22e3d2d68f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <7d8e9395-d2e4-413c-9058-fe22e3d2d68f@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/10/2025 16:48, Neil Armstrong wrote:
> On 10/24/25 16:34, Krzysztof Kozlowski wrote:
>> On 24/10/2025 14:43, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 9/8/25 11:49, Krzysztof Kozlowski wrote:
>>>> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
>>>> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
>>>> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
>>>> were called on unprepared PLL, driver read values of zero leading to all
>>>> sort of further troubles, like failing to set pixel and byte clock
>>>> rates.
>>>>
>>>> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
>>>> corresponding dsi_pll_disable_pll_bias()) which are called through the
>>>> code, including from PLL .prepare() and .unprepare() callbacks.
>>>>
>>>> The .set_rate() and .recalc_rate() can be called almost anytime from
>>>> external users including times when PLL is or is not prepared, thus
>>>> driver should not interfere with the prepare status.
>>>>
>>>> Implement simple reference counting for the PLL bias, so
>>>> set_rate/recalc_rate will not change the status of prepared PLL.
>>>>
>>>> Issue of reading 0 in .recalc_rate() did not show up on existing
>>>> devices, but only after re-ordering the code for SM8750.
>>>
>>> It happens this breaks the bonded DSI use-case, mainly because both PHYs
>>> uses the same PLL, and trying to enable the DSI0 PHY PLL from the DSI1
>>> PHY fails because the DSI0 PHY enable_count == 0.
>>
>>
>> If it is ==0, the check you removed would not be hit and enable would
>> work. I don't quite get the analysis.
>>
>>>
>>> Reverting part the the patch makes the bonded work again:
>>> ===================><===============================
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index 32f06edd21a9..24811c52d34c 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>>>    	u32 data;
>>>
>>>    	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> -	if (pll->pll_enable_cnt++) {
>>> -		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> -		WARN_ON(pll->pll_enable_cnt == INT_MAX);
>>> -		return;
>>> -	}
>>> +	pll->pll_enable_cnt++;
>>> +	WARN_ON(pll->pll_enable_cnt == INT_MAX);
>>>
>>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>    	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>> @@ -965,10 +962,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>>    	u32 const delay_us = 5;
>>>    	u32 const timeout_us = 1000;
>>>    	struct msm_dsi_dphy_timing *timing = &phy->timing;
>>> -	struct dsi_pll_7nm *pll = phy->pll_data;
>>>    	void __iomem *base = phy->base;
>>>    	bool less_than_1500_mhz;
>>> -	unsigned long flags;
>>>    	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>>>    	u32 glbl_pemph_ctrl_0;
>>>    	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
>>> @@ -1090,13 +1085,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>>    		glbl_rescode_bot_ctrl = 0x3c;
>>>    	}
>>>
>>> -	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>
>> This should not be removed.
>>
>>> -	pll->pll_enable_cnt = 1;
>>
>> So you basically remoevd pll_enable_cnt everywhere and reverted entirely
>> my commit. How is this patch different than revert?
> 
> No I did not, I kept the dsi_pll_disable_pll_bias() refcounting and call from

Indeed, I see now.

> all the clock ops, which is basically needed here to never access PLL without
> PLL_SHUTDOWNB and DIGTOP_PWRDN_B being asserted.
> 
> I only removed the pll_enable_cnt from dsi_7nm_phy_enable/disable because the
> PHY code is designed to allow setting the PLL rate while the PHY is disabled.
> And the bonded DSI hits this use case by setting the DSI0 PHY PLL rate while
> configuring the PLL1 PHY.

OK, I understand now.

> 
> So I wonder why it was added in the beginning because since you call dsi_pll_disable_pll_bias()
> in each clk op, the Hardware Programming Guide for DSI PHY is satisfied ?

Don't remember anymore.

> 
> The commit message doesn't say anything related to dsi_7nm_phy_enable/disable.
> 
With your patch it works fine and does not produce clock warnings, so
seems fine. If you send proper fix, then:


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
