Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E18A20FC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 23:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32910F3AE;
	Thu, 11 Apr 2024 21:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fbZ4Eozj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F184710F3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 21:35:47 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so2635401fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712871346; x=1713476146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5T4iIVALzwPejh7d3S8enGWCx89OQW+dXm19IHXNjAc=;
 b=fbZ4EozjNWhlskyp/3foCm1FvFkQwMEQmyMCJd0CjIR1ZejqXatr6UqiqH0vIbcJnb
 vAIh6hJVKaCoX1P8Ttk0Dld9NDzO8LwaWSb5aqAlQ+8HZTC6CjqT/dAo3sZbGcA8eWi7
 yryPwDJW+1n1FMhjLcge/Dj23/N4vqkS7VR9EzD7Fmm72FiBP5+z8DP6sAKjTArxhNwG
 BHCxYILhfbFFolTndg9R66zihl3GXvEs+kRdmq9Rntjy+FwoJmFNvTFPy1DRwArM8ywR
 y9jQYSuIhd+L920zu2VFwLPqCLrE81by+oCxQivpjpFlo3skXXlNIMoAxmnUxB2CDAXe
 3GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712871346; x=1713476146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5T4iIVALzwPejh7d3S8enGWCx89OQW+dXm19IHXNjAc=;
 b=wnMOUdquz1vSdrNVBaDlsHAAPFiTQcmrIMqP4mf9aL/hDzpv+hQtnwxtHceGbjX2Fy
 MO0b5bkHy7RedM6X5Bxj69NhwHAXAIRhu8llHz6vFBzj+QG2l4ldZC6FL33hCJReOLU/
 edMqK1FBCj+aYZX3TcvnlD6/DOL2z3TtPXms/QVCqUqk40+lLQp2EnT1AXpymYwlLHR/
 Pk3ul6XSZvn6nbj7+m8gQT+zJBNGzEZfHH2KUemlqR0V/tagmY5BDhrf8zjNH7+dGBf+
 z/bWIvPuPgaWKulW1wM6HSDjdOs/W4rXWqIF/1MfCXD5FwcFBcJL/eNRaoZ0lhXfFLWI
 jPeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXISRCkovgfsmT/VvaWVGNvIpUG5J9Efh3D4gULq4g/3shgl4vpUG+yhL6yYluAPl5DKy1Y62LX6fNSio7AUDjHyCpiJXNGGEIbwDx5A1sM
X-Gm-Message-State: AOJu0Yyb8JpGhet5cX2d79at0A0ZRPzO0ntv6tEtGvigB7AxbP0U84gx
 djytcjG3kFi7izfglpQtefx/1aoddgRehrnM1+Mojrc/+tod4Q2oRHQEfuXD/5Y=
X-Google-Smtp-Source: AGHT+IHhPtTM6MDSSMKdH0nmnBGG027XDSi/RtJTrsfiuHSI3CqYwZHdp/t6eiZd5QJ+PqzWtrodtQ==
X-Received: by 2002:a2e:8084:0:b0:2d8:5af3:bb43 with SMTP id
 i4-20020a2e8084000000b002d85af3bb43mr511195ljg.41.1712871345700; 
 Thu, 11 Apr 2024 14:35:45 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 z4-20020a2e8e84000000b002d8e42c1b5fsm314682ljk.42.2024.04.11.14.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:35:45 -0700 (PDT)
Message-ID: <321aa524-ab64-458a-b4c0-70294cc5467d@linaro.org>
Date: Thu, 11 Apr 2024 23:35:43 +0200
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
 <730d6b9e-d6b4-41fd-bef3-b1fa6e914a35@linaro.org>
 <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <33qyr6cfruczllvavvwtbkyuqxmtao4bya4j32zhjx6ni27c6d@rxjehsw54l32>
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



On 4/10/24 21:26, Dmitry Baryshkov wrote:
> On Wed, Apr 10, 2024 at 01:42:33PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/6/24 05:23, Dmitry Baryshkov wrote:
>>> On Fri, Apr 05, 2024 at 10:41:32AM +0200, Konrad Dybcio wrote:
>>>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>>>> abstracted through SMEM, instead of being directly available in a fuse.
>>>>
>>>> Add support for SMEM-based speed binning, which includes getting
>>>> "feature code" and "product code" from said source and parsing them
>>>> to form something that lets us match OPPs against.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>
>> [...]
>>
>>>
>>>> +	}
>>>> +
>>>> +	ret = qcom_smem_get_product_code(&pcode);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Couldn't get product code from SMEM!\n");
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	/* Don't consider fcode for external feature codes */
>>>> +	if (fcode <= SOCINFO_FC_EXT_RESERVE)
>>>> +		fcode = SOCINFO_FC_UNKNOWN;
>>>> +
>>>> +	*speedbin = FIELD_PREP(ADRENO_SKU_ID_PCODE, pcode) |
>>>> +		    FIELD_PREP(ADRENO_SKU_ID_FCODE, fcode);
>>>
>>> What about just asking the qcom_smem for the 'gpu_bin' and hiding gory
>>> details there? It almost feels that handling raw PCODE / FCODE here is
>>> too low-level and a subject to change depending on the socinfo format.
>>
>> No, the FCODE & PCODE can be interpreted differently across consumers.
> 
> That's why I wrote about asking for 'gpu_bin'.

I'd rather keep the magic GPU LUTs inside the adreno driver, especially
since not all Snapdragons feature Adreno, but all Adrenos are on
Snapdragons (modulo a2xx but I refuse to make design decisions treating
these equally to e.g. a6xx)

> 
>>
>>>
>>>> +
>>>> +	return ret;
>>>>    }
>>>>    int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>> @@ -1098,9 +1129,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>>>    			devm_pm_opp_set_clkname(dev, "core");
>>>>    	}
>>>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>>>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>>>    		speedbin = 0xffff;
>>>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>>>
>>> the &= 0xffff should probably go to the adreno_read_speedbin / nvmem
>>> case. WDYT?
>>
>> Ok, I can keep it, though realistically if this ever does anything
>> useful, it likely means the dt is wrong
> 
> Yes, but if DT is wrong, we should probably fail in a sensible way. I
> just wanted to point out that previously we had this &0xffff, while your
> patch silently removes it.

Right, but I don't believe it actually matters.. If that AND ever did
anything, this was a silent failure with garbage data passed in anyway.

If you really insist, I can remove it separately.

Konrad
