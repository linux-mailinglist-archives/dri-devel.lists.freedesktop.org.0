Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4671CADAEF5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1726610E356;
	Mon, 16 Jun 2025 11:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G57YFipv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC40710E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:45:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-451e2f0d9c2so37823605e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750074334; x=1750679134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xS4xS30ShPKjN2mWHcGVIciQwVFwjcN98a43DP3mnB4=;
 b=G57YFipvkIlcLYLuSOtAeu5F2aW7LUCpncS19A5iU7nFkY1dLS2IP+fpOR96nDjdKJ
 oxTayitcUMDGWxq4zcAJ8zyCyCQ6HN9QSaIeQUIkXXvnHb+m8amAKv0gmn/em/gs5+tN
 z17Ls1GkEGkVEaCp78g4eZaOMcZ8FyyoPUDkB34OAxEf3RedgkYRjNWyZkWGXX0/61Ny
 xllydal6/qSx2i14FVXEEeC1U50h79vy9taPLQCoSrEWZ+J7cuatC7a9LiEPPvmg2/X2
 Z7FASoM+fads6KBpEiZXrChLsMZZXJAYIynZtWnUqKPslrsx9CKhgId9PJAFj5rEKNx3
 3MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750074334; x=1750679134;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xS4xS30ShPKjN2mWHcGVIciQwVFwjcN98a43DP3mnB4=;
 b=oA2JvfR0b4ka53iAlPhY58s2SOgdEd+I1x1CseE8AQ7MGXzhb4IWQ8/ToFq37Vb2RO
 7RqQrzOqKJ14BXNL+D+hzvwFfiMNDyIZOeBhR2xAXZMG2JyEGDfAbd888HA6wlyCmH0r
 OR3KdWPq2HNAFyJbcuz4MBhsBLqZb19MJxFGYGh/ktMS0LMl4VjYnQ1h+pXcRQ7/i+ve
 TwO2l+BF9sNN0PkmASaBQWIHiaUJi6pWvUDtI4WbOGBd4dxqZ7+7y9jZYvnxjxnmI3Wz
 2SXJFsliHvOhNg6qSbW7liPhiEQHyNv6WVUW9aAtYxUFTIwyrfa5EZhQw4iwnqmFbVdY
 YKxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtbJx3iLlG7+Wt8KoVskxkhr3cReKg4RJNqYvfPV3VB1imIjUy7P7DXUDZrNl4txh8sviWB+MFohw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1I+uokyhBOWO7phWSgQku8f8WcIiZT1/JrwNg8hGdt3vIRfK3
 WQsSnUPPV4uRjIn54bKT7EmaiZJG6jNSYg85iApEfTXj2hc7/HHxvFaS6sDy6p/aVtw=
X-Gm-Gg: ASbGnct10GT0SN0un0pYxkdfWUoJhvFtD47bTzqngyrj0ktytlpu1XLFIN3SpcoYecW
 H2rYzm+K6qmMOxsy0S5WnfYLwjTbhyaZK2slDcGTYofnPb/+im26uLWzzKKzXu9r5JU/M9cpZgg
 9zNakOD4OojxmEWoo1CCzhUbsAYFxCcjfHZIJliySh15v9U7EsGbuwpZvtQofpaAtPGLVkRuEfM
 bV1ReRGoIOAvWMBpy8/EdBCl61rz6hqa9YvAwKI7ma8kH59PF46s+w3x+qV1zMux8dFPQz7zlx7
 OvnidoUwDgSNktIHUDDkH7RwNB6heSZvlgimqZZMT1wIttNv/i+ne7RJCqO58qorD5pvgd1/5ui
 Z0Wcf0gI289PqOufvFKaQxr8yqgzgRicLDhQeoSMy/xMU7Nc=
X-Google-Smtp-Source: AGHT+IE/RGLJi+8Jp6tAPmLAlloGkFh04fpk6wm5Ui8Q4WsEPJZD8MPlJVlMjU82wjd1jR5CtxSsIw==
X-Received: by 2002:a05:600c:6211:b0:450:c9e3:91fe with SMTP id
 5b1f17b1804b1-4533c83f4afmr74334155e9.0.1750074333718; 
 Mon, 16 Jun 2025 04:45:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:6c7:97de:65a8:488a?
 ([2a01:e0a:3d9:2080:6c7:97de:65a8:488a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532dea1925sm145936345e9.12.2025.06.16.04.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 04:45:33 -0700 (PDT)
Message-ID: <ef842208-069e-4471-8680-f945d5ccb1a7@linaro.org>
Date: Mon, 16 Jun 2025 13:45:32 +0200
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
In-Reply-To: <a263d600-4f62-4d40-864c-e0b0c42f6863@mailbox.org>
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

On 13/06/2025 12:54, Marek Vasut wrote:
> On 6/13/25 11:29 AM, Neil Armstrong wrote:
>> On 12/06/2025 01:49, Marek Vasut wrote:
>>> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
>>> alignment gap between default_address_mode and lanes members.
>>> The ili9881c controller can only operate up to 4 DSI lanes, so
>>> there is no chance this value can ever be larger than 4. No
>>> functional change.
>>
>> The u8 will still take at least 4 bytes and cpu will still
>> do at least a 32bit memory access, so there's no point to change
>> it to u8.
> Assuming this layout:
> 
>    40 struct ili9881c_desc {
>    41         const struct ili9881c_instr *init;
>    42         const size_t init_length;
>    43         const struct drm_display_mode *mode;
>    44         const unsigned long mode_flags;
>    45         u8 default_address_mode;
>    46         u8 lanes;
>    47 };
> 
> I wrote a quick test:
> 
> $ cat test.c
> #include <stdio.h>
> #include <stdint.h>
> 
> struct foo {
>      void *a;
>      size_t b;
>      void *c;
>      unsigned long d;
> 
>      uint8_t x;
>      unsigned long y; // ~= lanes
> };
> 
> struct bar {
>      void *a;
>      size_t b;
>      void *c;
>      unsigned long d;
> 
>      uint8_t x;
>      uint8_t y; // ~= lanes
> };
> 
> int main(void)
> {
>      printf("%d %d\n", sizeof(struct foo), sizeof(struct bar));
>      return 0;
> }
> 
> With which I get these results on x86-64:
> 
> $ gcc -o test test.c && ./test
> 48 40
> 
> And on x86 32bit:
> 
> $ i686-linux-gnu-gcc -o test test.c && ./test
> 24 20
> 
> Maybe there is some improvement ?

Try again with code size included, and other archs since 99% of the users would be an arm/riscv based boards.

Neil


