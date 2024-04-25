Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE08B1C51
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C9A10E172;
	Thu, 25 Apr 2024 07:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZHEaZaMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EE710E172
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:57:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41b51ee24f9so965935e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 00:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714031863; x=1714636663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8zlRN8GDdJRPh97Fl0bz7cJhpbCIiQnJ+fEE7Z9TrLA=;
 b=ZHEaZaMHlOue4I8NE4vSAa6dune0CfyRiTxEh7ner4Z4KSFGPyZHHPGb4/lkaO0x55
 +T3iqC3YNdu1DavGiU2YPl9QUxhscRozXnqxU+AXVpXJmL4dpHvaAXlPCXw0kaK+ZOEN
 /H2egRNTiM3WpM5xftIQ46smstbZSMCa3NabHAatX3mg6Qz+RDPaUp1eG8hvDtXTphmZ
 ifB5pwwtEI4kpEegKZn7okHfS1+6/lMym+/yU6ywW89KP5iLl+6QMFumC9huVKXUmoBg
 tvNXTVWcxwiZIMaRGD7GgG2N9mhNUrlZbz3Gag8S9161HWWhZnw6rP0nSk1m+2e3ZwBo
 dh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714031863; x=1714636663;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8zlRN8GDdJRPh97Fl0bz7cJhpbCIiQnJ+fEE7Z9TrLA=;
 b=P403CshKjVkqmb2OLbKI3yYphXh1HrtkkdvHX3gKN+AeB2mZonv1+r5h78GX9tBNz5
 C/FPVaBMs57ywPhJmNAKspwQoImKyC411h1As7Kbq41xHN4MXU+znteue6+YT1aJQ+iq
 +grZGKKd5Uf+mgDa0sq+Ed0KYCGtStZOSligOoAFy4Vit5QNl5oFlyIZaSDfeSZgEpsW
 8w3qgtVcETru1as3UL4ylviSBgHucF39iqnu7jTVLqS3NHQy3uVtcdM4Hj2gXJNe4BG5
 N0PC4nheqMecLoc8/MCaVfiH41QrAx7tjJIqLqMg8bi9cJaJPpeNhEt7tt+vzBY43d3l
 SBfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8P2Z7Jvmn7P3BvHea8qVoxjASHNRiS7BEZfZ3wHzYERNmjUtq6VuEWBIpiRnuED28c3sEIhweS7zjqe4LRd/Eax0iJ36Y/tm0V7oi3Www
X-Gm-Message-State: AOJu0YxTZVTqXVm5FA5q/6jKC3Muqnl9PSkSDOXvGD3NiwauGOnkfMXZ
 RMXzJIsAYEA+xScmDoRepC9VVdepSXnnUpZHPc63QjDBM5PjN3Nms06gPxn892k=
X-Google-Smtp-Source: AGHT+IEpMpy5TC3zOgYRtvmVoIm1qs4qkyA+/az+AVHs/P5SNCTPkiTTQpAEom45V2JdpFsBAoc5Dw==
X-Received: by 2002:a05:600c:4694:b0:419:f4d6:463b with SMTP id
 p20-20020a05600c469400b00419f4d6463bmr1330537wmo.14.1714031862971; 
 Thu, 25 Apr 2024 00:57:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62?
 ([2a01:e0a:982:cbb0:15c7:bd9c:c500:ed62])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a05600c3b1900b0041816c3049csm26579080wms.11.2024.04.25.00.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 00:57:42 -0700 (PDT)
Message-ID: <bed21ca2-54c0-473d-b84b-2b404899a050@linaro.org>
Date: Thu, 25 Apr 2024 09:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
To: Junhao Xie <bigfoot@classfun.cn>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, wuxilin123@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
 <af62742c-8d6d-4fa9-b2e4-f83253e6e388@linaro.org>
 <361fc6a0-f0d0-49b2-b885-3b197294ec9f@classfun.cn>
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
In-Reply-To: <361fc6a0-f0d0-49b2-b885-3b197294ec9f@classfun.cn>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2024 02:57, Junhao Xie wrote:
> On 2024/4/25 03:37, Konrad Dybcio wrote:
>> On 4/24/24 17:29, Xilin Wu via B4 Relay wrote:
>>> From: Junhao Xie <bigfoot@classfun.cn>
>>>
>>> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
>>>
>>> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
>>> ---
>> [...]
>>> +    return sn3112_write_reg(priv, SN3112_REG_PWM_EN + reg,
>>> +                priv->pwm_en_reg[reg]);
>>
>> This looks like a weird reimplementation of regmap_update_bits
>>
> 
> We cannot use regmap_update_bits because this chip does not support read command.
> It will discard all read command.

You could use regmap cache with all registers marked as cacheable, but not sure it's worth
doing this.

Neil

> 
>>> +}
>>> +
> [...]
>>
>> devm_pwmchip_add?
>>
>> Konrad
> 
> Thank you for your reply, I will fix them.
> 

