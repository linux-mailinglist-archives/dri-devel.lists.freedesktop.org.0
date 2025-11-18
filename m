Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5AC68402
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C72110E437;
	Tue, 18 Nov 2025 08:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xnkuf1Pq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62010E437
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 08:44:13 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42b3ac40ae4so3098552f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 00:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763455452; x=1764060252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=skPvgKgOzKLBLcTYhsTuqCFv5N46l8HCKNcS62pDJuU=;
 b=xnkuf1PqCRjIOLJVzrU9emVGLD2jLWI9LmOkqGel9xzOwMSphIavMxniCZ29Ufo1Xo
 3OD7Ai8SyGkQ4DjUNJzNKz3KuSqb/MOUwIiE3FwensXa2lEaQJpaV0HbRTPgIAmGmKwf
 md4npvxLHz5zDCoo+VrGQkWi4GZKPMfbqPl5KViNiGRFb0ruD/FxKD6Pdzw/OPfIbfWO
 npc2C+wyywkfrn4zXZz3i5iss8xKh3PN2L5EeldiN7FlXU9knHEzYHT8rCVPwnelOhl/
 zDlWQAwsjt/fzRIRC+r4JItYECL/07KfI2V6+LyvyEqITIb1mJlxVSfdVFbw+P+dPCn0
 e3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763455452; x=1764060252;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skPvgKgOzKLBLcTYhsTuqCFv5N46l8HCKNcS62pDJuU=;
 b=nQBpEyA7l+LVBat7QLoy6pCKKlRjnagawfltQqy3oQLAdhqWZxuIZSMkHrLBDJpeiB
 ETaBMc7ZE/IRW9cMtmmyY9CoFvtSccEw61BR1K921myQmxE55+Yw9WEMlsXk0ZjOel6f
 DG7/oloAodDNE8ioAmSFC5mLTJAtFmfDMM0EaN7pYqrxJkSd7nF2iUlFps+BeorUh5BC
 BPJbCVfguqPvTUl2/+MmiLRu8ipik8n29AM7gj+070GM21D3b3NzzqMMUXPIyDcX0j3F
 vrnLBro+PNp3AdRyw5hq6R4Sr9MswawpFw0slzJ0zM+UlDjVYcPYuGz1S0eeIgaEnSFe
 xvBg==
X-Gm-Message-State: AOJu0YzCiy6q5TVi5jMc4eL051LqF+MKHT0VaifAJOGEUNsTxNs/DbaV
 xwLUvrXyO7j0JqCTmAOj+nkxC8/PqusLVlgFDRXl8RQ0MymwsPS9/tt+fE1oMn4Enw0Np0+vhNS
 1sKMa
X-Gm-Gg: ASbGncsr8VxKqb+ko+OfdUXIBR6fUI9yj8UHzI97BQtjCXqC6y6CjuhTcdXUhG7J+Lt
 NgDRYEaql1gE+niUh9/d3wFMcs7w0gmJxpGYd2WI2H7BcBgF+feEN7d+Wls7AlDCF0v4pI/I+qD
 nABhloL74gx0s3NwwjaVtfyl5xFVtKtSlO7ukbrO7Pb8wksA5cvPQFN3YHFUEysWwVVJwZlHDdc
 DS+Gk9/ZCT+7ZbyldaR8dYiDfV8erFh08y34DUKvjK3pFQwtjZv3tPFm29+mMVpR3m+uqD2p5dF
 X+Vee97gZG6ZzyKfSVsKQPAA5ApHYMOb2f5FeUYHBiiIgvPBC8J+CCLRckdgh5naWmOy8tUqfrT
 C+o9UNcJMiPd1txIPzN7sbdaFaxPsD6710K5mthPKSXg28nOC2swIsTghF4+ywAbZWXvJuN22ra
 gTPl1dfPPpfZC1XmXQ96kb6d23rjBmfS8/KilfhQ3Kyf9rzpvcC7qZrafQdfF3uAZ5LogVigaaZ
 A==
X-Google-Smtp-Source: AGHT+IEQmNMAhg7c5ylKpz3XgzZvskAD6S8nCFrFxxaR1yFJHrnMGgU4L4pcdpl7dbKF7g6zIn94Og==
X-Received: by 2002:a05:6000:2083:b0:42b:3867:b39c with SMTP id
 ffacd0b85a97d-42b593745c4mr14643424f8f.34.1763455452210; 
 Tue, 18 Nov 2025 00:44:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49?
 ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f1fd50sm30639426f8f.38.2025.11.18.00.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 00:44:11 -0800 (PST)
Message-ID: <d7e9016c-1c41-4860-b1a1-a6fb8661f72a@linaro.org>
Date: Tue, 18 Nov 2025 09:44:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: jadard-jd9365da-h3: Use dev_err_probe()
 instead of DRM_DEV_ERROR() during probing
To: Abhishek Rajput <abhiraj21put@gmail.com>, jagan@edgeble.ai,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251117064702.222424-1-abhiraj21put@gmail.com>
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
In-Reply-To: <20251117064702.222424-1-abhiraj21put@gmail.com>
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

On 11/17/25 07:47, Abhishek Rajput wrote:
> The DRM_DEV_ERROR() has been deprecated, and use dev_err_probe()
> can be better. The other reason is that dev_err_probe() help avoid
> unexpected repeated err logs during defered probing.
> 
> Signed-off-by: Abhishek Rajput <abhiraj21put@gmail.com>
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 5c2530598ddb..aa05316dc57b 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -1132,22 +1132,19 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
>   	dsi->lanes = desc->lanes;
>   
>   	jadard->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> -	if (IS_ERR(jadard->reset)) {
> -		DRM_DEV_ERROR(&dsi->dev, "failed to get our reset GPIO\n");
> -		return PTR_ERR(jadard->reset);
> -	}
> +	if (IS_ERR(jadard->reset))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->reset),
> +				"failed to get our reset GPIO\n");
>   
>   	jadard->vdd = devm_regulator_get(dev, "vdd");
> -	if (IS_ERR(jadard->vdd)) {
> -		DRM_DEV_ERROR(&dsi->dev, "failed to get vdd regulator\n");
> -		return PTR_ERR(jadard->vdd);
> -	}
> +	if (IS_ERR(jadard->vdd))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vdd),
> +				"failed to get vdd regulator\n");
>   
>   	jadard->vccio = devm_regulator_get(dev, "vccio");
> -	if (IS_ERR(jadard->vccio)) {
> -		DRM_DEV_ERROR(&dsi->dev, "failed to get vccio regulator\n");
> -		return PTR_ERR(jadard->vccio);
> -	}
> +	if (IS_ERR(jadard->vccio))
> +		return dev_err_probe(&dsi->dev, PTR_ERR(jadard->vccio),
> +				"failed to get vccio regulator\n");
>   
>   	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
>   	if (ret < 0)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
