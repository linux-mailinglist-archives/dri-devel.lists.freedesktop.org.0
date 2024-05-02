Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE08B9541
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6263610F0B6;
	Thu,  2 May 2024 07:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XnypiC2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1D810F18B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:26:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-34d99ec52e1so1487066f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714634817; x=1715239617; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8dbcRFL3bbaSJtF8rDYaaiQD+vlLekDK6bfj3XLa4Qk=;
 b=XnypiC2CkfKLPj7fui7Yce5b0pIZiQgAyMuuvSqPNnvzDHqXmtD7LRctRoo8WTIt/m
 7adC2SQ6WzPQKQIcseXjyH5xcNHTRBb+yJo35xfT1M8QWT9p6+DxCbt3HB7S/TkL3ki3
 CtIDXdIDi+rrAK2P+KmME2fv6DUwMLVM5OcBxul8DpAgOL301kViiZPq8LgW+iQElXRN
 w3h24Ci4+4AgyYp2mMB0qi4/FxyeIdeSRQ83nXlGTObCHLsQQomguNAWjuYIQ6HkpLe0
 OZscCOF954hnmpP0bjdMUTAxlU4iZP+WE8M55R6x5K+hTqiRwTW94e+tGvzCnWeGIMDg
 aBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714634817; x=1715239617;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8dbcRFL3bbaSJtF8rDYaaiQD+vlLekDK6bfj3XLa4Qk=;
 b=B4UXw5SKjGhWQq4xGsQH5sLntKmM/zQ179/jDLw5ezDeN8DmK1nI5TGFUuBVB9/vsY
 RSFZ+DsqWRocv0qGxGdPQDiW6u4iqfnLxbxiD2VAMX/nSfBXwrksLCX6mohxN4U9nfGF
 8Qcq+JAxMyy37shwd2Gict07KKISaeEUqxP4Yf0cxRMtM2GuMLRFUph8zzqBMv84RbGX
 Za55UCPbvG1FlIA+kYL7knrPWvVoPgctFEuuCtbi3GHpoiJ8bNh5LF0a02U9SWJPWXQy
 jTM1VH6utxcMerGvUIopkWdnwyWv+s2Ga6PlOY4LqvCnc21zBUQmwYPXvOhF3fQ2356U
 Mn+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP3fMNBGTWiJpfK9d7/ibA9yTTHoQlIjFwmKDoPFWHUp+G6/VkzBioP38r44RjKVTbNgCkOlWBOwHDIr7ouLL0AKVrIseBKBh/rV2Im2jy
X-Gm-Message-State: AOJu0YwxBlqqRHcWyuKXMw1cyyIHD3LeH9ETx8SKpur4FjGcUZI25fiV
 xmmVhnV/DmilILVSVxV3P4zFY8upHDnrCrDgzLDcvWvDGNNFWTCx1NsZ0D+RADg=
X-Google-Smtp-Source: AGHT+IHrqrsPqXn+fEJXHMqDV+NDZYVzMhuGrszsQCr1pQWz3/5/O9PvQG/wPbf+n4hEZT/y4GCa3A==
X-Received: by 2002:a5d:474e:0:b0:34a:cc2:1a34 with SMTP id
 o14-20020a5d474e000000b0034a0cc21a34mr2585855wrs.42.1714634817574; 
 Thu, 02 May 2024 00:26:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 e3-20020adff343000000b0034cf50704a9sm535576wrp.24.2024.05.02.00.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:26:57 -0700 (PDT)
Message-ID: <f9adb530-89e6-40f4-af00-c6b407908817@linaro.org>
Date: Thu, 2 May 2024 09:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_generic_write_seq()
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
 <20240501084109.v3.2.Iadb65b8add19ed3ae3ed6425011beb97e380a912@changeid>
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
In-Reply-To: <20240501084109.v3.2.Iadb65b8add19ed3ae3ed6425011beb97e380a912@changeid>
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
> The mipi_dsi_generic_write_seq() macro makes a call to
> mipi_dsi_generic_write() which returns a type ssize_t. The macro then
> stores it in an int and checks to see if it's negative. This could
> theoretically be a problem if "ssize_t" is larger than "int".
> 
> To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> 16-bits, you could see a problem if there was some code out there that
> looked like:
> 
>    mipi_dsi_generic_write_seq(dsi, <32768 bytes as arguments>);
> 
> ...since we'd get back that 32768 bytes were transferred and 32768
> stored in a 16-bit int would look negative.
> 
> Though there are no callsites where we'd actually hit this (even if
> "int" was only 16-bit), it's cleaner to make the types match so let's
> fix it.
> 
> Fixes: a9015ce59320 ("drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Use %zd in print instead of casting errors to int.
> 
> Changes in v2:
> - New
> 
>   include/drm/drm_mipi_dsi.h | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 70ce0b8cbc68..e0f56564bf97 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -314,17 +314,17 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>    * @dsi: DSI peripheral device
>    * @seq: buffer containing the payload
>    */
> -#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
> -	do {                                                                   \
> -		static const u8 d[] = { seq };                                 \
> -		struct device *dev = &dsi->dev;                                \
> -		int ret;                                                       \
> -		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
> -		if (ret < 0) {                                                 \
> -			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
> -					    ret);                              \
> -			return ret;                                            \
> -		}                                                              \
> +#define mipi_dsi_generic_write_seq(dsi, seq...)                                 \
> +	do {                                                                    \
> +		static const u8 d[] = { seq };                                  \
> +		struct device *dev = &dsi->dev;                                 \
> +		ssize_t ret;                                                    \
> +		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));            \
> +		if (ret < 0) {                                                  \
> +			dev_err_ratelimited(dev, "transmit data failed: %zd\n", \
> +					    ret);                               \
> +			return ret;                                             \
> +		}                                                               \
>   	} while (0)
>   
>   /**

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
