Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B9CF743A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC4D10E497;
	Tue,  6 Jan 2026 08:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PnmKKXK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5228F10E497
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:17:53 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47775fb6cb4so3937885e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687472; x=1768292272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xpYK8t/OJRJmN+PSJ7JLcZ9XbkpGoETQvM5T9K6UUYE=;
 b=PnmKKXK9N38j2kCaLXkXRsrYWKqHaQjK9nHeFmeOIUqe14s1rVkxBNEPx2VQd+viJE
 2+QDUWTl+KETcVAFvnONCeCnS+wTG+t3+r+TwPBskraEP2qoKfz9+BNM3xIsWs2Awo0H
 X3XBvyQysySvA5t2+bPMb3kM8OPOI1S+8b/3A9srAy1ody/wzNjtQjHTBPzeOji42SPa
 F928bmeUb8CyP3qEsNJ/YVbZVDuVq2SbXG1mMmjDoAcs0sTiHBZ+8rCHR4RPAyDnTBhU
 +fQY3vK3KBngB2QMF/24oC3go9NTSuX/phMXPHZg1u86tiAOfFJ9uqaYImj6UbH+qyy3
 VNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687472; x=1768292272;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpYK8t/OJRJmN+PSJ7JLcZ9XbkpGoETQvM5T9K6UUYE=;
 b=TuTOs6vJKtM4KtsA2xFPN6AiW+NoH1Td+3RHFdR0I61ypPa9gOp55UJxjBL4W/VwJP
 jf8gTg8IkbogK6IxshVjGFuohV41iRGq3f6Ske3OjUo38j1Lb/QDmuccXvJqP464dojP
 EG2yoPn49qRD62l0aggGYnFvAynmvLdCWrkpbuv139LgONqWYDDOAFqV/hz09z1bABBz
 mtP1w78UJO9nVbkIowxi2BrHaSSb029kTZ7sUAqTR5EdrNvhzDDraY49+ouaQiHEnS29
 vXgaVOJItALTD/ew51+OfktRZWY/4kNJVXEOHwiK8kNKK+Rmwcig7frNiC690AMH/U+L
 J2ZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHxTWHYL3uLql6khN7mt63MwOno0oB0N6yhNy9WMpVJGnsY7+GgvSWNEuI0+mYQ1tvToO7XcYx5K4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7ic9EXSzCy8Cr29V4r7fAhKqVdLWx4W1YrRK1P8ILRsKoJAny
 fylbWaJoKf+fuGuru9KLmdwGnBbzC2UMaYsjEOzMZ8eArtogSxaiwp6C4g0Yh1JiM9w=
X-Gm-Gg: AY/fxX6fzUsM2EZ8siOeTmEXd6zctBp8VmRNnSEp7nbqoUxOF4vfugMD8Tfb7DFG24f
 RVFBV6pTvWl/POH7bWCPrJwc7oFHa4Vvbr9QjmGxHNYB4BIIAhb+znFTy613rgu+LFCk7sm6lE9
 kvdUWSQ/vHyt3Bgvx6Jaf1ek+Po1s+eXvEokdB5V5NsAdXMZkZ2F6VLa4mGy+Y4cAbyYwTILw0a
 9XhqbsQpzw5fIg3EHuc/U+SnPhDmF1UQNAH/J3ssg7lpc7mYQqIsOlzIKK22iTa10G6oCblYXBW
 SiRcWZaMJ6BA2fk5JBI5MD1rREvpdE+Jt6UV6muvX8LdbOFkkWKtY0Iw3S9MerVnvUQhV3cQC/1
 mnw8GmZRfguuaKqj2xdUUoJSwu7HH1Iq6aRgg4q828jjQk+QXVi4xB2eWu9fipwItnDpbpDxXvy
 jm9ABouKZs9e9+cO0KaZC/MTLPFRWa+4yABpzbNPWk1QEkBwVlVQYcI/qWZQA2ONI=
X-Google-Smtp-Source: AGHT+IFj2sTnkrdb0xNAa92YuqCKMQq+gy1Z2Vc+W3R0a1wBcQ+SULSD45bl67jKkYjOqU1eYwLFfQ==
X-Received: by 2002:a05:600c:b93:b0:47a:7aa0:175a with SMTP id
 5b1f17b1804b1-47d7f09db80mr22072935e9.26.1767687471608; 
 Tue, 06 Jan 2026 00:17:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7faecaccsm12323895e9.2.2026.01.06.00.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:17:51 -0800 (PST)
Message-ID: <b7103a08-f307-4748-895e-61083e3810f2@linaro.org>
Date: Tue, 6 Jan 2026 09:17:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/panel: himax-hx83102: add panel starry
 xr109ia2t
To: Vladimir Yakovlev <vovchkir@gmail.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251208160918.3760498-1-vovchkir@gmail.com>
 <20251208160918.3760498-2-vovchkir@gmail.com>
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
In-Reply-To: <20251208160918.3760498-2-vovchkir@gmail.com>
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

On 12/8/25 17:09, Vladimir Yakovlev wrote:
> The STARRY XR109AI2T is a 10.95" 1200x2000 (WUXGA+) TFT LCD panel with
> himax-hx83102 controller. Hence, we add a new compatible with panel
> specific config.
> 
> Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx83102.c | 193 ++++++++++++++++++++
>   1 file changed, 193 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> index 4c432d207634..602f1adfc8ee 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> @@ -23,6 +23,7 @@
>   /* Manufacturer specific DSI commands */
>   #define HX83102_SETPOWER	0xb1
>   #define HX83102_SETDISP		0xb2
> +#define HX83102_SETRGBIF	0xb3
>   #define HX83102_SETCYC		0xb4
>   #define HX83102_UNKNOWN_B6	0xb6
>   #define HX83102_UNKNOWN_B8	0xb8
> @@ -33,6 +34,7 @@
>   #define HX83102_UNKNOWN_BE	0xbe
>   #define HX83102_SETPTBA		0xbf
>   #define HX83102_SETSTBA		0xc0
> +#define HX83102_SETDGCLUT	0xc1
>   #define HX83102_SETTCON		0xc7
>   #define HX83102_SETRAMDMY	0xc8
>   #define HX83102_SETPWM		0xc9
> @@ -701,6 +703,172 @@ static int starry_2082109qfh040022_50e_init(struct hx83102 *ctx)
>   	return dsi_ctx.accum_err;
>   }
>   
> +static int starry_himax83102_xr109_init(struct hx83102 *ctx)
> +{
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> +
> +	msleep(60);
> +
> +	hx83102_enable_extended_cmds(&dsi_ctx, true);
> +
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x2c, 0xb1,
> +				     0xb1, 0x2d, 0xed, 0x32, 0xd7, 0x43, 0x36,
> +				     0x36, 0x36, 0x36);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xd9);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x78, 0x33);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDISP, 0x00, 0x47,
> +				     0xb0, 0xd0, 0x00, 0x12, 0x72, 0x3c, 0x9b,
> +				     0x22, 0x02, 0x02, 0x00, 0x88, 0xf0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRGBIF, 0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x6a, 0x6a,
> +				     0x6a, 0x6a, 0x6a, 0x6a, 0x6a, 0x4d, 0x6a,
> +				     0x4d, 0x01, 0x95);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_B8, 0x40);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETVDC, 0x1b, 0x04);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcd);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x84);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_BE, 0x20);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPTBA, 0xfc, 0xc4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSTBA, 0x32, 0x32,
> +				     0x22, 0x11, 0x33, 0xa0, 0x61, 0x08, 0xf5,
> +				     0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTCON, 0x80);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETRAMDMY, 0x97);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPWM, 0x00, 0x1e,
> +				     0x30, 0xd4, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x08, 0x13,
> +				     0x07, 0x00, 0x0e, 0xa1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPANEL, 0x02, 0x03,
> +				     0x44);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCASCADE, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPCTRL, 0x37, 0x06,
> +				     0x00, 0x02, 0x04, 0x0c, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x1f, 0x11,
> +				     0x1f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x06, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x6b, 0x03, 0xaa, 0xab, 0x0e, 0x0e, 0x03,
> +				     0x03, 0x98, 0x10, 0x08, 0x00, 0x08, 0x32,
> +				     0x17, 0xde, 0x07, 0xde, 0x32, 0x17, 0xe2,
> +				     0x07, 0xe2, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP1, 0x18, 0x18,
> +				     0x18, 0x18, 0x18, 0x18, 0x48, 0x48, 0x18,
> +				     0x18, 0x18, 0x18, 0x22, 0x23, 0x1f, 0x1f,
> +				     0x1e, 0x1e, 0x24, 0x25, 0x26, 0x27, 0x28,
> +				     0x29, 0x2a, 0x2b, 0x00, 0x01, 0x02, 0x03,
> +				     0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a,
> +				     0x0b, 0x20, 0x21, 0x18, 0x18, 0x18, 0x18);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0xaa,
> +				     0xaa, 0xaa, 0xaa, 0x00, 0x00, 0xaa, 0xaa,
> +				     0xaa, 0xaa, 0x00, 0x00, 0xaa, 0xea, 0xaa,
> +				     0xaa, 0x00, 0x00, 0xaa, 0xea, 0xaa, 0xaa,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGMA, 0x00, 0x02,
> +				     0x08, 0x0d, 0x12, 0x18, 0x2c, 0x32, 0x38,
> +				     0x34, 0x4f, 0x56, 0x5e, 0x70, 0x72, 0x7e,
> +				     0x89, 0x9e, 0x9f, 0x50, 0x59, 0x62, 0x68,
> +				     0x00, 0x02, 0x08, 0x0d, 0x12, 0x18, 0x2c,
> +				     0x32, 0x38, 0x34, 0x4f, 0x56, 0x5e, 0x70,
> +				     0x72, 0x7e, 0x89, 0x9e, 0x9f, 0x50, 0x59,
> +				     0x65, 0x74);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x08, 0x10,
> +				     0x10, 0x1b, 0x22, 0x95, 0x01, 0x5c, 0x97,
> +				     0x14, 0x14, 0x00, 0x00, 0x00, 0x00, 0x12,
> +				     0x05, 0x02, 0x02, 0x10, 0x33, 0x02, 0x04,
> +				     0x18, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETPOWER, 0x01, 0xbf,
> +				     0x11);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
> +				     0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20,
> +				     0x24, 0x28, 0x2d, 0x30, 0x35, 0x39, 0x3d,
> +				     0x41, 0x46, 0x4a, 0x4e, 0x56, 0x5d, 0x65,
> +				     0x6e, 0x76, 0x7e, 0x86, 0x8d, 0x96, 0x9e,
> +				     0xa5, 0xad, 0xb6, 0xbe, 0xc6, 0xcf, 0xd6,
> +				     0xde, 0xe6, 0xed, 0xf5, 0xf9, 0xfa, 0xfc,
> +				     0xfe, 0xff, 0x19, 0xa6, 0xbc, 0xdf, 0xc0,
> +				     0x7d, 0x97, 0x2e, 0x24, 0xb6, 0x4d, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCLOCK, 0x86);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_UNKNOWN_D2, 0x3c);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x00, 0x00,
> +				     0x00, 0x80, 0x80, 0x0c, 0xa1);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0x00, 0xff,
> +				     0xff, 0xff, 0xff, 0x00, 0x00, 0xff, 0xff,
> +				     0xff, 0xff);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0x02, 0x00,
> +				     0x3e, 0x01, 0x83, 0x0f, 0x7e, 0x10, 0xa0,
> +				     0x00, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x02);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
> +				     0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x20,
> +				     0x24, 0x28, 0x2c, 0x30, 0x34, 0x39, 0x3d,
> +				     0x41, 0x45, 0x49, 0x4d, 0x55, 0x5c, 0x64,
> +				     0x6c, 0x75, 0x7c, 0x84, 0x8c, 0x94, 0x9c,
> +				     0xa4, 0xab, 0xb4, 0xbc, 0xc4, 0xcd, 0xd4,
> +				     0xdd, 0xe5, 0xec, 0xf4, 0xf8, 0xfa, 0xfc,
> +				     0xfe, 0xff, 0x19, 0x95, 0x6b, 0x70, 0x15,
> +				     0x7b, 0x3d, 0xa6, 0x28, 0xc2, 0x94, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xcc);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP0, 0x02, 0x1D,
> +				     0xe0, 0x11, 0x70);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xab, 0xff,
> +				     0xff, 0xff, 0xff, 0xa0, 0xab, 0xff, 0xff,
> +				     0xff, 0xff, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETTP1, 0xfb, 0x01,
> +				     0xfb, 0x01, 0xfb, 0x01, 0x00, 0x00, 0x00,
> +				     0x26, 0x00, 0x26, 0x81, 0x02, 0x40, 0x00,
> +				     0x20, 0x94, 0x05, 0x04, 0x03, 0x02, 0x01,
> +				     0x00, 0x00, 0x00, 0x01, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x03);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc6);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETCYC, 0x03, 0xff,
> +				     0xf0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETDGCLUT, 0x00, 0x04,
> +				     0x08, 0x0c, 0x10, 0x14, 0x18, 0x1c, 0x1f,
> +				     0x24, 0x28, 0x2b, 0x2f, 0x33, 0x38, 0x3c,
> +				     0x3f, 0x43, 0x47, 0x4b, 0x53, 0x5b, 0x62,
> +				     0x6a, 0x73, 0x7b, 0x82, 0x8a, 0x92, 0x9a,
> +				     0xa2, 0xa9, 0xb2, 0xba, 0xc3, 0xcb, 0xd3,
> +				     0xdb, 0xe4, 0xeb, 0xf3, 0xf8, 0xfa, 0xfc,
> +				     0xfe, 0xff, 0x11, 0x90, 0xc3, 0xa0, 0xff,
> +				     0xdb, 0x0d, 0x7b, 0x72, 0xa2, 0xc0, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETGIP3, 0xaa, 0xbb,
> +				     0xea, 0xaa, 0xaa, 0xa0, 0xaa, 0xbb, 0xea,
> +				     0xaa, 0xaa, 0xa0, 0xab, 0xff, 0xff, 0xff,
> +				     0xff, 0xa0, 0xab, 0xff, 0xff, 0xff, 0xff,
> +				     0xa0, 0xaa, 0xba, 0xaa, 0xaa, 0xaa, 0xa0,
> +				     0xaa, 0xba, 0xaa, 0xaa, 0xaa, 0xa0);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc4);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x96);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x01);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0xc5);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETMIPI, 0x4f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETSPCCMD, 0x3f);
> +	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83102_SETBANK, 0x00);
> +
> +	hx83102_enable_extended_cmds(&dsi_ctx, false);
> +
> +	mipi_dsi_msleep(&dsi_ctx, 60);
> +
> +	return dsi_ctx.accum_err;
> +}
> +
>   static const struct drm_display_mode starry_mode = {
>   	.clock = 162680,
>   	.hdisplay = 1200,
> @@ -833,6 +1001,28 @@ static const struct hx83102_panel_desc starry_2082109qfh040022_50e_desc = {
>   	.init = starry_2082109qfh040022_50e_init,
>   };
>   
> +static const struct drm_display_mode starry_himax83102_xr109_default_mode = {
> +	.clock = 168500,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 55,
> +	.hsync_end = 1200 + 55 + 20,
> +	.htotal = 1200 + 55 + 20 + 40,
> +	.vdisplay = 2000,
> +	.vsync_start = 2000 + 116,
> +	.vsync_end = 2000 + 116 + 8,
> +	.vtotal = 2000 + 116 + 8 + 12,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct hx83102_panel_desc starry_himax83102_xr109_desc = {
> +	.modes = &starry_himax83102_xr109_default_mode,
> +	.size = {
> +		.width_mm = 143,
> +		.height_mm = 239,
> +	},
> +	.init = starry_himax83102_xr109_init,
> +};
> +
>   static int hx83102_enable(struct drm_panel *panel)
>   {
>   	msleep(130);
> @@ -1069,6 +1259,9 @@ static const struct of_device_id hx83102_of_match[] = {
>   	{ .compatible = "starry,himax83102-j02",
>   	  .data = &starry_desc
>   	},
> +	{ .compatible = "starry,himax83102-xr109",
> +	  .data = &starry_himax83102_xr109_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, hx83102_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
