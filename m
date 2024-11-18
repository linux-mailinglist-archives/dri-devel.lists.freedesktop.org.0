Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF089D0B27
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6DB10E45D;
	Mon, 18 Nov 2024 08:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DTWoKALt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2948F10E464
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:43:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso34112445e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 00:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731919437; x=1732524237; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ypUwUUYc52nz0VWt6hkJFRU5UFb2HonzDOj3Vy9qns0=;
 b=DTWoKALtbspssC/SSqMLKedTNVEjQthVm5kEhAMaxFvaghW6u369iCNmoRhMg4+maw
 /QgKmiRCPuNTUrgYHKVSmKG0IB/MUgMc9Nb5shb/rm3NvJuyDp2ZLJ+NgDc16I0apZjI
 Sf5yVLqM1EEv+TLiTtHrqpDdB4FmokzCk0M/L4271QzZdM0aJy9h2HdQWrcinzNfhM0C
 l1Zw21IZGyiz9hquPkVHBWjgPVf0bsVwYb0F9wMqIMUKhIb+aHFCepR3gVDPkKD7EBvp
 LOGhmgpcy1qQqKFfsUE6R9aSK6qgfGKDB+sE4GuCgIWcUwfn4sbKAXdDK/yvth7rbpSm
 NICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731919437; x=1732524237;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ypUwUUYc52nz0VWt6hkJFRU5UFb2HonzDOj3Vy9qns0=;
 b=AXlUlhY2zJGrTGouH9VqnYtHsIAwckJ0pHXu3qMmbSKNsOmbKYsWoGgC0TMaOTxeii
 G0esIgPrKkBLAIVXzrIcttkXcqKgPtf4WocRaBk7iHd0HEwWMEuEQ+AwzfgxGl49Wnbb
 +0CeHY7AFU/DW6lTa9VuLPrNMmucmtTsBFVpSktOg/uLo2eNyUKkSaCwoqV2IBolh0Jq
 ZAHWSOFncmftkDAtk/+8ycO30y/3VCt7wxB6quHSfFiEkon+YojyLuJXPOP6wd1AA/kv
 QUliN5Ou6W7tExs+5IpYhl2WTx+VgbRU7xIEMTQGeLZLZhQDpAZ+PBzYYRsBAtdHn5tZ
 FnXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm7f1+4zsD6m9USf35hYX2Ru6OrNTevmyoBP7Bv2jpXPZOiJCj03FnLYkMJhGlMzudIPF0KjlEszw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfsQeDJtWMMx6D6ovsgCp6tLnU0+0w8RFxlZzad0jPfp6hpSh/
 m62FBHThyJN6gqusBxxyAtRtoBEOAHeFSMJjDMD1hFpYX7NsouVBiVf5OP0jIFc=
X-Google-Smtp-Source: AGHT+IG4x/wSsHa4buKCI+PmRIPnd+RHX7sQl/gl5v5lsTsElHnDURLtXwCLBx6jPTcOcp0me54+bA==
X-Received: by 2002:a5d:64a7:0:b0:382:3f31:f3b9 with SMTP id
 ffacd0b85a97d-3823f31f87amr4159436f8f.56.1731919437379; 
 Mon, 18 Nov 2024 00:43:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf?
 ([2a01:e0a:982:cbb0:ed47:520d:3d5c:3acf])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382398aa925sm6021314f8f.50.2024.11.18.00.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Nov 2024 00:43:56 -0800 (PST)
Message-ID: <7ca35f75-3423-4ed3-bce0-6f3c7fa1f718@linaro.org>
Date: Mon, 18 Nov 2024 09:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/1] drm/bridge: tc358775: Remove burst mode support
To: Daniel Semkowicz <dse@thaumatec.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241115160641.74074-1-dse@thaumatec.com>
 <20241115160641.74074-2-dse@thaumatec.com>
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
In-Reply-To: <20241115160641.74074-2-dse@thaumatec.com>
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

On 15/11/2024 17:06, Daniel Semkowicz wrote:
> Current tc358775 bridge driver implementation assumes that DSI clock
> is used as a source for LVDS pixel clock. Moreover, clock divider
> PCLKDIV has a hard-coded value. This means that driver expects DSI
> clock to always match a panel pixel clock. With such assumption, LVDS
> pixel clock is configured to be (DSI pixel clock / 3) for single link.
> This is true for DSI non-burst video modes. In burst mode, DSI host
> is allowed to set transmission rate higher than pixel clock to allow
> shorter data bursts. When the transmission rate is higher than expected
> by the bridge, LVDS output timings are still configured for the lower
> frequency, but the output is clocked with the higher one. In most cases,
> bad LVDS timings cause incorrect panel operation.
> 
> Remove support for burst mode, so the non-burst mode is used by DSI
> host by default. Burst mode is supported by the bridge itself,
> but requires proper implementation in the driver to operate correctly
> in all scenarios.
> 
> Fixes: a4ed72e85c46 ("drm/bridge: tc358775: Add burst and low-power modes")
> Signed-off-by: Daniel Semkowicz <dse@thaumatec.com>
> ---
> 
>   drivers/gpu/drm/bridge/tc358775.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index 0b4efaca6d682..7496681c7b883 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -632,8 +632,7 @@ static int tc_attach_host(struct tc_data *tc)
>   
>   	dsi->lanes = tc->num_dsi_lanes;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
>   
>   	/*
>   	 * The hs_rate and lp_rate are data rate values. The HS mode is

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
