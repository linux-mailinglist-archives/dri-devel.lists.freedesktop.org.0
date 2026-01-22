Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCo0GA4ocmmadwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:37:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0867611
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 14:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F9210E9A5;
	Thu, 22 Jan 2026 13:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yxVaBzFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0571B10E9A5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 13:37:14 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4801d24d91bso10433865e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 05:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769089033; x=1769693833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eEJn28UsVkdJy0uU3rgrwA+Zjuc5hG2Gw87IADiyNbQ=;
 b=yxVaBzFtq26NaTBYjgVBG0AkZIfDkcMMoiBK9/qcoNaE3efhT7GlJCN0sxJ1vwXOuC
 WGgXTPP8eUN/SPC/k/w7PjAV+JXfg1bue200EounVcH0LXrvVH7W2DRcdPbpCKWkWI25
 Yg3v7Ymxbe8jiYgTIev3h3jcxmviNyRUikrAF/CWPj7jLov8vEC8Oep/rk+pRd3ZGg6q
 R9CrAdReX/2RjYwlHqvXv1/8bmL3tcH37sDv7acsa8+bqJ+X9e9G5K+Cw1jOk92ROREX
 rcaEFMxvctKRksA/MxMQ35vS7sJfWPFO5RV4uXvF4E/LLaY01s7ngruXSOXHshTZ6hlq
 LYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769089033; x=1769693833;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEJn28UsVkdJy0uU3rgrwA+Zjuc5hG2Gw87IADiyNbQ=;
 b=TggIJJgwDo/wJyXPJOezm9PbAkRicpxTK4uGOudlEUSWY7mmlfV5uj9ebkGANoPM+S
 FqE5ib7mu8IZg0V4Sg4ht8KiMQOMY3ndki3xlOmZ3fSiuIgJArWlztQXrpTjJ+qIQeMO
 KoHPjzWwcmB7yeuavZdRJVD3JpBQhtca0y7LaPDuBQbeROiNAPScAxtFAqzIOktf4usa
 3F4K8to0/NbRLdPRNILofSZaSVHTTToE5/wcdb393FPuTy/QxACM83XXL1OP7wqQn4GS
 QaoT8LBYCKdX4VcrFaOWyGAWPzy3EQIUcD/lqgBcivH9jpp1L2Pipk2zehvGaqrpyzDg
 umbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnAAcncTbWksIeOj0G2Bj06ZODcAzEvcnTtgOPBHip31fIdvs4eHVf71A/47mIA7A23sL6S9ORLe8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb9kPEXvTcMgR6J3BATqsHfBETiOF1TIh40j+tmBF/iTCpz7qS
 tDR3rhm4rR8VM+F9PUCeMAlQSpGoRh7FJcy5YmeymCftXYzXaxdp2vzoJI1rD3OvTTo=
X-Gm-Gg: AZuq6aKp9cwtht5Bupcj//ASKjnnOST/iwS32ZDokoLmnGBl/kxn/NeR7mzhFhhJ9Gw
 aqQmX+lelIwjkMPLdLLY3AwwvF34u7kq4qduuBwYo7jjOCN6WfmPhxk2wXjO08n+WnLSGGJVzwj
 xOWVttnmJQJgI6KF0n2QPffZD/9233ZSWPtHOeE+nTZQamuqAOHY4B1dgOSSSazAgIScpPOBXHX
 jvFFdVIhbN4gfhNFihSDnmpaBM6MZjPTxnc1GXUVeAvQ4amtkLsS1q9F4l7rF78oySsVLAbzX1V
 +9Z1XmxZR4QfaM8krxEN4pvB+P7nEKWhgIgalb7lvmRKA5ySFzHs+iSm6unsyuIFoob0CmDcGlg
 oZgcyBMzE9arwwNdtkVkqY2PiIrcm6o8nueOthPXbKX+LXyW5ieVxpyFFX4/Hd/ev/Tpa+etToY
 PY70/AXuEnMAhdwo06F8kvGsGK99RqI7TylUXe5nmiRjI5Qpa1jmRyeS08lP89dnQ=
X-Received: by 2002:a05:600c:8b75:b0:477:9574:d641 with SMTP id
 5b1f17b1804b1-4803e7e8531mr130800565e9.22.1769089033318; 
 Thu, 22 Jan 2026 05:37:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258?
 ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804702876asm75878365e9.1.2026.01.22.05.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 05:37:12 -0800 (PST)
Message-ID: <f80a1ecc-d33c-4872-9b9a-466b56877580@linaro.org>
Date: Thu, 22 Jan 2026 14:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kancy Joe <kancy2333@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
 <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
 <SEZPR04MB6873411EA1A8B69AD45B286CA397A@SEZPR04MB6873.apcprd04.prod.outlook.com>
 <687b781c-dee6-4b8e-89b2-e082a860be3a@oss.qualcomm.com>
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
In-Reply-To: <687b781c-dee6-4b8e-89b2-e082a860be3a@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:kancy2333@outlook.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,outlook.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: D1F0867611
X-Rspamd-Action: no action

On 1/22/26 13:34, Konrad Dybcio wrote:
> On 1/22/26 10:34 AM, Kancy Joe wrote:
>>
>> On 1/22/2026 5:25 PM, Neil Armstrong wrote:
>>> On 1/22/26 10:15, Konrad Dybcio wrote:
>>>> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>>>>> From: KancyJoe <kancy2333@outlook.com>
>>>>>
>>>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>>>
>>>>> The design is similar to a phone wihout the modem, the game control
>>>>> is handled via a standalone controller connected to a PCIe USB
>>>>> controller.
>>>>>
>>>>> Display support will be added in a second time.
>>>>>
>>>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
> 
> [...]
> 
>>>>> +        pinctrl-names = "default",
>>>>> +                "sleep";
>>>>> +
>>>>> +        pwms = <&pm8550_pwm 3 50000>;
>>>>> +
>>>>> +        #cooling-cells = <2>;
>>>>> +        cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
>>>>
>>>> Does this come from a preexisting map?
>>>
>>> Kancy ?
>>
>> No it is not a preexisting map. I add it(and the thermal part) myself to get dynamic fan speed control work. Perhaps you can also use userspace fan control daemon instead of hardcode it here. In android the vendor control the fan speed in userspace too.
>>
>> Following block is what the stock fw defined. I changed the granularity to make fan speed (or noise actually) sounds more "smooth".
>>
>> ```
>>
>> cooling-levels = <0 64 128 255>;
>>
>> ```
> 
> FWIW the corresponding pwm-backlight driver has this
> num-interpolated-steps property which computes a smooth map.. not sure how
> many cooling levels are resonable for a PWM fan, but then I would intuitively
> not object to having more as opposed to less..

Good suggestion !

Neil

> 
> Konrad

