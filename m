Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5F6ADB6C2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BE710E3E9;
	Mon, 16 Jun 2025 16:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dvt6LI+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9AD10E3E9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 16:26:39 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a5096158dcso4098549f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750091197; x=1750695997; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=vmnHCgaI282hq5PTGqcYx/EtjiMY2Bi1AAenUCB2ygA=;
 b=Dvt6LI+EZHyYt7sUq7Ftzru/Y4CFUsf2sj9HRHNIqoNgWbzvqwTZCFMmN+XwTiHtxE
 dIVQoqD7YMJ3X/A7aQbPBMifMq1imoQSHKzKqIe/x1O4CDfEzv0lLTwWPaan436Cxaxd
 OaKQ1rqBJbGx1YDpjJjtiBtJOKRkd8MUHKuKX4aNBIEZ4wXnFpw7eQufFQv3tfCD6RAz
 Z+p2bpAiLyelbzsyYmdOvjNVCEASYuCxQ0Ith/lTb7DgI+KkjAVXqoEjOBbtALN+6pwe
 sgdH5YHja1iza/W+IZuJIQkkRQ1FV5lGJ70EfoSiaxcRjFLTzU3jgl7nkhk3HViqJEiG
 f7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750091197; x=1750695997;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vmnHCgaI282hq5PTGqcYx/EtjiMY2Bi1AAenUCB2ygA=;
 b=O2G6CQ5+ioXvWL7XCW4S8ztnwTQ/C1EWOdIuIpjtZa4rjLUA13LcXaOPUP/ABM66ta
 kSQHHQcIjMVoX40CIT24Y/kjVhL1o2kM3HQzWhLyR0R6Xj6KuLIP/KaVecJTDxHZsgP/
 Q3FhUOeK+TqHVpoWdIVLbLtShmP/afmN36kpNOmWJdxPwkUi9/enBhs0UnkZ14kzeUSs
 jM9nNAjriMF4GTkbl7CCRu3flIqdjILQC+KYFVPRndgSUHEgBlB0Z5jhJXWDXLfJWHS6
 OzdFY8cwSkk3NV5kQp0EwVH/3poU2lXtLG+vhiWx20qSVBW0zbdo5GwljgHVUo7mjp/Q
 NU5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUERjeZZ2Lmk1MECbyyn6hTn4vAzmZAa1xGU6x9gjaPe89PzrMwryqWLpSunK9lAsTk/q6Kt4KB8z0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKmIljAJCFxBNRAVG/y81k/RTd2QqnZm/LTWrqlRTQaUFkjcy9
 X/aq0gSOVowzccqJ6Wb9Tmc6zpbfj/UM7k2DEjqBEZbKvDCrQ9xa8+u3sGQGlvxu+eU=
X-Gm-Gg: ASbGncubCZDdWCrAddL9WBV9CTfbhVW5LYj2ue7/pHcTM6RIjVZhnkuB/aZJycjOrlR
 E7jebq8LinM1Li3MVUZ73QiN0BaE+goQI1DSSD38/KIpgmLrzYjHAHV0tB2oBs2vIEUqxdPgsNL
 h9QY+52URbm65Au5YK4yzrU/7wGyl+0uPGDwktVX2HFh+OxTAxttkRGirElTK2w3v5vBujQrdE2
 yy7yt6yCAKYHOO4bq1eIlLd1Ach+aMvGGe9SGuSbyxxirnHGTHmwaaywUeOvVrh1JauwRslcEq4
 KHn2JuGTavcycWZ21+VgE9rLTzIkYkAPwOHPnxuA/XEgE5E0WW+wPREUxB3MxWjoVihtM0EXB19
 tLXJUi5FOe0Pj+SKVe7SjdBW60czQW2S+rqt1gWvDktqX4cI=
X-Google-Smtp-Source: AGHT+IEBsVprmiQDzo7Lhhgb6lnLHo5f9u47o1+S2nphrseLHkPh/y+JSdd4Hu/+yocYYy7Vn5IDbw==
X-Received: by 2002:a5d:588a:0:b0:3a3:5f36:33ee with SMTP id
 ffacd0b85a97d-3a5723a3abamr7848727f8f.32.1750091197126; 
 Mon, 16 Jun 2025 09:26:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6c7:97de:65a8:488a?
 ([2a01:e0a:3d9:2080:6c7:97de:65a8:488a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b70d77sm11619355f8f.94.2025.06.16.09.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:26:36 -0700 (PDT)
Message-ID: <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
Date: Mon, 16 Jun 2025 18:26:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
 <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
 <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
 <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
 <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
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
In-Reply-To: <e6c51a8d-978e-44f0-bff1-efcd05617aa7@mailbox.org>
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

On 16/06/2025 18:05, Marek Vasut wrote:
> On 6/16/25 1:45 PM, Neil Armstrong wrote:
>> On 13/06/2025 12:54, Marek Vasut wrote:
>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>>> alignment gap between default_address_mode and lanes members.
>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>>> there is no chance this value can ever be larger than 4. No
>>>>> functional change.
>>>>
>>>> The u8 will still take at least 4 bytes and cpu will still
>>>> do at least a 32bit memory access, so there's no point to change
>>>> it to u8.
>>> Assuming this layout:
>>>
>>>    40 struct ili9881c_desc {
>>>    41         const struct ili9881c_instr *init;
>>>    42         const size_t init_length;
>>>    43         const struct drm_display_mode *mode;
>>>    44         const unsigned long mode_flags;
>>>    45         u8 default_address_mode;
>>>    46         u8 lanes;
>>>    47 };
>>>
>>> I wrote a quick test:
>>>
>>> $ cat test.c
>>> #include <stdio.h>
>>> #include <stdint.h>
>>>
>>> struct foo {
>>>      void *a;
>>>      size_t b;
>>>      void *c;
>>>      unsigned long d;
>>>
>>>      uint8_t x;
>>>      unsigned long y; // ~= lanes
>>> };
>>>
>>> struct bar {
>>>      void *a;
>>>      size_t b;
>>>      void *c;
>>>      unsigned long d;
>>>
>>>      uint8_t x;
>>>      uint8_t y; // ~= lanes
>>> };
>>>
>>> int main(void)
>>> {
>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>>      return 0;
>>> }
>>>
>>> With which I get these results on x86-64:
>>>
>>> $ gcc -o test test.c && ./test
>>> 48 40
>>>
>>> And on x86 32bit:
>>>
>>> $ i686-linux-gnu-gcc -o test test.c && ./test
>>> 24 20
>>>
>>> Maybe there is some improvement ?
>>
>> Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.
> Doesn't that mean, that one some systems it wins us a bit of memory utilization improvement, and on other systems it has no impact ?

4 or 8 bytes less in a dynamically allocated struct which is by default aligned
on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on riscv, sorry this is negligible.

Neil
