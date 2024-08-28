Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB68961C3C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1EC10E43D;
	Wed, 28 Aug 2024 02:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ajx/xqky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B94410E43D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:47:22 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2020b730049so48792185ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 19:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724813242; x=1725418042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lnF917HMalhfVI2HE4Sr2jQntbMdyS+RrizYBcr5oUo=;
 b=Ajx/xqkyDnihDhx5jmUTcYihd/S3YSPlQ/z05VKaiZB1ru+1urYgeCLQOB8Sn5sFXS
 68e49Lg1q//Zj8EdeogbEiddp5phXSZUzYRDqJ/Ms4lklWvhwMhWMYE0C0jMm6M+60+X
 31Bna47e717PUl4RdN3keOCq7plH4dtc7ZZZTlBdi2AvC1DTZgcIGXNYRRcP5yIR7Gxa
 QSZbSCRGf27Ad0ujh1CcF6vg0Fx4MSf1BVYji6bklVMOG2LExipj33zvT0xEF9xItLPv
 AEeSDbDMigUf4+FS/lqwWfQUhNm4A3YOlPoW0+mrHbmfu5AtzEejCP9w/Rn/LxMOEqxY
 8evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724813242; x=1725418042;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lnF917HMalhfVI2HE4Sr2jQntbMdyS+RrizYBcr5oUo=;
 b=scMMQ5vToJveoJUhAY+8MpEMqDSFJHEtTWecyf7raQz6FkpiStXURBVS4/4pRXExx6
 2cZ7GtGJS+4YtmA4mOaRC5pIKVCjRKUJReH2dl6r6DBvci4TtRgCDJZ3H1SoYJtsXR47
 r325C1aWarT7AYkJOatJZeljQZv0wYyw6AqOH3eqeOi74M1FNRgfdPZbIgbpfAIoYw6d
 SZfK0h6vysEF24G4vlpYRhtCptONPcurTsxgcEXLKqoVA6Dz999VG/sBmFQcEk9rjSs+
 VUBBr/VxPs7n++WflLWFVj/WZLPcLS4fTXzegROExKqQTijdxS8ipuSSpXDSSwL4PGSL
 PAGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWQ7VRiebzt8WLlIomPBZg8oeXhva+qA3OuOShuc20s/twRnTG/rRWbLyD7bF7hmPTBXykdJMvYSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNW6A9irsGpgkgWuJqyYj6z1z2sehwjvf17jr/JyEOHvOu+jlg
 L51RE6VF/BOuNLnGWj5zuFINbimBddkOQCB3x/vgurglpvnbkoHv
X-Google-Smtp-Source: AGHT+IF0GEyxFOWbUu+ExQlyAJXiGNDV52VSUO4649Opxz3OpCXsbg5OuD8s1mKSDmM48NIESs5/IA==
X-Received: by 2002:a17:90a:ac17:b0:2d3:b8eb:9c3c with SMTP id
 98e67ed59e1d1-2d646b9083cmr13244361a91.2.1724813241838; 
 Tue, 27 Aug 2024 19:47:21 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9ac97f5fsm9869216a12.11.2024.08.27.19.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 19:47:21 -0700 (PDT)
Message-ID: <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
Date: Wed, 28 Aug 2024 10:47:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-2-hpchen0nvt@gmail.com>
 <20240823182616.5a85e1ae@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20240823182616.5a85e1ae@xps-13>
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

Dear Miquèl,

Thank you for your reply.



On 2024/8/24 上午 12:26, Miquel Raynal wrote:
> Hi,
>
> hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:
>
>> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>> new file mode 100644
>> index 000000000000..152784e73263
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>> @@ -0,0 +1,93 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
>> +
>> +maintainers:
>> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
>> +
>> +allOf:
>> +  - $ref: nand-controller.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,ma35d1-nand
> Can we please use the -nand-controller suffix. A NAND is a the common
> name for a chip with storage inside. You are describing a host
> controller that can be connected to in order to talk to a NAND.


Okay, I will change it to nuvoton,ma35d1-nfi.

Because in our platform, it is the NAND Flash Interface.



> Thanks,
> Miquèl


Best regards,

Hui-Ping Chen



