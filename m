Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2DAEE2CB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E659910E4A2;
	Mon, 30 Jun 2025 15:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JzplOMUl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C1510E495
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:38:54 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso4925471f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751297933; x=1751902733; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PCjZELzPSxS9QYqPKLbec2iBxlI/QaXykzgWpjGlKU4=;
 b=JzplOMUlVZsNP0Ils7um7oS+gIgRc0vS57xjcLiCPRUM0vzGnyX1h2uMyHtXe/X23Y
 w3+OiWw6oNA/OzzgOTukzUy0N7SM7PwnaQ8wiAjDQVMdr9A0emSPmi/8PecdCjZF+Kdg
 HbCv1MJjRrF36lOltFzBc5Hw4Szkoqat5M0lMY9K9D5SWbS4NCBDcqj4V++h5Po3Dw06
 TUcF1Q9/IBqtiekhGpeOeyGWteDp2XpnPas4yJs5vnpaRy9NJ+CGKNYNpkJB0ENB6oBU
 wqG6QdrrTL7R44BNnnbxSD828vJeTu8MOMF7/FULZDfitOkNF/lIf3s8Cwgtnws8ScYX
 nIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751297933; x=1751902733;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PCjZELzPSxS9QYqPKLbec2iBxlI/QaXykzgWpjGlKU4=;
 b=s5C7YQUxFD8x7VCS9qxtk/xR07DgjOaTubS7DY9DZ1PQ+Q9lto8ieu7O1X873juKI0
 JeLMNCPBhf43UVa3uqGi7hmLOwsxCvC8LfZ/GSe1cutmibMY4Psnr5WDZnVfIHBqFNvh
 c+V0kubFep2UOxAw2AoDo696DgeJIs9inP5ZupWIn9MDFajvYaVYV3oWQDF86A1zt3yn
 uEyRnVsZmXWFLaTWKKGjkaSLuf6u29dzWh+YRfEc61SO2n4u8oESrjm8Eak0/Z3sdmum
 +CuV5vxlubHhv72sTk2c5lUUx6mrAS1IOlUZgj+yjqHyFLB9uHy9EllWb/V/maDjHuVe
 VDDQ==
X-Gm-Message-State: AOJu0Yx/dzQJy666xdhmyorUxiK7oV/ZIFhbWWbFAHLqh6FmiJZWQ/Ri
 eeDNc5ngRFT+Gk9/acSED7yqlXX21F9j5mxDLekLxpswy7nqPHpk5tgEInuGnB+iJfY=
X-Gm-Gg: ASbGncsvcsR804UEbAmihUjPbcV/eZmgmuQ4T0t1ufDjQhCELG+tcy+tBeu/UBY0gFq
 LX0rw6CXzHD98HeUCBBBos3M/+NnGzb+lroh5fq8Rxw2flsfYCtHmYRf94B3Xgk+IjezawYvpd2
 YJ8JaUjA4YNFk/MaZ8RJEIaAc2cCwbgQ7YuD0ifU+06YvcpIws+bPiUKPHOY5vYBQVl0OELIEbR
 jYq+lbtK+/B4Qb6UVg5tu8NqRgKmKgxFY4CT9r1S5ZuvIrv9W9tUy3tqd8et7KhI7P+/KF9x3zR
 XehVa0pVvdGeyTEsi4229rnQQcFnxzrMbIhTdENgvaHMYPcksrXqG5Lb8mxJa42UF5RiC/vHBHZ
 MKAreLxfIcDgeFI0yfrAfK5rjGv2U2gVBHKgb9Os=
X-Google-Smtp-Source: AGHT+IFqHhtP4Y3HxrFKlrCGwcR9+plw1U5mclKPp/UnXXU0dZLGQ5Cy0Ec0Lil6vNNQxT0a+WTX3w==
X-Received: by 2002:a5d:6409:0:b0:3a4:deb9:8964 with SMTP id
 ffacd0b85a97d-3a90d69ccd2mr9641294f8f.17.1751297933367; 
 Mon, 30 Jun 2025 08:38:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb?
 ([2a01:e0a:3d9:2080:abe8:a49c:efe7:4dfb])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3fe28dsm139822205e9.20.2025.06.30.08.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:38:53 -0700 (PDT)
Message-ID: <d105602f-6884-4a02-bc08-4ecd33781c56@linaro.org>
Date: Mon, 30 Jun 2025 17:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/4] drm/panel: samsung-s6e8aa0: Drop
 MIPI_DSI_MODE_VSYNC_FLUSH flag
To: Philipp Zabel <p.zabel@pengutronix.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <20250627-dsi-vsync-flush-v2-0-4066899a5608@pengutronix.de>
 <20250627-dsi-vsync-flush-v2-3-4066899a5608@pengutronix.de>
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
In-Reply-To: <20250627-dsi-vsync-flush-v2-3-4066899a5608@pengutronix.de>
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

On 27/06/2025 13:45, Philipp Zabel wrote:
> Drop the MIPI_DSI_MODE_VSYNC_FLUSH flag from DSI mode_flags.
> It has no effect anymore.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> index 897df195f2f3437224d1fe9f42d0bfc761541ab2..1b5c500d4f4eb7d43dff4b452a0f1b1bc06f5a2c 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> @@ -992,7 +992,7 @@ static int s6e8aa0_probe(struct mipi_dsi_device *dsi)
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST
> -		| MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_AUTO_VERT;
> +		| MIPI_DSI_MODE_VIDEO_AUTO_VERT;
>   
>   	ret = s6e8aa0_parse_dt(ctx);
>   	if (ret < 0)
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

All patches can go with patch 1.

Neil
