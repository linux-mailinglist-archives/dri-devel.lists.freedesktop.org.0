Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2F9A60CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 11:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC0110E470;
	Mon, 21 Oct 2024 09:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wM8RjER8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534DD10E470
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 09:56:19 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4315baa51d8so41486345e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729504578; x=1730109378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=cgpfJEhAzWrKHn6Saq9h1Ti1FMhjMlcxODJjL9mRHOo=;
 b=wM8RjER8+ENiOdRckqKZ2LjYckbGiOgxvJRFKQ7RyECME1/MFKwxl8bSpgd27B6wMv
 /3HwAxVsAwsamzhu+zYfTfKUAuyr1mBW/QqVC5lZxEkoMokJ7lkWqSfi4Fv/szzlru5S
 U8SVNSzPAlSH90LfG7JoaSSn/hti6p/odmm/4SvjDLCjromg1CwIHaBSdOIdIYAtTqCd
 BO7bo+swureIcfSTGPFE44DItJUPn9y1YuZUW8JCTrV1E3A0UcUKilM8WcwysEOovXnE
 M9npPmrwFeKG6H30C5hl1HGrXrMTmZM09STb5mBYpaZRWgpWAKGk203rnRgGhTu+ZTnl
 GvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729504578; x=1730109378;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgpfJEhAzWrKHn6Saq9h1Ti1FMhjMlcxODJjL9mRHOo=;
 b=Ebljf4oRKLqi/aOQXHYHWOsuOK4w4ktEkqgIGe4G5U0wsy5iaoRGU4KkUG8Xqvp0P2
 2hBffXC7bGP/n9llGJeK66MghothyxG8XcerQI4Hyig9EvBD7bvLRN0hFub5Z2KJAN4/
 pSOXMXK31xfNYWYmm0nySuUc5kKjj9MBWfFYzXeG1BM1DJkbS7q4mNyMftzJ9o8r/wfP
 7zvM2CFBBSNPBVUzZS/y+tlNGJJNnIGPPZyGQngN+0rGQD9BxfO78+eSpe+cJZh+hFmR
 0iHEIqe2+Jcl9YmBWA3pl+In8c3dBWfbVBD9RX9hSfYJZpmpl97wqayS7idmF+hhKkoL
 Bfyg==
X-Gm-Message-State: AOJu0YzVTazbcsgljvWbUAGdc1OGR6wsD+AKwvLhz2LrexpFMotDuCCR
 Wp9hS8+4MY8U2O8yqWByPZVxP9J73GNK6Z6/FVhGCi32lktjxSQWPbgWkRFQWLg=
X-Google-Smtp-Source: AGHT+IGIDar+yxZvJ1r7QYBzcyotgUYIxhD9vF51nxf+UIHlreyBhCllflKvNHMM3hS9BUwcrAFqGQ==
X-Received: by 2002:a05:600c:3b89:b0:42c:a574:6360 with SMTP id
 5b1f17b1804b1-4316168f6f8mr92889655e9.29.1729504577692; 
 Mon, 21 Oct 2024 02:56:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97?
 ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f570d86sm52686215e9.8.2024.10.21.02.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 02:56:17 -0700 (PDT)
Message-ID: <f9c2a209-1234-4663-b37a-9e0dabc448da@linaro.org>
Date: Mon, 21 Oct 2024 11:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/6] drm/atomic: add interlaced and ycbcr_420 flags to
 connector's state dump
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
 <20241019-bridge-yuv420-v1-2-d74efac9e4e6@linaro.org>
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
In-Reply-To: <20241019-bridge-yuv420-v1-2-d74efac9e4e6@linaro.org>
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

On 18/10/2024 23:49, Dmitry Baryshkov wrote:
> Although the interlace_allowed and ycbcr_420_allowed flags are a part of
> the struct drm_connector rather than struct drm_connector_state, still
> include them into state dump in order to ease debugging of the setup
> issues.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_atomic.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 0fc99da93afe..9ea2611770f4 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1132,6 +1132,8 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
>   	drm_printf(p, "connector[%u]: %s\n", connector->base.id, connector->name);
>   	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
>   	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
> +	drm_printf(p, "\tinterlace_allowed=%d\n", connector->interlace_allowed);
> +	drm_printf(p, "\tycbcr_420_allowed=%d\n", connector->ycbcr_420_allowed);
>   	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
>   	drm_printf(p, "\tcolorspace=%s\n", drm_get_colorspace_name(state->colorspace));
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
