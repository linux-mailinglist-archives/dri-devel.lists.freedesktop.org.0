Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7EC400BB
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 14:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CC210EAB8;
	Fri,  7 Nov 2025 13:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GSZATz5k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A47510EAB8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 13:10:48 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-63c489f1e6cso645995a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 05:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762521047; x=1763125847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gYHHRwUPFMx2o7hSDNrrgKGsA3wEJmqOL2og+5hJ+F4=;
 b=GSZATz5kZKs8WEYRabGxo6Gzhi9QS50KcTn/F72DMaz5ptEAXCRs6TeZPjUiTH7Yza
 NhkPno1g0HP+XaYPhN2N/ip//USdPQ4+KDa6c4sb3lvaiqoaQNHFMf6lL03RaiTfIYWp
 4HmGp+fAvcsEf3Szb5QUjlWJ3N/n0zCwgIUt2Zz7zeZCHgPENhjPffBKO0xNn1IENZgv
 +rPnLDacTL87UmVZ2mrNYjJwRAD1g5DkPPB3/y0+4zFduvveXokQy68aems4scUko2xh
 /FtlTWhxIAs2HUry0/15B586gYRMEXvKM/gpnlZrfGOZhuiyapYWCAUPGuYECXia3xZZ
 temg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762521047; x=1763125847;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gYHHRwUPFMx2o7hSDNrrgKGsA3wEJmqOL2og+5hJ+F4=;
 b=dwd2PHUbi1kqtT23NhhHyqa20knC69115K3lF/e0ScwACuamSyYe6qpMGM2AhHuuRV
 Z8y5ePAak8mDZRxicAQEvO7h37BbRbrmxzmrzQoLMoy+M6QCr82gSkb4omg2vnnbWwqR
 cXiplp+W1VNqWEtImF9TJs5grOfLJNIM2dx5Mig1K7kRXdAyxtn6XEtFvyDhEHP5WMxu
 qHSDKLctRLk0AiGXzCnNThydp/LvYt5x2KYSreSIzvE71tj35S1CAeNKK9foR5VXEdq1
 FSrIRCLbher0s35rfpCfjG+rApDUwOBo9+htFB/Erc6ymm1OvON4tR3tWVB9Og/29Ato
 FGkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMu4uZGDgx8FKQlzsnsGpDxCMHx48kjiylcgcZ9SeTr55mbRdJhS0Hj+2HenCYaBLlXz2n+BMeEQk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNms7yKDfdd3SY2q6Aa3O14c/saPVxN4rtDwdpxNag5olW41n/
 P17A6LHeOkugOoFO67d6dhxPNsWYIhGZRhmYFV8HbHu4btgXfyZFTCZrKV71FGomE8M=
X-Gm-Gg: ASbGncv8QLt8keoK9dtdUu39GJnIzTMzcdg4OfAtBts1LDQOoNheAJeI3xK3+H/04XS
 dreAbpk5Sw9GavDqjXUYFheqAjw1Lz1i2Kti2JyXQxXsSOjXzKEtRL3wTmJ+3pKNlcxLohf+ieI
 UoCBpn1a1SSSVTmeTMkquP9xdefGao2VyhvujxfV8C96yCiYV+EM0BgaLJz3jsaxmw3jsgex3fN
 aFXZkULGSsq2OcuRFtjDtkPzWfpHSOI3Psel3gFgc3VSa66sgItblX5dUdG/16AI2B89spWgYCF
 sBUO9MWrwt3H0+8f2UQ3CBA6nqGhhLz+l7gGwvmH3N0onVo9WowRTfpzQ/IAresseB4xwfLle1E
 9WptebMt37PwF3Zs9cy+XGPmMl0ydmKrB2rZ6dTPXuTOo35CEuREpBvdvwT+93fg7KdsgIj0b7A
 h5yEt8WL2sCn+oQGUabjNEk7Kh
X-Google-Smtp-Source: AGHT+IGg1Zbnws8cxX7orORuWlbhSBF5v/XmuMbF1BaB1hdo3oYtaWYVQbZOezZs+ceawiJZq7x26A==
X-Received: by 2002:a05:6402:461b:10b0:641:1cbe:a5bf with SMTP id
 4fb4d7f45d1cf-64147094e1fmr1299694a12.9.1762521046750; 
 Fri, 07 Nov 2025 05:10:46 -0800 (PST)
Received: from [172.20.148.153] ([87.213.113.147])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f813e9fsm3999374a12.16.2025.11.07.05.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 05:10:46 -0800 (PST)
Message-ID: <db9ea6f8-810e-4143-9e09-84536145999a@linaro.org>
Date: Fri, 7 Nov 2025 14:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Heidelberg <david@ixit.cz>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
 <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
 <be1b6e34-40ab-4587-8dbe-84e08bf83dcb@linaro.org>
 <108b8631-6d92-4b2f-a59d-3c9e0c607e5d@kernel.org>
Content-Language: en-US, en-GB
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <108b8631-6d92-4b2f-a59d-3c9e0c607e5d@kernel.org>
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



On 11/7/25 12:27, Krzysztof Kozlowski wrote:
> On 07/11/2025 12:23, Neil Armstrong wrote:
>> On 11/6/25 09:48, Krzysztof Kozlowski wrote:
>>> On Tue, Nov 04, 2025 at 11:16:09PM +0100, David Heidelberg wrote:
>>>> Basic description for S6E3FC2X01 DDIC with attached panels
>>>>
>>>>    - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>>>>    - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
>>>>
>>>> This panel has three supplies, while panel-simple-dsi is limited to one.
>>>> There is no user of this compatible, nor the compatible make sense.
>>>
>>> There are. git grep samsung,sofef00, gives me two users.
>>
>> Hmm, on -next I only see a single one:
>>
>> $ grep samsung,sofef00 arch/*/boot/dts/ -R
>> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts:  compatible = "samsung,sofef00";
>>
> 
> These are the users:
> 
> arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> drivers/gpu/drm/panel/panel-samsung-sofef00.c
> 
>>>
>>>> Remove it from simple DSI panel definitions.
>>
>> Can't you mark is deprecated at first ?
> 
> Not sure what would be the benefit here. There is no negative ABI impact
> here.

If we want to acknowledge the potential scenario where someone is 
booting a newer kernel with an older DT then we should keep the old 
compatible in the driver right? And marking it deprecated in bindings 
would make sense.

It could be removed from the driver in the future if there is another 
variant of the panel added or we decide to cleanup.

It's still not entirely clear to what extent we care about DT/kernel 
backwards compatibility though.
> 
> Best regards,
> Krzysztof

