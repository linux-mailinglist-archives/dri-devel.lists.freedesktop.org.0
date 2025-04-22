Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E247A95F34
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DDDB10E189;
	Tue, 22 Apr 2025 07:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QtqCcUle";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81AC10E189
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:23:36 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso3489251f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745306615; x=1745911415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
 b=QtqCcUlefigD+MlI1jVs5sb6YsRknV27hf7uwxM5E7ITmpj9A91c7WwW5gAA5Px+6H
 5pHjM2la2goGJlhb0HDEIB9Av7sw5YsqNYkuksT1Itk+eLznJSJ2A35P6pfiOXdja6ku
 /xGMYY2tSAtYa48FtrOdKjUYq1Wc74mx/n3tfR8uU0oAMw+q+TgooI5ALU6rhvTrwYAG
 uq3ZFEk31ffHQGo5eGQ4k8D/KGd9TqOcOxjcNaEnlzAjBdqXEWu1K2MeWHB6HDxeE38V
 XJqftCQV3cK+T6ijqrAWLu6GsF6qD2n7Bmpn34lUSA9P5QfCYbEbwMXa7cIlvJCvv3+f
 sGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745306615; x=1745911415;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lH46hfoNIJY5qCmuJzlF3d7GkHG348kgpWLaJA6DDWM=;
 b=EG74a5kVYcyvFFXABG+uY1BaFm6jpBbfILh4BPjmeQpKgUrA7jhCuD9n9A6j6y0+7M
 xUy/6iDzdRP2nHhGtcbj9KEDWKQWcXj0jm99iKJURQh/X2sHDwqJBKQr3PZh8th8a5Vf
 gt2eOO4Yc/rqibz7UBODzEAK8VlSFPcvJmlN0npZmEimNhziVbV5aNO9ht7gpgPPO4e/
 8PfQq80RfrLAhtIW+XlMFn8NYTtwDg9Mj5l+H8ItFJfERiSzpmbMQGotPRaencPTlYj8
 QO0UVY1qD/8omK4Getl2VGOVNQmSuQsuv3IPENcC3tE8iJvJySyT5LGPJg/DDOURmO8W
 64Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfbLjSXJHFJjZA4G+SEH7tLSNM9ArfYZtXSqEK77bVsR2C2EMbJshqZ6kpZolLPDCQYlkdmpqEoeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybmESll5CFO5AKNCJe/CH34giZVRXURS/tZPGtlpm80/HCVVrk
 0DGkm9zO41FDcU3SoW6MNHhUKq02lO8jIRbud+QYeVLulmAL6t7noRhBLGCk+fQ=
X-Gm-Gg: ASbGncvhgr/AcFefLaEyf0X1fnkIN7RIXmSSJGScXYn1LgKJxysTV1EAXgnZ4hIlLaE
 lR+cAJ/Vx3M+jR67lc8dcvjlVeeQff1FuM8ZWhiiGJORWn0CoIASbVe2ET0CBYWNHIky3vK0jhB
 f/kQpF0MSP1oJlEDvJp8a/GYKS4TTMZqeqoUtrNaPPWzZ52j3PX0Zk1qY2KOMQigW4rgqW9EhIP
 3OecE6FcbmhvrMpar2RnZ8Fj6L0fZk6/URwqvxJ+YEYSPdD3MHUcVyXANKkwF4LxvZfTBlTJs8S
 p0/TXbSnUnn6IG3mGqfswvbXtceEaeZBNBiJP2BTCSk+cwvyYS6tUU/81t0OdnFre/yHHTlLH+K
 wMh5Ez4fiyY4z4QuELA==
X-Google-Smtp-Source: AGHT+IGywozzMisXwYOT/E5KYtUsJDT/HnunTc8XE7Knara8DcfAQ+yJD6UJRsAe6X3X6bs1me8xhw==
X-Received: by 2002:a5d:5f4c:0:b0:39e:f89b:85d3 with SMTP id
 ffacd0b85a97d-39efb9538afmr11846283f8f.0.1745306615026; 
 Tue, 22 Apr 2025 00:23:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f?
 ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43bf20sm13981589f8f.48.2025.04.22.00.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:23:34 -0700 (PDT)
Message-ID: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
Date: Tue, 22 Apr 2025 09:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
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
In-Reply-To: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
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

On 22/04/2025 09:04, neil.armstrong@linaro.org wrote:
> On 19/04/2025 23:32, Martin Blumenstingl wrote:
>> Hi Martijn, Hi Neil,
>>
>> On Thu, Apr 10, 2025 at 8:46 PM <linux@martijnvandeventer.nl> wrote:
>>>
>>> Hi Martin,
>>>
>>> Thank you for the patch.
>>>
>>> I encountered this issue some time ago as well and had a possible fix in my tree (see
>>> below).
>>> My apologies for not upstreaming it earlier.
>> No worries, we're all busy with both, offline and online life ;-)
>>
>>> While my fix is not as symmetric as yours—I like symmetry—it is somewhat simpler. It
>>> did make the assumption that only  calling component_unbind_all() was at fault and the the rest of the
>>> code was correct. Therefore, calling one of the following functions:
>>> meson_encoder_dsi_remove()
>>> meson_encoder_hdmi_remove()
>>> meson_encoder_cvbs_remove()
>>> in case their counterpart was not called, should not result in any issues.
>>>
>>> I just verified, and, as far as I understand, all of these functions do a check to confirm
>>> whether the encoder was initialized before proceeding with cleanup.
>> Yep, that seems to be the case right now.
>> Neil, would you like Martijn's more simple approach with a Fixes tag
>> and backport that?
>> Then I'd send my patch as a small cleanup which doesn't have to be
>> backported. Otherwise I'd spin a v2 with a fix for the issue that
>> Martijn found (and including Anand's Reviewed/Tested-by)?
> 
> Please send a follow-up, I'll apply this one today.
> 

Yeah finally please split this in two:
- patch 1 that can be backported
- patch 2 remaining changes

Thanks,
Neil

> Thanks,
> Neil
> 
>>
>> [...]
>>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c
>>>> b/drivers/gpu/drm/meson/meson_drv.c
>>>> index 81d2ee37e773..031686fd4104 100644
>>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>>> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
>>>> *dev, bool has_components)
>>>>                        dev_err(drm->dev, "Couldn't bind all
>>>> components\n");
>>>>                        /* Do not try to unbind */
>>>>                        has_components = false;
>>>
>>> Above two lines are no longer used, so can be removed.
>> Well spotted, thank you!
>>
>>
>> Best regards,
>> Martin
> 

