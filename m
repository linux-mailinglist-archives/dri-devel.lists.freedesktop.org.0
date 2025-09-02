Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B2B3F6BE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22AC10E397;
	Tue,  2 Sep 2025 07:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IoDxICu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A526410E233
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:33:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3cf991e8c82so2601458f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756798407; x=1757403207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=zzGEH5SzoJb0QREXsJ+codvGvPzyIv09C4e6DjWnFbs=;
 b=IoDxICu9jddZUp0jq2PBf7kgnPN5xUvPlumpUfTU4++k0Buzyp1VUJxQD8gHZeXMcm
 IK+lLZKQwqqX/51mfOSW+uKysVmWd8nenZC3/hpHW+eOq/LKbQD4wN8XXO9RHfjXN6DW
 zBhf5B98OIECEZI9jqWgOYabSZyt4mVzaPTzAFyWt7xZTJ1RznxA+/CSH6HtwFFf3uSb
 idTcCgqWwcMVDKe3GcAo3R5bpIAlhuxTygTNfOjy6LWf8sU3Zl96rMyNtztTs17ITcXm
 LTdPLdzaTjeA5ng5Fofq+m3+GhapW4BjHJAUW7sGoMAnS/OhRUyyKJiosuopRt/RzT4C
 Z8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756798407; x=1757403207;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zzGEH5SzoJb0QREXsJ+codvGvPzyIv09C4e6DjWnFbs=;
 b=ZfEGzEfomO0gnYhfovEK90tqthu2R679x1JboL2owJ0h8KNDvOPc377ZeACrx6zvnc
 g6vhS4H45g79Y7j1FEzv/RxPQxjgRGFDv+zpgnmgaBorSeq4FHMFQVql/sAONZrnn3G/
 kq5uLo8R2IkoKwiOPPEZWoChWjIn6xslkAxFSUL3+k0HTTTpaVd7V69ehqCn5DDpawiz
 h0HJ69xqtFr4IJEbMb7RfUlJ4z8C7Z4DnOdInHWEjhv0ABhsLJV/agzJ64pYpBruwNzn
 fCNFnUGWEFRKMWDYyk9kk4KbywACz62mjx1GXmUE/FWjRMlEuX1Pl6A+529A8y3HqDKS
 LBNg==
X-Gm-Message-State: AOJu0YzduZO+0LqbWmw9E3Bwo61sQ3CtxiA+aoH9I3P9HqypytQZzjdw
 zYfC4IL0rZIaEzCpZJu5IfrEcM0GCGySJUcV8KvhHqiYb3XiiiW5fkj3RHYtwxKZjrs=
X-Gm-Gg: ASbGncvph9An4wO5qDM5CFxLqIPmwgi9sQ2oNhVksP1ZeelGDapbfTMKwobL8nOfUCK
 1wRuTW4oJm0ULJuasyk1acTLd/NNvWrZ+aBQaOHdg518zKNgOVjnWaou0MGZ22HY6hZ/wzFqnow
 jFYV4AmNFHDyXxhmaLx4vO/GXpBvZ82u/JKMs9pPvhNeCQ7A9IjuKUMXJB47edAC2/9klhfQOpc
 BDx77yCaFYtlHrE03MpqFDJKBNtR4E3VKkSF32qK9BApUVoufM8bpC39hgBN+zrdKguurmK/PCY
 jv6+XiJE8gTaUfmQ+FeuzFXnDw2ld6VtKGgKS7kDe12rlaO+2JkSDTdO244tF7KD15xo0ZhbCgN
 uq8H6Byd1Ua4UxeMd5I3paZ/PmS+tmVC5Sz5oj+38XjycxX0uqznBo41RCpUfoJ+lpB0Ss5ASYj
 naZiQmjWgJGg==
X-Google-Smtp-Source: AGHT+IFE/+Dwxh2SBZShvvP5BRxfoJkpvnPruwR5LDCLB7pxR9NVHiJHNxUuG89GACIWOjRNGeP2PA==
X-Received: by 2002:a05:6000:430a:b0:3d7:4e2d:1e41 with SMTP id
 ffacd0b85a97d-3d74e2d22efmr3577647f8f.40.1756798406910; 
 Tue, 02 Sep 2025 00:33:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939?
 ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf34491a7fsm18044897f8f.57.2025.09.02.00.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 00:33:26 -0700 (PDT)
Message-ID: <3c8571cc-ab41-4231-9950-45d3e207927e@linaro.org>
Date: Tue, 2 Sep 2025 09:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: visionox-rm69299: Don't clear all mode
 flags
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20250901-shift6mq-panel-v1-0-444b4abbfaea@sigxcpu.org>
 <20250901-shift6mq-panel-v1-2-444b4abbfaea@sigxcpu.org>
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
In-Reply-To: <20250901-shift6mq-panel-v1-2-444b4abbfaea@sigxcpu.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 01/09/2025 16:22, Guido Günther wrote:
> Don't clear all mode flags. We only want to maek sure we use HS mode
> during unprepare.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>   drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> index e65697ce6f51c7d64b786da18cf44b16de5d6919..2216d38366ea37368d15480f9d8a8ccbfe77ba3b 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -192,7 +192,7 @@ static int visionox_rm69299_unprepare(struct drm_panel *panel)
>   	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
>   	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>   
> -	ctx->dsi->mode_flags = 0;
> +	ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   
>   	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
