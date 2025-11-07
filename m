Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9772AC3FB7D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E8010E02F;
	Fri,  7 Nov 2025 11:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OqCK3xYP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CE010E02F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:23:17 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-42b2a0c18caso15569f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 03:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762514596; x=1763119396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=VtAgMzQLUEkWjhbFNDOre6KPF58LB5AVVftjd0cwizQ=;
 b=OqCK3xYPb2NlmsgYl69cjBqWuQsAYQFINPgiHQ7uVGirZ/fH0i3MqE43EVV+buucwO
 2hlJfM95Cyc44XncqLlUiLMwIySOQvyNdiMVTdmn7L9J/mP9kjtaIPbl6RoamA10hQNE
 F6kECXoBgIGiLQHszBrpFQpbXPCtTFff8rYu8x0hOnMCxLXQZo0b2Df1uVB8GpbUFvbV
 3aQU5p9FoS8mTgZGzCOtMHFLlNRTkT7xsr+Iz8kGja6kORs+tCJ/+0BXbmIdJzMM2eR0
 A/39Nxd9TzVOiYBwBngqY6oj0BQ44JfTfLyOtILm8rOdiOxM6WJWlvOKMnQyPB04A9tw
 0BtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762514596; x=1763119396;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VtAgMzQLUEkWjhbFNDOre6KPF58LB5AVVftjd0cwizQ=;
 b=B37EuNN43TQohZaqr0/ex+f9ezCnhBI/sYbjABoSbiEQUf8Jt2/N9LTUteVtYEXusr
 ZcoZTFKCSQvkQEyA1LD1yuRMrKTEFU0oYEGzRQ38/iByAkp1GYOU2BhUZm1h4DkL68pN
 z4w2eOiRTkF5IINlDsptWqZAx5vARgOOQRALyiajaXVkLKwJmY8iq6Xlw8Dd88MwlSzb
 oq/o4WnsC9JX/TJ30JF7A/4GGhXylPmnMyZIKXQ6LfZuNgzYKgVPtJftlwB4XiCwE9U6
 VTPvKzJE2+nTc/pILudmZg+jgYhjGlgVB+u1o8/RRUq/kkIybiHwEcqLoKlXWnOSj+XX
 B3UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk5Mh5P2Ngo18xN0MhBdX/3agSXQ2yM6CQhXsTkgEOkzCaScWNDxRhX2r8NjwcUPkQtjMPDBuJTek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywx8BbcCMVJfcoBAuDoeM02jO6X7hbnnIea5nRK/D+r+nVsxCCP
 KbHQdRoqkTP/xHEnjlzlmxW0XAU4hgWKCbFZqlFvvATTSZKoLuaN8/EO1VzfLxlTZz8=
X-Gm-Gg: ASbGnctgoC0xHhfuJFLrsqlE+r8TgLikT/7xxOl1ghuogdWVjsDH603akI6E1SXSwSU
 LoXC3x+enqlcHN/SgmpHYj0/h3SqeF4WuhQmSQPoywXbT1321EOEb/nLSE5CrfF9B93i7JFRsGw
 cEW6RCC9D3mAxov/cBrJQR4k/Z9OpdF6u4w3LygsGz2r91vE0J6ZCl+HH3WUY0vNCVQv1Gv30//
 uBYd8Jy5oqoEGS1AVszjP4cmgrS1Bm1XHJEzD5ShReqFqvtGJzbsjihgBDA6dN9i0WYyn0HI7L4
 QVII45l4F7IREmtrHkrz0WmSM3tgCZhEjCydJeyotu2NYQf4zz8Prc/3rWE3WfARX/eqKO1apCY
 qQu7g3OcfKDZDEP2EvtArK0HrHw+MNYJtuFgc5ouNz8PHhMkyW6Z/Rkt9rSpp8MQfbtqFfCU1Br
 HQmrmvWR5rKsE4NZk6seSoHmKHij4hYcmD6DOXkL78n6Zt
X-Google-Smtp-Source: AGHT+IFC6PS8CD4thOKnMt/0x6DHF4pMfb9zQG3hVlwbO9wPH+DcI/MNv2cBuknKQz9EdnzfI0iTFw==
X-Received: by 2002:a05:6000:458f:b0:429:d66b:508f with SMTP id
 ffacd0b85a97d-42ae5ac408fmr1620035f8f.30.1762514596332; 
 Fri, 07 Nov 2025 03:23:16 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67921c3sm4745735f8f.40.2025.11.07.03.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 03:23:15 -0800 (PST)
Message-ID: <be1b6e34-40ab-4587-8dbe-84e08bf83dcb@linaro.org>
Date: Fri, 7 Nov 2025 12:23:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 01/12] dt-bindings: panel: Add Samsung SOFEF00 DDIC with
 panel
To: Krzysztof Kozlowski <krzk@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-1-dfcfa17eb176@ixit.cz>
 <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
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
In-Reply-To: <20251106-enlightened-centipede-of-tempering-3cfa50@kuoka>
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

On 11/6/25 09:48, Krzysztof Kozlowski wrote:
> On Tue, Nov 04, 2025 at 11:16:09PM +0100, David Heidelberg wrote:
>> Basic description for S6E3FC2X01 DDIC with attached panels
>>
>>   - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>>   - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
>>
>> This panel has three supplies, while panel-simple-dsi is limited to one.
>> There is no user of this compatible, nor the compatible make sense.
> 
> There are. git grep samsung,sofef00, gives me two users.

Hmm, on -next I only see a single one:

$ grep samsung,sofef00 arch/*/boot/dts/ -R
arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts:  compatible = "samsung,sofef00";

> 
>> Remove it from simple DSI panel definitions.

Can't you mark is deprecated at first ?

>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> ..
> 
>>   additionalProperties: false
>>   
>>   required:
>>     - compatible
>> +  - power-supply
>>     - reg
>>   
>>   examples:
>> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
>> new file mode 100644
>> index 0000000000000..527a10e3b798e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef00.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef00.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung SOFEF00 AMOLED DDIC
>> +
>> +description: The SOFEF00 is display driver IC with connected panel.
> 
> Description goes below maintainers, see example-schema.
> 
>> +
>> +maintainers:
>> +  - David Heidelberg <david@ixit.cz>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +            # Samsung 6.01 inch, 1080x2160 pixels, 18:9 ratio
>> +          - samsung,sofef00-ams601nt22
>> +            # Samsung 6.28 inch, 1080x2280 pixels, 19:9 ratio
>> +          - samsung,sofef00-ams628nw01
> 
> These were not in the old binding, so please explain in the commit msg
> reasons for adding new front compatibles.
> 
>> +      - const: samsung,sofef00
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reset-gpios: true
> 
> Drop, not needed. It can stay required, though.
> 
>> +
>> +  port: true
> 
> Drop
> 
>> +
>> +  vddio-supply:
>> +    description: VDD regulator
>> +
>> +  vci-supply:
>> +    description: VCI regulator
>> +
>> +  poc-supply:
>> +    description: POC regulator
> 
> 1st poc, then vci then vddio to keep it more-or-less sorted. Same in
> required list.
> 
>> +
>> +required:
>> +  - compatible
>> +  - reset-gpios
>> +  - vddio-supply
>> +  - vci-supply
>> +  - poc-supply
>> +
>> +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof
> 

