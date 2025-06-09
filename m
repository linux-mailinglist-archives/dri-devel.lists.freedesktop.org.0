Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B232AD2503
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 19:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E570610E237;
	Mon,  9 Jun 2025 17:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S0POP8uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10A210E15E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 17:34:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3838738f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749490454; x=1750095254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9BmRKlj/RMDP5IzXSFzdO4da8XFCR2YzozS+rvgK1WE=;
 b=S0POP8uvp1hEHIL0i/M1nWpNmPeStdU1lXbTBn3IIdbG0pFctAZPNA2j0CU0yajGuB
 u4IMMuDkrSWXDiZW6s4u3D2qHj8OVrIBP8v1+etDlVfsiAo7dZCP5nnMFQmGC/NHI2qe
 i9BfLPYreW6jHrvoWSdBA52tqydkCvg95at94qgRDBA0lE/G2h3/IUrwX0CvwAmypiMa
 dinBRxlrCJgWwfY8L09tqMfCbylshinPfCi2GRaOj4p72hZzv3ckGoJ+bdOyL3RXdkSB
 Q9LcfgRa9zwQnzZr60HgrlvOGoECUns2dmaZN5+u2AZ5xzudno3q+k1FsWWu75Jv7FP4
 zG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749490454; x=1750095254;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9BmRKlj/RMDP5IzXSFzdO4da8XFCR2YzozS+rvgK1WE=;
 b=j169s0xfND9G+8hSreEF+GFeqB3j9Zocqnu7aE81/rwcHTG77oLS745mrH2lo8IR9F
 5rOAUZA/cMNKxJrtAwCxNxtupGbQ2u0Yx2DAlGAJmXbTpk4KhQ7WZMcGvGatXqof9/0L
 wUCQaDE4yBQ+tzfHN5dQVoAl9XHtvAvVzTiQGtURGRFRcAzTNNU1IoipW6tO5IFa/HTm
 w3t1X1wVC5er+Pvl6Lzssqwmt90B2UPm+MZvyXKHNkyClw0j3zvSwjr3JAbSZ6ehQGVP
 1VDRiC/HKwKvhw9fOSiCbAe2tAQ6sD6a1Vo5Z3I3xwUJ3bjkbgwRBcuoiLhm021yExHj
 jb8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ZdIMCQxVVlMYdnAjq/v9YJStwqRmhc5VQ/X3wWJq0n2hxVDocmcuNF++dO7hOmBwqwlGzuBNOiA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzY9JBRLjpzS78jT7JyzOkl7Ny98B7ZP0tYR+MckkaNJ34yhwQ5
 boglJwKkRHmfoMofZJ0Jve1Dg41/mRh+/FMGNdv90Hkwgt5GWiW0K6TgnMM7PwOZp1o=
X-Gm-Gg: ASbGncvHP7DbYXeu6JDWjmapAtpmOIZbgfxXWdR5nVgBSDR4cVT8saCwPZXcX0PkYub
 fmhocstGgdUCo2zxPwMyyDiInRgcq0FerjxeQhahQozw+gcQl4EKGn1jpvcdHrHUBNHah/nXPuz
 ORBHDNNmw+JlXxQJZiuRTh9umCeMXBi3j0fywWy4fcEDeqfFt8ckTOJgzgZEaTwm8DhQr5jRaLM
 HfL/RlcWqoAjhvz0KWoJSqMe+hGyfjiSMvZtM4of46sJUPmtJJKrhWDo7UO9li7+q1hDg1RrU3x
 B7YG6S52eFz0/Fe5zJTTJEzKfVGCE6n8SMR4ZKo+YWZrexHUtPIsJO96YidDjSll2DNd+iJIPlg
 l4qOx40PD9r+Wb3AphzXFkR50KUxk
X-Google-Smtp-Source: AGHT+IGkaYk2ZR7eBVSuTYhU38XKPy8+5RJ/cs78kF616gKs+MS4l8QgLXSnlOu4Zk+j1JmLSxgFAw==
X-Received: by 2002:a5d:64c6:0:b0:3a4:eb7a:2ccb with SMTP id
 ffacd0b85a97d-3a551417255mr318548f8f.16.1749490454350; 
 Mon, 09 Jun 2025 10:34:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:d049:de0c:efef:b94d?
 ([2a01:e0a:3d9:2080:d049:de0c:efef:b94d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730d162asm113789415e9.39.2025.06.09.10.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jun 2025 10:34:12 -0700 (PDT)
Message-ID: <04556296-bcda-436f-b462-6b1718dafd00@linaro.org>
Date: Mon, 9 Jun 2025 19:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: use vclk_freq instead of pixel_freq in debug
 print
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20250606221031.3419353-1-martin.blumenstingl@googlemail.com>
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

On 07/06/2025 00:10, Martin Blumenstingl wrote:
> meson_vclk_vic_supported_freq() has a debug print which includes the
> pixel freq. However, within the whole function the pixel freq is
> irrelevant, other than checking the end of the params array. Switch to
> printing the vclk_freq which is being compared / matched against the
> inputs to the function to avoid confusion when analyzing error reports
> from users.
> 
> Fixes: e5fab2ec9ca4 ("drm/meson: vclk: add support for YUV420 setup")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 3325580d885d..c4123bb958e4 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,9 +790,9 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv,
>   	}
>   
>   	for (i = 0 ; params[i].pixel_freq ; ++i) {
> -		DRM_DEBUG_DRIVER("i = %d pixel_freq = %lluHz alt = %lluHz\n",
> -				 i, params[i].pixel_freq,
> -				 PIXEL_FREQ_1000_1001(params[i].pixel_freq));
> +		DRM_DEBUG_DRIVER("i = %d vclk_freq = %lluHz alt = %lluHz\n",
> +				 i, params[i].vclk_freq,
> +				 PIXEL_FREQ_1000_1001(params[i].vclk_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %lluHz alt = %lluHz\n",
>   				 i, params[i].phy_freq,
>   				 PHY_FREQ_1000_1001(params[i].phy_freq));

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
