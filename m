Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E16AD87D1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F5C10E931;
	Fri, 13 Jun 2025 09:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wVpFQr1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE5F10E931
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 09:29:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4530921461aso16459685e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749806972; x=1750411772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KeL8Qu7sf4nHqQXLmDoMdNP1wTEq9OCx9eW5FTGzoxA=;
 b=wVpFQr1IFxYcxn26fE4+yM6jTXEpiHXavcaVwNyWXTCzGB8Mo4iTbxPa5+Dnd//nDs
 yayGdkccPJnlYcYbkVAboBhl0qg2gfGotxmbnDkahg6+Dxx8XLT8ulO7Hp5ufToaagnQ
 HqMMpQaObcfaX3ROZMFm6U58sbLPfNF3+RFSREb68A3Rwq4zI/ekSrmVdr4FxlVRjWJX
 Q+1GM08NAH5jfN1a35X7FVlj2/Byd2BKjRP7UQRji0MrkitTwOng2VoCjrg1k+nKwHzo
 VuFs6zapreA1UdYaNyzPTeI4tTNdiCd7GZSO6DWfAO/dea6EbEsI+DONNJgaEd5Mtn90
 Vl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749806972; x=1750411772;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KeL8Qu7sf4nHqQXLmDoMdNP1wTEq9OCx9eW5FTGzoxA=;
 b=GzXY7xfJKlTII8fnQFvQiRYWGSyftLVj/rpVkRnJlmrRXmeetkRNjiRimRXio9v8am
 9HebYXYEDfz/GNX4yfBhEANWD2cWBHt1RoITEs3QPEb5w9usaoxHlTgXa2mOJ/SpGghf
 gOkgzxOQEbFDVC++q9XFmbmmsJPQUwIgz8cyO1VQcm5D4VjxcWGoVlKCeVtfWCDPl7N0
 a/KTfPEhT+zirCWf1SUiCtw88VaPGGgCse9Ry8UGzQGBYRXo64rtRBSQqKVewagKlKqz
 Dyx5uqCSYdLNuBMDcO3kHpZUojoq7rTc+6EIr3atZD1d4Z8mXbncQ1HOlAsj3+XAdd80
 HONA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEYOXziJmbKjuF48ABxI9I5xJJPiIrpdGzvkUg6YtpxymARcxlZRl87e+UHUw1+TJitYe27WtAXqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH32F7KzcNr+77DiTzYrw8X4N7llLMq8SPxdieyAwpZSGf8jR1
 c58DqpaiCkbtwgiqailwuwK9/qRnEy94XnUDeyvDEYP434jT48NdQ7aY5cL1nMsXH+U=
X-Gm-Gg: ASbGncuY5rPfdY4Zoa59gkqgOTuUrX+ui6vIxG4Bgn4E9VT1fvuxQ66yM7OefE2EddV
 5UvVwzsrYqonMi7c2/TG3jIEhJqq84jeH1EbmjVmxUW5oCimCrGWk1/iMeTqH1xzMKCvR3lI86q
 fq8JmljbLwIHExf8lOI0ahTxOKEfuW/vKDN99eQKfFeOvLvavLsFr6R5SG3KSSb/eoCHBri/Csp
 ku1/YG0xwihfQ7VV3SofdjrAj92I5lTGqWKZf2e9+YjU8db1RPaN1rgew8FZWnwFHlANxXAhU5H
 nBG5CBHiNp1A4REaDzaGADI5sT1LWBgruvJTQKaIRsiEQUe99EPvgixQR7bVnS8GGexcsbUZABx
 +pw2CQGREImxwdnstNoLj5w098TolxGIdh+7MhxI=
X-Google-Smtp-Source: AGHT+IEzzHJggQutbv3FMIU2Sx3ItVvGBq6L+6GRQBSROzILQYMREAdEAhkrfD0tQzijGCqm9DStsg==
X-Received: by 2002:a05:600c:c8d:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-45334af6e5emr19523925e9.30.1749806972208; 
 Fri, 13 Jun 2025 02:29:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae?
 ([2a01:e0a:3d9:2080:4144:6a84:fe1d:3aae])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e13d014sm46883265e9.24.2025.06.13.02.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 02:29:31 -0700 (PDT)
Message-ID: <109b5c25-f54c-4413-aa62-8e2ae621c8e6@linaro.org>
Date: Fri, 13 Jun 2025 11:29:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Use u8 for lane count
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250611234913.161861-1-marek.vasut+renesas@mailbox.org>
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

On 12/06/2025 01:49, Marek Vasut wrote:
> Use u8 to hold lane count in struct ili9881c_desc {} to avoid
> alignment gap between default_address_mode and lanes members.
> The ili9881c controller can only operate up to 4 DSI lanes, so
> there is no chance this value can ever be larger than 4. No
> functional change.

The u8 will still take at least 4 bytes and cpu will still
do at least a 32bit memory access, so there's no point to change
it to u8.

Neil

> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index ac433345a179..84927302957a 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -43,7 +43,7 @@ struct ili9881c_desc {
>   	const struct drm_display_mode *mode;
>   	const unsigned long mode_flags;
>   	u8 default_address_mode;
> -	unsigned int lanes;
> +	u8 lanes;
>   };
>   
>   struct ili9881c {

