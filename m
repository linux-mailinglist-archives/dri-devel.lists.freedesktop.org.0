Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39915A286A4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 10:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403B10E163;
	Wed,  5 Feb 2025 09:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I4+JgCyz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A555110E163
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 09:34:50 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38da6a1a20bso212698f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2025 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738748089; x=1739352889; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XME8GwkXK8bhfCVEpnNIXbNPEdxuzw7y0bc5Pucl5KI=;
 b=I4+JgCyzrQPM75kikwJD0zbmKoTosAQ59M5L9RXO4s/GdkXdB4Zvh6N8JOs9n/Ahrw
 qc4z5QDIioCUkGR+TOEsnzX43zKneI/yUvDiEVt8pa0w0Ga6xCSq73zNkC2xD7WS9jMt
 P+p1xzndN25JoQugrQ+A2nR1gR/ocf/CoBwqNrVx9HSKMJAv2f5eHvaLrCenhfPyK6O8
 bGGg+3m8EMyYYzkV/8zpy0DwTKOqQI+C4KuNBlXm7Uu4o3UTshUwtjOw9Eun+LYrvfcR
 2qkn0oJDT2iaMdcbqO1BD1T8zgJK1TFVCWOmjLAl/uSQamWbGpYQP8MoITkSWuWFbc3x
 peLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738748089; x=1739352889;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XME8GwkXK8bhfCVEpnNIXbNPEdxuzw7y0bc5Pucl5KI=;
 b=EZfpeS9r23ur1/ZnYkksZXYRqZIC135b2frLy/GTR0c+fyRZc53nCgcDShAh5f/9y6
 suvmKfldIraxMZ5hH/leKhsktP0JPV+GVV8QP2iZIvvLgGO66J5Vjyf1Diw2QNpviJ4b
 ZF0WyEUWb2D1Uu8QDGUeI5N09H7/y+CTSh6TkzW/otPlhzDqe4gxovoKM0aIOYAkpv3n
 SjxQ+fAosJvzfEwkVLGg1t+z/d5wbHJ2MPma/8Yfv7CM9y7FKEy0ZgOxG27+0z3zaoo7
 0x/1jxKEHxMieTwrxOyrI4MXxymCGkMguwna3DMGRi7HNQRPcLc9vhdaItjpq8kwod5y
 QXwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLC7Bi+oh4B1wDdnpRGXKnqsTL0c/vhYLVS2CbYkbFKn/bKv4/7j2CExXEfbwVTf8Mm5N2f9K+N0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuMFsLN+iHjilZMOl0mn7uJmtlPIo5apVvRGUBlkKWNCIzqrpo
 i1mnNdOf3v4rcTqA8ri59as8tbPw26H48OxcNW5k9XdgzIOS1XM8LIHg+MIaI1w=
X-Gm-Gg: ASbGncspoG1F53Dzp0GZ0ZdyyuI9mNcGiVHwZU07rnJQcE37dc1ecwYvRgBdG8HnvBE
 1E8Zosp7Gs+RwHorvvaGCyz9SiLiLmuTMrebIs96ZvNXCPtd+5uxAayth8sJQoibNDXcMJwkY4N
 z6lc9hIZdDALPOW1QS07MnQEBr8oRH3yS6g2ayLcxnjBa+WbrJE9scKTcdKQ4NEbg7wLVKae0w/
 y4Q9TGNx68H6KupQTdK37ZlBXFy+TrK+TDUysh0OWEqeuFjfsN8Kl2F9JRL+aWcP79xoVfaX8SM
 cGNrhuy9uenB33RjxOr6KfgApTGXV0IUcm8=
X-Google-Smtp-Source: AGHT+IFId32xeOrxh0GKul0CUktRUdVt/4VLShRZOZ9U1CUAWE1uPKI5kfaxj9Vm/C7CanMsHqRQXA==
X-Received: by 2002:a05:600c:1f96:b0:434:9cb7:7321 with SMTP id
 5b1f17b1804b1-4390d430247mr5878735e9.1.1738748089060; 
 Wed, 05 Feb 2025 01:34:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d94d802sm15966595e9.12.2025.02.05.01.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:34:48 -0800 (PST)
Message-ID: <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
Date: Wed, 5 Feb 2025 10:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
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

On 05/02/2025 03:51, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 04:46:04PM +0100, Krzysztof Kozlowski wrote:
>> On 04/02/2025 15:26, Dmitry Baryshkov wrote:
>>> On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
>>>> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
>>>>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
>>>>>> clock from Common Clock Framework:
>>>>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
>>>>>> concurrent and conflicting updates between PHY driver and clock
>>>>>> framework, e.g. changing the mux and enabling PLL clocks.
>>>>>>
>>>>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
>>>>>> synchronized.
>>>>>>
>>>>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>>>>>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>>>>>>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>>>>>>  	spinlock_t postdiv_lock;
>>>>>>  
>>>>>> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
>>>>>> +	spinlock_t pclk_mux_lock;
>>>>>> +
>>>>>>  	struct pll_7nm_cached_state cached_state;
>>>>>>  
>>>>>>  	struct dsi_pll_7nm *slave;
>>>>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>>>>>>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>>>>>>  }
>>>>>>  
>>>>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>>>>>> +					u32 val)
>>>>>>  {
>>>>>> +	unsigned long flags;
>>>>>>  	u32 data;
>>>>>>  
>>>>>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>>>>>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>>> +	data &= ~mask;
>>>>>> +	data |= val & mask;
>>>>>> +
>>>>>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
>>>>>> +}
>>>>>> +
>>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>>> +{
>>>>>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>>>>>  }
>>>>>>  
>>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>>>>>  {
>>>>>> -	u32 data;
>>>>>> +	u32 cfg_1 = BIT(5) | BIT(4);
>>>>>
>>>>> Please define these two bits too.
>>>>
>>>> Why? They were not defined before. This only moving existing code.
>>>
>>> Previously it was just a bit magic. Currently you are adding them as
>>
>> No, previous code:
>>
>> writel(data | BIT(5) | BIT(4), pll->phy->base +
>> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>
>> This is a mask and update in the same time, because:
>> 	(data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>> is just redudant.
>>
>> I did not do any logical change, I did not add any mask or field.
>> Everything was already there.
> 
> Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now

You did not address my comment. Previous code was:

(foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)

Just for shorter syntax it was written different way:

foo | BIT(5) | BIT(4)

> your code adds BIT(5) as a 'mask' parameter. Is it a correct mask for

No, my code does not add it. It was already there, look:

foo | BIT(5) | BIT(4)
      ^^^^^^^ here


> that field? That's why I'm asking you to define those - you have changed

No, I did not change bitwrites. The code is 100% equivalent, both
logically and assembly.

You mistake maybe with some other part doing "writel(data & ~BIT(5)" in
dsi_pll_disable_global_clk() but that's just poor diff.

> bitwrites to the masked bit writes. Masks should be defined.
> 
>>
>>
>>> masks. I want to know if BIT(4) and BIT(5) are parts of the same
>>> bitfield (2 bits wide) or if they define two different bits.
>>
>> While in general you are right, it does not matter for this fix. If this
>> are separate bitfields - fix is correct. If this is one bitfield - fix
>> is still correct. You could claim that if this was one bitfield, using
>> 2xBIT() is not logical, but this was there already, so again my fix is
>> only fixing and keeping entire logic or inconsistencies intact.
> 


Best regards,
Krzysztof
