Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BF2AA8C22
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 08:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6921F10E2EF;
	Mon,  5 May 2025 06:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nFjnkvHv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6781B10E2EF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 06:15:22 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43d16a01deaso4275885e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746425721; x=1747030521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=TxK/pctKF6C6aazKg6OENbtkCxPaC3gyVkFcwKqIeNI=;
 b=nFjnkvHvEetCwYtnWP7UovSFOn/2/C9Dw9nf7zegVOVOLVbnU7zMKF749ijdVzpQqZ
 q6f2McDA091SRjlF0l3qwUCLBXJwxO/9qv5QSU6oDajjjKolOqGyjBITSJcsxisSFx+r
 3ZTldLrajzwznFJ2gdz/zxx/FOFTsc3oqKGis1Vuz+bN2thFVGoLEpqjvMqzW4I09aJy
 JIto5rcK9fWiWUHs524gxOHTTiZjvwojkQrwCX8b0BoZRrT3TQ0gG+dhws2NRJtP8yBN
 wiUnQFHrgsAJl9hU7cXXhwWW5jUIT3pw6htg0wJ8o2IUInJ1LV+k+/SF0+b7S9L37AFn
 GhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746425721; x=1747030521;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TxK/pctKF6C6aazKg6OENbtkCxPaC3gyVkFcwKqIeNI=;
 b=RrRNLBJdQA6ht0imCQY5eprX7kqpVLUsfB5TkpfCin0yy84JVxonsqyIS02xq0gmNQ
 atJd1pv29kQav3xdW9BMcPXq5ZpBgQ+oG7ZJwd8YbTGyDs6KLWsaJbfXc/SxZrrgfbb/
 5JZ8H94HZrbGMb1JqtGK2dDcDcXfzC75m6IbFDN30zCCQu9v/C9uWiHrfoub1jifVDsN
 x5FJ9hC32LtNAtrLJhM9QiYCnqsYA0LYzw23Flo0YL3ZUK/ozLRgunov92mMjDgyvwFY
 AYYPd+q8Mdy0tGaH3xrXUHYu7lAL2m3EOqB0i56yWMq1zDhfALGFzw0eXlFRsRtlKD/7
 TkUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVeyqkZVwibq/vxlEPYf40aFbgwWsqeaEMQZ1xrSUtzI/w8yhWHfNZldp85yBAaAZX3rV0S8+ACjY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaYqeIvkuWUCoGktHWoCocPpxOpd7qujH59JZD/gOwJxRaCvLY
 pZBIhFEjFtockyzzXkD57AA982ShV2LqcgUwbElz7Hv0UEPBAh23Irs5K4arJec=
X-Gm-Gg: ASbGncv6m9VGPisE5dN9DvuLrICjmEj8Ngf7WajZMhSnt2yVDkNTzdaXgU/HygYzk3g
 QNg8hHAU2LEynPsd15L0N7pFDZTfPtyqBE33jyJiOcSytNp7naWd7nRjD65Nf8jmWFYPlURKqkH
 RZiWAUUSiWhhHxhEcLg8BwU1FnEnKZAzERDFxZORjapO2JPGCPJgr2TZrLhdlXLxgz1vCtUaaKs
 yrFuh34IkyMw7zMgFByE6TpZqol8Eb9TD9i3lbT4NkzGW6ojo/cl5v7FdTRJASoUgH/L0ZWShHV
 61QScMYbhPtMaFy7U7viIr+HrhLRCZ7YxNDMKwSujPq0zkBNA5V2niDTAvE=
X-Google-Smtp-Source: AGHT+IGYzpcLXDJt3YPMJwjoLaKIbfaCgKHzEcaTw+3Vcv1jOY7XPCX3Z7TVWylT+uhkc9trXq4HgA==
X-Received: by 2002:a05:6000:310b:b0:3a0:6868:8b13 with SMTP id
 ffacd0b85a97d-3a099ad5a51mr3279808f8f.1.1746425720738; 
 Sun, 04 May 2025 23:15:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae79d8sm9148905f8f.42.2025.05.04.23.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 May 2025 23:15:19 -0700 (PDT)
Message-ID: <0e7c76ad-ebc6-4dbb-9c3d-07071443b759@linaro.org>
Date: Mon, 5 May 2025 08:15:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
 <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
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

On 03/05/2025 00:42, Dmitry Baryshkov wrote:
> On Wed, Apr 30, 2025 at 03:00:36PM +0200, Krzysztof Kozlowski wrote:
>> On SM8750 the setting rate of pixel and byte clocks, while the parent
>> DSI PHY PLL, fails with:
>>
>>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
>>
>> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
>> CMN_CTRL_0 asserted.
>>
>> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
>> enabled during rate changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch is independent and can go via separate tree. Including here for
>> complete picture of clock debugging issues.
>>
>> Changes in v5:
>> 1. New patch
>> ---
>>  drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
>> index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
>> --- a/drivers/clk/qcom/dispcc-sm8750.c
>> +++ b/drivers/clk/qcom/dispcc-sm8750.c
>> @@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>>  		.name = "disp_cc_mdss_byte0_clk_src",
>>  		.parent_data = disp_cc_parent_data_1,
>>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>  		.ops = &clk_byte2_ops,
>>  	},
>>  };
>> @@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>>  		.name = "disp_cc_mdss_pclk0_clk_src",
>>  		.parent_data = disp_cc_parent_data_1,
>>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> 
> I assume that these flags should be set for DSI1 clocks too.


Indeed.



Best regards,
Krzysztof
