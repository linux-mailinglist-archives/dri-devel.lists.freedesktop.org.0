Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450EAA87907
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 09:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F8F10E4B6;
	Mon, 14 Apr 2025 07:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yQj0s259";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D20110E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 07:38:41 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso45627715e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 00:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744616320; x=1745221120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MYNlI03NSFPCRVzjpBp2v2uGfOYgtNYlYwGUmgY2K2g=;
 b=yQj0s259x+3EwYc7FF7eHat4DbsKGFAKDGI26lmuolE/4p+uvjwJCyELxTsdvqZw05
 GNrqpzIvTR5FEWHPnrwlCdVlrETX8XVEK00iKtToxCGSpWKBoK3/dnxP9xEULVO6pS1r
 BRIAJ0Wz9XfrMJccuKthJWfxASp378zgVRFydF/rTkX+wmD1Wf5rTlcV2DTG4hzZky2+
 oUuzjVB74JNTZQ3Pbn6ViOkqhfXbmaT1CCNcNNPdyuz8R/v5fBU6vxzzIQiTC6CV3Xnu
 LSYbTX4z4SLAm5we+vxrXxKh2+saQuMuLBucbnMBirBcUSxrOKSHTyRYVef1a3qUwvIS
 FLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744616320; x=1745221120;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MYNlI03NSFPCRVzjpBp2v2uGfOYgtNYlYwGUmgY2K2g=;
 b=vfxcvtn9WVfV2jMjfVLez0lOMK0PPXdguzAHqF0DKIwmPUAcrWPA2xWvH0SukNOSEW
 oYSySdXTCcsaWXUXej+I0fGUDnIyqhKe6wd0MDiXPzmFhyT1sGAwV8w57mbYEHQ8qzzC
 OaWlqFvIHnvPfeUrdzKV9fXd+e0uEM7R75OTsHCLN++PaKOAYy4pt16SLRPIi9k+L4P+
 Ic1WeXEG9zlswpIcFPUX/rnFxi3pSnWIbxde4OlvIUwUZ+IXipeiumMQMm9l/I2PhZ0l
 fywMkoeCz7n43Maqj+zwQtNBxdxb2yYeGwFL/ei9Z/bjm/bI/aGkNBsl1sA/zjT9SBsm
 ncgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDxGNRoSW5QjKfKGUTa86jPV7AfmUA8WRiLpc49nMmWJ+wgjGfOUIPYv8KZYLkf4IMHeyAiUsstPE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9dsyvwTv7F9ZPVafE5v+ThDqfnvNSX0DX8oxK2Z7yddDOmHzy
 ujDAaXZgVy4FAZ6tYPcS1c4aSkzJD3sga8kKJHnE+FDNm4Msj0KWAL6ivvBvSU8=
X-Gm-Gg: ASbGncsU7eFXtl7LPANNYNRME+3XGxietcMBGNzRB6J+3OnxzlyiBZZxQNF23uZBGIV
 dgexrQM1z3TGeM9Nz2dqW9ykBihKbt1YMVbDGeL1pszpibSsXgzC5+aLZ5JiUrGHq1NgO13FjCq
 VJ9/VtUDWjXB9rVjewSOVaonuM8beG1NAsK2qUk9oag+PeU5HYz55NQSn9Bwx/p9Z07fhyTrYY/
 xEPo42g/PYpKTBJkMrQM+TieXHLN+Z06EPspujLZt6Ak22wjNjJrB3NhuietE8v8f7gawwK5+WG
 1KvtuARYNX1eFu6XPPM8G3ttlDc5k18z8mjsmRCMZOdema/IiBIXX/MHDPc2SCoI+GU+M47LnYL
 1AO1m88EUbYdaWyxdPQ==
X-Google-Smtp-Source: AGHT+IGBsTeZKgtEIA6eBsKtlhTmfJORjmAjg8djc+8TB0H998iWJMOz7OhNgNtbKdy1asdxt5v8ww==
X-Received: by 2002:a05:600c:3848:b0:43d:988b:7732 with SMTP id
 5b1f17b1804b1-43f3a94d9bbmr95557245e9.14.1744616319738; 
 Mon, 14 Apr 2025 00:38:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:bf8a:3473:5c13:9743?
 ([2a01:e0a:3d9:2080:bf8a:3473:5c13:9743])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c49f7sm165738265e9.17.2025.04.14.00.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 00:38:39 -0700 (PDT)
Message-ID: <ea1af202-6349-4f1f-ae15-41a483e99c2c@linaro.org>
Date: Mon, 14 Apr 2025 09:38:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] drm/bridge: dw-hdmi: Avoid including uapi headers
To: Andy Yan <andyshrk@163.com>, lumag@kernel.org
Cc: cristian.ciocaltea@collabora.com, mripard@kernel.org,
 andrzej.hajda@intel.com, dianders@chromium.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 heiko@sntech.de, Andy Yan <andy.yan@rock-chips.com>
References: <20250411115941.318558-1-andyshrk@163.com>
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
In-Reply-To: <20250411115941.318558-1-andyshrk@163.com>
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

On 11/04/2025 13:59, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> It is not recommended for drivers to include UAPI header
> directly.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> ---
> 
> Changes in v2:
> - Collect R-b from Heiko.
> 
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index b1cdf806b3c40..deaba3b6f9978 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -22,8 +22,8 @@
>   
>   #include <media/cec-notifier.h>
>   
> -#include <uapi/linux/media-bus-format.h>
> -#include <uapi/linux/videodev2.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/videodev2.h>
>   
>   #include <drm/bridge/dw_hdmi.h>
>   #include <drm/display/drm_hdmi_helper.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
