Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADFB1A597
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834C110E229;
	Mon,  4 Aug 2025 15:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cD5Lc5Rh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEDC10E229
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:15:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso27661525e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754320537; x=1754925337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=nJjeVcCtnXKnWhoVwXfMDE8hWmtcV5EpJXafPxt/CSU=;
 b=cD5Lc5RhI33DfSn74tVcRaHcg1CUKB1Ul7jTC79yh0eVqZjcl5qAPV+iwmqpMFyarc
 ReoFxMwW0QTC84JDCeN5jeAzSpLBZJRo8FOzFn5orBeZSQip6CEhiqzsEvx9uSvIay4X
 /2dn8NPyMlNAUHkHDU1AnTJ5Muyv5Ve3nI4luuV91BauGZhYURgFV8BUtc6KpjTqknnT
 UbwAvEBXlbNTM2+JnzrNKig3Ahju1ZcUbpEhTtbSrcVrEQfze2+Vj7n+ikISZsLX+QuR
 XPaLzTKRPWErK7h9tziOESbSH8zwq4gz2l9e+WCcCXA3O5gVS1FcAekmBxAXFgqe/Nbk
 zTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754320537; x=1754925337;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nJjeVcCtnXKnWhoVwXfMDE8hWmtcV5EpJXafPxt/CSU=;
 b=Lqgn9NsW+Y7gTjRAFvlvhyUJMl/A0A/nnHY9mp8Qj7ACArefeviCI3ucgqxreJ3RhG
 eBhBsedX/tTmmniDkMcNAIqsWREs538W8/dC97oc9On/xECvePzalflRV9Kuhsb7EZ78
 oW5xy85yThU/+WnTk5+zHP4ZnMNiJTaDZ5hZ0fY9qre7FrS22hJvpCWxkJ7IBkT9MN20
 RT2W6rLpwa8KqcQlHz7s9rSRNSTX+3XgyLkBahmePtMnmg2ew32hXu7e7A0//hYZ6W3l
 vT60I1I8EWgT28kFyKF+TaUdxQ4u6GHg8tDbILbqt9dqGPHBApIBF7jsK+K8zJ3I/jzr
 qcCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6/EZgEp+uP7Dqhu+xchm6lVTWA6Q4kaU2G7zK5XzCUCtnDA1fjKQ2I6aWkbA84RIpAMjwpkRn4F0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1h/OFJNzBi6lR+Dd9fRMUtqAnVbo4762++AO/jXuGvyXUV8lW
 qFSErdcnDMqZueHaVxy/+d2xdNcr47Y8fx8HSRVX4DTfrL14e3LRCL6791KO75YkP3M=
X-Gm-Gg: ASbGncsdXwAHDKDRfi2t1g3Svak7vKzFAUGS96EUrpdXNdrc69kEgpqFkgf2fPSryMC
 n2ew07tQwY8rwx0HURNqZCuAgvlkTrJkhGXzJbyDMKrYooBWIon227z0y17zw1Sp+YBrR8/BymM
 D3fRYwO9Y3L+epQTlbWDDB4Ph1xfpsD/dIymM8NSqwah8fXBR9kbNstGttOtwfB10atFtO5MAOS
 ktCUdzFsruakgDuZjtetkZuyqlCpfPwNjXTlLhTJAOSSX/i/iU/wNzP0WisHhf2J5gKDQ8YfL+B
 CtYxX9db9/T+05Ylgg0j/Jm1RjEehicWS4SrsmshmE5Ic4v86KfAAjJ1bK0zYYJt1Yk6xfqfJRd
 tOpK/e9bgFKm0dHXgcsaWPSWTrEjmQ4ndheXQP4NUhV6au3Xj5PFDlctdsmltlTpWlfLi2K3fYV
 I=
X-Google-Smtp-Source: AGHT+IEETbK5B9R4l4zfHSKM2IatUBsewiluok9u8cat8QEYDfF7e+N5lM3tAMhEwAekOpfuhYvQ+A==
X-Received: by 2002:a05:600c:4ec6:b0:458:c059:7da0 with SMTP id
 5b1f17b1804b1-458c0597f5bmr62093385e9.2.1754320537459; 
 Mon, 04 Aug 2025 08:15:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589edf5638sm171780825e9.4.2025.08.04.08.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:15:37 -0700 (PDT)
Message-ID: <0a2963df-59a7-45a8-a74e-e6f4ff1f9868@linaro.org>
Date: Mon, 4 Aug 2025 17:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 01/13] drm/panel: ilitek-ili9881c: turn off power-supply
 when init fails
To: Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, hjc@rock-chips.com,
 andy.yan@rock-chips.com, andyshrk@163.com, nicolas.frattaroli@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250707164906.1445288-1-heiko@sntech.de>
 <20250707164906.1445288-2-heiko@sntech.de>
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
In-Reply-To: <20250707164906.1445288-2-heiko@sntech.de>
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

On 07/07/2025 18:48, Heiko Stuebner wrote:
> The prepare function turns on the power-supply regulator first, when
> preparing the display. But in an error case, just returns the error
> code, but does not power off the regulator again, fix that.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db..d7a17dca2a9c 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1292,7 +1292,7 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   						      instr->arg.cmd.data);
>   
>   		if (ret)
> -			return ret;
> +			goto disable_power;
>   	}
>   
>   	ret = ili9881c_switch_page(ctx, 0);
> @@ -1304,18 +1304,22 @@ static int ili9881c_prepare(struct drm_panel *panel)
>   					 &ctx->address_mode,
>   					 sizeof(ctx->address_mode));
>   		if (ret < 0)
> -			return ret;
> +			goto disable_power;
>   	}
>   
>   	ret = mipi_dsi_dcs_set_tear_on(ctx->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>   	if (ret)
> -		return ret;
> +		goto disable_power;
>   
>   	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
>   	if (ret)
> -		return ret;
> +		goto disable_power;
>   
>   	return 0;
> +
> +disable_power:
> +	regulator_disable(ctx->power);
> +	return ret;
>   }
>   
>   static int ili9881c_enable(struct drm_panel *panel)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
