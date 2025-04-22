Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B8A95ED1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1330210E505;
	Tue, 22 Apr 2025 07:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="M6ad6/r9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532B110E505
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:03:10 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5991410f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745305389; x=1745910189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
 b=M6ad6/r9T5yCE4rzGPUf/TIbRgSEfr4FYJ7IE41YbBLBwoUaGG6SMyMPQsOFsshz5O
 SKJKMjD6rg1TchJyhvqOyDN68M4B4BilUOupm0H8bLKmVuOnJBOVxxGKJlX98KTYq0Jn
 ysLkZsgtJx0pARz12SL6JVZEtpHUETGWJbOWZYOrZJn7CtEsPK5jn0EU3Yucf5X17HBn
 AQOZwhIDFvLYMxW97Fov3Urv9o0zPksVnK1ZhW/uakQlZuqqc6TqkUKXy0bO9bvSfBBL
 U8tQWN9zoXoq6Ix1uPn3X9hfx4iQiKa3+SWAoblmW9wyeICNHNAst7VtlEQRNlyKAd0y
 jL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745305389; x=1745910189;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+EW9WOjwKhGKY0mSAGuVe1/yMsQLEVZGpaUvajrqIQo=;
 b=g88zUfCWI/cE175KKvtb45at3SpuieFAdSE5dI0MDQoT9CXVv8ROU9Y7w9aNxpQZp8
 8AhKei7BqstJSHa/vONemQXM80bWnrFpiokLgywc4Im0Bsc4oG7uP0osQB8qnhOzsmwD
 BC1ZmCU273zvt1gn7XKZ2imfjh641WtIrUL70rx6zlv8Sk6j9gF477PlSGTGdeHmOYPX
 +2wdTWL0xjM3qeUZf7+a1pDcs6ihu/3uuh9KsPNHUKesf2vu17SAsjfFNLHRpWgLv6KG
 rYfY8bJRbJbcGI7EbP51w6E0S3z0jPTRXa1AO8sCy01P2MyAD/EwekGF6qfnG6SHe7FX
 WdRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/cPkPHBfhAfz9yvqK6yjWFZV4Esuk987fRnXFcm30cjO/4sRRfxbdCIL3SjWJ2gh3ALWANd5hpWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9bbZESQU6wz5bSinwgacWz6hSi5BmnmpljagijNU7ECm5Kz/e
 lM4QY9QkZpZQIr/4PkoTh53eZDqAfwwk2k7tpzJfMFY8WZcg9iT6g2cSsJ3punA=
X-Gm-Gg: ASbGnctTtwLpwH8yK7Bpiud2EBTrQW3YLEjH8orwx46HrgS+Bj4Oqgg1a6M/18zMZLL
 EvGuXdQCgR44BYYHqElnKsjhktw7CblmQJe24NgbkK1iUeS/9HMj5Ng/BxKnm9h4g/1Lfvp+yC5
 FO5XqV4YZ9QlzfMortG6NUQjWRFIlLeYcUh0PEDvKD7jzQIpCgZT5KkHNpPk9krlk4+koCvh90R
 JgybwmOrRXptVeFVa5R5TOnwTQEIbaBUZo2ZVUyjDEhOR4zBOwNscKmB2hidPmdvO8CtQj7nlJV
 lK3N3t+7Qj6lVPBaZhQAISey+N+p6xaZj8cE0042E7DRbB3n8QXM+Z9FDvPcsa7qtYZbjsXEUHN
 SDaWXqVtDQ4ug+ZPNHA==
X-Google-Smtp-Source: AGHT+IE3A44CHRZT4LFqIN9Z4MWfOqywDl3gBVdthcSxAs8gC51/XERlOdOoQsF0+0M1L1XTm+SLEQ==
X-Received: by 2002:a5d:6da6:0:b0:39e:cbd2:9129 with SMTP id
 ffacd0b85a97d-39efba2acd7mr10294748f8f.10.1745305388778; 
 Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f?
 ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4a4c37sm14496017f8f.98.2025.04.22.00.03.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:03:08 -0700 (PDT)
Message-ID: <b88bfe5a-9256-4de0-822b-b22d74dfdec0@linaro.org>
Date: Tue, 22 Apr 2025 09:03:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v2 0/2] drm/meson: vclk: revert and re-fix vclk
 calculations
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: christianshewitt@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250421201300.778955-1-martin.blumenstingl@googlemail.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2025 22:12, Martin Blumenstingl wrote:
> This is a successor of a previous patchset by Christian [0]
> 
> Patch 1 reverts a previous fix for loss of HDMI sync when playing YUV420
> @ 59.94 media. The patch does resolve a calculation issue. It also makes
> all fractional rates invalid which is a bigger problem.
> 
> Patch 2 changes the whole drm/meson driver to use Hz as unit for clocks/
> frequencies. And importantly it uses the relevant 64-bit maths helpers so
> the code can still be compiled using for 32-bit ARM.
> Maxime previously suggested using drm_hdmi_compute_mode_clock(). That's
> still something to implement with future patches.
> 
> Neil, I'd like to hear your feedback on this approach.
> 
> 
> [0] https://lore.kernel.org/linux-amlogic/20250110074458.3624094-1-christianshewitt@gmail.com/
> 
> 
> Christian Hewitt (1):
>    Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
> 
> Martin Blumenstingl (1):
>    drm/meson: use unsigned long long / Hz for frequency types
> 
>   drivers/gpu/drm/meson/meson_drv.c          |   2 +-
>   drivers/gpu/drm/meson/meson_drv.h          |   2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c |  29 +--
>   drivers/gpu/drm/meson/meson_vclk.c         | 195 +++++++++++----------
>   drivers/gpu/drm/meson/meson_vclk.h         |  13 +-
>   5 files changed, 126 insertions(+), 115 deletions(-)
> 

Thanks for re-spinning, will apply.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks !
