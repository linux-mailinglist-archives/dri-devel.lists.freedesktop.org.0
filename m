Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C226189F10A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 13:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310291132D9;
	Wed, 10 Apr 2024 11:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sURwW7Xg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7324E10E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 11:42:34 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-516dc51bb72so5137100e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712749352; x=1713354152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KUA83gpzkWVU1iShuYOjIgJTVa9hCldc/8ck/dDALYc=;
 b=sURwW7Xg/fnN769wLZwZrW9ulrdA9HIBWHUUxwlCTzn/+l5vQ06xsVaEqKICeLNaql
 tXb1pZ4TzAx3PZOo6BABPc+3jSNW1XQB2ZIFovUVAPIFS/xLxffGTArv36aqBS4B/Ieg
 LlvY047/beq5FIeHnU1VyuoSp1mrZIsDy9W90xKav48q/z4uZbQcBU9+m8qjHKeHaXO0
 Oa0RfJdIaRXpPQJgicF0XC51bZVb90q8NHbMBjM/haWU2yFWispUngU/QaVnjBXGooW5
 JdRBDeO0JUxg6gDavBJqJShpWp7JzJYxJGLLyQEH5u2A6ETT50N5C89t3KLWIUalemo8
 c1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712749352; x=1713354152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KUA83gpzkWVU1iShuYOjIgJTVa9hCldc/8ck/dDALYc=;
 b=Cbqeox6dEvFuhn78PFmGBpoXw6rmG1z+gF7JppLvKId2uY28eWTD7MASvfnZOvtBj4
 nS/QbekVOa/vEcbdftY8PuKb7B7aXm9EtJfJ9DNbnip5gM+WUcgF4R8XDwrcE8U+gcT6
 YXKxZZXxNsc6IaSsZkhrYe/e/PxDH9SdR+A84u3fiaFYqR6Pws0zfPSSe47/uj1/qhD2
 w8sFxcM5ZpXpdqlKLYu/AC1ofk3x0mm9nRq+dCO8R1RS2zT59ASS27Bm1OSU0KCr4ex4
 7M941FaLYC8ff2/IyiWSflWiv6MXzcPuj07r93T6KshiNLnjFNf5bo3qrXAlvia0yxkW
 iyAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6L1Iqoeu46Qc2cRyiSsAjMuJMnWVF7CuLqqwETgaOsw7dV5bvxxqSOI3dHQkT/kVuljXzojVrxXiyDaD+dup3gIOlarewspK0fp3P8ktX
X-Gm-Message-State: AOJu0YxVIy24Q2clmgGzg/FeTR41KDffvnov2YAXImMRgbmWVoLm1gcD
 2acjjIgcaQZAz3FD6iG4XfjKM1QBRZ8zoWQuordd/VkY2WGs+WDlhtdEFXR96R8=
X-Google-Smtp-Source: AGHT+IH0+JJIgaOrT6Rtm4Iaj3kAzRyP1f2o2KvzIHaHdG7P6BeuIaEO3YdnIAP8OVrErSr8qWw4XQ==
X-Received: by 2002:a05:6512:e85:b0:516:ea55:324d with SMTP id
 bi5-20020a0565120e8500b00516ea55324dmr1833879lfb.31.1712749352436; 
 Wed, 10 Apr 2024 04:42:32 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 s24-20020a197718000000b00516c600cfcasm1853162lfc.106.2024.04.10.04.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 04:42:32 -0700 (PDT)
Message-ID: <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
Date: Wed, 10 Apr 2024 13:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/msm/adreno: Implement SMEM-based speed bin
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-4-ce2b864251b1@linaro.org>
 <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <scvwfj44z3wpp7phvesfwjuv5awtlkwby2vvrpaq4i5fircrt3@i3ebya4iymf3>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/6/24 05:23, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> -	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>> +	u32 fcode, pcode;
>> +	int ret;
>> +
>> +	/* Try reading the speedbin via a nvmem cell first */
>> +	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
>> +	if (!ret && ret != -EINVAL)
> 
> This is always false.

Right, a better condition would be (!ret || ret != EINVAL)..


> 
>> +		return ret;
>> +
>> +	ret = qcom_smem_get_feature_code(&fcode);
>> +	if (ret) {
>> +		dev_err(dev, "Couldn't get feature code from SMEM!\n");
>> +		return ret;
> 
> This brings in QCOM_SMEM dependency (which is not mentioned in the
> Kconfig). Please keep iMX5 hardware in mind, so the dependency should be
> optional. Respective functions should be stubbed in the header.

OK, I had this in mind early on, but forgot to actually impl it.

> 
>> +	}
>> +
>> +	ret = qcom_smem_get_product_code(&pcode);
>> +	if (ret) {
>> +		dev_err(dev, "Couldn't get product code from SMEM!\n");
>> +		return ret;
>> +	}
>> +
>> +	/* Don't consider fcode for external feature codes */
>> +	if (fcode <= SOCINFO_FC_EXT_RESERVE)
>> +		fcode = SOCINFO_FC_UNKNOWN;
>> +
>> +	*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
>> +		    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
> 
> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
> details there? It almost feels that handling raw PCODE / FCODE here is
> too low-level and a subject to change depending on the socinfo format.

No, the FCODE & PCODE can be interpreted differently across consumers.

> 
>> +
>> +	return ret;
>>   }
>>   
>>   int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>   			devm_pm_opp_set_clkname(dev, "core");
>>   	}
>>   
>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>   		speedbin = 0xffff;
>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
> 
> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
> case. WDYT?

Ok, I can keep it, though realistically if this ever does anything
useful, it likely means the dt is wrong

Konrad
