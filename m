Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAD1B3E2A6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D2810E430;
	Mon,  1 Sep 2025 12:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QyylXLoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C43610E430
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:25:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3cef6debedcso1836467f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 05:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756729514; x=1757334314; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9lLMjniQ1/cKQ9SFpYSeLnFNup3YUhmHr3nqDPdCoFU=;
 b=QyylXLoK6gSl9zAS9qs9fgAR2QYAXOWTbxksq2NUuxQ0pYcOq7/Nsfn3O+TqFO9H11
 ZhgWz3kXObFaWz3yHC5dWMf2Hfh33FSa7ruP5ukqa1NT2y0jhWaMn/WT/7NhAwk1hrR1
 a8Jou4GiDtD4+CimGWFfSJw4b0GDFKgXcGFgD7B6ucnarBOCdnIpDKZE8iC94ms5iHCp
 8j4pg5QGIwUhULcIH+RqDHRuo/pIzu501YCtjDj+vRPf9lfTiLYYBXTvH4nINO4klGyT
 umSOP0ya/pET0iBaEOcLuhq1R95S8N4BsuMbMfz/vERR82duemQLPPcqLoMEHJXeD31A
 ruUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756729514; x=1757334314;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9lLMjniQ1/cKQ9SFpYSeLnFNup3YUhmHr3nqDPdCoFU=;
 b=lt9vDGRwawdjtOsyWMSsL7JvKQ39V1b1SQFLCUEmoxSv4XxNC5yFEePYscVcbX104L
 QXJNn11sMcdoVM6p4bh3ppSrAGjjyNJoGdSfCoQn7b3YMwCkKHzJUSam/8voPITjAz8j
 xp7oVfgThoUaPUqC5lu0YI6EW5Vo84xQP/0AV5ACDdYdNAME2qPHIYkU+yX7Yzkj+xrY
 /CvCusBOFWXKu4FyFN+hycpnbRbkRdKD+rBA8XWjss5ebQzzW1LXTDb4GQ0TtuDQ3O1G
 4DUpCbFZOlNSBtTGORCGgyqPKSo9MyRi2tgHezSohftW9Yr1rW/4B6aFDPYmcpFEipHD
 4PHw==
X-Gm-Message-State: AOJu0YyHWJRsVVTNvHBtn/5pwUOdsqACI1EJEXilmKJTHppYcBA11ojG
 BPCIfrOcjO0LwLF7tPPUKt6fGesqXwBfwHwWZoIScWdDKYr2c8xsQOT3bi+W6dFz290=
X-Gm-Gg: ASbGnctJ4HiGWTF9IXB6ZW2bkTkXUljBgWY7IcnjQPX2UXzHCxH2MuVxscrBLzZmRUb
 N0KGaww0IkI46e7gyy6pNnBVMpqgzUnHyeMvm00xO7BqOu4tIM1f6unz8pGxTybBlD0AoXNjLWV
 cfXre/pO/gYv9XWCdBLeqONhOUmW5dHDdF80yHBz44yY39jueJewas2FxWHmrM4giiN/zFsALU2
 klJshYineMWQwFKK6Wf5B21VXocGCRZOOn4DL5pp7nKJu2qVq9liaf63i7ks39it0hystaGf9uj
 cWhm3Cn/nlVfIqIBV2dEezzTveP09OGMLL4coJTFv6fjeFX144AJ9YCguVrzobbzHwFiubupcr3
 KBiGYDz+XXWWETpAFarruwzqGjb/+w5ixBEHItzWQqwpGFOQ4bAR8IW4CWfDOSyXgWPvMipA5
X-Google-Smtp-Source: AGHT+IF5dX8kQFF8BXALlKdkwINlMLM/NUWY3UDwGCZ6dH+7AxQ+/AYzUJQq7aUHMzaI02mBKQkM8Q==
X-Received: by 2002:a05:6000:1786:b0:3d1:4c3d:1933 with SMTP id
 ffacd0b85a97d-3d1dea8c5e9mr6340755f8f.43.1756729513811; 
 Mon, 01 Sep 2025 05:25:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a?
 ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d60d93b949sm5169999f8f.2.2025.09.01.05.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 05:25:13 -0700 (PDT)
Message-ID: <d0b6bc2d-f191-4025-b97f-c6d234214b69@linaro.org>
Date: Mon, 1 Sep 2025 14:25:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: lvds: Remove unused members from main structure
To: Liu Ying <victor.liu@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
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
In-Reply-To: <20250829-panel-lvds-remove-width-height-v1-1-acecf0c84dc4@nxp.com>
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

On 29/08/2025 09:53, Liu Ying wrote:
> Since commit 03fa454bb666 ("drm/panel: lvds: Simplify mode parsing"),
> the width and height members of struct panel_lvds are no longer used.
> Remove them.  No functional change.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/panel/panel-lvds.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> index 23fd535d8f479045a87b0f51bec17cd7c66b0f75..46b07f38559f35aa3b0a41662cc29480e53e885f 100644
> --- a/drivers/gpu/drm/panel/panel-lvds.c
> +++ b/drivers/gpu/drm/panel/panel-lvds.c
> @@ -28,8 +28,6 @@ struct panel_lvds {
>   	struct device *dev;
>   
>   	const char *label;
> -	unsigned int width;
> -	unsigned int height;
>   	struct drm_display_mode dmode;
>   	u32 bus_flags;
>   	unsigned int bus_format;
> 
> ---
> base-commit: 3cace99d63192a7250461b058279a42d91075d0c
> change-id: 20250829-panel-lvds-remove-width-height-1d063f0bb178
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
