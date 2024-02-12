Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DAD850F99
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 10:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAE710EB85;
	Mon, 12 Feb 2024 09:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j05c2hsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23A510EB85
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 09:17:25 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33b8806c22aso84286f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 01:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707729444; x=1708334244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cYfOTmPKAnSq2+vnqQQTS8maZDUACgKqhGyXgGaH51A=;
 b=j05c2hsIBtWVEsshv4LXFWbenwRV4z+5sI9D6zY/EH2OA6A7X1jQBKa/fRrXgS8uO8
 9zUoeQ/80U6b//3dCyuNDO6Na9GXq1xPjafMPVfCH/LgvVAHNTv9XqDBZyWRWWHKng3Y
 SHBJzq1JO+vgxCmbHBA5kWqPBg3PEaskzTosVTmR5bsJ/+yATA+LjoVjgocksaNnMqRU
 AIYFRfBtqcDD9hCnAMTz7E+33/Zcwoo1WXP/yN9IDrCAfpaXcFXhMS/cjGdDi7Tdehdb
 mlW6gV2xcD/BJZ5J8lddqxx13LmqX810I8BDTx2d8Z/0p8GxUjbvJumWd8PuzZEGC0n/
 AYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707729444; x=1708334244;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cYfOTmPKAnSq2+vnqQQTS8maZDUACgKqhGyXgGaH51A=;
 b=Ptez52J7CYLiX9sIyyTCwn30bKW0eZgnTwDFle64dzjP7p3uAhRbnbB271p/cyg/lC
 Qpoj0AiDC5HDw8+CupYBcE7Wg9Glh8nMGeHq5mxeQWx7uD/a0PvvH+yZ3onWerq0RRWH
 rmv3nMUWHLZAMParo9l/RfHqWKjTqbzqtImBIxbROOkQQA0AThgN6wBpsfDplRYofteY
 X69JLUDMvPC3jIZfG73wbgmKGv11g2M6HhBHyhWz01O9pS55L02yv+fZkztsu4ladces
 ahgTPVE58dDBfpmDha7i1tQNWjhEx87uqcRtd92uhPswy/5dQMqraNYcRvYBJBfpuJY4
 CJsA==
X-Gm-Message-State: AOJu0YzoYbtl38V6BlI05LGOgJbldZa7l9VxZWAuTq0Tu8hVaRQ1uIfq
 7S+w19Qsj/L5P6KV6RyzGCI492Ywggu72+9l04C9mFxAVn/oN7pL8m0kBRnRAgc=
X-Google-Smtp-Source: AGHT+IEF7+zJBSLGKrrXug82paH0sPNErIO9Vp2uUB6zul6+DwuGeeNHgd9/Yb+xytCSQCVvCZgtrg==
X-Received: by 2002:adf:e4c3:0:b0:33b:784c:276e with SMTP id
 v3-20020adfe4c3000000b0033b784c276emr3181126wrm.25.1707729444339; 
 Mon, 12 Feb 2024 01:17:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5TWdbTjZ7P1YLkHRTKI73vIN9h3muPY+EswzIx6/YQYjNNit9rs3K1YNVBgDhB8RcwP7lpW78BmlkgDhth2oyzf9bgZS+flrb5tij0C/7fNKjZ4/auNGqt9ickHktxs+ZJc4PY+1RGe8GbbKYLpdjnAF4csMj0qtHiOYYWXN7Xzv1NBZdM0DXgRgbaJv8qBofbQ8Zdpppoj7bYatuAqAbNy094+mtmqMJ3juaisAlyWnd/QipFOYMf0Hbu1EQjG3RUrD4H56k2HoYx9s8gyi04+wPDD54o0UtCspzygqCvHYYoG/8ozXXiqSfu9C39gcEoO/NN6pYONCFsi1RRhr3sJ8wbPqr1g3Lkh7NCe2fDcYfheKOKxpVPTjoSByxxwiU2nmJaYmrOFQpyKqLrvbIJ99OiGp79dUjIWwDOrywYByBCqPmC7aPyosgUdnXl3EEu9Z8nTRxN7VhoAcb/UBvp6GrzIuolA==
Received: from [192.168.7.190] (212-114-21-58.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a5d43c8000000b0033b512b2031sm6186007wrr.114.2024.02.12.01.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 01:17:23 -0800 (PST)
Message-ID: <f66b1ec9-78b9-4b1a-a2f2-3f3d888bd618@linaro.org>
Date: Mon, 12 Feb 2024 10:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH][next] drm/msm/dp: Fix spelling mistake "enale" -> "enable"
Content-Language: en-US, fr
To: Colin Ian King <colin.i.king@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212091639.2397424-1-colin.i.king@gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240212091639.2397424-1-colin.i.king@gmail.com>
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

On 12/02/2024 10:16, Colin Ian King wrote:
> There is a spelling mistake in a drm_dbg_dp message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 03bbdf865d26..320f17fce9a6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1409,7 +1409,7 @@ static int dp_ctrl_link_clk_enable(struct dp_ctrl *dp_ctrl)
>   
>   	ctrl->link_clks_on = true;
>   
> -	drm_dbg_dp(ctrl->drm_dev, "enale link clocks\n");
> +	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
>   	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
>   		   ctrl->stream_clks_on ? "on" : "off",
>   		   ctrl->link_clks_on ? "on" : "off",

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
