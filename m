Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F033CF7403
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E84C10E49D;
	Tue,  6 Jan 2026 08:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mpjwYcsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7432910E49D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:15:22 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so4689555e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687321; x=1768292121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WlcLJcRv6NmifS5tk12ISHXHC1kObcbQiLoIFthBsgY=;
 b=mpjwYcsgGQeSM9AkNe8Ptx6PTxR9VuHQtnmxLscW2dTJblruHZcdiiqeDGl+JW+AFv
 rbzwQViW8KHH4tqb46qciewB2bkvnsGiaqPurecDdnncugrRxpYRDSu5Z07m3mB0c91a
 N6kp2i1C1aNdRXAL/1dsV4JJrQsFSynhy0deotA7i48hWs2J8ZeZBoPb8n13BHdKj+Yb
 ceTGlJ744zjgD8ljBE2xFHz0++iNCi1lDkRH/zMqImQTq8zmpbqF1J0h9/8rQhhswr9E
 /etoFSZg9WFBh5OS9BWpPh2bDLMWzVvAPskZ8g69QMfzBaVF35kfb1vB+GkP9sXQtY43
 keGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687321; x=1768292121;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlcLJcRv6NmifS5tk12ISHXHC1kObcbQiLoIFthBsgY=;
 b=i/YPKgrimo6DrGMgt4U1pDI9eyFSkjpDVLOGIPbZVWu5jI30vasb8/bDSOvpv6HvCf
 MYYe55nG19M99o3GAdidWYpLHcUK028NDyzR1Yli5NFyYc8mGNBHZ2AxeZd8LrsBIP/4
 PQpnkXd8LRljCP5ccmYM+8mQFDbNrfhKVExE/GjE14IWRcL2MEcQedNszbYrwY9jNOWW
 w5dm7w7LZK4/7n7yjYTBnjA7RwwiZqAUNa/vtDrEjTbfoALFehsJhSBeziuruvLSl1lp
 vmXSazYeCuL5RwBX7I+1KWWaFgrRUbNM2otQJegYeRSzqxMBlrFQS0Zce9kl6mZmBGIX
 1pIA==
X-Gm-Message-State: AOJu0YzRZSgDlf4OJlMfX2/a1pWdgAPnQtWR/h273OV8i204gaVhJFjn
 Qp+zUaAGfrn6lTjwdDY6NdDdqqOAlYhso6YQBds4/lpjH1MRVQZinY1PNqW86kL0PDY=
X-Gm-Gg: AY/fxX5r+4v8hFUe+snp7+MxhbPNG4Wk8NR0qNKPaPlFwrGnfyFxYXkNq0K8wuzBAc9
 IGl1SmS6yNp6wbvAHenvr5hiRFj/zcC60H0zkbC3iDm/wVXFwNu41ttQte2Mxr1BD5QgZXfPaUA
 13sBkme4cB2BUnsSuekYlT71lPfPsGIxCZNPHlP+Xz0QrFcqjBd6A4rMxYtHfFQs6KzpubNWOrO
 iyNTQq11UidctDgGlBEEulmT4gUnv3TRgXannCuDie31Uxjnui3D5F3vRavoR8PNkEuwXfRQNBq
 YWxHtLd52rtjBaK0ut3DwwU4r8diN+j5FTGMEAGly6yygk9+9XMx/Yv5mHYBAiN3z9Vwb4mkW+4
 0ypRS3p7moUKPvMwRVLUPVUeKShhFc8+SHop7M3pwZwh79Ji/6vnKdgKiLHEtei5piXtAdWgYYZ
 o64sNkzbY24amneyLr77R8oauK5BPSPWYanp7zKpbXFadgR60BurWFGAU/RMqLxbI=
X-Google-Smtp-Source: AGHT+IFWWMC+vC3Jv1zN8otnZ5o0DsOhfa+A4/daWU3DP9hf9GKf9S7nKRd7ftIFNdP05wOd8OCVIQ==
X-Received: by 2002:a05:600c:a112:b0:477:5639:ff66 with SMTP id
 5b1f17b1804b1-47d7f627b7fmr20939945e9.13.1767687320848; 
 Tue, 06 Jan 2026 00:15:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5dfa07sm2901051f8f.25.2026.01.06.00.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:15:20 -0800 (PST)
Message-ID: <d0751b98-86d6-4088-a4c4-cfa77fe0c241@linaro.org>
Date: Tue, 6 Jan 2026 09:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/5] drm/panel: mantix: Improve power off sequence
To: sebastian.krzyszkowiak@puri.sm, =?UTF-8?Q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
 <20260105-mantix-halo-fixes-v1-3-1ebc9b195a34@puri.sm>
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
In-Reply-To: <20260105-mantix-halo-fixes-v1-3-1ebc9b195a34@puri.sm>
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

On 1/5/26 21:24, Sebastian Krzyszkowiak via B4 Relay wrote:
> From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> 
> According to the sequence from section 7.3.4 of FT8006P datasheet,
> TP_RSTN and RESX should be asserted after disabling AVDD and AVEE and
> together with VDDI.
> 
> Also, AVEE power down needs to happen at least 150ms after entering
> sleep mode.
> 
> Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
> ---
>   drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index bb5489e4d7a9..0e66ee7a727d 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -96,6 +96,9 @@ static int mantix_disable(struct drm_panel *panel)
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
>   
> +	/* T10 */
> +	mipi_dsi_msleep(&dsi_ctx, 150);
> +
>   	return dsi_ctx.accum_err;
>   }
>   
> @@ -103,15 +106,16 @@ static int mantix_unprepare(struct drm_panel *panel)
>   {
>   	struct mantix *ctx = panel_to_mantix(panel);
>   
> -	gpiod_set_value_cansleep(ctx->tp_rstn_gpio, 1);
> -	usleep_range(5000, 6000);
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -
>   	regulator_disable(ctx->avee);
>   	regulator_disable(ctx->avdd);
>   	/* T11 */
>   	usleep_range(5000, 6000);
>   	regulator_disable(ctx->vddi);
> +
> +	gpiod_set_value_cansleep(ctx->tp_rstn_gpio, 1);
> +	usleep_range(5000, 6000);
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
>   	/* T14 */
>   	msleep(50);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
