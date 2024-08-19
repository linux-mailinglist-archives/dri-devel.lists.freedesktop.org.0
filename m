Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB2956F8A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 18:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE26110E2F2;
	Mon, 19 Aug 2024 16:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TIk5XspI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7573210E2F2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 16:01:08 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4280bbdad3dso35001235e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724083267; x=1724688067; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=9iRjlp00iCp4eJzFoj+uWGCC+areppjo1rj2Se/duNI=;
 b=TIk5XspIegNovYVbHqPAJ8UrdFS11u43I4ljqDYcVuuVcctrGGWmXmL5ihmzKwFseV
 PZ6LfAYE3FmuhD0mzSF/hw3xSvS/iBUz5F/MWkKxczt7SWghT6J55zPiSDl4nqiH7pj2
 /NPRs9XEnnUPCCW2A0e0PIGzhbbBjW4KtGof6/FIXGziiEgB0csC7NOpKMBjBuofBWah
 UR/PeW5Z9lDrhD6OvOJ5d1ULOujsK6/zJm9T9azkXXDw50VqxXg8x7kibJPU4LjzrBda
 GPZ2RWXJtPuQDJDEy/Jn/3Mm2XJfTWPj851Bk6v+Ugzee/WOZqPRm78zynN1fxkHLqUo
 AGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724083267; x=1724688067;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=9iRjlp00iCp4eJzFoj+uWGCC+areppjo1rj2Se/duNI=;
 b=iDy3na6J9+eL9RnX8yQMuI1SH9ptcroFjQxT1hHR0zOsqiC7fgfWth5KSfqWu1VdrX
 FayIGVtizCHjm9spKFl0ne5ceASs1LijOnJIXQZI1qFr/bW4Ygvc5pc3Cp/S4W88ADE0
 Mg7lEFzFZwgDuM294BG6BE14rF4W/Sfe+ybjbpxr9D/BtrK9x0NeuuCc4WbTvTVjDEP4
 tws6HLnDr0MjJIzZTOmgn9qHk49aiz3qyvmNuHmH6IMND+GoTW51i45bSPKbr1MWY5a8
 rR5wrwlsQWKzvmAEX9PZO6fRVfTSqVbqOtO0CJKfbs9edlu/hWiQPEdCe+hUu9wPOFH+
 V24g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtSUjRxHQ2khSqXcGUPTvEY3KsyhIdoyYInvFRuD5MnT2mNBnljpeajxqmLkGCDwVq9f2WGQ4OmuRZ2vvQBBzp8wMlQp1xnH+EPr+68NXB
X-Gm-Message-State: AOJu0YxkD+UQczgBzXMb6X0Pa9tDF98B4S5hGNjcXqjq5UBCc9N+mAc6
 ZoxWMziSoP7sq0vLQmXuIyzZjNP7dfcNqLoqHhd/V/dVj9skPi3867n7Ibi2ASA=
X-Google-Smtp-Source: AGHT+IFQHk9339MOhAinx0EFFT0RpxB9bT2Nbcfznb0vBd9V3H5R3jrO3PenSBucHzSqEgkFDYysew==
X-Received: by 2002:a05:600c:45c9:b0:426:6a53:e54f with SMTP id
 5b1f17b1804b1-429ed7db8fbmr68478305e9.33.1724083266226; 
 Mon, 19 Aug 2024 09:01:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f54e:4b0a:5175:5727?
 ([2a01:e0a:982:cbb0:f54e:4b0a:5175:5727])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed648ea4sm114237485e9.1.2024.08.19.09.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 09:01:05 -0700 (PDT)
Message-ID: <fa8e151f-a8c7-44fe-a8bf-949d5900112d@linaro.org>
Date: Mon, 19 Aug 2024 18:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/9] drm/meson: hdmi: move encoder settings out of phy
 driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-2-jbrunet@baylibre.com>
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
In-Reply-To: <20240730125023.710237-2-jbrunet@baylibre.com>
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

On 30/07/2024 14:50, Jerome Brunet wrote:
> This relocates register pokes of the HDMI VPU encoder out of the
> HDMI phy driver. As far as HDMI is concerned, the sequence in which
> the setup is done remains mostly the same.
> 
> This was tested with modetest, cycling through the following resolutions:
>    #0 3840x2160 60.00
>    #1 3840x2160 59.94
>    #2 3840x2160 50.00
>    #3 3840x2160 30.00
>    #4 3840x2160 29.97
>    #5 3840x2160 25.00
>    #6 3840x2160 24.00
>    #7 3840x2160 23.98
>    #8 1920x1080 60.00
>    #9 1920x1080 60.00
>    #10 1920x1080 59.94
>    #11 1920x1080i 30.00
>    #12 1920x1080i 29.97
>    #13 1920x1080 50.00
>    #14 1920x1080i 25.00
>    #15 1920x1080 30.00
>    #16 1920x1080 29.97
>    #17 1920x1080 25.00
>    #18 1920x1080 24.00
>    #19 1920x1080 23.98
>    #20 1280x1024 60.02
>    #21 1152x864 59.97
>    #22 1280x720 60.00
>    #23 1280x720 59.94
>    #24 1280x720 50.00
>    #25 1024x768 60.00
>    #26 800x600 60.32
>    #27 720x576 50.00
>    #28 720x480 59.94
> 
> No regression to report.
> 
> This is part of an effort to clean up Amlogic HDMI related drivers which
> should eventually allow to stop using the component API and HHI syscon.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c      | 38 ----------------------
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 16 +++++++++
>   2 files changed, 16 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5565f7777529..bcf4f83582f2 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -115,12 +115,6 @@
>   
>   static DEFINE_SPINLOCK(reg_lock);
>   
> -enum meson_venc_source {
> -	MESON_VENC_SOURCE_NONE = 0,
> -	MESON_VENC_SOURCE_ENCI = 1,
> -	MESON_VENC_SOURCE_ENCP = 2,
> -};
> -
>   struct meson_dw_hdmi;
>   
>   struct meson_dw_hdmi_data {
> @@ -376,8 +370,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
>   	bool is_hdmi2_sink = display->hdmi.scdc.supported;
>   	struct meson_drm *priv = dw_hdmi->priv;
> -	unsigned int wr_clk =
> -		readl_relaxed(priv->io_base + _REG(VPU_HDMI_SETTING));
>   	bool mode_is_420 = false;
>   
>   	DRM_DEBUG_DRIVER("\"%s\" div%d\n", mode->name,
> @@ -421,36 +413,6 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   	meson_dw_hdmi_phy_reset(dw_hdmi);
>   	meson_dw_hdmi_phy_reset(dw_hdmi);
>   
> -	/* Temporary Disable VENC video stream */
> -	if (priv->venc.hdmi_use_enci)
> -		writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
> -	else
> -		writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));
> -
> -	/* Temporary Disable HDMI video stream to HDMI-TX */
> -	writel_bits_relaxed(0x3, 0,
> -			    priv->io_base + _REG(VPU_HDMI_SETTING));
> -	writel_bits_relaxed(0xf << 8, 0,
> -			    priv->io_base + _REG(VPU_HDMI_SETTING));
> -
> -	/* Re-Enable VENC video stream */
> -	if (priv->venc.hdmi_use_enci)
> -		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
> -	else
> -		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
> -
> -	/* Push back HDMI clock settings */
> -	writel_bits_relaxed(0xf << 8, wr_clk & (0xf << 8),
> -			    priv->io_base + _REG(VPU_HDMI_SETTING));
> -
> -	/* Enable and Select HDMI video source for HDMI-TX */
> -	if (priv->venc.hdmi_use_enci)
> -		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCI,
> -				    priv->io_base + _REG(VPU_HDMI_SETTING));
> -	else
> -		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCP,
> -				    priv->io_base + _REG(VPU_HDMI_SETTING));
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index 0593a1cde906..1c3e3e5526eb 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -45,6 +45,12 @@ struct meson_encoder_hdmi {
>   	struct cec_notifier *cec_notifier;
>   };
>   
> +enum meson_venc_source {
> +	MESON_VENC_SOURCE_NONE = 0,
> +	MESON_VENC_SOURCE_ENCI = 1,
> +	MESON_VENC_SOURCE_ENCP = 2,
> +};
> +
>   #define bridge_to_meson_encoder_hdmi(x) \
>   	container_of(x, struct meson_encoder_hdmi, bridge)
>   
> @@ -247,6 +253,14 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
>   		writel_relaxed(1, priv->io_base + _REG(ENCI_VIDEO_EN));
>   	else
>   		writel_relaxed(1, priv->io_base + _REG(ENCP_VIDEO_EN));
> +
> +	/* Enable and Select HDMI video source for HDMI-TX */
> +	if (priv->venc.hdmi_use_enci)
> +		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCI,
> +				    priv->io_base + _REG(VPU_HDMI_SETTING));
> +	else
> +		writel_bits_relaxed(0x3, MESON_VENC_SOURCE_ENCP,
> +				    priv->io_base + _REG(VPU_HDMI_SETTING));
>   }
>   
>   static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
> @@ -257,6 +271,8 @@ static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
>   
>   	writel_bits_relaxed(0x3, 0,
>   			    priv->io_base + _REG(VPU_HDMI_SETTING));
> +	writel_bits_relaxed(0xf << 8, 0,
> +			    priv->io_base + _REG(VPU_HDMI_SETTING));
>   
>   	writel_relaxed(0, priv->io_base + _REG(ENCI_VIDEO_EN));
>   	writel_relaxed(0, priv->io_base + _REG(ENCP_VIDEO_EN));

Nice usage of the split bridge architecture!
Now we must make sure the atomic enable order doesn't change...

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
