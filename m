Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C91A090E3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 13:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B3110F09D;
	Fri, 10 Jan 2025 12:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HYknaL+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D1B10F09D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:43:32 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43637977fa4so2282605e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 04:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736513010; x=1737117810; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Prlary+OMsV7AQL9JJp5WwDtVeDhVejTzPRLWDvQlZM=;
 b=HYknaL+tsUoin9UxjP7uHTy1H0xHFzJWUIwvYnd5bwUH5SdfVV5UOO3iIzMDH39Jh6
 nz3dN4x5+Hvh91V6A3xC9bgcjRiyRPxnGq6+B6g2KqOb/OD6fAaLV/3yXbFdY11PUS+t
 2MC1CkZD3J17TLWF/WwpuQFeFP13Zod7JnanYZw1KdbAk1NNem/2spgOIubk4JYzjhoi
 nF/krEv1ug6Ia5yTwlm9beoZTKLXzz8bzteKhktl22wweCrT3BDHnRwt6IW2UhjVtvyV
 EgOUlCdA6WBon7eThG3LYBEafBFQ2iXzp/4BPOxjbb0Ga0lPnauF0R7jBN1sjlJ8YgIk
 F/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736513010; x=1737117810;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Prlary+OMsV7AQL9JJp5WwDtVeDhVejTzPRLWDvQlZM=;
 b=gtBfNJa9ZZY/8A9KhPf30WDGdNSj7cJiJ+67EhQSFbkYyJ8uu3zuquOTNFjLH9he+l
 d01STtvgusoxtOsJdAzG5jlFh56BWBquUT2J2HRZ687osQKWcdwq6F6o0xyylC8Y51r2
 XnOepYJMaIB4aFihLBX+ozA9N7iTpAYCuqzR6lXnV2C0KUkc90S5Fv+1vWqe62xxVcQl
 B/8Mez0eluBKvGlnNc946OuVenAsi9DQE+h95uqeNWOBBHIRtvENUFtu1DRTMp4I4Nww
 JGszQGMW2AozuxvICSo+fOA5ikBeDIkOh66CCzxXw7TGdMQPjzyc6J/BYNCVcGaZRMAn
 1V5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN6VqnzWdcF53t/TsuLDjxrThQ1zFR6RU8XwaT0/n42vkEuqk0/EwNjc8Nd96XLIuzmPd4cZvuvF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRZ2oPjkLy7z3sz850sBkEk1gh5h+8uMbhEy8BAjZb3Ibb05+i
 nnX2rqxdcnE1mYXLX/LwEqhe5CBb/cizg4OvXjnX1JAwfjmakX0kDRjXJpMfacs=
X-Gm-Gg: ASbGncvl+I/g5afHENkEUOntQOvQU6bsPS/wm6jG+HqFcRD26IvBnxICehx1Tq3lAo1
 SJpzevKLOrIDa63hJmwcNxZgYx4X5N2/wZzlkCNW1dX4k4UZwq71U4JeRfmqJbn1iFhKQjftX9y
 U7USheNOhirN8PC7XC83rrAxzNqcPEpkWenfVqSl530q6SYgiYFxiJSnX1oYzOCoB6Jwnwn2h4k
 vUfdUCQMrsqFuEJVGZagrKpNPeA4iDh7gK5fxJOLRisSkg6GyxuEJ/zHDvBJtCq1B7xbFAW/DJb
X-Google-Smtp-Source: AGHT+IH+h6+u4V0VlF0HY+8A/du6CsQn4tLW/yS6+DMebfJ91fAReKJVdXwm8GimoBZKqE2lntFnIA==
X-Received: by 2002:a05:600c:3ba4:b0:434:fecf:cb2f with SMTP id
 5b1f17b1804b1-436e26ef077mr41987185e9.5.1736513010634; 
 Fri, 10 Jan 2025 04:43:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dcc8f8dfsm81574515e9.0.2025.01.10.04.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 04:43:30 -0800 (PST)
Message-ID: <6ee02d22-7a00-4c7c-a5e9-63e91d7d84ba@linaro.org>
Date: Fri, 10 Jan 2025 13:43:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
 <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
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

On 10/01/2025 10:17, Dmitry Baryshkov wrote:
> On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
>> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
>>> On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
>>>> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
>>>> differences worth noting:
>>>>
>>>> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
>>>>    offsets were just switched.  Currently these registers are not used
>>>>    in the driver, so the easiest is to document both but keep them
>>>>    commented out to avoid conflict.
>>>>
>>>> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>>>>    parents before they are prepared and initial rate is set.  Therefore
>>>>    assigned-clock-parents are not working here and driver is responsible
>>>>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
>>>
>>> Isn't it a description of CLK_SET_PARENT_GATE and/or
>>
>> No - must be gated accross reparent - so opposite.
>>
>>> CLK_OPS_PARENT_ENABLE ?
>>
>> Yes, but does not work. Probably enabling parent, before
>> assigned-clocks-parents, happens still too early:
>>
>> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
>> [    1.623556] PLL(0) lock failed
>> [    1.624650] ------------[ cut here ]------------
>> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
>> configuration.
>>
>> Or maybe something is missing in the DSI PHY PLL driver?
> 
> Do you have the no-zero-freq workaround?

Yes, it is necessary also for my variant. I did not include it here, but
I should mention it in the cover letter.

Best regards,
Krzysztof
