Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0191CCF4567
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5925C10E435;
	Mon,  5 Jan 2026 15:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v7Sgkgsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D014B10E435
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:16:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso192215e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 07:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767626170; x=1768230970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=v6J9x8hmH+8edW4X+7oSH+j8Vnumoj/rghaYxz588SA=;
 b=v7SgkgscK9OC+sFBemuLZS9q5qoD1I/QfIJUcrdbN2FFWKAb/3ahx3F4bFiAbRCRKz
 /7MdDOrwBCH8VlX+YiQ7+YtzxlpBZigk5jflqLQZYBUukQXhMGH85eWmrfWWqsb1E1C8
 EhCBLwROhVgldXG99GsgXl84itLDoXHeHd7UbVLlHN8Ruza8h0qv4Ft/sOi8iAT625oB
 UiKVmjbIMLv1qqqXMTBDSKXkEfOV27TxNKwEHl4554NvkpVOAc3UEsMTpCu9eZSk/zap
 FpdUWC4EfXepNO9XcnyA799QGY4s/HmElUcvSVEBFbae3wmpAYgNWddICJHwKZykvK69
 qf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767626170; x=1768230970;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6J9x8hmH+8edW4X+7oSH+j8Vnumoj/rghaYxz588SA=;
 b=NvKrNyZwDQ/93heeh++Yv3bvl8Yl1WaUOJxjom+rqQPOuZODz9P7YHDobCmwIyI7Pv
 FL34jZfPds7cc9OZWh25rLaLCUdVghT6thqdC5/4CESXjxFjsV0eqM6vN2Dn63RS80j/
 JoXPHmA+q3l5l+B+ZwWmgphcpzt/pdhWiAfmWz4uGCOE9wqSJxTv+fRIkMQcxc05XiBG
 f6eJ49L7o2Vhk9vm4L4gUqvEOmY4NMEAJGhsPQ0CR8fesb7thg+w5kjRoZoZKGzLcyVo
 W25Wf2nEBCgIdPIDt4pYudkbqQ/5GelyJh0y9HeSuOQjO7F8siAilQ2vpcpF3OHWImPb
 r/5A==
X-Gm-Message-State: AOJu0YwHzZ/AW3qfxXSfEenIsTFpNg//3T9iSuM5aaUaWK1gH3pG0Jsb
 QRlfdbO1seVaKMX7rxB7/B4KOQulUZZ3T95qAPADiGl2OW5KLBATuWhxmmOA5jKzFsQ=
X-Gm-Gg: AY/fxX6l/M9kp37Jjyik4CXRhfEqJ+KWH0JeshBebSddsvre2PJvJnKGRY7kVlg8o8e
 LDU53/4UZcXxgmCMJmhk0VtDPafWri8IVEPnwO7X5lwYvlI2do60Nj6yzOAffTJ06Zeb2dy0VBo
 HQjCLXj+/9ZsdvByRQBqmCsWuPbVdwt0uk+2BfV8Q5F+qEJDRhALfHbrArJ9iRqulRJ0IQP9qB7
 q11kFGJ6Nel8vPdeUB3QOGg8aaBL4dzdvu9uPUYzthXZCEwnIe7TNjvLk+Dly6VQcPR6cnu8Gzy
 Xsezaf8fqbsF5zqA+gIEKjoBHVUsimBF6iCCbZj+XagYmIasdtOMnFuTdJW0ncXBmmHX1aBiGdQ
 W6bIkT4CFFnHUqnyWVTcxf9OSwIBD/iNP7OxLRxDnk/AiJb9dXU0YlE00nCHuzF5AEpBjYAX5ED
 Ok2xb471ormEmFeWB21eBgJEOThbwQjnVP8bsvAHEKwVsgiaBsz6uH4ghiFpmYQNI=
X-Google-Smtp-Source: AGHT+IHxnih/W8MehQcuV3RrfVxGMF3oLEJ1OKi3geRwRlO3RuX8qM+YJp7PqbZT/Bpl7CByF6rOCQ==
X-Received: by 2002:a05:600c:1991:b0:477:7a78:3016 with SMTP id
 5b1f17b1804b1-47d1953318bmr601496335e9.8.1767626170279; 
 Mon, 05 Jan 2026 07:16:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033?
 ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d33eefesm155265565e9.12.2026.01.05.07.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 07:16:09 -0800 (PST)
Message-ID: <b229a86e-3f0b-4059-8a1e-de5be71cf3d8@linaro.org>
Date: Mon, 5 Jan 2026 16:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: Fix a possible null-pointer dereference in
 jdi_panel_dsi_remove()
To: Tuo Li <islituo@gmail.com>, jesszhan0024@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251218120955.11185-1-islituo@gmail.com>
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
In-Reply-To: <20251218120955.11185-1-islituo@gmail.com>
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

On 12/18/25 13:09, Tuo Li wrote:
> In jdi_panel_dsi_remove(), jdi is explicitly checked, indicating that it
> may be NULL:
> 
>    if (!jdi)
>      mipi_dsi_detach(dsi);
> 
> However, when jdi is NULL, the function does not return and continues by
> calling jdi_panel_disable():
> 
>    err = jdi_panel_disable(&jdi->base);
> 
> Inside jdi_panel_disable(), jdi is dereferenced unconditionally, which can
> lead to a NULL-pointer dereference:
> 
>    struct jdi_panel *jdi = to_panel_jdi(panel);
>    backlight_disable(jdi->backlight);
> 
> To prevent such a potential NULL-pointer dereference, return early from
> jdi_panel_dsi_remove() when jdi is NULL.
> 
> Signed-off-by: Tuo Li <islituo@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> index 23462065d726..ea975170faff 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -434,8 +434,10 @@ static void jdi_panel_dsi_remove(struct mipi_dsi_device *dsi)
>   	int err;
>   
>   	/* only detach from host for the DSI-LINK2 interface */
> -	if (!jdi)
> +	if (!jdi) {
>   		mipi_dsi_detach(dsi);
> +		return;
> +	}
>   
>   	err = jdi_panel_disable(&jdi->base);
>   	if (err < 0)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
