Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18906859E85
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 09:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2797910E19E;
	Mon, 19 Feb 2024 08:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ow8qz/vX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EDE10E195
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 08:38:24 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41241f64c6bso20432995e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 00:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708331902; x=1708936702; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=j/gqg7nuIRKFnzJZlko92QpBtCQ0yUQMkBiOuejqskw=;
 b=Ow8qz/vXMgFw4Iw4+caqN+8EviaqJpMbuZllDAc5BOztoah08XOnBPw1Jz8tVMhgBp
 WdgadDGSuwc3uVBZY13Z9u8p1VMg3cj50HJKLAT5kLcM2nQPzHRpmv5F5nVvujIdAqD9
 QF4YR8SylYPms4oUvBEQBXEQVAc89OyRWt2ek9N8sRrblOK0l7nEE9a7mLiB+hCht55a
 4Zvy5kuCg+UzhJuL8+/KWwk2QbJfq1/Wc5+B52sqy0zjs7MhHM0e6L6O42TgvlIEQfgq
 kzCVb+1EoiRrlKIELWdvfjePXed6BxXJyIwSXA/oRRbEtPF7hxZ9VwgZJtJYCG/hr3n5
 w4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708331902; x=1708936702;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j/gqg7nuIRKFnzJZlko92QpBtCQ0yUQMkBiOuejqskw=;
 b=bKaPy8ZNvkxtywJ73LVSYEZGHX5R4Uz+FbaJOEsWsFBebb3ohY8p14CeeT8vpWF62k
 U3n8PoFozuRuOiBe3iBvUUWe2uTcBkBgP0bcR5KwNwXa++EDS78EJiOtgRPiG77cEEdW
 83940nunueedCYs5y9eNVHSQPNiHlwJvAcTzBiZMZ+AvCYZaiP1DSkXGoYChofLHYTTC
 LfcuMDo1pWH1+YgdqpxdAD3HE7BSucKvJC9F84UYmaMYYHdZw1zGgsgxgIHTXOQeVHe2
 N/SgAf1cGmTNIZ+oKi/Q4YGbcNNjAElr6oA+o3CaHZ+jNC/wzDxVFlZpk+QO1UXe5r2y
 sXpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGRXxTm2gIGRzXoq72qmDw2PS9MfU+wdoDqDoIxhUWpi7PngsUz5boKVFSrT1w6Lu4hTRUKE97hcpcNiHeSH9QqouMajrNyvFgzU4b9DIn
X-Gm-Message-State: AOJu0YxeNiYIPZmMAn31MpTIy0PwmMXrIBMq8ym9qRTl2KAJBrN+skft
 hP7E99zde15YxoHno/1fhzHC4bzpMmgf57/lm4Zrd/yH/6ytFRMlcSWA3CNYws0=
X-Google-Smtp-Source: AGHT+IEmvmfGnvNyZqQ5o1pPesUs/3Yee3WGXYqu8K0vph/uPsQUfTBZt6lBufosP4qiB2mUH+FyUw==
X-Received: by 2002:a05:600c:4a29:b0:412:f24:5732 with SMTP id
 c41-20020a05600c4a2900b004120f245732mr9022333wmp.37.1708331902490; 
 Mon, 19 Feb 2024 00:38:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f?
 ([2a01:e0a:982:cbb0:9470:c6e0:c87a:fa9f])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a7bc4d3000000b004126101915esm4868608wmk.4.2024.02.19.00.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:38:22 -0800 (PST)
Message-ID: <f2cde221-a779-486a-9073-44228c320d8a@linaro.org>
Date: Mon, 19 Feb 2024 09:38:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: Don't remove bridges which are created by
 other drivers
Content-Language: en-US, fr
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com, adrian.larumbe@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Steve Morvai <stevemorvai@hotmail.com>
References: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
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
In-Reply-To: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
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

On 15/02/2024 23:04, Martin Blumenstingl wrote:
> Stop calling drm_bridge_remove() for bridges allocated/managed by other
> drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
> drm_bridge_remove() unregisters the bridge so it cannot be used
> anymore. Doing so for bridges we don't own can lead to the video
> pipeline not being able to come up after -EPROBE_DEFER of the VPU
> because we're unregistering a bridge that's managed by another driver.
> The other driver doesn't know that we have unregistered it's bridge
> and on subsequent .probe() we're not able to find those bridges anymore
> (since nobody re-creates them).
> 
> This fixes probe errors on Meson8b boards with the CVBS outputs enabled.
> 
> Fixes: 09847723c12f ("drm/meson: remove drm bridges at aggregate driver unbind time")
> Fixes: 42dcf15f901c ("drm/meson: add DSI encoder")
> Cc: stable@vger.kernel.org
> Reported-by: Steve Morvai <stevemorvai@hotmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This issue was reported by Steve off-list to me (thanks again for your
> patience and sorry it took so long)!
> The Meson8b VPU driver is not upstream, but the problematic code is.
> Meaning: This issue can also appear on SoCs which are supported
> upstream if the meson DRM driver probe has to be re-tried (with
> -EPROBE_DEFER). That's why I chose to Cc the stable list.
> 
> 
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c | 1 -
>   drivers/gpu/drm/meson/meson_encoder_dsi.c  | 1 -
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 1 -
>   3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_encoder_cvbs.c b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> index 3f73b211fa8e..3407450435e2 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_cvbs.c
> @@ -294,6 +294,5 @@ void meson_encoder_cvbs_remove(struct meson_drm *priv)
>   	if (priv->encoders[MESON_ENC_CVBS]) {
>   		meson_encoder_cvbs = priv->encoders[MESON_ENC_CVBS];
>   		drm_bridge_remove(&meson_encoder_cvbs->bridge);
> -		drm_bridge_remove(meson_encoder_cvbs->next_bridge);
>   	}
>   }
> diff --git a/drivers/gpu/drm/meson/meson_encoder_dsi.c b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> index 3f93c70488ca..311b91630fbe 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_dsi.c
> @@ -168,6 +168,5 @@ void meson_encoder_dsi_remove(struct meson_drm *priv)
>   	if (priv->encoders[MESON_ENC_DSI]) {
>   		meson_encoder_dsi = priv->encoders[MESON_ENC_DSI];
>   		drm_bridge_remove(&meson_encoder_dsi->bridge);
> -		drm_bridge_remove(meson_encoder_dsi->next_bridge);
>   	}
>   }
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 25ea76558690..c4686568c9ca 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -474,6 +474,5 @@ void meson_encoder_hdmi_remove(struct meson_drm *priv)
>   	if (priv->encoders[MESON_ENC_HDMI]) {
>   		meson_encoder_hdmi = priv->encoders[MESON_ENC_HDMI];
>   		drm_bridge_remove(&meson_encoder_hdmi->bridge);
> -		drm_bridge_remove(meson_encoder_hdmi->next_bridge);
>   	}
>   }

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks a lot for the patch!

Neil
