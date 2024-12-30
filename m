Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3DF9FE52B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638D710E375;
	Mon, 30 Dec 2024 10:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TDeJPumy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6DE510E375
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:11:28 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso7724537f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735553427; x=1736158227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3ip7pGqXck17wvsrarfD5jYciYFfcRaD6eiqga2iC0A=;
 b=TDeJPumyDMqxA93N1kKkcR/147du75NgGDcMoRXVLwrm9Ntu4kcByVL0Gy8dcPdn9J
 ozE/d5hSypghJfyyesWEClzvbAvTzFTYWu1JWUnnt4USapts85At5TKIttUYddwD2dUn
 jK04OH1HPyu1ssYmdn+CXImVvTbr0PPop+9xjhBNT166ydZE8enMqaCZXZHEQNY4l5MV
 RmEKL2hYqgBqoQ6raNnqe8bD8rQw4OFCIZ6CEcDnKrZCYjwAoZpPxWT3B7ndNXRXhVTn
 8WXGjtKlAGBBw7mU95K3aaNDytCvWaz+YG0hERn54+rk3JES4ywhqKhm9TUOe4Hr7ID7
 1Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735553427; x=1736158227;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3ip7pGqXck17wvsrarfD5jYciYFfcRaD6eiqga2iC0A=;
 b=WUtHox09wsxUAu8Kv7n7Ba3rKEdsDPZs2nN0KhPBePu/lQkpZCF67hHe3jimA9n/sI
 UY61n+ncOBYlREaEOFrxdwpi9+MjaQh+LikPcsITruX/Hpltq130cGIL7qDZhkw5e1s4
 39yBhLAfUtw+LEEtIPKDE5H1iImYzKrWJFg0u+E7LoTlSeY1PXBNYoiUWgeWI1ChdlLB
 HFiv5P9YdVB+vSIXdqZrxvyXH2jd/3vWRhNjMG/31e+9F0b0ulBa/X7IRxP1mwns/L+1
 RmXmYLLmFYwGsFWyryzbwBVrzXlYYEtwzk5wmr7PYdnLHPPy+ZGZj47m3/drT32QbOEH
 jeNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2JiHM5NgVIVdTsYttNop2/+W0/oEvTnu2ZfyiHwf3a5bM7ytYjAzK5ERk06e6N9vlb/HAt5QcWGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBVrTPchdrrB5Oj0e3E/7BFJ31DJod/rUwQ6OGx9WijaLUaoij
 5ZVbfiYSlgtdCBmRb+5GxsaFMwEJKHdstZDvXC6AJ74KpXPEnhY2GKYRiDL8V+k=
X-Gm-Gg: ASbGncsjyvqumjlWtYD/FIEWfwI7CdbzPKR8tvF48bpJn1DhkVVI9sPHIBiH5oTxt2+
 gQtOT1dAq+cPY9Wje4wp/4XrCGIY6jLTwhzihp1kRFGFanRJRC4AWDe68fI4ObBPCQmfRX9gpN/
 pwqzVmpf5SGwVEU3r3xECH0DfG3audQZCWvo5MDqeR8YfYxzP10NOhk8pie1pjXq8DXCsM4JRwH
 MCbJw5tTM5T93IGqU29wFqZKgdYzmwhV4LqyBOHwePRqi7XKmtgmmUrqKhn0C0ZwDr87Jf6yAnI
 tjVDEAVNEJggPPaZdduxZPqEVPgwDg2Q8w==
X-Google-Smtp-Source: AGHT+IGxfn0fqFZ1s4ULFUmsRowFykmhDUBGXcv/6abUFPyNNYsgfZIE+tATEya/iQV1N4R4OLW3sQ==
X-Received: by 2002:a5d:64a3:0:b0:385:f527:be6d with SMTP id
 ffacd0b85a97d-38a2240074fmr28284236f8f.36.1735553427163; 
 Mon, 30 Dec 2024 02:10:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:883b:3c16:2465:ad55?
 ([2a01:e0a:982:cbb0:883b:3c16:2465:ad55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c515sm352845965e9.30.2024.12.30.02.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 02:10:26 -0800 (PST)
Message-ID: <47738b2b-351b-4df9-a50a-f4dff51441c8@linaro.org>
Date: Mon, 30 Dec 2024 11:10:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241223052049.419831-1-tejasvipin76@gmail.com>
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
In-Reply-To: <20241223052049.419831-1-tejasvipin76@gmail.com>
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

On 23/12/2024 06:20, Tejas Vipin wrote:
> Changes the xinpeng-xpp055c272 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>   .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 185 ++++++++----------
>   1 file changed, 84 insertions(+), 101 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> index 22a14006765e..45a405669593 100644
> --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> @@ -59,90 +59,82 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
>   	return container_of(panel, struct xpp055c272, panel);
>   }
>   
> -static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
> +static void xpp055c272_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>   {
> -	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	struct device *dev = ctx->dev;
> -
>   	/*
>   	 * Init sequence was supplied by the panel vendor without much
>   	 * documentation.
>   	 */
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETMIPI,
> -			       0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> -			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> -			       0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> -			       0x00, 0x00, 0x37);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
> -			       0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
> -			       0x00, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETSCR,
> -			       0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
> -			       0x00);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEQ,
> -			       0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
> -			       0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER,
> -			       0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
> -			       0x67, 0x77, 0x33, 0x33);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
> -			       0xff, 0x01, 0xff);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
> -	msleep(20);
> -
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP1,
> -			       0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
> -			       0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
> -			       0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
> -			       0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
> -			       0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
> -			       0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
> -			       0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
> -			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP2,
> -			       0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
> -			       0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
> -			       0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
> -			       0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
> -			       0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
> -			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
> -			       0xa0, 0x00, 0x00, 0x00, 0x00);
> -	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
> -			       0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
> -			       0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
> -			       0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
> -			       0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
> -			       0x11, 0x18);
> -
> -	msleep(60);
> -
> -	dev_dbg(dev, "Panel init sequence done\n");
> -	return 0;
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETMIPI,
> +				     0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
> +				     0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
> +				     0x00, 0x00, 0x37);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPOWER_EXT, 0x25);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETRGBIF,
> +				     0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETSCR,
> +				     0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
> +				     0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETVDC, 0x46);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPANEL, 0x0b);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETCYC, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETEQ,
> +				     0x07, 0x07, 0x0b, 0x0b, 0x03, 0x0b, 0x00, 0x00,
> +				     0x00, 0x00, 0xff, 0x00, 0xC0, 0x10);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETPOWER,
> +				     0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
> +				     0x67, 0x77, 0x33, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
> +				     0xff, 0x01, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETBGP, 0x09, 0x09);
> +	mipi_dsi_msleep(dsi_ctx, 20);
> +
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETGIP1,
> +				     0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
> +				     0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
> +				     0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
> +				     0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
> +				     0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
> +				     0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
> +				     0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETGIP2,
> +				     0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
> +				     0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
> +				     0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
> +				     0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
> +				     0xa0, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(dsi_ctx, XPP055C272_CMD_SETGAMMA,
> +				     0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
> +				     0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
> +				     0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
> +				     0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
> +				     0x11, 0x18);
> +
> +	mipi_dsi_msleep(dsi_ctx, 60);
>   }
>   
>   static int xpp055c272_unprepare(struct drm_panel *panel)
>   {
>   	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> -
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0)
> -		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
> -
> -	mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "failed to enter sleep mode: %d\n", ret);
> -		return ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> +
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	if (dsi_ctx.accum_err) {
> +		dev_err(ctx->dev, "failed to enter sleep mode: %d\n",
> +			dsi_ctx.accum_err);
> +		return dsi_ctx.accum_err;
>   	}
>   
>   	regulator_disable(ctx->iovcc);
> @@ -155,17 +147,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
>   {
>   	struct xpp055c272 *ctx = panel_to_xpp055c272(panel);
>   	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>   
>   	dev_dbg(ctx->dev, "Resetting the panel\n");
> -	ret = regulator_enable(ctx->vci);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable vci supply: %d\n", ret);
> -		return ret;
> +	dsi_ctx.accum_err = regulator_enable(ctx->vci);
> +	if (dsi_ctx.accum_err) {

I would rather keep ret instead of abusing dsi_ctx.accum_err, but it's already like
that in other converted driver so I won't oppose it...

> +		dev_err(ctx->dev, "Failed to enable vci supply: %d\n",
> +			dsi_ctx.accum_err);
> +		return dsi_ctx.accum_err;
>   	}
> -	ret = regulator_enable(ctx->iovcc);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n", ret);
> +	dsi_ctx.accum_err = regulator_enable(ctx->iovcc);
> +	if (dsi_ctx.accum_err) {
> +		dev_err(ctx->dev, "Failed to enable iovcc supply: %d\n",
> +			dsi_ctx.accum_err);
>   		goto disable_vci;
>   	}
>   
> @@ -175,30 +169,19 @@ static int xpp055c272_prepare(struct drm_panel *panel)
>   	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>   
>   	/* T8: 20ms */
> -	msleep(20);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>   
> -	ret = xpp055c272_init_sequence(ctx);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
> -		goto disable_iovcc;
> -	}
> -
> -	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
> -		goto disable_iovcc;
> -	}
> +	xpp055c272_init_sequence(&dsi_ctx);
> +	dev_dbg(ctx->dev, "Panel init sequence done\n");
>   
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>   	/* T9: 120ms */
> -	msleep(120);
> +	mipi_dsi_msleep(&dsi_ctx, 120);
> +	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 50);
>   
> -	ret = mipi_dsi_dcs_set_display_on(dsi);
> -	if (ret < 0) {
> -		dev_err(ctx->dev, "Failed to set display on: %d\n", ret);
> +	if (dsi_ctx.accum_err)
>   		goto disable_iovcc;
> -	}
> -
> -	msleep(50);
>   
>   	return 0;
>   
> @@ -206,7 +189,7 @@ static int xpp055c272_prepare(struct drm_panel *panel)
>   	regulator_disable(ctx->iovcc);
>   disable_vci:
>   	regulator_disable(ctx->vci);
> -	return ret;
> +	return dsi_ctx.accum_err;
>   }
>   
>   static const struct drm_display_mode default_mode = {


Otherwise looks good


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Neil
