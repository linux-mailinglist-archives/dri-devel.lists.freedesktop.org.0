Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A3847B7C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC4110E84A;
	Fri,  2 Feb 2024 21:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rZspSZvd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC6210E84A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:25:37 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40f033c2e30so22246485e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 13:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706909136; x=1707513936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=G2l1vKjEO69fnmNEf9Uo/eu3DjX9aySgEHPSFlO9MDc=;
 b=rZspSZvdY1OlXa3zN8pw6VnC0OvkIwYTTWvxMRPr1/1JQCJmpwbHdKNGLs7zZx+IEa
 UZeI9L83fITDwgJ7NkBLGkKtq+XcUbirXhbm5OnPmtZ8854mf5v9YmkdU0DF6k1sT+FK
 8iYNDivmGIripPdn6Xb6p4CvzDh5eJR8u3Nd2VPtCD14nNRRTmFu+879yW6C9JZ3ItGg
 Kuc/NJf5IpmwFTbU6Dl5tayZsDVBDrN1i8UVAuTMcxyhDgF4WgwbG+pzD9n7T8afwpGi
 BQM0PUt5TN8MHxZ9KnA1eTUhOShmLb2QJbHtBrkDp4zs6/9zyHexI1G5emweRGLQ3iJW
 Weqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706909136; x=1707513936;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=G2l1vKjEO69fnmNEf9Uo/eu3DjX9aySgEHPSFlO9MDc=;
 b=c226h8tNZFOCNLsxbfRtYaU222oGyAKItKgUXuka8TdKxB7S08pTtkTzZyHg9yj9AW
 AXJwkUxFZQhCrij0vpAzU9dRZDVgWjtLOJNh4q7ifsOsnCpDOpAKhjah+fPbdi9fAHQ2
 4+u0FuK/XbkwbHuvQ/4GD7JJT8mZGLPA2yAVxyee9gJ4oJ7H2NeYQjEodqJZSv9lCAL5
 9kais39/9hBkigDh/Pfj/aN48uXVuYhDNlgB/vUeYU7Z49PnIlzyez89FHL69X/mAKWC
 MzA+ra6CU3sO09+gyhXtMvO5x4NOh5z7RDnUTVgI20RW5s9KXZoFFazpXIhZ1sKaC7yz
 6Z6w==
X-Gm-Message-State: AOJu0YzpKR8HSQUPpTBf3VF2AtDgc9R9/7iOnUI/diZgEkKHe7q8QPeI
 b6ivf9uDueE1iuzHkhEx5cE/Eg+H7cRWD6o5/jCwTOCxzgrgX0ElkjGum7yw/hw=
X-Google-Smtp-Source: AGHT+IHEBZOZxowXtpo/c/Xaah4wsH4tucEmfywHPsgUII4iIa2gexhTWOs4OV5G/fhXTNN4tzj/VA==
X-Received: by 2002:a05:600c:5124:b0:40e:c564:a9ea with SMTP id
 o36-20020a05600c512400b0040ec564a9eamr2588613wms.20.1706909136202; 
 Fri, 02 Feb 2024 13:25:36 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXk4gqCnDtl8MrBOQdVLHv4VmoDrdjiyhT9ApAAwqJHleblyFeGul2tpBUBcfRe988Jb+yJ3MpSACYV8IO2psd7EOAszjGwNK3aBQAU0EPlPeFBO0RpJ1kNrfT9gnUFKhWNZ7XQWSiF8i5lkQXLumJzXqAyQIOxyxqV2iizlpbpO05YWb5osenx8rheBDdytKvk+XocAZo/4srAkKHo3cn+q7dsypD1RfZX3wuFSlg9bA6LfnY1Y5xXJFxuhDHtjVz6sc8tXhMm4vAJ8vh+7DAQMyV1cO1M1Y7OmvDTp7AArwkvUT5/tpwxUwMbkjLnDALcWoSSBbKjbgo3NxbKH2pOQ4KtcNC56YorTgvCLn+S02cI/g==
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 fa18-20020a05600c519200b0040f22171921sm976140wmb.3.2024.02.02.13.25.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 13:25:35 -0800 (PST)
Message-ID: <4af20f9b-6e08-4646-a659-c02234bedb29@linaro.org>
Date: Fri, 2 Feb 2024 22:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: visionox-vtdr6130: Set prepare_prev_first
 flag
Content-Language: en-US, fr
To: Jessica Zhang <quic_jesszhan@quicinc.com>, quic_abhinavk@quicinc.com
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 quic_parellan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240201-visionox-vtdr-prev-first-v2-1-32db52867624@quicinc.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240201-visionox-vtdr-prev-first-v2-1-32db52867624@quicinc.com>
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

On 02/02/2024 01:10, Jessica Zhang wrote:
> The DSI host must be enabled for the panel to be initialized in
> prepare(). Set the prepare_prev_first flag to guarantee this.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Sam Ravnborg <sam@ravnborg.org>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Jessica Zhang <quic_jesszhan@quicinc.com>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: quic_abhinavk@quicinc.com
> Cc: quic_parellan@quicinc.com
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> 
> Changes in v2:
> - Corrected commit message to mention that DCS on commands are sent during
>    prepare() instead of probe()
> - Dropped Fixes tag
> - Rebased onto tip of linux-next
> - Link to v1: https://lore.kernel.org/r/20230725-visionox-vtdr-prev-first-v1-1-3bc44cec7dc6@quicinc.com
> ---
>   drivers/gpu/drm/panel/panel-visionox-vtdr6130.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> index a23407b9f6fb6..540099253e1bd 100644
> --- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> +++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
> @@ -287,6 +287,7 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
>   			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
> +	ctx->panel.prepare_prev_first = true;
>   
>   	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
>   		       DRM_MODE_CONNECTOR_DSI);
> 
> ---
> base-commit: 51b70ff55ed88edd19b080a524063446bcc34b62
> change-id: 20230717-visionox-vtdr-prev-first-e00ae02eec9f
> 
> Best regards,

Thx for resending, it's time to merge those.

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
