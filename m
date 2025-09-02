Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18074B3FA87
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 11:35:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DCE10E619;
	Tue,  2 Sep 2025 09:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IslgZVce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D6010E619
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 09:35:28 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3d965477dc0so624476f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 02:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756805727; x=1757410527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=JfQ9yXz0+oSRPtU9PmUdrvjUA+5XmtY1AgQS1sTuvpE=;
 b=IslgZVceKaXmiNZXncihQwfOmtAPCDKT06EokH8OCvigRC6tc9Hs8M6DQA8T2VUljM
 Sf8TCL9D3LkghtQG2i9NpXU8SfnDAVF+UPtHhM5d1p3eBOqxvStE7g4MX4q6e9ZG8TPq
 we0rETvYRYjgAP46Z2neoFhPlVQIEVqTOQoSYJ2JatiezDtrVwJR0NUX7UQx24wPJgL2
 rngV7MUQ+8QQwA8CCUiazH76V8+4E88/P20dbcLP/71ZwzKjpp9qRPrW+eqbha0pwEWl
 KW3f2uGUMcgv6pYyWEkjNpwvNLElbFXN5TsiDP3w/t01HZWLbGk4Tv+fBwF9h8hjpP7j
 qm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756805727; x=1757410527;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JfQ9yXz0+oSRPtU9PmUdrvjUA+5XmtY1AgQS1sTuvpE=;
 b=VwYuP6q496niGd0MpKHxQ8gkLR7rWHg/kqIySMbGF2rH9vrXE1+cdr4/1dKnqFrAMj
 Po4CUnltjC/W6+CsYeOo5oD0Q9HkfPPDFklYWAkv2XbiCFt8PpBNxgylZ6oXCBiRfAeT
 s75s+ntB/B4Sub75fKpUFUSH0xoH/KI9/JAlIlnC+G7fVHhWetx8MwDUE9BhwaJm4lkN
 qLT6oCSqmPtJEnuHGl6AWu8lWgb0HcoDVqsDiKBBkA2ciRBYM3Yiff41ubMZddg+Nejv
 B0OQdN31zUaRAa7BlOce6dm+VcIG1PSH/LY7LtpTEP8HsQmIXNv4fxkG68TlQUDTr1Ul
 CKNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVec9/LmGFH23/gf7OCQ7ZhgClCgOocoJuTCm2MbcgVc0oPxlesZbSldIDLdWoKnnCxGO6t40fDR54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz69nzhpd7kTjC0V4o5XxUyUF6kfcJ3xImivxvECUn6Xh91ESxK
 oIjs4P8j3Zl7pZDJmFLleu3ydlTJp+AFFAyuDI1JO6Z6xCtD4yjR1og3k1D4gy/jP4Q=
X-Gm-Gg: ASbGncuwWcVol6m671U2JIQYDVGdrhEmrK0N87y2IQcmRvjBRkzCguBCnDqsTLaK+ZY
 P9GInjjeZo58gO8fdxSu0bmEFPD67OdTwJdHbfDAnkTGtPgKpzdHYR4OFxpM3EIAp2QQ1DEGirB
 3aZlGBwGjC7v3KTpcJUqih/CXIm4p+OlUrRSyEcLpA9UwrohUsGfQf5jRwyv1gC8FjGj3+OqYLp
 K8pTrdySmzwbFjrcuErLkqOCDtlFz11hI+cWOBmObHGFotzCoHi0Y7uT1H+z5FpU1sBp5vB7VqH
 jPlx/Y1w+YBSZRAzfh5v0AtpBXnpAxBwdseutYu/qnirMQtolrN94bXQRAstVAL7erfSKI+W9Vw
 5s+L7Hrk16vBw11oxMNzpnFKgYjtQI8Y5MQGjylTxwbNM1IUsVADiGO4OytfRAUNe9YgJnC77kL
 cvgG3NQsJ7Lg==
X-Google-Smtp-Source: AGHT+IFTaH/mMRhkJYGEXCVK35QbOq5nqwWE1gZMu+qzPMLt0vlGA93bzoqRpHlWQSzMmnjZtV5qew==
X-Received: by 2002:a05:6000:310d:b0:3d5:be0:153 with SMTP id
 ffacd0b85a97d-3d50be0029amr6688498f8f.7.1756805726636; 
 Tue, 02 Sep 2025 02:35:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939?
 ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d520eada16sm10183491f8f.41.2025.09.02.02.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 02:35:26 -0700 (PDT)
Message-ID: <bf772209-2420-4794-a52a-1d5932146307@linaro.org>
Date: Tue, 2 Sep 2025 11:35:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
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
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-3-f4ccf0ef79ab@linaro.org>
 <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
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
In-Reply-To: <slgu2d4iv6ef76f43gvwaelcl5ymymsvhokyunalq7z3l2ht3j@t7pko4rtqvgm>
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

On 02/09/2025 11:30, Dmitry Baryshkov wrote:
> On Tue, Sep 02, 2025 at 11:00:30AM +0200, Neil Armstrong wrote:
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
>> Nevertheless those QMP Comby PHY can be statically used to
>> drive a DisplayPort connector, DP->HDMI bridge, USB3 A Connector,
>> etc... without an USB-C connector and no PD events.
>>
>> Add a property that documents the static lanes mapping to
>> each underlying PHY to allow supporting boards directly
>> connecting USB3 and DisplayPort lanes to the QMP Combo
>> lanes.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 29 ++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index c8bc512df08b5694c8599f475de78679a4438449..12511a462bc6245e0b82726d053d8605148c5047 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -76,6 +76,35 @@ properties:
>>     mode-switch: true
>>     orientation-switch: true
>>   
>> +  qcom,static-lanes-mapping:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    items:
>> +      enum:
>> +        - 0 # Unconnected (PHY_NONE)
>> +        - 4 # USB3 (PHY_TYPE_USB3)
>> +        - 6 # DisplayPort (PHY_TYPE_DP)
>> +    description:
>> +      Describes the static mapping of the Combo PHY lanes, when not used
>> +      a in a Type-C dynamic setup using USB-C PD Events to change the mapping.
>> +      The 4 lanes can either routed to the underlying DP PHY or the USB3 PHY.
>> +      Only 2 of the lanes can be connected to the USB3 PHY, but the 4 lanes can
>> +      be connected to the DP PHY.
> 
> It feels like this significantly duplicates existing data-lanes
> definitions. Can we use that property to express the same semantics?

Well yes it has the same semantics, but not really the same meaning. data-lanes is designed
to describes the lanes layout/ordering, not the type/mapping.

Here, we do not describe the ordering, i.e which source lane is connected to which endpoint splot,
but which lane is supposed to connect to which internal PHY.

Anyway, I'm open to suggestions.

Neil

> 
> 
>> +      The numbers corresponds to the PHY Type the lanes are connected to.
>> +      The possible combinations are
>> +        <0 0 0 0> when none are connected
>> +        <4 4 0 6> USB3 and DP single lane
>> +        <4 4 6 6> USB3 and DP
>> +        <6 6 4 4> DP and USB3
>> +        <6 0 4 4> DP and USB3 single lane
>> +        <4 4 0 0> USB3 Only
>> +        <0 0 4 4> USB3 Only
>> +        <6 0 0 0> DP single lane
>> +        <0 0 0 6> DP single lane
>> +        <6 6 0 0> DP 2 lanes
>> +        <0 0 6 6> DP 2 lanes
>> +        <6 6 6 6> DP 4 lanes
>> +
>>     ports:
>>       $ref: /schemas/graph.yaml#/properties/ports
>>       properties:
>>
>> -- 
>> 2.34.1
>>
> 

