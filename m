Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D979FAC05B1
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 09:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D699DB6;
	Thu, 22 May 2025 07:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="POh4YXxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13750988A7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 07:20:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-442ed8a275fso95963715e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747898410; x=1748503210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=h9uBgcPlsHvvGQ1VX4ZUYkfYF9TUaS+4+Ub/ZJyGnTM=;
 b=POh4YXxhm1XR9W3h7e9UblPnc+BjFyJgwqoyuVrZfGqwajcyShayqRfXrlk8olFh0A
 9nYEFdzaZkjqWsyfBPkrT0YVcM2SsfrINqUEOXtZebcgHD9OiEMZ4Djk8coD7g8fhxNc
 eWN3oBZ7XJehZumsKM6AC6tSslZYsNE9KGbxMwQz8JL53Ni5UBQVEEvwKyvhqIvHL6Gj
 UART3l34ojawsXa2CQaYll/I1aMBybrdhGz/MywSuGSLQDyxEN9IajcGEas3l+7UUJPN
 KJerMWcdV38FcNGU2uDY6n95BM3/qdsVi/Pbao4reBPkRj68rkaklOoTgsN57cLSbM4e
 nWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747898410; x=1748503210;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h9uBgcPlsHvvGQ1VX4ZUYkfYF9TUaS+4+Ub/ZJyGnTM=;
 b=S5k08t2RF3z8/uTIutXWiM1sAQzfl/6omOBTSaAs4VOx2Snd1NiARxkfVjpj4nor1W
 HLN0jGUmlopOW4bGsaKF1tGzHE3V0ibM/BxN1yUpDtqriUIQq5XpA87iZHbAHTFEZ287
 TRzkFLoCrd7DOfBVgvJoAPExL29Ubp9Z27b8/55ZybidO5eGbVUhM0jtKkGTXmxIkZmt
 xMuoH1cnU4uhOAFobz/Xo+/o1sQa9Tp/XCl6nyOzTUxaaX3jpRJ95WYG7NZKyMo68cEB
 yOPW8Zr/qY5hZTBSUKDBdkGhhAZKyu+816kgJa8mywDaiBNol2s/H/tBeaWZVdwxD7Eg
 q1xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWznkxuYwQrKLRukuXBxiEXEOKR0KT/v++jX4V8RlDjaH1rS1Bi7ZVjTKO1uHogTHI6Qa6pF1+Jhx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy+S81CRXGgF4fZop8tOCeX26vaOE7Gy6nkvn+JODEKCR5aL3k
 lSBjeXwQyEtKmK44S1q58iaokzI/vQhk8AAet7EwiSj7qVbF4tShixjnaz4v7m/lnlo=
X-Gm-Gg: ASbGncs3zVMDi489lA3GtNjD5iWY4rU8aCml7TDfNLEybZVVlIoBSou3X+4LelrK6nY
 pVPlH37DW2fOmF6P7C1xkEiEZ87o/+14crZRwXyTx4tZHkHKUj7oLaw1LdBC4nejXzTBK3ZgzwC
 QxY/1PDJAjJEoBRvhTsZtDRGMe3GJhq9yZInkNDsg1kKbIXwHThBvP8OydDGzNaN7FKA78nMcba
 eq7sWTUnAjmeaGz7/wRs8N2jAC22mDeElD6NuUuRLbVq8agtYsVcCw7T6KAhTLZ8KNvped5hluf
 BtGzum9uNssC0WWlV/nrQwJgC+jTXxf3K/c4jruGz6YxqsfheQxqNz8o0MprJm0byzf8+7dI7Hn
 vYiAhb0KQTQwwhMqVmD96TV6A83Xb
X-Google-Smtp-Source: AGHT+IFWnwzP1okJY9tdDyyXM1yRdATlSP2aBPuqUBU5LyfBrvXpHgVdO6yXg/dSidOoUi6+IdDWUg==
X-Received: by 2002:a05:6000:2385:b0:3a3:4ba4:f3cd with SMTP id
 ffacd0b85a97d-3a35c821e38mr19239803f8f.1.1747898410577; 
 Thu, 22 May 2025 00:20:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5?
 ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3699a9bf3sm17123530f8f.54.2025.05.22.00.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 00:20:10 -0700 (PDT)
Message-ID: <6d3e41a3-4fc0-4ebf-badc-6258ee7236cf@linaro.org>
Date: Thu, 22 May 2025 09:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-edp: Clarify the `prepare_to_enable`
 description in comments
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
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
In-Reply-To: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2025 02:32, Douglas Anderson wrote:
> It's unclear why I originally wrote in the description of
> `prepare_to_enable` that "This is not specified in a standard way on
> eDP timing diagrams" and then also wrote "It is effectively the time
> from HPD going high till you can turn on the backlight." It seems
> pretty clear that it's (T4+T5+T6+T8)-min. Either I was confused when I
> wrote this or I was looking at some strange panel datasheet that I can
> no longer find.
> 
> Update the description of the field so it's easier for people to fill
> this in. Couch the description with "usually" in case there really was
> some weird datasheet where things were specified in a different way.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   drivers/gpu/drm/panel/panel-edp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 9adbe0f11421..74f5f9006a5b 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -113,7 +113,7 @@ struct panel_delay {
>   	 *     // do fixed enable delay
>   	 *     // enforce prepare_to_enable min time
>   	 *
> -	 * This is not specified in a standard way on eDP timing diagrams.
> +	 * This is usually (T4+T5+T6+T8)-min on eDP timing diagrams.
>   	 * It is effectively the time from HPD going high till you can
>   	 * turn on the backlight.
>   	 */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
