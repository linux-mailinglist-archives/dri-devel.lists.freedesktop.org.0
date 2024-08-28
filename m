Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8039621DF
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 09:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E90410E4C7;
	Wed, 28 Aug 2024 07:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RDyGf6wa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A513E10E4C7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:57:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2020b730049so50499035ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724831857; x=1725436657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GfqHwI8DhzI+oBVoPKsWjmnloLfBOCfpckFVyP5GIik=;
 b=RDyGf6waZEgnBlygjqd2wetHveY/7MojnGk7dq31WP8RNi2U+0kfzUCqUUsg4NN0kC
 03cklt0cf48hrjgq7jwoygkdD22rUrWDWhwT2IFEGfJAnO+802VJbJDbdar8n53QS38l
 39MK18ZYW9coNYSlTFuHDeC/9DRRSay6xnus1yDgj7d79UH/u9D9+8AzCboUoFHroJ5l
 i/CVDzS0uI8aTgPi4GcV7eRVF/fxUzGp4JnmtAzfPA/kbWAAIl5Cp0qVH/bdzcmRvc+n
 u3VuDSj1dKmsf1/4Jb9+p/xg/BVvMFtU5XIR9/k/hAD7wA1ZPtfm3XZRiw6CgdBIsiB/
 QC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724831857; x=1725436657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfqHwI8DhzI+oBVoPKsWjmnloLfBOCfpckFVyP5GIik=;
 b=ZZnO0aG+UUOQMdo8kP93YpyyrA5+ASc8ludFlnAND7ElNKJ7IRUNVYUROZ/RLHw0Jz
 s88O8LHSvcmLnKv3KrDbT6hy97442LLnqjojU0dWeVq3o+292X1grHEa26M6qln0Cw2h
 3APkADg5gRie11eVNc4ixYp9R1mscgo9bpA9dAr9plTmQEAoMPKwoQp58eF0yTHlqYX6
 aXdOQVrnP1IcHhtcgYLgKDv7Fdu3Z4RZXY4LDNUdeVkt0FnjUoSMTDWQXATi56g/sm/Q
 hobRnB+e/6i3a/bADIW6DLNkxfO+wjpS8WtwGs5wUqZl7tPmHV5HWasxL9EizxrJ3fIQ
 Is+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJB8uhFOL8thAHqQq8ndV11Z9LDexH5X/aHqbNIW1zlAqyUQdmZU8fgbwjFKr9v44QvIRznTfRq1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3wZUwKJVaZp0MH02ZKOhEX5olVnnxkES3612GeSveldQmy1Pr
 CGVMKDo5hkpInRVUhlQZpCLpdX/Ept8SzBPCp0KHv8GRBzsTHrNv
X-Google-Smtp-Source: AGHT+IFVTQ3LfaXYubmmh//jrLLb1bQzxGTiF8xttq0VDGjJnNc/pBZNhv6nCpqY0o/0dZ2GXjw0+w==
X-Received: by 2002:a17:90a:600c:b0:2c8:da73:af82 with SMTP id
 98e67ed59e1d1-2d646bb1094mr15667628a91.10.1724831856982; 
 Wed, 28 Aug 2024 00:57:36 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d844641416sm992321a91.44.2024.08.28.00.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 00:57:36 -0700 (PDT)
Message-ID: <1d2d2637-b897-4fb5-ab4e-c419c154a744@gmail.com>
Date: Wed, 28 Aug 2024 15:57:32 +0800
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
 <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
 <20240828094846.166c7de6@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20240828094846.166c7de6@xps-13>
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

Dear Miquel,

Thank you for your reply.



On 2024/8/28 下午 03:48, Miquel Raynal wrote:
> Hi Hui-Ping,
>
> hpchen0nvt@gmail.com wrote on Wed, 28 Aug 2024 10:47:17 +0800:
>
>> Dear Miquèl,
>>
>> Thank you for your reply.
>>
>>
>>
>> On 2024/8/24 上午 12:26, Miquel Raynal wrote:
>>> Hi,
>>>
>>> hpchen0nvt@gmail.com wrote on Wed, 21 Aug 2024 07:11:31 +0000:
>>>   
>>>> Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.
>>>>
>>>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>    .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
>>>>    1 file changed, 93 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>>> new file mode 100644
>>>> index 000000000000..152784e73263
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
>>>> @@ -0,0 +1,93 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
>>>> +
>>>> +maintainers:
>>>> +  - Hui-Ping Chen <hpchen0nvt@gmail.com>
>>>> +
>>>> +allOf:
>>>> +  - $ref: nand-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - nuvoton,ma35d1-nand
>>> Can we please use the -nand-controller suffix. A NAND is a the common
>>> name for a chip with storage inside. You are describing a host
>>> controller that can be connected to in order to talk to a NAND.
>>
>> Okay, I will change it to nuvoton,ma35d1-nfi.
>>
>> Because in our platform, it is the NAND Flash Interface.
> nfi is not an acronym that is understandable by everyone. Please use
> -nand-controller. Don't be worried by the size of the string.
>
> You can use the acronym as prefix for your NAND controller functions
> though.

Okay, I will change it to nuvoton,ma35d1-nand-controller.



> Thanks,
> Miquèl


Best regards,

Hui-Ping Chen


