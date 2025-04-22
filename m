Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67942A95F99
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2FD10E15B;
	Tue, 22 Apr 2025 07:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SzLXWiOk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE39610E15B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 07:37:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso38530105e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 00:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745307424; x=1745912224; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=kUrrVHq/ZBK5ekax/PEJ1pXaon+z63IEgJE1VUWtPYI=;
 b=SzLXWiOkBDQLWHNMaUnqJ3WSgXJpa15KEdZcv77ccxgZOnSoLSHcOlP5tqDIgYqiqH
 DgClnenp3aviZKyfq27CS3uS7mcKaegR8uA86LjYHCuXbZjRcGfVssBJij9XQ2aPifNQ
 4HQG4xl+oi82J1ufRn5mTQ5/CxS4xQ6I4LAHk69FqWUqkLrNNaDvUC5fuatxd6sTCgFM
 YbmGgiNTgDJJ+oBTpm5w8pXUhNT+IOZiPfzoN1bxMf41J21ggXF/Tai9rLI38i5n9FQS
 918Vvju3iGT4nhMUFquI3rVA8cUODKKZwgcdcI201Z7ip/0jYdXCY7CqE/QzMuT+y+CR
 AEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745307424; x=1745912224;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kUrrVHq/ZBK5ekax/PEJ1pXaon+z63IEgJE1VUWtPYI=;
 b=CFZoO1rrX/B2/al6Fg4PD2c0AWs48bLX5R0eHX6BYLfAGW6R1kco3laEO0WYyg0tmu
 low8vw0KxIV81KPp/0pf5cuKY/yy/5QOgZaMLHXt7E6n4NueWVRo0tzDoRCU9puWXI5d
 0S9k2zemYzgkEr/4qnIG6Vnc+WQCd/ybteqFWU+hLo8383LDDvVdExGH9nkWe6qyOxv8
 o+1iA4C1Hwzv4oC0mLf689eKQDuFcSA+FT9bbXmwkJqhQRcdl08BWcWGPSriBwpH7iS8
 XQ9+ds6iCVtSaAN5tl1rqquuOYn58PaVtuKyI66WkgSw30dOhODVA7nTzk+ba+0wMhts
 HMXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyQm3ooIyHhJGgwXMEPwHAwcdSOVgHqR82Sq3ib+Vyv/P52coQcl9vb1GmtJXD/7qdK2XyphXXQqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx38s/x5Fhyw22nfVoJa+/KOcHGsWRqw0Skyi+uUmo0V6zj1mQS
 iGip/W7aXPaMACgaPceeY89kLMunW9hmDgmsION3dtfJUoLJmrKTNsKIGowX1Zs=
X-Gm-Gg: ASbGncuKDBWMTD7vR7Oe1eGISQ6fakm6ybaSESYz4lSRFGgg16l/qOlfh6H2Sd31rKu
 HVom5uF1EpV8IOM24lUL3jFc+6LcbnTsFDHm7cWRsjSfoNVJpa/0Fa5Q9WPtCot474IrXcCVEFd
 V376E0MGUieb/EzbBTnmeo+nKEAwjj1N2OpN7YNEaaUDG5ksirczxSpkzIa/jQufR1v3df8LDHR
 8HaISZVndBraCcWB8sPqB4wzdJc8p1VSOvpEdYfuW+2o4Vpe/n0cDqEKOa5i4UzFbqo+Xjk/JOu
 M8GZtSJ9vBNsXfmG/W6hthkZnkVvgqOxXwY1haw9vSkJz06DH/dIddiXogek2TOY50Tq0vOTJc0
 2daUfvwqhduZ1JR/LwQ==
X-Google-Smtp-Source: AGHT+IGso4dABw4cs3fgHi8irDW9ZqoJpIBb6x5x5lb1dz6I2it3QInwrgMPc2vZyS0ImCdphiPnkg==
X-Received: by 2002:a5d:64ae:0:b0:391:2d97:7d0e with SMTP id
 ffacd0b85a97d-39efbae0795mr10423116f8f.42.1745307424555; 
 Tue, 22 Apr 2025 00:37:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b137:7670:8eb9:746f?
 ([2a01:e0a:3d9:2080:b137:7670:8eb9:746f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408c7cfcabsm7042405e9.0.2025.04.22.00.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 00:37:04 -0700 (PDT)
Message-ID: <664fc9fb-aeed-4f45-8e4a-20bbba791d1e@linaro.org>
Date: Tue, 22 Apr 2025 09:37:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: jd9365da: fix reset signal polarity in
 unprepare
To: Hugo Villeneuve <hugo@hugovil.com>, Jagan Teki <jagan@edgeble.ai>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250417195507.778731-1-hugo@hugovil.com>
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
In-Reply-To: <20250417195507.778731-1-hugo@hugovil.com>
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

On 17/04/2025 21:55, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> commit a8972d5a49b4 ("drm: panel: jd9365da-h3: fix reset signal polarity")
> fixed reset signal polarity in jadard_dsi_probe() and jadard_prepare().
> 
> It was not done in jadard_unprepare() because of an incorrect assumption
> about reset line handling in power off mode. After looking into the
> datasheet, it now appears that before disabling regulators, the reset line
> is deasserted first, and if reset_before_power_off_vcioo is true, then the
> reset line is asserted.
> 
> Fix reset polarity by inverting gpiod_set_value() second argument in
> in jadard_unprepare().
> 
> Fixes: 6b818c533dd8 ("drm: panel: Add Jadard JD9365DA-H3 DSI panel")
> Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel")
> Fixes: a8972d5a49b4 ("drm: panel: jd9365da-h3: fix reset signal polarity")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>   drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> index 7d68a8acfe2ea..eb0f8373258c3 100644
> --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> @@ -129,11 +129,11 @@ static int jadard_unprepare(struct drm_panel *panel)
>   {
>   	struct jadard *jadard = panel_to_jadard(panel);
>   
> -	gpiod_set_value(jadard->reset, 1);
> +	gpiod_set_value(jadard->reset, 0);
>   	msleep(120);
>   
>   	if (jadard->desc->reset_before_power_off_vcioo) {
> -		gpiod_set_value(jadard->reset, 0);
> +		gpiod_set_value(jadard->reset, 1);
>   
>   		usleep_range(1000, 2000);
>   	}
> 
> base-commit: 7adf8b1afc14832de099f9e178f08f91dc0dd6d0

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
