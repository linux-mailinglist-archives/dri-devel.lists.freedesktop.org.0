Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA95A98C12
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D4210E6B3;
	Wed, 23 Apr 2025 13:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FnZKqyVG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746BB10E6B1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:57:33 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-acbb48bad09so490997366b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745416652; x=1746021452; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WGyt2WO/nhpVYsYgbyvZLTSR7m3c3nMPYmbMH96yEAo=;
 b=FnZKqyVG408AMDc8GVQ2ZOEdXeNTstWAYav/X66kfkpd79Pya0uHrZV5+BtroTvXxA
 DvzyW6+TdWfHeYuMnYxakHqR5fAUOIfeEyrErpgcVX/1KudpfCgdzd1N1su3WTlCy2Qw
 pOIOql8LMbNkK0KveuXTEOLk3EOy9UnrCMTfl5IpRSAftgzxsznh75P7iFiCv3PYIczV
 bry6bTQq29lsoxLuvRBBvt68dfxaiJgHdCDRkclZ/YMMT8/nRPgod8ZGgIvjsXYbQ/fX
 BDCJElj8Sv+lMlAylJKt0btpW00pQjjHWALtzu1TAv9O3nt8YmFxm5mvZQayKSGzgcY8
 oGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745416652; x=1746021452;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=WGyt2WO/nhpVYsYgbyvZLTSR7m3c3nMPYmbMH96yEAo=;
 b=VWxLg0oDtthlW9UcLniXN27SxI38wqRoQGhW/lNzNb11XUFcxUZhCbA/k7DgIUK0kP
 O4MYaN/3JN8V6f0VOkj9le2a8H6r9u82pj9rCTh5U3v7dA72WxPtzCQreTTvPtQ1hO5h
 ADtlsSfpxXOjqL6HoEsl5MfoKudVq/zpel95x1L5J34FtpWcs62WgyImtG2uiD2MbxJo
 K8S7qODitTremTnoeM8B+4Auhb1Vmt/Xww51I2r0AjCpeolMS4s1zik0+C40U1KAeRV4
 PJRsRKJwGFzVmp2dRBRnqsUt1yl4zlGHfM9czNv+vWXcTmL3iYjwLhu2gWbXhYDH9KUr
 kZgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4STbeBL6HQ6gy5Da+CYRbqNA8au/N5uOhjcPFot/qMw/aWvI3ccqIYNRaBvURaBqUx1DwbCxdC2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyODPgCtACz2gn3MeOUHz6KAdfxkza56pJA0Y0FrQ8LxMSVJL8r
 oNrrfzIT4mpR3W7+LsDsGPHgJybGole6U7eounsuUcgO2dWCtTDVaAZTYbB+C9i5oAnC5hBE1kk
 W
X-Gm-Gg: ASbGncsMUQenWD3cfCZDy39g60v2bkpGdzZQsZktHX44D4tSKHddqIzrwA7foJw9kA3
 0I9C6ZYzpACyNXj+ttAFLbminvDZ9/4nB9j94HrFE/WIYS6KLfff8JidaWusz9QHMAh9QeuQPso
 VT5YDFRB6gOXbcbdsg58POZIkxXCR26BDWdK391AR9JILj5pEVBGua0NEs6WCtaklI31qp0QFTd
 eVYO59a9n2N4q1FjXEPUKnwozcWS07/38i+F1RM2OJRqSmGsgr5kprZAeUSmBuZuFrQR+Ig9Eqj
 MeUnPT+I0GJkeTizIyR1JyngqYoTMVvOHJvixjqtT/TC1/F609RoxCvlGvXyPNFNoV2V6CTje5f
 VsULBBVNHRir++wV/Ew==
X-Google-Smtp-Source: AGHT+IF9wZ55LanTIIbI52wCH2cF8QheJlF74eWrveehR1AOJn21YY4EpLHMzNbE+nVYCGi6lRL//g==
X-Received: by 2002:a5d:5f8a:0:b0:39e:cc10:3945 with SMTP id
 ffacd0b85a97d-39efba2da58mr13968361f8f.2.1745416230480; 
 Wed, 23 Apr 2025 06:50:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd?
 ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43d006sm19124430f8f.56.2025.04.23.06.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:50:30 -0700 (PDT)
Message-ID: <b8d21e46-c50a-4212-ae7a-d292c2ec6ce4@linaro.org>
Date: Wed, 23 Apr 2025 15:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: himax-hx8279: Initialize goa_{even, odd}_valid
 in hx8279_check_goa_config()
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org>
 <a6e47775-33c3-44c2-b6d5-58164e4a0a50@linaro.org>
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
In-Reply-To: <a6e47775-33c3-44c2-b6d5-58164e4a0a50@linaro.org>
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

On 23/04/2025 15:45, Neil Armstrong wrote:
> On 22/04/2025 23:20, Nathan Chancellor wrote:
>> Clang warns (or errors with CONFIG_WERROR=y):
>>
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>>      842 |         if (goa_odd_valid != goa_even_valid)
>>          |                              ^~~~~~~~~~~~~~
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>      839 |                 goa_even_valid = false;
>>    drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>>      818 |         bool goa_odd_valid, goa_even_valid;
>>          |                                           ^
>>          |                                            = 0
>>
>> Even though only the even valid variable gets flagged, both valid
>> variables appear to have the same issue of possibly being used
>> uninitialized if the if statement initializing them to false is not
>> taken.
>>
>> Initialize both values to true to clear up the warning and remove any
>> possibility of encountering undefined behavior.
>>
>> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
>> index b48b350b62da..92f351e66c25 100644
>> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
>> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
>> @@ -815,7 +815,7 @@ static int hx8279_check_gmux_config(struct hx8279 *hx, struct device *dev)
>>   static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>>   {
>>       const struct hx8279_panel_desc *desc = hx->desc;
>> -    bool goa_odd_valid, goa_even_valid;
>> +    bool goa_odd_valid = true, goa_even_valid = true;
>>       int i, num_zero, num_clr = 0;
>>       /* Up to 4 zero values is a valid configuration. Check them all. */
>>
>> ---
>> base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
>> change-id: 20250422-panel-himax-hx8279-fix-sometimes-uninitialized-207354fb930c
>>
>> Best regards,
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

I'll wait a few days until AngeloGioacchino Del Regno reviews it to be sure
it's the right fix.

Thanks,
Neil
