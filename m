Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A68A08D99
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAD810F06A;
	Fri, 10 Jan 2025 10:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cpkNnPcC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F03910F062
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:13:05 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so19971165e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736503984; x=1737108784; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=QOUzYhTzRbU2PZyaCr9aEEOmHEzU4GQv9eiFuMaGvrQ=;
 b=cpkNnPcCmur3cAybnPMcrMRhyC4yK3aqWWearbVIWL/YzaiTv0rjvYkFRWF+jK0LCS
 3azEjt/KBd3c3jZD9HT0gfMi6U9rGHmQ3DzQ2xFmQRMwRBCHCTWN3QizHQaWjHPETbdG
 51oruBvs5SiCiAcymRdaJ3LG/tvPGLTdjpEUWPGrTlurk//4r+rviKvD5AQDGMzTJ3OM
 n8ei051B5tBxbGFwy6obM58xR8R9GjNWr+7v4XkKBWLkJCDeRwbF6uKx57CYsbDGGjdf
 s9shHb8KHU3oBjjT/kfF//cZPDg+pK+CsjZ7w6EKsxsCjkDKD3DLUufP4NMPmjZ+B7RI
 hZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736503984; x=1737108784;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QOUzYhTzRbU2PZyaCr9aEEOmHEzU4GQv9eiFuMaGvrQ=;
 b=veK3Z/V5vyDzlQolAQzRSHsDkXQeCCCygLJnYg6jebFOWJO70cP0aJZAlYdlWi30z2
 2H8Lclk1mUceurvqK/kzb7Chs1YIdGh8N8O4GTC49WafSF9GmBH0zVX84DWKMpmvizx+
 Fy6mfDZFUWlcSMKl189vSObuRQVav5i99rKkIYyN2UOKbL1WB2HAno8yaVKUcIYxBDC4
 q1koli5Z/Ax5IPTvAFBkK16SknoYXWK/GG096p+hrteugBkM4Ek7mqu/oKCKcRDAPET3
 mvyB3Q991AM5ok6s5YJOxW1qAlH+770oWz+CfT+H0Yz7PJ85EvsAOM1OcsYA9ntX4x60
 9JQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvMeXss3cKiCnBY9fPWytobhp0fk66vZdXtP45bFvXWMvZIjkjpMu20HxudQT5QkoOgZu5k28VNuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMndr7sx81ayNTl28W1ZdTk+dJ8ufiAPOGWrB2BlXq0e6+9YB7
 n2uHiYGMLqSnQSUH1L7XuDCTZ/Vci2yLthmImNIItmm0giY8S7+0lJNUKgeDb38=
X-Gm-Gg: ASbGnctRuOaVRiZv/QPQf0rlnebQ8yjvI/dt2IfLOQfKLZtBLCBQDqQfRMy/noxYfx6
 7AADLI5lOxnNYO5aU8jctfCz34aorXtSNzEeReOGr5Hct2dPbceiMsygD8hAL8IKT1cnmOM/Vrf
 DncjE4zGjJmIilau3/1tXvSXI5kWiTERJxQeBj+3D5yHPcuCDZawmLLPohxsoBOLRWbS8qWVFTK
 o9ZDAKj9OI/7FFhzmphH4nW8ds56cAPru4r/FU04xtjNR9x7bzaqMl5rL57gKNsYMYqrETXYBNz
 GE22zrnlA6yb5E7oEcuwFNrvEU7i37CXCg==
X-Google-Smtp-Source: AGHT+IH14VgpNAHxLDfw+eb1nzA4fydxlf+fdVrPXOSjYG/N+CGyBX4YnPcgAjL/ozrdB+dQhWcohA==
X-Received: by 2002:a05:600c:46d2:b0:434:a1d3:a321 with SMTP id
 5b1f17b1804b1-436e2679db4mr91257665e9.3.1736503983816; 
 Fri, 10 Jan 2025 02:13:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8?
 ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc895esm47221015e9.13.2025.01.10.02.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 02:13:03 -0800 (PST)
Message-ID: <bca7f65c-cdb8-48be-a800-2c36aeeeb8e3@linaro.org>
Date: Fri, 10 Jan 2025 11:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] Revert "drm/meson: vclk: fix calculation of 59.94
 fractional rates"
To: Christian Hewitt <christianshewitt@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250110074458.3624094-1-christianshewitt@gmail.com>
 <20250110074458.3624094-2-christianshewitt@gmail.com>
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
In-Reply-To: <20250110074458.3624094-2-christianshewitt@gmail.com>
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

On 10/01/2025 08:44, Christian Hewitt wrote:
> This reverts commit bfbc68e4d8695497f858a45a142665e22a512ea3.
> 
> The patch does permit the offending YUV420 @ 59.94 phy_freq and
> vclk_freq mode to match in calculations. It also results in all
> fractional rates being unavailable for use. This was unintended
> and requires the patch to be reverted.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/gpu/drm/meson/meson_vclk.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
> index 2a942dc6a6dc..2a82119eb58e 100644
> --- a/drivers/gpu/drm/meson/meson_vclk.c
> +++ b/drivers/gpu/drm/meson/meson_vclk.c
> @@ -790,13 +790,13 @@ meson_vclk_vic_supported_freq(struct meson_drm *priv, unsigned int phy_freq,
>   				 FREQ_1000_1001(params[i].pixel_freq));
>   		DRM_DEBUG_DRIVER("i = %d phy_freq = %d alt = %d\n",
>   				 i, params[i].phy_freq,
> -				 FREQ_1000_1001(params[i].phy_freq/1000)*1000);
> +				 FREQ_1000_1001(params[i].phy_freq/10)*10);
>   		/* Match strict frequency */
>   		if (phy_freq == params[i].phy_freq &&
>   		    vclk_freq == params[i].vclk_freq)
>   			return MODE_OK;
>   		/* Match 1000/1001 variant */
> -		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/1000)*1000) &&
> +		if (phy_freq == (FREQ_1000_1001(params[i].phy_freq/10)*10) &&
>   		    vclk_freq == FREQ_1000_1001(params[i].vclk_freq))
>   			return MODE_OK;
>   	}
> @@ -1070,7 +1070,7 @@ void meson_vclk_setup(struct meson_drm *priv, unsigned int target,
>   
>   	for (freq = 0 ; params[freq].pixel_freq ; ++freq) {
>   		if ((phy_freq == params[freq].phy_freq ||
> -		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/1000)*1000) &&
> +		     phy_freq == FREQ_1000_1001(params[freq].phy_freq/10)*10) &&
>   		    (vclk_freq == params[freq].vclk_freq ||
>   		     vclk_freq == FREQ_1000_1001(params[freq].vclk_freq))) {
>   			if (vclk_freq != params[freq].vclk_freq)

I wonder if a Fixes is also required here
