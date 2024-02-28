Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3C86AEF3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 13:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572DE10E081;
	Wed, 28 Feb 2024 12:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dkGFMfHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154B510E664
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 12:18:32 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7da9bec3038so385723241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 04:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709122712; x=1709727512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YlskfN1DI9w+4vTieSyWqmbDOGNXlKANaEiK2f9kMpk=;
 b=dkGFMfHDjz5amkkvfNYJed8kPmNV4JwkzXouxNphgORQb2gK4VOdzL45dFI1Hju7Vz
 dIWrr1cjI7seIkSZvxxAAIiw1xzSFxKUQvf2HagI54QIb/L0+Ir3b4KL2fZzZYAKWCej
 R7SJUc16+YVVrGKCQevXcQI7qGV/B70h3vPWt5nKkztXPup4g6RCvKZ1kNye+CBd72m2
 KXb5ToNz1oNwxnUbm4g0E+JLK2NPl8fa+KMssw1WqBCWLqtEHICMAHGKdBjs6dPqbdEa
 DflwluxGKyVXk+x+DccHgpAlw3CHUtmrJCbk7aCL9GbAN6r5i2EN7sjwHE7h2F//16La
 HLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709122712; x=1709727512;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YlskfN1DI9w+4vTieSyWqmbDOGNXlKANaEiK2f9kMpk=;
 b=WR2jwsVtXriKPtFp4lCFim4+j/gPdOqmmSggOSMJ6eem0eNoEuWWFOnaX8KM7gGTe0
 Zi0oqzdoXNLTF7tJvbW1F9v6Dc90E8uLyohnbE2PKU8jbgcqsGNwIHlJOS3r3TA2KBXG
 5I/5lq7jE254VEY23xOYhI0ftzUISX+cfc0IGZ/sEnOzXkSUqLTe0is3/TgMz1srTLrY
 ZHKl3CYmk9r3PljEv3ByHeRgMNSGjTfujXRD9bi1Y/2pd5q2149LuuIYkhqsUGljRCGh
 vbVHhMT/I5nl3OCtIhVvdzI2tVXKoguEAoV8OXV44SOX8b/1xN3t2tAv3MaUqBYSYqUS
 B7wQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMOnJhudKloBKvIqPcHudo4vKbYg3jkBUc0Ws5eQJBUIAwdbWnxqboqZSOny2pjk622IOLG912xq1XEzCnbtui6olEJbE2xRDvqp9vn0Qi
X-Gm-Message-State: AOJu0YyRh0SKOmyUgQr8vXZuZfdU6xseywynTUZ6UMEyIwPgo/E/2ZfN
 kXv1Ufkg3ZtceWcNfsejtNE4nOE8D8jjRbmH2vkhrXyjPWJqBk6WCQU/4mnkLp4=
X-Google-Smtp-Source: AGHT+IHJt79JDuf/sUXkcWnw/9v/dZ9rf1/91lJ5/eLf8YXt6vWzEU1NBwuYSGWrHtL/YnMV9TR5XQ==
X-Received: by 2002:a05:6122:488d:b0:4d3:2d27:9f4 with SMTP id
 eg13-20020a056122488d00b004d32d2709f4mr1885452vkb.0.1709122711787; 
 Wed, 28 Feb 2024 04:18:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 e27-20020ac5c15b000000b004d346b59f1bsm1288vkk.29.2024.02.28.04.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 04:18:31 -0800 (PST)
Message-ID: <324f7b6e-c72c-40aa-afe6-779345c2eade@linaro.org>
Date: Wed, 28 Feb 2024 13:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
Content-Language: en-US
To: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>,
 Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org,
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <20240227142911.GB3863852-robh@kernel.org>
 <CAM5zL5pXu5sbzCHY_BrCJ7eZj-p9n0tCo6CmuTqUpvniTrqWJg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAM5zL5pXu5sbzCHY_BrCJ7eZj-p9n0tCo6CmuTqUpvniTrqWJg@mail.gmail.com>
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

On 28/02/2024 12:05, Paweł Anikiel wrote:
> On Tue, Feb 27, 2024 at 3:29 PM Rob Herring <robh@kernel.org> wrote:
>>
>> On Mon, Feb 26, 2024 at 11:59:42AM +0100, Paweł Anikiel wrote:
>>> On Mon, Feb 26, 2024 at 10:13 AM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 21/02/2024 17:02, Paweł Anikiel wrote:
>>>>> The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
>>>>> Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
>>>>> capture and Multi-Stream Transport. The user guide can be found here:
>>>>>
>>>>> https://www.intel.com/programmable/technical-pdfs/683273.pdf
>>>>>
>>>>> Signed-off-by: Paweł Anikiel <panikiel@google.com>
>>>>> ---
>>>>>  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++++++
>>>>>  1 file changed, 160 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Documentation/devicetree/bindings/media/intel,dprx.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..31025f2d5dcd
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
>>>>> @@ -0,0 +1,160 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Intel DisplayPort RX IP
>>>>> +
>>>>> +maintainers:
>>>>> +  - Paweł Anikiel <panikiel@google.com>
>>>>> +
>>>>> +description: |
>>>>> +  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
>>>>> +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
>>>>> +  capture and Multi-Stream Transport.
>>>>> +
>>>>> +  The IP features a large number of configuration parameters, found at:
>>>>> +  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-3-20-0-1/sink-parameters.html
>>>>> +
>>>>> +  The following parameters have to be enabled:
>>>>> +    - Support DisplayPort sink
>>>>> +    - Enable GPU control
>>>>> +  The following parameters' values have to be set in the devicetree:
>>>>> +    - RX maximum link rate
>>>>> +    - Maximum lane count
>>>>> +    - Support MST
>>>>> +    - Max stream count (only if Support MST is enabled)
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: intel,dprx-20.0.1
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  intel,max-link-rate:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description: Max link rate configuration parameter
>>>>
>>>> Please do not duplicate property name in description. It's useless.
>>>> Instead explain what is this responsible for.
>>>>
>>>> Why max-link-rate would differ for the same dprx-20.0.1? And why
>>>> standard properties cannot be used?
>>>>
>>>> Same for all questions below.
>>>
>>> These four properties are the IP configuration parameters mentioned in
>>> the device description. When generating the IP core you can set these
>>> parameters, which could make them differ for the same dprx-20.0.1.
>>> They are documented in the user guide, for which I also put a link in
>>> the description. Is that enough? Or should I also document these
>>> parameters here?
>>
>> Use the standard properties: link-frequencies and data-lanes. Those go
>> under the port(s) because they are inheritly per logical link.
> 
> The DP receiver has one input interface (a deserialized DP stream),
> and up to four output interfaces (the decoded video streams). The "max
> link rate" and "max lane count" parameters only describe the input
> interface to the receiver. However, the port(s) I am using here are
> for the output streams. They are not affected by those parameters, so
> I don't think these properties should go under the output port(s).
> 
> The receiver doesn't have an input port in the DT, because there isn't
> any controllable entity on the other side - the deserializer doesn't
> have any software interface. Since these standard properties
> (link-frequencies and data-lanes) are only defined in
> video-interfaces.yaml (which IIUC describes a graph endpoint), I can't
> use them directly in the device node.

DT describes the hardware, so where does the input come? From something,
right? Regardless if you have a driver or not. There is dp-connector
binding, if this is physical port.

> 
> Do you see a way to use these standard properties here?

Best regards,
Krzysztof

