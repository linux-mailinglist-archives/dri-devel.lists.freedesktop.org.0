Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E603CF7467
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:21:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9D010E4A6;
	Tue,  6 Jan 2026 08:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eX/mp4l/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E398510E4A6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:21:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so344361f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687670; x=1768292470; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=mo2aCmsWo4elpcgvHCHejvpSSvbkXFYtvQl6RpGpMmE=;
 b=eX/mp4l/Aqh30eQcKDyj7RLLYdr15qEyqcF9DqbFMSgE0QOjcURCb0g4JSxrz6rBpI
 swZuVMkCdXCdq+Jrx3IUHU0RS47Zh0NPq01oOfX6NtgVyFcGj6e55qpVqBMPjxGWFFnV
 RwuRvXYCLYIAK1uj1aFCGCC3gufnbW8e/pzGngH0qGzE/JoKyGJuUZqvclbdd1M9G4k4
 C0AvCPBnsU0CFTtXoYYDmmemnwRjtvlbkwQiGcDX7g3c9PQQalO1JM7qfgAekRC39QPF
 QwrJA6/AinJZ8y+A02amzng5R3ZP9C0lIyhtWvGB3kshzixwjBn6jeKGEmZinaFVXfNJ
 lAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687670; x=1768292470;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mo2aCmsWo4elpcgvHCHejvpSSvbkXFYtvQl6RpGpMmE=;
 b=qxFkBe3OICPcHvv36q0Fr/PeqCK86kSTJHZ8OrX6wEUpLSyp1payc/5tT6nJkWaTLF
 BCzmNuHv6nVLUaCd+27ao1gGxUwKrjd6InwNcCeL6/Evyc0QMHZ8CyOjyDnBHJRDC/vC
 e5zbX/VVFnCwiiF5cSARYfNqdiQIvD/0imOxjJbfS0AXoJrAmtLnPGAYhFBHUuN1lydb
 gK54FexOlTnQij8TE09BjXo/x8gyefxxc7LJGb0/rXc26nN5vXFzhtTnNpX5HsRVp9n7
 AHE8E0OiO+K29dUqNlqbgCJIkaQM1qVjRqPTq611KEN8wea84DI5YBGWeMKnXk3GqoFF
 A0lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkD5GS9MlQn5YUJgrvOSOjaNHIg3LnRuWG8FB2slmZvO7t2uGZEymurkF7x8u315Koq0FJrfVdWRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2J7O0zoVCtfrRXT2cQ68Frxkz1IzZmzheMIm9dJ1eM0mm97R9
 joKbHmERPqlwoHQeB9AL18ARJ2dre1h3n+RufjZbGwQx5v+F40zaAAiIlwo1oZ2Crow=
X-Gm-Gg: AY/fxX4gXdckAuKf0nKmN/ti9OXair9xZogvCtYO95QFsmyBgyoArFfDHBKdcaKLqKs
 xEim7i74TMqwY2cheNsMpavdyGD2XXXzDE76kIiDGT+1PeQZvRNPpIgVgMeadgU75ro0PAxoxQf
 W/v30i5VedbQiMMcC8yVD3M86FQZ7MXfSC4HUa7o32toYQBAH57QzdzuAyu3L1h4S7N8ZDfl/Zk
 ZtqQCcLfsiDbwEwLQqAGNP5S4rriXg0SsFRJ0fIrO2/onbR0vwJL3hSb2re+/MvHXiPEpwPQy0U
 Pb3FWQ96l18X7C3EywtISxwbxpk/umiIIXQSGG0keQ0NV1sqHAPN6V12Ih0wvfntXMPhYNfpJ4A
 lUhjsajnOTjs2qVNG4RU55I+2FIGVw/nQJg/oodahv6uGunjOWQAH7+LPROwiaTD+UhjPILPmeS
 OSJeD01r4jq6O/rssqy4qVUueIuzyVdZ8Li+4tEtK57+xG2Oulpp3D+KRLZU7Y4yw=
X-Google-Smtp-Source: AGHT+IFvOchFqZii463WUdKG9AZkhDIWes46hV+OjUY+EFnasHCg5d0F6M6XA80K7aHHMSWsjTfICg==
X-Received: by 2002:a05:6000:4287:b0:432:a9db:f99b with SMTP id
 ffacd0b85a97d-432bc9ccd56mr2667816f8f.0.1767687670291; 
 Tue, 06 Jan 2026 00:21:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e6784sm2953813f8f.19.2026.01.06.00.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:21:09 -0800 (PST)
Message-ID: <2a9f7c54-3669-4f8b-b46b-b7e01712a1b8@linaro.org>
Date: Tue, 6 Jan 2026 09:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: panasonic-vvx10f034n00: transition to mipi_dsi
 wrapped functions
To: Avinal Kumar <avinal.xlvii@gmail.com>, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251127161337.396531-1-avinal.xlvii@gmail.com>
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
In-Reply-To: <20251127161337.396531-1-avinal.xlvii@gmail.com>
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

Hi,

On 11/27/25 17:08, Avinal Kumar wrote:
> Changes the panasonic-vvx10f034n00 panel to multi
> style functions for improved error handling.
> 
> Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
> ---
> Here is the todo list for reference: https://www.kernel.org/doc/html/latest/gpu/todo.html#transition-away-from-using-deprecated-mipi-dsi-functions
> 
> This is my first patch in Linux Kernel :)
> 
>   drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> index 3c3308fc55df..03c87c02fb57 100644
> --- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> +++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
> @@ -44,7 +44,12 @@ static inline struct wuxga_nt_panel *to_wuxga_nt_panel(struct drm_panel *panel)
>   
>   static int wuxga_nt_panel_on(struct wuxga_nt_panel *wuxga_nt)
>   {
> -	return mipi_dsi_turn_on_peripheral(wuxga_nt->dsi);
> +	struct mipi_dsi_multi_context dsi_ctx = {
> +		.dsi = wuxga_nt->dsi
> +	};
> +
> +	mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> +	return dsi_ctx.accum_err;
>   }
>   
>   static int wuxga_nt_panel_disable(struct drm_panel *panel)

Why didn't you also update wuxga_nt_panel_disable() ?

Thanks,
Neil
