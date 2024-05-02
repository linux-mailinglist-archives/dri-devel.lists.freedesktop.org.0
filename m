Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3878B953F
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 09:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7974D10F0B1;
	Thu,  2 May 2024 07:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vk3ENluz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AEA610EF5E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 07:26:47 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-34e0d8b737eso296175f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2024 00:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714634805; x=1715239605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=mjdQzJy2V/Q1bUVqpj1pVEcq/z2P7zwJKAsgjhZLMPc=;
 b=Vk3ENluzMdMNM6Mo2rTS4Zv/o//laMaSoypH2JVubCTIC2hx2P/DJCHHE7xZlUsyGU
 OY5R9k1LN56uWn8MabfBztp68TJQGpihAiqSHS26pwQEMV7ilVQ/ySgT+q+Zla3cyj2B
 C0lmC4StTWvI4MgfMYMaOk2Q8W6Z4h3nrbtidX1ZLIyOr7OwFXbwF/aP4rliWjIhEp2F
 iRosvYIVD/tVqWMSFEsQzBQRJgpHN8zgsgrRS8EAh/bVX8UEdRBcDl1QS1om9D18x7vy
 wfio6VMMp9xNpwX7Q04RRtGiyN7K4ymGkvIIcKq/MNM8HvTJ2dmYK2Jhmo6rvNv3L3oF
 HAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714634805; x=1715239605;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mjdQzJy2V/Q1bUVqpj1pVEcq/z2P7zwJKAsgjhZLMPc=;
 b=qXJa853EskzVVVRqFxaD72/9o3jyWHT3OUZOiHFNzZMvwFYDrT9VPAyFTMWMsPR+Fv
 uUwIcgODdGq9kfwuLAsHe162DMhLOEK9wSwyLIe5egJ3KRP3ryo6LgnZk1120wgP/5Gq
 +LJ0e236TbM3sHdvTQKvpSGGaIsgtSPCgGj29zg3Z1p1o4DPgEVKCb8QXFmbf2dbAFSK
 TCeMVRd5U34nzczM5C6OrLes7LtlU3lNp2xxDp1mi7hLRO93E6lX/EjUg/vEwIz4DO+V
 rQtobXD/js0FxJR1miXkDD1yE9ZjL+ZIw+Gy0F1dkvgndm0sDPe7hOWFOhHJ406FmZHG
 5uNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNvN9rMRgMj56FC+BIUQvWcGcJxa4eGuz6Jgn7musxUJtBfss2ccx3jHI1p6DuE0EA/Is8P4vnkUf1gkKE6XRc1Usqxu2K5+8BP1r34N9l
X-Gm-Message-State: AOJu0YxTNcUBjgSWbprlbt5+8rWzazWlySTdIPf/okDGpPMWfCqW2uHj
 1BEDuG26hYvaWgoPJ+1dUu6rHW63cvyihFyhvYnNtWu/vGTLSNWTd/q4/9ESz4E=
X-Google-Smtp-Source: AGHT+IEuGpDRuktlv4mA7YsG01SP6YdHxz2XyVX05/QChJona79IChxesgyQS2TZSsexDwYXuHLHGA==
X-Received: by 2002:a5d:440b:0:b0:343:8485:4edd with SMTP id
 z11-20020a5d440b000000b0034384854eddmr1281995wrq.23.1714634805121; 
 Thu, 02 May 2024 00:26:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:67e2:5e2:652b:4129?
 ([2a01:e0a:cad:2140:67e2:5e2:652b:4129])
 by smtp.gmail.com with ESMTPSA id
 h4-20020adff4c4000000b0034cee43238fsm531872wrp.27.2024.05.02.00.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 May 2024 00:26:44 -0700 (PDT)
Message-ID: <ffce0bd4-6bd2-4197-9f89-b312ad7eabe7@linaro.org>
Date: Thu, 2 May 2024 09:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/9] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
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
 <20240501084109.v3.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
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
In-Reply-To: <20240501084109.v3.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
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
> The mipi_dsi_dcs_write_seq() macro makes a call to
> mipi_dsi_dcs_write_buffer() which returns a type ssize_t. The macro
> then stores it in an int and checks to see if it's negative. This
> could theoretically be a problem if "ssize_t" is larger than "int".
> 
> To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> 16-bits, you could see a problem if there was some code out there that
> looked like:
> 
>    mipi_dsi_dcs_write_seq(dsi, cmd, <32767 bytes as arguments>);
> 
> ...since we'd get back that 32768 bytes were transferred and 32768
> stored in a 16-bit int would look negative.
> 
> Though there are no callsites where we'd actually hit this (even if
> "int" was only 16-bit), it's cleaner to make the types match so let's
> fix it.
> 
> Fixes: 2a9e9daf7523 ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Use %zd in print instead of casting errors to int.
> 
> Changes in v2:
> - New
> 
>   include/drm/drm_mipi_dsi.h | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 82b1cc434ea3..70ce0b8cbc68 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -333,18 +333,18 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
>    * @cmd: Command
>    * @seq: buffer containing data to be transmitted
>    */
> -#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
> -	do {                                                               \
> -		static const u8 d[] = { cmd, seq };                        \
> -		struct device *dev = &dsi->dev;                            \
> -		int ret;                                                   \
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
> -		if (ret < 0) {                                             \
> -			dev_err_ratelimited(                               \
> -				dev, "sending command %#02x failed: %d\n", \
> -				cmd, ret);                                 \
> -			return ret;                                        \
> -		}                                                          \
> +#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                            \
> +	do {                                                                \
> +		static const u8 d[] = { cmd, seq };                         \
> +		struct device *dev = &dsi->dev;                             \
> +		ssize_t ret;                                                \
> +		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));     \
> +		if (ret < 0) {                                              \
> +			dev_err_ratelimited(                                \
> +				dev, "sending command %#02x failed: %zd\n", \
> +				cmd, ret);                                  \
> +			return ret;                                         \
> +		}                                                           \
>   	} while (0)
>   
>   /**

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
