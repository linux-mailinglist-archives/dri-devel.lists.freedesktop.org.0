Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FDBABD039
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3586C10E0E4;
	Tue, 20 May 2025 07:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nfIOg4t4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E788410E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:19:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-442ccf0e1b3so64489115e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747725595; x=1748330395; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=KrzFoxLHFMtpD5f0JYG/xNNGE+0bd6VyS7moHsbEFaQ=;
 b=nfIOg4t4ZvctrmcR926NS/VREgiQL02dhfOcZZrOM/IEfkjre1LoTDwzqWwW2YD/d/
 HcYQ1Rc72g51E9rb5N4Bd5S/8MG51Mn5kj3dbQi2Ilowh1TBol7PqYLP90CQ+33bxCPC
 9jjcmkJxP+zXMJzyYXuO3BmXTHah6ya8mbR/pOIWI6x9TlpRVGt+xBXV+FOPwJ1+TiBF
 /LIfZIhKet1cYT2771Z3ienYB3FPa7kjHW9+I9V9Svy/e0R5YuZd0lXAilHZZD5riClx
 Qg4ipgILusmDQHLS2NoMja+g6lLxIVKQVFLR9j0yBwWR88/3oBnwEbmZhDQSKGn1U3kA
 ShlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747725595; x=1748330395;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=KrzFoxLHFMtpD5f0JYG/xNNGE+0bd6VyS7moHsbEFaQ=;
 b=VWjxTIKYSRJqW1l0y8p7MPIwQ2bxFFjwBewIQkEZhK0xqTlIQSVywhlnNU4x3FGCLE
 2W1giJtHvJPE0g6OrKPSf4qV3Fy+I8miGuXeWyOgLLPt61u3sG0OlRgg+Y7anxtYzDxC
 ttzCHodoTDTJj59iCmXdj3eVYhTjgUU5QVSas6Ha8vaW5aiOQU7ldZ7IaLJG9ECK+pSk
 nl0iLASvTVDgaDA6pKNCxkfs89UlDvOkJFIr5KRNdiVrSY7djoDjUuAgmOR8mrAnCPl5
 QL+ra7hOuTyiJOC7yP6X5/W2ccsi2JEqlqEGcWHuzczu4sJ7W6Vq3oRtnvLrNhudA6jQ
 i3Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc8VQyugc1CfP2yrKqhKGRokOVC6VftyEg36kOjNK1RNHEff16rpb2MrAew2Mhni18jbkBuWUVFp0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypU2DfQ19fg6QnOLsahw7ARhb04HQVRNKKxeZGGDEp6E1L963r
 7jPlaLspZjqxKA6WqVt8bh9pcVas7bJdoNKzFt7QqO7nPFjWA4q8h2SeKDv4sKGhpvE=
X-Gm-Gg: ASbGncsNhQS36bfw6+WtW5xAMOPztSCMTeNU7BxLqoe4IqLEELfUZ4kQhrZqCXomua4
 r+QQgDe7e8ThM9Ucv7Hw8TD4kqGJVqA6IzZxugfANTJlfQ+BU87Vjpo2Bz6VaK+Mp2KRVLYQTLh
 Che/BJfekLhyaU2ZU21c18CJskP2r3Ip6RrLppUS3CkIF+bubW94WogWO+sQzY6965eVra7ZVLP
 S2N3fEPvxHivt1wo9FxTYAh3cKFB22xZK4NVUJnqdMJOstWuo7OR3X7EreU0pgIWNQiiyRO2SFW
 eVv+fxe5rGbtHaZY8FbdtgjghvAX/XKazD3Hsh+gomonFSKHoN1fYDVt7clvakjrFStgCQTgo+d
 nGZxRuuc5dfFyzrF6jGlmmCSbWK5Q
X-Google-Smtp-Source: AGHT+IHiApHaQJ4HFVBUIlA5T8VIa8bCmFRMDdvIVfP4Qk5/4i3Sipi25obZe09eKCMes1lvmIHC3Q==
X-Received: by 2002:a05:600c:5026:b0:43c:fdbe:4398 with SMTP id
 5b1f17b1804b1-442fd60a4eemr135516505e9.6.1747725595393; 
 Tue, 20 May 2025 00:19:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ffaa75cfsm91300275e9.1.2025.05.20.00.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:19:55 -0700 (PDT)
Message-ID: <228f4064-6e6b-487b-b599-e8f65e3d8506@linaro.org>
Date: Tue, 20 May 2025 09:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 1/1] drm/panel: ili9341: Remove unused member from
 struct ili9341
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Abhishek Tamboli <abhishektamboli9@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20250519133345.257138-1-andriy.shevchenko@linux.intel.com>
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

On 19/05/2025 15:33, Andy Shevchenko wrote:
> struct device *dev from struct ili9341 is not used anywhere, remove it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> index ff39f5dd4097..2b5bd83933e3 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9341.c
> @@ -173,7 +173,6 @@ struct ili9341_config {
>   };
>   
>   struct ili9341 {
> -	struct device *dev;
>   	const struct ili9341_config *conf;
>   	struct drm_panel panel;
>   	struct gpio_desc *reset_gpio;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
