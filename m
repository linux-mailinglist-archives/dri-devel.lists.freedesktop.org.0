Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A81A98BAE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 15:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA5610E203;
	Wed, 23 Apr 2025 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nj9GEgqb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13BA10E203
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 13:45:35 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso30149725e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745415934; x=1746020734; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=P8QsglmHWSnLCPZZnCIb0YOMFFG7cMKbE8Tp8ziopqs=;
 b=nj9GEgqbJc0NUJbY7NhDZkkYpRZjAf99pCy/MLV6aRFKMN2itb83a1EbJ1F7buq7f2
 MkuhfRfOHxkIKnNMhWOCOYzSXnRau1cTBdWiD8KrkO2qeyN+aU+ntJq1CxVzkd4B2Wly
 tbJUVhYXGbhd8FHFoJVux+jUKtehvobVSGb5BYCuUjnc2BpLHTrco4ZWM4yF5aEU+EfP
 3BqNE3htIb1MySsbDPkHCOEcglM0cvhFIc//Fx6rkoFvDesI3AyKk7c8TdWLMKK6JI/1
 r/Bp7eUeacNr9kWpoLD/a1qlgCIhhT1ifHnUrp3Jc37nXs97X9doxsjjxPyoI3p/QM99
 Mjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745415934; x=1746020734;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=P8QsglmHWSnLCPZZnCIb0YOMFFG7cMKbE8Tp8ziopqs=;
 b=pznhw0QAcqQiifgjhlG6JWv4D8zoNJc0z8GtquN3EqIxZeKUVOetIgZRGkTjgApQDa
 ZKl6ewag9+d9Yp0dVhEC9gskv7QBa/0fJuNxbhELTLDeBeqdVSiIB+fTi2bJsLUbjFhx
 MaYBWLko+2X62NAaeNVyybRwtCRT8lcOGtDpk3w08gEEGyk56mEjyz1Wy+gVXtutS1pa
 m87A2oLb11Bmy5at64jAIGlPKC+BQbUSLH6IsH1Q+GnaYtio0/hvMBSWR8rHW3r0KduJ
 dJ8zxXWqetGGZFhNXGvfmf8tdV1z2lq9FKGVgRcPA7jfG/cAqzzQH2DbzfYk0VOgnm4p
 3GxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEfh5QpndbjThquQ+8/zBDLIONFBp8MAIwDlg6pyqB22RQHR5mtX5dUkAjMsE5LUre0YiavgmYBSo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylkUCLIS1eal/UzFmeEdt7pXPWmZKakkURlwtEen0Mmtb3iRz+
 WTAgorFWnSo5bcRri0z7UV3wkcUOS14dRZXCHA23LpKYlGpoR1/MkF1XIx2R5M8=
X-Gm-Gg: ASbGncv957tcCxlf3XDzgIFd27ajztT5Rvut3F2WEDfgD6N3SyRhNdEEtBk+tm/8zNg
 VEBlVGDnPfCPBh4U4uOCEmRXeYFuZGNlcAsYLi31XYOwh1v7+xbSVblDI5S0+qZdlhUptNK4EYt
 9G7c1XyINfiEu8DnYG1dHtGs6TJE+22IfbqQqihhj4PdULp2d4F/QAUKS6Y1KLGKhxdRBohblrM
 9hyUQY+FFsquBPlk/XZKwMV+lhOzwu+qGY9qGVY251EOFySW6BfpJ+VUbG/pVi9E91NNoStGt07
 uOtUOtyb7gasa6vIpihiHLBGScrZnP3n0ptx/mrNgZBsfJLWVS4LCD2lgLZcO9W7GKBbejEGY2y
 vPMexh4wZWPbz2HwO/erAGt6AnF8q
X-Google-Smtp-Source: AGHT+IEnfwtHJ3Wn/vXOb22OP5r0g9c7Ff2/QGuF8c6+sb47ABmJh546Gq/OE0qgXK1bZeJ8IDOLkw==
X-Received: by 2002:a05:600c:3485:b0:43d:abd:ad1c with SMTP id
 5b1f17b1804b1-4406ab7b67bmr158450395e9.6.1745415934402; 
 Wed, 23 Apr 2025 06:45:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:2835:c2f4:c226:77dd?
 ([2a01:e0a:3d9:2080:2835:c2f4:c226:77dd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d16e60sm26380505e9.3.2025.04.23.06.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 06:45:34 -0700 (PDT)
Message-ID: <a6e47775-33c3-44c2-b6d5-58164e4a0a50@linaro.org>
Date: Wed, 23 Apr 2025 15:45:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: himax-hx8279: Initialize goa_{even, odd}_valid
 in hx8279_check_goa_config()
To: Nathan Chancellor <nathan@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev
References: <20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org>
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
In-Reply-To: <20250422-panel-himax-hx8279-fix-sometimes-uninitialized-v1-1-614dba12b30d@kernel.org>
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

On 22/04/2025 23:20, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>      842 |         if (goa_odd_valid != goa_even_valid)
>          |                              ^~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:838:2: note: remove the 'if' if its condition is always true
>      838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      839 |                 goa_even_valid = false;
>    drivers/gpu/drm/panel/panel-himax-hx8279.c:818:36: note: initialize the variable 'goa_even_valid' to silence this warning
>      818 |         bool goa_odd_valid, goa_even_valid;
>          |                                           ^
>          |                                            = 0
> 
> Even though only the even valid variable gets flagged, both valid
> variables appear to have the same issue of possibly being used
> uninitialized if the if statement initializing them to false is not
> taken.
> 
> Initialize both values to true to clear up the warning and remove any
> possibility of encountering undefined behavior.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8279.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> index b48b350b62da..92f351e66c25 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
> @@ -815,7 +815,7 @@ static int hx8279_check_gmux_config(struct hx8279 *hx, struct device *dev)
>   static int hx8279_check_goa_config(struct hx8279 *hx, struct device *dev)
>   {
>   	const struct hx8279_panel_desc *desc = hx->desc;
> -	bool goa_odd_valid, goa_even_valid;
> +	bool goa_odd_valid = true, goa_even_valid = true;
>   	int i, num_zero, num_clr = 0;
>   
>   	/* Up to 4 zero values is a valid configuration. Check them all. */
> 
> ---
> base-commit: dcbd5dcc956e2331414fd7020b4655df08deeb87
> change-id: 20250422-panel-himax-hx8279-fix-sometimes-uninitialized-207354fb930c
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
