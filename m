Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11167AEE2A9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E70410E490;
	Mon, 30 Jun 2025 15:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MfLoObHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E149410E490
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:34:30 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so24613805e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297669; x=1751902469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/NbWFirpIKBP3IzXTFfaq+ycycNGcBK0e0jJK5acRo4=;
 b=MfLoObHnNxR98uhUDtWSoIfYMj0xi7XkOc4q+WFo/kpLJcuO/Y97gF0IpMXD0Icf7/
 3De96RCiKbGsAeJJ/C6S5XsjD2OKizjkHl72hRrDzsiXscL4lmwV6AWZmJPK2z4l5bYZ
 PWzqZ9xe1j4i5xnVNFnHI0dX6KaEIk5o5onSt4QXoXpoaEK1/8GTEpcOipM46X+OR6Lm
 jMFfMKTjAgUj4uoQ4mXwkUxXm149w2hkbvS14yE+pBjrlIMFXn8p/6coikqfIjglf3jb
 WArz+habSla7GxIXmFI+oP79B7ZlOzEnhvgVYXMlctPDQehsOUE9MJrtxjgBo8Dppxn6
 +PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297669; x=1751902469;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/NbWFirpIKBP3IzXTFfaq+ycycNGcBK0e0jJK5acRo4=;
 b=hZE9WEw0fkf4rL6K6/JKPNGA0OMATR2ZPxxOikUkN/H9zFAnMeMB2xJHSi6QP9yHf2
 9WkHu1/I0cUdv5SrCzkr+HBSW3c7/vybhPj/2at4LRzrrNYp7mBkoFN4+Mj6TrE9p8Um
 rSxjlZU1eEsPTR+jTDmBIs5VaHNly9OWOLLVHKYWj7V8D/zrbXuo0LCbu9/7dpcmtOkg
 ZtiWaOf3Kjfmwgduftk0HSwXcGYApFEto22YEdyK+bXqXFNlIzvW/YAB9QYXhED4Pd3u
 hT9UaTHk3oQIkXfPrHSyyztRPu8RhRqPx/h9KakRE98O6ZhNl5FYyPoKd5WVc9A3j1J/
 wlpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2cXhD3LsumUP7bU7S8RSybKzWaaMBVzBA2yR8/u4FFYyVcwF7Ly0RFizo7Ig3t/Fo/xR09WHrV4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmy63T0xNWV1CT3DIg/oFOtPn8InWijsgHXBdC+hT193v2v/8H
 LLXLH2PLyvhm45C4l6oSPsGM/3Vo2eN7luXVlEDFcBkoLfLKsckt69+8yY9ERsDpz2o=
X-Gm-Gg: ASbGncujH9x9ksHCer0bAKrFEoSVOqXzO70X4Z7URxTEveEio/dM08k16nA8nt9r3qS
 BbKQPZpLSvATvqP+i7B+XGKfvCSoZLHH4XFFyN1GXDDeiCLW0QGoydAb3EjCTF5Hbj4XXGaybef
 Qlwk9favsBodF5H+N1sowpyVe2TVyiZT6y283pO4WlfZpnyTB0tKeEQ0jxkW+kGHfTbuEiuLqCq
 MB4wM9/3gEnOivVizmPuBE2yuqPcGw26eg4tZVouwT1AQ2eIcN4I1uXvn1pVPRDs5eCZJg7uTyE
 WscIYZCma3xcvuyAii0OUP+bKANcMgLi7J3epU+DFsf6qnmMkkGosmeA4igWTDqGW7rAgPzc30X
 H74SCFpcWqhP3ORINFeBM9Y/kVx91YDlRxDMkCVc=
X-Google-Smtp-Source: AGHT+IHc2LFChK6nKJsc7X9nBMScmXFF/jGKl+Q64KebHtgermLdzgFXssJvaq5SKIfgcrAoui6bdQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a5:541c:b40f with SMTP id
 ffacd0b85a97d-3a8f435e1c6mr11770341f8f.9.1751297669218; 
 Mon, 30 Jun 2025 08:34:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a390bf8sm141654655e9.4.2025.06.30.08.34.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:34:28 -0700 (PDT)
Message-ID: <5ff999e9-f0b1-4550-98c8-2d1eb7e97389@linaro.org>
Date: Mon, 30 Jun 2025 17:34:28 +0200
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
 <67da8003-ced9-4b52-a484-b37147068ae7@linaro.org>
 <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
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
In-Reply-To: <32d302d6-b404-4814-9f17-fda5fe0d3391@mailbox.org>
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

On 21/06/2025 18:03, Marek Vasut wrote:
> On 6/16/25 6:26 PM, Neil Armstrong wrote:
>> On 16/06/2025 18:05, Marek Vasut wrote:
>>> On 6/16/25 1:45 PM, Neil Armstrong wrote:
>>>> On 13/06/2025 12:54, Marek Vasut wrote:
>>>>> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>>>>>> On 12/06/2025 01:49, Marek Vasut wrote:
>>>>>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>>>>>> alignment gap between default_address_mode and lanes members.
>>>>>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>>>>>> there is no chance this value can ever be larger than 4. No
>>>>>>> functional change.
>>>>>>
>>>>>> The u8 will still take at least 4 bytes and cpu will still
>>>>>> do at least a 32bit memory access, so there's no point to change
>>>>>> it to u8.
>>>>> Assuming this layout:
>>>>>
>>>>>    40 struct ili9881c_desc {
>>>>>    41         const struct ili9881c_instr *init;
>>>>>    42         const size_t init_length;
>>>>>    43         const struct drm_display_mode *mode;
>>>>>    44         const unsigned long mode_flags;
>>>>>    45         u8 default_address_mode;
>>>>>    46         u8 lanes;
>>>>>    47 };
>>>>>
>>>>> I wrote a quick test:
>>>>>
>>>>> $ cat test.c
>>>>> #include <stdio.h>
>>>>> #include <stdint.h>
>>>>>
>>>>> struct foo {
>>>>>      void *a;
>>>>>      size_t b;
>>>>>      void *c;
>>>>>      unsigned long d;
>>>>>
>>>>>      uint8_t x;
>>>>>      unsigned long y; // ~= lanes
>>>>> };
>>>>>
>>>>> struct bar {
>>>>>      void *a;
>>>>>      size_t b;
>>>>>      void *c;
>>>>>      unsigned long d;
>>>>>
>>>>>      uint8_t x;
>>>>>      uint8_t y; // ~= lanes
>>>>> };
>>>>>
>>>>> int main(void)
>>>>> {
>>>>>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>>>>>      return 0;
>>>>> }
>>>>>
>>>>> With which I get these results on x86-64:
>>>>>
>>>>> $ gcc -o test test.c && ./test
>>>>> 48 40
>>>>>
>>>>> And on x86 32bit:
>>>>>
>>>>> $ i686-linux-gnu-gcc -o test test.c && ./test
>>>>> 24 20
>>>>>
>>>>> Maybe there is some improvement ?
>>>>
>>>> Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.
>>> Doesn't that mean, that one some systems it wins us a bit of memory utilization improvement, and on other systems it has no impact ?
>>
>> 4 or 8 bytes less in a dynamically allocated struct which is by default aligned
>> on 64 bytes by default on x86, 128 on aarch64, 32/64/128 on arm32, 64 on riscv, sorry this is negligible.
> It is still not zero, so why tolerate the inefficiency when it can be improved ?
> 
> Is this change rejected ?

I won't nack it since it's technically correct, but won't ack it since it's an useless change.

Neil
