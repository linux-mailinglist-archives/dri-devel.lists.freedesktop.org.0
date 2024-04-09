Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CC89DE48
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCAB410F780;
	Tue,  9 Apr 2024 15:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h7J4ZET2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BD810F70D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:13:21 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516c403c2e4so4956096e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712675599; x=1713280399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Y8LMcLnVJ7kXsKs8XUXqanjMzUM/+eZalvbhRQqwe4=;
 b=h7J4ZET2xz/PP7HPUz41y0x8kXokkMOGn97Zs4Un9PKJe70HChhvF6ml9OshDtV94/
 R8POWp9TF8wM8Wx/9ZPEOjt/n0Dn7canDzDy1wLxK3LyMHH7+soS2egrQ0cYF0JlID7F
 2sCMHVqJr7fB0FAvoQmC5jOGIn/QHWJV4sAEnlXjjNYlTZibwwGevtDU6ht8Cp2Y7Rnz
 80m4WC2DBmmYa+NIbcInG33KBU3lT0RTLVQtiB9k3ODjalBFrROa2WnSgNTBqHz/Wsfd
 e+NGTOUmyJMgcFSGVnGxgYziOupVUKDfPLFAMDMUK6ZIhRvdm0cnG4kFFUThstIT8/wz
 yAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712675599; x=1713280399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Y8LMcLnVJ7kXsKs8XUXqanjMzUM/+eZalvbhRQqwe4=;
 b=NIAXam8vxb2VgB/lOJhOF68CeJdNpcQp6FBMnCKaL/c0qdy9fiDduLLj7kBAT/M8th
 oG4D9WP9LKrv5SKPw7BTnPGJO6b4DP2wjo1zW8FDLhROhz7NNAWgU12SNGDotfMWLt7l
 JjKSKSZCz9YlfAicxpVdgtxNCpvKPsAwZDkBZqIakg9qgYxP0W6VwZRLdNUimMyTRe4u
 jgH4T0LE2XqfdJMFQT7CR9Bg13QUfiu4lhS9o34JfKgoBvhghRyKjUG7p1ueY1QmME3h
 qknh1zOm0/utlY8BHyeCyu6fdho1bBzTKioETBs6AOpLevuzgdAaSxDe/Q9+xQygblHL
 /+ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1LXsvTHJLmJavKssIPmrlDA+S7wbeYGDY747ft4uc6+gEVxUYvLKWM7oEu8HTBs3fiJ+/mTzI8FWOaKSXdscGLiXIpFOdx9MSoqlpYsWu
X-Gm-Message-State: AOJu0YxFSrycgEW0GUAbBK50SCiMAjChWFIM46Mw1FqsTBPUA4Gcl8dO
 5qILmOUTq0OJShfNrG/JhIaOLIXvekKtCOSwBl5CfnPeIr3Iik4M40wkB9ywr/8=
X-Google-Smtp-Source: AGHT+IFlaw2LMhoJukUATahy8181y2HaVjByLfM38iyBHMbY2UF2znz52B2OFJre+KGvD+E2b0w0ew==
X-Received: by 2002:a19:3812:0:b0:513:d1d9:9eda with SMTP id
 f18-20020a193812000000b00513d1d99edamr982073lfa.27.1712675599395; 
 Tue, 09 Apr 2024 08:13:19 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 10-20020ac25f0a000000b00516cea36d5bsm1603418lfq.21.2024.04.09.08.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 08:13:18 -0700 (PDT)
Message-ID: <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
Date: Tue, 9 Apr 2024 17:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
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
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
 <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
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



On 4/6/24 05:25, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 901ef767e491..c976a485aef2 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
>>   		.zapfw = "a740_zap.mdt",
>>   		.hwcg = a740_hwcg,
>>   		.address_space_size = SZ_16G,
>> +		.speedbins = ADRENO_SPEEDBINS(
> 
> I think this deserves either a comment or some info in the commit
> message.

"this" = ?

Konrad
