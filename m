Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F78B027F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 08:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D82C113883;
	Wed, 24 Apr 2024 06:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="G3GAS0ms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F37113882
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 06:53:34 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41a0979b9aeso27353465e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713941613; x=1714546413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=Ce4fgMOtZLBQ3aabDQJk5teub1RBOKX02c0UGJh5yuE=;
 b=G3GAS0mskYdCrJv9vAdO2+L1Q5RaIFwQ1314csSwEiA4NYwFEhIFwrElbhxcW9h5gB
 fhjens0/lYpOpmgIIbsB+WZMTH3ElFruAwq6SdVT5ccDk3HYf554FKK0L8V6BXHkraFN
 X7IiyEULpSn8736U5opLwiIX3tHbPTGqlFaKRtfFLoVFWtNLmdaYNToKt10drEb4VS7V
 2v9REJC/SlHlBAYqq1yA+Ouw9DK9SHrbdZRwMr1RRDiIEtcj5iUnyUQg/mWnX/1DKv9p
 AfYJASOHylnKonXLjkpXLbGeYW1iYfCQNc/GqJawssinJKkDYcB9ZtLQ7j5SII/zZ4+H
 UnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713941613; x=1714546413;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ce4fgMOtZLBQ3aabDQJk5teub1RBOKX02c0UGJh5yuE=;
 b=PdnCUCsxs++PNY5vOXrbe43pQDMfl3AkUo4leGDPx5MkkPYJ/5jLF0AvzGQlMPL0/w
 kIBz+MeL9IEtP7sS9yGBEEcVZWdR+j+99HBxiDx9OElYB6uUDxfjdJVcLMn7fqITt86x
 giyc9ebWkfxnjUmF9hi5T876gOxBIzD4FkVl0r2wDJ4pnX75Auj2ef1bKA6+TON3hLB3
 xlktWEKGy5U8YBgqIgVrx5y2gvfbiST0MoyB6a2ThtTn2xuX6HArFgVAXe2NxNlk+STV
 DwfTpGp4UbU/jiGHQ7ytmjdzvUFRWFQGT/jQRdRyHP0vDzFhcVZgQ5Tu7iiBS7CYdmBx
 mdjQ==
X-Gm-Message-State: AOJu0YygW6iEvzeoUA4GYBmEp/u/vu+owXZ5m2NKR29/11mNP/0FEZw9
 IrXh7F8Q0RME//NcMzy3jUVfXd8MbxxMMx0e0u8ncweSoIRXN0wz/rgyKNzoBk0=
X-Google-Smtp-Source: AGHT+IEhAmr3KBsIwZ2SCPk2yHI1frtEebCy80S7p0GZujfF4lyzJOX7sKXVsG4ySRCv8SHabZaonw==
X-Received: by 2002:adf:eec9:0:b0:34a:4445:22d1 with SMTP id
 a9-20020adfeec9000000b0034a444522d1mr1405624wrp.63.1713941613033; 
 Tue, 23 Apr 2024 23:53:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7?
 ([2a01:e0a:982:cbb0:ed3e:c90b:dd74:51a7])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b00418a386c17bsm26479771wmq.12.2024.04.23.23.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 23:53:32 -0700 (PDT)
Message-ID: <94857285-7796-4615-84e7-295294844656@linaro.org>
Date: Wed, 24 Apr 2024 08:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/6] drm/panel: visionox-rm69299: stop calling
 regulator_set_load manually
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Kaehlcke <mka@chromium.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-6-9f56953c5fb9@linaro.org>
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
In-Reply-To: <20240404-drop-panel-unregister-v1-6-9f56953c5fb9@linaro.org>
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

On 04/04/2024 12:08, Dmitry Baryshkov wrote:
> Use .init_load_uA part of the bulk regulator API instead of calling
> register_set_load() manually.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 16 ++--------------
>   1 file changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index b15ca56a09a7..272490b9565b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -197,7 +197,9 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   	ctx->dsi = dsi;
>   
>   	ctx->supplies[0].supply = "vdda";
> +	ctx->supplies[0].init_load_uA = 32000;
>   	ctx->supplies[1].supply = "vdd3p3";
> +	ctx->supplies[1].init_load_uA = 13200;
>   
>   	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
>   				      ctx->supplies);
> @@ -227,22 +229,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
>   		goto err_dsi_attach;
>   	}
>   
> -	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
> -	if (ret) {
> -		dev_err(dev, "regulator set load failed for vdda supply ret = %d\n", ret);
> -		goto err_set_load;
> -	}
> -
> -	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
> -	if (ret) {
> -		dev_err(dev, "regulator set load failed for vdd3p3 supply ret = %d\n", ret);
> -		goto err_set_load;
> -	}
> -
>   	return 0;
>   
> -err_set_load:
> -	mipi_dsi_detach(dsi);
>   err_dsi_attach:
>   	drm_panel_remove(&ctx->panel);
>   	return ret;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
