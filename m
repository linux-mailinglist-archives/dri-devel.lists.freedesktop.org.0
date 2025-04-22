Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A02A95ED4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922EA10E506;
	Tue, 22 Apr 2025 07:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KsyFe9Np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8710E506
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:04:28 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-39c0e0bc733so3803991f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745305466; x=1745910266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
 b=KsyFe9NpPJfFG4K3nNFzXuXw0m4x8ndLAbIBuTzz7HeSzxGZ85RixtGRkAll+W1yYq
 VTpzvpP9K3RJUMrvjvOrK61SWK+eqdd4bvIoKsCjqGceH3sCmV1VlE3IUPD5yKkzwk0m
 mvcUn1hTPRJoVYTMqw9R0rURES2of8mPNt5L4xnosL6LVQ4oc8YUUDW+wIo4B00kkX9/
 saHUtKxjCxIXK4/RIuk1eVDEeUZdZv3eGg9v5jv/EFK/6azp1zn2nqdCj+CdF1+OQZpO
 Buin7D2rtIv62W/4TXYXZCPKbYCE02pmGEnGEck9/frf8uU9+WIY1lKUCT8HjdvDrVSZ
 WIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745305466; x=1745910266;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wzM974Yzx+mV/73ACAfnDK08ZhM1GnJt3GkSr1YkrHU=;
 b=by1s+po36QJG7OgR+Y6b7p3OYeS29zZbhEe82HoZl/IvhCtl0YO+AVdynMYrVU5NkL
 g01lTU1qXdd5AHps+2F61690l7igLuEeYxOmbU2bkzDJFLJ8cufF+bwYNbwnJLZvZPvT
 tHhUl2D0zoy8z6izGmtQKKffY+NO9I2M6RHxh/WdmoPTpuap1tLzD+/evrk8m+7nnyRl
 Oi19LWpZDW2cHNhkPvaHuwzRcfaTh1hg+y+Em1hp0aMwA37pu0xLHNpz0HFBUY7zrpP1
 KRAFHAZnzFH1HWtRUbcLRgP/rMozj9dzw+/xi1z7aDMm3fFtjmez6ZseY9kLlxBzk8eR
 rMFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWerfv/ql4vgjLPVlmbbnRZpAfv51CiwKbG/sVlT/CPpqtrTq869QEcV5D+86g2dsaBZoNIvi2DmQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgzN6rD4ugot01J15En5M9MVlh+JL+7H1FTo1GR8ZyuBMSATxl
 eWacJ//oNcxcWy/81c9C7qR+5QEdueQr7aBq1cCbQSYXSPG8dDh60HRs/7rRQPM=
X-Gm-Gg: ASbGncvF1aZI/89BMCyN9EZHNaVbLJWWUB6u0CLq+K9/3MoDDDkJ1snpoPHQecuurle
 bNLALKNCbxzJx2XCVSD5SlVZWLdvD/AUmDis7+ILA0q862bAK5zy51USzd67dpm0OLCBg5pBoyn
 zuFeWtNbgq+wCoAXAqOPNjsEIB3mCo5Kit5zFoVQRp+qBasCz6TlcA+QER6CLrErYyr3AEmX8HR
 fRct7Rpzw9yNc2lrKEnU1szjgX19loxPcy6UMIeHIJKosngitn55zEDppx/y6G9XlSjVPhVCyQI
 tEIulRxXhP/5bgI1lS5Qtwn5RAMNwZ4EnxZsKAEmkJmbqb/JYRxPCJ0OqvAGqS6j7lxZbKIcwS/
 YjcwvCO01vpy2fZVp3YY6GDftCYtB
X-Google-Smtp-Source: AGHT+IFkoSeVngdhH4gWhO7gH9R1jUTNRyHvXAKvr6AmKds7Pokhh7kLUhAv02Z1AP3MT8O8IomR5w==
X-Received: by 2002:a05:6000:4a03:b0:390:e1e0:1300 with SMTP id
 ffacd0b85a97d-39efba8a4demr11868054f8f.33.1745305466576; 
 Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f?
 ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43d006sm14361970f8f.56.2025.04.22.00.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:04:26 -0700 (PDT)
Message-ID: <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org>
Date: Tue, 22 Apr 2025 09:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix resource cleanup in
 meson_drv_bind_master() on error
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
 <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
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
In-Reply-To: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
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

On 19/04/2025 23:32, Martin Blumenstingl wrote:
> Hi Martijn, Hi Neil,
> 
> On Thu, Apr 10, 2025 at 8:46 PM <linux@martijnvandeventer.nl> wrote:
>>
>> Hi Martin,
>>
>> Thank you for the patch.
>>
>> I encountered this issue some time ago as well and had a possible fix in my tree (see
>> below).
>> My apologies for not upstreaming it earlier.
> No worries, we're all busy with both, offline and online life ;-)
> 
>> While my fix is not as symmetric as yours—I like symmetry—it is somewhat simpler. It
>> did make the assumption that only  calling component_unbind_all() was at fault and the the rest of the
>> code was correct. Therefore, calling one of the following functions:
>> meson_encoder_dsi_remove()
>> meson_encoder_hdmi_remove()
>> meson_encoder_cvbs_remove()
>> in case their counterpart was not called, should not result in any issues.
>>
>> I just verified, and, as far as I understand, all of these functions do a check to confirm
>> whether the encoder was initialized before proceeding with cleanup.
> Yep, that seems to be the case right now.
> Neil, would you like Martijn's more simple approach with a Fixes tag
> and backport that?
> Then I'd send my patch as a small cleanup which doesn't have to be
> backported. Otherwise I'd spin a v2 with a fix for the issue that
> Martijn found (and including Anand's Reviewed/Tested-by)?

Please send a follow-up, I'll apply this one today.

Thanks,
Neil

> 
> [...]
>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c
>>> b/drivers/gpu/drm/meson/meson_drv.c
>>> index 81d2ee37e773..031686fd4104 100644
>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>> @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
>>> *dev, bool has_components)
>>>                        dev_err(drm->dev, "Couldn't bind all
>>> components\n");
>>>                        /* Do not try to unbind */
>>>                        has_components = false;
>>
>> Above two lines are no longer used, so can be removed.
> Well spotted, thank you!
> 
> 
> Best regards,
> Martin

