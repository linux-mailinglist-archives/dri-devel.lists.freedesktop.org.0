Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EE8ABD275
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770FF10E447;
	Tue, 20 May 2025 08:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XebxDj+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3110E447
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:56:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-442eb5d143eso53040695e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747731399; x=1748336199; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=BJKlEALqukBWVIaZSvMQu0X1rlqrFGy0vpDP61lvuJA=;
 b=XebxDj+LWWukXxeJ4C0QGRaeYocACJmGiDBMcYfL/vIPFlZMZSpP6c4KRsEoeqwttX
 +Desr1tV3ow9C0woSmZrBgtbWYcd/g7Jvo5YsA8hUeqrek7THs3JSpWu25260iDtvIAs
 vx626Ux+gT4oi+zfNa4eetTkY6UGo/Z6hGRBd+NTdLAHcXXrOKJTio6x+vuG1DZTL5p5
 krCNdGCZVb3Qyii1YNjBM+8BAGsATrMmkffVXVpp/jl+W2uLMd/SG751iCbiGjvRzW0A
 pry04LwKVqzdMU6ipqlSgWr3lQOQr5e/NPtp9z7D6zXK6J9+DmtZYT9dO4VDN7HH7BnN
 iE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747731399; x=1748336199;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BJKlEALqukBWVIaZSvMQu0X1rlqrFGy0vpDP61lvuJA=;
 b=LuqvzHXLB4IcUSAbPgeOVDk3rjWJBaQ6pnnBIAn+0xHPjqOyXQzVA8iHdAGPu/BeAE
 8cd/f37+oLOK2wxelyxJ7WW4suGIbSAX1Q9DHYdvp7Z4f6nCo4SNQeIyuVGlHxRdJ6cQ
 oBk0fSahH0g6P7DdZw5A5rAJCUQFQId5Fmz8yjiLVpbezxJGynMnbOmE9DCK1hE//HQC
 pQkU7gq4AHNkQtApVfw/pBaZXmHG51zuCMo0sz3pUBXykA0sqAephfdpYezzgDhBDn/n
 a+8sO8MT4S1LIsyks78FNX7SG47bqRW+ummJm4lLX6L8sZ3ZySHVZVZQAtztYn5m0WXe
 TscA==
X-Gm-Message-State: AOJu0YwJyRcabaY1PbvXcp7Ib4aFncEJ8b4MFNzQGDxh8h3jxVyfQdF3
 8p/KY/Yhu8NyfMH7KMFneRfLJMtmYuFFu6s4Mul/ZWtLxzxmFdLA1hQS/67D0gRw+Uo=
X-Gm-Gg: ASbGnct7TrNgp8isVCueiMiyvH7JidwJOEd15P8JjEC828CgYnYxC2fDtEHc8cSa/3b
 mLhNCYR8yh8rLhNmiBht29ripVyi2mXbtlQXXwWJoag+6cI/dSj4KGV7GMUy4xzYWE08GvhU0q2
 R7z22HZgWJf/NqsbB0uZ8pFdAYJQgqqBCaNEYNupPUJG0LI4xJkSY8065Byr+48FsO2o6mN1M6C
 x6WmVYRoW/iYJbXtFwPB+ip8dPK+KB1Xax3nwD2GhCLzQDDwBNGuDYSXnL/mlRXFw2LpI4hNh4U
 FhmxVIbrQ5zUNu7fx8mLal51VTWboiO9gzoTdvlxgqfJYHilZ4phpaebLExJMpC1DLAjG7SWITY
 c947JiJL4GfoKh1YNxLg1aBgdYYed
X-Google-Smtp-Source: AGHT+IHNhmKQWrNn4QBK50SWwlms3o9VxLv7gTlj1bGD4mEbBOIXSOIVbGOCKtrZsXub4P9ruVz32A==
X-Received: by 2002:a05:600c:3c9b:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-442fd5a1e4cmr153219395e9.0.1747731399071; 
 Tue, 20 May 2025 01:56:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd99edsm22193575e9.36.2025.05.20.01.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:56:38 -0700 (PDT)
Message-ID: <35cf95f6-30ba-4833-a059-e455d7370fda@linaro.org>
Date: Tue, 20 May 2025 10:56:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel-simple: fix the warnings for the Evervision
 VGG644804
To: Michael Walle <mwalle@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250520074110.655114-1-mwalle@kernel.org>
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
In-Reply-To: <20250520074110.655114-1-mwalle@kernel.org>
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

On 20/05/2025 09:41, Michael Walle wrote:
> The panel lacked the connector type which causes a warning. Adding the
> connector type reveals wrong bus_flags and bits per pixel. Fix all of
> it.
> 
> Fixes: 1319f2178bdf ("drm/panel-simple: add Evervision VGG644804 panel entry")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 82ee2f12b8d2..0a3b26bb4d73 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2198,13 +2198,14 @@ static const struct display_timing evervision_vgg644804_timing = {
>   static const struct panel_desc evervision_vgg644804 = {
>   	.timings = &evervision_vgg644804_timing,
>   	.num_timings = 1,
> -	.bpc = 8,
> +	.bpc = 6,
>   	.size = {
>   		.width = 115,
>   		.height = 86,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB666_1X7X3_SPWG,
> -	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
> +	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>   };
>   
>   static const struct display_timing evervision_vgg804821_timing = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
