Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A88B0290
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C4D11388A;
	Wed, 24 Apr 2024 06:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c2EeYjhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378F011388A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:54:46 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-41a4f291f60so24322685e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941684; x=1714546484; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=8bRCgW5T5C1zJ8E17b4jWTOUyWD7CH0mT1aVxTkcyF0=;
 b=c2EeYjhPFMLDioG8f+4jeT1QdsSQsJaBjpNFBX/VwYDThLgQm48nqXKFTh+gw8SJ1X
 f6dZnfLXA7/NWk0X6jawI4NrAnD6ZHJHtamNwbP+RUfELjJtJBzIHAa6S81vJjxXW0u9
 kF2zhoSRKdgXEdnCoLw7zu18WCnDIcsMcc/reg1yKRAeqSm5qy0c307RuzloFhp6eNKO
 zT0Sa2b16pNOnvOhXTb3pRrWhG3734x1lLDLC/TtRCwaqHs8gHYPs3wTHS4rbeh2wtV9
 XJAGW/iY+c7FPWTrS6K8XNvF4xCAVyj2ztYX5qZH+TU6KQzu3R9Ca9ws3Zqy4V0trP6+
 DCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941684; x=1714546484;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8bRCgW5T5C1zJ8E17b4jWTOUyWD7CH0mT1aVxTkcyF0=;
 b=PJe8e76mMkQFz6UOLjTh245mk2jT44UuCs7st3wuwMaHPXoa6CAmpvsxB7JVtmaxP/
 BkmIAOV5WmRDQL988gOSuhQOx3pAAUKOkH7bQ3OhABcE1fML+HJFFpMPjLMWL/LfyhcM
 VdGp9v8nTdq9VDVm95YOuzx54k7B8wY+ykfee16e1nCgGtxm1Qct1d+czjr1a195XOHl
 T04hCKcTuoCURX3p4W3c37ZN5ewOrt6qpLCjSUuGSRamEYpS51mBDEX+PDlAn+psgsp0
 ASnN7BzuzScZ2OkD0F15x82Wkm8dl4jFc785EgS62w1MZlJLIbW+Gr1IQwrKc62Pt/EG
 J05Q==
X-Gm-Message-State: AOJu0Yz4mvtDVhKJ33t0e5c5QizCq/CHAL+Zifq+TR+mL/bzHdAdzhxC
 cHc/8vp7PDlfk0mx6g7TmLcUXHb8d/nTDiMMS8X2lxESUR8gkzQ6Imdzy/pqjIc=
X-Google-Smtp-Source: AGHT+IEbswXmJDcA7EFPdf80BhUcAOFM/NRn/7lUivF6qZFsJoWShPkwWrvg7v9MpetcI3NV+PKGlQ==
X-Received: by 2002:adf:ee06:0:b0:347:9e5a:3070 with SMTP id
 y6-20020adfee06000000b003479e5a3070mr790943wrn.17.1713941684224; 
 Tue, 23 Apr 2024 23:54:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7?
 ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d4844000000b00349f098f4a6sm16235018wrs.53.2024.04.23.23.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:54:43 -0700 (PDT)
Message-ID: <d377e5c4-7716-4f4e-8fe4-472e3230eebe@linaro.org>
Date: Wed, 24 Apr 2024 08:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] drm/panel/lg-sw43408: depends on
 CONFIG_DRM_DISPLAY_DP_HELPER
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
 <20240420-panel-sw43408-fix-v1-1-b282ff725242@linaro.org>
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
In-Reply-To: <20240420-panel-sw43408-fix-v1-1-b282ff725242@linaro.org>
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

On 20/04/2024 04:41, Dmitry Baryshkov wrote:
> This panel driver uses DSC PPS functions and as such depends on the
> DRM_DISPLAY_DP_HELPER. Add missing dependency
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/

No Fixes ?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ab67789e59a2..5e6692207beb 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -340,6 +340,7 @@ config DRM_PANEL_LG_SW43408
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on DRM_DISPLAY_DP_HELPER
>   	help
>   	  Say Y here if you want to enable support for LG sw43408 panel.
>   	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
