Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506C08B9544
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F88210F1BA;
	Thu,  2 May 2024 07:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a0wwJcIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6432610F1D6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:27:32 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34de61b7ca4so691905f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714634851; x=1715239651; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=G5k8DvRGdvhEX/z9Xhr6psWRJjlN+z3tQCAAExl9kNg=;
 b=a0wwJcIjuIMX6QExnXi44nvykKD8EjoCcQrPZNEUpZtUVMY17RtIY5WfpAmLbs6uyT
 sMancg1/cpQw6PgFOTakAi2qEgR5Gm0Rw5XZq1dcdw9Me4C9t3NZj4Pd48ptjrXPsCGf
 tDL3nVGpe7g90MTdCUECxw0G7dUAcUWnmf2tpDv780WC6SnQZ1VHcP0KvIFClRKnhq6j
 mwVgufCRbNxweS7pQDSKYuvlTG070JkUQoWwjTIvV82U5cI0Y6svXe8tVAWA/phHVWqM
 x3xtYtx4Opmvltx7gs2rDqFh7tHro7LGolOZjrvmkHxq3pX2JKifWsqExAZDUj3UtFOn
 9ciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714634851; x=1715239651;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G5k8DvRGdvhEX/z9Xhr6psWRJjlN+z3tQCAAExl9kNg=;
 b=tfvPXGiCWEc+NHu1eJbQAA+waasA3P+6ASbP2O759tqHObqAojkJmNZugX4dzcYp30
 1o40ltP0/0mEjTiKwtsn7J6tcBDaEBnLGT4KS5K/LGeL1O0dlMEoJb47I4+49uDXaMu8
 jWpeMLxwJuBmMWzZ7Na1GKuXz1DKS8xemMzrjRv8j0TJn32JrwwASDOVePcmyFkLlpAH
 d5eEHifqAu89sIv4psIaC1dxoinP4jcuz7rPQXMX+Gn4VburfOQ6HvXxbEbpsvRt9Yob
 LeIoUgWXwESHblEXTHQctyXkNvStn8kQnmvZt6R/32dH7lvMEQpyh5sLmtH6R8jXyxOo
 Zs+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj8pnDHlDygM8c1XkamWCEfc4iA3VfQT/6FLib43gjvSElcUNuSCa10Djer60yuv32DXCrzf+Y/Cafm3l/62z1K3Sp4Xew/tyA3YvffESA
X-Gm-Message-State: AOJu0Yz2OUxpbf46pdO0cM+k1elZthSuUFDcKN2pdGEPRdusAJURs+87
 nixwCbg9sc5gqTm6iCd0YP7dv5oB0XF2uizIc3cALcvAFPjjX8Ght40Cte1O+go=
X-Google-Smtp-Source: AGHT+IGZrZk7jaoMjvXiFC3UYLQHz0/e2fTYO9VQm5c70FoNXeWhEkIJb7cyw4px5GhwxWGv7z/G1Q==
X-Received: by 2002:a05:6000:a86:b0:34c:f507:84b6 with SMTP id
 dh6-20020a0560000a8600b0034cf50784b6mr1047368wrb.41.1714634850581; 
 Thu, 02 May 2024 00:27:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adff4c4000000b0034cee43238fsm533563wrp.27.2024.05.02.00.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:27:30 -0700 (PDT)
Message-ID: <9598098a-183f-448b-91ff-b60decc8218e@linaro.org>
Date: Thu, 2 May 2024 09:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/9] drm/mipi-dsi: mipi_dsi_*_write functions don't
 need to ratelimit prints
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Brian Norris <briannorris@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj
 <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.3.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
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
In-Reply-To: <20240501084109.v3.3.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
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

On 01/05/2024 17:41, Douglas Anderson wrote:
> We really don't expect these errors to be printed over and over
> again. When a driver hits the error it should bail out. Just use a
> normal error print.
> 
> This gives a nice space savings for users of these functions:
> 
> $ scripts/bloat-o-meter \
>    .../before/panel-novatek-nt36672e.ko \
>    .../after/panel-novatek-nt36672e.ko
> add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-16760 (-16760)
> Function                                     old     new   delta
> nt36672e_1080x2408_60hz_init               17080   10640   -6440
> nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
> Total: Before=31815, After=15055, chg -52.68%
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - ("mipi_dsi_*_write functions don't need to ratelimit...") moved earlier.
> 
> Changes in v2:
> - New
> 
>   include/drm/drm_mipi_dsi.h | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index e0f56564bf97..67967be48dbd 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -314,17 +314,16 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>    * @dsi: DSI peripheral device
>    * @seq: buffer containing the payload
>    */
> -#define mipi_dsi_generic_write_seq(dsi, seq...)                                 \
> -	do {                                                                    \
> -		static const u8 d[] = { seq };                                  \
> -		struct device *dev = &dsi->dev;                                 \
> -		ssize_t ret;                                                    \
> -		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));            \
> -		if (ret < 0) {                                                  \
> -			dev_err_ratelimited(dev, "transmit data failed: %zd\n", \
> -					    ret);                               \
> -			return ret;                                             \
> -		}                                                               \
> +#define mipi_dsi_generic_write_seq(dsi, seq...)                           \
> +	do {                                                              \
> +		static const u8 d[] = { seq };                            \
> +		struct device *dev = &dsi->dev;                           \
> +		ssize_t ret;                                              \
> +		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));      \
> +		if (ret < 0) {                                            \
> +			dev_err(dev, "transmit data failed: %zd\n", ret); \
> +			return ret;                                       \
> +		}                                                         \
>   	} while (0)
>   
>   /**
> @@ -340,8 +339,7 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>   		ssize_t ret;                                                \
>   		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));     \
>   		if (ret < 0) {                                              \
> -			dev_err_ratelimited(                                \
> -				dev, "sending command %#02x failed: %zd\n", \
> +			dev_err(dev, "sending command %#02x failed: %zd\n", \
>   				cmd, ret);                                  \
>   			return ret;                                         \
>   		}                                                           \

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
