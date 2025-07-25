Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F87B118CB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 09:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A810E146;
	Fri, 25 Jul 2025 07:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n09jb/tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713A10E146
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 07:01:43 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6070a8f99ffso64278a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 00:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753426902; x=1754031702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=JpVKOJXR9kyoeqmQ1g7Wbt9QrQha91mnE2oeLb46rXU=;
 b=n09jb/trB+sKE2YK5funQV2dMXkb5BX5ZvrMBkvJoceyfRaPvm6RMg8YRhziNlNWPh
 8VXb+M8Kwc2lRf/LTecPGAb6+MZA/ZRTdzBokgkbO9QXgcXHEo2VVd3AGk6hWckOK78v
 M6LRv48OhAgWp78XIiCDofaua3IZyNVP63xsHxti+zmxyo2UJ0XprVsRu3i/b7i99QJD
 AfhvZXLCz2qUlKsmJ11XZxqMcBJRuEXOysfLQwCGqjj2m3OxbMMMjPFZqgrnkxmZ16u6
 lANNtyhXBqJF3ETdNb/pX8gMLnKY+aCrVlFxzxSikTMltbWLcp/GcR9iX4aqOlXeuEIc
 I/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753426902; x=1754031702;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JpVKOJXR9kyoeqmQ1g7Wbt9QrQha91mnE2oeLb46rXU=;
 b=kfu8zE6IaIu2OVuPgEXeDTi79F8Cuspnwqxj3vvxUbDKIR4uIlMbNcjyQb2y4gqH58
 1N3IXv8lCEka4tUuglX0zMpMcR1/MXxXg5oHw2tb8pfiqD7Pf6oB2SwtWUDCcn9MFGDz
 NcPppQlhOttidGOYdtQuohcY4abZM6qDU3lncCaia/Ru5ZtQYqKso4a0XK/VaJ6ZjlFn
 0EWgbmszGVULvuXMvwElIOfREwaYDNniGf44ercZxhE2/d5Fp32MpgSg/bGMj9w3cHXC
 A4NoLtEKU+KqhFDEs5YCPwEU6SyD46QdlTEfmlO0t2lxrZtrAt1nzr2Q1+lKjJFcgLYg
 R7rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV9hgfSHHDrKFJlieVOUjEHVN7zLFM8p5ateAuL7IkdN2UMpYRkcJOAZzPsRIMTou/5GeNc3i94J4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSIlleP9vGHN+eZskHRSJ1TNMYDe9Zf2FoaAB3DbWGBsk66JkG
 KFHVCYrewGB7gAl9uZYW6WISiSomLdTuhplFLxVfVAMfk+U3YDNM0Yqal0RFiBNqEBo=
X-Gm-Gg: ASbGncs+eNlUgZ9ZvLTOhJd+CHiEcZM8NGL38rZmQCjwzIKbi5tefkac+Okmfwzn1PQ
 /CYFVwP4xh6o3NCCqaVBvTrXM3chN8hjaODfnZsYyJmA1DpAHGKTDXUKy9DKwWuNUj7Cd8omiJf
 v2fjL3svxI+HoHl5IuNMjXjlbvezRPJ5LHypYLad04d6smdoTjQvE88a44ofkiem5k8BALDH88b
 xkSG5FEC5plUvABUtRCPrPLJnFAob/AvFAdK2q1V/ZLiZP8abQgAaxB5yvG9amegacRWwiHGBcq
 4S37w5EXcPUUb5LeY0y0aqOPqZq3x14ng19jubGFOKh+7DFU+5HI725OJopvpdbJ4VfqZNJJSHM
 N5q5i4We89BW4lqfIYIGmwezqslgEqhztBUu6H3YoTQ==
X-Google-Smtp-Source: AGHT+IEnsvu+DtOBwQf2lbjIF393/Fbawzau8Up0k9C8FBeYnqVp9YHxSzUw1/E9eKPPhGd+l0fOfQ==
X-Received: by 2002:a17:907:2d2b:b0:ade:328a:95d1 with SMTP id
 a640c23a62f3a-af61cf97e45mr38902866b.10.1753426901599; 
 Fri, 25 Jul 2025 00:01:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.203.90])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f44dfa7sm225087066b.82.2025.07.25.00.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jul 2025 00:01:40 -0700 (PDT)
Message-ID: <8a5ade3f-a263-4ab6-add9-1640db29005e@linaro.org>
Date: Fri, 25 Jul 2025 09:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] dt-bindings: gpu: img,powervr-rogue: Add TH1520
 GPU compatible
To: Michal Wilczynski <m.wilczynski@samsung.com>,
 Matt Coster <Matt.Coster@imgtec.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114436eucas1p1ab8455b32937a472f5f656086e38f428@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-5-6583ce0f6c25@samsung.com>
 <9c82a6bc-c6ff-4656-8f60-9d5fa499b61a@imgtec.com>
 <d154d2d0-3d59-4176-a8fb-3cb754cf2734@samsung.com>
 <e1a3d854-93bc-4771-9b8e-1639ca57b687@kernel.org>
 <d12fd4fb-0adb-40c4-8a0a-c685cd6327b3@samsung.com>
 <27068fd3-92b5-402b-9f3c-fd786db56668@kernel.org>
 <f25c1e7f-bef2-47b1-8fa8-14c9c51087a8@imgtec.com>
 <491b69ce-5a2f-4df1-95af-9318bbe6c9b0@samsung.com>
 <9c4f962d-6877-4a53-b0f3-218930f94e1e@imgtec.com>
 <07410f0c-8369-4683-9143-c79c6cb3f5b0@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <07410f0c-8369-4683-9143-c79c6cb3f5b0@samsung.com>
Content-Type: text/plain; charset=UTF-8
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

On 23/07/2025 20:25, Michal Wilczynski wrote:
> 
> 
> On 7/23/25 18:50, Matt Coster wrote:
>> On 23/07/2025 17:26, Michal Wilczynski wrote:
>>> On 7/23/25 11:45, Matt Coster wrote:
>>>> On 25/06/2025 15:41, Krzysztof Kozlowski wrote:
>>>>> On 25/06/2025 16:18, Michal Wilczynski wrote:
>>>>>>
>>>>>>
>>>>>> On 6/25/25 15:55, Krzysztof Kozlowski wrote:
>>>>>>> On 25/06/2025 14:45, Michal Wilczynski wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 6/24/25 15:53, Matt Coster wrote:
>>>>>>>>> On 23/06/2025 12:42, Michal Wilczynski wrote:
>>>>>>>>>> Update the img,powervr-rogue.yaml to include the T-HEAD TH1520 SoC's
>>>>>>>>>> specific GPU compatible string.
>>>>>>>>>>
>>>>>>>>>> The thead,th1520-gpu compatible, along with its full chain
>>>>>>>>>> img,img-bxm-4-64, and img,img-rogue, is added to the
>>>>>>>>>> list of recognized GPU types.
>>>>>>>>>>
>>>>>>>>>> The power-domains property requirement for img,img-bxm-4-64 is also
>>>>>>>>>> ensured by adding it to the relevant allOf condition.
>>>>>>>>>>
>>>>>>>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>>> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>>>>>>>>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>>>>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>>>>>>>>>> ---
>>>>>>>>>>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
>>>>>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>>>> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..9b241a0c1f5941dc58a1e23970f6d3773d427c22 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>>>>>>>>>> @@ -21,6 +21,11 @@ properties:
>>>>>>>>>>            # work with newer dts.
>>>>>>>>>>            - const: img,img-axe
>>>>>>>>>>            - const: img,img-rogue
>>>>>>>>>> +      - items:
>>>>>>>>>> +          - enum:
>>>>>>>>>> +              - thead,th1520-gpu
>>>>>>>>>> +          - const: img,img-bxm-4-64
>>>>>>>>>> +          - const: img,img-rogue
>>>>>>>>>>        - items:
>>>>>>>>>>            - enum:
>>>>>>>>>>                - ti,j721s2-gpu
>>>>>>>>>> @@ -93,7 +98,9 @@ allOf:
>>>>>>>>>>        properties:
>>>>>>>>>>          compatible:
>>>>>>>>>>            contains:
>>>>>>>>>> -            const: img,img-axe-1-16m
>>>>>>>>>> +            enum:
>>>>>>>>>> +              - img,img-axe-1-16m
>>>>>>>>>> +              - img,img-bxm-4-64
>>>>>>>>>
>>>>>>>>> This isn't right – BXM-4-64 has two power domains like BXS-4-64. I don't
>>>>>>>>> really know what the right way to handle that in devicetree is given the
>>>>>>>>> TH1520 appears to expose only a top-level domain for the entire GPU, but
>>>>>>>>> there are definitely two separate domains underneath that as far as the
>>>>>>>>> GPU is concerned (see the attached snippet from integration guide).
>>>>>>>>>
>>>>>>>>> Since power nodes are ref-counted anyway, do we just use the same node
>>>>>>>>> for both domains and let the driver up/down-count it twice?
>>>>>>>>
>>>>>>>> Hi Matt,
>>>>>>>>
>>>>>>>> Thanks for the very helpful insight. That's a great point, it seems the
>>>>>>>> SoC's design presents a tricky case for the bindings.
>>>>>>>>
>>>>>>>> I see what you mean about potentially using the same power domain node
>>>>>>>> twice. My only hesitation is that it might be a bit unclear for someone
>>>>>>>> reading the devicetree later. Perhaps another option could be to relax
>>>>>>>> the constraint for this compatible?
>>>>>>>>
>>>>>>>> Krzysztof, we'd be grateful for your thoughts on how to best model this
>>>>>>>> situation.
>>>>>>>
>>>>>>>
>>>>>>> It's your hardware, you should tell us, not me. I don't know how many
>>>>>>> power domains you have there, but for sure it is not one AND two domains
>>>>>>> the same time. It is either one or two, because power domains are not
>>>>>>> the same as regulator supplies.
>>>>>>
>>>>>> Hi Krzysztof, Matt,
>>>>>>
>>>>>> The img,bxm-4-64 GPU IP itself is designed with two separate power
>>>>>> domains. The TH1520 SoC, which integrates this GPU, wires both of these
>>>>>> to a single OS controllable power gate (controlled via mailbox and E902
>>>>>> co-processor).
>>>>>
>>>>> This helps... and also sounds a lot like regulator supplies, not power
>>>>> domains. :/
>>>>
>>>> Apologies for taking so long to get back to you with this, I wanted to
>>>> make sure I had the whole picture from our side before commenting again.
>>>>
>>>> From the GPU side, a "typical" integration of BXM-4-64 would use two
>>>> power domains.
>>>>
>>>> Typically, these domains exist in silicon, regardless of whether they
>>>> are exposed to the host OS, because the SoC's power controller must have
>>>> control over them. As part of normal operation, the GPU firmware (always
>>>> in domain "a" on Rogue) will request the power-up/down of the other
>>>> domains, including during the initial boot sequence. This all happens
>>>> transparently to the OS. The GPU block itself has no power gating at
>>>> that level, it relies entirely on the SoC integration.
>>>>
>>>> However, it turns out (unknown to me until very recently) that this
>>>> functionality is optional. The integrator can opt to forego the
>>>> power-saving functionality afforded by firmware-controlled power gating
>>>> and just throw everything into a single domain, which appears to be
>>>> what's happened here.
>>>>
>>>> My only remaining issue here, then, is the naming. Since this
>>>> integration doesn't use discrete domains, saying it has one domain
>>>> called "a" isn't correct*. We should either:
>>>>
>>>>  - Drop the name altogether for this integration (and others like it
>>>>    that don't use the low-power functionality, if there are any), or
>>>
>>> Hi Matt,
>>>
>>> Thanks for the detailed explanation, that clears things up perfectly.
>>
>> I'm glad I could get to the bottom of this one, it was bothering me too!
>>
>>>
>>> I agree with your assessment. Dropping the power-domain-names property
>>> for this integration seems like the cleanest solution. As you pointed
>>> out, since the OS sees only a single, undifferentiated power domain,
>>> giving it a name like "gpu" would be redundant. This approach correctly
>>> models the hardware without setting a potentially confusing precedent.
>>
>> That seems reasonable. I was very much on the fence for this one, so
>> I'll happily go along with dropping the name altogether.
>>
>> Just to make sure I understand correctly, the change here would be to
>> move "required: - power-domain-names" from "img,img-rogue" to every
>> conditional block that constrains the number of domains?
>>
>> Can we add negative constraints in conditionals? Then we could add
>> "power-domain-names: false" to the "thead,th1520-gpu" conditional block
>> alongside "power-domains: maxItems: 1".
> 
> Yeah the diff with v7 would look like so:
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 263c40c8438e..338746f39cbb 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -89,6 +89,11 @@ allOf:
>          compatible:
>            contains:
>              const: img,img-rogue
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: thead,th1520-gpu

No, don't do that. Anyway, if you are going to rewrite patch, you MUST
drop all tags, document it and explicitly ask for re-review.

Best regards,
Krzysztof
