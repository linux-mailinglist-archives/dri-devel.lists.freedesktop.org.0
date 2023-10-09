Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BF67BD5E8
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 10:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C5210E0E1;
	Mon,  9 Oct 2023 08:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB0410E0E1
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 08:56:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-503397ee920so5360041e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696841788; x=1697446588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ChWpLMUD+BbEHc72eqlablETJQRcBST3BsLrGcOm/6s=;
 b=f8W236Jk6KjXjoUTffrbSDb4rlxF0d4puOODxdKnI9DOnXsbIOlaq1U13auGdiH9Hb
 eMXi38YFYiP1zFfX9THoqcb3V7P2eyU2j2JIbkesBK1Wx+j8W1aT2UOgJ0NyYnDK3h2A
 cxyaUnqB9YrNLSCuLF1Fbhxhu6X30W7EWrOHCiup7UzvWkSpM1rPbNrq4ifPTF/WjQwp
 a3aBgGhXq1aqEL1hdLYfp8p9Rf2A72p2mWLft2NArCoA63AYgcnpzPuD00Lsno8DqaY0
 Ef/rCgvfq/M4dHWVq9iLHIGTtg4jXg3nxA6r95r5PW0luGokzE3wPYKoygI39pBx31xS
 YxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696841788; x=1697446588;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ChWpLMUD+BbEHc72eqlablETJQRcBST3BsLrGcOm/6s=;
 b=uJ9uOkz3T87XS3vYzwn0cwdJVqo8V8cQEWOpL03bHtYAb2Mdys7pGcBSYCol5/579S
 Yc3KA3UA6xyO8JIeeX02p8tlldoNS24DBViiN3Jbft+ANJwReqwZCKFs7BHFd6HuKiAZ
 xB2sy7OJI4qJvUCYNGfgP8vZGx6rXwB3c7xk9zlobbG3v14jAuFmamJGmNNAUop9PmFu
 zwpXeuUdcRdGjxUQ2iHljh19LlHBO50sHXi+RbaGWkSKZjUkc5euJ0S9BfuCXLGoXqOG
 2OI/pfgU5+xiBXzUGHXEmvj8YVaOhyC5tEDb5nB19KCHd5EuQ2B9eY3Klz/QTh62K3zA
 gCOg==
X-Gm-Message-State: AOJu0YzV9A3rRsdQHWVyUhsNBWCdv/l1smnLiNKtFLc3DLGeDmitYaGN
 irtsGOHcS8MhDe+M3wD1nhkt9g==
X-Google-Smtp-Source: AGHT+IGyuTLZ4fPvw+bBUFyo+rbizHaok4Vwz1d4frUaeSaATq0eKx9UQ6diDVdNYZraHDfo7Xs71w==
X-Received: by 2002:a19:6709:0:b0:503:3ac:8457 with SMTP id
 b9-20020a196709000000b0050303ac8457mr11851695lfc.45.1696841788363; 
 Mon, 09 Oct 2023 01:56:28 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b00323330edbc7sm8974100wrt.20.2023.10.09.01.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Oct 2023 01:56:27 -0700 (PDT)
Message-ID: <63ff768e-2155-4e71-8888-8b9fe5079b76@linaro.org>
Date: Mon, 9 Oct 2023 10:56:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: fix a possible null pointer dereference
Content-Language: en-US, fr
To: Ma Ke <make_ruc2021@163.com>, linus.walleij@linaro.org, sam@ravnborg.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20231007033105.3997998-1-make_ruc2021@163.com>
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
In-Reply-To: <20231007033105.3997998-1-make_ruc2021@163.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2023 05:31, Ma Ke wrote:
> In versatile_panel_get_modes(), the return value of drm_mode_duplicate()
> is assigned to mode, which will lead to a NULL pointer dereference
> on failure of drm_mode_duplicate(). Add a check to avoid npd.
> 
> Signed-off-by: Ma Ke <make_ruc2021@163.com>
> ---
>   drivers/gpu/drm/panel/panel-arm-versatile.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
> index abb0788843c6..1811bfaeb9c7 100644
> --- a/drivers/gpu/drm/panel/panel-arm-versatile.c
> +++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
> @@ -267,6 +267,8 @@ static int versatile_panel_get_modes(struct drm_panel *panel,
>   	connector->display_info.bus_flags = vpanel->panel_type->bus_flags;
>   
>   	mode = drm_mode_duplicate(connector->dev, &vpanel->panel_type->mode);
> +	if (!mode)
> +		return -ENOMEM;
>   	drm_mode_set_name(mode);
>   	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
