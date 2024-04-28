Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA78B4A9B
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 10:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4247810EAF6;
	Sun, 28 Apr 2024 08:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bgIG33c/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF91110F99C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 03:25:34 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2af800ff18dso2849565a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2024 20:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714274734; x=1714879534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lLIp3eAfQD8CQMCKFDKg8uIvyN0SEXktzvJZCsva1y4=;
 b=bgIG33c/lBpq1shSL/2PHFo2U3wjXTdGIj1gxJ5L5liS1UTCcqAqy5cwNubYTNL0fv
 EFX+9KAG/h8gAmDBmsl9wT3wZKQoNFhLYgHrrPDU5Src+aAewrYVJ4dcA5qfk0PhP3E2
 SES0Rp4KxP5Pt8DtupyVe5NVP15nldcHDb4hHwBXlkcLNFWdGsEJJqYvKI5I437vpHbj
 CenZfuceVWLcIkZw4gOWJtyjCD7p05zNwXOkC/aPpQAheXBBBiNC6WymItm1gv8+/Q9y
 LXmIN1ejp+WyvN+pd6suwAMEGlqflGT1bugiaEOrHmuOONM4WnJtXNE4Uc5lSW1WwDIC
 i1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714274734; x=1714879534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lLIp3eAfQD8CQMCKFDKg8uIvyN0SEXktzvJZCsva1y4=;
 b=iNHTcVh3tP8okfg0J+M9WfEkf0aqb+I/SF09CmItz85KdXfK+O0b48aYYbvxSgC1WX
 ku4+c8mpOsaaodEs3x4a48+U4ec0r8vf85SNHoZdaoY3eCR4w5qiGbnCBO6QO/8WsoYr
 HRr6zfAyuMmBykfnNegKPEwCX9cwY8Vz8OdNB/jDhWD1GeUAvabLesfDck4AVcT9AGzw
 vD5CkjqgxjcdkTXpp9kikMprILLArKaH5roThPd2tpXVVWnHDewRUqcm0O23fhxWZu2O
 vZ6gPSxBkcyhG04Yd1PyCXk0CjHrDL7V9xyFGKu8qaPFldm2m7iPxDNJK1sM+nZBMIMQ
 75MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd5v9WpvqqMxa3Rx+nTMVYUcRTEr/AtSfMkBTXO+0JdryVFWWSdeQ4k+Ympc88jo0CalskLlBAonj48SBJsEFNCKdS7cuo3wysTeobX4z3
X-Gm-Message-State: AOJu0YxvFO2BTZuHL5KvclGyO0WPg4oouUoaiqQGC1yIjNY+toncCcLO
 TSedyMEL0dA5HJWXCADB3q1fjDN7EAuEpIdwS94lgJidhadC/vOc
X-Google-Smtp-Source: AGHT+IHix91u6ZSVql6QvYGRpmSFoZAiVGl8I7Ra5uHUolRC1CoBqUEI9EePwejfhWQ0cSao0pGHag==
X-Received: by 2002:a17:90b:8d1:b0:2ae:78cd:59fe with SMTP id
 ds17-20020a17090b08d100b002ae78cd59femr6972814pjb.31.1714274734037; 
 Sat, 27 Apr 2024 20:25:34 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
 by smtp.gmail.com with ESMTPSA id
 pa5-20020a17090b264500b002b113ad5f10sm1189336pjb.12.2024.04.27.20.25.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 20:25:33 -0700 (PDT)
Message-ID: <cb1ac16b-3491-425d-95d0-91fba64d78e6@gmail.com>
Date: Sun, 28 Apr 2024 11:25:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] dt-bindings: display: panel: Add Synaptics TD4328
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-3-e0aa05c991fd@gmail.com>
 <20240425161134.GA2695912-robh@kernel.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <20240425161134.GA2695912-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 28 Apr 2024 08:07:30 +0000
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

On 2024/4/26 0:11, Rob Herring wrote:
> On Wed, Apr 24, 2024 at 11:29:08PM +0800, Xilin Wu wrote:
>> Synaptics TD4328 is a display driver IC used to drive LCD DSI panels.
>>
>> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
>> ---
>>   .../bindings/display/panel/synaptics,td4328.yaml   | 69 ++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,td4328.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,td4328.yaml
>> new file mode 100644
>> index 000000000000..216f2fb22b88
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/synaptics,td4328.yaml
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/synaptics,td4328.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Synaptics TD4328-based DSI display panels
>> +
>> +maintainers:
>> +  - Xilin Wu <wuxilin123@gmail.com>
>> +
>> +description:
>> +  The Synaptics TD4328 is a generic DSI Panel IC used to control
>> +  LCD panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    contains:
>> +      const: syna,td4328
> 
> You need a compatible specific to a panel. This can be a fallback
> though.
> 

Unfortunately I have no idea what is the model name of the display 
assembly. I wonder how the compatible should be named in such case.

--
Thanks,
Xilin Wu
