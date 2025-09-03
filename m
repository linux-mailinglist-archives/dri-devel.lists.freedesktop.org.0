Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B9B41730
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C9210E105;
	Wed,  3 Sep 2025 07:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gHju/sYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36D210E105
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 07:49:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45b7c56a987so21029585e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 00:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756885793; x=1757490593; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PioyJaDS8ksrS/yIYTZans1q2zfR8i6mk/EV1gul67A=;
 b=gHju/sYvmN5Pk+yHKgo7bIaOcZX6iNdfuz11R8+zaDxIK4MW+9gcgMHiEi8nJBBACN
 aM+Zpv0NSxtVl/3oriwwLc6X+wTQjAVjHBWdti6n9T8p+lDFPgmr3ZUtBuV1gDFFw0o6
 n5AD4hfxo0l+3z0z4ds4zobTWbW20FT8khBEm9HaX0iR7YCZibw35MyIY+oyoAxsdq8U
 z+6psBl5XuhgwOyZqyZou0Mj595awVQC97X2ibgkWU8hzL9PUcdY1m99m9DAxLqd9vpi
 mRJjlGsZLd1bSFRKRo+hQSdT0oYnrMBd2FROeayihOUlXzGT07a74inQI8QRv1hszMj3
 9x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756885793; x=1757490593;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PioyJaDS8ksrS/yIYTZans1q2zfR8i6mk/EV1gul67A=;
 b=JTtj6s52TbzSKB27F+Ss5zpufiYRolZ7izMtO+v2ukuoSPHdmVFd+wopyjRPPmsCIw
 430Dn0a/o66f9Zzmbqdk/6KgiGLyqics/FYZr3+1IAuo2V+h2JsAfSig8sjhBi8/QCFz
 8DySPiPa5+E8nBNtFlFE97wE3kV4s8symIKYDiy1gqElxrjTlX0TjU5wykZwFlMuFeNu
 kQgnfhTSu9bJmG6g9seneMXF5IIXQBmRsPztHr0AdOhhEy0hcN0j/FXuBcqZKhZRzOp1
 zTxgJyX+fmQ3GhR0L3tWMOZHEaLswJhH12KnrXYI24szOJa6JqOSRpJoIkNn8L7nPacJ
 hvbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMM/oteuCrP1Sz08u10/ybYNGSHvVW+zzE4B/O1unlEVH/rKFXOa7SGKt3bNUSpYI7mKnmTr4xns=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2cuqWnkAtzk44lWK265VNGGxnxlXnUPfr2gw4wfPLlA3V2Jzb
 KD3RrL5SxumO4zQsQsE0fTHg/I/uufMGyoBMdqoPero2VAIG7rhz5Com3N8niXIU6c4=
X-Gm-Gg: ASbGncvHEY5cGZy/xuoosAJILTv7xtz10haohvK2z2pXMya42R7lfu4q/fAiVIu717P
 /0fIH/EysZMQPBoqK+01zDuOXV1YGd2eKNn5AZzClYW78EmPCNl64gQpOWeuBMilPGzs/Qq/HuC
 kav1LESHJq3tdqVgrtP5uIvXoAir7ZlKoBz+RBnKdEb98S5xT6rRsesIAcnWM11caOZ01+XAhR+
 tJvDvdZykme+maSePtszW+OxnNsQInE9t/ZLzPEpSXAlZsWr+OkVNlARvd61SN/B8xiazGvig60
 M+THlfPp0BtkqGICU/t+aTeoZuvfp8h2+ZxuLl+IVE2vFLSoPXm59ZsqZtaEiOsuCog7junTiz4
 XWAO2r9XIsWWKgBtycSGlZJjIGE0M3lXP40jIcHwQaIPNgjWmIVAHjl2Sq9FHGHbuTmsgUZ6ueb
 rhLaC7JsoyB1ib8XC+8Q==
X-Google-Smtp-Source: AGHT+IGNcwf7dquah88p3kbUCZQzfg4W/YTjPdyhyrclopN+udAN3w1xt+8R2YdXZebjRcfFI3x01g==
X-Received: by 2002:a05:6000:2011:b0:3c9:3f46:70eb with SMTP id
 ffacd0b85a97d-3d1def69bc3mr8693458f8f.52.1756885793260; 
 Wed, 03 Sep 2025 00:49:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:431c:dad5:266c:f97?
 ([2a01:e0a:3d9:2080:431c:dad5:266c:f97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b93fae643sm75085675e9.3.2025.09.03.00.49.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 00:49:52 -0700 (PDT)
Message-ID: <418ba924-7e3d-474f-ab1e-084ca8ad313d@linaro.org>
Date: Wed, 3 Sep 2025 09:49:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document static lanes mapping
To: Krzysztof Kozlowski <krzk@kernel.org>
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
 <20250903-amaranth-rhino-of-wind-3b8850@kuoka>
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
In-Reply-To: <20250903-amaranth-rhino-of-wind-3b8850@kuoka>
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

On 03/09/2025 09:07, Krzysztof Kozlowski wrote:
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
> 
> What is the use case for static mapping? Embedded HDMI port on T14s
> laptop?
> 
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
>> +      The numbers corresponds to the PHY Type the lanes are connected to.
>> +      The possible combinations are
>> +        <0 0 0 0> when none are connected
>> +        <4 4 0 6> USB3 and DP single lane
>> +        <4 4 6 6> USB3 and DP
>> +        <6 6 4 4> DP and USB3
>> +        <6 0 4 4> DP and USB3 single lane
> 
>> +        <4 4 0 0> USB3 Only
>> +        <0 0 4 4> USB3 Only
> 
> Why do you need to handle here and in few other places mirrored case?
> Isn't enough to just say you only want USB3? Maybe my first question
> (what is usecase for this) answers this, though.

Usecase is larger than the HDMI on the T14s, we must handle boards directly
connected some USB-A and DP stuff directly on the combo lanes.

See https://lore.kernel.org/all/8A7C126C22789C9B+f30def47-302a-45ee-8f76-64ef277f773f@radxa.com/

> 
> This looks similar to rockchip,dp-lane-mux, from the objective point of
> view. Please look there and if it is really similar concept this would
> warrant having it as generic property in video-interfaces for example.

Yes it's quite the same

> 
> I also wonder if this should not be stored in the endpoint.

But I'm trying to store this in the endpoint as [1], the Bindings & DT part looks fine,
but the driver part looks horrible...

I'll probably post an RFC of that shortly

[1] https://lore.kernel.org/all/14f334fc-35de-4f21-8eb1-f6b41ac24704@linaro.org/

Neil

> 
> Best regards,
> Krzysztof
> 

