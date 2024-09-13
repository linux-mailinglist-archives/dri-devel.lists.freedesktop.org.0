Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2763F977A13
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975E810EB1D;
	Fri, 13 Sep 2024 07:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XjEruYCT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2EA10EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:45:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3770320574aso1297809f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726213525; x=1726818325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9t/8ow0g8m81xWiMMS3KyxV3Dsn3Wvosgn0saUrr5g8=;
 b=XjEruYCTy9EW4Y60dcyXvciJptfQTQQdrWwOIH6tnVv2zw8ojr+ddviqZqc8Nex8kB
 xXfLaguIL0yEWLU5PBGrql8dz51yMeBCyxk9N09OM7oNFJtrR6cSUXGtXblu0v+bLy0p
 YaVjUsXwkyq6+H+K8Cww5Rjk+X7dHu+qLXxwhNdpYlAbYjBiuBZXe+lNRmQG/73Ub1Qc
 issMFebXUd90b3u7Nyr5CkmdzfOphywd3yXIGtGfP6CYwRRDfxxAIEgIwcbf5Sm89kJM
 xwfUtp6MwGQ7aQcGBVY4pc6wIt8h6llbzjNI9Bh9GKBjd1wYpkpgarRfpOi7Paq1fi38
 21cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726213525; x=1726818325;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9t/8ow0g8m81xWiMMS3KyxV3Dsn3Wvosgn0saUrr5g8=;
 b=obC2nDDPyxub3dA/CSNy/LoopYZ7jyj/Oc219pj6+35GTJv2dK8ZzHKTvrgldzaUFY
 ZSXD6o695sE+E+F+SaBbjOCdyU5xLfio2CW7keSAZYn3UHuGKrWAz3vtiGODupZjVZls
 /n1Dj280ZaImISWvOstHSZPKHbfhTVfl1qDhK98wU5mp98qxyKi+SmETFBoOOqqPullI
 zxh9dYPuyxdSuqI/LmEtVosZYJaQUixTcQgfph5lI+UYoWAt+J1iLmWSjYgkhUbaS1eO
 XWJ2A+9grCMo2a/2o2WEfLZbt615Z1xqpeSAvHBON3ZW+4KMEbtYnJkT05VzoEkmEE41
 yKlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNnZtiy0G40mAalH1mNsOkc07HEN3XWej8gXyn+cOhkf9EftNIoUTT0HQsNtvQA3XK1HIUSNk6G8o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/dw5zxkHLkT8x0SKomllk8atcQODO1uhr9t9gT/vCJq79bixi
 hn3UVSWpDLekc3Ne1Nmt+YWJB/w8ajb+yevYwLrk5o2s3QPmeFRV4XU0sr4TrHeNG/VXtXXaH3+
 N
X-Google-Smtp-Source: AGHT+IGcNFw9WaPjBDW1ud7axBEAuoKvTRfN3zPb9CC76EX/+8jUPvInz4hrp4CUciU3pxclE1NduQ==
X-Received: by 2002:a05:6000:dce:b0:377:9867:9028 with SMTP id
 ffacd0b85a97d-378c2d5b110mr3024653f8f.44.1726213524816; 
 Fri, 13 Sep 2024 00:45:24 -0700 (PDT)
Received: from [192.168.7.202] ([212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3941sm16099243f8f.84.2024.09.13.00.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 00:45:23 -0700 (PDT)
Message-ID: <ff38f3e6-dc46-43a8-9aa5-62cd50050d2d@linaro.org>
Date: Fri, 13 Sep 2024 09:45:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH -next 1/3] drm/bridge: it6505: Enable module autoloading
To: Liao Chen <liaochen4@huawei.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: andrzej.hajda@intel.com, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linus.walleij@linaro.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-2-liaochen4@huawei.com>
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
In-Reply-To: <20240902113320.903147-2-liaochen4@huawei.com>
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

On 02/09/2024 13:33, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 1e1c06fdf206..eef5ad449c16 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3498,6 +3498,7 @@ static const struct of_device_id it6505_of_match[] = {
>   	{ .compatible = "ite,it6505" },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, it6505_of_match);
>   
>   static struct i2c_driver it6505_i2c_driver = {
>   	.driver = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
