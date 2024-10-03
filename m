Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D677598EE91
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B63110E822;
	Thu,  3 Oct 2024 11:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="slv+exgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717A910E823
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:55:29 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37cea34cb57so634970f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 04:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727956528; x=1728561328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ab2R4/kCazlaYiRKlRL0Q879kkxP9RVXhQRJAU5QMOs=;
 b=slv+exgyuEKNPej0HxNNlhr6qfkg8V4jVv9oRdDmeZVlJa9TmWDiB3NtcSSH4cRwPj
 8vD8GbEN4UUtQ6I9DehyXUpFsdbCOVwkhnlAbl3KiRbj1oWA+N99dKDobSXqijwOQaAT
 FE8FCv2F8m0K67m3rIhG+LTN+wmG8fXLMLAmcA9vd4oWxabqRYlw3bYKFd44Csrs+vDz
 iNQz7V9FuEYHRZeRUGdNaDt7Ezk8Tjwm//2qtYeQDai/hoPgSfARzOSBUnghyZhH+Oga
 m52Cv8HKTsGSluD2rbhZ+iIJ7VumDoQV/yk93sxF0KWu0mXjcWakSKxIqtaWPjJyE6f6
 LQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727956528; x=1728561328;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ab2R4/kCazlaYiRKlRL0Q879kkxP9RVXhQRJAU5QMOs=;
 b=Stj/9O16vx4Qf6Tmnohe07okH/p9nK2KefT7eiVtziAYijOs45SZC+sOW+0lc7nXTZ
 J8awIWbgvXkanKj3Wnx9J+PisOQfxQr/ZfWxaGR5U1aNjrUEY10U1Mrqlc1Fx09C+YDI
 sNKld1HaIH1VjjwCuyum1M7kld+BNv3zs8JuEeoAZsfFEPVupBrmJEpXXei0PXQxzsn1
 xXDI+2UwqRzlBk249iyPcGqrP1M8hKLk5MWbdjf7iJf4zwQbJQa8oXJs077RRYakuvOm
 a9mewBMmiKfH5CNLIQ9bOvHCmeLAg9RUM3t3AVNzW6oogppQ1oRgNgRKB/ADSHBbwXU3
 nqGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuOSh9pY+a8jHuQOkXI7k8hdQMo12Saz4rlgRoZN3wPpMrfaOSTrF99gA0hV1ft/qTtpzwHLKKejI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcomMNQk/bZr+pDOq2SvTtaCKdUymjm/t8j9WFIkmPNzYrj/mR
 MAgt0zjtoqB9akvDzPfW07M9mNkvmmkXGSSBRGt/3Y/b/ee/024QE4bBRKqT21QqacOrVPkT0Vf
 E/qs=
X-Google-Smtp-Source: AGHT+IHKkgKdKG0k1hqIM9d4fDHkrFEKwWLLdhNb4lgY3k1F+nM7LOLAqJc+U0jg5McKkr6iIe+jqQ==
X-Received: by 2002:adf:f70c:0:b0:378:8dea:4bee with SMTP id
 ffacd0b85a97d-37cfb8d0a68mr3759720f8f.33.1727956527703; 
 Thu, 03 Oct 2024 04:55:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e534:c027:e113:29a1?
 ([2a01:e0a:982:cbb0:e534:c027:e113:29a1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d082d20bcsm1112388f8f.100.2024.10.03.04.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 04:55:27 -0700 (PDT)
Message-ID: <13b81191-b647-4577-a92f-b98c521a7727@linaro.org>
Date: Thu, 3 Oct 2024 13:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 10/10] drm/meson: Allow build with COMPILE_TEST=y
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
 <20241003111851.10453-11-ville.syrjala@linux.intel.com>
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
In-Reply-To: <20241003111851.10453-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/10/2024 13:18, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Allow meson to be built with COMPILE_TEST=y for greater
> coverage. Builds fine on x86/x86_64 at least.
> 
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: linux-amlogic@lists.infradead.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/meson/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
> index b410e0d8015a..417f79829cf8 100644
> --- a/drivers/gpu/drm/meson/Kconfig
> +++ b/drivers/gpu/drm/meson/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config DRM_MESON
>   	tristate "DRM Support for Amlogic Meson Display Controller"
> -	depends on DRM && OF && (ARM || ARM64)
> +	depends on DRM && OF && (ARM || ARM64 || COMPILE_TEST)
>   	depends on ARCH_MESON || COMPILE_TEST
>   	select DRM_CLIENT_SELECTION
>   	select DRM_KMS_HELPER

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
