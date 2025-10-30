Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93470C1E9C4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 07:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5844510E24C;
	Thu, 30 Oct 2025 06:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NlxZgT9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C7510E24C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 06:42:15 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7a23208a0c2so610272b3a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761806535; x=1762411335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRjmjhwgFo6DAjuANvJLlsLw1oA4anFVQb7lf99MW8g=;
 b=NlxZgT9vErArTnzYZcWQ79vYcwltgJFY69SdLX5+4k7dfpg96aIICnTIETydp6g4rQ
 nBMbQDJAHYaAnu4eMNC4jiglBmSeMbkKqxin+vL5OuW5CpEsDqdPglRyyrlciag9uCro
 qWAsXspjdR+5Ul/BZzq01SbTfVA31bTCSlSLHrkh37RTOIzQmGAst9iYgNriP4u7q8d+
 KGH49XBkW4jbFXpLUNriBpXrPWWA8go6shyqn/ddx+gVZ709OwM7OA46xZZfmT7Obhrp
 VAglSl+9TtEGS4hq97c+e4l6zAH/t5yjdxcL8riXhAs702y3BcrDkuTZ67BM8YIVjco+
 pdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761806535; x=1762411335;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRjmjhwgFo6DAjuANvJLlsLw1oA4anFVQb7lf99MW8g=;
 b=JpV2R0ABI9lsuzDWMGFOh8Fb5074CeNuaPOTVwdoEyF3l3gBr8fyk5U9I4ySdRZL/N
 6de1w1t/8NJupbTNSLExvsvXfqYnRGagLPAjSBv6VBslReT6SpxNvOsLWMTGmCgd6nW4
 pRLguZoAJ4D0Y+K7u1RiPOhRkgw9uhKhOPcXreW12M9Bm63yhDlMUlfPkG9QWwwIYQeX
 J+XejyTIlnhaP7prcTtw3uoI9mGcEVG49bu5XZUXXFzro5yOWMbbi6PpxDwhXHKiRfek
 yHxgpIUBjUkjTYlpC1wDCJQ7Fuj/Dgyj+8jPup5HrcfGrcLRBVpA1IOhYgbHE93QWxe/
 1FvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSG/lO3dTKvNYEJhU0hAdb8s/T9jNXFfoIxT5J+hk77dKHsbkGsRC2DSDzvKc47uYqMQB/exVkJCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTtkMTsbBK8MwWVsXxYG8GoaQQRjf91x2IgpmVCGxuRFS6dPq5
 B+XUPgBZuPcOYtuipdWTwCUNltSRPI4ZnONWc0Xvny3x0aE0V34d5GzJDLj8Ug==
X-Gm-Gg: ASbGncuUmVtiWamzbjgpcsfjuHIMB+l4hIrzLEwGztC2x0wvHDeYCOBUGmIuzyVWAa2
 0oghLZdltKKAcxlsgCmy41LjhvGcPvGRSCrQzPn5ya5yQZwLwOjij9P9+gZcf7aU95mhJk4Jaz4
 IqwzZsqKwUMHsJcUUd6UbpqbaSDJTOO0sJ97X1Fys2Q/8ADyp2VmLqco1MomFM65HMxK3xiotAo
 P/fhFmeSK1nQNx6ID13J+5CeZ4o1XyLLpJ7cJYnQzGnx8e/PJ+NPI20Jk/9JE8xjC2Q/3IQKdpR
 PALVKJm73uyXCoqyY/6mLfeFJOJxjkqLOFHe7CXhbKvyajz7F7J210cmkW5lcO0auntC9Gjae28
 F+HFveTC7/JY+Km/h1YqMyUbyfB0m8lnVmikcxY1ZgPdStqQeBQn4pUReYBO6N2G7Ji/3w9Yo9A
 Eqt0sNYqClMwbbViyK77bJmBeiIQkbhxYom4QGgae3PQBAVyY3xvnixg==
X-Google-Smtp-Source: AGHT+IHhNxsrwPO8GFNjwbeDLO66xSVyMs6+J042HgogOYR3N9tX6avqO0/30+zi499pUFsIKhHa2g==
X-Received: by 2002:a05:6a21:3287:b0:334:9649:4754 with SMTP id
 adf61e73a8af0-3465293bf63mr7104225637.13.1761806534844; 
 Wed, 29 Oct 2025 23:42:14 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:90ae:1623:a8e:9839?
 ([2600:8802:702:7400:90ae:1623:a8e:9839])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a4140168f7sm17329517b3a.11.2025.10.29.23.42.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 23:42:14 -0700 (PDT)
Message-ID: <89dbc85f-631e-4402-aca6-128e2cce399b@gmail.com>
Date: Wed, 29 Oct 2025 23:42:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
 <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/15/2025 12:26 AM, Neil Armstrong wrote:
> Hi,
> 
> On 10/3/25 01:57, Jessica Zhang wrote:
>> My current email will stop working soon. Update my email address to
>> jesszhan0024@gmail.com
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7e7515a412e9..7a712ded8f9f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>>   M:    Rob Clark <robin.clark@oss.qualcomm.com>
>>   M:    Dmitry Baryshkov <lumag@kernel.org>
>>   R:    Abhinav Kumar <abhinav.kumar@linux.dev>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> +R:    Jessica Zhang <jesszhan0024@gmail.com>
>>   R:    Sean Paul <sean@poorly.run>
>>   R:    Marijn Suijten <marijn.suijten@somainline.org>
>>   L:    linux-arm-msm@vger.kernel.org
>> @@ -8325,7 +8325,7 @@ F:    drivers/gpu/drm/clients/drm_log.c
>>   DRM PANEL DRIVERS
>>   M:    Neil Armstrong <neil.armstrong@linaro.org>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> +R:    Jessica Zhang <jesszhan0024@gmail.com>
>>   L:    dri-devel@lists.freedesktop.org
>>   S:    Maintained
>>   T:    git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> Could you also update .mailmap in a follow-up patch ?

Hey Neil,

Sorry for missing this earlier -- I've posted the follow-up here [1].

Thanks,

Jessica Zhang

[1] 
https://lists.freedesktop.org/archives/freedreno/2025-October/041998.html

> 
> Thanks,
> Neil
> 
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20251002-quit-qcom-5125b64a86aa
>>
>> Best regards,
>> -- 
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 

