Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAB7845227
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 08:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B139810E57A;
	Thu,  1 Feb 2024 07:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA7A10E574
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 07:40:47 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a34c5ca2537so71183466b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 23:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706773185; x=1707377985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qgmsm9BRtTJBjXBbdJJ16Hw0zd4DqLTuh86MYmetfb8=;
 b=h9Zl5imG0zifYFW5IKRp8aLDgzSQvcfxWKdE3as0U2dhmpo87KR9DGyetebkaJUNtW
 8OX7tsy0tCzGMVh3gXdjh4JCYYgus8p4zTC/kI94o2hlKIPDAM8TRiEaYSlMMEVcnQUs
 clcjmARUXfmhr9jw1u5SrEtbjCyoGksKAxiXkcGRp02udXSpdQu+h9E+XZneTVUaoXqQ
 ZBlV9mC6pYQRM4AfL3Mg9sJ1ukmzdEMjUoe6kyLljxWq83LhtWncXK949zUiYBdVXF3J
 N91ndR4RXor0Ey9F5XlTRu9oiZ5gEYiy5C9ddrm1lRmHn2JQngf2Yfs1OwJUmN0QdvJJ
 AUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706773185; x=1707377985;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qgmsm9BRtTJBjXBbdJJ16Hw0zd4DqLTuh86MYmetfb8=;
 b=VAz7IZ2H9AoA0oxO1LJ/3P1dhDgiaoPRptFkHIueSm98xV3FASx7Ug6SyEDLdrfO6E
 9ASWbiGgfrJ5W1rrLlEE/4dOgUZq6SF5DEJvwgkOOddHfM3BiUP90WfGAFvc9RNcUGfn
 1TzAl3KnTuWBrwWc9Rw85ByvEXu6C4gKju7sBgY7eLZEBwiU/IdNja7L13IikxhKyUBZ
 Vj1c1tnoJhveDb+JqSB7D5gD8c6eiDuYwNw1Npvhny/xFVKjtE7phw8Smvo03joJzCOR
 HqP8h5X6Oi3S9nLJ19Ch10OZcRwUSxSfgCn3E+MnpeGVP4EG3NF5aBGipOo4Nx4yMo+C
 ETNA==
X-Gm-Message-State: AOJu0YyiPpyqL/uQVNdKFb7B28EascB+8WAa6ij5lEAF8e4G/xkJfpBn
 znfcmK7nab4gM2ZSE/ysud4TnNXvSpso3+bEjTivv90fNYOGE0YlfeVZ+JeMJyU=
X-Google-Smtp-Source: AGHT+IEyDWTXSgGf79ipDAT9IMCerYPN4dQ7xOhFzJF6dsCAwSM1keOCqXPsOqMNSeYDcK5Mm+W+CQ==
X-Received: by 2002:a17:906:f2c6:b0:a35:85b7:560a with SMTP id
 gz6-20020a170906f2c600b00a3585b7560amr2778687ejb.46.1706773184749; 
 Wed, 31 Jan 2024 23:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUFCmsep7OitSGMUdT2kz69EmaAiTLHsHHcbu81LuUyZV3OYZILMC6ECogMyOaEs8VylVXiCzu1QNGDw+8ctBqEqm3D9vea+qqs4erNejU9KARAjxsovZoBGEpIk8DlnFXKl0CA5t79iYMJvF+3rmKl55NVRIL21hKPD4BRz2A+h6KA5wEnOmfXP1Bu87EfKQ5biY56kjwZThcKgAmMFVuj9Lvwx4hI5G1yFzEt9Z9bhVpnjYyY1jyyrBx0G5Vsr5A2HwaBTGn/I9HOz+q0xbhdDVvktnplA1V2Mx0bGAh6WuXBN9NgJj/+YE5hOslCXKyswqdiADQG0zb1tA2FLdcQijas/yljioYth0fVLKbHJPZpv0n//ThSpxPGSiWfDxMc8nvi+KP/sOAxkQIBfvPJ1ZC3IxhQo9aiPkbHpHqxJivvjrnZuj+RtWL6bPeBd5Od2iYz5ok4SqRD6nXXiloZOdQ5G0jKaGDRdEBXpGJY6ovKVR46QiXIkCRncyDQBcmLxddYrE6DTnjbVj4rz+XMgX4UE71pV+Ldpy5KltTDIAnauhvPEUIteednwZgNnXYxmhs97DSbWP1L9QN2+oqJPpoAaZNiK4FFcYPHVNerZc8Xfx1vrDczUfqbHI8u+5qRL4EPq5W8/dFcyCt9gmS9MGqD6Yd4ja5R7zk6OQr3h7V2aJxCvypSeEGrP8s=
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170906170200b00a33604d2a41sm6916476eje.132.2024.01.31.23.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 23:39:44 -0800 (PST)
Message-ID: <32fd4622-1bc1-48f7-85f0-e04fcb6c0f88@linaro.org>
Date: Thu, 1 Feb 2024 08:39:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: bridge: add sam9x7-lvds
 compatible
Content-Language: en-US
To: Dharma.B@microchip.com, robh@kernel.org
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-2-dharma.b@microchip.com>
 <10a88fc6-2c4c-4f77-850f-f15b21a8ed49@kernel.org>
 <20240122-privacy-preschool-27dc7dcc5529@spud>
 <01c4fc05-9b3f-4007-9216-444a4306efd7@microchip.com>
 <20240130191255.GA2164257-robh@kernel.org>
 <f980706a-2bc7-46f2-8c3e-1cc62a1e2cb7@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f980706a-2bc7-46f2-8c3e-1cc62a1e2cb7@microchip.com>
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
Cc: Manikandan.M@microchip.com, neil.armstrong@linaro.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, rfoss@kernel.org, daniel@ffwll.ch,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, krzk@kernel.org,
 mripard@kernel.org, devicetree@vger.kernel.org, Linux4Microchip@microchip.com,
 conor@kernel.org, andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2024 05:10, Dharma.B@microchip.com wrote:
> On 31/01/24 12:42 am, Rob Herring wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Tue, Jan 23, 2024 at 03:39:13AM +0000, Dharma.B@microchip.com wrote:
>>> Hi Conor,
>>>
>>> On 22/01/24 10:07 pm, Conor Dooley wrote:
>>>> On Mon, Jan 22, 2024 at 04:51:16PM +0100, Krzysztof Kozlowski wrote:
>>>>> On 22/01/2024 09:29, Dharma Balasubiramani wrote:
>>>>>> Add the 'sam9x7-lvds' compatible binding, which describes the
>>>>>> Low Voltage Differential Signaling (LVDS) Controller found on Microchip's
>>>>>> sam9x7 series System-on-Chip (SoC) devices. This binding will be used to
>>>>>> define the properties and configuration for the LVDS Controller in DT.
>>>>>>
>>>>>> Signed-off-by: Dharma Balasubiramani<dharma.b@microchip.com>
>>>>>> ---
>>>>>>    .../display/bridge/microchip,sam9x7-lvds.yaml | 59 +++++++++++++++++++
>>>>>>    1 file changed, 59 insertions(+)
>>>>>>    create mode 100644 Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..8c2c5b858c85
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/microchip,sam9x7-lvds.yaml
>>>>>> @@ -0,0 +1,59 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id:http://devicetree.org/schemas/display/bridge/microchip,sam9x7-lvds.yaml#
>>>>>> +$schema:http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: Microchip SAM9X7 LVDS Controller
>>>>> What is the "X"?
>>>>>
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Dharma Balasubiramani<dharma.b@microchip.com>
>>>>>> +
>>>>>> +description: |
>>>>> Do not need '|' unless you need to preserve formatting.
>>>>>
>>>>>> +  The Low Voltage Differential Signaling Controller (LVDSC) manages data
>>>>>> +  format conversion from the LCD Controller internal DPI bus to OpenLDI
>>>>>> +  LVDS output signals. LVDSC functions include bit mapping, balanced mode
>>>>>> +  management, and serializer.
>>>>>> +
>>>>>> +properties:
>>>>>> +  compatible:
>>>>>> +    const: microchip,sam9x7-lvds
>>>>> What is "x"? Wildcard? Then no, don't use it and instead use proper SoC
>>>>> version number.
>>>> These SoCs actually do have an x in their name. However, and I do always
>>>> get confused here, the sam9x7 is a series of SoCs (the cover letter does
>>>> say this) rather than a specific device.
>>>> I think the series current consists of a sam9x70 sam9x72 and a sam9x75.
>>>> The devices are largely similar, but I am not sure if the sam9x70
>>>> supports LVDS at all. Having a compatible for the series does not seem
>>>> correct to me.
>>> Yes, you are correct. Only sam9x72 and sam9x75 have LVDS support, while
>>> sam9x70 does not. I will revise the compatibility to include both
>>> sam9x72 and sam9x75, as outlined below:
>>>
>>> properties:
>>>     compatible:
>>>       enum:
>>>         - microchip,sam9x72-lvds
>>>         - microchip,sam9x75-lvds
>>
>> I would presume these 2 are the same, but the above implies they
>> aren't. I think what you had is fine assuming these are all
>> fundamentally the same part with just packaging or fused off h/w
>> differences.
> 
> Yes, so is it okay to have compatible for a series? Shall I go ahead with
> "
>    compatible:
>      const: microchip,sam9x7-lvds

You said 9x70, which would match such 9x7 "series", is different, so I
still think series should not be used. I don't know much about Microchip
naming scheme, so this x is always confusing. However if these are the
same, maybe just use sam9x72?

Best regards,
Krzysztof

