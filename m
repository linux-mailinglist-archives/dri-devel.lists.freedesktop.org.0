Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36901B4A334
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCF510E121;
	Tue,  9 Sep 2025 07:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nOrYorHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ACDE10E121
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 07:14:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso13099995e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 00:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757402091; x=1758006891; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=u43LsNqSG6uTnlGTyebiOi+xWFLG+LJs5tbBGdtkIVo=;
 b=nOrYorHcr+ZyMo1ZMupqhj13pEb4eiwQkcYYhPp5CxtPLg9dbVFi72ygkcgyx7tZDK
 KJAZmGssNxE2u12lHHaeaG7iqtFUlOVSsBezOz+SkmzsHsORa2+s5NA+QIs/1QU6ODtL
 JXUgPm+ORJDKjDg/Ckz6Pk2bDDt3TWzTzV/znkUnMBkzlFqYhbS92SDnHjWSK13HFE69
 BFsxjP2BaEf/J2NR5+vwlUcOVNw/T98rO0RkZ7sOnI5U3AeJ6h93TTiNUf16QsnW/7vC
 mJ4jeWLGB5O8/kBIQh2JF2uk9MpjS9FCCh2euCNERHxaxMGLkTbqZHYb2tVvj5aNk3lA
 JeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757402091; x=1758006891;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u43LsNqSG6uTnlGTyebiOi+xWFLG+LJs5tbBGdtkIVo=;
 b=YE6VuUE1DbFAE49AWMsvTfmrYtvpoTpqrbARbMxNlQ2ibCt6r1z8z1rHPfRjaeTGiF
 aiG49CWBizvtfC62U4nVYvYEwsHetbSQ78P4C0xpLXU8ae/QBr0PvLPfKWdNO6uvItDO
 Ub+Vbg2oCVqvX+KCAhEzkN+eVRwbKs8ejxBIWwQyggEsn6nbFKN9OHpXbADL7S/lvtSy
 EI1lwGm47+bC52CGKfROzT0ZhU0xptLGSSRXrZ+5R12gpPMl+t0HWCffWCAok+2VnB9o
 HyFfZIBUQBN8NIsSbaHz/Joct7Zp2M0r2q3sEQq4zJNVi0OZgG0DemBp86d9/Wzbtd6x
 rNvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6uVTBVh3a51YaZekGieeUqjhr8KDQpWfVOdIUhP4Njilg5oWmQVQFV41BCvyja66/eyQ0MhZ/iv0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOBR1WOKhH30/MW/TdCcyS10W+qrnEqFCzVTAfp6rAzplvDjgP
 uanH05ekzq/R0IwHicjxV5j1vEXxX4L9MlDMo2k0JOlwu4o7z9I23ohqvMe5RyuV2tI=
X-Gm-Gg: ASbGncukO61WJIOWNBcexaAepWQCqOEGF+kl729sFQl+r6q7hTs5ZO62lUW3/jWLo3/
 w24bbXdJ3AM42L+Mn3jQnT+xuMTfUrGBoXzCdCREHbNG6juEqWh+UX5dBBbisLNpU90NRU6jQLT
 dXXRqKLn02w0fvpxCrRWhaJ2z7uJVGcq9DlqWac2FHCbk9p8TxUaUH4RwLk/YgMyN+8D7C8YvIO
 g4K5TxMF4rkqeqYq339WJOtx6tUVhJ9dreLLCmQk7Amv+IQ3y9BHJQTX31OdZiQyeN/YoB7msrK
 KfA+Wpz6cajHO793gS1aKsIGbJNHh8mkpiK0VULFMQLIIWLQjnXLoHVM7a318LkFdc/8TrUkLRw
 Aw8XjTPQeOZI2VDOTZvea5ZRctgUEOScErmpvAeUfzJ6lgv8HNltFnFyrYKiCuXxCDhkW/w78Au
 p946tovZA=
X-Google-Smtp-Source: AGHT+IEiUd+2pdrNRG2SkooH6CfbYUmcRiXoBKNVsWbVXETjB3YdpcCJB24m0SOcXf7I7DkX77PWmw==
X-Received: by 2002:a05:600c:6488:b0:45d:e0c5:7850 with SMTP id
 5b1f17b1804b1-45de0c57d85mr68897435e9.35.1757402090873; 
 Tue, 09 Sep 2025 00:14:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:25ab:4e12:265b:4b6?
 ([2a01:e0a:3d9:2080:25ab:4e12:265b:4b6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd5098292sm193009005e9.1.2025.09.09.00.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 00:14:50 -0700 (PDT)
Message-ID: <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
Date: Tue, 9 Sep 2025 09:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2025 23:14, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>
>> The routing of the lanes can be:
>> - 2 DP + 2 USB3
>> - 4 DP
>> - 2 USB3
>>
>> The layout of the lanes was designed to be mapped and swapped
>> related to the USB-C Power Delivery negociation, so it supports
>> a finite set of mappings inherited by the USB-C Altmode layouts.
>>
>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
>> an USB-C connector and no PD events.
>>
>> Document the data-lanes on numbered port@0 out endpoints,
>> allowing us to document the lanes mapping to DisplayPort
>> and/or USB3 connectors/peripherals.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
>>   1 file changed, 58 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -81,10 +81,67 @@ properties:
>>   
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>> +
>>       properties:
>>         port@0:
>> -        $ref: /schemas/graph.yaml#/properties/port
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>           description: Output endpoint of the PHY
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
>> +
>> +          endpoint@0:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            description: Display Port Output lanes of the PHY when used with static mapping
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                minItems: 2
> 
> Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?

So the PHY already supports 1-lane, but the QMP Combo only supports
mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
int both in & out endpoint and still should work fine.

Do you think this should be done now ?

Neil

> 
>> +                maxItems: 4
>> +                oneOf:
>> +                  - items: # DisplayPort 2 lanes, normal orientation
>> +                      - const: 0
>> +                      - const: 1
>> +                  - items: # DisplayPort 2 lanes, flipped orientation
>> +                      - const: 3
>> +                      - const: 2
>> +                  - items: # DisplayPort 4 lanes, normal orientation
>> +                      - const: 0
>> +                      - const: 1
>> +                      - const: 2
>> +                      - const: 3
>> +                  - items: # DisplayPort 4 lanes, flipped orientation
>> +                      - const: 3
>> +                      - const: 2
>> +                      - const: 1
>> +                      - const: 0
>> +            required:
>> +              - data-lanes
>> +
>> +          endpoint@1:
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            description: USB Output lanes of the PHY when used with static mapping
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              data-lanes:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                minItems: 2
>> +                oneOf:
>> +                  - items: # USB3, normal orientation
>> +                      - const: 1
>> +                      - const: 0
>> +                  - items: # USB3, flipped orientation
>> +                      - const: 2
>> +                      - const: 3
>> +
>> +            required:
>> +              - data-lanes
>>   
>>         port@1:
>>           $ref: /schemas/graph.yaml#/properties/port
>>
>> -- 
>> 2.34.1
>>
> 

