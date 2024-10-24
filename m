Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59D9AE71B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 16:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DC510E111;
	Thu, 24 Oct 2024 14:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I0c6Knc3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA17110E111
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:02:56 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-37d808ae924so656413f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729778575; x=1730383375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4pxlHMb5AMgvpVGu1TIrG5oVzbcKbA0wfkWtUQw8bZc=;
 b=I0c6Knc3NI/p8x4TQ6SXDBaUX/MsA9V75FQWARkIKYKH+vhb+9eKEyrdrIE6Gt5qxI
 fqzFo5qrR65fHDIXtqXNkTcU5shZkG4g/ZCjWYciMUOEOpi/VCv9ZfPzBiZWMjJTaNgH
 iKqfmZ3NVb8GuBg8DXkMeWTAG7t1qurXq0rb2Tof/oxNfzA35Jfx/uvtQyjZhPgweMGs
 Pyo3gQclXLzTiDxbhtQKLFlT7aot+IqoPV/PnvWmENiXVyuGa9xpdzrcgSYZwyS4FpxH
 Ppgeu7vdFRgwRBqx7Lu1dHgPRE3pMC2MCCys7auOEy44eZgRS4RmahywXpTjQd13uMuK
 o0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729778575; x=1730383375;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4pxlHMb5AMgvpVGu1TIrG5oVzbcKbA0wfkWtUQw8bZc=;
 b=TbTwFYyB7g1atoj4qxeuhWL1IqB7zNeoDaDHwYeTfKDXxB5iQwOZ7C+7nmXGNfn+7g
 BakOqNI5jpxK/HCxydNoFl7XvYrdpLlvE3aDnAUOwHT09ALI17Rhz9rpE0qfVyEQAm/A
 xyo4bXiG4KoFOZdDJDkH9n4w2vwPSd5bJ864ZOMTTBaaK1yRMVNXFE/teYOolUwCxBrY
 BB2WWBiuILCBM1RB7DX2qhVvXaxISnp/K/H6lMm3LhybORwo+1kXHsJV5IfkytY7fLp8
 UOxhl0jWqCogS2VWXWmhOrLav3nREO5mo0kJXVKRfr2f2jMoxmz21U2hFd5/71xYVekP
 W21g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgjaS/So05FqgMmcl3+7Ab3SOGAhKSzP2FTMizOjbIpcVZJ00J1GstqZdd8ztUXz0ivnBCuIICPmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9Xf8dhgOjbF15h86ODcimt80Dq/XZs6EjjB/6CuTvJkrYMFW4
 96ylUiOWjDTeRA6/eGdt6rzZwkFjIimZsXQfwcaSmFI15Jvg3Ro+6Oi/qfIyJTg=
X-Google-Smtp-Source: AGHT+IHtwZ0D7Hbl6lV9vXaF6Yh+U6E2VIFK5c7xfn2hS1JAXlfziXP71xH9LYJKYWxoN3UwtKx2ZA==
X-Received: by 2002:adf:f151:0:b0:37d:5338:8733 with SMTP id
 ffacd0b85a97d-380458b6106mr1655793f8f.37.1729778574351; 
 Thu, 24 Oct 2024 07:02:54 -0700 (PDT)
Received: from [192.168.1.70] (147.48.71.86.rev.sfr.net. [86.71.48.147])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a37b5asm11376286f8f.10.2024.10.24.07.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Oct 2024 07:02:53 -0700 (PDT)
Message-ID: <5db25cea-10d5-4ed6-a385-141775a2a8bc@linaro.org>
Date: Thu, 24 Oct 2024 16:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: synaptics-r63353: Fix regulator unbalance
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20241024105050.3483542-1-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20241024105050.3483542-1-dario.binacchi@amarulasolutions.com>
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

On 24/10/2024 12:50, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> The shutdown function can be called when the display is already
> unprepared. For example during reboot this trigger a kernel
> backlog. Calling the drm_panel_unprepare, allow us to avoid
> to trigger the kernel warning.
> 
> Tested-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Could you add a Fixed tag ?


> 
> ---
> 
>   drivers/gpu/drm/panel/panel-synaptics-r63353.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> index 169c629746c7..17349825543f 100644
> --- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> @@ -325,7 +325,7 @@ static void r63353_panel_shutdown(struct mipi_dsi_device *dsi)
>   {
>   	struct r63353_panel *rpanel = mipi_dsi_get_drvdata(dsi);
>   
> -	r63353_panel_unprepare(&rpanel->base);
> +	drm_panel_unprepare(&rpanel->base);
>   }
>   
>   static const struct r63353_desc sharp_ls068b3sx02_data = {

With that:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
