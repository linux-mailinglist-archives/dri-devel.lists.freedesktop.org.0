Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DACCB1A5A7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E136F10E56E;
	Mon,  4 Aug 2025 15:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yU/DPA/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BECC10E56E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:17:17 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-458a84e2917so38289265e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754320636; x=1754925436; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ygs3wS78PK+/30hvIGpvyt9rDvIj4U6l91GW/IBhVOM=;
 b=yU/DPA/KINqKd8ZXaygfkdb+93ThIypiqFwbRIERoPSYU+5luX46uvakzn6McDZSv9
 pHzyt7UdJ2e6Cu60XamBAWYIu0MRLTIi2HofJJedA7PQwGYdGuXxfW4TstxYHOY+3wUn
 GDZ+RSFZcC9obLf45nONWUiud9rEiYWfskIdtDBnlzW+pi3WHjE7sgBo3JXPe7wWIyAH
 fUpdNXsUH0HBaS7M4kV7KkAf+iCwq1+ZoL7GwfD57CiRARVQRY+Sokl4qfle4COSmSUv
 lNA8wcqCnmIvieuTn9+BWn36I57hmUQ2wWOedBb/nd+0eBF/3IFINuOuW1dfR+XYGVBU
 vpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320636; x=1754925436;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ygs3wS78PK+/30hvIGpvyt9rDvIj4U6l91GW/IBhVOM=;
 b=mG9K2rT+ihiWs1t04zC735/JNLNJu21VhqqBi7fqlFw1BSlNQhxxrRYcuO9BF7u9+A
 S26Oemx4ThJYDwoamOeECIRtq/nxq0LlJw4eDS9TwI8zMMvzpSkPo65HlWWK8RndLpMZ
 ux292A1TdyDyYOXDaFC46ERtxJkdtWJ0E5ltK0NUxWu5n9GMP35aWxxPAbpWYKJVuYkH
 d/nOL0iLA3YOPQIFzA9vX7/vGLLnCM7B0d8tRaNcGfaaLTkyCcHAbExBTk1lb0/QYjWr
 /kPeg8ZOMVO6oRMTCZKeWnYX5bYObSxiQ4+WzYsxfUzkN5DLA1nutNkZC84e30l6xE2p
 KTPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwR1YMZ/hKTLaZjgt1BMHArXDGpfDvSQ+ToBQSBLPD+Kwm/aYJI1UulpTwK848kUYEFfLc4Ltad4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrTMkeyCL1AFg933txm6fBfQgyqtN4cdk07J5I9ntDnmQ70FFo
 nLvCBOz/g0gbwjr0YELwCkUX9iqSpiT4Iw/f7wimzqBBIsvNbCg4oojED5OvRsBSzJo=
X-Gm-Gg: ASbGncvUUEu5PgMmh6q2uwFytoHsBh7XtjqcHcRCoLxiILAIF+vjg3GWCB3eG/euV4q
 hPugTDNeTjF0m2ovoeNweS6DsP4dY73a9y595Mphhf1PLPrw0S9E/73UGo+5409UvxiraQ9njXK
 t2izm32ix5pdAJwcc3jOyuouFQSzygPidM2147fuuj19ygtj3Fe1/YFpJWekXCJhHs2NmA3CHx0
 /1CPi8HuKdadpMnfqyq4o8xrtDtbV3j/bEp+HXFdJZ6VW3I6rcvgleSDBtCNZr9Q1s0og7rJOou
 6vEovN57VBKxf+SyeooiK/I3mrX1rNf/IGux/OsjaBgXM/bFKIqsPH2/zWLjL/cdsXcFxiigsM7
 5IhOh3dBprc0CkVF3r2SZYXgLMk8bdX+wyOU+Yl8wYO22NkE3FW9VwA6Y9WKJM6Nu9dm96kifCb
 E=
X-Google-Smtp-Source: AGHT+IEZA+rLTJ+G6sYCCHHikTQcmm4lwICBpmhAo83VygtbN+DV7ESvaZKPYTCU3AYSF2ltuaTXsg==
X-Received: by 2002:a05:600c:35cc:b0:459:dfde:3324 with SMTP id
 5b1f17b1804b1-459dfde3545mr10378085e9.29.1754320635920; 
 Mon, 04 Aug 2025 08:17:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bd5a1148sm56470755e9.0.2025.08.04.08.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:17:15 -0700 (PDT)
Message-ID: <6408ca9a-bf7b-45b4-982c-8a91d2ebf7d3@linaro.org>
Date: Mon, 4 Aug 2025 17:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: panel: convert to use ERR_CAST()
To: zhang.enpei@zte.com.cn, andrzej.hajda@intel.com
Cc: rfoss@kernel.org, laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250719164705961iryN2w6eDrp8KeLJMkI6-@zte.com.cn>
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
In-Reply-To: <20250719164705961iryN2w6eDrp8KeLJMkI6-@zte.com.cn>
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

On 19/07/2025 10:47, zhang.enpei@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Use ERR_CAST() since the macro clearly indicates that this is a pointer
> to an error value and a type conversion was performed.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> ---
>   drivers/gpu/drm/bridge/panel.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 184a8b7049a7..7d2d67e56cee 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -291,7 +291,7 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
>          panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
>                                               &panel_bridge_bridge_funcs);
>          if (IS_ERR(panel_bridge))
> -               return (void *)panel_bridge;
> +               return ERR_CAST(panel_bridge);
> 
>          panel_bridge->connector_type = connector_type;
>          panel_bridge->panel = panel;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
