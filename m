Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F45C1D3BA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6951D10E83A;
	Wed, 29 Oct 2025 20:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iSaAScPO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4305010E83A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:39:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475dbc3c9efso1821735e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761770380; x=1762375180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=5I7C6ZgZBcD6qnL0xn/jbMAlnZlBa2bm2Wl3A8ISkBw=;
 b=iSaAScPOjt7YNR7AE1qbsjBi/JFcLxy+1ztEK0DbzpV6s9n/NHonPjyYYcsZg7wCiH
 Wvc+deQLkSgsh4RLVoQkERSMcbIAyfYoEVZAWZQdT/lEwSyTudfHUOFiPEiWkq52ef9X
 qJQsoem6ZbpS7OY+CKBj2Fg4GzfMSWK3pBTs0p3vM+uE3UbtFpDaCCOgN4GU7BBxt9bT
 qjapdOhtg3DU2+VARb1ssTsm4R3C/0Mllu4Bja4NtIMvVrECGe1YoXNjIz4NT5oPrNV3
 PByjeeVdidO8QllLYqpbB6qWl7+k/eixypkd47oCh58NDPoCX7phRgQeU82zqN7RZF4n
 GybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761770380; x=1762375180;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=5I7C6ZgZBcD6qnL0xn/jbMAlnZlBa2bm2Wl3A8ISkBw=;
 b=C1S2UBLGrij9zTZGgZQd/RAfKQImB6DAInsltEX2Y1DrEEMxdltQqV1ELh075+H8iu
 EBWXEN9h5USXpEAl/fCw1VxCMSnq0nNf9gsGMtlfkGY5G0QOgadWjk6kFNdwgyeAC7eo
 mgRtYIR/8d7uEUIJ5OlxupGwXNFzHHaTl6O0Zf160lhYN0FPFzYWSaSX17BA3AcHl0L9
 a21ralNm727fZgfELz8+tLdTViXbvHup1obI1vdbqqCkVL9ocHqvjJJSTRr81IbSBKvi
 4NThIpW/gAJG/eE/bFInlfWUVcIfbdV331ZuDTwEn1MBsxF+N6fdu1pUYSXkHEPZi5Vo
 IPuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEmcbR49KCsWrfmqjm5AShdri11Pqw5StBREBOtAIxAxUzBsEy/fjnNcpD5FgcwLVg6DBUsAF8xr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfOeykRztTurkK/WHCeE0erd0hRXwvREfdrvyxOGEScs82G4GX
 A7ZwS3zmXMw262UidwGc66EOw+rtEBK+YhgSYTc/3uumdT7wlkgqp6Kyrb28uR2UkZI=
X-Gm-Gg: ASbGncsNJXkzcvmTXw1wx4BxbYFwImqIKEuLAPjNaubcRBu1io0ZdnOj57y4NvD0aUd
 cLGqdjDRdFxZ9J+FPGsKfDRpoZMn2mbfIW/cNGiDk3XqPl9e+JsfYPZoBczFpW++jmPr4xl9sfZ
 aBqTGrvGdiT1n2O9+c6cZg9m+LwAN2BPLi1SLAZW4bsOhwNy5xE7oEfySDzgSnvpKhs/i3szZJl
 ZbiKV9S3Io2mXpzYwMJoKuFf3UngHgeailxgoHCzHLvc9DJXvs2F7IFY3dIEP3175jE1xIkOD3a
 sEsFmqitislJt0SZdY1JhXSb5aCkF9/3XCdI8ycAzdpxR1vF/BJb8VRduJ0sXgGnHG6HS9eaWtE
 tGJ8th7UsrOZ/+ZKVCUcTQ4Kb+7cxeQgo9pE6IjmN4i9ikwZpFy45FaHCobalujzrIflr9GifAs
 FsRs81+s/S7T8mNu+TiPElPKFMK8e3h6fB/ei4l1PkIkYuH2Gwyw==
X-Google-Smtp-Source: AGHT+IED4MnHuoUIY/M09MCRLyO+H754ZygSqy9/2M/qMze54F1qyR8E8hz3TcZxMmaNL41buVyjHA==
X-Received: by 2002:a05:600c:528f:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-47726872581mr5311295e9.25.1761770379759; 
 Wed, 29 Oct 2025 13:39:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0?
 ([2a01:e0a:cad:2140:3447:eb7a:cb9f:5e0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289998f3sm2404735e9.4.2025.10.29.13.39.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 13:39:39 -0700 (PDT)
Message-ID: <cdb7ab69-3037-44c9-834b-1d747b299ea4@linaro.org>
Date: Wed, 29 Oct 2025 21:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: kingdisplay-kd097d04: Disable EoTp
To: Sebastian Fleer <dev@dwurp.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Christoph Fritz <chf.fritz@googlemail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jens Reidel <adrian@postmarketos.org>
References: <20251029124007.232333-1-dev@dwurp.de>
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
In-Reply-To: <20251029124007.232333-1-dev@dwurp.de>
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

On 10/29/25 13:35, Sebastian Fleer wrote:
> Since commit d97e71e44937 ("drm/bridge: synopsys: dw-mipi-dsi: enable EoTp by
> default") panel output on an Acer Chromebook Tab 10 (google-dru) is corrupted.
> The tablet I use is equipped with a kingdisplay-kd097d04 panel, disabling EoTp
> restores the correct functionality.
> 
> Fixes: 2a994cbed6b2 ("drm/panel: Add Kingdisplay KD097D04 panel driver")
> Suggested-by: Jens Reidel <adrian@postmarketos.org>
> Signed-off-by: Sebastian Fleer <dev@dwurp.de>
> ---
> 
> Changes in v2:
> - Reference correct commit in Fixes tag
> - Added Suggested-by
> 
> ---
>   drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> index 2fc7b0779b37..893af9b16756 100644
> --- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> +++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
> @@ -359,7 +359,7 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
>   	dsi->lanes = 4;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> -			  MIPI_DSI_MODE_LPM;
> +			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
>   
>   	kingdisplay = devm_drm_panel_alloc(&dsi->dev, __typeof(*kingdisplay), base,
>   					   &kingdisplay_panel_funcs,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
