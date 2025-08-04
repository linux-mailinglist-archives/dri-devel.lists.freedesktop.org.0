Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F191B1A62F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 17:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1805A10E0FD;
	Mon,  4 Aug 2025 15:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w2jn3TWY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5584110E0FD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 15:38:53 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so5479665e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754321932; x=1754926732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=6BPn3AbWuSxRwJ/6Re7HP5uMU+47zMuqiT1XZS2qoc4=;
 b=w2jn3TWYPPqqCv1AbouDjmuoAoDEwPcy9+7DVM9yOwrVlsN+ot5/oF+AAWJavRwsqE
 XGrnVy3Spdpo5sLolplElnHvja4KCKvEU7oJ8er4f2ZG4YFSTIilEvQtG5rPggrh5uBj
 ZQAHEBN8pgQjJs/9YN1E3sB6usDRevyBmcKJueoBZ/+y9yzBNsgnCv+0e1gIalVV4JJ6
 R9TFv8obxfrZY8lEylL+VM/kQpT5sYHcpRtIbQqCxLIeKpWB/f2+OwsOQqcs6mPKL+51
 URXj517nt4utoxnHnQgXLYyV1Fe42qEAA+gL0YTVyRnccQgrZ0nR311qVSDuWO3PcQ04
 zP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754321932; x=1754926732;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6BPn3AbWuSxRwJ/6Re7HP5uMU+47zMuqiT1XZS2qoc4=;
 b=IqoqRIsmIuW6Bu0M7hT8yztGsW5ymaQC8vnVQzGLzQuqsAZDuwf97FJPXrWuLDEdZ/
 0Sw1yuTTWZIVTVtNm+twTdnkiRRn1gKTIdBT0wf439jistz67Ma4tCm5eGBsPGghcGvM
 0Yp5wFCDbeA3yQSHlavRw+Zsd50l/TcwoHnxqZV+M6hNO5QBHuNH+6HUFg9gtkK9uDOt
 oWpqox/oF+ihAc5hblpdp1mKID4NLbd5z+2EOwRCyvIADZ/ZR3HvJIP20dJYCkb416mt
 GwjIHi/6OKQI9QlXSFRpQBbVjYY/Evr3Ekkqyl/6tF0QCppSvFuzF019bkb3d7jyoauD
 7fqQ==
X-Gm-Message-State: AOJu0YyZGq7iQBqyX6znTSkXq4RDc3Cl8+AYtPSgNB3yBz7pKi1fXbeI
 Lge40rsZxPjjYcQLxT0S8ZNXhOlR2i3HlggD4pIgCh3rqh5wODm8IT+6QeNxrQvIUOM=
X-Gm-Gg: ASbGnctaZ+N+SCCDkOMAb9U2DpC/xdCv3XOUzOCwcMe/dXV3xplnGd/SFHTSm8GuW1o
 dEyCjlfwFt2Fnv47K3PAGCI4MUDGcg451qjtWCKgoTpaKB7r//2k3GVcebTonxQy7kwgb/eh+/g
 bctkuEYXuRtii0bft4W/YQz8rPdo2jzQ0ztS7joEPCmLQDm711xAC6SSwgfbep2CAPsdZ9Lk2Iw
 FqO5Zel9fNenNe4/jFDTlUgI+XYKHzwN5reuO9HDiylxKKxoLfQ1G1XtU/2YkfDBb/GOerrsLjQ
 7qQGE1wRhuTguPcpy01CiPOvjx0im9Rpp2yK2aklOSlzuY/UPcLfcmHkq0gh1el6RvckuDlcsdl
 Zc/b85T/+gRDrTh/OFFIId39HPn9YdxiIiVTQvHE070pq0k/rxQPYjaYxCe4jfVJ9XefWFNnNNw
 4=
X-Google-Smtp-Source: AGHT+IGYTWGxkQKie5QO6F0JNgsVYGtEI2yYnTV43Whp5cJoUxF4Ip21+CPLjlvybn1jEjpvZY+ucA==
X-Received: by 2002:a05:600c:3b1a:b0:459:d3ce:2cea with SMTP id
 5b1f17b1804b1-459d3ce2f76mr49030625e9.6.1754321931765; 
 Mon, 04 Aug 2025 08:38:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3030:f63e:fedd:700f?
 ([2a01:e0a:3d9:2080:3030:f63e:fedd:700f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458ba5ef18asm96602345e9.12.2025.08.04.08.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 08:38:51 -0700 (PDT)
Message-ID: <db6ae287-88f8-4f05-97ad-458930f9f429@linaro.org>
Date: Mon, 4 Aug 2025 17:38:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: document HDMI CEC callbacks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com>
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
In-Reply-To: <20250801-drm-hdmi-cec-docs-v1-1-be63e6008d0e@oss.qualcomm.com>
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

On 01/08/2025 12:46, Dmitry Baryshkov wrote:
> Provide documentation for the drm_bridge callbacks related to the
> DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag.
> 
> Fixes: a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/r/20250611140933.1429a1b8@canb.auug.org.au
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/drm/drm_bridge.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..b0e6653ee42ecc088f420a9a32cf3b0428737a4a 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -866,13 +866,61 @@ struct drm_bridge_funcs {
>   				      struct drm_connector *connector,
>   				      bool enable, int direction);
>   
> +	/**
> +	 * @hdmi_cec_init:
> +	 *
> +	 * Initialize CEC part of the bridge.
> +	 *
> +	 * This callback is optional, it can be implemented by bridges that
> +	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
> +	 * &drm_bridge->ops.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise
> +	 */
>   	int (*hdmi_cec_init)(struct drm_bridge *bridge,
>   			     struct drm_connector *connector);
>   
> +	/**
> +	 * @hdmi_cec_enable:
> +	 *
> +	 * Enable or disable the CEC adapter inside the bridge.
> +	 *
> +	 * This callback is optional, it can be implemented by bridges that
> +	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
> +	 * &drm_bridge->ops.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise
> +	 */
>   	int (*hdmi_cec_enable)(struct drm_bridge *bridge, bool enable);
>   
> +	/**
> +	 * @hdmi_cec_log_addr:
> +	 *
> +	 * Set the logical address of the CEC adapter inside the bridge.
> +	 *
> +	 * This callback is optional, it can be implemented by bridges that
> +	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
> +	 * &drm_bridge->ops.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise
> +	 */
>   	int (*hdmi_cec_log_addr)(struct drm_bridge *bridge, u8 logical_addr);
>   
> +	/**
> +	 * @hdmi_cec_transmit:
> +	 *
> +	 * Transmit the message using the CEC adapter inside the bridge.
> +	 *
> +	 * This callback is optional, it can be implemented by bridges that
> +	 * set the @DRM_BRIDGE_OP_HDMI_CEC_ADAPTER flag in their
> +	 * &drm_bridge->ops.
> +	 *
> +	 * Returns:
> +	 * 0 on success, a negative error code otherwise
> +	 */
>   	int (*hdmi_cec_transmit)(struct drm_bridge *bridge, u8 attempts,
>   				 u32 signal_free_time, struct cec_msg *msg);
>   
> 
> ---
> base-commit: a933d3dc1968fcfb0ab72879ec304b1971ed1b9a
> change-id: 20250801-drm-hdmi-cec-docs-541ee6afa5fa
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
