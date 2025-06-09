Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F4BAD2502
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:34:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F3510E164;
	Mon,  9 Jun 2025 17:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LRbvoeYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFA610E15E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:34:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45310223677so11817015e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749490448; x=1750095248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=;
 b=LRbvoeYqXD4uhdkpNS1IUjE9Eu1KRaGTesGF9X3YHVfZ25Gj+mw21pIvLsRg+uyWa6
 7FFrzNYmndQJp7cxO0VytcTNJ9usORNFcr9kW5jLacyodV1oMlvEH+ju8aHftci3wW/D
 toGlAHoLKuJ9c1NlEqaQ1MKu6b82g5GuMPNjxpVxz8iuU7XE/lPfMEXTyjWVoi13MQOD
 I3J+LbTpOwuzEunrsZ4FGafKC/zPIML1JNl6n/xiewq3DBf1whuT10jxMaQYJsE2KI3n
 AU5RDuf/AtQfP37chu8m5R4bUoZqXecFtrjn+H/GCdRUy1ch81VE7KhNbrwgd0VPVKAW
 zo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749490448; x=1750095248;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZCNoRj8OvkbWY83EWwe7S1ChrayvpWwSG5jIbf3fsDA=;
 b=Oa4QG5dLYict2Wx4IjZrbCNEL2hzLUaU4ngf+l96hfOJhXwYvCGJPD76PQO086QMna
 HFxQPD+NwqOALQpJOSmGrYlgL9dcPlJKW4o0WWRWw87fQ85ivj/IJMSLTjepnYCPvdwv
 eRfqipl4GMqpc8JeuVKAvmFmtjLDW6G49rrUcq6qEMuAPr2wmaOvCT8afAQQLMLjLpvl
 tiwlbY39pAChpKKGZBZD6vUNblzj8wcDEbd7xvEM0n++e9hHdlLCbwaqm5/bGTPfws9p
 iJH8ZM63xmJnOuHD7laMZQlvJIQyduRGHUr5qaiC0XOI9+sQNHruunaEqqESOFDvjtPO
 mdew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWClXyaPkiDWUe6ZMH0GvqpejAgo3WUjB9NvP+pSVehcq5d+l7yiNXLDoZxxEVECrTwt4bqdt+E2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKhzvlTl0oYf8dogt86IjZ8ym0VmLWwTVElF37OzcLpaR3oTjw
 /vIUvbn/ZCvakOsbYqnhxv8CQEz7ypDNXFBKX9H/gUv0fTFbU6uAxs52J4CYO5vCCro=
X-Gm-Gg: ASbGncs6rwkQyTPQZFMbp2dx4wgcQGx5umK2qPONOUQciwLH5fEOJE/KqKJUPgWj2p/
 3NgoXAbT8XO+ztEHabwL/MYKodn56ZaQYo/TikAzwdHm8HnW7/a6JLV6Zcycj68xYG8fX7D3yV1
 byX02AHHLWxJpYhrR++ddjDRhXIR7bi9hPfhKc+7YbyWw4TjCXD6xcHdlPi39K1DtzZ1y2WxT+H
 xNLMVD9OrBZU5XSDXTrmrz1+9k6ogPbnEzrNMsw76Ff2Y7ZWOvPV/bBcc49bhFXkVoCPcByQHE7
 lq0UWTgrxbTVsAqMMdckPHz+muKIA314YHGR3403XFMSelBrEcEN20IhNFDS4FPett+e0FpqGhs
 3o4StHnWlHxdHzb/QV3xzspWY4zfJ
X-Google-Smtp-Source: AGHT+IHjGXyFvXdDAggENskwqk5z1F3qFDATDXWh/Gh5Xbnntn1Cd+D5lXKZIFiINl589SC7CggLdw==
X-Received: by 2002:a05:600c:8b23:b0:450:d37c:9fc8 with SMTP id
 5b1f17b1804b1-452013898d8mr137331575e9.13.1749490447982; 
 Mon, 09 Jun 2025 10:34:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d049:de0c:efef:b94d?
 ([2a01:e0a:3d9:2080:d049:de0c:efef:b94d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730d162asm113789415e9.39.2025.06.09.10.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 10:34:07 -0700 (PDT)
Message-ID: <6400f504-eef7-489d-bf06-4a0a13cd5ee5@linaro.org>
Date: Mon, 9 Jun 2025 19:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: fix debug log statement when setting the HDMI
 clocks
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250606203729.3311592-1-martin.blumenstingl@googlemail.com>
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

On 06/06/2025 22:37, Martin Blumenstingl wrote:
> The "phy" and "vclk" frequency labels were swapped, making it more
> difficult to debug driver errors. Swap the label order to make them
> match with the actual frequencies printed to correct this.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 47136bbbe8c6..ab08d690d882 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -109,7 +109,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_encoder_hdmi *encoder_hdmi,
>   		venc_freq /= 2;
>   
>   	dev_dbg(priv->dev,
> -		"vclk:%lluHz phy=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
> +		"phy:%lluHz vclk=%lluHz venc=%lluHz hdmi=%lluHz enci=%d\n",
>   		phy_freq, vclk_freq, venc_freq, hdmi_freq,
>   		priv->venc.hdmi_use_enci);
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
