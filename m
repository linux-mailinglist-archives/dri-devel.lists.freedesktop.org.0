Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7509B5958D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 13:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B4610E78A;
	Tue, 16 Sep 2025 11:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uI4SgLci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10CF10E78A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 11:54:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3e8ef75b146so2053274f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 04:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758023642; x=1758628442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=g4MB33NR3PbcK8D+73Qqhkpr/ylBdmSUXuAuK1QMeuA=;
 b=uI4SgLcia6F0kon2168LCIxJRaurV2H7DtE+iq+e/Z73WGif+4Fo/Spc+OjZNE3+GR
 dFmrKogZGqTbP+H7g8OzAm/VN7Ce1NSwKhunABYzQBLpY0S2/vGIO/VkaAKn/6VGJRwy
 16GLym6I6L7ESGJiaZ7D4TeykMIk7EQmfsHo99INzsrqbRvwfQ4mBxLqTS036ZzTAWTq
 ybdgoiegGFKJVPWaVK49+vwMvUF9B8VPG8LbAYQbjLhEL38SpY8hx0m9DlFZHwfxz42S
 uFNbnlLKLMeXQy2TvtOS0iJWAkjtFoqlhTRk9aLjCuN6KJQ0+pUfrQFuIzdkEVtPrV4L
 rvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758023642; x=1758628442;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g4MB33NR3PbcK8D+73Qqhkpr/ylBdmSUXuAuK1QMeuA=;
 b=VNai2CsHzdjzjsIj/TvEqDZSPtO0YkrpXPzqCPo+YPJXe8jQtBzOZ8uq98flkW+hv+
 eHub6J4bMNiqF809by33oBWH34ZDU4uHJj+kDkz2vfej3wBkvWTjqVtV9s2TfBXuohpf
 b/czDeeIf2WwKgCBx/m/j0/5KWpft72RMqucfGF45tlVu4QkqElae9QvqwkigUE16QHm
 1nx92YMyFsKGkmMzlk1iOQf/igh904TJfGywZUWldEzaG5d1ufYQv45FQUTwHQdklO4i
 LIViDxskwZJfVdbKjOV/0KmwcnR0gqMMlbg5WjR5HqJoHf0x8d/nxUOP+aw+sJKqLhu2
 iFNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMbXDTt0JuIS2fyYvXrfOYslyFTEm4MDQB0YL94+cFwE6yQiW2JdAjL+eX/kfEBrFogtVo5RxBOM4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfO9f/cdFYz6t5SUxP7GmGXk0O0Xf7gAX296o3GMl9de+OJwvW
 R2/vgUFmGdgaFvpwR5Hii/T51s/2QGe3mUj1Zi4C95X7UpKR3eBgoYSksJqRyuYGcBQ=
X-Gm-Gg: ASbGncv+j1Wj2VLcDQ1j0PEmyZQ2VGfa+X9b/2/V5/k85lB1zANBSg7xvHfDcgOEf9k
 ub4mIvXtrZLbP8SHV2Ygfrv45bezVEv68Rbn2naN3y118ch7qGtfkLHDepk+8rtkWT1p4RBY2Yq
 6p/uG0R1Ci7Bxcp3IdJtIziEeYVkQy1TZRyQNpV4JIbb485TDhmVmBHA1thfJzfKPOSkIwxROjt
 /lx52yJPv00WZKx/Q9MPRNwnw009DNUFwHUzrYvGeqRWIHL8YP55C7TNcnLlGBaeFaGxu2tqvIb
 UY7RVIoshTuEyNHY2w+rzhwatjjy5bB/G2PYOV3+4F9VvDEHBYy8Fr5BLf26hl+AUKLABTm7W/b
 tZ52kuG66iuekdJvHuKPe5IOVVALH4sxgOtoNyfZpChDr8qlQVjQxVKjdtYmoEZFcAhZjb8YXYJ
 qVIqTz7upRQA==
X-Google-Smtp-Source: AGHT+IGMOx5ictt0icl9kCJ36rSKAXcHFTFJOF7dvqZ6AWQW6ws8M37Ea/BmRKcUrJgElQta8CF/NA==
X-Received: by 2002:a05:6000:1888:b0:3eb:4681:ac9e with SMTP id
 ffacd0b85a97d-3eb4681b05bmr7775394f8f.5.1758023641810; 
 Tue, 16 Sep 2025 04:54:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bcbd:bbe2:a1be:30ec?
 ([2a01:e0a:3d9:2080:bcbd:bbe2:a1be:30ec])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e0372bbd3sm215676865e9.10.2025.09.16.04.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 04:54:01 -0700 (PDT)
Message-ID: <bbd0e55d-aa5f-4ace-8c5b-074fbf1c46f7@linaro.org>
Date: Tue, 16 Sep 2025 13:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
 <a0d85f06-a87b-40f6-a74a-27b148f309fd@linaro.org>
 <5b152739-6b1d-4742-8163-bb6e6b39822a@mailbox.org>
 <004e4b73-b695-4e37-b484-4fbc340701ea@linaro.org>
 <0cdd321a-4eb0-42aa-ab7f-71fffb96ac73@mailbox.org>
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
In-Reply-To: <0cdd321a-4eb0-42aa-ab7f-71fffb96ac73@mailbox.org>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/09/2025 13:48, Marek Vasut wrote:
> On 9/16/25 11:52 AM, Neil Armstrong wrote:
>> On 16/09/2025 10:15, Marek Vasut wrote:
>>> On 9/5/25 9:51 AM, Neil Armstrong wrote:
>>>> On 04/09/2025 22:01, Marek Vasut wrote:
>>>>> The ILI9881C is a DSI panel, which can be tied to a DSI controller
>>>>> using OF graph port/endpoint. Allow the port subnode in the binding.
>>>>>
>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>>>> ---
>>>>> Cc: Conor Dooley <conor+dt@kernel.org>
>>>>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>>> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: devicetree@vger.kernel.org
>>>>> Cc: dri-devel@lists.freedesktop.org
>>>>> Cc: linux-renesas-soc@vger.kernel.org
>>>>> ---
>>>>>   .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>>>>>   1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/ panel/ilitek,ili9881c.yaml
>>>>> index 434cc6af9c954..cf0aa996e072d 100644
>>>>> --- a/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/panel/ ilitek,ili9881c.yaml
>>>>> @@ -30,6 +30,7 @@ properties:
>>>>>       maxItems: 1
>>>>>     backlight: true
>>>>> +  port: true
>>>>>     power-supply: true
>>>>>     reset-gpios: true
>>>>>     rotation: true
>>>>
>>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>
>>> Would it be OK to pick this one up via drm-misc (and possibly also the other ili9881c RPi 5" Display 2 patches), or shall I wait a bit longer ?
>>
>> yes it's ok to pick via drm-misc, bit it's too late for v6.18.
> That's fine. Will you pick it up or shall I do that ?

I'll do this later this week, if you have the opportunity before, please pick it.

Neil
