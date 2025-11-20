Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98BC72A82
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE310E059;
	Thu, 20 Nov 2025 07:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fc9OUAdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DD810E059
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 07:52:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42b32900c8bso294604f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 23:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763625125; x=1764229925; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ReENcngyzM03WgbJnSuzkHLNjZgppr3BAgQenIKojUE=;
 b=fc9OUAdEeqJUOzPyunn0H5We6h96YJkCJ3CMQVs6TY1UZMdYVh7jTNNFM8BiF31QXE
 +fvjY/bw2xcByqTDEZkGmSQXODWuidU7nJaNYCzKEYaU0JM+cZQ6+/Wk6cuxuVDwAQ8u
 DY1CrahZl4HHAd3tn44parLksNI4Y68qOgbI2Vh304hUzPKF2/x9f3c6KY3UWeJTTu4Q
 XVLiicpQLdnhAxsjGXhhVSgqJGa0Ames+NSEXr5OJr98r+L00BEZfgADc7hljS50lAAM
 eirhyelYCQr8O47zqYBKXujWD4+WaRu1Odqz0GZpUCWIC/NK8ccsW04z7en1Mw6jogS0
 6Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763625125; x=1764229925;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReENcngyzM03WgbJnSuzkHLNjZgppr3BAgQenIKojUE=;
 b=bVGKU1gvLlNKJfsK4CmnJvPPf1U/T4Tso6NX2R9puP6253AUCPsW6poWD9f+igUhzR
 mayPQ0CH8zuNtrB4ez/BNgQAVJbwVJaNX8TJww8uYnlDwU30jMvlf8Ubt5KOXQdCEgyO
 ja0saFm/BJb1vv7AKvr9slEuuSX2hJ6aAmtnIZNPNV/hVTfaR5A0VPV9mEDgZ4Cio+WV
 5TS7v2uxYhVfjA3jBwct47hkpvzhv7HgO81EJp/kd4lvXPUz7LADIGr+4fExcYmliLLE
 Gu1fkZE9u+N/LLPbOS/3ZK1lHtHXeQhC0zEZUK55Z5BU0d/riMdnEeNYRXB1le0L+irx
 vHjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRYxwGzmf3iLqR7GJUxgbRNd4nId92Y1bd+y4d6RHSm04vrRonRa4DHciLVYrju/H4MjSiPj/RVdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6BGCJi9BtW5J682vSTJBMNIcAJ3npnFdmpUhUDKN1zoQsuAuA
 zCGPS9pYMY9xAsycMDawMDdMUctDZ9B+T5igujtDAkUBpgGwr7ulp3Kz8XMb6MyVtPo=
X-Gm-Gg: ASbGncsL2FFfrbXJk1UiDGZU3Km4lkKr+tisc677IgqPWqj8mXNhRcmi7xAqSo2pKvH
 ZfC22kjyGAh/tnNbhhx4d9gQvVR2UafFAYpNjiTk3FwHJS62P6FnWaWXyYNtoSkwGSAOjMhVZI0
 QOkVGwzysAWEXxIrliX1tx0kSu8/iOyDLgr75fyZ4bFFzzK2wk0QdrhIeM/m/wYcXBbIcYOktJD
 c2mjciMjKmTdqslXPoKoW5Y5gmksHiUmi+xQPZf2XdTYE0H3V8H3u26pMCuy3nCz5ZED35x74cQ
 oVIjcY+iHlk6BFR0VOazXGPUquriUrRArACzCdsC8xB40AGi4ujMLKd19TGsc3g61zd/SNBPbI7
 IraNGk0FLocP5lfy/DhOGuvnvh6ltG5QPtvuv7wsnd7EUIIWu3EdyJdOHl5AG7tuK8WV88+IPeK
 JBBHiya1rd+iXRxhJwr6vPlDQ8gZJngOJUJQLVrpAgl/qEnm5OqVAcDlvP5YbK0h0=
X-Google-Smtp-Source: AGHT+IHJbNXExk3QbvJ70fYCSd3n3+OIKWC3XPgXPTNsrGmxJEFqbW9g/dL9I9nfYyeYfEk/XqzpTA==
X-Received: by 2002:a5d:64e6:0:b0:42b:3131:5437 with SMTP id
 ffacd0b85a97d-42cbb2a431dmr981386f8f.34.1763625124954; 
 Wed, 19 Nov 2025 23:52:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7?
 ([2a01:e0a:3d9:2080:f6e4:d897:2b4d:1bc7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cbd764dbesm474337f8f.27.2025.11.19.23.52.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 23:52:04 -0800 (PST)
Message-ID: <e80fd81e-fba2-4385-9fed-9d82b2e5b2cf@linaro.org>
Date: Thu, 20 Nov 2025 08:52:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: osd-osd101t2587-53ts: migrate to
 mipi_dsi_turn_on_peripheral_multi
To: Matt Smith <matthew.j.smith2@outlook.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <PH3PPFAB08B9FD3DE70CD833C0C470243EE99D4A@PH3PPFAB08B9FD3.namprd19.prod.outlook.com>
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
In-Reply-To: <PH3PPFAB08B9FD3DE70CD833C0C470243EE99D4A@PH3PPFAB08B9FD3.namprd19.prod.outlook.com>
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

On 11/20/25 03:25, Matt Smith wrote:
> Documentation/gpu/todo.rst lists to transition away from using
> deprecated methods in drm_mipi_dsi.c, so migrating from
> mipi_dsi_turn_on_peripheral to mipi_dsi_turn_on_peripheral_multi.
> 
> Used commit e139c0eb22ce ("drm/panel: mantix-mlaf057we51: transition
> to mipi_dsi wrapped functions") as a reference.
> 
> Signed-off-by: Matt Smith <matthew.j.smith2@outlook.com>
> ---
>   drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> index 2334b77f348c..45baf2c238d2 100644
> --- a/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> +++ b/drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c
> @@ -58,13 +58,14 @@ static int osd101t2587_panel_prepare(struct drm_panel *panel)
>   static int osd101t2587_panel_enable(struct drm_panel *panel)
>   {
>          struct osd101t2587_panel *osd101t2587 = ti_osd_panel(panel);
> -       int ret;
> 
> -       ret = mipi_dsi_turn_on_peripheral(osd101t2587->dsi);
> -       if (ret)
> -               return ret;
> +       struct mipi_dsi_multi_context dsi_ctx = {
> +               .dsi = osd101t2587->dsi
> +       };
> 
> -       return ret;
> +       mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
> +
> +       return dsi_ctx.accum_err;
>   }
> 
>   static const struct drm_display_mode default_mode_osd101t2587 = {
> --
> 2.49.0
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
