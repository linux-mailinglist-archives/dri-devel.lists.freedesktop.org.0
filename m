Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BC1ADE586
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9B110E7A3;
	Wed, 18 Jun 2025 08:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l2Cs2mVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8915C10E7A3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:28:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a528e301b0so901389f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750235294; x=1750840094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dAB1KFolAhtJgPLCNg/mHV2FDuFjiwI4pqfdHMCq72I=;
 b=l2Cs2mVrM357Fuzw0vk1lnINRN/DwT8iFdMbcc9+Ppn7Hi2lupUHWFF6uRzXKeDK5V
 l1ZtGzUhH7JO9j1dgd3Q3y12ZUWZArdvV5vcn6JV82ibtavhpTiCQmIv22IG+3+C+nwS
 WHlxkewHZEixenxFVi26d7nzNSVjsPcAmFjPADWsUHi2O3xeoFhtM/tU4fIftgCLjTK8
 ML3zsd+M8Kx6HuvBxNaNcHqkEakmgwGdlEnvVpJhU89IEJ16Ua72eAkWfE3rp1urmH8S
 8/XV5Ch0qzv6GTx2usQxmGERYMH8m6COswzW2B0UI/sup7aPPO4aN/bhj8R3/YBjAiQ/
 SrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750235294; x=1750840094;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dAB1KFolAhtJgPLCNg/mHV2FDuFjiwI4pqfdHMCq72I=;
 b=rXq7u9Y325XU5zIDOCueiPcMLDLUhXAJWDKbuDYrYH+C6i25fYAo5I6USXd1NCFmm7
 WKpyHlfi7ojHmHM3Lt2sAg5JqcB0amjwDdYrCXHAC7K4h5i0rXGhEmGNCule1kd0uCy+
 VZi8zh87bzZFiW2s7DMajniDGRL2oNT95Uzt0ggtU+DlXd29YWH4e7mCHTUe6WOg2xeU
 Nhb5hwhl3tR70TtxmQmtAHp/R0w74nCJh5QLbwtnUKO06bRaKn0FplGcyMSr7kwXFL3A
 tPIGlKr7gI+RkH3CaSDvFTvJ8IdpH+VTaz9JT39VIC3G+e39icjWhgWNz3ZhEA5sHgmO
 ZUvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh5o8b66n46b8vkGvEOlRGgsKkYvdrkAJUxS0iMXh0AYqeMRZGUXmLTojMT2ajVO+URdCSNafj0VQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMPlPUP7KdGPTpn516h6MJcrk3NiUG4fFlZo4BQx4aeR0DGHim
 KUwwQGe3jPZtGqv+138eMgQ9bbrFQs/S8O44kJMW0aan05RBeBJeyjBDurNNhIa98cs=
X-Gm-Gg: ASbGncsgxovj7ri0QiffWamKgh1Lj2HfY14sCHw6x60gYlRG4v4b/o3qI4ljc+4p7Dl
 51RNP8SHKGgu0JUnOkJo3iS0TCE2EJQ00v88ooK0nBB384ltnsXrqpWTYxRYh+QXQ/EpxXvJEMg
 GwBwXaazXWlNYUju2h52fKQTyKPJiwwaw9Q/GFz3lDcXnM5LWTzR+E0ptFCeoBj9K055TC5kJlU
 A5yJLmW1cZsoLvhk4ks84WkTaE32EoGzYnCftGZXV/W+A/d3gpcF3htzLe5qskrp4QrLuoz84a/
 j7fSr5rA81z6iRR/QhLDoYqOCbJ5K2yOPyjSkxcaOjY5arKSmVu6Gi25vhpmAauzLX8eceKB+rz
 wEgksZK4=
X-Google-Smtp-Source: AGHT+IEprwipG9q6XIESI5sdRLoyTfDlnOgcmO3o69MyV1WWyhSo6jKYIfJfdr8pd/BlFyyUshJepg==
X-Received: by 2002:a05:600c:1c12:b0:43b:cab3:1fd1 with SMTP id
 5b1f17b1804b1-4533ca487dbmr56926295e9.1.1750235294000; 
 Wed, 18 Jun 2025 01:28:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e184724sm197066785e9.39.2025.06.18.01.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 01:28:13 -0700 (PDT)
Message-ID: <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
Date: Wed, 18 Jun 2025 10:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
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

On 13/06/2025 16:04, Dmitry Baryshkov wrote:
> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>   
>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>   
>>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>   {
>>>> +	unsigned long flags;
>>>>   	u32 data;
>>>>   
>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>> +	--pll->pll_enable_cnt;
>>>> +	if (pll->pll_enable_cnt < 0) {
>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>> +		return;
>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>> +		return;
>>>> +	} /* else: == 0 */
>>>> +
>>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>   	ndelay(250);
>>>
>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>> without any delay between them.
>>>
>>
>> Great question, but why do you ask me? The code was there already and
>> MSM DRM drivers are not something I know and could provide context about.
> 
> Because it's you who are changing the code as you've faced the issue 
> with recalc_rate.
> 
Heh, the answer is then: I don't know. I think authors of the code could
know.

Best regards,
Krzysztof
