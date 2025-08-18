Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE90B29BA9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 10:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DC610E40B;
	Mon, 18 Aug 2025 08:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r1lhROsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E08810E413
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 08:08:15 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45a1b00f187so15942145e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 01:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755504494; x=1756109294; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=rUNGkpO4Bj6949FkP0Yja1jszmdmG380tow+zHeqATc=;
 b=r1lhROsldLrHyevU7FPkC9TqMNnPrN+UdALoyz99R7fsY1vtIlbyDO0JfAVxLyyGgQ
 b/roq5jo7pFstxFc1SX5i0TPV4j7UtP2vaucQ3/56XhEd5MpwzkIsUhvs5CcoaW2/O3l
 wrauZOUGpiEywMBxwICYce6ZblzzdqCeY5fIqua0H0OZAdlxRIirRi4xsVPIEqH56Pr7
 MFyGQ1PcMOFerHeurUh4f4XT+2MhoOVwVX/hOkHINUsrVtfD2ZJ8iHffBCuP7OwCQGxw
 8Wsq/ldzl18w+nXJPG3Qmfl0FNXI4+fDgwCQw+IkLzafR+T/BPwt/jhH7lrl0rw7P5Es
 qCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755504494; x=1756109294;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rUNGkpO4Bj6949FkP0Yja1jszmdmG380tow+zHeqATc=;
 b=Owixpw+s3PUQVOUnGCBMYrLBvretcuNfKRoEIWuq+oIbcB11WS0ROsTvf1S9I2ua3M
 7e/94QfSXUKFThHsA+rnvxbFzgLoac+k1HJymDjfZf0JhpdAQtH11eJaxpWYD05Onqpw
 VxyKnBoRtLQChxgebH51E+i7TfP/Lh4xdWHpXBsM4pw90s6lv6o4W3xLnUbd/Scmuww9
 eEa73CapOVA5/uDqlimHF93Jb/Uo+GRetnYZ0B3CVrmlgKeDBiZfvSvdzizmQEod/9H5
 EUeFYQ4u7cag5kmJJ8j+pJyRFITKgH9OfLsmL3EobHLae3V3+iARXvJRkjcHxM9qScot
 /M1w==
X-Gm-Message-State: AOJu0Yw+9z/cFSIDVzv6VD2lgBtGK1N9jIfUYw4ZWiM0eawRcA8Kwr1l
 /j8BZwl+ExKOm9K7vFppxyKqJt6xC5YDh7VCDh9kyQfmAZLXjRpA30xU5edgOuP9lmU=
X-Gm-Gg: ASbGncuH7tpqGejgrCn0X3O2hIsteI4nQhh7mUiBdnuWYwuOxV/c7zK8OYR4wG0kqeQ
 sSorjQP8vXCEz1Hc+VVoBldJQJuqr93TEBh6LQPNLDcdSEMj92USKFBfFvmTS+AMiGwvl1cAcqq
 5ajEFtOcgBXjlzQ6OXU/jaV52FSYMuhbCOmIcAtYtH0TD89dMxRODZb/ZfR45vUFPsAprcdue2f
 q0lZuwZ1IBsWzak4RnKrDm1ssYjD9R7Gca2v8QcOc10OjhH607nS8OK6S5I2rO+l0j751aKtFSj
 01/l7PKYnBhmKyQlVy0xduULlknCi2n1gPEFz2cZ7SgykhDY8J7g0yg704vDqaJwkOa6Y0JDdDR
 uWItj4UyzBazDbQhQZKeybMunpUovSchYcmh6BXBL5eKEFsugMU3eR4iT9madQO14HiSqCBl+
X-Google-Smtp-Source: AGHT+IHEM62e9pbBVitK2clt1VV7OlbcJpPegVTu73FKhD1duGOlewFnegIrBDPdbp9Z/MC7kDWGMA==
X-Received: by 2002:a05:600c:4e86:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-45a2183a7f1mr82250165e9.21.1755504493826; 
 Mon, 18 Aug 2025 01:08:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:70d:8646:e014:cc6e?
 ([2a01:e0a:3d9:2080:70d:8646:e014:cc6e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a221bbadfsm121465845e9.0.2025.08.18.01.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 01:08:12 -0700 (PDT)
Message-ID: <744209a8-7a7e-4909-b608-8bfc70a8727b@linaro.org>
Date: Mon, 18 Aug 2025 10:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 1/2] drm/bridge: add connector argument to
 .hpd_notify callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
 <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
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
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
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

On 03/08/2025 13:53, Dmitry Baryshkov wrote:
> Drivers might need to update DRM connector in the
> drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
> update EDID before setting ELD). Add corresponding argument to the
> callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
>   drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
>   drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
>   include/drm/drm_bridge.h                       | 1 +
>   6 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>   	/* Notify all bridges in the pipeline of hotplug events. */
>   	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
>   		if (bridge->funcs->hpd_notify)
> -			bridge->funcs->hpd_notify(bridge, status);
> +			bridge->funcs->hpd_notify(bridge, connector, status);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>   }
>   
>   static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
> +					  struct drm_connector *connector,
>   					  enum drm_connector_status status)
>   {
>   	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
>   }
>   
>   void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> -			  enum drm_connector_status status)
> +			      struct drm_connector *connector,
> +			      enum drm_connector_status status)
>   {
>   	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
>   	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
>   void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
>   void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> -			  enum drm_connector_status status);
> +			      struct drm_connector *connector,
> +			      enum drm_connector_status status);
>   
>   #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
>   }
>   
>   static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
> +				    struct drm_connector *connector,
>   				    enum drm_connector_status status)
>   {
>   	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -730,6 +730,7 @@ struct drm_bridge_funcs {
>   	 * controllers for HDMI bridges.
>   	 */
>   	void (*hpd_notify)(struct drm_bridge *bridge,
> +			   struct drm_connector *connector,
>   			   enum drm_connector_status status);
>   
>   	/**
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
