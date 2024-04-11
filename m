Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A92788A1FDC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 22:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2942910F30E;
	Thu, 11 Apr 2024 20:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qdlUFCKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3463010F30E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 20:05:36 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-516d4d80d00so274099e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712865934; x=1713470734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=23X31wBk3BfhcWEk6ltxZSp3rP6W6hNoB7vDkcBeLnU=;
 b=qdlUFCKAlw6qMYQLDS2vXbawVtb0URHVB4vIPfliGk0oqdub+S5ZK9t5FIRfEf690V
 xvuKL3xXK/Ogmic5nfTm+Yj2gdMBxxaVIqgaur/j3OpcdGwUPu9SyxfzSyCDpF4qIBxf
 esgeoM/rg9OGD/3eWMuOACwM0hep5FoUnk/WaG+cLOP0TdyW9LNFyC73GtxsEoAsOcWu
 y1sO4iXeIEorhMtNxQxYmBKMPfrhouQOArP1qwxFWJK3uYW3pGKULWBin7MBHZpPWRWR
 +1V95B4x1spibaWlTt3NMWjBvLhn/ELxVz8RqZd+sz5ij1qBubn0MVkMm6JX6TtGuycG
 sf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712865934; x=1713470734;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=23X31wBk3BfhcWEk6ltxZSp3rP6W6hNoB7vDkcBeLnU=;
 b=NGz/gNIW64VPxmhx2u8Blxmw9J0+6WYIbiASOHBkmtunbqYmMSO8Y0N+O5D7tayR9J
 EjRyqgj9EDe+qbBrHEQ1xPZW45oB7YF6co4dsJ5PadVrOBpIt35r6uFKNmyQimb5Tp0G
 BxGSI6odQ0KQlpCpZWnfnVPMOmk+ozcicmYrhasPei0Z9qgkvxSjUhOk9GbavTvhUv0Q
 kXS5IR/MKH+2aJOICnPmRqamXSGAYLzY+EZ3EFAyhIvpg4XZjh3/edbCI4fy/3s9gSZf
 rA92nyy3prawinAaiM4u6n1haX6f7+aqwdq0381qaemiFODYyocx3tultoh2qsU/8yMq
 Z+fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZkiq82xTUfKjK3eW32gopDQRv8TDsnYaE+30P2tufi0JBIYiUIt3vDOcXAh/XGgh4aEmHpxfXW4psWkXe7QPF3MXcDRDdlHakZb4XYdOJ
X-Gm-Message-State: AOJu0YyF8n1oAINyi+aMTDOerNbt+m19YqlWS1OtoDwt+mEOBJHZmhBu
 BNGBFBt5V20aIr2+jgrYm4FUEm+ba/coeF/7mw9DBSAEevTBJAFpnFceZtX2y7g=
X-Google-Smtp-Source: AGHT+IF6zl6iOEo7DKIvfS9423W4hfUtCzBCOkPNljsNjdrxqjXqK8MLYOibvZw1RSh2w+0l6aXFNQ==
X-Received: by 2002:ac2:47ee:0:b0:513:ca65:8c58 with SMTP id
 b14-20020ac247ee000000b00513ca658c58mr456382lfp.43.1712865933904; 
 Thu, 11 Apr 2024 13:05:33 -0700 (PDT)
Received: from [172.30.204.35] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 r16-20020ac25f90000000b00516bfd7e856sm292837lfe.57.2024.04.11.13.05.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 13:05:33 -0700 (PDT)
Message-ID: <2c2bca6c-b429-4cef-b63a-ee3bd6c9eecb@linaro.org>
Date: Thu, 11 Apr 2024 22:05:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] soc: qcom: Move some socinfo defines to the header,
 expand them
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-1-ce2b864251b1@linaro.org>
 <20240410132510649-0700.eberman@hu-eberman-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410132510649-0700.eberman@hu-eberman-lv.qualcomm.com>
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



On 4/11/24 20:55, Elliot Berman wrote:
> On Fri, Apr 05, 2024 at 10:41:29AM +0200, Konrad Dybcio wrote:
>> In preparation for parsing the chip "feature code" (FC) and "product
>> code" (PC) (essentially the parameters that let us conclusively
>> characterize the sillicon we're running on, including various speed
>> bins), move the socinfo version defines to the public header and
>> include some more FC/PC defines.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +	SOCINFO_FC_EXT_RESERVE,
>> +};
> 
> SOCINFO_FC_EXT_RESERVE was a convenient limit since we mapped
> SOCINFO_FC_AA -> string "AA" via an array, and we've only needed the 8
> feature codes so far.
> 
> We should remove the EXT_RESERVE and test for the Y0-YF (internal
> feature code) values instead.

OK

> 
>> +
>> +/* Internal feature codes */
>> +/* Valid values: 0 <= n <= 0xf */
>> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
>> +#define SOCINFO_FC_INT_RESERVE		SOCINFO_FC_Yn(0x10)
> 
> We probably should've named this SOCINFO_FC_INT_MAX. Reserve implies
> it's reserved for some future use, but it's really the max value it
> could be.

So, should SOCINFO_FC_Yn(0x10) also be considered valid, or is (0xf)
the last one?

> 
>> +
>> +/* Product codes */
>> +#define SOCINFO_PC_UNKNOWN		0
>> +/* Valid values: 0 <= n <= 8, the rest is reserved */
>> +#define SOCINFO_PCn(n)			(n + 1)
>> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)
> 
> Similar comments here as the SOCINFO_FC_EXT_*. It's more like known
> values are [0,8], but more values could come in future chipsets.

Ok, sounds good, I'll remove the comment then

Konrad
